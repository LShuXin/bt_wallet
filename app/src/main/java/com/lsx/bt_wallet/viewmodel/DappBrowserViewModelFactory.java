package com.lsx.bt_wallet.viewmodel;


import androidx.annotation.NonNull;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import com.lsx.bt_wallet.UpChainWalletApp;
import com.lsx.bt_wallet.interact.CreateTransactionInteract;
import com.lsx.bt_wallet.interact.FetchTokensInteract;
import com.lsx.bt_wallet.interact.FetchWalletInteract;
import com.lsx.bt_wallet.repository.EthereumNetworkRepository;
import com.lsx.bt_wallet.repository.RepositoryFactory;


public class DappBrowserViewModelFactory implements ViewModelProvider.Factory {
    private final EthereumNetworkRepository ethereumNetworkRepository;
    private final FetchWalletInteract findDefaultWalletInteract;
    private final CreateTransactionInteract createTransactionInteract;
    private final FetchTokensInteract fetchTokensInteract;

    public DappBrowserViewModelFactory() {

        RepositoryFactory rf = UpChainWalletApp.repositoryFactory();

        this.ethereumNetworkRepository = rf.ethereumNetworkRepository;

        this.findDefaultWalletInteract = new FetchWalletInteract();
        this.createTransactionInteract = new CreateTransactionInteract(rf.ethereumNetworkRepository);
        this.fetchTokensInteract = new FetchTokensInteract(rf.tokenRepository);
    }

    @NonNull
    @Override
    public <T extends ViewModel> T create(@NonNull Class<T> modelClass) {
        return (T) new DappBrowserViewModel(
                ethereumNetworkRepository,
                findDefaultWalletInteract,
                createTransactionInteract,
                fetchTokensInteract
                );
    }
}
