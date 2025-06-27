package com.lsx.bt_wallet.viewmodel;

import androidx.annotation.NonNull;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import com.lsx.bt_wallet.UpChainWalletApp;
import com.lsx.bt_wallet.interact.AddTokenInteract;
import com.lsx.bt_wallet.interact.FetchWalletInteract;
import com.lsx.bt_wallet.repository.RepositoryFactory;

public class AddTokenViewModelFactory implements ViewModelProvider.Factory {

    private final AddTokenInteract addTokenInteract;
    private final FetchWalletInteract findDefaultWalletInteract;

    public AddTokenViewModelFactory() {
        RepositoryFactory rf = UpChainWalletApp.repositoryFactory();

        this.findDefaultWalletInteract = new FetchWalletInteract();
        this.addTokenInteract = new AddTokenInteract(findDefaultWalletInteract, rf.tokenRepository);;

    }

    @NonNull
    @Override
    public <T extends ViewModel> T create(@NonNull Class<T> modelClass) {
        return (T) new AddTokenViewModel(addTokenInteract, findDefaultWalletInteract);
    }
}
