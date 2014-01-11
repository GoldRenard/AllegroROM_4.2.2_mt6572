// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.app.Dialog;
import android.content.*;
import android.os.*;
import android.preference.*;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.Toast;
import com.android.internal.telephony.IccCard;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.*;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            CallSettings

public class FdnSetting2 extends PreferenceActivity
    implements com.android.phone.EditPinPreference.OnPinEnteredListener, android.preference.Preference.OnPreferenceClickListener
{
    private class FdnSetting2BroadcastReceiver extends BroadcastReceiver
    {

        final FdnSetting2 this$0;

        public void onReceive(Context context, Intent intent)
        {
            boolean flag = true;
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                int j;
                if (!intent.getBooleanExtra("state", false) && android.provider.Settings.System.getInt(context.getContentResolver(), "dual_sim_mode_setting", -1) != 0)
                    j = 0;
                else
                    j = ((flag) ? 1 : 0);
                FdnSetting2 fdnsetting2_1 = FdnSetting2.this;
                if (j != 0)
                    flag = false;
                fdnsetting2_1.updateMenuEnableState(flag);
            } else
            {
                if (s.equals("android.intent.action.DUAL_SIM_MODE"))
                {
                    int i;
                    if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) != flag && intent.getIntExtra("mode", -1) != 0)
                        i = 0;
                    else
                        i = ((flag) ? 1 : 0);
                    FdnSetting2 fdnsetting2 = FdnSetting2.this;
                    if (i != 0)
                        flag = false;
                    fdnsetting2.updateMenuEnableState(flag);
                    return;
                }
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
                    if (list.size() == 0)
                    {
                        Xlog.d("Settings/FdnSetting2", "Activity finished");
                        CallSettings.goToOthersSettings(FdnSetting2.this);
                        return;
                    }
                    if (CallSettings.isMultipleSim() && list.size() == flag && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSimId)
                    {
                        Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                        CallSettings.goToOthersSettings(FdnSetting2.this);
                        return;
                    }
                }
            }
        }

        private FdnSetting2BroadcastReceiver()
        {
            this$0 = FdnSetting2.this;
            super();
        }

    }


    private static final String BUTTON_CHANGE_PIN2_KEY = "button_change_pin2_key";
    private static final String BUTTON_FDN_ENABLE_KEY = "button_fdn_enable_key";
    private static final String BUTTON_FDN_LIST_KEY = "button_fdn_list_key";
    private static final int EVENT_PIN2_ENTRY_COMPLETE = 100;
    private static final int GET_SIM_RETRY_EMPTY = -1;
    private static final String LOG_TAG = "Settings/FdnSetting2";
    private static final int MAX_PIN_LENGTH = 8;
    private static final int MIN_PIN_LENGTH = 4;
    private Preference mButtonChangePin2;
    private EditPinPreference mButtonEnableFDN;
    private Preference mButtonFDNList;
    private Handler mFDNHandler;
    private boolean mFdnSupport;
    private Phone mPhone;
    private final BroadcastReceiver mReceiver = new FdnSetting2BroadcastReceiver();
    private int mRetryPin2New;
    private int mRetryPin2Old;
    private int mSimId;

    public FdnSetting2()
    {
        mFdnSupport = true;
        mFDNHandler = new Handler() {

            final FdnSetting2 this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 100: // 'd'
                    if (((AsyncResult)message.obj).exception != null)
                    {
                        if (getRetryPin2Count() == 0)
                        {
                            displayMessage(0x7f0d02b4);
                            Xlog.d("Settings/FdnSetting2", "EVENT_PIN2_ENTRY_COMPLETE,puk2_requested");
                            updateFDNPreference();
                        } else
                        {
                            resetFDNDialog(0x7f0d0290);
                            mButtonEnableFDN.showPinDialog();
                        }
                    } else
                    {
                        updateEnableFDN();
                    }
                    Xlog.d("Settings/FdnSetting2", "EVENT_PIN2_ENTRY_COMPLETE");
                    mRetryPin2Old = mRetryPin2New;
                    Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("EVENT_PIN2_ENTRY_COMPLETE mRetryPin2Old=").append(mRetryPin2Old).toString());
                    return;
                }
            }

            
            {
                this$0 = FdnSetting2.this;
                super();
            }
        }
;
    }

    private boolean checkPhoneBookState()
    {
        boolean flag;
        if (CallSettings.isMultipleSim())
            flag = ((GeminiPhone)mPhone).getIccCardGemini(mSimId).isPhbReady();
        else
            flag = mPhone.getIccCard().isPhbReady();
        if (!flag)
            showTipToast(getString(0x7f0d00cc), getString(0x7f0d0086));
        return flag;
    }

    private void checkPhoneBookStateExit()
    {
        boolean flag;
        if (CallSettings.isMultipleSim())
            flag = ((GeminiPhone)mPhone).getIccCardGemini(mSimId).isPhbReady();
        else
            flag = mPhone.getIccCard().isPhbReady();
        if (!flag)
        {
            showTipToast(getString(0x7f0d00cc), getString(0x7f0d0086));
            finish();
        }
    }

    private void displayMessage(int i)
    {
        Toast.makeText(this, getString(i), 0).show();
    }

    private String getRetryPin2()
    {
        int i = getRetryPin2Count();
        mRetryPin2New = i;
        Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("getRetryPin2 =").append(i).toString());
        switch (i)
        {
        case 1: // '\001'
            return (new StringBuilder()).append("(").append(getString(0x7f0d0141)).append(")").toString();

        case -1: 
            Xlog.d("Settings/FdnSetting2", "getRetryPin2,GET_SIM_RETRY_EMPTY");
            return " ";

        case 0: // '\0'
        default:
            StringBuilder stringbuilder = (new StringBuilder()).append("(");
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            return stringbuilder.append(getString(0x7f0d0142, aobj)).append(")").toString();
        }
    }

    private int getRetryPin2Count()
    {
        String s;
        if (CallSettings.isMultipleSim())
            switch (mSimId)
            {
            case 3: // '\003'
                s = "gsm.sim.retry.pin2.4";
                break;

            case 2: // '\002'
                s = "gsm.sim.retry.pin2.3";
                break;

            case 1: // '\001'
                s = "gsm.sim.retry.pin2.2";
                break;

            case 0: // '\0'
                s = "gsm.sim.retry.pin2";
                break;

            default:
                Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("Error happened mSimId=").append(mSimId).toString());
                s = "gsm.sim.retry.pin2";
                break;
            }
        else
            s = "gsm.sim.retry.pin2";
        return SystemProperties.getInt(s, -1);
    }

    private int getRetryPuk2Count()
    {
        String s;
        if (CallSettings.isMultipleSim())
            switch (mSimId)
            {
            case 3: // '\003'
                s = "gsm.sim.retry.puk2.4";
                break;

            case 2: // '\002'
                s = "gsm.sim.retry.puk2.3";
                break;

            case 1: // '\001'
                s = "gsm.sim.retry.puk2.2";
                break;

            case 0: // '\0'
                s = "gsm.sim.retry.puk2";
                break;

            default:
                Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("Error happened mSimId=").append(mSimId).toString());
                s = "gsm.sim.retry.puk2";
                break;
            }
        else
            s = "gsm.sim.retry.puk2";
        return SystemProperties.getInt(s, -1);
    }

    private void resetFDNDialog(int i)
    {
        if (i != 0)
        {
            mButtonEnableFDN.setDialogMessage((new StringBuilder()).append(getString(i)).append("\n").append(getString(0x7f0d02a8)).append("\n").append(getRetryPin2()).toString());
            return;
        } else
        {
            Xlog.d("Settings/FdnSetting2", "resetFDNDialog 0");
            mButtonEnableFDN.setDialogMessage((new StringBuilder()).append(getString(0x7f0d02a8)).append("\n").append(getRetryPin2()).toString());
            return;
        }
    }

    private void setFDNSupport()
    {
        IccCard icccard;
        if (CallSettings.isMultipleSim())
            icccard = ((GeminiPhone)mPhone).getIccCardGemini(mSimId);
        else
            icccard = mPhone.getIccCard();
        mFdnSupport = icccard.isFDNExist();
        mButtonEnableFDN.setEnabled(mFdnSupport);
        mButtonFDNList.setEnabled(mFdnSupport);
    }

    private void toggleFDNEnable(boolean flag)
    {
        Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("toggleFDNEnable").append(flag).toString());
        if (!flag)
        {
            Xlog.d("Settings/FdnSetting2", "toggleFDNEnable positiveResult is false");
            resetFDNDialog(0);
            mRetryPin2Old = mRetryPin2New;
            Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("toggleFDNEnable mRetryPin2Old=").append(mRetryPin2Old).toString());
            return;
        }
        String s = mButtonEnableFDN.getText();
        if (validatePin(s, false))
        {
            IccCard icccard;
            if (CallSettings.isMultipleSim())
                icccard = ((GeminiPhone)mPhone).getIccCardGemini(mSimId);
            else
                icccard = mPhone.getIccCard();
            boolean flag1 = icccard.getIccFdnEnabled();
            Message message = mFDNHandler.obtainMessage(100);
            boolean flag2;
            if (!flag1)
                flag2 = true;
            else
                flag2 = false;
            icccard.setIccFdnEnabled(flag2, s, message);
        } else
        {
            resetFDNDialog(0x7f0d02af);
            mButtonEnableFDN.setText("");
            mButtonEnableFDN.showPinDialog();
        }
        mButtonEnableFDN.setText("");
    }

    private void updateEnableFDN()
    {
        IccCard icccard;
        if (CallSettings.isMultipleSim())
            icccard = ((GeminiPhone)mPhone).getIccCardGemini(mSimId);
        else
            icccard = mPhone.getIccCard();
        if (icccard.getIccFdnEnabled())
        {
            Xlog.d("Settings/FdnSetting2", "updateEnableFDN is FdnEnabled=2131559027");
            mButtonEnableFDN.setTitle(0x7f0d0275);
            mButtonEnableFDN.setSummary(0x7f0d0270);
            mButtonEnableFDN.setDialogTitle(0x7f0d0273);
        } else
        {
            Xlog.d("Settings/FdnSetting2", "updateEnableFDN is not FdnEnabled=2131559026");
            mButtonEnableFDN.setTitle(0x7f0d0276);
            mButtonEnableFDN.setSummary(0x7f0d0271);
            mButtonEnableFDN.setDialogTitle(0x7f0d0272);
        }
        Xlog.d("Settings/FdnSetting2", "updateEnableFDN");
        resetFDNDialog(0);
    }

    private void updateFDNPreference()
    {
        boolean flag = mPhone instanceof GeminiPhone;
        GeminiPhone geminiphone = null;
        if (flag)
            geminiphone = (GeminiPhone)mPhone;
        if (!geminiphone.isRadioOnGemini(mSimId))
        {
            mButtonEnableFDN.setEnabled(false);
            mButtonFDNList.setEnabled(false);
            mButtonChangePin2.setEnabled(false);
            return;
        }
        if (getRetryPin2Count() == 0)
        {
            mRetryPin2New = 0;
            Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("updateFDNPreference, mRetryPin2New=").append(mRetryPin2New).toString());
            mButtonEnableFDN.setEnabled(false);
            mButtonFDNList.setEnabled(false);
            mButtonChangePin2.setTitle(0x7f0d0144);
            if (getRetryPuk2Count() == 0)
            {
                mButtonChangePin2.setEnabled(false);
                mButtonChangePin2.setSummary(0x7f0d0145);
            } else
            {
                mButtonChangePin2.setEnabled(true);
                mButtonChangePin2.setSummary(0x7f0d02a7);
            }
            updateEnableFDN();
            return;
        } else
        {
            Xlog.d("Settings/FdnSetting2", "updateFDNPreference");
            mButtonEnableFDN.setEnabled(mFdnSupport);
            mButtonChangePin2.setEnabled(true);
            mButtonChangePin2.setTitle(0x7f0d0274);
            mButtonChangePin2.setSummary(0x7f0d0278);
            mButtonFDNList.setEnabled(mFdnSupport);
            updateEnableFDN();
            return;
        }
    }

    private void updateMenuEnableState(boolean flag)
    {
        boolean flag1 = true;
        EditPinPreference editpinpreference = mButtonEnableFDN;
        boolean flag2;
        if (mFdnSupport && flag)
            flag2 = flag1;
        else
            flag2 = false;
        editpinpreference.setEnabled(flag2);
        Preference preference = mButtonFDNList;
        if (!mFdnSupport || !flag)
            flag1 = false;
        preference.setEnabled(flag1);
        mButtonChangePin2.setEnabled(flag);
    }

    private boolean validatePin(String s, boolean flag)
    {
        byte byte0;
        if (flag)
            byte0 = 8;
        else
            byte0 = 4;
        return s != null && s.length() >= byte0 && s.length() <= 8;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f06000f);
        mPhone = PhoneGlobals.getPhone();
        mSimId = getIntent().getIntExtra("simId", -1);
        Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("onCreate,Sim Id ").append(mSimId).toString());
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mButtonEnableFDN = (EditPinPreference)preferencescreen.findPreference("button_fdn_enable_key");
        mButtonChangePin2 = preferencescreen.findPreference("button_change_pin2_key");
        mButtonFDNList = preferencescreen.findPreference("button_fdn_list_key");
        if (mButtonEnableFDN != null)
        {
            mButtonEnableFDN.setOnPinEnteredListener(this);
            mButtonEnableFDN.getEditText().addTextChangedListener(new TextWatcher() {

                int mEndPos;
                int mStartPos;
                CharSequence mTempStr;
                final FdnSetting2 this$0;

                public void afterTextChanged(Editable editable)
                {
                    mStartPos = mButtonEnableFDN.getEditText().getSelectionStart();
                    mEndPos = mButtonEnableFDN.getEditText().getSelectionEnd();
                    if (mTempStr.length() > 8)
                    {
                        editable.delete(-1 + mStartPos, mEndPos);
                        mButtonEnableFDN.getEditText().setText(editable);
                        mButtonEnableFDN.getEditText().setSelection(editable.length());
                    }
                }

                public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                    mTempStr = charsequence;
                }

                public void onTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                }

            
            {
                this$0 = FdnSetting2.this;
                super();
            }
            }
);
        }
        if (mButtonChangePin2 != null)
            mButtonChangePin2.setOnPreferenceClickListener(this);
        if (mButtonFDNList != null)
            mButtonFDNList.setOnPreferenceClickListener(this);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.DUAL_SIM_MODE");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, intentfilter);
        mButtonEnableFDN.initFdnModeData(mPhone, 10, mSimId);
        if (getIntent().getStringExtra("sub_title_name") != null)
            setTitle(getIntent().getStringExtra("sub_title_name"));
        if (bundle != null)
            updateFDNPreference();
        mRetryPin2Old = getRetryPin2Count();
        Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("onCreate,  mRetryPin2Old=").append(mRetryPin2Old).toString());
        checkPhoneBookStateExit();
        setFDNSupport();
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        Xlog.d("Settings/FdnSetting2", "onDestroy");
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPinEntered(EditPinPreference editpinpreference, boolean flag)
    {
        if (editpinpreference == mButtonEnableFDN)
        {
            Xlog.d("Settings/FdnSetting2", "onPinEntered");
            toggleFDNEnable(flag);
        }
    }

    public boolean onPreferenceClick(Preference preference)
    {
        boolean flag;
label0:
        {
            flag = true;
            Xlog.i("Settings/FdnSetting2", preference.getKey());
            if (preference == mButtonChangePin2)
            {
                Intent intent1 = new Intent();
                intent1.putExtra("pin2", flag);
                if (mSimId >= 0)
                    intent1.putExtra("simId", mSimId);
                intent1.setClass(this, com/android/phone/ChangeIccPinScreen);
                startActivity(intent1);
            }
            if (preference == mButtonFDNList)
            {
                Xlog.i("Settings/FdnSetting2", "onPreferenceClick mButtonFDNList");
                if (checkPhoneBookState())
                    break label0;
                flag = false;
            }
            return flag;
        }
        Intent intent = new Intent(this, com/android/phone/FdnList);
        if (mSimId >= 0)
            intent.putExtra("simId", mSimId);
        startActivity(intent);
        return flag;
    }

    protected void onResume()
    {
        super.onResume();
        mPhone = PhoneGlobals.getPhone();
        Xlog.d("Settings/FdnSetting2", "onResume");
        updateFDNPreference();
        Dialog dialog = mButtonEnableFDN.getDialog();
        Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("onResume, mRetryPin2New= ").append(mRetryPin2New).append(" mRetryPin2Old=").append(mRetryPin2Old).toString());
        if (mRetryPin2New != mRetryPin2Old)
        {
            mRetryPin2Old = mRetryPin2New;
            Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("onResume, fdnDialog= ").append(dialog).toString());
            if (dialog != null)
                Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("onResume, fdnDialog.isShowing()=").append(dialog.isShowing()).toString());
            Xlog.d("Settings/FdnSetting2", (new StringBuilder()).append("onResume, second mRetryPin2New= ").append(mRetryPin2New).append(" mRetryPin2Old=").append(mRetryPin2Old).toString());
            if (dialog != null && dialog.isShowing())
            {
                Xlog.d("Settings/FdnSetting2", "onResume, isShowing");
                mButtonEnableFDN.getDialog().dismiss();
            }
        }
    }

    public void showTipToast(String s, String s1)
    {
        Toast.makeText(this, s1, 1).show();
    }










/*
    static int access$702(FdnSetting2 fdnsetting2, int i)
    {
        fdnsetting2.mRetryPin2Old = i;
        return i;
    }

*/


}
