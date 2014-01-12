// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.accounts;

import android.accounts.*;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import com.android.settings.Utils;
import java.io.IOException;

// Referenced classes of package com.android.settings.accounts:
//            ChooseAccountActivity

public class AddAccountSettings extends Activity
{

    private static final int ADD_ACCOUNT_REQUEST = 2;
    private static final int CHOOSE_ACCOUNT_REQUEST = 1;
    static final String EXTRA_HAS_MULTIPLE_USERS = "hasMultipleUsers";
    static final String EXTRA_SELECTED_ACCOUNT = "selected_account";
    private static final String KEY_ADD_CALLED = "AddAccountCalled";
    private static final String KEY_CALLER_IDENTITY = "pendingIntent";
    private static final String TAG = "AccountSettings";
    private boolean mAddAccountCalled;
    private AccountManagerCallback mCallback;
    private PendingIntent mPendingIntent;

    public AddAccountSettings()
    {
        mCallback = new AccountManagerCallback() {

            final AddAccountSettings this$0;

            public void run(AccountManagerFuture accountmanagerfuture)
            {
                boolean flag = true;
                Bundle bundle;
                Intent intent;
                bundle = (Bundle)accountmanagerfuture.getResult();
                intent = (Intent)bundle.get("intent");
                if (intent == null) goto _L2; else goto _L1
_L1:
                flag = false;
                Bundle bundle1 = new Bundle();
                bundle1.putParcelable("pendingIntent", mPendingIntent);
                bundle1.putBoolean("hasMultipleUsers", Utils.hasMultipleUsers(AddAccountSettings.this));
                intent.putExtras(bundle1);
                startActivityForResult(intent, 2);
_L3:
                if (Log.isLoggable("AccountSettings", 2))
                    Log.v("AccountSettings", (new StringBuilder()).append("account added: ").append(bundle).toString());
                if (flag)
                    finish();
_L4:
                return;
_L2:
                setResult(-1);
                if (mPendingIntent != null)
                {
                    mPendingIntent.cancel();
                    mPendingIntent = null;
                }
                  goto _L3
                OperationCanceledException operationcanceledexception;
                operationcanceledexception;
                if (Log.isLoggable("AccountSettings", 2))
                    Log.v("AccountSettings", "addAccount was canceled");
                if (flag)
                {
                    finish();
                    return;
                }
                  goto _L4
                IOException ioexception;
                ioexception;
                if (Log.isLoggable("AccountSettings", 2))
                    Log.v("AccountSettings", (new StringBuilder()).append("addAccount failed: ").append(ioexception).toString());
                if (flag)
                {
                    finish();
                    return;
                }
                  goto _L4
                AuthenticatorException authenticatorexception;
                authenticatorexception;
                if (Log.isLoggable("AccountSettings", 2))
                    Log.v("AccountSettings", (new StringBuilder()).append("addAccount failed: ").append(authenticatorexception).toString());
                if (!flag) goto _L4; else goto _L5
_L5:
                finish();
                return;
                Exception exception;
                exception;
                if (flag)
                    finish();
                throw exception;
                  goto _L3
            }

            
            {
                this$0 = AddAccountSettings.this;
                super();
            }
        }
;
        mAddAccountCalled = false;
    }

    private void addAccount(String s)
    {
        Bundle bundle = new Bundle();
        mPendingIntent = PendingIntent.getBroadcast(this, 0, new Intent(), 0);
        bundle.putParcelable("pendingIntent", mPendingIntent);
        bundle.putBoolean("hasMultipleUsers", Utils.hasMultipleUsers(this));
        AccountManager.get(this).addAccount(s, null, null, bundle, null, mCallback, null);
        mAddAccountCalled = true;
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        switch (i)
        {
        case 2: // '\002'
            setResult(j);
            if (mPendingIntent != null)
            {
                mPendingIntent.cancel();
                mPendingIntent = null;
            }
            finish();
            return;

        case 1: // '\001'
            if (j == 0)
            {
                setResult(j);
                finish();
                return;
            } else
            {
                addAccount(intent.getStringExtra("selected_account"));
                return;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (bundle != null)
        {
            mAddAccountCalled = bundle.getBoolean("AddAccountCalled");
            if (Log.isLoggable("AccountSettings", 2))
                Log.v("AccountSettings", "restored");
        }
        if (mAddAccountCalled)
        {
            finish();
            return;
        }
        String as[] = getIntent().getStringArrayExtra("authorities");
        String as1[] = getIntent().getStringArrayExtra("account_types");
        Intent intent = new Intent(this, com/android/settings/accounts/ChooseAccountActivity);
        if (as != null)
            intent.putExtra("authorities", as);
        if (as1 != null)
            intent.putExtra("account_types", as1);
        startActivityForResult(intent, 1);
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("AddAccountCalled", mAddAccountCalled);
        if (Log.isLoggable("AccountSettings", 2))
            Log.v("AccountSettings", "saved");
    }



/*
    static PendingIntent access$002(AddAccountSettings addaccountsettings, PendingIntent pendingintent)
    {
        addaccountsettings.mPendingIntent = pendingintent;
        return pendingintent;
    }

*/
}
