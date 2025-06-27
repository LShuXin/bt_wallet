package com.lsx.bt_wallet.repository;


import com.lsx.bt_wallet.entity.NetworkInfo;

public interface OnNetworkChangeListener {
	void onNetworkChanged(NetworkInfo networkInfo);
}
