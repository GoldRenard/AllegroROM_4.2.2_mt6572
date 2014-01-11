// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.*;
import android.os.*;
import android.util.Log;
import android.view.View;
import com.android.internal.policy.IFaceLockCallback;
import com.android.internal.policy.IFaceLockInterface;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            BiometricSensorUnlock, KeyguardUpdateMonitor, KeyguardSecurityCallback

public class FaceUnlock
    implements BiometricSensorUnlock, android.os.Handler.Callback
{

    private static final boolean DEBUG = false;
    private static final String TAG = "FULLockscreen";
    private final int BACKUP_LOCK_TIMEOUT = 5000;
    private final int MSG_CANCEL = 3;
    private final int MSG_POKE_WAKELOCK = 5;
    private final int MSG_REPORT_FAILED_ATTEMPT = 4;
    private final int MSG_SERVICE_CONNECTED = 0;
    private final int MSG_SERVICE_DISCONNECTED = 1;
    private final int MSG_UNLOCK = 2;
    private boolean mBoundToService;
    private ServiceConnection mConnection;
    private final Context mContext;
    private final IFaceLockCallback mFaceUnlockCallback = new com.android.internal.policy.IFaceLockCallback.Stub() {

        final FaceUnlock this$0;

        public void cancel()
        {
            mHandler.sendEmptyMessage(3);
        }

        public void pokeWakelock(int i)
        {
            Message message = mHandler.obtainMessage(5, i, -1);
            mHandler.sendMessage(message);
        }

        public void reportFailedAttempt()
        {
            mHandler.sendEmptyMessage(4);
        }

        public void unlock()
        {
            Message message = mHandler.obtainMessage(2, UserHandle.getCallingUserId(), -1);
            mHandler.sendMessage(message);
        }

            
            {
                this$0 = FaceUnlock.this;
                Stub();
            }
    }
;
    private View mFaceUnlockView;
    private Handler mHandler;
    private volatile boolean mIsRunning;
    KeyguardSecurityCallback mKeyguardScreenCallback;
    private final LockPatternUtils mLockPatternUtils;
    private IFaceLockInterface mService;
    private boolean mServiceRunning;
    private final Object mServiceRunningLock = new Object();

    public FaceUnlock(Context context)
    {
        mServiceRunning = false;
        mBoundToService = false;
        mIsRunning = false;
        mConnection = new ServiceConnection() {

            final FaceUnlock this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                Log.d("FULLockscreen", "Connected to Face Unlock service");
                mService = com.android.internal.policy.IFaceLockInterface.Stub.asInterface(ibinder);
                mHandler.sendEmptyMessage(0);
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                Log.e("FULLockscreen", "Unexpected disconnect from Face Unlock service");
                mHandler.sendEmptyMessage(1);
            }

            
            {
                this$0 = FaceUnlock.this;
                Object();
            }
        }
;
        mContext = context;
        mLockPatternUtils = new LockPatternUtils(context);
        mHandler = new Handler(this);
    }

    private void startUi(IBinder ibinder, int i, int j, int k, int l)
    {
        Object obj = mServiceRunningLock;
        obj;
        JVM INSTR monitorenter ;
        if (mServiceRunning)
            break MISSING_BLOCK_LABEL_99;
        Log.d("FULLockscreen", "Starting Face Unlock");
        mService.startUi(ibinder, i, j, k, l, mLockPatternUtils.isBiometricWeakLivelinessEnabled());
        mServiceRunning = true;
_L1:
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("FULLockscreen", (new StringBuilder()).append("Caught exception starting Face Unlock: ").append(remoteexception.toString()).toString());
        obj;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        Log.w("FULLockscreen", "startUi() attempted while running");
          goto _L1
    }

    private void stopUi()
    {
        Object obj = mServiceRunningLock;
        obj;
        JVM INSTR monitorenter ;
        if (!mServiceRunning) goto _L2; else goto _L1
_L1:
        Log.d("FULLockscreen", "Stopping Face Unlock");
        mService.stopUi();
_L3:
        mServiceRunning = false;
_L2:
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("FULLockscreen", (new StringBuilder()).append("Caught exception stopping Face Unlock: ").append(remoteexception.toString()).toString());
          goto _L3
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void cleanUp()
    {
        if (mService != null)
        {
            try
            {
                mService.unregisterCallback(mFaceUnlockCallback);
            }
            catch (RemoteException remoteexception) { }
            stopUi();
            mService = null;
        }
    }

    public int getQuality()
    {
        return 32768;
    }

    void handleCancel()
    {
        KeyguardUpdateMonitor.getInstance(mContext).setAlternateUnlockEnabled(false);
        mKeyguardScreenCallback.showBackupSecurity();
        stop();
        mKeyguardScreenCallback.userActivity(5000L);
    }

    public boolean handleMessage(Message message)
    {
label0:
        {
            switch (message.what)
            {
            default:
                break label0;

            case 5: // '\005'
                handlePokeWakelock(message.arg1);
                break;

            case 4: // '\004'
                handleReportFailedAttempt();
                break;

            case 3: // '\003'
                handleCancel();
                break;

            case 2: // '\002'
                handleUnlock(message.arg1);
                break;

            case 1: // '\001'
                handleServiceDisconnected();
                break;

            case 0: // '\0'
                handleServiceConnected();
                break;
            }
            return true;
        }
        Log.e("FULLockscreen", "Unhandled message");
        return false;
    }

    void handlePokeWakelock(int i)
    {
        if (((PowerManager)mContext.getSystemService("power")).isScreenOn())
            mKeyguardScreenCallback.userActivity(i);
    }

    void handleReportFailedAttempt()
    {
        KeyguardUpdateMonitor.getInstance(mContext).setAlternateUnlockEnabled(false);
        mKeyguardScreenCallback.reportFailedUnlockAttempt();
    }

    void handleServiceConnected()
    {
        Log.d("FULLockscreen", "handleServiceConnected()");
        if (!mBoundToService)
        {
            Log.d("FULLockscreen", "Dropping startUi() in handleServiceConnected() because no longer bound");
        } else
        {
            try
            {
                mService.registerCallback(mFaceUnlockCallback);
            }
            catch (RemoteException remoteexception)
            {
                Log.e("FULLockscreen", (new StringBuilder()).append("Caught exception connecting to Face Unlock: ").append(remoteexception.toString()).toString());
                mService = null;
                mBoundToService = false;
                mIsRunning = false;
                return;
            }
            if (mFaceUnlockView != null)
            {
                IBinder ibinder = mFaceUnlockView.getWindowToken();
                if (ibinder != null)
                {
                    mKeyguardScreenCallback.userActivity(0L);
                    int ai[] = new int[2];
                    mFaceUnlockView.getLocationInWindow(ai);
                    startUi(ibinder, ai[0], ai[1], mFaceUnlockView.getWidth(), mFaceUnlockView.getHeight());
                    return;
                } else
                {
                    Log.e("FULLockscreen", "windowToken is null in handleServiceConnected()");
                    return;
                }
            }
        }
    }

    void handleServiceDisconnected()
    {
        Log.e("FULLockscreen", "handleServiceDisconnected()");
        synchronized (mServiceRunningLock)
        {
            mService = null;
            mServiceRunning = false;
        }
        mBoundToService = false;
        mIsRunning = false;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void handleUnlock(int i)
    {
        stop();
        int j = mLockPatternUtils.getCurrentUser();
        if (i == j)
        {
            mKeyguardScreenCallback.reportSuccessfulUnlockAttempt();
            mKeyguardScreenCallback.dismiss(true);
            return;
        } else
        {
            Log.d("FULLockscreen", (new StringBuilder()).append("Ignoring unlock for authenticated user (").append(i).append(") because the current user is ").append(j).toString());
            return;
        }
    }

    public void initializeView(View view)
    {
        Log.d("FULLockscreen", "initializeView()");
        mFaceUnlockView = view;
    }

    public boolean isRunning()
    {
        return mIsRunning;
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mKeyguardScreenCallback = keyguardsecuritycallback;
    }

    public boolean start()
    {
        if (mHandler.getLooper() != Looper.myLooper())
            Log.e("FULLockscreen", "start() called off of the UI thread");
        if (mIsRunning)
            Log.w("FULLockscreen", "start() called when already running");
        if (!mBoundToService)
        {
            Log.d("FULLockscreen", (new StringBuilder()).append("Binding to Face Unlock service for user=").append(mLockPatternUtils.getCurrentUser()).toString());
            mContext.bindService(new Intent(com/android/internal/policy/IFaceLockInterface.getName()), mConnection, 1, mLockPatternUtils.getCurrentUser());
            mBoundToService = true;
        } else
        {
            Log.w("FULLockscreen", "Attempt to bind to Face Unlock when already bound");
        }
        mIsRunning = true;
        return true;
    }

    public boolean stop()
    {
        if (mHandler.getLooper() != Looper.myLooper())
            Log.e("FULLockscreen", "stop() called from non-UI thread");
        mHandler.removeMessages(0);
        boolean flag = mIsRunning;
        stopUi();
        if (mBoundToService)
        {
            if (mService != null)
                try
                {
                    mService.unregisterCallback(mFaceUnlockCallback);
                }
                catch (RemoteException remoteexception) { }
            Log.d("FULLockscreen", "Unbinding from Face Unlock service");
            mContext.unbindService(mConnection);
            mBoundToService = false;
        }
        mIsRunning = false;
        return flag;
    }

    public void stopAndShowBackup()
    {
        mHandler.sendEmptyMessage(3);
    }


/*
    static IFaceLockInterface access$002(FaceUnlock faceunlock, IFaceLockInterface ifacelockinterface)
    {
        faceunlock.mService = ifacelockinterface;
        return ifacelockinterface;
    }

*/

}
