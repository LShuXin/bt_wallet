package com.lsx.bt_wallet.interact;


import com.lsx.bt_wallet.entity.Transaction;
import com.lsx.bt_wallet.repository.TransactionRepositoryType;

import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import com.lsx.bt_wallet.utils.LogUtils;

public class FetchTransactionsInteract {

    private final TransactionRepositoryType transactionRepository;

    public FetchTransactionsInteract(TransactionRepositoryType transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    public Observable<Transaction[]> fetch(String walletAddr, String token) {
        LogUtils.d("fetch");

        return transactionRepository
                .fetchTransaction(walletAddr, token)
                .observeOn(AndroidSchedulers.mainThread());
    }
}
