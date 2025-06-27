package com.lsx.bt_wallet.viewmodel;

import androidx.annotation.NonNull;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import com.lsx.bt_wallet.UpChainWalletApp;
import com.lsx.bt_wallet.interact.FetchWalletInteract;
import com.lsx.bt_wallet.repository.EthereumNetworkRepository;
import com.lsx.bt_wallet.repository.RepositoryFactory;


public class TransactionDetailViewModelFactory implements ViewModelProvider.Factory {

    private final EthereumNetworkRepository EthereumNetworkRepository;
    private final FetchWalletInteract findDefaultWalletInteract;

    public TransactionDetailViewModelFactory() {
        RepositoryFactory rf = UpChainWalletApp.repositoryFactory();

        this.EthereumNetworkRepository = rf.ethereumNetworkRepository;
        this.findDefaultWalletInteract = new FetchWalletInteract();
    }

    @NonNull
    @Override
    public <T extends ViewModel> T create(@NonNull Class<T> modelClass) {
        return (T) new TransactionDetailViewModel(
                EthereumNetworkRepository,
                findDefaultWalletInteract
                );
    }
}
