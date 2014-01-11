// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt.loopback;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.os.*;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.android.phone.*;
import com.mediatek.phone.DualTalkUtils;
import com.mediatek.phone.ext.VTInCallScreenExtension;
import com.mediatek.phone.recording.PhoneRecorder;
import com.mediatek.phone.recording.PhoneRecorderHandler;
import com.mediatek.phone.vt.VTCallUtils;
import com.mediatek.settings.VTAdvancedSetting;
import com.mediatek.settings.VTSettingUtils;
import com.mediatek.vt.VTManager;
import java.util.*;

// Referenced classes of package com.mediatek.vt.loopback:
//            VTInCallScreenFlagsLoopback

public class VTInCallScreenLoopback extends RelativeLayout
    implements android.view.SurfaceHolder.Callback, android.view.View.OnClickListener, android.widget.PopupMenu.OnMenuItemClickListener, android.widget.PopupMenu.OnDismissListener, android.view.View.OnTouchListener
{
    public class DialogCancelTimer
    {

        private AlertDialog mAsker;
        private final int mSeconds;
        private final Timer mTimer = new Timer();
        final VTInCallScreenLoopback this$0;

        public void start()
        {
            mTimer.schedule(new TimerTask() {

                final DialogCancelTimer this$1;

                public void run()
                {
                    if (mAsker != null && mAsker.isShowing())
                        mAsker.cancel();
                    mTimer.cancel();
                }

            
            {
                this$1 = DialogCancelTimer.this;
                super();
            }
            }
, 1000 * mSeconds);
        }



        public DialogCancelTimer(int i, AlertDialog alertdialog)
        {
            this$0 = VTInCallScreenLoopback.this;
            super();
            mSeconds = i;
            mAsker = alertdialog;
        }
    }

    class InCallVideoSettingLocalEffectListener
        implements android.content.DialogInterface.OnClickListener
    {

        private ArrayList mValues;
        final VTInCallScreenLoopback this$0;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            if (mInCallVideoSettingLocalEffectDialog != null)
            {
                mInCallVideoSettingLocalEffectDialog.dismiss();
                mInCallVideoSettingLocalEffectDialog = null;
            }
            VTManager.getInstance().setColorEffect(((CharSequence)mValues.get(i)).toString());
            updateLocalZoomOrBrightness();
        }

        public void setValues(ArrayList arraylist)
        {
            for (int i = 0; i < arraylist.size(); i++)
                mValues.add(arraylist.get(i));

        }

        InCallVideoSettingLocalEffectListener()
        {
            this$0 = VTInCallScreenLoopback.this;
            super();
            mValues = new ArrayList();
        }
    }


    private static final boolean DBG = true;
    private static final int DELAYED_CLEANUP_AFTER_DISCONNECT = 146;
    private static final int DELAYED_CLEANUP_AFTER_DISCONNECT2 = 147;
    private static final int HIDDEN = 0;
    private static final String LOG_TAG = "VTInCallScreenLoopback";
    private static final int SECOND_TO_MILLISECOND = 1000;
    private static final boolean VDBG = true;
    private static final int VISIBLE = 255;
    private static final int VT_MEDIA_ERROR_VIDEO_FAIL = 1;
    private static final int VT_MEDIA_OCCUPIED = 1;
    private static final int VT_MEDIA_RECORDER_ERROR_UNKNOWN = 1;
    private static final int VT_MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED = 801;
    private static final int VT_MEDIA_RECORDER_NO_I_FRAME = 32767;
    private static final int VT_PEER_SNAPSHOT_FAIL = 127;
    private static final int VT_PEER_SNAPSHOT_OK = 126;
    private static final int VT_TAKE_PEER_PHOTO_DISK_MIN_SIZE = 0xf4240;
    private static final int WAITING_TIME_FOR_ASK_VT_SHOW_ME = 5;
    private Activity mActivity;
    private PopupMenu mAudioModePopup;
    private boolean mAudioModePopupVisible;
    private CallManager mCM;
    private MTKCallManager mCMGemini;
    private DTMFTwelveKeyDialer mDialer;
    private VTInCallScreenExtension mExtension;
    private Handler mHandler = new Handler() {

        final VTInCallScreenLoopback this$0;

        public void handleMessage(Message message)
        {
            log((new StringBuilder()).append("VTInCallScreen Handler message:").append(message).toString());
            message.what;
            JVM INSTR lookupswitch 20: default 200
        //                       1: 320
        //                       2: 312
        //                       3: 342
        //                       4: 264
        //                       5: 226
        //                       6: 405
        //                       7: 295
        //                       8: 1039
        //                       9: 1218
        //                       16: 1247
        //                       126: 429
        //                       127: 458
        //                       32769: 487
        //                       32770: 734
        //                       32771: 825
        //                       32772: 925
        //                       32773: 1070
        //                       32774: 1118
        //                       32775: 1153
        //                       33025: 639;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L21
_L1:
            Log.wtf("VTInCallScreenLoopback", (new StringBuilder()).append("mHandler: unexpected message: ").append(message).toString());
_L23:
            return;
_L6:
            log("- handler : VT_MSG_DISCONNECTED ! ");
            VTInCallScreenFlagsLoopback.getInstance().mVTVideoConnected = false;
            VTInCallScreenFlagsLoopback.getInstance().mVTHasReceiveFirstFrame = false;
            updateVTScreen(getVTScreenMode());
            return;
_L5:
            log("- handler : VT_MSG_CONNECTED ! ");
            VTInCallScreenFlagsLoopback.getInstance().mVTVideoConnected = true;
            updateVTScreen(getVTScreenMode());
            return;
_L8:
            log("- handler : VT_MSG_START_COUNTER ! ");
            onReceiveVTManagerStartCounter();
            return;
_L3:
            setVTSettingToVTManager();
            return;
_L2:
            VTInCallScreenFlagsLoopback.getInstance().mVTVideoReady = false;
            updateVTScreen(getVTScreenMode());
            return;
_L4:
            log("- handler : VT_MSG_READY ! ");
            onReceiveVTManagerReady();
            log("ready to set onConnected");
            VTManager.getInstance().onConnected();
            log((new StringBuilder()).append("finish to set onConnect,mState=").append(VTManager.getInstance().getState()).toString());
            return;
_L7:
            log("- handler : VT_MSG_EM_INDICATION ! ");
            showToast((String)message.obj);
            return;
_L12:
            log("- handler : VT_PEER_SNAPSHOT_OK ! ");
            showToast(getResources().getString(0x7f0d003b));
            return;
_L13:
            log("- handler : VT_PEER_SNAPSHOT_FAIL ! ");
            showToast(getResources().getString(0x7f0d003c));
            return;
_L14:
            log("- handler : VT_ERROR_CALL_DISCONNECT ! ");
            if (!VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                showToast(getResources().getString(0x7f0d003d));
                log((new StringBuilder()).append("toast is shown, string is ").append(getResources().getString(0x7f0d003d)).toString());
                VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall = true;
            }
            if (mCM.getActiveFgCall() == null) goto _L23; else goto _L22
_L22:
            log("- handler : (VT_ERROR_CALL_DISCONNECT) - ForegroundCall exists, so hangup it ! ");
            try
            {
                mCM.hangupActiveCall(mCM.getActiveFgCall());
                return;
            }
            catch (CallStateException callstateexception2)
            {
                log("- handler : (VT_ERROR_CALL_DISCONNECT) - CallStateException ! ");
            }
            return;
_L21:
            log("- handler : VT_NORMAL_END_SESSION_COMMAND ! ");
            if (!VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
                VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall = true;
            if (mCM.getActiveFgCall() == null) goto _L23; else goto _L24
_L24:
            log("- handler : (VT_NORMAL_END_SESSION_COMMAND) - ForegroundCall exists, so hangup it ! ");
            try
            {
                mCM.hangupActiveCall(mCM.getActiveFgCall());
                return;
            }
            catch (CallStateException callstateexception1)
            {
                log("- handler : (VT_NORMAL_END_SESSION_COMMAND) - CallStateException ! ");
            }
            return;
_L15:
            log("- handler : VT_ERROR_START_VTS_FAIL ! ");
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall || mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE) goto _L23; else goto _L25
_L25:
            if (1 == message.arg2)
                showToast(getResources().getString(0x7f0d0077));
            else
                showToast(getResources().getString(0x7f0d003e));
            VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall = true;
            return;
_L16:
            log("- handler : VT_ERROR_CAMERA ! ");
            if (!VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                if (1 == message.arg2)
                    showToast(getResources().getString(0x7f0d0076));
                else
                    showToast(getResources().getString(0x7f0d003e));
                VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall = true;
            }
            log("- handler : (VT_ERROR_CAMERA) - ForegroundCall exists, so hangup it ! ");
            return;
_L17:
            log("- handler : VT_ERROR_MEDIA_SERVER_DIED ! ");
            if (!VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                showToast(getResources().getString(0x7f0d003e));
                VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall = true;
            }
            if (mCM.getActiveFgCall() == null) goto _L23; else goto _L26
_L26:
            log("- handler : (VT_ERROR_MEDIA_SERVER_DIED) - ForegroundCall exists, so hangup it ! ");
            try
            {
                mCM.hangupActiveCall(mCM.getActiveFgCall());
                return;
            }
            catch (CallStateException callstateexception)
            {
                log("- handler : (VT_ERROR_MEDIA_SERVER_DIED) - CallStateException ! ");
            }
            return;
_L9:
            log("- handler : VT_MSG_RECEIVE_FIRSTFRAME ! ");
            onVTReceiveFirstFrame();
            updateVTScreen(getVTScreenMode());
            return;
_L18:
            if (32767 == message.arg1)
            {
                showToast(getResources().getString(0x7f0d0069));
                return;
            }
            if (801 != message.arg1) goto _L23; else goto _L27
_L27:
            stopRecord();
            return;
_L19:
            if (1 != message.arg1) goto _L23; else goto _L28
_L28:
            showToast(getResources().getString(0x7f0d006e));
            stopRecord();
            return;
_L20:
            if (message.arg1 == 0)
            {
                log("- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE, arg is OK ");
                showToast(getResources().getString(0x7f0d006b));
                return;
            } else
            {
                log("- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE, arg is not OK ");
                showToast(getResources().getString(0x7f0d006d));
                return;
            }
_L10:
            log("- handler : VT_MSG_PEER_CAMERA_OPEN ! ");
            showToast(getResources().getString(0x7f0d0065));
            return;
_L11:
            log("- handler : VT_MSG_PEER_CAMERA_CLOSE ! ");
            showToast(getResources().getString(0x7f0d0066));
            return;
        }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
    }
;
    private SurfaceHolder mHighVideoHolder;
    private AlertDialog mInCallVideoSettingDialog;
    private AlertDialog mInCallVideoSettingLocalEffectDialog;
    private AlertDialog mInCallVideoSettingLocalNightmodeDialog;
    private AlertDialog mInCallVideoSettingPeerQualityDialog;
    private boolean mLocaleChanged;
    private SurfaceHolder mLowVideoHolder;
    private CompoundButton mVTAudio;
    private CompoundButton mVTDialpad;
    private ImageButton mVTHangUp;
    private LinearLayout mVTHangUpWrapper;
    private ImageButton mVTHighDown;
    private ImageButton mVTHighUp;
    private SurfaceView mVTHighVideo;
    private ViewGroup mVTInCallCanvas;
    private ImageButton mVTLowDown;
    private ImageButton mVTLowUp;
    private SurfaceView mVTLowVideo;
    private AlertDialog mVTMTAsker;
    private CompoundButton mVTMute;
    private ImageButton mVTOverflowMenu;
    private PopupMenu mVTPopupMenu;
    private PowerManager mVTPowerManager;
    ArrayList mVTRecorderEntries;
    private AlertDialog mVTRecorderSelector;
    private com.android.phone.Constants.VTScreenMode mVTScreenMode;
    private CompoundButton mVTSwapVideo;
    private AlertDialog mVTVoiceReCallDialog;
    private ImageView mVTVoiceRecordingIcon;
    private android.os.PowerManager.WakeLock mVTWakeLock;

    public VTInCallScreenLoopback(Context context)
    {
        super(context);
        mVTScreenMode = com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE;
        log("VTInCallScreen constructor...");
        log((new StringBuilder()).append("- this = ").append(this).toString());
        mCM = PhoneGlobals.getInstance().mCM;
        mCMGemini = PhoneGlobals.getInstance().mCMGemini;
    }

    public VTInCallScreenLoopback(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mVTScreenMode = com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE;
        mCM = PhoneGlobals.getInstance().mCM;
        mCMGemini = PhoneGlobals.getInstance().mCMGemini;
    }

    public VTInCallScreenLoopback(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mVTScreenMode = com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE;
        mCM = PhoneGlobals.getInstance().mCM;
        mCMGemini = PhoneGlobals.getInstance().mCMGemini;
    }

    private void closeVTInCallCanvas()
    {
        log("closeVTInCallCanvas!");
        if (mVTPopupMenu != null)
            mVTPopupMenu.dismiss();
        dismissAudioModePopup();
        if (mVTInCallCanvas != null)
        {
            mVTInCallCanvas.setClickable(false);
            mVTInCallCanvas.setVisibility(8);
        }
        if (mVTHighVideo != null)
            mVTHighVideo.setVisibility(8);
        if (mVTLowVideo != null)
            mVTLowVideo.setVisibility(8);
    }

    private void closeVTManager()
    {
        log("closeVTManager()!");
        dismissVTDialogs();
        updateVTScreen(getVTScreenMode());
        mHandler.removeMessages(32769);
        if ((PhoneUtils.isSupportFeature("VT_VOICE_RECORDING") || PhoneUtils.isSupportFeature("VT_VIDEO_RECORDING")) && PhoneRecorderHandler.getInstance().isVTRecording())
            stopRecord();
        log("- call VTManager onDisconnected ! ");
        VTManager.getInstance().onDisconnected();
        log("- finish call VTManager onDisconnected ! ");
        log("- set VTManager close ! ");
        VTManager.getInstance().setVTClose();
        log("- finish set VTManager close ! ");
        if (getVTInControlRes())
        {
            log("VTInCallScreenLoopback:closeVTManager:sendIntent_CALL_END");
            mActivity.sendBroadcast(new Intent("android.phone.extra.VT_CALL_END"));
            setVTInControlRes(false);
        }
    }

    private PopupMenu constructPopupMenu(View view)
    {
        if (mVTPopupMenu == null)
        {
            mVTPopupMenu.inflate(0x7f100004);
            mVTPopupMenu.setOnMenuItemClickListener(this);
        }
        setupMenuItems(mVTPopupMenu.getMenu());
        return mVTPopupMenu;
    }

    private void dismissAudioModePopup()
    {
        if (mAudioModePopup != null)
        {
            mAudioModePopup.dismiss();
            mAudioModePopup = null;
            mAudioModePopupVisible = false;
        }
    }

    private void dismissVideoSettingDialogs()
    {
        if (mInCallVideoSettingDialog != null)
        {
            mInCallVideoSettingDialog.dismiss();
            mInCallVideoSettingDialog = null;
        }
        if (mInCallVideoSettingLocalEffectDialog != null)
        {
            mInCallVideoSettingLocalEffectDialog.dismiss();
            mInCallVideoSettingLocalEffectDialog = null;
        }
        if (mInCallVideoSettingLocalNightmodeDialog != null)
        {
            mInCallVideoSettingLocalNightmodeDialog.dismiss();
            mInCallVideoSettingLocalNightmodeDialog = null;
        }
        if (mInCallVideoSettingPeerQualityDialog != null)
        {
            mInCallVideoSettingPeerQualityDialog.dismiss();
            mInCallVideoSettingPeerQualityDialog = null;
        }
    }

    private boolean getVTInControlRes()
    {
        return VTInCallScreenFlagsLoopback.getInstance().mVTInControlRes;
    }

    private void handleAudioButtonClick()
    {
    }

    private void hideLocalZoomOrBrightness()
    {
        log("hideLocalZoomOrBrightness()...");
        mVTHighUp.setVisibility(8);
        mVTHighDown.setVisibility(8);
        mVTLowUp.setVisibility(8);
        mVTLowDown.setVisibility(8);
    }

    private boolean isDialerOpened()
    {
        return mDialer != null && mDialer.isOpened();
    }

    private void log(String s)
    {
        Log.d("VTInCallScreenLoopback", s);
    }

    private void makeVoiceReCall(String s, int i)
    {
        log((new StringBuilder()).append("makeVoiceReCall(), number is ").append(s).append(" slot is ").append(i).toString());
        Intent intent = new Intent("android.intent.action.CALL", Uri.fromParts("tel", s, null));
        intent.putExtra("com.android.phone.extra.slot", i);
        intent.putExtra("com.android.phone.extra.international", 2);
        intent.setFlags(0x14000000);
        PhoneGlobals.getInstance().startActivity(intent);
        mActivity.finish();
    }

    private boolean okToRecordVoice()
    {
        return VTInCallScreenFlagsLoopback.getInstance().mVTVideoConnected;
    }

    private void onReceiveVTManagerReady()
    {
        VTInCallScreenFlagsLoopback.getInstance().mVTVideoReady = true;
        updateVTScreen(getVTScreenMode());
        log("Incallscreen, before call setting");
        if (!PhoneUtils.isDMLocked())
        {
            log("Now DM not locked, VTManager.getInstance().unlockPeerVideo() start;");
            VTManager.getInstance().unlockPeerVideo();
            log("Now DM not locked, VTManager.getInstance().unlockPeerVideo() end;");
            if (VTSettingUtils.getInstance().mShowLocalMT.equals("1") && VTInCallScreenFlagsLoopback.getInstance().mVTIsMT)
            {
                log("- VTSettingUtils.getInstance().mShowLocalMT : 1 !");
                log("Incallscreen, before enableAlwaysAskSettings");
                VTManager.getInstance().enableAlwaysAskSettings(1);
                log("Incallscreen, after enableAlwaysAskSettings");
                mVTMTAsker = (new android.app.AlertDialog.Builder(PhoneGlobals.getInstance().getInCallScreenInstance())).setMessage(getResources().getString(0x7f0d0037)).setPositiveButton(getResources().getString(0x7f0d0038), new android.content.DialogInterface.OnClickListener() {

                    final VTInCallScreenLoopback this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        log(" user select yes !! ");
                        log("Incallscreen, before userSelectYes");
                        VTManager.getInstance().userSelectYes(1);
                        log("Incallscreen, after userSelectYes");
                        if (mVTMTAsker != null)
                        {
                            mVTMTAsker.dismiss();
                            mVTMTAsker = null;
                        }
                        VTSettingUtils.getInstance().mShowLocalMT = "0";
                        onVTHideMeClick();
                    }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
                }
).setNegativeButton(getResources().getString(0x7f0d0039), new android.content.DialogInterface.OnClickListener() {

                    final VTInCallScreenLoopback this$0;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        log(" user select no !! ");
                        log("Incallscreen, before userSelectYes");
                        VTManager.getInstance().userSelectYes(0);
                        log("Incallscreen, after userSelectYes");
                        if (mVTMTAsker != null)
                        {
                            mVTMTAsker.dismiss();
                            mVTMTAsker = null;
                        }
                        VTSettingUtils.getInstance().mShowLocalMT = "2";
                    }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
                }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                    final VTInCallScreenLoopback this$0;

                    public void onCancel(DialogInterface dialoginterface)
                    {
                        log(" user no selection , default show !! ");
                        log("Incallscreen, before userSelect default");
                        VTManager.getInstance().userSelectYes(2);
                        log("Incallscreen, after userSelect default");
                        if (mVTMTAsker != null)
                        {
                            mVTMTAsker.dismiss();
                            mVTMTAsker = null;
                        }
                        VTSettingUtils.getInstance().mShowLocalMT = "0";
                        onVTHideMeClick();
                    }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
                }
).create();
                mVTMTAsker.show();
                (new DialogCancelTimer(5, mVTMTAsker)).start();
            }
        }
    }

    private void onVTHideMeClick()
    {
        boolean flag = true;
        log("onVTHideMeClick()...");
        if (VTManager.getInstance().getState() != com.mediatek.vt.VTManager.State.READY && VTManager.getInstance().getState() != com.mediatek.vt.VTManager.State.CONNECTED)
            return;
        if (VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow)
            VTManager.getInstance().setLocalVideoType(0, "");
        else
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("0"))
            VTManager.getInstance().setLocalVideoType(flag, VTAdvancedSetting.getPicPathDefault());
        else
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("1"))
            VTManager.getInstance().setLocalVideoType(2, "");
        else
            VTManager.getInstance().setLocalVideoType(flag, VTAdvancedSetting.getPicPathUserselect(VTInCallScreenFlagsLoopback.getInstance().mVTSlotId));
        VTInCallScreenFlagsLoopback vtincallscreenflagsloopback = VTInCallScreenFlagsLoopback.getInstance();
        if (VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow)
            flag = false;
        vtincallscreenflagsloopback.mVTHideMeNow = flag;
        updateVTScreen(getVTScreenMode());
    }

    private void onVTHideMeClick2()
    {
        log("onVTHideMeClick2()...");
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("2"))
            VTManager.getInstance().setLocalVideoType(1, VTAdvancedSetting.getPicPathUserselect(VTInCallScreenFlagsLoopback.getInstance().mVTSlotId));
        else
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("1"))
            VTManager.getInstance().setLocalVideoType(2, "");
        else
            VTManager.getInstance().setLocalVideoType(1, VTAdvancedSetting.getPicPathDefault());
        VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow = true;
    }

    private void onVTInCallVideoSetting()
    {
        log("onVTInCallVideoSetting() ! ");
        new android.content.DialogInterface.OnClickListener() {

            private static final int DIALOG_ITEM_FOUR = 4;
            private static final int DIALOG_ITEM_THREE = 3;
            final VTInCallScreenLoopback this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mInCallVideoSettingDialog != null)
                {
                    mInCallVideoSettingDialog.dismiss();
                    mInCallVideoSettingDialog = null;
                }
                if (i == 0)
                {
                    log("onVTInCallVideoSetting() : select - 0 ");
                    if (!VTManager.getInstance().canDecZoom() && !VTManager.getInstance().canIncZoom())
                    {
                        showToast(getResources().getString(0x7f0d004e));
                        return;
                    } else
                    {
                        showVTLocalZoom();
                        return;
                    }
                }
                if (1 == i)
                {
                    log("onVTInCallVideoSetting() : select - 1 ");
                    if (!VTManager.getInstance().canDecBrightness() && !VTManager.getInstance().canIncBrightness())
                    {
                        showToast(getResources().getString(0x7f0d004e));
                        return;
                    } else
                    {
                        showVTLocalBrightness();
                        return;
                    }
                }
                if (2 == i)
                {
                    log("onVTInCallVideoSetting() : select - 2 ");
                    if (!VTManager.getInstance().canDecContrast() && !VTManager.getInstance().canIncContrast())
                    {
                        showToast(getResources().getString(0x7f0d004e));
                        return;
                    } else
                    {
                        showVTLocalContrast();
                        return;
                    }
                }
                if (3 == i)
                {
                    log("onVTInCallVideoSetting() : select - 3 ");
                    onVTInCallVideoSettingLocalEffect();
                    return;
                }
                if (4 == i)
                {
                    log("onVTInCallVideoSetting() : select - 4 ");
                    onVTInCallVideoSettingLocalNightMode();
                    return;
                } else
                {
                    log("onVTInCallVideoSetting() : select - 5 ");
                    onVTInCallVideoSettingPeerQuality();
                    return;
                }
            }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
        }
;
    }

    private void onVTInCallVideoSettingLocalEffect()
    {
        log("onVTInCallVideoSettingLocalEffect() ! ");
        List list = VTManager.getInstance().getSupportedColorEffects();
        if (list != null && list.size() > 0)
        {
            String as[] = getResources().getStringArray(0x7f070015);
            String as1[] = getResources().getStringArray(0x7f070014);
            ArrayList arraylist = new ArrayList();
            ArrayList arraylist1 = new ArrayList();
            int i = 0;
            for (int j = as.length; i < j; i++)
                if (list.indexOf(as[i].toString()) >= 0)
                {
                    arraylist.add(as[i]);
                    arraylist1.add(as1[i]);
                }

            log((new StringBuilder()).append("onVTInCallVideoSettingLocalEffect() : entryValues2.size() - ").append(arraylist.size()).toString());
            arraylist.indexOf(VTManager.getInstance().getColorEffect());
            (new InCallVideoSettingLocalEffectListener()).setValues(arraylist);
            return;
        } else
        {
            return;
        }
    }

    private void onVTInCallVideoSettingLocalNightMode()
    {
        log("onVTInCallVideoSettingLocalNightMode() ! ");
        new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreenLoopback this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mInCallVideoSettingLocalNightmodeDialog != null)
                {
                    mInCallVideoSettingLocalNightmodeDialog.dismiss();
                    mInCallVideoSettingLocalNightmodeDialog = null;
                }
                if (i == 0)
                {
                    log("onVTInCallVideoSettingLocalNightMode() : VTManager.getInstance().setNightMode(true);");
                    VTManager.getInstance().setNightMode(true);
                    updateLocalZoomOrBrightness();
                } else
                if (1 == i)
                {
                    log("onVTInCallVideoSettingLocalNightMode() : VTManager.getInstance().setNightMode(false);");
                    VTManager.getInstance().setNightMode(false);
                    updateLocalZoomOrBrightness();
                    return;
                }
            }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
        }
;
    }

    private void onVTInCallVideoSettingPeerQuality()
    {
        log("onVTInCallVideoSettingPeerQuality() ! ");
        new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreenLoopback this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mInCallVideoSettingPeerQualityDialog != null)
                {
                    mInCallVideoSettingPeerQualityDialog.dismiss();
                    mInCallVideoSettingPeerQualityDialog = null;
                }
                if (i == 0)
                {
                    log("onVTInCallVideoSettingPeerQuality() : VTManager.getInstance().setVideoQuality( VTManager.VT_VQ_NORMAL );");
                    VTManager.getInstance().setVideoQuality(1);
                } else
                if (1 == i)
                {
                    log("onVTInCallVideoSettingPeerQuality() : VTManager.getInstance().setVideoQuality( VTManager.VT_VQ_SHARP );");
                    VTManager.getInstance().setVideoQuality(0);
                    return;
                }
            }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
        }
;
    }

    private void onVTReceiveFirstFrame()
    {
        log("onVTReceiveFirstFrame() ! ");
        if (VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
        {
            if (mVTHighVideo != null && mVTHighVideo.getBackground() != null)
                mVTHighVideo.setBackgroundDrawable(null);
        } else
        if (mVTLowVideo != null && mVTLowVideo.getBackground() != null)
            mVTLowVideo.setBackgroundDrawable(null);
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTHasReceiveFirstFrame)
            VTInCallScreenFlagsLoopback.getInstance().mVTHasReceiveFirstFrame = true;
    }

    private void onVTShowDialpad()
    {
        log("onVTShowDialpad() ! ");
        if (mDialer.isOpened())
        {
            log("onShowHideDialpad(): Set mInCallTitle VISIBLE");
            mDialer.closeDialer(true);
        }
        mDialer.openDialer(true);
    }

    private void onVTSwapVideos()
    {
        log("onVTSwapVideos() ! ");
        if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting || VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting || VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting)
            hideLocalZoomOrBrightness();
        VTInCallScreenFlagsLoopback vtincallscreenflagsloopback = VTInCallScreenFlagsLoopback.getInstance();
        boolean flag;
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
            flag = true;
        else
            flag = false;
        vtincallscreenflagsloopback.mVTPeerBigger = flag;
        VTManager.getInstance().setVTVisible(false);
        updateVTLocalPeerDisplay();
        VTManager.getInstance().setVTVisible(true);
        if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting)
            showVTLocalZoom();
        if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting)
            showVTLocalBrightness();
        if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting)
            showVTLocalContrast();
    }

    private void onVTSwitchCameraClick()
    {
        log("onVTSwitchCameraClick()...");
        if (VTManager.getInstance().getState() != com.mediatek.vt.VTManager.State.READY && VTManager.getInstance().getState() != com.mediatek.vt.VTManager.State.CONNECTED)
            return;
        if (VTInCallScreenFlagsLoopback.getInstance().mVTInSwitchCamera)
        {
            log("VTManager is handling switchcamera now, so returns this time.");
            return;
        }
        (new Thread() {

            final VTInCallScreenLoopback this$0;

            public void run()
            {
                VTInCallScreenFlagsLoopback.getInstance().mVTInSwitchCamera = true;
                VTManager.getInstance().switchCamera();
                VTInCallScreenFlagsLoopback.getInstance().mVTInSwitchCamera = false;
            }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
        }
).start();
        VTInCallScreenFlagsLoopback vtincallscreenflagsloopback = VTInCallScreenFlagsLoopback.getInstance();
        boolean flag;
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTFrontCameraNow)
            flag = true;
        else
            flag = false;
        vtincallscreenflagsloopback.mVTFrontCameraNow = flag;
        updateVTScreen(getVTScreenMode());
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
        hideLocalZoomOrBrightness();
    }

    private void onVTTakePeerPhotoClick()
    {
        log("onVTTakePeerPhotoClick()...");
        if (VTManager.getInstance().getState() == com.mediatek.vt.VTManager.State.CONNECTED)
        {
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInSnapshot)
            {
                log("VTManager is handling snapshot now, so returns this time.");
                return;
            }
            if (PhoneUtils.isExternalStorageMounted() && PhoneUtils.diskSpaceAvailable(0xf4240L))
            {
                (new Thread() {

                    final VTInCallScreenLoopback this$0;

                    public void run()
                    {
                        VTInCallScreenFlagsLoopback.getInstance().mVTInSnapshot = true;
                        boolean flag = VTManager.getInstance().savePeerPhoto();
                        log((new StringBuilder()).append("onVTTakePeerPhotoClick(): VTManager.getInstance().savePeerPhoto(), return ").append(flag).toString());
                        if (flag)
                            mHandler.sendMessage(Message.obtain(mHandler, 126));
                        else
                            mHandler.sendMessage(Message.obtain(mHandler, 127));
                        VTInCallScreenFlagsLoopback.getInstance().mVTInSnapshot = false;
                    }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
                }
).start();
                return;
            }
        }
    }

    private void onVoiceVideoRecordClick(MenuItem menuitem)
    {
        log("onVoiceVideoRecordClick");
        if (menuitem.getTitle().toString() != null && PhoneUtils.isExternalStorageMounted() && !PhoneUtils.diskSpaceAvailable(0x200000L))
            return;
        else
            return;
    }

    private void openVTInCallCanvas()
    {
        log("openVTInCallCanvas!");
        if (mVTInCallCanvas != null)
        {
            mVTInCallCanvas.setClickable(true);
            mVTInCallCanvas.setVisibility(0);
        }
        if (mVTHighVideo != null)
            mVTHighVideo.setVisibility(0);
        if (mVTLowVideo != null)
            mVTLowVideo.setVisibility(0);
    }

    private void setVTInControlRes(boolean flag)
    {
        VTInCallScreenFlagsLoopback.getInstance().mVTInControlRes = flag;
    }

    private void setVTSettingToVTManager()
    {
        if (VTSettingUtils.getInstance().mToReplacePeer)
            VTManager.getInstance().enableHideYou(1);
        else
            VTManager.getInstance().enableHideYou(0);
        if (VTSettingUtils.getInstance().mShowLocalMO)
            VTManager.getInstance().enableHideMe(0);
        else
            VTManager.getInstance().enableHideMe(1);
        if (VTSettingUtils.getInstance().mShowLocalMT.equals("0"))
            VTManager.getInstance().incomingVideoDispaly(0);
        else
        if (VTSettingUtils.getInstance().mShowLocalMT.equals("1"))
            VTManager.getInstance().incomingVideoDispaly(1);
        else
            VTManager.getInstance().incomingVideoDispaly(2);
        log("Incallscreen, after call setting");
    }

    private void showAudioModePopup()
    {
        log("showAudioModePopup()...");
        dismissAudioModePopup();
        if (mAudioModePopup == null)
        {
            mAudioModePopup.getMenuInflater().inflate(0x7f100001, mAudioModePopup.getMenu());
            mAudioModePopup.setOnMenuItemClickListener(this);
            mAudioModePopup.setOnDismissListener(this);
        }
        Menu menu = mAudioModePopup.getMenu();
        menu.findItem(0x7f080134);
        MenuItem menuitem = menu.findItem(0x7f080135);
        MenuItem menuitem1 = menu.findItem(0x7f080136);
        boolean flag = PhoneGlobals.getInstance().isHeadsetPlugged();
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        menuitem.setVisible(flag1);
        boolean flag2 = false;
        if (!flag)
            flag2 = true;
        menuitem.setEnabled(flag2);
        menuitem1.setVisible(flag);
        menuitem1.setEnabled(flag);
        menu.findItem(0x7f080137);
        mAudioModePopup.show();
        mAudioModePopupVisible = true;
    }

    private void showGenericErrorDialog(int i, boolean flag)
    {
    }

    private void showReCallDialogEx(int i, final String number, final int slot)
    {
        log("showReCallDialogEx... ");
        if (mVTVoiceReCallDialog != null && mVTVoiceReCallDialog.isShowing())
        {
            return;
        } else
        {
            getResources().getText(i);
            new android.content.DialogInterface.OnClickListener() {

                final VTInCallScreenLoopback this$0;
                final String val$number;
                final int val$slot;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    log((new StringBuilder()).append("showReCallDialogEx... , on click, which=").append(j).toString());
                    if (mVTVoiceReCallDialog != null)
                    {
                        mVTVoiceReCallDialog.dismiss();
                        mVTVoiceReCallDialog = null;
                    }
                    makeVoiceReCall(number, slot);
                }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                number = s;
                slot = i;
                super();
            }
            }
;
            new android.content.DialogInterface.OnClickListener() {

                final VTInCallScreenLoopback this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    log((new StringBuilder()).append("showReCallDialogEx... , on click, which=").append(j).toString());
                    if (mVTVoiceReCallDialog != null)
                    {
                        mVTVoiceReCallDialog.dismiss();
                        mVTVoiceReCallDialog = null;
                    }
                }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
            }
;
            new android.content.DialogInterface.OnCancelListener() {

                final VTInCallScreenLoopback this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
            }
;
            mVTVoiceReCallDialog.getWindow().addFlags(2);
            mVTVoiceReCallDialog.show();
            return;
        }
    }

    private void showStartVTRecorderDialog()
    {
        log("showStartVTRecorderDialog() ...");
        if (mVTRecorderEntries == null)
            mVTRecorderEntries = new ArrayList();
        else
            mVTRecorderEntries.clear();
        if (PhoneUtils.isSupportFeature("VT_VIDEO_RECORDING") && PhoneUtils.isSupportFeature("VT_VIDEO_RECORDING"))
            mVTRecorderEntries.add(getResources().getString(0x7f0d0068));
        if (PhoneUtils.isSupportFeature("VT_VOICE_RECORDING"))
            mVTRecorderEntries.add(getResources().getString(0x7f0d0069));
        if (PhoneUtils.isSupportFeature("VT_VIDEO_RECORDING"))
            mVTRecorderEntries.add(getResources().getString(0x7f0d006a));
        new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreenLoopback this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
label0:
                {
                    if (mVTRecorderSelector != null)
                    {
                        mVTRecorderSelector.dismiss();
                        mVTRecorderSelector = null;
                    }
                    String s = (String)mVTRecorderEntries.get(i);
                    byte byte0;
                    if (s.equals(getResources().getString(0x7f0d0068)))
                    {
                        log("The choice of start VT recording : voice and peer video");
                        byte0 = 1;
                    } else
                    if (s.equals(getResources().getString(0x7f0d0069)))
                    {
                        log("The choice of start VT recording : only voice");
                        byte0 = 2;
                    } else
                    {
                        if (!s.equals(getResources().getString(0x7f0d006a)))
                            break label0;
                        log("The choice of start VT recording : only peer video");
                        byte0 = 3;
                    }
                    startRecord(byte0);
                    return;
                }
                log("The choice of start VT recording : wrong string");
            }

            
            {
                this$0 = VTInCallScreenLoopback.this;
                super();
            }
        }
;
    }

    private void showToast(String s)
    {
        Toast.makeText(PhoneGlobals.getInstance(), s, 1).show();
    }

    private void showVTLocalBrightness()
    {
        log("showVTLocalBrightness()...");
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTVideoReady)
            return;
        if (VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
        {
            mVTLowUp.setImageResource(0x7f0200dc);
            mVTLowDown.setImageResource(0x7f0200db);
            mVTLowUp.setVisibility(0);
            mVTLowDown.setVisibility(0);
            mVTLowUp.setEnabled(VTManager.getInstance().canIncBrightness());
            mVTLowDown.setEnabled(VTManager.getInstance().canDecBrightness());
        } else
        {
            mVTHighUp.setImageResource(0x7f0200dc);
            mVTHighDown.setImageResource(0x7f0200db);
            mVTHighUp.setVisibility(0);
            mVTHighDown.setVisibility(0);
            mVTHighUp.setEnabled(VTManager.getInstance().canIncBrightness());
            mVTHighDown.setEnabled(VTManager.getInstance().canDecBrightness());
        }
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = true;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
    }

    private void showVTLocalContrast()
    {
        log("showVTLocalContrast()...");
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTVideoReady)
            return;
        if (VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
        {
            mVTLowUp.setImageResource(0x7f0200de);
            mVTLowDown.setImageResource(0x7f0200dd);
            mVTLowUp.setVisibility(0);
            mVTLowDown.setVisibility(0);
            mVTLowUp.setEnabled(VTManager.getInstance().canIncContrast());
            mVTLowDown.setEnabled(VTManager.getInstance().canDecContrast());
        } else
        {
            mVTHighUp.setImageResource(0x7f0200de);
            mVTHighDown.setImageResource(0x7f0200dd);
            mVTHighUp.setVisibility(0);
            mVTHighDown.setVisibility(0);
            mVTHighUp.setEnabled(VTManager.getInstance().canIncContrast());
            mVTHighDown.setEnabled(VTManager.getInstance().canDecContrast());
        }
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = true;
    }

    private void showVTLocalZoom()
    {
        log("showVTLocalZoom()...");
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTVideoReady)
            return;
        if (VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
        {
            mVTLowUp.setImageResource(0x7f0200e7);
            mVTLowDown.setImageResource(0x7f0200e6);
            mVTLowUp.setVisibility(0);
            mVTLowDown.setVisibility(0);
            mVTLowUp.setEnabled(VTManager.getInstance().canIncZoom());
            mVTLowDown.setEnabled(VTManager.getInstance().canDecZoom());
        } else
        {
            mVTHighUp.setImageResource(0x7f0200e7);
            mVTHighDown.setImageResource(0x7f0200e6);
            mVTHighUp.setVisibility(0);
            mVTHighDown.setVisibility(0);
            mVTHighUp.setEnabled(VTManager.getInstance().canIncZoom());
            mVTHighDown.setEnabled(VTManager.getInstance().canDecZoom());
        }
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = true;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
        VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
    }

    private void startRecord(int i)
    {
        log("startVTRecorder() ...");
        long l = PhoneUtils.getDiskAvailableSize() - 0x200000L;
        if (l > 0L)
        {
            if (2 == i)
            {
                if (!PhoneRecorder.getInstance(PhoneGlobals.getInstance()).ismFlagRecord())
                {
                    log("startRecord");
                    PhoneRecorderHandler.getInstance().startVoiceRecord(1);
                }
            } else
            if (i > 0)
            {
                PhoneRecorderHandler.getInstance().startVideoRecord(i, l, 1);
                updateVideoCallRecordState(1);
                return;
            }
            return;
        }
        if (-1L == l)
        {
            showToast(getResources().getString(0x7f0d0033));
            return;
        } else
        {
            showToast(getResources().getString(0x7f0d0034));
            return;
        }
    }

    private void stopVideoRecord()
    {
        log("stopVideoRecorder() ...");
        PhoneRecorderHandler.getInstance().stopVideoRecord();
        updateVideoCallRecordState(0);
    }

    private void updateAudioButton(InCallControlState incallcontrolstate)
    {
        char c = '\377';
        log("updateAudioButton()...");
        boolean flag = false;
        boolean flag1 = false;
        boolean flag2 = false;
        boolean flag3;
        boolean flag4;
        if (incallcontrolstate.bluetoothEnabled)
        {
            log("- updateAudioButton: 'popup menu action button' mode...");
            mVTAudio.setEnabled(true);
            mVTAudio.setChecked(false);
            flag4 = true;
            if (incallcontrolstate.bluetoothIndicatorOn)
                flag3 = true;
            else
            if (incallcontrolstate.speakerOn)
            {
                flag = true;
                flag3 = false;
                flag2 = false;
                flag1 = false;
            } else
            {
                flag2 = true;
                flag3 = false;
                flag1 = false;
                flag = false;
            }
        } else
        if (incallcontrolstate.speakerEnabled)
        {
            log("- updateAudioButton: 'speaker toggle' mode...");
            mVTAudio.setEnabled(true);
            mVTAudio.setChecked(incallcontrolstate.speakerOn);
            flag = incallcontrolstate.speakerOn;
            if (!incallcontrolstate.speakerOn)
                flag1 = true;
            else
                flag1 = false;
            flag3 = false;
            flag2 = false;
            flag4 = false;
        } else
        {
            log("- updateAudioButton: disabled...");
            mVTAudio.setEnabled(false);
            mVTAudio.setChecked(false);
            flag1 = true;
            flag3 = false;
            flag2 = false;
            flag4 = false;
            flag = false;
        }
        LayerDrawable layerdrawable = (LayerDrawable)mVTAudio.getBackground();
        log((new StringBuilder()).append("- 'layers' drawable: ").append(layerdrawable).toString());
        Drawable drawable = layerdrawable.findDrawableByLayerId(0x7f08012c);
        char c1;
        if (flag4)
            c1 = c;
        else
            c1 = '\0';
        drawable.setAlpha(c1);
        Drawable drawable1 = layerdrawable.findDrawableByLayerId(0x7f08012d);
        char c2;
        if (flag3)
            c2 = c;
        else
            c2 = '\0';
        drawable1.setAlpha(c2);
        Drawable drawable2 = layerdrawable.findDrawableByLayerId(0x7f08012e);
        char c3;
        if (flag2)
            c3 = c;
        else
            c3 = '\0';
        drawable2.setAlpha(c3);
        Drawable drawable3 = layerdrawable.findDrawableByLayerId(0x7f08012f);
        char c4;
        if (flag)
            c4 = c;
        else
            c4 = '\0';
        drawable3.setAlpha(c4);
        Drawable drawable4 = layerdrawable.findDrawableByLayerId(0x7f080130);
        if (!flag1)
            c = '\0';
        drawable4.setAlpha(c);
    }

    private void updateLocalZoomOrBrightness()
    {
        log("updateLocalZoomOrBrightness()...");
        if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting)
        {
            mVTLowUp.setEnabled(VTManager.getInstance().canIncZoom());
            mVTLowDown.setEnabled(VTManager.getInstance().canDecZoom());
        } else
        {
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting)
            {
                mVTLowUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting)
            {
                mVTHighUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
        }
    }

    private void updateVTInCallButtons()
    {
        boolean flag = true;
        log("updateVTInCallButtons()...");
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall && !VTCallUtils.isVTIdle())
        {
            mVTAudio.setEnabled(flag);
            mVTMute.setEnabled(VTCallUtils.isVTActive());
            mVTOverflowMenu.setEnabled(flag);
            mVTSwapVideo.setEnabled(VTInCallScreenFlagsLoopback.getInstance().mVTHasReceiveFirstFrame);
        } else
        {
            mVTAudio.setEnabled(false);
            mVTMute.setEnabled(false);
            mVTOverflowMenu.setEnabled(false);
            mVTSwapVideo.setEnabled(false);
        }
        log("updateVTInCallButtons() : update mVTMute 's src !");
        mVTMute.setChecked(PhoneUtils.getMute());
        log("updateVTInCallButtons() : update mVTSwapVideo 's src !");
        CompoundButton compoundbutton = mVTSwapVideo;
        if (VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
            flag = false;
        compoundbutton.setChecked(flag);
        log("updateVTInCallButtons() : update mVTDialpad 's src !");
        log("updateVTInCallButtons() : update mVTAudio 's src !");
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        com.android.internal.telephony.Call.State state1 = mCM.getActiveFgCallState();
        if (state != com.android.internal.telephony.PhoneConstants.State.OFFHOOK || state1 != com.android.internal.telephony.Call.State.ALERTING && state1 != com.android.internal.telephony.Call.State.ACTIVE)
        {
            dismissAudioModePopup();
            return;
        } else
        {
            log("updateVTInCallButtons() :phone state is OFFHOOK orcall state is ALERTING or ACTIVE,not dismiss !");
            return;
        }
    }

    private void updateVTLocalPeerDisplay()
    {
        if (VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
        {
            VTManager.getInstance().setDisplay(mLowVideoHolder, mHighVideoHolder);
            return;
        } else
        {
            VTManager.getInstance().setDisplay(mHighVideoHolder, mLowVideoHolder);
            return;
        }
    }

    public void dismissVTDialogs()
    {
        log("dismissVTDialogs() ! ");
        if (mInCallVideoSettingDialog != null)
        {
            mInCallVideoSettingDialog.dismiss();
            mInCallVideoSettingDialog = null;
        }
        if (mInCallVideoSettingLocalEffectDialog != null)
        {
            mInCallVideoSettingLocalEffectDialog.dismiss();
            mInCallVideoSettingLocalEffectDialog = null;
        }
        if (mInCallVideoSettingLocalNightmodeDialog != null)
        {
            mInCallVideoSettingLocalNightmodeDialog.dismiss();
            mInCallVideoSettingLocalNightmodeDialog = null;
        }
        if (mInCallVideoSettingPeerQualityDialog != null)
        {
            mInCallVideoSettingPeerQualityDialog.dismiss();
            mInCallVideoSettingPeerQualityDialog = null;
        }
        if (mVTMTAsker != null)
        {
            mVTMTAsker.dismiss();
            mVTMTAsker = null;
        }
        if (mVTVoiceReCallDialog != null)
        {
            mVTVoiceReCallDialog.dismiss();
            mVTVoiceReCallDialog = null;
        }
        if (mVTRecorderSelector != null)
        {
            mVTRecorderSelector.dismiss();
            mVTRecorderSelector = null;
        }
    }

    public com.android.phone.Constants.VTScreenMode getVTScreenMode()
    {
        log((new StringBuilder()).append("getVTScreenMode : ").append(mVTScreenMode).toString());
        return mVTScreenMode;
    }

    public boolean handleOnScreenMenuItemClick(MenuItem menuitem)
    {
        boolean flag = true;
        log((new StringBuilder()).append("- handleOnScreenMenuItemClick: ").append(menuitem).toString());
        log((new StringBuilder()).append("  id: ").append(menuitem.getItemId()).toString());
        log((new StringBuilder()).append("  title: '").append(menuitem.getTitle()).append("'").toString());
        switch (menuitem.getItemId())
        {
        case 2131231041: 
            onVTInCallVideoSetting();
            return flag;

        case 2131231040: 
            onVoiceVideoRecordClick(menuitem);
            return flag;

        case 2131231038: 
            onVTSwapVideos();
            return flag;

        case 2131231039: 
            onVTHideMeClick();
            return flag;

        case 2131231037: 
            onVTTakePeerPhotoClick();
            return flag;

        case 2131231036: 
            onVTSwitchCameraClick();
            return flag;

        case 2131231032: 
        case 2131231033: 
        case 2131231034: 
        case 2131231035: 
        default:
            flag = false;
            // fall through

        case 2131231028: 
        case 2131231029: 
        case 2131231030: 
        case 2131231031: 
            return flag;
        }
    }

    public void initCommonVTState()
    {
        if (PhoneUtils.isDMLocked())
        {
            log("- Now DM locked, VTManager.getInstance().lockPeerVideo() start");
            VTManager.getInstance().lockPeerVideo();
            log("- Now DM locked, VTManager.getInstance().lockPeerVideo() end");
        }
        if (mVTPopupMenu != null)
            mVTPopupMenu.dismiss();
        dismissAudioModePopup();
        updateVTLocalPeerDisplay();
    }

    public void initDialingSuccessVTState()
    {
        if (!mExtension.initDialingSuccessVTState() && !VTSettingUtils.getInstance().mShowLocalMO)
        {
            onVTHideMeClick2();
            return;
        } else
        {
            return;
        }
    }

    public void initVTInCallScreen()
    {
        log("initVTInCallCanvas()...");
        mVTPowerManager = (PowerManager)mActivity.getSystemService("power");
        mVTWakeLock = mVTPowerManager.newWakeLock(0x2000000a, "VTWakeLock");
        mVTInCallCanvas = (ViewGroup)findViewById(0x7f08010e);
        mVTInCallCanvas.setVisibility(8);
        mVTInCallCanvas.setClickable(false);
        mVTHighUp = (ImageButton)findViewById(0x7f080110);
        mVTHighUp.setBackgroundColor(0);
        mVTHighUp.setOnClickListener(this);
        mVTHighUp.setVisibility(8);
        mVTHighDown = (ImageButton)findViewById(0x7f080111);
        mVTHighDown.setBackgroundColor(0);
        mVTHighDown.setOnClickListener(this);
        mVTHighDown.setVisibility(8);
        mVTLowUp = (ImageButton)findViewById(0x7f08011c);
        mVTLowUp.setBackgroundColor(0);
        mVTLowUp.setOnClickListener(this);
        mVTLowUp.setVisibility(8);
        mVTLowDown = (ImageButton)findViewById(0x7f08011d);
        mVTLowDown.setBackgroundColor(0);
        mVTLowDown.setOnClickListener(this);
        mVTLowDown.setVisibility(8);
        mVTHighVideo = (SurfaceView)findViewById(0x7f08010f);
        mVTHighVideo.setFocusable(false);
        mVTHighVideo.setFocusableInTouchMode(false);
        mVTLowVideo = (SurfaceView)findViewById(0x7f080114);
        mVTLowVideo.setFocusable(false);
        mVTLowVideo.setFocusableInTouchMode(false);
        mVTMute = (CompoundButton)findViewById(0x7f080116);
        mVTMute.setFocusable(true);
        mVTMute.setFocusableInTouchMode(false);
        mVTAudio = (CompoundButton)findViewById(0x7f080115);
        mVTAudio.setFocusable(true);
        mVTAudio.setFocusableInTouchMode(false);
        mVTDialpad = (CompoundButton)findViewById(0x7f080117);
        mVTDialpad.setFocusable(true);
        mVTDialpad.setFocusableInTouchMode(false);
        mVTSwapVideo = (CompoundButton)findViewById(0x7f080118);
        mVTSwapVideo.setFocusable(true);
        mVTSwapVideo.setFocusableInTouchMode(false);
        mVTOverflowMenu = (ImageButton)findViewById(0x7f080119);
        mVTOverflowMenu.setFocusable(true);
        mVTOverflowMenu.setFocusableInTouchMode(false);
        mVTHangUp = (ImageButton)findViewById(0x7f08011b);
        mVTHangUp.setFocusable(true);
        mVTHangUp.setFocusableInTouchMode(false);
        mVTHangUpWrapper = (LinearLayout)findViewById(0x7f08011a);
        mVTMute.setOnClickListener(this);
        mVTAudio.setOnClickListener(this);
        mVTDialpad.setOnClickListener(this);
        mVTSwapVideo.setOnClickListener(this);
        mVTOverflowMenu.setOnClickListener(this);
        mVTHangUp.setOnClickListener(this);
        if (ViewConfiguration.get(mActivity).hasPermanentMenuKey())
        {
            mVTSwapVideo.setVisibility(0);
            mVTOverflowMenu.setVisibility(4);
        } else
        {
            mVTSwapVideo.setVisibility(4);
            mVTOverflowMenu.setVisibility(0);
        }
        mVTHighVideo.setOnClickListener(this);
        mVTLowVideo.setOnClickListener(this);
        mVTVoiceRecordingIcon = (ImageView)findViewById(0x7f080112);
        mVTVoiceRecordingIcon.setFocusable(false);
        mVTVoiceRecordingIcon.setFocusableInTouchMode(false);
        mVTVoiceRecordingIcon.setBackgroundResource(0x7f0200b2);
        mVTVoiceRecordingIcon.setVisibility(8);
        mVTAudio.setNextFocusLeftId(0x7f080115);
        mVTAudio.setNextFocusRightId(0x7f080116);
        mVTAudio.setNextFocusUpId(0x7f080115);
        mVTAudio.setNextFocusDownId(0x7f080117);
        mVTMute.setNextFocusLeftId(0x7f080115);
        mVTMute.setNextFocusRightId(0x7f080116);
        mVTMute.setNextFocusUpId(0x7f080116);
        if (ViewConfiguration.get(mActivity).hasPermanentMenuKey())
            mVTMute.setNextFocusDownId(0x7f080118);
        else
            mVTMute.setNextFocusDownId(0x7f080119);
        mVTDialpad.setNextFocusLeftId(0x7f080117);
        if (ViewConfiguration.get(mActivity).hasPermanentMenuKey())
            mVTDialpad.setNextFocusRightId(0x7f080118);
        else
            mVTDialpad.setNextFocusRightId(0x7f080119);
        mVTDialpad.setNextFocusUpId(0x7f080115);
        mVTDialpad.setNextFocusDownId(0x7f08011b);
        mVTSwapVideo.setNextFocusLeftId(0x7f080117);
        mVTSwapVideo.setNextFocusRightId(0x7f080118);
        mVTSwapVideo.setNextFocusUpId(0x7f080116);
        mVTSwapVideo.setNextFocusDownId(0x7f08011b);
        mVTOverflowMenu.setNextFocusLeftId(0x7f080117);
        mVTOverflowMenu.setNextFocusRightId(0x7f080119);
        mVTOverflowMenu.setNextFocusUpId(0x7f080116);
        mVTOverflowMenu.setNextFocusDownId(0x7f08011b);
        mVTHangUp.setNextFocusLeftId(0x7f08011b);
        mVTHangUp.setNextFocusRightId(0x7f08011b);
        mVTHangUp.setNextFocusUpId(0x7f080117);
        mVTHangUp.setNextFocusDownId(0x7f08011b);
        mHighVideoHolder = mVTHighVideo.getHolder();
        mLowVideoHolder = mVTLowVideo.getHolder();
        mHighVideoHolder.addCallback(this);
        mLowVideoHolder.addCallback(this);
        mHighVideoHolder.setType(3);
        mLowVideoHolder.setType(3);
    }

    public void internalAnswerVTCallPre()
    {
        log("internalAnswerVTCallPre()...");
        if (VTCallUtils.isVTActive())
        {
            closeVTManager();
            log("internalAnswerVTCallPre: set VTInCallScreenFlagsLoopback.getInstance().mVTShouldCloseVTManager = false");
            VTInCallScreenFlagsLoopback.getInstance().mVTShouldCloseVTManager = false;
            VTInCallScreenFlagsLoopback.getInstance().resetPartial();
        }
        VTInCallScreenFlagsLoopback.getInstance().reset();
        log("VTInCallScreenLoopback:closeVTManager:sendIntent_CALL_START_YET");
        if (!getVTInControlRes())
        {
            log("VTInCallScreenLoopback:closeVTManager:sendIntent_CALL_START_GOES");
            mActivity.sendBroadcast(new Intent("android.phone.extra.VT_CALL_START"));
            setVTInControlRes(true);
        }
        registerForVTPhoneStates();
        log("- set VTManager open ! ");
        VTManager.getInstance().setVTOpen(PhoneGlobals.getInstance().getBaseContext(), mCMGemini, 0);
        log("- finish set VTManager open ! ");
        if (!VTSettingUtils.getInstance().mShowLocalMT.equals("0"))
            onVTHideMeClick2();
        if (PhoneUtils.isDMLocked())
        {
            log("- Now DM locked, VTManager.getInstance().lockPeerVideo() start");
            VTManager.getInstance().lockPeerVideo();
            log("- Now DM locked, VTManager.getInstance().lockPeerVideo() end");
        }
        if (VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedH && VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedL)
        {
            log("- set VTManager ready ! ");
            VTManager.getInstance().setVTReady();
            log("- finish set VTManager ready ! ");
            return;
        } else
        {
            VTInCallScreenFlagsLoopback.getInstance().mVTSettingReady = true;
            return;
        }
    }

    public void onClick(View view)
    {
        int i = view.getId();
        log((new StringBuilder()).append("onClick(View ").append(view).append(", id ").append(i).append(")...").toString());
        switch (i)
        {
        case 2131231001: 
            log("onClick: VTOverflowMenu...");
            if (mVTPopupMenu != null)
                mVTPopupMenu.dismiss();
            PopupMenu popupmenu = constructPopupMenu(mVTOverflowMenu);
            if (popupmenu != null)
            {
                popupmenu.show();
                return;
            }
            break;

        case 2131230993: 
            log("onClick: VTHighDown...");
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().decZoom();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().decBrightness();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().decContrast();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131231005: 
            log("onClick: VTLowDown...");
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().decZoom();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().decBrightness();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().decContrast();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131230992: 
            log("onClick: VTHighUp...");
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().incZoom();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().incBrightness();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().incContrast();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131231004: 
            log("onClick: VTLowUp...");
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().incZoom();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().incBrightness();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().incContrast();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131231003: 
            log("onClick: VTHangUp...");
            VTInCallScreenFlagsLoopback.getInstance().mVTInEndingCall = true;
            updateVTScreen(getVTScreenMode());
            PhoneUtils.hangup(PhoneGlobals.getInstance().mCM);
            return;

        case 2131231000: 
            log("onClick: VTSwapVideo...");
            onVTSwapVideos();
            return;

        case 2131230999: 
            log("onClick: VTDialpad...");
            return;

        case 2131230997: 
            log("onClick: VTSpeaker...");
            handleAudioButtonClick();
            return;

        case 2131230998: 
            log("onClick: VTMute");
            return;

        case 2131230996: 
            log("onClick: VTLowVideo...");
            if (VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
            {
                hideLocalZoomOrBrightness();
                VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
                VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
                VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
                return;
            }
            break;

        case 2131230991: 
            log("onClick: VTHighVideo...");
            if (!VTInCallScreenFlagsLoopback.getInstance().mVTPeerBigger)
            {
                hideLocalZoomOrBrightness();
                VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
                VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
                VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
                return;
            }
            break;

        case 2131230994: 
        case 2131230995: 
        case 2131231002: 
        default:
            log((new StringBuilder()).append("onClick: unexpected click from ID ").append(i).append(" (View = ").append(view).append(")").toString());
            break;
        }
    }

    public void onDestroy()
    {
        unregisterForVTPhoneStates();
        if (mVTWakeLock != null)
        {
            if (mVTWakeLock.isHeld())
                mVTWakeLock.release();
            log("closeVTmanger VTInCallScreenLoopback:onDestory");
            if (getVTInControlRes())
            {
                log("VTInCallScreenLoopback:onDestory:sentIntent:VTCallUtils.VT_CALL_END");
                mActivity.sendBroadcast(new Intent("android.phone.extra.VT_CALL_END"));
                setVTInControlRes(false);
                return;
            }
        }
    }

    public void onDismiss(PopupMenu popupmenu)
    {
        log((new StringBuilder()).append("- onDismiss: ").append(popupmenu).toString());
        mAudioModePopupVisible = false;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        log("onKeyDown");
        return mExtension.onKeyDown(i, keyevent);
    }

    public boolean onMenuItemClick(MenuItem menuitem)
    {
        return handleOnScreenMenuItemClick(menuitem);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        return handleOnScreenMenuItemClick(menuitem);
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        if (getVTScreenMode() == com.android.phone.Constants.VTScreenMode.VT_SCREEN_OPEN)
            return mExtension.onPrepareOptionsMenu(menu);
        else
            return false;
    }

    public void onReceiveVTManagerStartCounter()
    {
        if (VTInCallScreenFlagsLoopback.getInstance().mVTConnectionStarttime.mStarttime < 0L)
        {
            mCM.getActiveFgCall();
            if (mCM.hasActiveRingingCall())
                mCM.getFirstActiveRingingCall();
            if (mCM.getActiveFgCall() != null && mCM.getActiveFgCall().getLatestConnection() != null)
            {
                VTInCallScreenFlagsLoopback.getInstance().mVTConnectionStarttime.mStarttime = SystemClock.elapsedRealtime();
                VTInCallScreenFlagsLoopback.getInstance().mVTConnectionStarttime.mConnection = mCM.getActiveFgCall().getLatestConnection();
                PhoneGlobals.getInstance().notificationMgr.updateInCallNotification();
            }
        }
    }

    public void onStop()
    {
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        log((new StringBuilder()).append("onStop: state = ").append(state).toString());
        if (state != com.android.internal.telephony.PhoneConstants.State.IDLE);
        if (mVTPopupMenu != null)
            mVTPopupMenu.dismiss();
        dismissAudioModePopup();
        log("VTInCallScreenLoopback:onStop");
        closeVTManager();
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        if (VTInCallScreenFlagsLoopback.getInstance().mVTHasReceiveFirstFrame && mExtension.onTouch(view, motionevent))
            return true;
        switch (0xff & motionevent.getAction())
        {
        case 0: // '\0'
            log("MotionEvent.ACTION_DOWN");
            hideLocalZoomOrBrightness();
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
            return true;
        }
        return true;
    }

    public void refreshAudioModePopup()
    {
        if (mAudioModePopup != null && mAudioModePopupVisible)
        {
            mAudioModePopup.dismiss();
            showAudioModePopup();
        }
    }

    void registerForVTPhoneStates()
    {
    }

    public void resetVTFlags()
    {
        log("resetVTFlags()...");
        VTInCallScreenFlagsLoopback.getInstance().reset();
        dismissVTDialogs();
        if (mVTLowVideo != null && mVTLowVideo.getBackground() != null)
            mVTLowVideo.setBackgroundDrawable(null);
        if (mVTHighVideo != null && mVTHighVideo.getBackground() != null)
            mVTHighVideo.setBackgroundDrawable(null);
    }

    void setDialer(DTMFTwelveKeyDialer dtmftwelvekeydialer)
    {
        mDialer = dtmftwelvekeydialer;
    }

    void setVTLoopBackInstance(Activity activity)
    {
        mActivity = activity;
    }

    public void setVTScreenMode(com.android.phone.Constants.VTScreenMode vtscreenmode)
    {
        log((new StringBuilder()).append("setVTScreenMode : ").append(vtscreenmode).toString());
        if (com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE == getVTScreenMode() && com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE != vtscreenmode)
        {
            openVTInCallCanvas();
            log("setVTScreenMode : mVTWakeLock.acquire() ");
            if (!mVTWakeLock.isHeld())
                mVTWakeLock.acquire();
        }
        if (com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE != getVTScreenMode() && com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE == vtscreenmode)
        {
            closeVTInCallCanvas();
            log("setVTScreenMode : mVTWakeLock.release() ");
            if (mVTWakeLock.isHeld())
                mVTWakeLock.release();
        }
        mVTScreenMode = vtscreenmode;
    }

    public void setVTVisible(boolean flag)
    {
        if (flag)
        {
            if (VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedH && VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedL)
            {
                log("VTManager.getInstance().setVTVisible(true) start ...");
                VTManager.getInstance().setVTVisible(true);
                log("VTManager.getInstance().setVTVisible(true) end ...");
            }
            return;
        } else
        {
            log("VTManager.getInstance().setVTVisible(false) start ...");
            VTManager.getInstance().setVTVisible(false);
            log("VTManager.getInstance().setVTVisible(false) start ...");
            return;
        }
    }

    public void setupMenuItems(Menu menu)
    {
        if (PhoneUtils.isDMLocked())
            return;
        MenuItem menuitem = menu.findItem(0x7f08013c);
        MenuItem menuitem1 = menu.findItem(0x7f08013d);
        MenuItem menuitem2 = menu.findItem(0x7f08013f);
        MenuItem menuitem3 = menu.findItem(0x7f08013e);
        MenuItem menuitem4 = menu.findItem(0x7f080140);
        MenuItem menuitem5 = menu.findItem(0x7f080141);
        menuitem.setVisible(true);
        int i = VTManager.getInstance().getCameraSensorCount();
        log((new StringBuilder()).append("setupMenuItems() : VTManager.getInstance().getCameraSensorCount() == ").append(i).toString());
        boolean flag;
        if (2 == i)
            flag = true;
        else
            flag = false;
        menuitem.setVisible(flag);
        boolean flag1;
        if (VTSettingUtils.getInstance().mEnableBackCamera && !VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow)
            flag1 = true;
        else
            flag1 = false;
        menuitem.setEnabled(flag1);
        menuitem1.setVisible(true);
        boolean flag2;
        if (!isDialerOpened() && VTInCallScreenFlagsLoopback.getInstance().mVTVideoConnected)
            flag2 = true;
        else
            flag2 = false;
        menuitem1.setEnabled(flag2);
        menuitem2.setVisible(true);
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow)
            menuitem2.setTitle(getResources().getString(0x7f0d0042));
        else
            menuitem2.setTitle(getResources().getString(0x7f0d0043));
        menuitem3.setEnabled(VTInCallScreenFlagsLoopback.getInstance().mVTHasReceiveFirstFrame);
        menuitem4.setVisible(true);
        menuitem4.setEnabled(false);
        menuitem4.setTitle(0x7f0d006f);
        if (okToRecordVoice())
        {
            menuitem4.setEnabled(true);
            if (PhoneRecorderHandler.getInstance().isVTRecording())
                menuitem4.setTitle(0x7f0d0070);
        } else
        if (DualTalkUtils.isSupportDualTalk())
            menuitem4.setVisible(false);
        menuitem5.setVisible(true);
        menuitem5.setEnabled(VTInCallScreenFlagsLoopback.getInstance().mVTVideoConnected);
    }

    public void showReCallDialog(int i, String s, int j)
    {
        log("showReCallDialog... ");
        if (VTSettingUtils.getInstance().mAutoDropBack)
        {
            showToast(getResources().getString(0x7f0d004b));
            makeVoiceReCall(s, j);
            return;
        } else
        {
            showReCallDialogEx(i, s, j);
            return;
        }
    }

    public void stopRecord()
    {
        log("stopRecord");
        if (PhoneRecorder.isRecording())
        {
            log("stopVoiceRecord");
            PhoneRecorderHandler.getInstance().stopVoiceRecord();
        } else
        if (1 == PhoneRecorderHandler.getInstance().getPhoneRecorderState())
        {
            log("stopVideoRecord");
            stopVideoRecord();
            return;
        }
    }

    public void surfaceChanged(SurfaceHolder surfaceholder, int i, int j, int k)
    {
        log((new StringBuilder()).append("surfaceChanged : ").append(surfaceholder.toString()).toString());
        if (surfaceholder == mHighVideoHolder)
        {
            log("surfaceChanged : HighVideo , set mVTSurfaceChangedH = true");
            VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedH = true;
        }
        if (surfaceholder == mLowVideoHolder)
        {
            log("surfaceChanged : LowVideo , set mVTSurfaceChangedL = true");
            VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedL = true;
        }
        if (VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedH && VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedL)
        {
            updateVTLocalPeerDisplay();
            log("surfaceChanged : VTManager.getInstance().setVTVisible(true) start ...");
            VTManager.getInstance().setVTVisible(true);
            log("surfaceChanged : VTManager.getInstance().setVTVisible(true) end ...");
            if (!mVTWakeLock.isHeld())
                mVTWakeLock.acquire();
            if (VTInCallScreenFlagsLoopback.getInstance().mVTSettingReady)
            {
                log("- set VTManager ready ! ");
                VTManager.getInstance().setVTReady();
                log("- finish set VTManager ready ! ");
                VTInCallScreenFlagsLoopback.getInstance().mVTSettingReady = false;
            }
            log((new StringBuilder()).append("surfacedChanged_afterReady_State= ").append(VTManager.getInstance().getState()).toString());
            updateVTScreen(getVTScreenMode());
        }
    }

    public void surfaceCreated(SurfaceHolder surfaceholder)
    {
        log((new StringBuilder()).append("surfaceCreated : ").append(surfaceholder.toString()).toString());
    }

    public void surfaceDestroyed(SurfaceHolder surfaceholder)
    {
        log((new StringBuilder()).append("surfaceDestroyed : ").append(surfaceholder.toString()).toString());
        if (surfaceholder == mHighVideoHolder)
        {
            log("surfaceDestroyed : HighVideo, set mVTSurfaceChangedH = false");
            VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedH = false;
        }
        if (surfaceholder == mLowVideoHolder)
        {
            log("surfaceDestroyed : LowVideo, set mVTSurfaceChangedL = false");
            VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedL = false;
        }
        if (!VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedH && !VTInCallScreenFlagsLoopback.getInstance().mVTSurfaceChangedL)
        {
            log("surfaceDestroyed : VTManager.getInstance().setVTVisible(false) start ...");
            VTManager.getInstance().setVTVisible(false);
            log("surfaceDestroyed : VTManager.getInstance().setVTVisible(false) end ...");
            if (mVTWakeLock.isHeld())
                mVTWakeLock.release();
        }
    }

    void unregisterForVTPhoneStates()
    {
    }

    public void updateVTScreen(com.android.phone.Constants.VTScreenMode vtscreenmode)
    {
        log((new StringBuilder()).append("updateVTScreen : ").append(vtscreenmode).toString());
        if (vtscreenmode == com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE)
            return;
        mVTLowVideo.setClickable(true);
        mVTHangUp.setEnabled(true);
        log((new StringBuilder()).append("updateVTScreen : VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow - ").append(VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow).toString());
        log((new StringBuilder()).append("updateVTScreen : VTSettingUtils.getInstance().mEnableBackCamera - ").append(VTSettingUtils.getInstance().mEnableBackCamera).toString());
        if (!VTCallUtils.isVTActive())
        {
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
            hideLocalZoomOrBrightness();
            dismissVideoSettingDialogs();
            if (com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE == getVTScreenMode());
        }
        if (VTInCallScreenFlagsLoopback.getInstance().mVTHideMeNow)
        {
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalZoomSetting = false;
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalBrightnessSetting = false;
            VTInCallScreenFlagsLoopback.getInstance().mVTInLocalContrastSetting = false;
            hideLocalZoomOrBrightness();
        }
        updateVTInCallButtons();
        if (PhoneUtils.isDMLocked())
        {
            mVTDialpad.setEnabled(false);
            mVTAudio.setEnabled(false);
            mVTOverflowMenu.setEnabled(false);
            mVTSwapVideo.setEnabled(false);
            hideLocalZoomOrBrightness();
        }
        log("updateVTScreen end");
    }

    public void updateVideoCallRecordState(int i)
    {
    }











/*
    static AlertDialog access$1602(VTInCallScreenLoopback vtincallscreenloopback, AlertDialog alertdialog)
    {
        vtincallscreenloopback.mInCallVideoSettingLocalEffectDialog = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$1802(VTInCallScreenLoopback vtincallscreenloopback, AlertDialog alertdialog)
    {
        vtincallscreenloopback.mInCallVideoSettingLocalNightmodeDialog = alertdialog;
        return alertdialog;
    }

*/



/*
    static AlertDialog access$1902(VTInCallScreenLoopback vtincallscreenloopback, AlertDialog alertdialog)
    {
        vtincallscreenloopback.mInCallVideoSettingPeerQualityDialog = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$2002(VTInCallScreenLoopback vtincallscreenloopback, AlertDialog alertdialog)
    {
        vtincallscreenloopback.mVTVoiceReCallDialog = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$2202(VTInCallScreenLoopback vtincallscreenloopback, AlertDialog alertdialog)
    {
        vtincallscreenloopback.mVTRecorderSelector = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$2402(VTInCallScreenLoopback vtincallscreenloopback, AlertDialog alertdialog)
    {
        vtincallscreenloopback.mVTMTAsker = alertdialog;
        return alertdialog;
    }

*/








/*
    static AlertDialog access$902(VTInCallScreenLoopback vtincallscreenloopback, AlertDialog alertdialog)
    {
        vtincallscreenloopback.mInCallVideoSettingDialog = alertdialog;
        return alertdialog;
    }

*/
}
