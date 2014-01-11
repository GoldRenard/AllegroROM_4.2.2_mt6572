// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.res.Resources;
import android.media.ToneGenerator;
import android.os.Handler;
import android.os.Message;
import android.telephony.PhoneNumberUtils;
import android.text.Editable;
import android.text.SpannableString;
import android.text.method.DialerKeyListener;
import android.text.style.RelativeSizeSpan;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import android.widget.EditText;
import com.android.internal.telephony.CallManager;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.mediatek.phone.gemini.GeminiRegister;
import com.mediatek.phone.gemini.GeminiUtils;
import java.util.*;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, InCallScreen, DTMFTwelveKeyDialerView, PhoneUtils

public class DTMFTwelveKeyDialer
    implements android.view.View.OnTouchListener, android.view.View.OnKeyListener, android.view.View.OnHoverListener, android.view.View.OnClickListener
{
    private class DTMFKeyListener extends DialerKeyListener
    {

        public final char DTMF_CHARACTERS[] = {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
            '#', '*'
        };
        final DTMFTwelveKeyDialer this$0;

        private boolean isAcceptableModifierKey(int i)
        {
            switch (i)
            {
            case 57: // '9'
            case 58: // ':'
            case 59: // ';'
            case 60: // '<'
                return true;
            }
            return false;
        }

        private char lookup(KeyEvent keyevent)
        {
            int i = keyevent.getMetaState();
            char c = keyevent.getNumber();
            if ((i & 3) != 0 || c == 0)
            {
                char c1 = keyevent.getMatch(getAcceptedChars(), i);
                if (c1 != 0)
                    c = c1;
            }
            return c;
        }

        public boolean backspace(View view, Editable editable, int i, KeyEvent keyevent)
        {
            return false;
        }

        protected char[] getAcceptedChars()
        {
            return DTMF_CHARACTERS;
        }

        boolean isKeyEventAcceptable(KeyEvent keyevent)
        {
            return ok(getAcceptedChars(), lookup(keyevent));
        }

        public boolean onKeyDown(KeyEvent keyevent)
        {
            char c = lookup(keyevent);
            DTMFTwelveKeyDialer.log((new StringBuilder()).append("DTMFKeyListener.onKeyDown: event '").append(c).append("'").toString());
            if (keyevent.getRepeatCount() == 0 && c != 0)
            {
                if (ok(getAcceptedChars(), c))
                {
                    DTMFTwelveKeyDialer.log((new StringBuilder()).append("DTMFKeyListener reading '").append(c).append("' from input.").toString());
                    processDtmf(c);
                    return true;
                }
                DTMFTwelveKeyDialer.log((new StringBuilder()).append("DTMFKeyListener rejecting '").append(c).append("' from input.").toString());
            }
            return false;
        }

        public boolean onKeyDown(View view, Editable editable, int i, KeyEvent keyevent)
        {
            char c = (char)lookup(keyevent, editable);
            if (keyevent.getRepeatCount() == 0 && c != 0)
            {
                if (ok(getAcceptedChars(), c))
                {
                    DTMFTwelveKeyDialer.log((new StringBuilder()).append("DTMFKeyListener reading '").append(c).append("' from input.").toString());
                    processDtmf(c);
                } else
                {
                    DTMFTwelveKeyDialer.log((new StringBuilder()).append("DTMFKeyListener rejecting '").append(c).append("' from input.").toString());
                }
                return true;
            } else
            {
                return false;
            }
        }

        public boolean onKeyUp(KeyEvent keyevent)
        {
            if (keyevent == null)
                return true;
            char c = lookup(keyevent);
            DTMFTwelveKeyDialer.log((new StringBuilder()).append("DTMFKeyListener.onKeyUp: event '").append(c).append("'").toString());
            if (ok(getAcceptedChars(), c))
            {
                DTMFTwelveKeyDialer.log((new StringBuilder()).append("Stopping the tone for '").append(c).append("'").toString());
                stopTone();
                return true;
            } else
            {
                return false;
            }
        }

        public boolean onKeyUp(View view, Editable editable, int i, KeyEvent keyevent)
        {
            super.onKeyUp(view, editable, i, keyevent);
            char c = (char)lookup(keyevent, editable);
            if (ok(getAcceptedChars(), c))
            {
                DTMFTwelveKeyDialer.log((new StringBuilder()).append("Stopping the tone for '").append(c).append("'").toString());
                stopTone();
                return true;
            } else
            {
                return false;
            }
        }

        private DTMFKeyListener()
        {
            this$0 = DTMFTwelveKeyDialer.this;
            super();
        }

    }


    private static final boolean DBG = true;
    private static final int DTMF_DURATION_MS = 120;
    private static final int DTMF_SEND_CNF = 101;
    private static final int DTMF_STOP = 102;
    private static final String LOG_TAG = "DTMFTwelveKeyDialer";
    private static final int PHONE_DISCONNECT = 100;
    private static final HashMap mDisplayMap;
    private static final HashMap mToneMap;
    private final AccessibilityManager mAccessibilityManager;
    private CallManager mCM;
    private MTKCallManager mCMGemini;
    private boolean mDTMFBurstCnfPending;
    private Queue mDTMFQueue;
    private DTMFKeyListener mDialerKeyListener;
    private ViewStub mDialerStub;
    private DTMFTwelveKeyDialerView mDialerView;
    private EditText mDialpadDigits;
    private final Handler mHandler;
    private InCallScreen mInCallScreen;
    private boolean mLocalToneEnabled;
    private Phone mPhone;
    boolean mShortTone;
    private ToneGenerator mToneGenerator;
    private final Object mToneGeneratorLock;
    private View mView;

    private DTMFTwelveKeyDialer(InCallScreen incallscreen)
    {
        mToneGeneratorLock = new Object();
        mDTMFBurstCnfPending = false;
        mDTMFQueue = new LinkedList();
        mView = null;
        mHandler = new Handler() {

            final DTMFTwelveKeyDialer this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 102: // 'f'
                    DTMFTwelveKeyDialer.log("dtmf stop received");
                    stopTone();
                    return;

                case 101: // 'e'
                    DTMFTwelveKeyDialer.log("dtmf confirmation received from FW.");
                    handleBurstDtmfConfirmation();
                    return;

                case 100: // 'd'
                    DTMFTwelveKeyDialer.log("disconnect message recieved, shutting down.");
                    Object obj;
                    if (GeminiUtils.isGeminiSupport())
                        obj = mCMGemini;
                    else
                        obj = mCM;
                    GeminiRegister.unregisterForDisconnect(obj, this);
                    if (mView != null)
                    {
                        mView.setPressed(false);
                        stopTone();
                    }
                    closeDialer(false);
                    return;
                }
            }

            
            {
                this$0 = DTMFTwelveKeyDialer.this;
                super();
            }
        }
;
        log((new StringBuilder()).append("DTMFTwelveKeyDialer constructor... this = ").append(this).toString());
        mInCallScreen = incallscreen;
        mPhone = PhoneGlobals.getInstance().phone;
        mCM = PhoneGlobals.getInstance().mCM;
        mCMGemini = PhoneGlobals.getInstance().mCMGemini;
        mAccessibilityManager = (AccessibilityManager)incallscreen.getSystemService("accessibility");
    }

    public DTMFTwelveKeyDialer(InCallScreen incallscreen, ViewStub viewstub)
    {
        this(incallscreen);
        mDialerStub = viewstub;
        log((new StringBuilder()).append("- Got passed-in mDialerStub: ").append(mDialerStub).toString());
    }

    public DTMFTwelveKeyDialer(InCallScreen incallscreen, DTMFTwelveKeyDialerView dtmftwelvekeydialerview)
    {
        this(incallscreen);
        if (dtmftwelvekeydialerview == null)
            Log.e("DTMFTwelveKeyDialer", "DTMFTwelveKeyDialer: null dialerView!", new IllegalStateException());
        mDialerView = dtmftwelvekeydialerview;
        log((new StringBuilder()).append("- Got passed-in mDialerView: ").append(mDialerView).toString());
        if (mDialerView != null)
            setupDialerView();
    }

    private static void log(String s)
    {
        Log.d("DTMFTwelveKeyDialer", s);
    }

    private void onDialerClose(boolean flag)
    {
        log("onDialerClose()...");
        PhoneGlobals.getInstance().updateWakeState();
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.unregisterForDisconnect(obj, mHandler);
        if (mInCallScreen != null)
        {
            mInCallScreen.onDialerClose(flag);
            return;
        } else
        {
            Log.e("DTMFTwelveKeyDialer", "InCallScreen object was null during onDialerClose()");
            return;
        }
    }

    private void onDialerOpen(boolean flag)
    {
        log("onDialerOpen()...");
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.registerForDisconnect(obj, mHandler, 100);
        PhoneGlobals.getInstance().updateWakeState();
        if (mInCallScreen != null)
        {
            mInCallScreen.onDialerOpen(flag);
            return;
        } else
        {
            Log.e("DTMFTwelveKeyDialer", "InCallScreen object was null during onDialerOpen()");
            return;
        }
    }

    private final void processDtmf(char c)
    {
        processDtmf(c, false);
    }

    private final void processDtmf(char c, boolean flag)
    {
        if (PhoneNumberUtils.is12Key(c))
        {
            log((new StringBuilder()).append("updating display and sending dtmf tone for '").append(c).append("'").toString());
            if (mDialpadDigits != null)
            {
                mDialpadDigits.getText().append(c);
                Log.i("DTMFTwelveKeyDialer", (new StringBuilder()).append("[mtk performance result]:").append(System.currentTimeMillis()).toString());
            }
            if (mToneMap.containsKey(Character.valueOf(c)))
                startTone(c, flag);
        } else
        {
            log((new StringBuilder()).append("ignoring dtmf request for '").append(c).append("'").toString());
        }
        PhoneGlobals.getInstance().pokeUserActivity();
    }

    private void sendShortDtmfToNetwork(char c)
    {
        Queue queue = mDTMFQueue;
        queue;
        JVM INSTR monitorenter ;
        if (!mDTMFBurstCnfPending) goto _L2; else goto _L1
_L1:
        mDTMFQueue.add(new Character(c));
_L4:
        return;
_L2:
        String s;
        s = Character.toString(c);
        if (!GeminiUtils.isGeminiSupport())
            break MISSING_BLOCK_LABEL_92;
        if (GeminiUtils.getSlotNotIdle(mPhone) != -1)
            mCM.sendBurstDtmf(s, 0, 0, mHandler.obtainMessage(101));
_L5:
        mDTMFBurstCnfPending = true;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        queue;
        JVM INSTR monitorexit ;
        throw exception;
        mCM.sendBurstDtmf(s, 0, 0, mHandler.obtainMessage(101));
          goto _L5
    }

    private void setDialPadMargin()
    {
        android.widget.FrameLayout.LayoutParams layoutparams = (android.widget.FrameLayout.LayoutParams)mDialerView.getLayoutParams();
        if (mInCallScreen.isVTInCallScreenOn())
            layoutparams.setMargins(0, 0, 0, (int)mInCallScreen.getResources().getDimension(0x7f0c0015));
        else
            layoutparams.setMargins(0, 0, 0, (int)mInCallScreen.getResources().getDimension(0x7f0c0014));
        mDialerView.setLayoutParams(layoutparams);
    }

    private void setupDialerView()
    {
        log("setupDialerView()");
        mDialerView.setDialer(this);
        mDialpadDigits = (EditText)mDialerView.findViewById(0x7f08004e);
        if (mDialpadDigits != null)
        {
            mDialerKeyListener = new DTMFKeyListener();
            mDialpadDigits.setKeyListener(mDialerKeyListener);
            mDialpadDigits.setLongClickable(false);
        }
        setupKeypad(mDialerView);
    }

    private void setupKeypad(DTMFTwelveKeyDialerView dtmftwelvekeydialerview)
    {
        View view;
        for (Iterator iterator = mDisplayMap.keySet().iterator(); iterator.hasNext(); view.setOnClickListener(this))
        {
            view = dtmftwelvekeydialerview.findViewById(((Integer)iterator.next()).intValue());
            view.setOnTouchListener(this);
            view.setClickable(true);
            view.setOnKeyListener(this);
            view.setOnHoverListener(this);
        }

    }

    public void clearDigits()
    {
        log("clearDigits()...");
        if (mDialpadDigits != null)
            mDialpadDigits.setText("");
        setDialpadContext("");
    }

    public void clearInCallScreenReference()
    {
        log("clearInCallScreenReference()...");
        mInCallScreen = null;
        mDialerKeyListener = null;
        mHandler.removeMessages(101);
        synchronized (mDTMFQueue)
        {
            mDTMFBurstCnfPending = false;
            mDTMFQueue.clear();
        }
        closeDialer(false);
        mInCallScreen = null;
        return;
        exception;
        queue;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void closeDialer(boolean flag)
    {
        log("closeDialer()...");
        if (isOpened())
        {
            if (flag)
                AnimationUtils.Fade.hide(mDialerView, 8);
            else
                mDialerView.setVisibility(8);
            onDialerClose(flag);
        }
    }

    public void handleBurstDtmfConfirmation()
    {
        Queue queue = mDTMFQueue;
        queue;
        JVM INSTR monitorenter ;
        boolean flag;
        mDTMFBurstCnfPending = false;
        flag = mDTMFQueue.isEmpty();
        Character character;
        character = null;
        if (flag)
            break MISSING_BLOCK_LABEL_70;
        character = (Character)mDTMFQueue.remove();
        Log.i("DTMFTwelveKeyDialer", (new StringBuilder()).append("The dtmf character removed from queue").append(character).toString());
        queue;
        JVM INSTR monitorexit ;
        if (character != null)
            sendShortDtmfToNetwork(character.charValue());
        return;
        Exception exception;
        exception;
        queue;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isKeyEventAcceptable(KeyEvent keyevent)
    {
        return mDialerKeyListener != null && mDialerKeyListener.isKeyEventAcceptable(keyevent);
    }

    public boolean isOpened()
    {
        return mDialerView != null && mDialerView.getVisibility() == 0 && !AnimationUtils.Fade.isFadingOut(mDialerView);
    }

    public void onClick(View view)
    {
        if (mAccessibilityManager.isEnabled())
        {
            int i = view.getId();
            if (!view.isPressed() && mDisplayMap.containsKey(Integer.valueOf(i)))
                processDtmf(((Character)mDisplayMap.get(Integer.valueOf(i))).charValue(), true);
        }
    }

    public boolean onDialerKeyDown(KeyEvent keyevent)
    {
        log("Notifying dtmf key down.");
        if (mDialerKeyListener != null)
            return mDialerKeyListener.onKeyDown(keyevent);
        else
            return false;
    }

    public boolean onDialerKeyUp(KeyEvent keyevent)
    {
        log("Notifying dtmf key up.");
        if (mDialerKeyListener != null)
            return mDialerKeyListener.onKeyUp(keyevent);
        else
            return false;
    }

    public boolean onHover(View view, MotionEvent motionevent)
    {
        if (mAccessibilityManager.isEnabled() && mAccessibilityManager.isTouchExplorationEnabled())
        {
            int i = view.getPaddingLeft();
            int j = view.getWidth() - view.getPaddingRight();
            int k = view.getPaddingTop();
            int l = view.getHeight() - view.getPaddingBottom();
            switch (motionevent.getActionMasked())
            {
            case 10: // '\n'
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
        }
        return false;
    }

    public boolean onKey(View view, int i, KeyEvent keyevent)
    {
        if (i == 23)
        {
            int j = view.getId();
            if (mDisplayMap.containsKey(Integer.valueOf(j)))
                switch (keyevent.getAction())
                {
                default:
                    break;

                case 1: // '\001'
                    stopTone();
                    break;

                case 0: // '\0'
                    if (keyevent.getRepeatCount() == 0)
                        processDtmf(((Character)mDisplayMap.get(Integer.valueOf(j))).charValue());
                    break;
                }
        }
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 4: // '\004'
            log("exit requested");
            closeDialer(true);
            return true;
        }
        return mInCallScreen.onKeyDown(i, keyevent);
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        return mInCallScreen.onKeyUp(i, keyevent);
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        int i = view.getId();
        log((new StringBuilder()).append("onTouch:  MotionEvent ").append(motionevent.getAction()).toString());
        if (mDisplayMap.containsKey(Integer.valueOf(i)))
            switch (motionevent.getAction())
            {
            case 2: // '\002'
            default:
                break;

            case 1: // '\001'
            case 3: // '\003'
                if (mView != null && mView.getId() == i)
                    mView = null;
                stopTone();
                break;

            case 0: // '\0'
                processDtmf(((Character)mDisplayMap.get(Integer.valueOf(i))).charValue());
                mView = view;
                break;
            }
        return false;
    }

    public void openDialer(boolean flag)
    {
        log("openDialer()...");
        if (mDialerView == null && mDialerStub != null)
        {
            log("Dialer isn't ready. Inflate it from ViewStub.");
            mDialerView = (DTMFTwelveKeyDialerView)mDialerStub.inflate();
            setupDialerView();
            mDialerStub = null;
        }
        setDialPadMargin();
        if (!isOpened())
        {
            if (flag)
                AnimationUtils.Fade.show(mDialerView);
            else
                mDialerView.setVisibility(0);
            onDialerOpen(flag);
        }
    }

    public void setDialpadContext(String s)
    {
        if (mDialpadDigits != null)
        {
            if (s == null)
                s = "";
            SpannableString spannablestring = new SpannableString(s);
            spannablestring.setSpan(new RelativeSizeSpan(0.8F), 0, spannablestring.length(), 0);
            mDialpadDigits.setHint(spannablestring);
        }
    }

    public void startDialerSession()
    {
        Object obj;
        boolean flag = true;
        log((new StringBuilder()).append("startDialerSession()... this = ").append(this).toString());
        if (PhoneGlobals.getInstance().getResources().getBoolean(0x7f0a0008))
        {
            ToneGenerator tonegenerator;
            if (android.provider.Settings.Global.getInt(mInCallScreen.getContentResolver(), "dtmf_tone", flag) != flag)
                flag = false;
            mLocalToneEnabled = flag;
        } else
        {
            mLocalToneEnabled = false;
        }
        log((new StringBuilder()).append("- startDialerSession: mLocalToneEnabled = ").append(mLocalToneEnabled).toString());
        if (!mLocalToneEnabled) goto _L2; else goto _L1
_L1:
        obj = mToneGeneratorLock;
        obj;
        JVM INSTR monitorenter ;
        tonegenerator = mToneGenerator;
        if (tonegenerator != null)
            break MISSING_BLOCK_LABEL_129;
        mToneGenerator = new ToneGenerator(8, 80);
_L3:
        obj;
        JVM INSTR monitorexit ;
_L2:
        return;
        RuntimeException runtimeexception;
        runtimeexception;
        log((new StringBuilder()).append("Exception caught while creating local tone generator: ").append(runtimeexception).toString());
        mToneGenerator = null;
          goto _L3
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void startLocalToneIfNeeded(char c)
    {
        while (!mToneMap.containsKey(Character.valueOf(c)) || !mLocalToneEnabled) 
            return;
        Object obj = mToneGeneratorLock;
        obj;
        JVM INSTR monitorenter ;
        if (mToneGenerator != null) goto _L2; else goto _L1
_L1:
        log((new StringBuilder()).append("startDtmfTone: mToneGenerator == null, tone: ").append(c).toString());
_L3:
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        log((new StringBuilder()).append("starting local tone ").append(c).toString());
        byte byte0 = -1;
        if (mShortTone)
            byte0 = 120;
        mToneGenerator.startTone(((Integer)mToneMap.get(Character.valueOf(c))).intValue(), byte0);
          goto _L3
    }

    public void startTone(char c, boolean flag)
    {
        if (mToneMap.containsKey(Character.valueOf(c)) && mInCallScreen.okToDialDTMFTones())
        {
            Phone phone = mCM.getFgPhone();
            mShortTone = PhoneUtils.useShortDtmfTones(phone, phone.getContext());
            if (mHandler.hasMessages(102))
            {
                mHandler.removeMessages(102);
                stopTone();
            }
            log("startDtmfTone()...");
            if (mShortTone)
            {
                sendShortDtmfToNetwork(c);
            } else
            {
                log((new StringBuilder()).append("send long dtmf for ").append(c).toString());
                mCM.startDtmf(c);
                if (flag)
                    mHandler.sendMessageDelayed(mHandler.obtainMessage(102), 120L);
            }
            startLocalToneIfNeeded(c);
            return;
        } else
        {
            return;
        }
    }

    public void stopDialerSession()
    {
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

    public void stopLocalToneIfNeeded()
    {
        if (mShortTone)
            break MISSING_BLOCK_LABEL_64;
        log("trying to stop local tone...");
        if (!mLocalToneEnabled)
            break MISSING_BLOCK_LABEL_64;
        Object obj = mToneGeneratorLock;
        obj;
        JVM INSTR monitorenter ;
        if (mToneGenerator != null)
            break MISSING_BLOCK_LABEL_43;
        log("stopLocalTone: mToneGenerator == null");
_L2:
        return;
        log("stopping local tone.");
        mToneGenerator.stopTone();
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void stopTone()
    {
        if (!mShortTone)
        {
            log("stopping remote tone.");
            mCM.stopDtmf();
            stopLocalToneIfNeeded();
        }
    }

    static 
    {
        mToneMap = new HashMap();
        mDisplayMap = new HashMap();
        mToneMap.put(Character.valueOf('1'), Integer.valueOf(1));
        mToneMap.put(Character.valueOf('2'), Integer.valueOf(2));
        mToneMap.put(Character.valueOf('3'), Integer.valueOf(3));
        mToneMap.put(Character.valueOf('4'), Integer.valueOf(4));
        mToneMap.put(Character.valueOf('5'), Integer.valueOf(5));
        mToneMap.put(Character.valueOf('6'), Integer.valueOf(6));
        mToneMap.put(Character.valueOf('7'), Integer.valueOf(7));
        mToneMap.put(Character.valueOf('8'), Integer.valueOf(8));
        mToneMap.put(Character.valueOf('9'), Integer.valueOf(9));
        mToneMap.put(Character.valueOf('0'), Integer.valueOf(0));
        mToneMap.put(Character.valueOf('#'), Integer.valueOf(11));
        mToneMap.put(Character.valueOf('*'), Integer.valueOf(10));
        mDisplayMap.put(Integer.valueOf(0x7f08003d), Character.valueOf('1'));
        mDisplayMap.put(Integer.valueOf(0x7f08003e), Character.valueOf('2'));
        mDisplayMap.put(Integer.valueOf(0x7f08003f), Character.valueOf('3'));
        mDisplayMap.put(Integer.valueOf(0x7f080040), Character.valueOf('4'));
        mDisplayMap.put(Integer.valueOf(0x7f080041), Character.valueOf('5'));
        mDisplayMap.put(Integer.valueOf(0x7f080042), Character.valueOf('6'));
        mDisplayMap.put(Integer.valueOf(0x7f080043), Character.valueOf('7'));
        mDisplayMap.put(Integer.valueOf(0x7f080044), Character.valueOf('8'));
        mDisplayMap.put(Integer.valueOf(0x7f080045), Character.valueOf('9'));
        mDisplayMap.put(Integer.valueOf(0x7f080047), Character.valueOf('0'));
        mDisplayMap.put(Integer.valueOf(0x7f080048), Character.valueOf('#'));
        mDisplayMap.put(Integer.valueOf(0x7f080046), Character.valueOf('*'));
    }





}
