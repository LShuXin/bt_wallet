package com.lsx.bt_wallet.viewmodel;

import androidx.annotation.NonNull;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import com.lsx.bt_wallet.UpChainWalletApp;
import com.lsx.bt_wallet.interact.FetchTokensInteract;
import com.lsx.bt_wallet.interact.FetchWalletInteract;
import com.lsx.bt_wallet.repository.EthereumNetworkRepository;
import com.lsx.bt_wallet.repository.RepositoryFactory;


public class TokensViewModelFactory implements ViewModelProvider.Factory {

    private final FetchTokensInteract fetchTokensInteract;
    private final EthereumNetworkRepository ethereumNetworkRepository;

    public TokensViewModelFactory() {

        RepositoryFactory rf = UpChainWalletApp.repositoryFactory();
        fetchTokensInteract = new FetchTokensInteract(rf.tokenRepository);
        ethereumNetworkRepository = rf.ethereumNetworkRepository;
    }

    @NonNull
    @Override
    public <T extends ViewModel> T create(@NonNull Class<T> modelClass) {
        return (T) new TokensViewModel(
                ethereumNetworkRepository,
                new FetchWalletInteract(),
                fetchTokensInteract
                );
    }
}
