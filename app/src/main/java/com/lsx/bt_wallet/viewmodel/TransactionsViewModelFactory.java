package com.lsx.bt_wallet.viewmodel;

import androidx.annotation.NonNull;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import com.lsx.bt_wallet.UpChainWalletApp;
import com.lsx.bt_wallet.interact.FetchTransactionsInteract;
import com.lsx.bt_wallet.interact.FetchWalletInteract;
import com.lsx.bt_wallet.repository.EthereumNetworkRepository;
import com.lsx.bt_wallet.repository.RepositoryFactory;


public class TransactionsViewModelFactory implements ViewModelProvider.Factory {

    private final EthereumNetworkRepository ethereumNetworkRepository;
    private final FetchWalletInteract findDefaultWalletInteract;
    private final FetchTransactionsInteract fetchTransactionsInteract;


    public TransactionsViewModelFactory() {

        RepositoryFactory rf = UpChainWalletApp.repositoryFactory();
        this.ethereumNetworkRepository = rf.ethereumNetworkRepository;
        this.findDefaultWalletInteract = new FetchWalletInteract();
        this.fetchTransactionsInteract = new FetchTransactionsInteract(rf.transactionRepository);
    }

    @NonNull
    @Override
    public <T extends ViewModel> T create(@NonNull Class<T> modelClass) {
        return (T) new TransactionsViewModel(
                ethereumNetworkRepository,
                findDefaultWalletInteract,
                fetchTransactionsInteract);
    }
}
