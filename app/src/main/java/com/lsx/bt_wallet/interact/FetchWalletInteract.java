package com.lsx.bt_wallet.interact;

import com.lsx.bt_wallet.domain.ETHWallet;

import java.util.List;

import io.reactivex.Single;
import io.reactivex.android.schedulers.AndroidSchedulers;
import com.lsx.bt_wallet.utils.WalletDaoUtils;

/**
 * Created by Tiny 熊 @ Upchain.pro
 * WeiXin: xlbxiong
 */

public class FetchWalletInteract {


    public FetchWalletInteract() {
    }

    public Single<List<ETHWallet>> fetch() {


        return Single.fromCallable(WalletDaoUtils::loadAll).observeOn(AndroidSchedulers.mainThread());

    }

    public Single<ETHWallet> findDefault() {

        return Single.fromCallable(WalletDaoUtils::getCurrent);

    }
}
