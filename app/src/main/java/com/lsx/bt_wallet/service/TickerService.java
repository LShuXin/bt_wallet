package com.lsx.bt_wallet.service;


import com.lsx.bt_wallet.entity.Ticker;

import io.reactivex.Observable;

public interface TickerService {

    Observable<Ticker> fetchTickerPrice(String symbols, String currency);
}
