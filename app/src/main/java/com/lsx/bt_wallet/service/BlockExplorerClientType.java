package com.lsx.bt_wallet.service;


import com.lsx.bt_wallet.entity.Transaction;

import io.reactivex.Observable;

public interface BlockExplorerClientType {
    Observable<Transaction[]> fetchTransactions(String forAddress, String forToken);
}
