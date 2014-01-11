// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.text.Editable;
import android.view.MenuItem;
import android.view.View;
import android.widget.*;
import com.android.internal.telephony.IccCard;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class ChangeIccPinScreen extends Activity
{
    private class ChangeIccPinScreenBroadcastReceiver extends BroadcastReceiver
    {

        final ChangeIccPinScreen this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE") && intent.getBooleanExtra("state", false) || s.equals("android.intent.action.DUAL_SIM_MODE") && intent.getIntExtra("mode", -1) == 0)
                finish();
        }

        private ChangeIccPinScreenBroadcastReceiver()
        {
            this$0 = ChangeIccPinScreen.this;
            super();
        }

    }

    private static final class EntryState extends Enum
    {

        private static final EntryState $VALUES[];
        public static final EntryState ES_PIN;
        public static final EntryState ES_PUK;

        public static EntryState valueOf(String s)
        {
            return (EntryState)Enum.valueOf(com/android/phone/ChangeIccPinScreen$EntryState, s);
        }

        public static EntryState[] values()
        {
            return (EntryState[])$VALUES.clone();
        }

        static 
        {
            ES_PIN = new EntryState("ES_PIN", 0);
            ES_PUK = new EntryState("ES_PUK", 1);
            EntryState aentrystate[] = new EntryState[2];
            aentrystate[0] = ES_PIN;
            aentrystate[1] = ES_PUK;
            $VALUES = aentrystate;
        }

        private EntryState(String s, int i)
        {
            super(s, i);
        }
    }


    private static final boolean DBG = true;
    private static final int EVENT_PIN_CHANGED = 100;
    private static final int GET_SIM_RETRY_EMPTY = -1;
    private static final String LOG_TAG = "Settings/PhoneGlobals";
    private static final int MAX_PIN_LENGTH = 8;
    private static final int MIN_PIN_LENGTH = 4;
    private static final int NO_ERROR = 0;
    private static final int PIN_INVALID_LENGTH = 2;
    private static final int PIN_MISMATCH = 1;
    private TextView mBadPinError;
    private TextView mBadPukError;
    private Button mButton;
    private boolean mChangePin2;
    private android.view.View.OnClickListener mClicked;
    private Handler mHandler;
    private LinearLayout mIccPUKPanel;
    private TextView mMismatchError;
    private EditText mNewPin1;
    private TextView mNewPin1Label;
    private EditText mNewPin2;
    private TextView mNewPin2Label;
    private LinearLayout mOldPINPanel;
    private EditText mOldPin;
    private TextView mOldPinLabel;
    private EditText mPUKCode;
    private Phone mPhone;
    private TextView mPinRetryLabel;
    private TextView mPuk2Label;
    private TextView mPukRetryLabel;
    private final BroadcastReceiver mReceiver = new ChangeIccPinScreenBroadcastReceiver();
    private ScrollView mScrollView;
    private int mSimId;
    private EntryState mState;

    public ChangeIccPinScreen()
    {
        mHandler = new Handler() {

            final ChangeIccPinScreen this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 100: // 'd'
                    AsyncResult asyncresult = (AsyncResult)message.obj;
                    handleResult(asyncresult);
                    return;
                }
            }

            
            {
                this$0 = ChangeIccPinScreen.this;
                super();
            }
        }
;
        mClicked = new android.view.View.OnClickListener() {

            final ChangeIccPinScreen this$0;

            public void onClick(View view)
            {
label0:
                {
                    IccCard icccard;
                    String s;
                    String s1;
label1:
                    {
label2:
                        {
                            if (view == mButton)
                            {
                                icccard = ((GeminiPhone)mPhone).getIccCardGemini(mSimId);
                                if (icccard != null)
                                {
                                    s = mOldPin.getText().toString();
                                    s1 = mPUKCode.getText().toString();
                                    if (mState != EntryState.ES_PUK)
                                        break label2;
                                    if (s1 != null && s1.length() == 8)
                                    {
                                        mBadPukError.setVisibility(8);
                                        break label1;
                                    }
                                    mPUKCode.getText().clear();
                                    mBadPukError.setText(0x7f0d02b0);
                                    mBadPukError.setVisibility(0);
                                    mMismatchError.setVisibility(8);
                                    mPUKCode.requestFocus();
                                }
                            }
                            return;
                        }
                        if (s == null || s.length() < 4 || s.length() > 8)
                            break label0;
                        mBadPinError.setVisibility(8);
                    }
                    String s2 = mNewPin1.getText().toString();
                    String s3 = mNewPin2.getText().toString();
                    int j = validateNewPin(s2, s3);
                    switch (j)
                    {
                    case 1: // '\001'
                    case 2: // '\002'
                        mNewPin1.getText().clear();
                        mNewPin2.getText().clear();
                        mMismatchError.setVisibility(0);
                        mNewPin1.requestFocus();
                        Resources resources = getResources();
                        String s4;
                        if (j == 1)
                        {
                            int l;
                            if (mChangePin2)
                                l = 0x7f0d02ae;
                            else
                                l = 0x7f0d029e;
                            s4 = resources.getString(l);
                        } else
                        {
                            int k;
                            if (mChangePin2)
                                k = 0x7f0d02af;
                            else
                                k = 0x7f0d029f;
                            s4 = resources.getString(k);
                        }
                        mMismatchError.setText(s4);
                        return;
                    }
                    Message message = Message.obtain(mHandler, 100);
                    log((new StringBuilder()).append("change pin attempt: old=").append(s).append(", newPin=").append(s2).toString());
                    reset();
                    if (mChangePin2)
                    {
                        if (mState == EntryState.ES_PUK)
                        {
                            icccard.supplyPuk2(s1, mNewPin1.getText().toString(), Message.obtain(mHandler, 100));
                            return;
                        } else
                        {
                            icccard.changeIccFdnPassword(s, s2, message);
                            return;
                        }
                    } else
                    {
                        icccard.changeIccLockPassword(s, s2, message);
                        return;
                    }
                }
                int i;
                if (mChangePin2)
                    i = 0x7f0d02af;
                else
                    i = 0x7f0d029f;
                mOldPin.getText().clear();
                mBadPinError.setText(i);
                mBadPinError.setVisibility(0);
                mMismatchError.setVisibility(8);
                mOldPin.requestFocus();
            }

            
            {
                this$0 = ChangeIccPinScreen.this;
                super();
            }
        }
;
    }

    private void displayPUKAlert()
    {
        (new android.app.AlertDialog.Builder(this)).setMessage(0x7f0d02a7).setCancelable(false).setPositiveButton(0x7f0d0192, new android.content.DialogInterface.OnClickListener() {

            final ChangeIccPinScreen this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
            }

            
            {
                this$0 = ChangeIccPinScreen.this;
                super();
            }
        }
).show();
    }

    private String getRetryPin()
    {
        int i = getRetryPinCount();
        Object aobj[];
        switch (i)
        {
        case 1: // '\001'
            return getString(0x7f0d0141);

        case -1: 
            return " ";

        case 0: // '\0'
        default:
            aobj = new Object[1];
            break;
        }
        aobj[0] = Integer.valueOf(i);
        return getString(0x7f0d0142, aobj);
    }

    private int getRetryPinCount()
    {
        String s;
        String s1;
        switch (mSimId)
        {
        case 3: // '\003'
            s = "gsm.sim.retry.pin1.4";
            s1 = "gsm.sim.retry.pin2.4";
            break;

        case 2: // '\002'
            s = "gsm.sim.retry.pin1.3";
            s1 = "gsm.sim.retry.pin2.3";
            break;

        case 1: // '\001'
            s = "gsm.sim.retry.pin1.2";
            s1 = "gsm.sim.retry.pin2.2";
            break;

        case 0: // '\0'
            s = "gsm.sim.retry.pin1";
            s1 = "gsm.sim.retry.pin2";
            break;

        default:
            Xlog.d("Settings/PhoneGlobals", (new StringBuilder()).append("Error happened mSimId=").append(mSimId).toString());
            s = "gsm.sim.retry.pin1";
            s1 = "gsm.sim.retry.pin2";
            break;
        }
        if (mChangePin2)
            return SystemProperties.getInt(s1, -1);
        else
            return SystemProperties.getInt(s, -1);
    }

    private String getRetryPuk2()
    {
        int i = getRetryPuk2Count();
        Object aobj[];
        switch (i)
        {
        case 1: // '\001'
            return getString(0x7f0d0141);

        case -1: 
            return " ";

        case 0: // '\0'
        default:
            aobj = new Object[1];
            break;
        }
        aobj[0] = Integer.valueOf(i);
        return getString(0x7f0d0142, aobj);
    }

    private int getRetryPuk2Count()
    {
        String s;
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
            Xlog.d("Settings/PhoneGlobals", (new StringBuilder()).append("Error happened mSimId=").append(mSimId).toString());
            s = "gsm.sim.retry.puk2";
            break;
        }
        return SystemProperties.getInt(s, -1);
    }

    private void handleResult(AsyncResult asyncresult)
    {
        if (asyncresult.exception == null)
        {
            log("handleResult: success!");
            showConfirmation();
            finish();
        } else
        {
            if (mState == EntryState.ES_PIN)
            {
                log("handleResult: pin failed!");
                mOldPin.getText().clear();
                int i;
                if (mChangePin2)
                    i = 0x7f0d02ad;
                else
                    i = 0x7f0d029d;
                mBadPinError.setText(i);
                mBadPinError.setVisibility(0);
                if (getRetryPinCount() == 0)
                {
                    log("handleResult: puk requested!");
                    if (mChangePin2)
                    {
                        mState = EntryState.ES_PUK;
                        displayPUKAlert();
                        showPukPanel();
                        return;
                    } else
                    {
                        finish();
                        return;
                    }
                } else
                {
                    mPinRetryLabel.setText(getRetryPin());
                    mOldPin.requestFocus();
                    return;
                }
            }
            if (mState == EntryState.ES_PUK)
            {
                log("handleResult: puk2 failed!");
                if (getRetryPuk2Count() == 0)
                {
                    Toast.makeText(this, 0x7f0d0145, 0).show();
                    finish();
                }
                mBadPukError.setText(0x7f0d02ac);
                mBadPukError.setVisibility(0);
                mPukRetryLabel.setText(getRetryPuk2());
                mPUKCode.getText().clear();
                mPUKCode.requestFocus();
                return;
            }
        }
    }

    private void log(String s)
    {
        String s1;
        if (mChangePin2)
            s1 = "[ChgPin2]";
        else
            s1 = "[ChgPin]";
        Xlog.d("Settings/PhoneGlobals", (new StringBuilder()).append(s1).append(s).toString());
    }

    private void reset()
    {
        mScrollView.scrollTo(0, 0);
        mBadPinError.setVisibility(8);
        mBadPukError.setVisibility(8);
        mMismatchError.setVisibility(8);
    }

    private void resolveIntent()
    {
        Intent intent = getIntent();
        mChangePin2 = intent.getBooleanExtra("pin2", mChangePin2);
        mSimId = intent.getIntExtra("simId", -1);
    }

    private void showConfirmation()
    {
        int i;
        if (mState == EntryState.ES_PUK)
            i = 0x7f0d0143;
        else
        if (mChangePin2)
            i = 0x7f0d02b1;
        else
            i = 0x7f0d02a6;
        Toast.makeText(this, i, 0).show();
    }

    private void showPinPanel()
    {
        int i;
        if (mChangePin2)
            i = 0x7f0d0274;
        else
            i = 0x7f0d0298;
        setTitle(getResources().getText(i));
        mPinRetryLabel.setText(getRetryPin());
        mIccPUKPanel.setVisibility(8);
        mOldPINPanel.setVisibility(0);
        mOldPin.requestFocus();
    }

    private void showPukPanel()
    {
        setTitle(getResources().getText(0x7f0d0144));
        mPukRetryLabel.setText(getRetryPuk2());
        mIccPUKPanel.setVisibility(0);
        mOldPINPanel.setVisibility(8);
        mPUKCode.requestFocus();
    }

    private void updateScreenPanel()
    {
        if (mChangePin2)
        {
            if (getRetryPinCount() == 0)
            {
                if (getRetryPuk2Count() == 0)
                    finish();
                mState = EntryState.ES_PUK;
                showPukPanel();
                return;
            } else
            {
                mState = EntryState.ES_PIN;
                showPinPanel();
                return;
            }
        } else
        {
            showPinPanel();
            return;
        }
    }

    private int validateNewPin(String s, String s1)
    {
        if (s != null)
        {
            if (!s.equals(s1))
                return 1;
            int i = s.length();
            if (i >= 4 && i <= 8)
                return 0;
        }
        return 2;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mPhone = PhoneGlobals.getPhone();
        resolveIntent();
        setContentView(0x7f04000d);
        mOldPinLabel = (TextView)findViewById(0x7f08002f);
        if (mOldPinLabel != null)
        {
            int k;
            if (mChangePin2)
                k = 0x7f0d02a9;
            else
                k = 0x7f0d029a;
            mOldPinLabel.setText(k);
            mOldPinLabel.append(getResources().getText(0x7f0d0146));
        }
        mPinRetryLabel = (TextView)findViewById(0x7f080030);
        mOldPINPanel = (LinearLayout)findViewById(0x7f08002e);
        mNewPin1Label = (TextView)findViewById(0x7f080033);
        if (mNewPin1Label != null)
        {
            int j;
            if (mChangePin2)
                j = 0x7f0d02aa;
            else
                j = 0x7f0d029b;
            mNewPin1Label.setText(j);
        }
        mNewPin2Label = (TextView)findViewById(0x7f080035);
        if (mNewPin2Label != null)
        {
            int i;
            if (mChangePin2)
                i = 0x7f0d02ab;
            else
                i = 0x7f0d029c;
            mNewPin2Label.setText(i);
        }
        mPuk2Label = (TextView)findViewById(0x7f08002a);
        if (mPuk2Label != null)
            mPuk2Label.append(getResources().getText(0x7f0d0147));
        mPukRetryLabel = (TextView)findViewById(0x7f08002b);
        mBadPukError = (TextView)findViewById(0x7f08002d);
        mOldPin = (EditText)findViewById(0x7f080031);
        mNewPin1 = (EditText)findViewById(0x7f080034);
        mNewPin2 = (EditText)findViewById(0x7f080036);
        mOldPin.setInputType(18);
        mNewPin1.setInputType(18);
        mNewPin2.setInputType(18);
        mBadPinError = (TextView)findViewById(0x7f080032);
        mMismatchError = (TextView)findViewById(0x7f080037);
        mButton = (Button)findViewById(0x7f080038);
        mButton.setOnClickListener(mClicked);
        mScrollView = (ScrollView)findViewById(0x7f080028);
        mPUKCode = (EditText)findViewById(0x7f08002c);
        mPUKCode.setInputType(18);
        mIccPUKPanel = (LinearLayout)findViewById(0x7f080029);
        mState = EntryState.ES_PIN;
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.DUAL_SIM_MODE");
        registerReceiver(mReceiver, intentfilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
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

    protected void onResume()
    {
        super.onResume();
        updateScreenPanel();
        reset();
    }

















}
