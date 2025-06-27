package com.lsx.bt_wallet.viewmodel;

import android.util.Log;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import io.reactivex.disposables.Disposable;
import com.lsx.bt_wallet.C;
import com.lsx.bt_wallet.entity.ErrorEnvelope;
import com.lsx.bt_wallet.entity.ServiceException;

public class BaseViewModel extends ViewModel {

    protected final MutableLiveData<ErrorEnvelope> error = new MutableLiveData<>();
    protected final MutableLiveData<Boolean> progress = new MutableLiveData<>();
    protected Disposable disposable;

    @Override
    protected void onCleared() {
        cancel();
    }

    protected void cancel() {
        if (disposable != null && !disposable.isDisposed()) {
            disposable.dispose();
        }
    }

    public LiveData<ErrorEnvelope> error() {
        return error;
    }

    public LiveData<Boolean> progress() {
        return progress;
    }

    protected void onError(Throwable throwable) {
        if (throwable instanceof ServiceException) {
            error.postValue(((ServiceException) throwable).error);
        } else {
            error.postValue(new ErrorEnvelope(C.ErrorCode.UNKNOWN, null, throwable));
            // TODO: Add dialog with offer send error log to developers: notify about error.
            Log.d("SESSION", "Err", throwable);
        }
    }
}
