// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.backup.IBackupManager;
import android.os.*;
import android.util.Log;
import android.view.View;
import android.widget.*;

public class SetFullBackupPassword extends Activity
{

    static final String TAG = "SetFullBackupPassword";
    IBackupManager mBackupManager;
    android.view.View.OnClickListener mButtonListener;
    Button mCancel;
    TextView mConfirmNewPw;
    TextView mCurrentPw;
    TextView mNewPw;
    Button mSet;

    public SetFullBackupPassword()
    {
        mButtonListener = new android.view.View.OnClickListener() {

            final SetFullBackupPassword this$0;

            public void onClick(View view)
            {
                if (view == mSet)
                {
                    String s = mCurrentPw.getText().toString();
                    String s1 = mNewPw.getText().toString();
                    if (!s1.equals(mConfirmNewPw.getText().toString()))
                    {
                        Log.i("SetFullBackupPassword", "password mismatch");
                        Toast.makeText(SetFullBackupPassword.this, 0x7f0b07f9, 1).show();
                        return;
                    }
                    if (setBackupPassword(s, s1))
                    {
                        Log.i("SetFullBackupPassword", "password set successfully");
                        Toast.makeText(SetFullBackupPassword.this, 0x7f0b07f8, 1).show();
                        finish();
                        return;
                    } else
                    {
                        Log.i("SetFullBackupPassword", "failure; password mismatch?");
                        Toast.makeText(SetFullBackupPassword.this, 0x7f0b07fa, 1).show();
                        return;
                    }
                }
                if (view == mCancel)
                {
                    finish();
                    return;
                } else
                {
                    Log.w("SetFullBackupPassword", "Click on unknown view");
                    return;
                }
            }

            
            {
                this$0 = SetFullBackupPassword.this;
                super();
            }
        }
;
    }

    private boolean setBackupPassword(String s, String s1)
    {
        boolean flag;
        try
        {
            flag = mBackupManager.setBackupPassword(s, s1);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("SetFullBackupPassword", "Unable to communicate with backup manager");
            return false;
        }
        return flag;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mBackupManager = android.app.backup.IBackupManager.Stub.asInterface(ServiceManager.getService("backup"));
        setContentView(0x7f040087);
        mCurrentPw = (TextView)findViewById(0x7f080165);
        mNewPw = (TextView)findViewById(0x7f080167);
        mConfirmNewPw = (TextView)findViewById(0x7f080169);
        mCancel = (Button)findViewById(0x7f08016a);
        mSet = (Button)findViewById(0x7f08016b);
        mCancel.setOnClickListener(mButtonListener);
        mSet.setOnClickListener(mButtonListener);
    }

}
