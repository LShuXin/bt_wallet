package com.lsx.bt_wallet.viewmodel;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;

import com.google.gson.Gson;

import io.reactivex.Single;
import com.lsx.bt_wallet.UpChainWalletApp;
import com.lsx.bt_wallet.domain.ETHWallet;
import com.lsx.bt_wallet.entity.NetworkInfo;
import com.lsx.bt_wallet.entity.Ticker;
import com.lsx.bt_wallet.entity.Token;
import com.lsx.bt_wallet.interact.FetchTokensInteract;
import com.lsx.bt_wallet.interact.FetchWalletInteract;
import com.lsx.bt_wallet.repository.EthereumNetworkRepository;
import com.lsx.bt_wallet.service.TickerService;
import com.lsx.bt_wallet.service.UpWalletTickerService;
import com.lsx.bt_wallet.utils.LogUtils;
import com.lsx.bt_wallet.utils.WalletDaoUtils;


// 
public class TokensViewModel extends BaseViewModel {
    private final MutableLiveData<NetworkInfo> defaultNetwork = new MutableLiveData<>();

    private final MutableLiveData<ETHWallet> defaultWallet = new MutableLiveData<>();


    private final MutableLiveData<Ticker> prices = new MutableLiveData<>();
    private final MutableLiveData<Token[]> tokens = new MutableLiveData<>();

    private final EthereumNetworkRepository ethereumNetworkRepository;
    private final FetchWalletInteract findDefaultWalletInteract;

    private final FetchTokensInteract fetchTokensInteract;
    private final TickerService tickerService;

    TokensViewModel(
            EthereumNetworkRepository ethereumNetworkRepository,
            FetchWalletInteract findDefaultWalletInteract,
            FetchTokensInteract fetchTokensInteract) {
        this.findDefaultWalletInteract = findDefaultWalletInteract;
        this.ethereumNetworkRepository  = ethereumNetworkRepository;
        this.fetchTokensInteract = fetchTokensInteract;


        tickerService = new UpWalletTickerService(UpChainWalletApp.okHttpClient(), new Gson());
    }

    public void prepare() {
        progress.postValue(true);

        defaultNetwork.postValue(ethereumNetworkRepository.getDefaultNetwork());
        disposable = findDefaultWalletInteract.findDefault()
                .subscribe(this::onDefaultWallet, this::onError);

    }

    public void updateDefaultWallet(final long walletId) {

        Single.fromCallable(() -> {
            return WalletDaoUtils.updateCurrent(walletId);
        }).subscribe(this::onDefaultWallet);

    }

    private void onDefaultWallet(ETHWallet wallet) {
        defaultWallet.setValue(wallet);
        fetchTokens();
    }

    public LiveData<NetworkInfo> defaultNetwork() {
        return defaultNetwork;
    }

    public LiveData<ETHWallet> defaultWallet() {
        return defaultWallet;
    }

    public LiveData<Token[]> tokens() {
        return tokens;
    }

    public MutableLiveData<Ticker> prices() {
        return prices;
    }

    public void fetchTokens() {
        progress.postValue(true);

        disposable = fetchTokensInteract
                .fetch(defaultWallet.getValue().address)
                .subscribe(this::onTokens, this::onError);
    }

    private void onTokens(Token[] tokens) {
        LogUtils.d("Tokens", "onTokens");
        progress.postValue(false);
        this.tokens.postValue(tokens);

        //  TODO： 是否出现重复调用
        for (Token token : tokens ) {
            if (token.balance!=null && !token.balance.equals("0")) {   // > 0
                getTicker(token.tokenInfo.symbol).subscribe(this::onPrice, this::onError);
            }
        }

    }

    public Single<Ticker> getTicker(String symbol) {
        return Single.fromObservable(tickerService
                .fetchTickerPrice(symbol, getCurrency()));   // getDefaultNetwork().symbol
    }

    public  String getCurrency() {
        return ethereumNetworkRepository.getCurrency();
    }

    private  void onPrice(Ticker ticker) {
        LogUtils.d("Tokens", "price: " + ticker.symbol + "  " + ticker.price_usd);
        this.prices.postValue(ticker);
    }

}


