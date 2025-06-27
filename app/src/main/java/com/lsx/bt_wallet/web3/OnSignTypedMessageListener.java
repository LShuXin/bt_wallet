package com.lsx.bt_wallet.web3;


import com.lsx.bt_wallet.web3.entity.Message;
import com.lsx.bt_wallet.web3.entity.TypedData;

public interface OnSignTypedMessageListener {
    void onSignTypedMessage(Message<TypedData[]> message);
}
