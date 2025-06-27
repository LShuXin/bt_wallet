package com.lsx.bt_wallet.service;


import com.lsx.bt_wallet.entity.TokenInfo;

import io.reactivex.Observable;

public interface TokenExplorerClientType {
    Observable<TokenInfo[]> fetch(String walletAddress);
}