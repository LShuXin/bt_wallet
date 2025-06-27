package com.lsx.bt_wallet.repository;


import java.math.BigInteger;

import io.reactivex.Single;
import com.lsx.bt_wallet.domain.ETHWallet;
import com.lsx.bt_wallet.entity.Transaction;

import io.reactivex.Maybe;
import io.reactivex.Observable;

public interface TransactionRepositoryType {
	Observable<Transaction[]> fetchTransaction(String walletAddr, String token);
	Maybe<Transaction> findTransaction(String walletAddr, String transactionHash);

    Single<String> createTransaction(ETHWallet from, BigInteger gasPrice, BigInteger gasLimit, String data, String password);
    Single<String> createTransaction(ETHWallet from, String toAddress, BigInteger subunitAmount, BigInteger gasPrice, BigInteger gasLimit, byte[] data, String password);
}
