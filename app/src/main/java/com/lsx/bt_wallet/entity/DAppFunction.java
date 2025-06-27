package com.lsx.bt_wallet.entity;


import com.lsx.bt_wallet.web3.entity.Message;

public interface DAppFunction
{
    void DAppError(Throwable error, Message<String> message);
    void DAppReturn(byte[] data, Message<String> message);
}
