// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import android.widget.EditText;
import android.widget.Toast;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.xlog.Xlog;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.settings:
//            Settings, EditPinPreference, Utils

public class IccLockSettings extends PreferenceActivity
    implements EditPinPreference.OnPinEnteredListener
{

    private static final String DIALOG_ERROR = "dialogError";
    private static final String DIALOG_PIN = "dialogPin";
    private static final String DIALOG_STATE = "dialogState";
    private static final String ENABLE_TO_STATE = "enableState";
    private static final int GET_SIM_RETRY_EMPTY = -100;
    private static final int ICC_LOCK_MODE = 1;
    private static final int ICC_NEW_MODE = 3;
    private static final int ICC_OLD_MODE = 2;
    private static final int ICC_REENTER_MODE = 4;
    private static final int MAX_PIN_LENGTH = 8;
    private static final int MIN_PIN_LENGTH = 4;
    private static final int MSG_CHANGE_ICC_PIN_COMPLETE = 101;
    private static final int MSG_ENABLE_ICC_PIN_COMPLETE = 100;
    private static final int MSG_SIM_STATE_CHANGED = 102;
    private static final String NEW_PINCODE = "newPinCode";
    private static final int OFF_MODE = 0;
    private static final String OLD_PINCODE = "oldPinCode";
    private static final String PIN_DIALOG = "sim_pin";
    private static final String PIN_TOGGLE = "sim_toggle";
    private static final String SIM_ID = "sim_id";
    private static final String TAG = "IccLockSettings";
    private CellConnMgr mCellMgr;
    private int mDialogState;
    private String mError;
    private GeminiPhone mGeminiPhone;
    private Handler mHandler;
    private boolean mIsDeadLocked;
    private boolean mIsShouldBeFinished;
    private boolean mIsUnlockFollow;
    private String mNewPin;
    private String mOldPin;
    private Phone mPhone;
    private String mPin;
    private EditPinPreference mPinDialog;
    private CheckBoxPreference mPinToggle;
    private Resources mRes;
    private Runnable mServiceComplete;
    private int mSimId;
    private final BroadcastReceiver mSimStateReceiver = new BroadcastReceiver() {

        final IccLockSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if ("android.intent.action.SIM_STATE_CHANGED".equals(s))
                mHandler.sendMessage(mHandler.obtainMessage(102));
            else
            if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
            {
                Xlog.d("IccLockSettings", "receive ACTION_SIM_INFO_UPDATE");
                List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(IccLockSettings.this);
                if (list != null)
                {
                    if (list.size() == 0)
                    {
                        Xlog.d("IccLockSettings", (new StringBuilder()).append("Hot swap_simList.size()=").append(list.size()).toString());
                        gobackSettings();
                        return;
                    }
                    if (list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        finish();
                        return;
                    }
                }
            } else
            if (s.equals("android.intent.action.AIRPLANE_MODE") && intent.getBooleanExtra("state", false))
            {
                mCellMgr.handleCellConn(mSimId, 302);
                mPinDialog.setEnabled(false);
                mPinToggle.setEnabled(false);
                return;
            }
        }

            
            {
                this$0 = IccLockSettings.this;
                super();
            }
    }
;
    private boolean mToState;

    public IccLockSettings()
    {
        mDialogState = 0;
        mSimId = -1;
        mIsUnlockFollow = false;
        mIsShouldBeFinished = false;
        mIsDeadLocked = false;
        mHandler = new Handler() {

            final IccLockSettings this$0;

            public void handleMessage(Message message)
            {
                boolean flag = true;
                AsyncResult asyncresult = (AsyncResult)message.obj;
                switch (message.what)
                {
                case 102: // 'f'
                    Xlog.d("IccLockSettings", "MSG_SIM_STATE_CHANGED");
                    updatePreferences();
                    updateOnSimLockStateChanged();
                    return;

                case 101: // 'e'
                    Xlog.d("IccLockSettings", "MSG_CHANGE_ICC_PIN_COMPLETE");
                    IccLockSettings icclocksettings1 = IccLockSettings.this;
                    if (asyncresult.exception != null)
                        flag = false;
                    icclocksettings1.iccPinChanged(flag);
                    return;

                case 100: // 'd'
                    Xlog.d("IccLockSettings", "MSG_ENABLE_ICC_PIN_COMPLETE");
                    IccLockSettings icclocksettings = IccLockSettings.this;
                    if (asyncresult.exception != null)
                        flag = false;
                    icclocksettings.iccLockChanged(flag);
                    return;
                }
            }

            
            {
                this$0 = IccLockSettings.this;
                super();
            }
        }
;
        mServiceComplete = new Runnable() {

            final IccLockSettings this$0;

            public void run()
            {
                int i = mCellMgr.getResult();
                CellConnMgr _tmp = mCellMgr;
                if (i != 0)
                {
                    CellConnMgr _tmp1 = mCellMgr;
                    if (4 != i)
                    {
                        Xlog.d("IccLockSettings", "mCell Mgr Result is not OK");
                        mIsShouldBeFinished = true;
                        finish();
                        return;
                    }
                }
                Xlog.d("IccLockSettings", "mServiceComplete + Enable mPinToggle");
                mPinToggle.setEnabled(true);
                mIsUnlockFollow = false;
            }

            
            {
                this$0 = IccLockSettings.this;
                super();
            }
        }
;
        mCellMgr = new CellConnMgr(mServiceComplete);
    }

    private int dealWith3AppLaunch()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        int i;
        if (list.size() == 0)
            i = -1;
        else
        if (list.size() == 1)
        {
            i = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
        } else
        {
            i = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                if (i > siminfo.mSlot)
                    i = siminfo.mSlot;
            } while (true);
        }
        Xlog.d("IccLockSettings", (new StringBuilder()).append("dealWith3AppLaunch() slotID=").append(i).toString());
        return i;
    }

    private String getRetryPin()
    {
        int i = getRetryPinCount();
        switch (i)
        {
        case -100: 
            return " ";
        }
        StringBuilder stringbuilder = (new StringBuilder()).append(" retry pin ");
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Xlog.d("IccLockSettings", stringbuilder.append(getString(0x7f0b00c7, aobj)).toString());
        Object aobj1[] = new Object[1];
        aobj1[0] = Integer.valueOf(i);
        return getString(0x7f0b00c7, aobj1);
    }

    private int getRetryPinCount()
    {
        if (mSimId == 0)
            return SystemProperties.getInt("gsm.sim.retry.pin1", -100);
        if (1 == mSimId)
            return SystemProperties.getInt("gsm.sim.retry.pin1.2", -100);
        if (2 == mSimId)
            return SystemProperties.getInt("gsm.sim.retry.pin1.3", -100);
        if (3 == mSimId)
        {
            return SystemProperties.getInt("gsm.sim.retry.pin1.4", -100);
        } else
        {
            Xlog.e("IccLockSettings", "getRetryPinCount sim id error");
            return -1;
        }
    }

    private void gobackSettings()
    {
        Intent intent = new Intent(this, com/android/settings/Settings);
        intent.addFlags(0x4000000);
        startActivity(intent);
        finish();
    }

    private void iccLockChanged(boolean flag)
    {
        mPinToggle.setEnabled(true);
        if (flag)
        {
            mPinToggle.setChecked(mToState);
        } else
        {
            Toast.makeText(this, mRes.getString(0x7f0b0538), 0).show();
            noRetryPinAvailable();
        }
        resetDialogState();
    }

    private void iccPinChanged(boolean flag)
    {
        if (!flag)
        {
            Toast.makeText(this, mRes.getString(0x7f0b0536), 0).show();
            noRetryPinAvailable();
        } else
        {
            Toast.makeText(this, mRes.getString(0x7f0b0537), 0).show();
        }
        resetDialogState();
    }

    private boolean noRetryPinAvailable()
    {
        boolean flag;
label0:
        {
            if (getRetryPinCount() != 0)
            {
                int i = getRetryPinCount();
                flag = false;
                if (i != -100)
                    break label0;
            }
            Xlog.d("IccLockSettings", (new StringBuilder()).append("getRetryPinCount() = ").append(getRetryPinCount()).toString());
            mPinToggle.setEnabled(false);
            mIsDeadLocked = true;
            flag = true;
        }
        return flag;
    }

    private boolean reasonablePin(String s)
    {
        return s != null && s.length() >= 4 && s.length() <= 8;
    }

    private void resetDialogState()
    {
        mError = null;
        mDialogState = 2;
        mPin = "";
        setDialogValues();
        mDialogState = 0;
    }

    private void setDialogValues()
    {
        mPinDialog.setText(mPin);
        String s = "";
        switch (mDialogState)
        {
        case 4: // '\004'
            String s5 = mRes.getString(0x7f0b0532);
            s = (new StringBuilder()).append(s5).append(" ").append(mRes.getString(0x7f0b00c6)).toString();
            mPinDialog.setDialogTitle(mRes.getString(0x7f0b0533));
            break;

        case 3: // '\003'
            String s4 = mRes.getString(0x7f0b0531);
            s = (new StringBuilder()).append(s4).append(" ").append(mRes.getString(0x7f0b00c6)).toString();
            mPinDialog.setDialogTitle(mRes.getString(0x7f0b0533));
            break;

        case 2: // '\002'
            String s3 = mRes.getString(0x7f0b0530);
            s = (new StringBuilder()).append(s3).append(" ").append(mRes.getString(0x7f0b00c6)).toString();
            mPinDialog.setDialogTitle((new StringBuilder()).append(mRes.getString(0x7f0b0533)).append("  ").append(getRetryPin()).toString());
            break;

        case 1: // '\001'
            String s1 = mRes.getString(0x7f0b052d);
            s = (new StringBuilder()).append(s1).append(" ").append(mRes.getString(0x7f0b00c6)).toString();
            EditPinPreference editpinpreference = mPinDialog;
            StringBuilder stringbuilder = new StringBuilder();
            String s2;
            if (mToState)
                s2 = mRes.getString(0x7f0b052e);
            else
                s2 = mRes.getString(0x7f0b052f);
            editpinpreference.setDialogTitle(stringbuilder.append(s2).append("  ").append(getRetryPin()).toString());
            break;
        }
        if (mError != null)
        {
            s = (new StringBuilder()).append(mError).append("\n").append(s).toString();
            mError = null;
        }
        mPinDialog.setDialogMessage(s);
    }

    private void showPinDialog()
    {
        if (mDialogState == 0)
        {
            return;
        } else
        {
            setDialogValues();
            mPinDialog.showPinDialog();
            return;
        }
    }

    private void tryChangeIccLockState()
    {
        Message message = Message.obtain(mHandler, 100);
        mGeminiPhone.getIccCardGemini(mSimId).setIccLockEnabled(mToState, mPin, message);
        mPinToggle.setEnabled(false);
    }

    private void tryChangePin()
    {
        Message message = Message.obtain(mHandler, 101);
        mGeminiPhone.getIccCardGemini(mSimId).changeIccLockPassword(mOldPin, mNewPin, message);
    }

    private void updateOnSimLockStateChanged()
    {
        Xlog.d("IccLockSettings", (new StringBuilder()).append("updateOnSimLockStateChanged()+mIsDeadLocked=").append(mIsDeadLocked).toString());
        if (getRetryPinCount() > 0 && mIsDeadLocked)
        {
            Xlog.d("IccLockSettings", "Restore state");
            mPinToggle.setEnabled(true);
            mIsDeadLocked = false;
            resetDialogState();
        }
    }

    private void updatePreferences()
    {
        mPinToggle.setChecked(isIccLockEnabled());
    }

    String getSummary(Context context)
    {
        Resources resources = context.getResources();
        if (isIccLockEnabled())
            return resources.getString(0x7f0b052a);
        else
            return resources.getString(0x7f0b052b);
    }

    boolean isIccLockEnabled()
    {
        return mGeminiPhone.getIccCardGemini(mSimId).getIccLockEnabled();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.d("IccLockSettings", "onCreate");
        if (Utils.isMonkeyRunning())
        {
            finish();
            return;
        }
        addPreferencesFromResource(0x7f050035);
        mCellMgr.register(this);
        mSimId = getIntent().getIntExtra("slotid", -1);
        Xlog.d("IccLockSettings", (new StringBuilder()).append("mSimId is : ").append(mSimId).toString());
        if (mSimId == -1)
            mSimId = dealWith3AppLaunch();
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSimId);
        int i = android.provider.Telephony.SIMInfo.getInsertedSIMCount(this);
        String s = null;
        if (i > 1)
        {
            s = null;
            if (siminfo != null)
                s = siminfo.mDisplayName;
        }
        if (s != null && !s.equals(""))
            setTitle(s);
        mPinDialog = (EditPinPreference)findPreference("sim_pin");
        mPinToggle = (CheckBoxPreference)findPreference("sim_toggle");
        Xlog.d("IccLockSettings", (new StringBuilder()).append("mDialogState is : ").append(mDialogState).toString());
        if (bundle != null && bundle.containsKey("dialogState"))
        {
            mDialogState = bundle.getInt("dialogState");
            mPin = bundle.getString("dialogPin");
            mError = bundle.getString("dialogError");
            mToState = bundle.getBoolean("enableState");
            Xlog.d("IccLockSettings", (new StringBuilder()).append("mDialogState is : ").append(mDialogState).toString());
            Xlog.d("IccLockSettings", (new StringBuilder()).append("mPin is : ").append(mPin).toString());
            Xlog.d("IccLockSettings", (new StringBuilder()).append("mError is : ").append(mError).toString());
            Xlog.d("IccLockSettings", (new StringBuilder()).append("mToState  is : ").append(mToState).toString());
            switch (mDialogState)
            {
            case 4: // '\004'
                mOldPin = bundle.getString("oldPinCode");
                mNewPin = bundle.getString("newPinCode");
                Xlog.d("IccLockSettings", (new StringBuilder()).append("mOldPin  is : ").append(mOldPin).toString());
                Xlog.d("IccLockSettings", (new StringBuilder()).append("mNewPin   is : ").append(mNewPin).toString());
                break;

            case 3: // '\003'
                mOldPin = bundle.getString("oldPinCode");
                Xlog.d("IccLockSettings", (new StringBuilder()).append("mOldPin  is : ").append(mOldPin).toString());
                break;
            }
        }
        mPinDialog.setOnPinEnteredListener(this);
        getPreferenceScreen().setPersistent(false);
        mGeminiPhone = (GeminiPhone)PhoneFactory.getDefaultPhone();
        mRes = getResources();
        updatePreferences();
    }

    protected void onDestroy()
    {
        super.onDestroy();
        Xlog.d("IccLockSettings", "onDestroy");
        mCellMgr.unregister();
    }

    protected void onPause()
    {
        super.onPause();
        Xlog.d("IccLockSettings", "onPause");
        unregisterReceiver(mSimStateReceiver);
    }

    public void onPinEntered(EditPinPreference editpinpreference, boolean flag)
    {
        if (!flag)
        {
            resetDialogState();
            return;
        }
        mPin = editpinpreference.getText();
        if (!reasonablePin(mPin))
        {
            mError = mRes.getString(0x7f0b0534);
            showPinDialog();
            return;
        }
        switch (mDialogState)
        {
        case 4: // '\004'
            if (!mPin.equals(mNewPin))
            {
                mError = mRes.getString(0x7f0b0535);
                mDialogState = 3;
                mPin = null;
                showPinDialog();
                return;
            } else
            {
                mError = null;
                tryChangePin();
                return;
            }

        case 3: // '\003'
            mNewPin = mPin;
            mDialogState = 4;
            mPin = null;
            showPinDialog();
            return;

        case 2: // '\002'
            mOldPin = mPin;
            mDialogState = 3;
            mError = null;
            mPin = null;
            showPinDialog();
            return;

        case 1: // '\001'
            tryChangeIccLockState();
            return;
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mPinToggle)
        {
            mToState = mPinToggle.isChecked();
            CheckBoxPreference checkboxpreference = mPinToggle;
            boolean flag = mToState;
            boolean flag1 = false;
            if (!flag)
                flag1 = true;
            checkboxpreference.setChecked(flag1);
            mDialogState = 1;
            showPinDialog();
        } else
        if (preference == mPinDialog)
        {
            mDialogState = 2;
            return false;
        }
        return true;
    }

    protected void onResume()
    {
        super.onResume();
        Xlog.d("IccLockSettings", "onResume");
        Xlog.d("IccLockSettings", (new StringBuilder()).append("mIsShouldBeFinished: ").append(mIsShouldBeFinished).toString());
        if (mIsShouldBeFinished)
        {
            finish();
            return;
        }
        if (!mIsUnlockFollow)
        {
            mIsUnlockFollow = true;
            mPinToggle.setEnabled(false);
            if (getRetryPinCount() != 0 && getRetryPinCount() != -100)
            {
                Xlog.d("IccLockSettings", "OnResume: postDelay call - handleCellConn 2");
                mHandler.postDelayed(new Runnable() {

                    final IccLockSettings this$0;

                    public void run()
                    {
                        mCellMgr.handleCellConn(mSimId, 302);
                    }

            
            {
                this$0 = IccLockSettings.this;
                super();
            }
                }
, 500L);
            } else
            {
                Xlog.d("IccLockSettings", "OnResume: postDelay call - handleCellConn 1");
                mHandler.postDelayed(new Runnable() {

                    final IccLockSettings this$0;

                    public void run()
                    {
                        mCellMgr.handleCellConn(mSimId, 0x8000012e);
                    }

            
            {
                this$0 = IccLockSettings.this;
                super();
            }
                }
, 500L);
            }
        }
        IntentFilter intentfilter = new IntentFilter("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
        registerReceiver(mSimStateReceiver, intentfilter);
        if (mDialogState != 0)
        {
            showPinDialog();
            return;
        } else
        {
            resetDialogState();
            return;
        }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        if (mPinDialog.isDialogOpen())
        {
            bundle.putInt("dialogState", mDialogState);
            bundle.putString("dialogPin", mPinDialog.getEditText().getText().toString());
            bundle.putString("dialogError", mError);
            bundle.putBoolean("enableState", mToState);
            bundle.putInt("sim_id", mSimId);
            switch (mDialogState)
            {
            case 4: // '\004'
                bundle.putString("oldPinCode", mOldPin);
                bundle.putString("newPinCode", mNewPin);
                return;

            case 3: // '\003'
                bundle.putString("oldPinCode", mOldPin);
                return;
            }
            return;
        } else
        {
            super.onSaveInstanceState(bundle);
            return;
        }
    }




/*
    static boolean access$1002(IccLockSettings icclocksettings, boolean flag)
    {
        icclocksettings.mIsShouldBeFinished = flag;
        return flag;
    }

*/


/*
    static boolean access$1102(IccLockSettings icclocksettings, boolean flag)
    {
        icclocksettings.mIsUnlockFollow = flag;
        return flag;
    }

*/








}
