// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.*;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.view.MenuItem;
import android.view.Window;
import android.widget.Toast;
import com.android.internal.telephony.*;
import com.mediatek.settings.CallSettings;

// Referenced classes of package com.android.phone:
//            EditPinPreference, PhoneGlobals

public class FdnSetting extends PreferenceActivity
    implements EditPinPreference.OnPinEnteredListener, android.content.DialogInterface.OnCancelListener
{

    private static final String BUTTON_CHANGE_PIN2_KEY = "button_change_pin2_key";
    private static final String BUTTON_FDN_ENABLE_KEY = "button_fdn_enable_key";
    private static final boolean DBG = false;
    private static final String DIALOG_MESSAGE_KEY = "dialog_message_key";
    private static final String DIALOG_PIN_ENTRY_KEY = "dialog_pin_entry_key";
    private static final int EVENT_PIN2_CHANGE_COMPLETE = 200;
    private static final int EVENT_PIN2_ENTRY_COMPLETE = 100;
    private static final String LOG_TAG = "PhoneGlobals";
    private static final int MAX_PIN_LENGTH = 8;
    private static final int MIN_PIN_LENGTH = 4;
    private static final String NEW_PIN_KEY = "new_pin_key";
    private static final String OLD_PIN_KEY = "old_pin_key";
    private static final int PIN_CHANGE_NEW = 1;
    private static final int PIN_CHANGE_NEW_PIN_FOR_PUK = 4;
    private static final int PIN_CHANGE_OLD = 0;
    private static final int PIN_CHANGE_PUK = 3;
    private static final int PIN_CHANGE_REENTER = 2;
    private static final int PIN_CHANGE_REENTER_PIN_FOR_PUK = 5;
    private static final String PIN_CHANGE_STATE_KEY = "pin_change_state_key";
    private static final String SKIP_OLD_PIN_KEY = "skip_old_pin_key";
    private EditPinPreference mButtonChangePin2;
    private EditPinPreference mButtonEnableFDN;
    private final Handler mFDNHandler = new Handler() {

        final FdnSetting this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 200: 
                AsyncResult asyncresult1 = (AsyncResult)message.obj;
                if (asyncresult1.exception != null)
                {
                    if (((CommandException)asyncresult1.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.SIM_PUK2)
                    {
                        AlertDialog alertdialog = (new android.app.AlertDialog.Builder(FdnSetting.this)).setMessage(0x7f0d02b4).setCancelable(true).setOnCancelListener(FdnSetting.this).create();
                        alertdialog.getWindow().addFlags(2);
                        alertdialog.show();
                        return;
                    }
                    if (!mIsPuk2Locked)
                    {
                        displayMessage(0x7f0d02ad);
                        resetPinChangeState();
                        return;
                    } else
                    {
                        displayMessage(0x7f0d02ac);
                        resetPinChangeStateForPUK2();
                        return;
                    }
                } else
                {
                    displayMessage(0x7f0d02b1);
                    resetPinChangeState();
                    return;
                }

            case 100: // 'd'
                AsyncResult asyncresult = (AsyncResult)message.obj;
                if (asyncresult.exception != null)
                    if (((CommandException)asyncresult.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.SIM_PUK2)
                    {
                        displayMessage(0x7f0d02b3);
                        resetPinChangeStateForPUK2();
                    } else
                    {
                        displayMessage(0x7f0d0290);
                    }
                updateEnableFDN();
                return;
            }
        }

            
            {
                this$0 = FdnSetting.this;
                super();
            }
    }
;
    private boolean mIsPuk2Locked;
    private String mNewPin;
    private String mOldPin;
    private Phone mPhone;
    private int mPinChangeState;
    private String mPuk2;


    private final void displayMessage(int i)
    {
        Toast.makeText(this, getString(i), 0).show();
    }

    private final void displayPinChangeDialog()
    {
        displayPinChangeDialog(0, true);
    }

    private final void displayPinChangeDialog(int i, boolean flag)
    {
        int j;
        switch (mPinChangeState)
        {
        case 2: // '\002'
        case 5: // '\005'
            j = 0x7f0d02ab;
            break;

        case 1: // '\001'
        case 4: // '\004'
            j = 0x7f0d02aa;
            break;

        case 0: // '\0'
            j = 0x7f0d02a9;
            break;

        case 3: // '\003'
        default:
            j = 0x7f0d02b2;
            break;
        }
        if (i != 0)
            mButtonChangePin2.setDialogMessage((new StringBuilder()).append(getText(j)).append("\n").append(getText(i)).toString());
        else
            mButtonChangePin2.setDialogMessage(j);
        if (flag)
            mButtonChangePin2.showPinDialog();
    }

    private void log(String s)
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("FdnSetting: ").append(s).toString());
    }

    private final void resetPinChangeState()
    {
        mPinChangeState = 0;
        displayPinChangeDialog(0, false);
        mNewPin = "";
        mOldPin = "";
        mIsPuk2Locked = false;
    }

    private final void resetPinChangeStateForPUK2()
    {
        mPinChangeState = 3;
        displayPinChangeDialog(0, false);
        mPuk2 = "";
        mNewPin = "";
        mOldPin = "";
        mIsPuk2Locked = true;
    }

    private void toggleFDNEnable(boolean flag)
    {
        if (!flag)
            return;
        String s = mButtonEnableFDN.getText();
        if (validatePin(s, false))
        {
            boolean flag1 = mPhone.getIccCard().getIccFdnEnabled();
            Message message = mFDNHandler.obtainMessage(100);
            IccCard icccard = mPhone.getIccCard();
            boolean flag2 = false;
            if (!flag1)
                flag2 = true;
            icccard.setIccFdnEnabled(flag2, s, message);
        } else
        {
            displayMessage(0x7f0d02af);
        }
        mButtonEnableFDN.setText("");
    }

    private void updateEnableFDN()
    {
        if (mPhone.getIccCard().getIccFdnEnabled())
        {
            mButtonEnableFDN.setTitle(0x7f0d0275);
            mButtonEnableFDN.setSummary(0x7f0d0270);
            mButtonEnableFDN.setDialogTitle(0x7f0d0273);
            return;
        } else
        {
            mButtonEnableFDN.setTitle(0x7f0d0276);
            mButtonEnableFDN.setSummary(0x7f0d0271);
            mButtonEnableFDN.setDialogTitle(0x7f0d0272);
            return;
        }
    }

    private void updatePINChangeState(boolean flag)
    {
        if (!flag)
            if (!mIsPuk2Locked)
            {
                resetPinChangeState();
                return;
            } else
            {
                resetPinChangeStateForPUK2();
                return;
            }
        switch (mPinChangeState)
        {
        case 5: // '\005'
            if (!mNewPin.equals(mButtonChangePin2.getText()))
            {
                mPinChangeState = 4;
                mButtonChangePin2.setText("");
                displayPinChangeDialog(0x7f0d02ae, true);
                return;
            } else
            {
                mButtonChangePin2.setText("");
                Message message1 = mFDNHandler.obtainMessage(200);
                mPhone.getIccCard().supplyPuk2(mPuk2, mNewPin, message1);
                return;
            }

        case 4: // '\004'
            mNewPin = mButtonChangePin2.getText();
            mButtonChangePin2.setText("");
            if (validatePin(mNewPin, false))
            {
                mPinChangeState = 5;
                displayPinChangeDialog();
                return;
            } else
            {
                displayPinChangeDialog(0x7f0d02af, true);
                return;
            }

        case 3: // '\003'
            mPuk2 = mButtonChangePin2.getText();
            mButtonChangePin2.setText("");
            if (validatePin(mPuk2, true))
            {
                mPinChangeState = 4;
                displayPinChangeDialog();
                return;
            } else
            {
                displayPinChangeDialog(0x7f0d02b0, true);
                return;
            }

        case 2: // '\002'
            if (!mNewPin.equals(mButtonChangePin2.getText()))
            {
                mPinChangeState = 1;
                mButtonChangePin2.setText("");
                displayPinChangeDialog(0x7f0d02ae, true);
                return;
            } else
            {
                mButtonChangePin2.setText("");
                Message message = mFDNHandler.obtainMessage(200);
                mPhone.getIccCard().changeIccFdnPassword(mOldPin, mNewPin, message);
                return;
            }

        case 1: // '\001'
            mNewPin = mButtonChangePin2.getText();
            mButtonChangePin2.setText("");
            if (validatePin(mNewPin, false))
            {
                mPinChangeState = 2;
                displayPinChangeDialog();
                return;
            } else
            {
                displayPinChangeDialog(0x7f0d02af, true);
                return;
            }

        case 0: // '\0'
            mOldPin = mButtonChangePin2.getText();
            mButtonChangePin2.setText("");
            if (validatePin(mOldPin, false))
            {
                mPinChangeState = 1;
                displayPinChangeDialog();
                return;
            } else
            {
                displayPinChangeDialog(0x7f0d02af, true);
                return;
            }
        }
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

    public void onCancel(DialogInterface dialoginterface)
    {
        resetPinChangeStateForPUK2();
        displayPinChangeDialog(0, true);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f06000e);
        mPhone = PhoneGlobals.getPhone();
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mButtonEnableFDN = (EditPinPreference)preferencescreen.findPreference("button_fdn_enable_key");
        mButtonChangePin2 = (EditPinPreference)preferencescreen.findPreference("button_change_pin2_key");
        mButtonEnableFDN.setOnPinEnteredListener(this);
        updateEnableFDN();
        mButtonChangePin2.setOnPinEnteredListener(this);
        if (bundle == null)
        {
            resetPinChangeState();
        } else
        {
            mIsPuk2Locked = bundle.getBoolean("skip_old_pin_key");
            mPinChangeState = bundle.getInt("pin_change_state_key");
            mOldPin = bundle.getString("old_pin_key");
            mNewPin = bundle.getString("new_pin_key");
            mButtonChangePin2.setDialogMessage(bundle.getString("dialog_message_key"));
            mButtonChangePin2.setText(bundle.getString("dialog_pin_entry_key"));
        }
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 0x102002c)
        {
            CallSettings.goUpToTopLevelSetting(this);
            return true;
        } else
        {
            return super.onOptionsItemSelected(menuitem);
        }
    }

    public void onPinEntered(EditPinPreference editpinpreference, boolean flag)
    {
        if (editpinpreference == mButtonEnableFDN)
            toggleFDNEnable(flag);
        else
        if (editpinpreference == mButtonChangePin2)
        {
            updatePINChangeState(flag);
            return;
        }
    }

    protected void onResume()
    {
        super.onResume();
        mPhone = PhoneGlobals.getPhone();
        updateEnableFDN();
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("skip_old_pin_key", mIsPuk2Locked);
        bundle.putInt("pin_change_state_key", mPinChangeState);
        bundle.putString("old_pin_key", mOldPin);
        bundle.putString("new_pin_key", mNewPin);
        bundle.putString("dialog_message_key", mButtonChangePin2.getDialogMessage().toString());
        bundle.putString("dialog_pin_entry_key", mButtonChangePin2.getText());
    }





}
