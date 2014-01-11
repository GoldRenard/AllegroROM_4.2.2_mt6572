// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.app.KeyguardManager;
import android.app.SearchManager;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.AudioManager;
import android.media.IAudioService;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.util.Slog;
import android.view.*;

// Referenced classes of package com.android.internal.policy.impl:
//            PhoneWindowManager

public class PhoneFallbackEventHandler
    implements FallbackEventHandler
{

    private static final boolean DEBUG;
    private static String TAG = "PhoneFallbackEventHandler";
    AudioManager mAudioManager;
    Context mContext;
    KeyguardManager mKeyguardManager;
    SearchManager mSearchManager;
    TelephonyManager mTelephonyManager;
    View mView;

    public PhoneFallbackEventHandler(Context context)
    {
        mContext = context;
    }

    private void handleMediaKeyEvent(KeyEvent keyevent)
    {
        IAudioService iaudioservice = android.media.IAudioService.Stub.asInterface(ServiceManager.checkService("audio"));
        if (iaudioservice != null)
        {
            try
            {
                iaudioservice.dispatchMediaKeyEvent(keyevent);
                return;
            }
            catch (RemoteException remoteexception)
            {
                Log.e(TAG, (new StringBuilder()).append("dispatchMediaKeyEvent threw exception ").append(remoteexception).toString());
            }
            return;
        } else
        {
            Slog.w(TAG, "Unable to find IAudioService for media key event.");
            return;
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        int i = keyevent.getAction();
        int j = keyevent.getKeyCode();
        if (i == 0)
            return onKeyDown(j, keyevent);
        else
            return onKeyUp(j, keyevent);
    }

    AudioManager getAudioManager()
    {
        if (mAudioManager == null)
            mAudioManager = (AudioManager)mContext.getSystemService("audio");
        return mAudioManager;
    }

    KeyguardManager getKeyguardManager()
    {
        if (mKeyguardManager == null)
            mKeyguardManager = (KeyguardManager)mContext.getSystemService("keyguard");
        return mKeyguardManager;
    }

    SearchManager getSearchManager()
    {
        if (mSearchManager == null)
            mSearchManager = (SearchManager)mContext.getSystemService("search");
        return mSearchManager;
    }

    TelephonyManager getTelephonyManager()
    {
        if (mTelephonyManager == null)
            mTelephonyManager = (TelephonyManager)mContext.getSystemService("phone");
        return mTelephonyManager;
    }

    boolean onKeyDown(int i, KeyEvent keyevent)
    {
        android.view.KeyEvent.DispatcherState dispatcherstate = mView.getKeyDispatcherState();
        i;
        JVM INSTR lookupswitch 17: default 156
    //                   5: 189
    //                   24: 158
    //                   25: 158
    //                   27: 291
    //                   79: 182
    //                   84: 395
    //                   85: 170
    //                   86: 182
    //                   87: 182
    //                   88: 182
    //                   89: 182
    //                   90: 182
    //                   91: 182
    //                   126: 170
    //                   127: 170
    //                   130: 182
    //                   164: 158;
           goto _L1 _L2 _L3 _L3 _L4 _L5 _L6 _L7 _L5 _L5 _L5 _L5 _L5 _L5 _L7 _L7 _L5 _L3
_L1:
        return false;
_L3:
        getAudioManager().handleKeyDown(keyevent, 0x80000000);
        return true;
_L7:
        if (getTelephonyManager().getCallState() != 0)
            return true;
_L5:
        handleMediaKeyEvent(keyevent);
        return true;
_L2:
        if (!getKeyguardManager().inKeyguardRestrictedInputMode() && dispatcherstate != null)
        {
            if (keyevent.getRepeatCount() == 0)
                dispatcherstate.startTracking(keyevent, this);
            else
            if (keyevent.isLongPress() && dispatcherstate.isTracking(keyevent))
            {
                dispatcherstate.performedLongPress(keyevent);
                mView.performHapticFeedback(0);
                Intent intent2 = new Intent("android.intent.action.VOICE_COMMAND");
                intent2.setFlags(0x10000000);
                try
                {
                    sendCloseSystemWindows();
                    mContext.startActivity(intent2);
                }
                catch (ActivityNotFoundException activitynotfoundexception1)
                {
                    startCallActivity();
                }
            }
            return true;
        }
        continue; /* Loop/switch isn't completed */
_L4:
        if (!getKeyguardManager().inKeyguardRestrictedInputMode() && dispatcherstate != null)
        {
            if (keyevent.getRepeatCount() == 0)
                dispatcherstate.startTracking(keyevent, this);
            else
            if (keyevent.isLongPress() && dispatcherstate.isTracking(keyevent))
            {
                dispatcherstate.performedLongPress(keyevent);
                mView.performHapticFeedback(0);
                sendCloseSystemWindows();
                Intent intent1 = new Intent("android.intent.action.CAMERA_BUTTON", null);
                intent1.putExtra("android.intent.extra.KEY_EVENT", keyevent);
                mContext.sendOrderedBroadcastAsUser(intent1, UserHandle.CURRENT_OR_SELF, null, null, null, 0, null, null);
            }
            return true;
        }
        continue; /* Loop/switch isn't completed */
_L6:
        if (!getKeyguardManager().inKeyguardRestrictedInputMode() && dispatcherstate != null)
        {
            if (keyevent.getRepeatCount() == 0)
            {
                dispatcherstate.startTracking(keyevent, this);
                return false;
            }
            if (keyevent.isLongPress() && dispatcherstate.isTracking(keyevent))
            {
                Configuration configuration = mContext.getResources().getConfiguration();
                if (configuration.keyboard == 1 || configuration.hardKeyboardHidden == 2)
                {
                    Intent intent = new Intent("android.intent.action.SEARCH_LONG_PRESS");
                    intent.setFlags(0x10000000);
                    try
                    {
                        mView.performHapticFeedback(0);
                        sendCloseSystemWindows();
                        getSearchManager().stopSearch();
                        mContext.startActivity(intent);
                        dispatcherstate.performedLongPress(keyevent);
                    }
                    catch (ActivityNotFoundException activitynotfoundexception)
                    {
                        return false;
                    }
                    return true;
                }
            }
        }
        if (true) goto _L1; else goto _L8
_L8:
    }

    boolean onKeyUp(int i, KeyEvent keyevent)
    {
        boolean flag;
label0:
        {
label1:
            {
label2:
                {
                    flag = true;
                    android.view.KeyEvent.DispatcherState dispatcherstate = mView.getKeyDispatcherState();
                    if (dispatcherstate != null)
                        dispatcherstate.handleUpEvent(keyevent);
                    switch (i)
                    {
                    default:
                        break;

                    case 5: // '\005'
                        if (!getKeyguardManager().inKeyguardRestrictedInputMode())
                        {
                            if (keyevent.isTracking() && !keyevent.isCanceled())
                            {
                                startCallActivity();
                                return flag;
                            }
                            break label0;
                        }
                        break;

                    case 24: // '\030'
                    case 25: // '\031'
                    case 164: 
                        break label1;

                    case 79: // 'O'
                    case 85: // 'U'
                    case 86: // 'V'
                    case 87: // 'W'
                    case 88: // 'X'
                    case 89: // 'Y'
                    case 90: // 'Z'
                    case 91: // '['
                    case 126: // '~'
                    case 127: // '\177'
                    case 130: 
                        break label2;

                    case 27: // '\033'
                        if (!getKeyguardManager().inKeyguardRestrictedInputMode())
                        {
                            if (keyevent.isTracking() && !keyevent.isCanceled())
                                return flag;
                            break label0;
                        }
                        break;
                    }
                    flag = false;
                    break label0;
                }
                handleMediaKeyEvent(keyevent);
                return flag;
            }
            if (!keyevent.isCanceled() && (AudioManager)mContext.getSystemService("audio") != null)
            {
                getAudioManager().handleKeyUp(keyevent, 0x80000000);
                return flag;
            }
        }
        return flag;
    }

    public void preDispatchKeyEvent(KeyEvent keyevent)
    {
        getAudioManager().preDispatchKeyEvent(keyevent, 0x80000000);
    }

    void sendCloseSystemWindows()
    {
        PhoneWindowManager.sendCloseSystemWindows(mContext, null);
    }

    public void setView(View view)
    {
        mView = view;
    }

    void startCallActivity()
    {
        sendCloseSystemWindows();
        Intent intent = new Intent("android.intent.action.CALL_BUTTON");
        intent.setFlags(0x10000000);
        try
        {
            mContext.startActivity(intent);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Slog.w(TAG, "No activity found for android.intent.action.CALL_BUTTON.");
        }
    }

}
