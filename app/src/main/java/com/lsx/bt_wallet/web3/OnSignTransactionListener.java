package com.lsx.bt_wallet.web3;

import com.lsx.bt_wallet.web3.entity.Web3Transaction;

public interface OnSignTransactionListener {
    void onSignTransaction(Web3Transaction transaction , String url);
}
