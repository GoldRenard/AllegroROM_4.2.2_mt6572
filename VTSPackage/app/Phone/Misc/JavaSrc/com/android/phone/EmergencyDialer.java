// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.media.AudioManager;
import android.media.ToneGenerator;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemProperties;
import android.telephony.PhoneNumberUtils;
import android.text.*;
import android.text.method.DialerKeyListener;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import android.widget.EditText;
import com.mediatek.phone.GeminiConstants;
import com.mediatek.phone.gemini.GeminiUtils;

// Referenced classes of package com.android.phone:
//            HapticFeedback, SpecialCharSequenceMgr, PhoneGlobals

public class EmergencyDialer extends Activity
    implements android.view.View.OnClickListener, android.view.View.OnLongClickListener, android.view.View.OnHoverListener, android.view.View.OnKeyListener, TextWatcher
{

    public static final String ACTION_DIAL = "com.android.phone.EmergencyDialer.DIAL";
    private static final int BAD_EMERGENCY_NUMBER_DIALOG = 0;
    private static final boolean DBG = true;
    private static final int DIALER_KEYS[] = {
        0x7f08003d, 0x7f08003e, 0x7f08003f, 0x7f080040, 0x7f080041, 0x7f080042, 0x7f080043, 0x7f080044, 0x7f080045, 0x7f080046, 
        0x7f080047, 0x7f080048
    };
    private static final int DIAL_TONE_STREAM_TYPE = 8;
    private static final String LAST_NUMBER = "lastNumber";
    private static final String LOG_TAG = "EmergencyDialer";
    private static final String SIM_STATE_PIN_REQUIRED = "PIN_REQUIRED";
    private static final String SIM_STATE_PUK_REQUIRED = "PUK_REQUIRED";
    private static final int TONE_LENGTH_MS = 150;
    private static final int TONE_RELATIVE_VOLUME = 80;
    private static final int USER_ACTIVITY_TIMEOUT_WHEN_NO_PROX_SENSOR = 15000;
    private AccessibilityManager mAccessibilityManager;
    private PhoneGlobals mApp;
    private BroadcastReceiver mBroadcastReceiver;
    private boolean mDTMFToneEnabled;
    private View mDelete;
    private View mDialButton;
    EditText mDigits;
    private HapticFeedback mHaptic;
    private String mLastNumber;
    private StatusBarManager mStatusBarManager;
    private ToneGenerator mToneGenerator;
    private Object mToneGeneratorLock;

    public EmergencyDialer()
    {
        mToneGeneratorLock = new Object();
        mHaptic = new HapticFeedback();
        mBroadcastReceiver = new BroadcastReceiver() {

            final EmergencyDialer this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.intent.action.SCREEN_OFF".equals(intent.getAction()))
                {
                    Log.d("EmergencyDialer", "onReceive action screen off");
                    finish();
                }
            }

            
            {
                this$0 = EmergencyDialer.this;
                super();
            }
        }
;
    }

    private CharSequence createErrorMessage(String s)
    {
        if (!TextUtils.isEmpty(s))
        {
            Object aobj[] = new Object[1];
            aobj[0] = mLastNumber;
            return getString(0x7f0d02e5, aobj);
        } else
        {
            return getText(0x7f0d02e6).toString();
        }
    }

    private void keyPressed(int i)
    {
        mHaptic.vibrate();
        KeyEvent keyevent = new KeyEvent(0, i);
        mDigits.onKeyDown(i, keyevent);
    }

    private static void log(String s)
    {
        Log.i("EmergencyDialer", s);
    }

    private void placeCall()
    {
        mLastNumber = mDigits.getText().toString();
        if (PhoneNumberUtils.isEmergencyNumber(mLastNumber))
        {
            Log.d("EmergencyDialer", (new StringBuilder()).append("placing call to ").append(mLastNumber).toString());
            if (mLastNumber != null && TextUtils.isGraphic(mLastNumber))
            {
                Intent intent = new Intent("android.intent.action.CALL_EMERGENCY");
                intent.setData(Uri.fromParts("tel", mLastNumber, null));
                intent.setFlags(0x10000000);
                startActivity(intent);
                finish();
                return;
            } else
            {
                playTone(26);
                return;
            }
        } else
        {
            Log.d("EmergencyDialer", (new StringBuilder()).append("rejecting bad requested number ").append(mLastNumber).toString());
            mDigits.getText().delete(0, mDigits.getText().length());
            showDialog(0);
            return;
        }
    }

    private void setupKeypad()
    {
        int ai[] = DIALER_KEYS;
        int i = ai.length;
        for (int j = 0; j < i; j++)
        {
            View view = findViewById(ai[j]);
            view.setOnClickListener(this);
            view.setOnHoverListener(this);
        }

        findViewById(0x7f080047).setOnLongClickListener(this);
    }

    private void updateDialAndDeleteButtonStateEnabledAttr()
    {
        boolean flag;
        if (mDigits.length() != 0)
            flag = true;
        else
            flag = false;
        mDialButton.setEnabled(flag);
        mDelete.setEnabled(flag);
    }

    public void afterTextChanged(Editable editable)
    {
label0:
        {
            int ai[] = GeminiUtils.getSlots();
            int i = ai.length;
            int j = 0;
            do
            {
                if (j >= i)
                    break label0;
                String s = SystemProperties.get(GeminiConstants.PROPERTY_SIM_STATES[j]);
                log((new StringBuilder()).append("afterTextChanged, simState: ").append(s).append(", slot: ").append(ai[j]).toString());
                if ("PIN_REQUIRED".equals(s) || "PUK_REQUIRED".equals(s))
                    break;
                j++;
            } while (true);
            if (SpecialCharSequenceMgr.handleCharsForLockedDevice(this, editable.toString(), this, ai[j]))
            {
                log("afterTextChanged, mDigits.getText().clear()");
                mDigits.getText().clear();
            }
        }
        updateDialAndDeleteButtonStateEnabledAttr();
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public String getmLastNumberOnlyForTest()
    {
        return mLastNumber;
    }

    public ToneGenerator getmToneGeneratorOnlyForTest()
    {
        return mToneGenerator;
    }

    protected void maybeAddNumberFormatting()
    {
    }

    public void onClick(View view)
    {
        switch (view.getId())
        {
        case 2131230814: 
            if (mDigits.length() != 0)
            {
                mDigits.setCursorVisible(true);
                return;
            }
            // fall through

        case 2131230793: 
        case 2131230794: 
        case 2131230797: 
        case 2131230798: 
        case 2131230799: 
        case 2131230800: 
        case 2131230801: 
        case 2131230802: 
        case 2131230803: 
        case 2131230804: 
        case 2131230805: 
        case 2131230806: 
        case 2131230807: 
        case 2131230808: 
        case 2131230809: 
        case 2131230810: 
        case 2131230811: 
        case 2131230812: 
        case 2131230813: 
        default:
            return;

        case 2131230795: 
            mHaptic.vibrate();
            placeCall();
            return;

        case 2131230796: 
            keyPressed(67);
            return;

        case 2131230790: 
            playTone(10);
            keyPressed(17);
            return;

        case 2131230792: 
            playTone(11);
            keyPressed(18);
            return;

        case 2131230791: 
            playTone(0);
            keyPressed(7);
            return;

        case 2131230789: 
            playTone(9);
            keyPressed(16);
            return;

        case 2131230788: 
            playTone(8);
            keyPressed(15);
            return;

        case 2131230787: 
            playTone(7);
            keyPressed(14);
            return;

        case 2131230786: 
            playTone(6);
            keyPressed(13);
            return;

        case 2131230785: 
            playTone(5);
            keyPressed(12);
            return;

        case 2131230784: 
            playTone(4);
            keyPressed(11);
            return;

        case 2131230783: 
            playTone(3);
            keyPressed(10);
            return;

        case 2131230782: 
            playTone(2);
            keyPressed(9);
            return;

        case 2131230781: 
            playTone(1);
            keyPressed(8);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        Object obj;
        super.onCreate(bundle);
        mApp = PhoneGlobals.getInstance();
        mStatusBarManager = (StatusBarManager)getSystemService("statusbar");
        mAccessibilityManager = (AccessibilityManager)getSystemService("accessibility");
        Log.d("EmergencyDialer", "add show when locked flag");
        android.view.WindowManager.LayoutParams layoutparams = getWindow().getAttributes();
        layoutparams.flags = 0x80000 | layoutparams.flags;
        if (!mApp.proximitySensorModeEnabled())
            layoutparams.userActivityTimeout = 15000L;
        getWindow().setAttributes(layoutparams);
        setContentView(0x7f040016);
        mDigits = (EditText)findViewById(0x7f08005e);
        mDigits.setKeyListener(DialerKeyListener.getInstance());
        mDigits.setOnClickListener(this);
        mDigits.setOnKeyListener(this);
        mDigits.setLongClickable(false);
        if (mAccessibilityManager.isEnabled())
            mDigits.setSelected(true);
        maybeAddNumberFormatting();
        if (findViewById(0x7f08003d) != null)
        {
            setupKeypad();
            Log.e("EmergencyDialer", "view != null at onCreate add");
        }
        mDelete = findViewById(0x7f08004c);
        mDelete.setOnClickListener(this);
        mDelete.setOnLongClickListener(this);
        mDialButton = findViewById(0x7f08004b);
        Resources resources = getResources();
        Uri uri;
        ToneGenerator tonegenerator;
        IntentFilter intentfilter;
        if (resources.getBoolean(0x7f0a0009))
            mDialButton.setOnClickListener(this);
        else
            mDialButton.setVisibility(8);
        if (bundle != null)
            super.onRestoreInstanceState(bundle);
        uri = getIntent().getData();
        if (uri != null && "tel".equals(uri.getScheme()))
        {
            String s = PhoneNumberUtils.getNumberFromIntent(getIntent(), this);
            if (s != null)
                mDigits.setText(s);
        }
        obj = mToneGeneratorLock;
        obj;
        JVM INSTR monitorenter ;
        tonegenerator = mToneGenerator;
        if (tonegenerator != null)
            break MISSING_BLOCK_LABEL_351;
        mToneGenerator = new ToneGenerator(8, 80);
_L1:
        obj;
        JVM INSTR monitorexit ;
        intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        registerReceiver(mBroadcastReceiver, intentfilter);
        Exception exception;
        RuntimeException runtimeexception;
        try
        {
            mHaptic.init(this, resources.getBoolean(0x7f0a0003));
            return;
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            Log.e("EmergencyDialer", "Vibrate control bool missing.", notfoundexception);
        }
        break MISSING_BLOCK_LABEL_469;
        runtimeexception;
        Log.w("EmergencyDialer", (new StringBuilder()).append("Exception caught while creating local tone generator: ").append(runtimeexception).toString());
        mToneGenerator = null;
          goto _L1
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected Dialog onCreateDialog(int i)
    {
        AlertDialog alertdialog = null;
        if (i == 0)
        {
            alertdialog = (new android.app.AlertDialog.Builder(this)).setTitle(getText(0x7f0d02e2)).setMessage(createErrorMessage(mLastNumber)).setPositiveButton(0x7f0d0192, null).setCancelable(true).create();
            alertdialog.getWindow().addFlags(4);
        }
        return alertdialog;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        synchronized (mToneGeneratorLock)
        {
            if (mToneGenerator != null)
            {
                mToneGenerator.release();
                mToneGenerator = null;
            }
        }
        unregisterReceiver(mBroadcastReceiver);
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean onHover(View view, MotionEvent motionevent)
    {
        if (mAccessibilityManager.isEnabled() && mAccessibilityManager.isTouchExplorationEnabled())
            switch (motionevent.getActionMasked())
            {
            case 10: // '\n'
                int i = view.getPaddingLeft();
                int j = view.getWidth() - view.getPaddingRight();
                int k = view.getPaddingTop();
                int l = view.getHeight() - view.getPaddingBottom();
                int i1 = (int)motionevent.getX();
                int j1 = (int)motionevent.getY();
                if (i1 > i && i1 < j && j1 > k && j1 < l)
                    view.performClick();
                view.setClickable(true);
                return false;

            case 9: // '\t'
                view.setClickable(false);
                return false;
            }
        return false;
    }

    public boolean onKey(View view, int i, KeyEvent keyevent)
    {
        switch (view.getId())
        {
        case 2131230814: 
            if (i == 66 && keyevent.getAction() == 1)
            {
                placeCall();
                return true;
            }
            break;
        }
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 5: // '\005'
            if (TextUtils.isEmpty(mDigits.getText().toString()))
                finish();
            else
                placeCall();
            return true;
        }
        return super.onKeyDown(i, keyevent);
    }

    public boolean onLongClick(View view)
    {
        switch (view.getId())
        {
        case 2131230791: 
            keyPressed(81);
            return true;

        case 2131230796: 
            mDigits.getText().clear();
            mDelete.setPressed(false);
            return true;
        }
        return false;
    }

    public void onPause()
    {
        Log.d("EmergencyDialer", "onPause reenabling status bar and closing the dialer");
        mStatusBarManager.disable(0);
        super.onPause();
        synchronized (mToneGeneratorLock)
        {
            if (mToneGenerator != null)
            {
                mToneGenerator.release();
                mToneGenerator = null;
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected void onPostCreate(Bundle bundle)
    {
        super.onPostCreate(bundle);
        mDigits.addTextChangedListener(this);
    }

    protected void onPrepareDialog(int i, Dialog dialog)
    {
        super.onPrepareDialog(i, dialog);
        if (i == 0)
            ((AlertDialog)dialog).setMessage(createErrorMessage(mLastNumber));
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        mLastNumber = bundle.getString("lastNumber");
    }

    protected void onResume()
    {
        Object obj;
        boolean flag = true;
        super.onResume();
        ToneGenerator tonegenerator;
        if (android.provider.Settings.Global.getInt(getContentResolver(), "dtmf_tone", flag) != flag)
            flag = false;
        mDTMFToneEnabled = flag;
        mHaptic.checkSystemSetting();
        obj = mToneGeneratorLock;
        obj;
        JVM INSTR monitorenter ;
        tonegenerator = mToneGenerator;
        if (tonegenerator != null)
            break MISSING_BLOCK_LABEL_66;
        mToneGenerator = new ToneGenerator(8, 80);
_L1:
        obj;
        JVM INSTR monitorexit ;
        Log.d("EmergencyDialer", "disabling status bar, set to long timeout");
        mStatusBarManager.disable(0x10000);
        updateDialAndDeleteButtonStateEnabledAttr();
        return;
        RuntimeException runtimeexception;
        runtimeexception;
        Log.w("EmergencyDialer", (new StringBuilder()).append("Exception caught while creating local tone generator: ").append(runtimeexception).toString());
        mToneGenerator = null;
          goto _L1
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putString("lastNumber", mLastNumber);
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    void playTone(int i)
    {
        int j;
        while (!mDTMFToneEnabled || ((j = ((AudioManager)getSystemService("audio")).getRingerMode()) == 0 || j == 1)) 
            return;
        synchronized (mToneGeneratorLock)
        {
            if (mToneGenerator != null)
                break MISSING_BLOCK_LABEL_81;
            Log.w("EmergencyDialer", (new StringBuilder()).append("playTone: mToneGenerator == null, tone: ").append(i).toString());
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        mToneGenerator.startTone(i, 150);
        obj;
        JVM INSTR monitorexit ;
    }

    public void setmLastNumberOnlyForTest(String s)
    {
        mLastNumber = s;
    }

}
