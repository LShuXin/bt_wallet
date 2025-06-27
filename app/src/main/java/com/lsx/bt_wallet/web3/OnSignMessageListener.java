package com.lsx.bt_wallet.web3;

import com.lsx.bt_wallet.web3.entity.Message;

public interface OnSignMessageListener {
    void onSignMessage(Message<String> message);
}
