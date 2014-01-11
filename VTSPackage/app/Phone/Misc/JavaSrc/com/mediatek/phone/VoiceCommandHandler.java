// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.Log;
import com.android.internal.telephony.Call;
import com.android.internal.telephony.CallManager;
import com.android.phone.NotificationMgr;
import com.android.phone.PhoneGlobals;
import com.mediatek.common.voicecommand.IVoiceCommandManager;
import com.mediatek.common.voicecommand.VoiceCommandListener;

public class VoiceCommandHandler
{
    public static interface Listener
    {

        public abstract void acceptIncomingCallByVoiceCommand();

        public abstract void rejectIncomingCallByVoiceCommand();
    }


    private static final String TAG = "VoiceCommandHandler";
    private static final int VOICE_COMMAND_RESULT_INCOMING_CALL_ACCEPT = 1;
    private static final int VOICE_COMMAND_RESULT_INCOMING_CALL_REJECT = 2;
    private Context mContext;
    private boolean mIsVoiceIdentifying;
    private Listener mListener;
    private VoiceCommandListener mVoiceCommandListener;

    public VoiceCommandHandler(Context context, Listener listener)
    {
        mContext = context;
        mListener = listener;
        mVoiceCommandListener = new VoiceCommandListener(mContext) {

            final VoiceCommandHandler this$0;

            public void onVoiceCommandNotified(int i, int j, Bundle bundle)
            {
                if (1 == i)
                    handleCommonVoiceCommand(j, bundle);
                else
                if (2 == i)
                {
                    handleUIVoiceCommand(j, bundle);
                    return;
                }
            }

            
            {
                this$0 = VoiceCommandHandler.this;
                VoiceCommandListener(context);
            }
        }
;
    }

    private void handleCommonVoiceCommand(int i, Bundle bundle)
    {
        log((new StringBuilder()).append("handleCommonVoiceCommand(): subAction = ").append(i).append(", extraData = ").append(bundle).toString());
        switch (i)
        {
        case 1: // '\001'
            if (1 == bundle.getInt("Result"))
            {
                log("handleCommonVoiceCommand(): extraData = ACTION_EXTRA_RESULT_SUCCESS");
                String as[] = bundle.getStringArray("Result_Info");
                if (as != null && as.length > 1)
                {
                    PhoneGlobals.getInstance().notificationMgr.showVoiceCommandNotification(as[0], as[1]);
                    return;
                } else
                {
                    log("ACTION_VOICE_UI_NOTIFY message extra comment is null or length < 2");
                    return;
                }
            } else
            {
                log("ACTION_VOICE_UI_NOTIFY message's extra data is not SUCCESS");
                return;
            }
        }
    }

    private void handleUIVoiceCommand(int i, Bundle bundle)
    {
        log((new StringBuilder()).append("handleUIVoiceCommand(): subAction = ").append(i).append(", extraData = ").append(bundle).toString());
        i;
        JVM INSTR tableswitch 1 5: default 68
    //                   1 69
    //                   2 147
    //                   3 68
    //                   4 68
    //                   5 153;
           goto _L1 _L2 _L3 _L1 _L1 _L4
_L1:
        return;
_L2:
        log("handleUIVoiceCommand(), VoiceCommandListener.ACTION_VOICE_UI_START");
        if (1 != bundle.getInt("Result"))
        {
            log("handleUIVoiceCommand(), ACTION_VOICE_UI_START message's extra data is not SUCCESS");
            return;
        }
        if (mContext != null)
        {
            IVoiceCommandManager ivoicecommandmanager = (IVoiceCommandManager)mContext.getSystemService("voicecommand");
            if (ivoicecommandmanager != null)
            {
                try
                {
                    ivoicecommandmanager.sendCommand(mContext, 1, 1, null);
                    return;
                }
                catch (RemoteException remoteexception)
                {
                    log("RemoteException happens during send main voice common command");
                    return;
                }
                catch (IllegalAccessException illegalaccessexception)
                {
                    log("IllegalAccessException happens during send main voice common command");
                }
                return;
            }
        }
        continue; /* Loop/switch isn't completed */
_L3:
        log("handleUIVoiceCommand(), VoiceCommandListener.ACTION_VOICE_UI_STOP");
        return;
_L4:
        int j;
        log("handleUIVoiceCommand(), VoiceCommandListener.ACTION_VOICE_UI_NOTIFY");
        PhoneGlobals.getInstance().notificationMgr.cancelVoiceCommandNotification();
        if (1 != bundle.getInt("Result"))
        {
            log("handleUIVoiceCommand(), ACTION_VOICE_UI_NOTIFY message's extra data is not SUCCESS");
            return;
        }
        stopVoiceCommand();
        j = bundle.getInt("Result_Info");
        if (1 != j)
            break; /* Loop/switch isn't completed */
        log("handleUIVoiceCommand(), accept");
        if (mListener != null)
        {
            mListener.acceptIncomingCallByVoiceCommand();
            return;
        }
        if (true) goto _L1; else goto _L5
_L5:
        if (2 == j)
        {
            log("handleUIVoiceCommand(), reject");
            if (mListener != null)
            {
                mListener.rejectIncomingCallByVoiceCommand();
                return;
            }
        } else
        {
            log("invalid command id");
            return;
        }
        if (true) goto _L1; else goto _L6
_L6:
    }

    public static boolean isValidCondition()
    {
        Call call = PhoneGlobals.getInstance().mCM.getFirstActiveRingingCall();
        return call != null && com.android.internal.telephony.Call.State.INCOMING == call.getState() && !PhoneGlobals.getInstance().mCM.hasActiveFgCall() && !PhoneGlobals.getInstance().mCM.hasActiveBgCall();
    }

    private static void log(String s)
    {
        Log.d("VoiceCommandHandler", s);
    }

    public void clear()
    {
        mContext = null;
        mListener = null;
    }

    public boolean isVoiceIdentifying()
    {
        return mIsVoiceIdentifying;
    }

    public void startVoiceCommand()
    {
        log("startVoiceCommand()");
        if (mContext == null)
        {
            log("mContext is null, just return");
        } else
        {
            if (mIsVoiceIdentifying)
            {
                log("already voice identifying, just return");
                return;
            }
            IVoiceCommandManager ivoicecommandmanager = (IVoiceCommandManager)mContext.getSystemService("voicecommand");
            if (ivoicecommandmanager != null)
            {
                try
                {
                    ivoicecommandmanager.registerListener(mVoiceCommandListener);
                    ivoicecommandmanager.sendCommand(mContext, 2, 1, null);
                    mIsVoiceIdentifying = true;
                    return;
                }
                catch (RemoteException remoteexception)
                {
                    log("RemoteException happens during start voice command");
                    return;
                }
                catch (IllegalAccessException illegalaccessexception)
                {
                    log("IllegalAccessException happens during start voice command");
                }
                return;
            }
        }
    }

    public void stopVoiceCommand()
    {
        log("stopVoiceCommand()");
        if (mContext == null)
        {
            log("mContext is null, just return");
        } else
        {
            if (!mIsVoiceIdentifying)
            {
                log("already not voice voidentifying, just return");
                return;
            }
            PhoneGlobals.getInstance().notificationMgr.cancelVoiceCommandNotification();
            IVoiceCommandManager ivoicecommandmanager = (IVoiceCommandManager)mContext.getSystemService("voicecommand");
            if (ivoicecommandmanager != null)
            {
                try
                {
                    ivoicecommandmanager.sendCommand(mContext, 2, 2, null);
                    ivoicecommandmanager.unRegisterListener(mVoiceCommandListener);
                    mIsVoiceIdentifying = false;
                    return;
                }
                catch (RemoteException remoteexception)
                {
                    log("RemoteException happens during stop voice command");
                    return;
                }
                catch (IllegalAccessException illegalaccessexception)
                {
                    log("IllegalAccessException happens during stop voice command");
                }
                return;
            }
        }
    }


}
