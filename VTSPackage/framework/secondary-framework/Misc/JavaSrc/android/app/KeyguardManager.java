// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.*;
import android.view.IWindowManager;
import android.view.WindowManagerGlobal;

public class KeyguardManager
{
    public class KeyguardLock
    {

        private String mTag;
        private IBinder mToken;
        final KeyguardManager this$0;

        public void disableKeyguard()
        {
            try
            {
                mWM.disableKeyguard(mToken, mTag);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        public void reenableKeyguard()
        {
            try
            {
                mWM.reenableKeyguard(mToken);
                return;
            }
            catch (RemoteException remoteexception)
            {
                return;
            }
        }

        KeyguardLock(String s)
        {
            this$0 = KeyguardManager.this;
            super();
            mToken = new Binder();
            mTag = s;
        }
    }

    public static interface OnKeyguardExitResult
    {

        public abstract void onKeyguardExitResult(boolean flag);
    }


    private IWindowManager mWM;

    KeyguardManager()
    {
        mWM = WindowManagerGlobal.getWindowManagerService();
    }

    public void exitKeyguardSecurely(final OnKeyguardExitResult callback)
    {
        try
        {
            mWM.exitKeyguardSecurely(new android.view.IOnKeyguardExitResult.Stub() {

                final KeyguardManager this$0;
                final OnKeyguardExitResult val$callback;

                public void onKeyguardExitResult(boolean flag)
                    throws RemoteException
                {
                    callback.onKeyguardExitResult(flag);
                }

            
            {
                this$0 = KeyguardManager.this;
                callback = onkeyguardexitresult;
                super();
            }
            }
);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public boolean inKeyguardRestrictedInputMode()
    {
        boolean flag;
        try
        {
            flag = mWM.inKeyguardRestrictedInputMode();
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public boolean isKeyguardLocked()
    {
        boolean flag;
        try
        {
            flag = mWM.isKeyguardLocked();
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public boolean isKeyguardSecure()
    {
        boolean flag;
        try
        {
            flag = mWM.isKeyguardSecure();
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public KeyguardLock newKeyguardLock(String s)
    {
        return new KeyguardLock(s);
    }

}
