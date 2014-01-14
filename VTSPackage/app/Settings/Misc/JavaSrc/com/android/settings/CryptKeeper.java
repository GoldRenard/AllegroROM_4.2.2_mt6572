// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.StatusBarManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.media.AudioManager;
import android.os.*;
import android.os.storage.IMountService;
import android.telephony.TelephonyManager;
import android.text.*;
import android.util.Log;
import android.view.*;
import android.view.inputmethod.*;
import android.widget.*;
import com.android.internal.telephony.ITelephony;
import com.mediatek.xlog.Xlog;
import java.util.Iterator;
import java.util.List;

public class CryptKeeper extends Activity
    implements android.widget.TextView.OnEditorActionListener, android.view.View.OnKeyListener, android.view.View.OnTouchListener, TextWatcher
{
    private class DecryptTask extends AsyncTask
    {

        final CryptKeeper this$0;

        protected transient Integer doInBackground(String as[])
        {
            IMountService imountservice = getMountService();
            Integer integer;
            try
            {
                integer = Integer.valueOf(imountservice.decryptStorage(as[0]));
            }
            catch (Exception exception)
            {
                Log.e("CryptKeeper", "Error while decrypting...", exception);
                return Integer.valueOf(-1);
            }
            return integer;
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((String[])aobj);
        }

        protected void onPostExecute(Integer integer)
        {
            Log.d("CryptKeeper", (new StringBuilder()).append("failedAttempts: ").append(integer).toString());
            if (integer.intValue() == 0)
            {
                Intent intent = new Intent(CryptKeeper.this, com/android/settings/CryptKeeper$FadeToBlack);
                finish();
                startActivity(intent);
                return;
            }
            if (integer.intValue() == 30)
            {
                sendBroadcast(new Intent("android.intent.action.MASTER_CLEAR"));
                return;
            }
            if (integer.intValue() % 10 == 0)
            {
                mCooldown = 30;
                cooldown();
                return;
            } else
            {
                ((TextView)findViewById(0x7f08000e)).setText(0x7f0b0856);
                mPasswordEntry.setEnabled(true);
                return;
            }
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Integer)obj);
        }

        private DecryptTask()
        {
            this$0 = CryptKeeper.this;
            super();
        }

    }

    public static class FadeToBlack extends Activity
    {

        public void onBackPressed()
        {
        }

        public void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            setContentView(0x7f04001c);
        }

    }

    private static class NonConfigurationInstanceState
    {

        final android.os.PowerManager.WakeLock wakelock;

        NonConfigurationInstanceState(android.os.PowerManager.WakeLock wakelock1)
        {
            wakelock = wakelock1;
        }
    }

    private class ValidationTask extends AsyncTask
    {

        final CryptKeeper this$0;

        protected transient Boolean doInBackground(Void avoid[])
        {
            int i;
            boolean flag;
            IMountService imountservice = getMountService();
            Boolean boolean1;
            try
            {
                Log.d("CryptKeeper", "Validating encryption state.");
                i = imountservice.getEncryptionState();
            }
            catch (RemoteException remoteexception)
            {
                Log.w("CryptKeeper", "Unable to get encryption state properly");
                return Boolean.valueOf(true);
            }
            if (i != 1) goto _L2; else goto _L1
_L1:
            Log.w("CryptKeeper", "Unexpectedly in CryptKeeper even though there is no encryption.");
            return Boolean.valueOf(true);
_L3:
            boolean1 = Boolean.valueOf(flag);
            return boolean1;
_L5:
            flag = false;
              goto _L3
_L2:
            if (i != 0) goto _L5; else goto _L4
_L4:
            flag = true;
              goto _L3
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected void onPostExecute(Boolean boolean1)
        {
            mValidationComplete = true;
            if (Boolean.FALSE.equals(boolean1))
            {
                Log.w("CryptKeeper", "Incomplete, or corrupted encryption detected. Prompting user to wipe.");
                mEncryptionGoneBad = true;
            } else
            {
                Log.d("CryptKeeper", "Encryption state validated. Proceeding to configure UI");
            }
            setupUi();
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Boolean)obj);
        }

        private ValidationTask()
        {
            this$0 = CryptKeeper.this;
            super();
        }

    }


    static final String ACTION_EMERGENCY_DIAL = "com.android.phone.EmergencyDialer.DIAL";
    private static final int COOL_DOWN_ATTEMPTS = 10;
    private static final int COOL_DOWN_INTERVAL = 30;
    private static final String DECRYPT_STATE = "trigger_restart_framework";
    private static final String EXTRA_FORCE_VIEW = "com.android.settings.CryptKeeper.DEBUG_FORCE_VIEW";
    private static final String FORCE_VIEW_ERROR = "error";
    private static final String FORCE_VIEW_PASSWORD = "password";
    private static final String FORCE_VIEW_PROGRESS = "progress";
    private static final int MAX_FAILED_ATTEMPTS = 30;
    private static final int MESSAGE_COOLDOWN = 2;
    private static final int MESSAGE_NOTIFY = 3;
    private static final int MESSAGE_UPDATE_PROGRESS = 1;
    private static final String TAG = "CryptKeeper";
    private static final int sWidgetsToDisable = 0x1370000;
    private AudioManager mAudioManager;
    private int mCooldown;
    private boolean mEncryptionGoneBad;
    private final Handler mHandler = new Handler() {

        final CryptKeeper this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 3: // '\003'
                notifyUser();
                return;

            case 2: // '\002'
                cooldown();
                return;

            case 1: // '\001'
                updateProgress();
                return;
            }
        }

            
            {
                this$0 = CryptKeeper.this;
                super();
            }
    }
;
    private boolean mIgnoreBack;
    private int mNotificationCountdown;
    private EditText mPasswordEntry;
    private StatusBarManager mStatusBar;
    private boolean mValidationComplete;
    private boolean mValidationRequested;
    android.os.PowerManager.WakeLock mWakeLock;

    public CryptKeeper()
    {
        mIgnoreBack = false;
        mNotificationCountdown = 0;
    }

    private void cooldown()
    {
        TextView textview = (TextView)findViewById(0x7f08000e);
        if (mCooldown <= 0)
        {
            mPasswordEntry.setEnabled(true);
            setBackFunctionality(true);
            textview.setText(0x7f0b0855);
            return;
        } else
        {
            CharSequence charsequence = getText(0x7f0b038d);
            CharSequence acharsequence[] = new CharSequence[1];
            acharsequence[0] = Integer.toString(mCooldown);
            textview.setText(TextUtils.expandTemplate(charsequence, acharsequence));
            mCooldown = -1 + mCooldown;
            mHandler.removeMessages(2);
            mHandler.sendEmptyMessageDelayed(2, 1000L);
            return;
        }
    }

    private void delayAudioNotification()
    {
        Log.d("CryptKeeper", "User entering password: delay audio notification");
        mNotificationCountdown = 20;
    }

    private void encryptionProgressInit()
    {
        Log.d("CryptKeeper", "Encryption progress screen initializing.");
        if (mWakeLock == null)
        {
            Log.d("CryptKeeper", "Acquiring wakelock.");
            mWakeLock = ((PowerManager)getSystemService("power")).newWakeLock(26, "CryptKeeper");
            mWakeLock.acquire();
        }
        ((ProgressBar)findViewById(0x7f080040)).setIndeterminate(true);
        setBackFunctionality(false);
        updateProgress();
    }

    private IMountService getMountService()
    {
        android.os.IBinder ibinder = ServiceManager.getService("mount");
        if (ibinder != null)
            return android.os.storage.IMountService.Stub.asInterface(ibinder);
        else
            return null;
    }

    private boolean hasMultipleEnabledIMEsOrSubtypes(InputMethodManager inputmethodmanager, boolean flag)
    {
        boolean flag1;
label0:
        {
            List list = inputmethodmanager.getEnabledInputMethodList();
            int i = 0;
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                InputMethodInfo inputmethodinfo = (InputMethodInfo)iterator.next();
                if (i > 1)
                    return true;
                List list1 = inputmethodmanager.getEnabledInputMethodSubtypeList(inputmethodinfo, true);
                if (list1.isEmpty())
                {
                    i++;
                } else
                {
                    int k = 0;
                    Iterator iterator1 = list1.iterator();
                    do
                    {
                        if (!iterator1.hasNext())
                            break;
                        if (((InputMethodSubtype)iterator1.next()).isAuxiliary())
                            k++;
                    } while (true);
                    if (list1.size() - k > 0 || flag && k > 1)
                        i++;
                }
            } while (true);
            if (i <= 1)
            {
                int j = inputmethodmanager.getEnabledInputMethodSubtypeList(null, false).size();
                flag1 = false;
                if (j <= 1)
                    break label0;
            }
            flag1 = true;
        }
        return flag1;
    }

    private boolean isDebugView()
    {
        return getIntent().hasExtra("com.android.settings.CryptKeeper.DEBUG_FORCE_VIEW");
    }

    private boolean isDebugView(String s)
    {
        return s.equals(getIntent().getStringExtra("com.android.settings.CryptKeeper.DEBUG_FORCE_VIEW"));
    }

    private boolean isEmergencyCallCapable()
    {
        return getResources().getBoolean(0x1110030);
    }

    private void keepColorWithTheme()
    {
        TextView textview = (TextView)findViewById(0x7f080024);
        int i = getResources().getThemeMainColor();
        if (i != 0 && textview != null)
            textview.setTextColor(i);
    }

    private void launchEmergencyDialer()
    {
        Intent intent = new Intent("com.android.phone.EmergencyDialer.DIAL");
        intent.setFlags(0x10800000);
        startActivity(intent);
    }

    private void notifyUser()
    {
        if (mNotificationCountdown <= 0) goto _L2; else goto _L1
_L1:
        Log.d("CryptKeeper", (new StringBuilder()).append("Counting down to notify user...").append(mNotificationCountdown).toString());
        mNotificationCountdown = -1 + mNotificationCountdown;
_L4:
        mHandler.removeMessages(3);
        mHandler.sendEmptyMessageDelayed(3, 5000L);
        return;
_L2:
        if (mAudioManager != null)
        {
            Log.d("CryptKeeper", "Notifying user that we are waiting for input...");
            try
            {
                mAudioManager.playSoundEffect(5, 100F);
            }
            catch (Exception exception)
            {
                Log.w("CryptKeeper", (new StringBuilder()).append("notifyUser: Exception while playing sound: ").append(exception).toString());
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    private void passwordEntryInit()
    {
        mPasswordEntry = (EditText)findViewById(0x7f08003d);
        mPasswordEntry.setOnEditorActionListener(this);
        mPasswordEntry.requestFocus();
        mPasswordEntry.setOnKeyListener(this);
        mPasswordEntry.setOnTouchListener(this);
        mPasswordEntry.addTextChangedListener(this);
        if (!((TelephonyManager)getSystemService("phone")).isVoiceCapable())
        {
            View view1 = findViewById(0x7f08003a);
            if (view1 != null)
            {
                Log.d("CryptKeeper", "Removing the emergency Call button");
                view1.setVisibility(8);
            }
        }
        View view = findViewById(0x7f08003e);
        final InputMethodManager imm = (InputMethodManager)getSystemService("input_method");
        if (view != null && hasMultipleEnabledIMEsOrSubtypes(imm, false))
        {
            view.setVisibility(0);
            view.setOnClickListener(new android.view.View.OnClickListener() {

                final CryptKeeper this$0;
                final InputMethodManager val$imm;

                public void onClick(View view2)
                {
                    imm.showInputMethodPicker();
                }

            
            {
                this$0 = CryptKeeper.this;
                imm = inputmethodmanager;
                super();
            }
            }
);
        }
        if (mWakeLock == null)
        {
            Log.d("CryptKeeper", "Acquiring wakelock.");
            PowerManager powermanager = (PowerManager)getSystemService("power");
            if (powermanager != null)
            {
                mWakeLock = powermanager.newWakeLock(26, "CryptKeeper");
                mWakeLock.acquire();
            }
        }
        mHandler.postDelayed(new Runnable() {

            final CryptKeeper this$0;
            final InputMethodManager val$imm;

            public void run()
            {
                imm.showSoftInputUnchecked(0, null);
            }

            
            {
                this$0 = CryptKeeper.this;
                imm = inputmethodmanager;
                super();
            }
        }
, 0L);
        updateEmergencyCallButtonState();
        mHandler.removeMessages(3);
        mHandler.sendEmptyMessageDelayed(3, 0x1d4c0L);
    }

    private void resumeCall()
    {
        ITelephony itelephony;
        itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone"));
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_21;
        itelephony.showCallScreen();
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("CryptKeeper", (new StringBuilder()).append("Error calling ITelephony service: ").append(remoteexception).toString());
        return;
    }

    private final void setAirplaneModeIfNecessary()
    {
        boolean flag;
        if (TelephonyManager.getDefault().getLteOnCdmaMode() == 1)
            flag = true;
        else
            flag = false;
        if (!flag)
        {
            Log.d("CryptKeeper", "Going into airplane mode.");
            android.provider.Settings.Global.putInt(getContentResolver(), "airplane_mode_on", 1);
            Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
            intent.putExtra("state", true);
            sendBroadcastAsUser(intent, UserHandle.ALL);
        }
    }

    private final void setBackFunctionality(boolean flag)
    {
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        mIgnoreBack = flag1;
        if (flag)
        {
            mStatusBar.disable(0x1370000);
            return;
        } else
        {
            mStatusBar.disable(0x1770000);
            return;
        }
    }

    private void setupUi()
    {
        if (!mEncryptionGoneBad && !isDebugView("error"))
        {
            if ("".equals(SystemProperties.get("vold.encrypt_progress")) && !isDebugView("progress"))
            {
                if (!mValidationComplete && !isDebugView("password"))
                {
                    if (!mValidationRequested)
                    {
                        (new ValidationTask()).execute((Void[])null);
                        mValidationRequested = true;
                        return;
                    }
                } else
                {
                    setContentView(0x7f04001e);
                    passwordEntryInit();
                    return;
                }
            } else
            {
                setContentView(0x7f040020);
                keepColorWithTheme();
                encryptionProgressInit();
                return;
            }
        } else
        {
            setContentView(0x7f040020);
            keepColorWithTheme();
            showFactoryReset();
        }
    }

    private void showFactoryReset()
    {
        findViewById(0x7f08003b).setVisibility(8);
        Button button = (Button)findViewById(0x7f080041);
        button.setVisibility(0);
        button.setOnClickListener(new android.view.View.OnClickListener() {

            final CryptKeeper this$0;

            public void onClick(View view1)
            {
                sendBroadcast(new Intent("android.intent.action.MASTER_CLEAR"));
            }

            
            {
                this$0 = CryptKeeper.this;
                super();
            }
        }
);
        ((TextView)findViewById(0x7f080024)).setText(0x7f0b038f);
        ((TextView)findViewById(0x7f08000e)).setText(0x7f0b0390);
        View view = findViewById(0x7f080042);
        if (view != null)
            view.setVisibility(0);
    }

    private void takeEmergencyCallAction()
    {
        if (TelephonyManager.getDefault().getCallState() == 2)
        {
            resumeCall();
            return;
        } else
        {
            launchEmergencyDialer();
            return;
        }
    }

    private void updateEmergencyCallButtonState()
    {
        Button button = (Button)findViewById(0x7f08003a);
        if (button == null)
            return;
        if (isEmergencyCallCapable())
        {
            button.setVisibility(0);
            button.setOnClickListener(new android.view.View.OnClickListener() {

                final CryptKeeper this$0;

                public void onClick(View view)
                {
                    takeEmergencyCallAction();
                }

            
            {
                this$0 = CryptKeeper.this;
                super();
            }
            }
);
            int i;
            if (TelephonyManager.getDefault().getCallState() == 2)
            {
                i = 0x7f0b08d3;
                button.setCompoundDrawablesWithIntrinsicBounds(0x7f0200d6, 0, 0, 0);
            } else
            {
                i = 0x7f0b08d2;
                button.setCompoundDrawablesWithIntrinsicBounds(0x7f020061, 0, 0, 0);
            }
            button.setText(i);
            return;
        } else
        {
            button.setVisibility(8);
            return;
        }
    }

    private void updateProgress()
    {
        String s;
        s = SystemProperties.get("vold.encrypt_progress");
        if ("error_partially_encrypted".equals(s))
        {
            showFactoryReset();
            return;
        }
        boolean flag = isDebugView();
        if (!flag) goto _L2; else goto _L1
_L1:
        int i = 50;
_L4:
        CharSequence charsequence = getText(0x7f0b038c);
        Log.v("CryptKeeper", (new StringBuilder()).append("Encryption progress: ").append(i).toString());
        TextView textview = (TextView)findViewById(0x7f08000e);
        if (textview != null)
        {
            CharSequence acharsequence[] = new CharSequence[1];
            acharsequence[0] = Integer.toString(i);
            textview.setText(TextUtils.expandTemplate(charsequence, acharsequence));
        }
        mHandler.removeMessages(1);
        mHandler.sendEmptyMessageDelayed(1, 5000L);
        return;
_L2:
        int j = Integer.parseInt(s);
        i = j;
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        Log.w("CryptKeeper", (new StringBuilder()).append("Error parsing progress: ").append(exception.toString()).toString());
        i = 0;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void afterTextChanged(Editable editable)
    {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void onBackPressed()
    {
        Xlog.i("CryptKeeper", (new StringBuilder()).append("mIgnoreBack :").append(mIgnoreBack).toString());
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        String s = SystemProperties.get("vold.decrypt");
        if (isDebugView() || !"".equals(s) && !"trigger_restart_framework".equals(s))
        {
            mStatusBar = (StatusBarManager)getSystemService("statusbar");
            mStatusBar.disable(0x1370000);
            setAirplaneModeIfNecessary();
            mAudioManager = (AudioManager)getSystemService("audio");
            Object obj = getLastNonConfigurationInstance();
            if (obj instanceof NonConfigurationInstanceState)
            {
                mWakeLock = ((NonConfigurationInstanceState)obj).wakelock;
                Log.d("CryptKeeper", "Restoring wakelock from NonConfigurationInstanceState");
                return;
            }
        } else
        {
            getPackageManager().setComponentEnabledSetting(new ComponentName(this, com/android/settings/CryptKeeper), 2, 1);
            finish();
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mWakeLock != null)
        {
            Log.d("CryptKeeper", "Releasing and destroying wakelock");
            mWakeLock.release();
            mWakeLock = null;
        }
    }

    public boolean onEditorAction(TextView textview, int i, KeyEvent keyevent)
    {
        String s;
label0:
        {
            boolean flag;
label1:
            {
                if (i != 0)
                {
                    flag = false;
                    if (i != 6)
                        break label1;
                }
                s = textview.getText().toString();
                if (!TextUtils.isEmpty(s))
                    break label0;
                flag = true;
            }
            return flag;
        }
        textview.setText(null);
        mPasswordEntry.setEnabled(false);
        setBackFunctionality(false);
        Log.d("CryptKeeper", "Attempting to send command to decrypt");
        (new DecryptTask()).execute(new String[] {
            s
        });
        return true;
    }

    public boolean onKey(View view, int i, KeyEvent keyevent)
    {
        delayAudioNotification();
        return false;
    }

    public Object onRetainNonConfigurationInstance()
    {
        NonConfigurationInstanceState nonconfigurationinstancestate = new NonConfigurationInstanceState(mWakeLock);
        Log.d("CryptKeeper", "Handing wakelock off to NonConfigurationInstanceState");
        mWakeLock = null;
        return nonconfigurationinstancestate;
    }

    public void onStart()
    {
        super.onStart();
        setupUi();
    }

    public void onStop()
    {
        super.onStop();
        mHandler.removeMessages(2);
        mHandler.removeMessages(1);
        mHandler.removeMessages(3);
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        delayAudioNotification();
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        delayAudioNotification();
        return false;
    }



/*
    static int access$102(CryptKeeper cryptkeeper, int i)
    {
        cryptkeeper.mCooldown = i;
        return i;
    }

*/





/*
    static boolean access$402(CryptKeeper cryptkeeper, boolean flag)
    {
        cryptkeeper.mValidationComplete = flag;
        return flag;
    }

*/


/*
    static boolean access$502(CryptKeeper cryptkeeper, boolean flag)
    {
        cryptkeeper.mEncryptionGoneBad = flag;
        return flag;
    }

*/



}
