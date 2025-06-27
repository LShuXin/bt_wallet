package com.lsx.bt_wallet.ui.activity;

import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.lsx.bt_wallet.R;
import com.lsx.bt_wallet.base.BaseActivity;

import butterknife.BindView;

/**
 * Created by Tiny 熊 @ Upchain.pro
 * WeiXin: xlbxiong
 */


public class ContactsActivity extends BaseActivity {
    TextView tvTitle;
    ImageView ivBtn;
    LinearLayout rlBtn;

    @Override
    public void initView() {

        tvTitle = findViewById(R.id.tv_title);
        ivBtn = findViewById(R.id.iv_btn);
        rlBtn = findViewById(R.id.rl_btn);
    }

    @Override
    public int getLayoutId() {
        return R.layout.activity_contacts;
    }

    @Override
    public void initToolBar() {
        tvTitle.setText(R.string.mine_contracts);
        ivBtn.setImageResource(R.drawable.ic_add);
        rlBtn.setVisibility(View.VISIBLE);
    }

    @Override
    public void initDatas() {

    }

    @Override
    public void configViews() {

    }

}
