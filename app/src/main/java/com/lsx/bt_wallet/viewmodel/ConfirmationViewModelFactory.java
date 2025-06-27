package com.lsx.bt_wallet.viewmodel;

import androidx.annotation.NonNull;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import com.lsx.bt_wallet.UpChainWalletApp;
import com.lsx.bt_wallet.interact.CreateTransactionInteract;
import com.lsx.bt_wallet.interact.FetchGasSettingsInteract;
import com.lsx.bt_wallet.interact.FetchWalletInteract;
import com.lsx.bt_wallet.repository.EthereumNetworkRepository;
import com.lsx.bt_wallet.repository.RepositoryFactory;


public class ConfirmationViewModelFactory implements ViewModelProvider.Factory {

    private final EthereumNetworkRepository ethereumNetworkRepository;
    private FetchWalletInteract findDefaultWalletInteract;
    private FetchGasSettingsInteract fetchGasSettingsInteract;
    private CreateTransactionInteract createTransactionInteract;

    public ConfirmationViewModelFactory() {
        RepositoryFactory rf = UpChainWalletApp.repositoryFactory();

        this.ethereumNetworkRepository = rf.ethereumNetworkRepository;
        this.findDefaultWalletInteract = new FetchWalletInteract();
        this.fetchGasSettingsInteract = new FetchGasSettingsInteract(UpChainWalletApp.sp, ethereumNetworkRepository);
        this.createTransactionInteract = new CreateTransactionInteract(ethereumNetworkRepository);
    }

    @NonNull
    @Override
    public <T extends ViewModel> T create(@NonNull Class<T> modelClass) {
        return (T) new ConfirmationViewModel(ethereumNetworkRepository, findDefaultWalletInteract, fetchGasSettingsInteract , createTransactionInteract);
    }
}
