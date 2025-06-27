package com.lsx.bt_wallet.repository;


import com.lsx.bt_wallet.entity.NetworkInfo;
import com.lsx.bt_wallet.entity.TokenInfo;

import io.reactivex.Completable;
import io.reactivex.Single;

public interface TokenLocalSource {
    Completable put(NetworkInfo networkInfo, String walletAddress, TokenInfo tokenInfo);
    Single<TokenInfo[]> fetch(NetworkInfo networkInfo, String walletAddress);
}
