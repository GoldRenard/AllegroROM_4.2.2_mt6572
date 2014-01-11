// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.os.*;
import android.security.*;
import android.text.*;
import android.util.Log;
import android.view.View;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            ChooseLockSettingsHelper

public final class CredentialStorage extends Activity
{
    private class ConfigureKeyGuardDialog
        implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener
    {

        private boolean mConfigureConfirmed;
        final CredentialStorage this$0;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            boolean flag;
            if (i == -1)
                flag = true;
            else
                flag = false;
            mConfigureConfirmed = flag;
        }

        public void onDismiss(DialogInterface dialoginterface)
        {
            CredentialStorage.sConfigureKeyGuardDialog = null;
            if (mConfigureConfirmed)
            {
                mConfigureConfirmed = false;
                Intent intent = new Intent("android.app.action.SET_NEW_PASSWORD");
                intent.putExtra("minimum_quality", 0x10000);
                startActivity(intent);
                return;
            } else
            {
                finish();
                return;
            }
        }

        private ConfigureKeyGuardDialog()
        {
            this$0 = CredentialStorage.this;
            Object();
            if (CredentialStorage.sConfigureKeyGuardDialog == null)
            {
                AlertDialog alertdialog = (new Builder(CredentialStorage.this)).setTitle(0x1040014).setIcon(0x1080027).setMessage(0x7f0b07e8).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, this).create();
                CredentialStorage.sConfigureKeyGuardDialog = alertdialog;
                alertdialog.setOnDismissListener(this);
                alertdialog.show();
            }
        }

    }

    private class ResetDialog
        implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener
    {

        private boolean mResetConfirmed;
        final CredentialStorage this$0;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            boolean flag;
            if (i == -1)
                flag = true;
            else
                flag = false;
            mResetConfirmed = flag;
        }

        public void onDismiss(DialogInterface dialoginterface)
        {
            CredentialStorage.sResetDialog = null;
            if (mResetConfirmed)
            {
                mResetConfirmed = false;
                (new ResetKeyStoreAndKeyChain()).execute(new Void[0]);
                return;
            } else
            {
                finish();
                return;
            }
        }

        private ResetDialog()
        {
            this$0 = CredentialStorage.this;
            Object();
            if (CredentialStorage.sResetDialog == null)
            {
                AlertDialog alertdialog = (new Builder(CredentialStorage.this)).setTitle(0x1040014).setIcon(0x1080027).setMessage(0x7f0b07e0).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, this).create();
                CredentialStorage.sResetDialog = alertdialog;
                alertdialog.setOnDismissListener(this);
                alertdialog.show();
            }
        }

    }

    private class ResetKeyStoreAndKeyChain extends AsyncTask
    {

        final CredentialStorage this$0;

        protected transient Boolean doInBackground(Void avoid[])
        {
            Xlog.d("CredentialStorage", "AsyncTask: ResetKeyStoreAndKeyChain");
            CredentialStorage credentialstorage = CredentialStorage.this;
            credentialstorage;
            JVM INSTR monitorenter ;
            mKeyStore.reset();
            android.security.KeyChain.KeyChainConnection keychainconnection = KeyChain.bind(CredentialStorage.this);
            Boolean boolean3 = Boolean.valueOf(keychainconnection.getService().reset());
            keychainconnection.close();
            credentialstorage;
            JVM INSTR monitorexit ;
            return boolean3;
            RemoteException remoteexception;
            remoteexception;
            Boolean boolean2 = Boolean.valueOf(false);
            keychainconnection.close();
            credentialstorage;
            JVM INSTR monitorexit ;
            return boolean2;
            Exception exception;
            exception;
            credentialstorage;
            JVM INSTR monitorexit ;
            throw exception;
            Exception exception1;
            exception1;
            try
            {
                keychainconnection.close();
                throw exception1;
            }
            catch (InterruptedException interruptedexception) { }
            Boolean boolean1;
            Thread.currentThread().interrupt();
            boolean1 = Boolean.valueOf(false);
            credentialstorage;
            JVM INSTR monitorexit ;
            return boolean1;
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected void onPostExecute(Boolean boolean1)
        {
            Xlog.d("CredentialStorage", (new StringBuilder()).append("AsyncTask: reset ").append(boolean1).toString());
            if (boolean1.booleanValue())
                Toast.makeText(getApplicationContext(), 0x7f0b07e5, 0).show();
            else
                Toast.makeText(getApplicationContext(), 0x7f0b07e6, 0).show();
            finish();
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Boolean)obj);
        }

        private ResetKeyStoreAndKeyChain()
        {
            this$0 = CredentialStorage.this;
            AsyncTask();
        }

    }

    private class UnlockDialog
        implements TextWatcher, android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener
    {

        private final Button mButton;
        private final TextView mError;
        private final TextView mOldPassword;
        private boolean mUnlockConfirmed;
        final CredentialStorage this$0;

        public void afterTextChanged(Editable editable)
        {
            Button button = mButton;
            boolean flag;
            if (mOldPassword != null && mOldPassword.getText().length() <= 0)
                flag = false;
            else
                flag = true;
            button.setEnabled(flag);
        }

        public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }

        public void onClick(DialogInterface dialoginterface, int i)
        {
            boolean flag;
            if (i == -1)
                flag = true;
            else
                flag = false;
            mUnlockConfirmed = flag;
        }

        public void onDismiss(DialogInterface dialoginterface)
        {
            CredentialStorage.sUnlockDialog = null;
            if (mUnlockConfirmed)
            {
                mUnlockConfirmed = false;
                mError.setVisibility(0);
                mKeyStore.unlock(mOldPassword.getText().toString());
                int i = mKeyStore.getLastError();
                if (i == 1)
                {
                    mRetriesRemaining = -1;
                    Toast.makeText(CredentialStorage.this, 0x7f0b07e7, 0).show();
                    ensureKeyGuard();
                } else
                {
                    if (i == 3)
                    {
                        mRetriesRemaining = -1;
                        Toast.makeText(CredentialStorage.this, 0x7f0b07e5, 0).show();
                        handleUnlockOrInstall();
                        return;
                    }
                    if (i >= 10)
                    {
                        mRetriesRemaining = 1 + (i - 10);
                        handleUnlockOrInstall();
                        return;
                    }
                }
                return;
            } else
            {
                finish();
                return;
            }
        }

        public void onTextChanged(CharSequence charsequence, int i, int j, int k)
        {
        }

        private UnlockDialog()
        {
            this$0 = CredentialStorage.this;
            Object();
            View view = View.inflate(CredentialStorage.this, 0x7f04001b, null);
            Object obj;
            if (mRetriesRemaining == -1)
                obj = getResources().getText(0x7f0b07de);
            else
            if (mRetriesRemaining > 3)
                obj = getResources().getText(0x7f0b07e2);
            else
            if (mRetriesRemaining == 1)
            {
                obj = getResources().getText(0x7f0b07e3);
            } else
            {
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(mRetriesRemaining);
                obj = getString(0x7f0b07e4, aobj);
            }
            ((TextView)view.findViewById(0x7f080035)).setText(((CharSequence) (obj)));
            mOldPassword = (TextView)view.findViewById(0x7f080038);
            mOldPassword.setVisibility(0);
            mOldPassword.addTextChangedListener(this);
            mError = (TextView)view.findViewById(0x7f080036);
            if (CredentialStorage.sUnlockDialog == null)
            {
                AlertDialog alertdialog = (new Builder(CredentialStorage.this)).setView(view).setTitle(0x7f0b07dd).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, this).create();
                CredentialStorage.sUnlockDialog = alertdialog;
                alertdialog.setOnDismissListener(this);
                alertdialog.show();
            }
            mButton = CredentialStorage.sUnlockDialog.getButton(-1);
            mButton.setEnabled(false);
        }

    }


    public static final String ACTION_INSTALL = "com.android.credentials.INSTALL";
    public static final String ACTION_RESET = "com.android.credentials.RESET";
    public static final String ACTION_UNLOCK = "com.android.credentials.UNLOCK";
    private static final int CONFIRM_KEY_GUARD_REQUEST = 1;
    static final int MIN_PASSWORD_QUALITY = 0x10000;
    private static final String TAG = "CredentialStorage";
    private static AlertDialog sConfigureKeyGuardDialog = null;
    private static AlertDialog sResetDialog = null;
    private static AlertDialog sUnlockDialog = null;
    private Bundle mInstallBundle;
    private final KeyStore mKeyStore = KeyStore.getInstance();
    private int mRetriesRemaining;

    public CredentialStorage()
    {
        mRetriesRemaining = -1;
    }

    private boolean checkKeyGuardQuality()
    {
        return (new LockPatternUtils(this)).getActivePasswordQuality() >= 0x10000;
    }

    private boolean confirmKeyGuard()
    {
        Resources resources = getResources();
        return (new ChooseLockSettingsHelper(this)).launchConfirmationActivity(1, resources.getText(0x7f0b07db), resources.getText(0x7f0b07dc));
    }

    private void ensureKeyGuard()
    {
        if (!checkKeyGuardQuality())
            new ConfigureKeyGuardDialog();
        else
        if (!confirmKeyGuard())
        {
            finish();
            return;
        }
    }

    private void handleUnlockOrInstall()
    {
        if (isFinishing())
            return;
        Xlog.d("CredentialStorage", (new StringBuilder()).append("keystore state ").append(mKeyStore.state()).toString());
        StringBuilder stringbuilder = (new StringBuilder()).append("KeyGuardQuality ");
        boolean flag;
        if (!checkKeyGuardQuality())
            flag = true;
        else
            flag = false;
        Xlog.d("CredentialStorage", stringbuilder.append(flag).toString());
        static class _cls1
        {

            static final int $SwitchMap$android$security$KeyStore$State[];

            static 
            {
                $SwitchMap$android$security$KeyStore$State = new int[android.security.KeyStore.State.values().length];
                try
                {
                    $SwitchMap$android$security$KeyStore$State[android.security.KeyStore.State.UNINITIALIZED.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$android$security$KeyStore$State[android.security.KeyStore.State.LOCKED.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$android$security$KeyStore$State[android.security.KeyStore.State.UNLOCKED.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2)
                {
                    return;
                }
            }
        }

        switch (_cls1..SwitchMap.android.security.KeyStore.State[mKeyStore.state().ordinal()])
        {
        case 3: // '\003'
            if (!checkKeyGuardQuality())
            {
                new ConfigureKeyGuardDialog(null);
                return;
            } else
            {
                installIfAvailable();
                finish();
                return;
            }

        case 2: // '\002'
            new UnlockDialog(null);
            return;

        case 1: // '\001'
            ensureKeyGuard();
            return;
        }
    }

    private void installIfAvailable()
    {
        Bundle bundle;
label0:
        {
            if (mInstallBundle != null && !mInstallBundle.isEmpty())
            {
                bundle = mInstallBundle;
                mInstallBundle = null;
                if (!bundle.containsKey("user_private_key_name"))
                    break label0;
                String s4 = bundle.getString("user_private_key_name");
                byte abyte4[] = bundle.getByteArray("user_private_key_data");
                if (mKeyStore.importKey(s4, abyte4))
                    break label0;
                Log.e("CredentialStorage", (new StringBuilder()).append("Failed to install ").append(s4).toString());
            }
            return;
        }
        if (bundle.containsKey("user_certificate_name"))
        {
            String s3 = bundle.getString("user_certificate_name");
            byte abyte3[] = bundle.getByteArray("user_certificate_data");
            if (!mKeyStore.put(s3, abyte3))
            {
                Log.e("CredentialStorage", (new StringBuilder()).append("Failed to install ").append(s3).toString());
                return;
            }
        }
        if (bundle.containsKey("ca_certificates_name"))
        {
            String s2 = bundle.getString("ca_certificates_name");
            byte abyte2[] = bundle.getByteArray("ca_certificates_data");
            if (!mKeyStore.put(s2, abyte2))
            {
                Log.e("CredentialStorage", (new StringBuilder()).append("Failed to install ").append(s2).toString());
                return;
            }
        }
        if (bundle.containsKey("wapi_user_certificate_name"))
        {
            String s1 = bundle.getString("wapi_user_certificate_name");
            byte abyte1[] = bundle.getByteArray("wapi_user_certificate_data");
            if (s1 != null && !mKeyStore.put(s1, abyte1))
            {
                Log.e("CredentialStorage", (new StringBuilder()).append("Failed to install ").append(s1).toString());
                return;
            }
        }
        if (bundle.containsKey("wapi_as_user_certificate_name"))
        {
            String s = bundle.getString("wapi_as_user_certificate_name");
            byte abyte0[] = bundle.getByteArray("wapi_as_user_certificate_data");
            if (s != null && !mKeyStore.put(s, abyte0))
            {
                Log.e("CredentialStorage", (new StringBuilder()).append("Failed to install ").append(s).toString());
                return;
            }
        }
        setResult(-1);
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
label0:
        {
            super.onActivityResult(i, j, intent);
            if (i == 1)
            {
                if (j != -1)
                    break label0;
                String s = intent.getStringExtra("password");
                if (TextUtils.isEmpty(s))
                    break label0;
                mKeyStore.password(s);
            }
            return;
        }
        finish();
    }

    protected void onDestroy()
    {
        Xlog.d("CredentialStorage", "onDestroy");
        if (sConfigureKeyGuardDialog != null)
            sConfigureKeyGuardDialog = null;
        if (sResetDialog != null)
            sResetDialog = null;
        if (sUnlockDialog != null)
            sUnlockDialog = null;
        super.onDestroy();
    }

    protected void onResume()
    {
        super.onResume();
        if (UserHandle.myUserId() != 0)
        {
            Log.i("CredentialStorage", "Cannot install to CredentialStorage as non-primary user");
            finish();
            return;
        }
        Intent intent = getIntent();
        String s = intent.getAction();
        Xlog.d("CredentialStorage", (new StringBuilder()).append("action: ").append(s).toString());
        if ("com.android.credentials.RESET".equals(s))
        {
            new ResetDialog(null);
            return;
        }
        if ("com.android.credentials.INSTALL".equals(s) && "com.android.certinstaller".equals(getCallingPackage()))
            mInstallBundle = intent.getExtras();
        handleUnlockOrInstall();
    }





/*
    static AlertDialog access$302(AlertDialog alertdialog)
    {
        sResetDialog = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$602(AlertDialog alertdialog)
    {
        sConfigureKeyGuardDialog = alertdialog;
        return alertdialog;
    }

*/



/*
    static int access$702(CredentialStorage credentialstorage, int i)
    {
        credentialstorage.mRetriesRemaining = i;
        return i;
    }

*/



/*
    static AlertDialog access$802(AlertDialog alertdialog)
    {
        sUnlockDialog = alertdialog;
        return alertdialog;
    }

*/

}
