package com.lsx.bt_wallet.web3;


import com.lsx.bt_wallet.web3.entity.Message;

public interface OnSignPersonalMessageListener {
    void onSignPersonalMessage(Message<String> message);
}
