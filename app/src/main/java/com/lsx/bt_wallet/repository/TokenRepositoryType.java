package com.lsx.bt_wallet.repository;


import com.lsx.bt_wallet.entity.Token;

import io.reactivex.Completable;
import io.reactivex.Observable;

public interface TokenRepositoryType {

    Observable<Token[]> fetch(String walletAddress);

    Completable addToken(String walletAddress, String address, String symbol, int decimals);
}
