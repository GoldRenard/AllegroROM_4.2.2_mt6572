// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.app.AlertDialog;
import android.content.*;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.drawable.*;
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
import com.mediatek.phone.GeminiConstants;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.VTInCallScreenExtension;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.phone.recording.PhoneRecorder;
import com.mediatek.phone.recording.PhoneRecorderHandler;
import com.mediatek.settings.VTAdvancedSetting;
import com.mediatek.settings.VTSettingUtils;
import com.mediatek.vt.VTManager;
import java.util.*;

// Referenced classes of package com.mediatek.phone.vt:
//            IVTInCallScreen, VTInCallScreenFlags, VTCallUtils, VTBackgroundBitmapHandler, 
//            VTCallBannerController, VTCallBanner

public class VTInCallScreen extends RelativeLayout
    implements IVTInCallScreen, android.view.SurfaceHolder.Callback, android.view.View.OnClickListener, android.widget.PopupMenu.OnMenuItemClickListener, android.widget.PopupMenu.OnDismissListener, android.view.View.OnTouchListener
{
    public class DialogCancelTimer
    {

        private AlertDialog mAsker;
        private final int mSeconds;
        private final Timer mTimer = new Timer();
        final VTInCallScreen this$0;

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
            this$0 = VTInCallScreen.this;
            super();
            mSeconds = i;
            mAsker = alertdialog;
        }
    }

    class InCallVideoSettingLocalEffectListener
        implements android.content.DialogInterface.OnClickListener
    {

        private ArrayList mValues;
        final VTInCallScreen this$0;

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
            this$0 = VTInCallScreen.this;
            super();
            mValues = new ArrayList();
        }
    }


    private static final boolean DBG = true;
    private static final int HIDDEN = 0;
    private static final String LOG_TAG = "VTInCallScreen";
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
    private PopupMenu mAudioModePopup;
    private boolean mAudioModePopupVisible;
    private VTBackgroundBitmapHandler mBkgBitmapHandler;
    private CallManager mCM;
    private MTKCallManager mCMGemini;
    private VTCallBanner mCallBanner;
    private DTMFTwelveKeyDialer mDialer;
    private VTInCallScreenExtension mExtension;
    private Handler mHandler = new Handler() {

        final VTInCallScreen this$0;

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
        //                       6: 359
        //                       7: 295
        //                       8: 1015
        //                       9: 1241
        //                       16: 1270
        //                       126: 383
        //                       127: 412
        //                       32769: 441
        //                       32770: 689
        //                       32771: 790
        //                       32772: 900
        //                       32773: 1046
        //                       32774: 1114
        //                       32775: 1177
        //                       33025: 593;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L21
_L1:
            Log.wtf("VTInCallScreen", (new StringBuilder()).append("mHandler: unexpected message: ").append(message).toString());
_L23:
            return;
_L6:
            log("- handler : VT_MSG_DISCONNECTED ! ");
            VTInCallScreenFlags.getInstance().mVTVideoConnected = false;
            VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame = false;
            updateVTScreen(getVTScreenMode());
            return;
_L5:
            log("- handler : VT_MSG_CONNECTED ! ");
            VTInCallScreenFlags.getInstance().mVTVideoConnected = true;
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
            VTInCallScreenFlags.getInstance().mVTVideoReady = false;
            updateVTScreen(getVTScreenMode());
            return;
_L4:
            log("- handler : VT_MSG_READY ! ");
            onReceiveVTManagerReady();
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
            if (!VTInCallScreenFlags.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                showToast(getResources().getString(0x7f0d003d));
                log((new StringBuilder()).append("toast is shown, string is ").append(getResources().getString(0x7f0d003d)).toString());
                VTInCallScreenFlags.getInstance().mVTInEndingCall = true;
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
            if (!VTInCallScreenFlags.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
                VTInCallScreenFlags.getInstance().mVTInEndingCall = true;
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
            if (!VTInCallScreenFlags.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                if (1 == message.arg2)
                    showToast(getResources().getString(0x7f0d0077));
                else
                    showToast(getResources().getString(0x7f0d003e));
                VTInCallScreenFlags.getInstance().mVTInEndingCall = true;
            }
            mInCallScreen.internalHangupAll();
            return;
_L16:
            log("- handler : VT_ERROR_CAMERA ! ");
            if (!VTInCallScreenFlags.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                if (1 == message.arg2)
                    showToast(getResources().getString(0x7f0d0076));
                else
                    showToast(getResources().getString(0x7f0d003e));
                VTInCallScreenFlags.getInstance().mVTInEndingCall = true;
            }
            log("- handler : (VT_ERROR_CAMERA) - ForegroundCall exists, so hangup it ! ");
            mInCallScreen.internalHangupAll();
            return;
_L17:
            log("- handler : VT_ERROR_MEDIA_SERVER_DIED ! ");
            if (!VTInCallScreenFlags.getInstance().mVTInEndingCall && mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                showToast(getResources().getString(0x7f0d003e));
                VTInCallScreenFlags.getInstance().mVTInEndingCall = true;
            }
            if (mCM.getActiveFgCall() == null) goto _L23; else goto _L25
_L25:
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
            log("- handler : VT_ERROR_MEDIA_RECORDER_EVENT_INFO ! ");
            if (32767 == message.arg1)
            {
                showToast(getResources().getString(0x7f0d0069));
                return;
            }
            if (801 != message.arg1) goto _L23; else goto _L26
_L26:
            stopRecord();
            mInCallScreen.handleStorageFull(false);
            return;
_L19:
            log("- handler : VT_ERROR_MEDIA_RECORDER_EVENT_ERROR ! ");
            if (1 != message.arg1 || mHasMediaRecordError) goto _L23; else goto _L27
_L27:
            showToast(getResources().getString(0x7f0d006e));
            mHasMediaRecordError = true;
            stopRecord();
            return;
_L20:
            log("- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE ! ");
            if (message.arg1 == 0 && !mHasMediaRecordError)
            {
                log("- handler : VT_ERROR_MEDIA_RECORDER_COMPLETE, arg is OK ");
                showToast(getResources().getString(0x7f0d006b));
            }
            mHasMediaRecordError = false;
            return;
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
                this$0 = VTInCallScreen.this;
                super();
            }
    }
;
    private boolean mHasMediaRecordError;
    private SurfaceHolder mHighVideoHolder;
    private InCallScreen mInCallScreen;
    private AlertDialog mInCallVideoSettingDialog;
    private AlertDialog mInCallVideoSettingLocalEffectDialog;
    private AlertDialog mInCallVideoSettingLocalNightmodeDialog;
    private AlertDialog mInCallVideoSettingPeerQualityDialog;
    private boolean mLocaleChanged;
    private SurfaceHolder mLowVideoHolder;
    private CompoundButton mVTAudio;
    private VTCallBannerController mVTCallBannerController;
    private CompoundButton mVTDialpad;
    private ImageButton mVTHangUp;
    private RelativeLayout mVTHangUpWrapper;
    private ImageButton mVTHighDown;
    private ImageButton mVTHighUp;
    private SurfaceView mVTHighVideo;
    private ViewGroup mVTInCallCanvas;
    private ImageButton mVTLowDown;
    private ImageButton mVTLowUp;
    private SurfaceView mVTLowVideo;
    private View mVTLowWrapper;
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

    public VTInCallScreen(Context context)
    {
        super(context);
        mVTScreenMode = com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE;
        log("VTInCallScreen constructor...");
        log((new StringBuilder()).append("- this = ").append(this).toString());
        mCM = PhoneGlobals.getInstance().mCM;
        mCMGemini = PhoneGlobals.getInstance().mCMGemini;
    }

    public VTInCallScreen(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mVTScreenMode = com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE;
        mCM = PhoneGlobals.getInstance().mCM;
        mCMGemini = PhoneGlobals.getInstance().mCMGemini;
    }

    public VTInCallScreen(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mVTScreenMode = com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE;
        mCM = PhoneGlobals.getInstance().mCM;
        mCMGemini = PhoneGlobals.getInstance().mCMGemini;
    }

    private void amendLayoutForDifferentScreen()
    {
        if (PhoneGlobals.sHasNavigationBar)
        {
            log("has navigation bar, reset the layout size...");
            Resources resources = getResources();
            int i = resources.getDimensionPixelSize(0x7f0c0045);
            int j = resources.getDimensionPixelSize(0x7f0c0046);
            int k = resources.getDimensionPixelSize(0x7f0c0047);
            int l = resources.getDimensionPixelSize(0x7f0c0048);
            int i1 = getResources().getDimensionPixelSize(0x7f0c0044);
            int j1 = mInCallScreen.getScreenSize().x;
            mVTHighVideo.getLayoutParams().height = k;
            mVTHighVideo.getLayoutParams().width = l;
            mVTLowVideo.getLayoutParams().height = i;
            mVTLowVideo.getLayoutParams().width = j;
            int k1 = i1 * 5;
            setVtButtonSize((j1 - j - k1) / 3, (i - i1) / 2, i1);
        }
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
        PhoneUtils.turnOnSpeaker(mInCallScreen, false, true);
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
            mInCallScreen.sendBroadcast(new Intent("android.phone.extra.VT_CALL_END"));
            setVTInControlRes(false);
        }
    }

    private PopupMenu constructPopupMenu(View view)
    {
        if (mVTPopupMenu == null)
        {
            mVTPopupMenu = new PopupMenu(mInCallScreen, view);
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
        return VTInCallScreenFlags.getInstance().mVTInControlRes;
    }

    private void handleAudioButtonClick()
    {
        if (mInCallScreen.getUpdatedInCallControlState().bluetoothEnabled)
        {
            log("- handleAudioButtonClick: 'popup menu' mode...");
            showAudioModePopup();
            mVTAudio.setChecked(false);
            return;
        } else
        {
            log("- handleAudioButtonClick: 'speaker toggle' mode...");
            mInCallScreen.toggleSpeaker();
            return;
        }
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
        Log.d("VTInCallScreen", s);
    }

    private void makeVoiceReCall(String s, int i)
    {
        log((new StringBuilder()).append("makeVoiceReCall(), number is ").append(s).append(" slot is ").append(i).toString());
        Intent intent = new Intent("android.intent.action.CALL", Uri.fromParts("tel", s, null));
        intent.putExtra("com.android.phone.extra.slot", i);
        intent.putExtra("com.android.phone.extra.international", 2);
        intent.setFlags(0x14000000);
        PhoneGlobals.getInstance().startActivity(intent);
        setVTScreenMode(com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE);
    }

    private boolean okToRecordVoice()
    {
        return VTInCallScreenFlags.getInstance().mVTVideoConnected;
    }

    private void onReceiveVTManagerReady()
    {
        VTInCallScreenFlags.getInstance().mVTVideoReady = true;
        updateVTScreen(getVTScreenMode());
        log("Incallscreen, before call setting");
        if (!PhoneUtils.isDMLocked())
        {
            log("Now DM not locked, VTManager.getInstance().unlockPeerVideo() start;");
            VTManager.getInstance().unlockPeerVideo();
            log("Now DM not locked, VTManager.getInstance().unlockPeerVideo() end;");
            if (VTSettingUtils.getInstance().mShowLocalMT.equals("1") && VTInCallScreenFlags.getInstance().mVTIsMT)
            {
                log("- VTSettingUtils.getInstance().mShowLocalMT : 1 !");
                log("Incallscreen, before enableAlwaysAskSettings");
                VTManager.getInstance().enableAlwaysAskSettings(1);
                log("Incallscreen, after enableAlwaysAskSettings");
                mVTMTAsker = (new android.app.AlertDialog.Builder(PhoneGlobals.getInstance().getInCallScreenInstance())).setMessage(getResources().getString(0x7f0d0037)).setPositiveButton(getResources().getString(0x7f0d0038), new android.content.DialogInterface.OnClickListener() {

                    final VTInCallScreen this$0;

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
                this$0 = VTInCallScreen.this;
                super();
            }
                }
).setNegativeButton(getResources().getString(0x7f0d0039), new android.content.DialogInterface.OnClickListener() {

                    final VTInCallScreen this$0;

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
                this$0 = VTInCallScreen.this;
                super();
            }
                }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                    final VTInCallScreen this$0;

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
                this$0 = VTInCallScreen.this;
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
        VTCallUtils.checkVTFile(VTInCallScreenFlags.getInstance().mVTSlotId);
        if (VTInCallScreenFlags.getInstance().mVTHideMeNow)
            VTManager.getInstance().setLocalVideoType(0, "");
        else
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("0"))
            VTManager.getInstance().setLocalVideoType(flag, VTAdvancedSetting.getPicPathDefault());
        else
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("1"))
            VTManager.getInstance().setLocalVideoType(2, "");
        else
            VTManager.getInstance().setLocalVideoType(flag, VTAdvancedSetting.getPicPathUserselect(VTInCallScreenFlags.getInstance().mVTSlotId));
        VTInCallScreenFlags vtincallscreenflags = VTInCallScreenFlags.getInstance();
        if (VTInCallScreenFlags.getInstance().mVTHideMeNow)
            flag = false;
        vtincallscreenflags.mVTHideMeNow = flag;
        updateVTScreen(getVTScreenMode());
    }

    private void onVTHideMeClick2()
    {
        log("onVTHideMeClick2()...");
        VTCallUtils.checkVTFile(VTInCallScreenFlags.getInstance().mVTSlotId);
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("2"))
            VTManager.getInstance().setLocalVideoType(1, VTAdvancedSetting.getPicPathUserselect(VTInCallScreenFlags.getInstance().mVTSlotId));
        else
        if (VTSettingUtils.getInstance().mPicToReplaceLocal.equals("1"))
            VTManager.getInstance().setLocalVideoType(2, "");
        else
            VTManager.getInstance().setLocalVideoType(1, VTAdvancedSetting.getPicPathDefault());
        VTInCallScreenFlags.getInstance().mVTHideMeNow = true;
    }

    private void onVTInCallVideoSetting()
    {
        log("onVTInCallVideoSetting() ! ");
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            private static final int DIALOG_ITEM_FOUR = 4;
            private static final int DIALOG_ITEM_THREE = 3;
            final VTInCallScreen this$0;

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
                this$0 = VTInCallScreen.this;
                super();
            }
        }
;
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mInCallScreen);
        builder.setNegativeButton(0x7f0d0196, new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mInCallVideoSettingDialog != null)
                {
                    mInCallVideoSettingDialog.dismiss();
                    mInCallVideoSettingDialog = null;
                }
            }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
        }
);
        if (!VTInCallScreenFlags.getInstance().mVTHideMeNow)
        {
            if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting)
                builder.setSingleChoiceItems(0x7f070016, 0, onclicklistener).setTitle(0x7f0d001f);
            else
            if (VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting)
                builder.setSingleChoiceItems(0x7f070016, 1, onclicklistener).setTitle(0x7f0d001f);
            else
            if (VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
                builder.setSingleChoiceItems(0x7f070016, 2, onclicklistener).setTitle(0x7f0d001f);
            else
                builder.setSingleChoiceItems(0x7f070016, -1, onclicklistener).setTitle(0x7f0d001f);
        } else
        {
            builder.setSingleChoiceItems(0x7f070017, -1, new android.content.DialogInterface.OnClickListener() {

                final VTInCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    if (mInCallVideoSettingDialog != null)
                    {
                        mInCallVideoSettingDialog.dismiss();
                        mInCallVideoSettingDialog = null;
                    }
                    onVTInCallVideoSettingPeerQuality();
                }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
            }
).setTitle(0x7f0d001f);
        }
        mInCallVideoSettingDialog = builder.create();
        mInCallVideoSettingDialog.show();
    }

    private void onVTInCallVideoSettingLocalEffect()
    {
        log("onVTInCallVideoSettingLocalEffect() ! ");
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mInCallScreen);
        builder.setNegativeButton(0x7f0d0196, new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

            public void onClick(DialogInterface dialoginterface, int l)
            {
                if (mInCallVideoSettingLocalEffectDialog != null)
                {
                    mInCallVideoSettingLocalEffectDialog.dismiss();
                    mInCallVideoSettingLocalEffectDialog = null;
                }
            }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
        }
);
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
            int k = arraylist.indexOf(VTManager.getInstance().getColorEffect());
            InCallVideoSettingLocalEffectListener incallvideosettinglocaleffectlistener = new InCallVideoSettingLocalEffectListener();
            incallvideosettinglocaleffectlistener.setValues(arraylist);
            builder.setSingleChoiceItems((CharSequence[])arraylist1.toArray(new CharSequence[arraylist.size()]), k, incallvideosettinglocaleffectlistener);
            builder.setTitle(0x7f0d0022);
            mInCallVideoSettingLocalEffectDialog = builder.create();
            mInCallVideoSettingLocalEffectDialog.show();
            return;
        } else
        {
            return;
        }
    }

    private void onVTInCallVideoSettingLocalNightMode()
    {
        log("onVTInCallVideoSettingLocalNightMode() ! ");
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mInCallScreen);
        builder.setNegativeButton(0x7f0d0196, new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mInCallVideoSettingLocalNightmodeDialog != null)
                {
                    mInCallVideoSettingLocalNightmodeDialog.dismiss();
                    mInCallVideoSettingLocalNightmodeDialog = null;
                }
            }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
        }
);
        builder.setTitle(0x7f0d0023);
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

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
                this$0 = VTInCallScreen.this;
                super();
            }
        }
;
        if (VTManager.getInstance().isSupportNightMode())
        {
            if (VTManager.getInstance().getNightMode())
                builder.setSingleChoiceItems(0x7f070018, 0, onclicklistener);
            else
                builder.setSingleChoiceItems(0x7f070018, 1, onclicklistener);
        } else
        {
            builder.setSingleChoiceItems(0x7f070019, 0, new android.content.DialogInterface.OnClickListener() {

                final VTInCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    if (mInCallVideoSettingLocalNightmodeDialog != null)
                    {
                        mInCallVideoSettingLocalNightmodeDialog.dismiss();
                        mInCallVideoSettingLocalNightmodeDialog = null;
                    }
                }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
            }
);
        }
        mInCallVideoSettingLocalNightmodeDialog = builder.create();
        mInCallVideoSettingLocalNightmodeDialog.show();
    }

    private void onVTInCallVideoSettingPeerQuality()
    {
        log("onVTInCallVideoSettingPeerQuality() ! ");
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mInCallScreen);
        builder.setNegativeButton(0x7f0d0196, new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mInCallVideoSettingPeerQualityDialog != null)
                {
                    mInCallVideoSettingPeerQualityDialog.dismiss();
                    mInCallVideoSettingPeerQualityDialog = null;
                }
            }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
        }
);
        builder.setTitle(0x7f0d0024);
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

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
                this$0 = VTInCallScreen.this;
                super();
            }
        }
;
        if (1 == VTManager.getInstance().getVideoQuality())
            builder.setSingleChoiceItems(0x7f07001a, 0, onclicklistener);
        else
        if (VTManager.getInstance().getVideoQuality() == 0)
            builder.setSingleChoiceItems(0x7f07001a, 1, onclicklistener);
        else
            log("VTManager.getInstance().getVideoQuality() is not VTManager.VT_VQ_SHARP or VTManager.VT_VQ_NORMAL , error ! ");
        mInCallVideoSettingPeerQualityDialog = builder.create();
        mInCallVideoSettingPeerQualityDialog.show();
    }

    private void onVTReceiveFirstFrame()
    {
        log("onVTReceiveFirstFrame() ! ");
        if (VTInCallScreenFlags.getInstance().mVTPeerBigger)
        {
            if (mVTHighVideo != null && mVTHighVideo.getBackground() != null)
                mVTHighVideo.setBackgroundDrawable(null);
        } else
        if (mVTLowVideo != null && mVTLowVideo.getBackground() != null)
            mVTLowVideo.setBackgroundDrawable(null);
        if (!VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame)
            VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame = true;
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
        if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting || VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting || VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
            hideLocalZoomOrBrightness();
        VTInCallScreenFlags vtincallscreenflags = VTInCallScreenFlags.getInstance();
        boolean flag;
        if (!VTInCallScreenFlags.getInstance().mVTPeerBigger)
            flag = true;
        else
            flag = false;
        vtincallscreenflags.mVTPeerBigger = flag;
        VTManager.getInstance().setVTVisible(false);
        updateVTLocalPeerDisplay();
        VTManager.getInstance().setVTVisible(true);
        if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting)
            showVTLocalZoom();
        if (VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting)
            showVTLocalBrightness();
        if (VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
            showVTLocalContrast();
    }

    private void onVTSwitchCameraClick()
    {
        log("onVTSwitchCameraClick()...");
        if (VTManager.getInstance().getState() != com.mediatek.vt.VTManager.State.READY && VTManager.getInstance().getState() != com.mediatek.vt.VTManager.State.CONNECTED)
            return;
        if (VTInCallScreenFlags.getInstance().mVTInSwitchCamera)
        {
            log("VTManager is handling switchcamera now, so returns this time.");
            return;
        }
        (new Thread() {

            final VTInCallScreen this$0;

            public void run()
            {
                VTInCallScreenFlags.getInstance().mVTInSwitchCamera = true;
                VTManager.getInstance().switchCamera();
                VTInCallScreenFlags.getInstance().mVTInSwitchCamera = false;
            }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
        }
).start();
        VTInCallScreenFlags vtincallscreenflags = VTInCallScreenFlags.getInstance();
        boolean flag;
        if (!VTInCallScreenFlags.getInstance().mVTFrontCameraNow)
            flag = true;
        else
            flag = false;
        vtincallscreenflags.mVTFrontCameraNow = flag;
        updateVTScreen(getVTScreenMode());
        VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
        VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
        VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
        hideLocalZoomOrBrightness();
    }

    private void onVTTakePeerPhotoClick()
    {
        log("onVTTakePeerPhotoClick()...");
        if (VTManager.getInstance().getState() != com.mediatek.vt.VTManager.State.CONNECTED)
            return;
        if (VTInCallScreenFlags.getInstance().mVTInSnapshot)
        {
            log("VTManager is handling snapshot now, so returns this time.");
            return;
        }
        if (!PhoneUtils.isExternalStorageMounted())
        {
            Toast.makeText(mInCallScreen, getResources().getString(0x7f0d0033), 0).show();
            return;
        }
        if (!PhoneUtils.diskSpaceAvailable(0xf4240L))
        {
            Toast.makeText(mInCallScreen, getResources().getString(0x7f0d0034), 0).show();
            return;
        } else
        {
            (new Thread() {

                final VTInCallScreen this$0;

                public void run()
                {
                    VTInCallScreenFlags.getInstance().mVTInSnapshot = true;
                    boolean flag = VTManager.getInstance().savePeerPhoto();
                    log((new StringBuilder()).append("onVTTakePeerPhotoClick(): VTManager.getInstance().savePeerPhoto(), return ").append(flag).toString());
                    if (flag)
                        mHandler.sendMessage(Message.obtain(mHandler, 126));
                    else
                        mHandler.sendMessage(Message.obtain(mHandler, 127));
                    VTInCallScreenFlags.getInstance().mVTInSnapshot = false;
                }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
            }
).start();
            return;
        }
    }

    private void onVoiceVideoRecordClick(MenuItem menuitem)
    {
        log("onVoiceVideoRecordClick");
        String s = menuitem.getTitle().toString();
        if (s != null)
        {
            if (!PhoneUtils.isExternalStorageMounted())
            {
                Toast.makeText(mInCallScreen, getResources().getString(0x7f0d000c), 1).show();
                return;
            }
            if (!PhoneUtils.diskSpaceAvailable(0x200000L))
            {
                mInCallScreen.handleStorageFull(true);
                return;
            }
            if (s.equals(mInCallScreen.getString(0x7f0d006f)))
            {
                log("want to startRecord");
                if (PhoneRecorderHandler.getInstance().getPhoneRecorderState() == 0)
                {
                    log("startRecord");
                    showStartVTRecorderDialog();
                    return;
                }
            } else
            if (s.equals(mInCallScreen.getString(0x7f0d0070)))
            {
                stopRecord();
                return;
            }
        }
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
        VTInCallScreenFlags.getInstance().mVTInControlRes = flag;
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

    private void setVtButtonSize(int i, int j, int k)
    {
        mVTMute.getLayoutParams().width = i;
        mVTMute.getLayoutParams().height = j;
        mVTAudio.getLayoutParams().width = i;
        mVTAudio.getLayoutParams().height = j;
        mVTDialpad.getLayoutParams().width = i;
        mVTDialpad.getLayoutParams().height = j;
        mVTOverflowMenu.getLayoutParams().width = i;
        mVTOverflowMenu.getLayoutParams().height = j;
        mVTSwapVideo.getLayoutParams().width = i;
        mVTSwapVideo.getLayoutParams().height = j;
        mVTHangUp.getLayoutParams().height = k + j * 2;
        mVTHangUpWrapper.getLayoutParams().height = k + j * 2;
        android.widget.RelativeLayout.LayoutParams layoutparams = (android.widget.RelativeLayout.LayoutParams)mVTHangUpWrapper.getLayoutParams();
        layoutparams.addRule(3, 0x7f08010f);
        layoutparams.addRule(1, 0x7f080116);
        layoutparams.topMargin = 0;
    }

    private void showAudioModePopup()
    {
        log("showAudioModePopup()...");
        dismissAudioModePopup();
        if (mAudioModePopup == null)
        {
            mAudioModePopup = new PopupMenu(mInCallScreen, mVTAudio);
            mAudioModePopup.getMenuInflater().inflate(0x7f100001, mAudioModePopup.getMenu());
            mAudioModePopup.setOnMenuItemClickListener(this);
            mAudioModePopup.setOnDismissListener(this);
        }
        InCallControlState incallcontrolstate = mInCallScreen.getUpdatedInCallControlState();
        Menu menu = mAudioModePopup.getMenu();
        menu.findItem(0x7f080134).setEnabled(incallcontrolstate.speakerEnabled);
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
        menu.findItem(0x7f080137).setEnabled(incallcontrolstate.bluetoothEnabled);
        mAudioModePopup.show();
        mAudioModePopupVisible = true;
    }

    private void showGenericErrorDialog(int i, boolean flag)
    {
        mInCallScreen.showGenericErrorDialog(i, flag);
    }

    private void showReCallDialogEx(int i, final String number, final int slot)
    {
        log("showReCallDialogEx... ");
        if (mVTVoiceReCallDialog != null && mVTVoiceReCallDialog.isShowing())
        {
            return;
        } else
        {
            CharSequence charsequence = getResources().getText(i);
            android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

                final VTInCallScreen this$0;
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
                    PhoneUtils.turnOnSpeaker(mInCallScreen, false, true);
                    makeVoiceReCall(number, slot);
                }

            
            {
                this$0 = VTInCallScreen.this;
                number = s;
                slot = i;
                super();
            }
            }
;
            android.content.DialogInterface.OnClickListener onclicklistener1 = new android.content.DialogInterface.OnClickListener() {

                final VTInCallScreen this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    log((new StringBuilder()).append("showReCallDialogEx... , on click, which=").append(j).toString());
                    if (mVTVoiceReCallDialog != null)
                    {
                        mVTVoiceReCallDialog.dismiss();
                        mVTVoiceReCallDialog = null;
                    }
                    mInCallScreen.delayedCleanupAfterDisconnect();
                }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
            }
;
            android.content.DialogInterface.OnCancelListener oncancellistener = new android.content.DialogInterface.OnCancelListener() {

                final VTInCallScreen this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    mInCallScreen.delayedCleanupAfterDisconnect();
                }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
            }
;
            mVTVoiceReCallDialog = (new android.app.AlertDialog.Builder(mInCallScreen)).setMessage(charsequence).setNegativeButton(0x7f0d0196, onclicklistener1).setPositiveButton(0x7f0d0192, onclicklistener).setOnCancelListener(oncancellistener).create();
            mVTVoiceReCallDialog.getWindow().addFlags(2);
            mVTVoiceReCallDialog.setOnShowListener(mInCallScreen);
            mVTVoiceReCallDialog.show();
            return;
        }
    }

    private void showStartVTRecorderDialog()
    {
        log("showStartVTRecorderDialog() ...");
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mInCallScreen);
        builder.setNegativeButton(0x7f0d0196, new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mVTRecorderSelector != null)
                {
                    mVTRecorderSelector.dismiss();
                    mVTRecorderSelector = null;
                }
            }

            
            {
                this$0 = VTInCallScreen.this;
                super();
            }
        }
);
        builder.setTitle(0x7f0d0067);
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
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            final VTInCallScreen this$0;

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
                this$0 = VTInCallScreen.this;
                super();
            }
        }
;
        builder.setSingleChoiceItems((CharSequence[])mVTRecorderEntries.toArray(new CharSequence[mVTRecorderEntries.size()]), -1, onclicklistener);
        mVTRecorderSelector = builder.create();
        mVTRecorderSelector.show();
    }

    private void showToast(String s)
    {
        Toast.makeText(PhoneGlobals.getInstance(), s, 1).show();
    }

    private void showVTLocalBrightness()
    {
        log("showVTLocalBrightness()...");
        if (!VTInCallScreenFlags.getInstance().mVTVideoReady)
            return;
        if (VTInCallScreenFlags.getInstance().mVTPeerBigger)
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
        VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
        VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = true;
        VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
    }

    private void showVTLocalContrast()
    {
        log("showVTLocalContrast()...");
        if (!VTInCallScreenFlags.getInstance().mVTVideoReady)
            return;
        if (VTInCallScreenFlags.getInstance().mVTPeerBigger)
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
        VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
        VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
        VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = true;
    }

    private void showVTLocalZoom()
    {
        log("showVTLocalZoom()...");
        if (!VTInCallScreenFlags.getInstance().mVTVideoReady)
            return;
        if (VTInCallScreenFlags.getInstance().mVTPeerBigger)
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
        VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = true;
        VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
        VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
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
        if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting)
        {
            mVTLowUp.setEnabled(VTManager.getInstance().canIncZoom());
            mVTLowDown.setEnabled(VTManager.getInstance().canDecZoom());
        } else
        {
            if (VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting)
            {
                mVTLowUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
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
        if (!VTInCallScreenFlags.getInstance().mVTInEndingCall && !VTCallUtils.isVTIdle())
        {
            mVTAudio.setEnabled(flag);
            mVTMute.setEnabled(VTCallUtils.isVTCallActive());
            mVTOverflowMenu.setEnabled(flag);
            mVTSwapVideo.setEnabled(VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame);
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
        if (VTInCallScreenFlags.getInstance().mVTPeerBigger)
            flag = false;
        compoundbutton.setChecked(flag);
        InCallControlState incallcontrolstate = mInCallScreen.getUpdatedInCallControlState();
        log("updateVTInCallButtons() : update mVTDialpad 's src !");
        mVTDialpad.setEnabled(incallcontrolstate.dialpadEnabled);
        mVTDialpad.setChecked(incallcontrolstate.dialpadVisible);
        log("updateVTInCallButtons() : update mVTAudio 's src !");
        updateAudioButton(incallcontrolstate);
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
        if (VTInCallScreenFlags.getInstance().mVTPeerBigger)
        {
            VTManager.getInstance().setDisplay(mLowVideoHolder, mHighVideoHolder);
            return;
        } else
        {
            VTManager.getInstance().setDisplay(mHighVideoHolder, mLowVideoHolder);
            return;
        }
    }

    private void updateVideoBkgDrawable()
    {
        if (VTSettingUtils.getInstance().mToReplacePeer)
            if (mBkgBitmapHandler != null && mBkgBitmapHandler.getBitmap() != null)
            {
                log("updatescreen(): replace the peer video");
                if (VTSettingUtils.getInstance().mPeerBigger)
                {
                    mVTHighVideo.setBackgroundDrawable(new BitmapDrawable(mBkgBitmapHandler.getBitmap()));
                    return;
                } else
                {
                    mVTLowVideo.setBackgroundDrawable(new BitmapDrawable(mBkgBitmapHandler.getBitmap()));
                    return;
                }
            } else
            {
                log("mBkgBitmapHandler is null or mBkgBitmapHandler.getBitmap() is null");
                return;
            }
        if (VTSettingUtils.getInstance().mPeerBigger)
        {
            mVTHighVideo.setBackgroundColor(0xff000000);
            return;
        } else
        {
            mVTLowVideo.setBackgroundColor(0xff000000);
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
            if (mCM.getActiveFgCall().isIdle() && mCM.getFirstActiveBgCall().isIdle() && mCM.getFirstActiveRingingCall().isIdle())
                mInCallScreen.endInCallScreenSession();
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
        log((new StringBuilder()).append("- handleOnScreenMenuItemClick: ").append(menuitem).toString());
        log((new StringBuilder()).append("  id: ").append(menuitem.getItemId()).toString());
        log((new StringBuilder()).append("  title: '").append(menuitem.getTitle()).append("'").toString());
        if (mInCallScreen == null)
        {
            log((new StringBuilder()).append("handleOnScreenMenuItemClick(").append(menuitem).append("), but null mInCallScreen!").toString());
            return true;
        }
        switch (menuitem.getItemId())
        {
        case 2131231031: 
            mInCallScreen.switchInCallAudio(com.android.phone.InCallScreen.InCallAudioMode.BLUETOOTH);
            return true;

        case 2131231029: 
        case 2131231030: 
            mInCallScreen.switchInCallAudio(com.android.phone.InCallScreen.InCallAudioMode.EARPIECE);
            return true;

        case 2131231028: 
            mInCallScreen.switchInCallAudio(com.android.phone.InCallScreen.InCallAudioMode.SPEAKER);
            return true;

        case 2131231041: 
            onVTInCallVideoSetting();
            return true;

        case 2131231040: 
            onVoiceVideoRecordClick(menuitem);
            return true;

        case 2131231038: 
            onVTSwapVideos();
            return true;

        case 2131231039: 
            onVTHideMeClick();
            return true;

        case 2131231037: 
            onVTTakePeerPhotoClick();
            return true;

        case 2131231036: 
            onVTSwitchCameraClick();
            return true;

        case 2131231032: 
        case 2131231033: 
        case 2131231034: 
        case 2131231035: 
        default:
            return false;
        }
    }

    public void initCommonVTState()
    {
        if (mBkgBitmapHandler != null)
            mBkgBitmapHandler.updateBitmapBySetting();
        if (!VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame)
            updateVideoBkgDrawable();
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
        if (!mExtension.initDialingSuccessVTState())
        {
            if (mBkgBitmapHandler != null)
                mBkgBitmapHandler.forceUpdateBitmapBySetting();
            if (!PhoneGlobals.getInstance().isHeadsetPlugged() && !mInCallScreen.isBluetoothAvailable())
                PhoneUtils.turnOnSpeaker(mInCallScreen, true, true, false);
            else
                VTCallUtils.setVTDialWithSpeakerOff(true);
            if (!VTSettingUtils.getInstance().mShowLocalMO)
            {
                onVTHideMeClick2();
                return;
            }
        }
    }

    public void initDialingVTState()
    {
        registerForVTPhoneStates();
        mVTCallBannerController.clearCallBannerInfo();
        if (mDialer != null && mDialer.isOpened())
        {
            log("initDialingVTState(): closeDialer");
            mDialer.closeDialer(true);
        }
    }

    public void initVTInCallScreen()
    {
        log("initVTInCallCanvas()...");
        mVTPowerManager = (PowerManager)mInCallScreen.getSystemService("power");
        mVTWakeLock = mVTPowerManager.newWakeLock(0x2000000a, "VTWakeLock");
        mCallBanner = (VTCallBanner)findViewById(0x7f08010b);
        mVTCallBannerController = new VTCallBannerController(mCallBanner, mInCallScreen);
        mVTLowWrapper = findViewById(0x7f080113);
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
        mVTHangUpWrapper = (RelativeLayout)findViewById(0x7f08011a);
        mVTMute.setOnClickListener(this);
        mVTAudio.setOnClickListener(this);
        mVTDialpad.setOnClickListener(this);
        mVTSwapVideo.setOnClickListener(this);
        mVTOverflowMenu.setOnClickListener(this);
        mVTHangUp.setOnClickListener(this);
        if (ViewConfiguration.get(mInCallScreen).hasPermanentMenuKey())
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
        if (ViewConfiguration.get(mInCallScreen).hasPermanentMenuKey())
            mVTMute.setNextFocusDownId(0x7f080118);
        else
            mVTMute.setNextFocusDownId(0x7f080119);
        mVTDialpad.setNextFocusLeftId(0x7f080117);
        if (ViewConfiguration.get(mInCallScreen).hasPermanentMenuKey())
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
        mBkgBitmapHandler = new VTBackgroundBitmapHandler();
        amendLayoutForDifferentScreen();
        mExtension = ExtensionManager.getInstance().getVTInCallScreenExtension();
        mExtension.initVTInCallScreen(this, this, mInCallScreen);
    }

    public void internalAnswerVTCallPre()
    {
        log("internalAnswerVTCallPre()...");
        if (mExtension.internalAnswerVTCallPre())
            return;
        if (VTCallUtils.isVTActive())
        {
            closeVTManager();
            log("internalAnswerVTCallPre: set VTInCallScreenFlags.getInstance().mVTShouldCloseVTManager = false");
            VTInCallScreenFlags.getInstance().mVTShouldCloseVTManager = false;
            VTInCallScreenFlags.getInstance().resetPartial();
        }
        Call call = mCM.getFirstActiveRingingCall();
        if (DualTalkUtils.isSupportDualTalk())
        {
            DualTalkUtils dualtalkutils = DualTalkUtils.getInstance();
            if (dualtalkutils.hasMultipleRingingCall())
                call = dualtalkutils.getFirstActiveRingingCall();
        }
        PhoneUtils.hangupAllCalls(true, call);
        log("hangup all calls except current ring call");
        log("VTIncallscreen, before incomingVTCall");
        VTManager.getInstance().incomingVTCall(1);
        log("VTIncallscreen, after incomingVTCall");
        if (!PhoneGlobals.getInstance().isHeadsetPlugged() && !mInCallScreen.isBluetoothAvailable())
            PhoneUtils.turnOnSpeaker(mInCallScreen, true, true, false);
        else
            VTCallUtils.setVTDialWithSpeakerOff(true);
        VTInCallScreenFlags.getInstance().reset();
        VTInCallScreenFlags.getInstance().mVTIsMT = true;
        android.provider.Telephony.SIMInfo siminfo = PhoneUtils.getSimInfoByCall(call);
        if (siminfo != null)
        {
            VTInCallScreenFlags.getInstance().mVTSlotId = siminfo.mSlot;
            VTCallUtils.checkVTFile(siminfo.mSlot);
            VTSettingUtils.getInstance().updateVTSettingState(siminfo.mSlot);
            VTInCallScreenFlags.getInstance().mVTPeerBigger = VTSettingUtils.getInstance().mPeerBigger;
            if (mBkgBitmapHandler != null)
            {
                mBkgBitmapHandler.forceUpdateBitmapBySetting();
                if (mBkgBitmapHandler.getBitmap() != null && !VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame)
                    updateVideoBkgDrawable();
            }
            mVTCallBannerController.clearCallBannerInfo();
            updateVTLocalPeerDisplay();
            if (!getVTInControlRes())
            {
                mInCallScreen.sendBroadcast(new Intent("android.phone.extra.VT_CALL_START"));
                setVTInControlRes(true);
            }
            if (mVTPopupMenu != null)
                mVTPopupMenu.dismiss();
            dismissAudioModePopup();
            setVTScreenMode(com.android.phone.Constants.VTScreenMode.VT_SCREEN_WAITING);
            updateVTScreen(getVTScreenMode());
            registerForVTPhoneStates();
            log("- set VTManager open ! ");
            VTManager.getInstance().setVTOpen(PhoneGlobals.getInstance().getBaseContext(), PhoneGlobals.getInstance().getCallManager(), siminfo.mSlot);
            log("- finish set VTManager open ! ");
            if (!VTSettingUtils.getInstance().mShowLocalMT.equals("0"))
                onVTHideMeClick2();
            if (PhoneUtils.isDMLocked())
            {
                log("- Now DM locked, VTManager.getInstance().lockPeerVideo() start");
                VTManager.getInstance().lockPeerVideo();
                log("- Now DM locked, VTManager.getInstance().lockPeerVideo() end");
            }
            if (VTInCallScreenFlags.getInstance().mVTSurfaceChangedH && VTInCallScreenFlags.getInstance().mVTSurfaceChangedL)
            {
                log("- set VTManager ready ! ");
                VTManager.getInstance().setVTReady();
                log("- finish set VTManager ready ! ");
                return;
            } else
            {
                VTInCallScreenFlags.getInstance().mVTSettingReady = true;
                return;
            }
        } else
        {
            log("internalAnswerVTCallPre(), accept a incoming call, but can not get ring call sim info, sim info is null,  need to check !!!!!");
            return;
        }
    }

    public void notifyLocaleChange()
    {
        mVTCallBannerController.setNeedClearUserData(true);
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
            if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().decZoom();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().decBrightness();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().decContrast();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131231005: 
            log("onClick: VTLowDown...");
            if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().decZoom();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().decBrightness();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().decContrast();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131230992: 
            log("onClick: VTHighUp...");
            if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().incZoom();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().incBrightness();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().incContrast();
                mVTHighUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTHighDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131231004: 
            log("onClick: VTLowUp...");
            if (VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting)
            {
                VTManager.getInstance().incZoom();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncZoom());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecZoom());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting)
            {
                VTManager.getInstance().incBrightness();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncBrightness());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecBrightness());
                return;
            }
            if (VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting)
            {
                VTManager.getInstance().incContrast();
                mVTLowUp.setEnabled(VTManager.getInstance().canIncContrast());
                mVTLowDown.setEnabled(VTManager.getInstance().canDecContrast());
                return;
            }
            break;

        case 2131231003: 
            log("onClick: VTHangUp...");
            VTInCallScreenFlags.getInstance().mVTInEndingCall = true;
            updateVTScreen(getVTScreenMode());
            PhoneUtils.hangup(PhoneGlobals.getInstance().mCM);
            return;

        case 2131231000: 
            log("onClick: VTSwapVideo...");
            onVTSwapVideos();
            return;

        case 2131230999: 
            log("onClick: VTDialpad...");
            mInCallScreen.onOpenCloseDialpad();
            return;

        case 2131230997: 
            log("onClick: VTSpeaker...");
            handleAudioButtonClick();
            return;

        case 2131230998: 
            log("onClick: VTMute");
            mInCallScreen.onMuteClick();
            return;

        case 2131230996: 
            log("onClick: VTLowVideo...");
            if (VTInCallScreenFlags.getInstance().mVTPeerBigger)
            {
                hideLocalZoomOrBrightness();
                VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
                VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
                VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
                return;
            }
            break;

        case 2131230991: 
            log("onClick: VTHighVideo...");
            if (!VTInCallScreenFlags.getInstance().mVTPeerBigger)
            {
                hideLocalZoomOrBrightness();
                VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
                VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
                VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
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
        if (mVTWakeLock != null && mVTWakeLock.isHeld())
        {
            mVTWakeLock.release();
            return;
        } else
        {
            return;
        }
    }

    public boolean onDisconnectVT(Connection connection, int i, boolean flag)
    {
label0:
        {
            if (connection != null)
            {
                com.android.internal.telephony.Connection.DisconnectCause disconnectcause = connection.getDisconnectCause();
                log((new StringBuilder()).append("onDisconnectVT(), cause = ").append(disconnectcause).append("").append(" isForeground = ").append(flag).append(" slotId = ").append(i).toString());
                if (flag)
                {
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.UNOBTAINABLE_NUMBER || disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.INVALID_NUMBER_FORMAT || disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.INVALID_NUMBER)
                        break label0;
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.CM_MM_RR_CONNECTION_RELEASE)
                    {
                        showGenericErrorDialog(0x7f0d004f, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.NO_ROUTE_TO_DESTINATION)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.BUSY)
                    {
                        showGenericErrorDialog(0x7f0d0051, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.NO_USER_RESPONDING)
                    {
                        showGenericErrorDialog(0x7f0d0052, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.USER_ALERTING_NO_ANSWER)
                    {
                        showGenericErrorDialog(0x7f0d0052, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.CALL_REJECTED)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.FACILITY_REJECTED)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.NORMAL_UNSPECIFIED && !connection.isIncoming())
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.CONGESTION)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.SWITCHING_CONGESTION)
                    {
                        showGenericErrorDialog(0x7f0d0053, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.SERVICE_NOT_AVAILABLE)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.BEARER_NOT_IMPLEMENT)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.FACILITY_NOT_IMPLEMENT)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.RESTRICTED_BEARER_AVAILABLE)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.OPTION_NOT_AVAILABLE)
                    {
                        showGenericErrorDialog(0x7f0d0050, false);
                        return true;
                    }
                }
                if ((VTSettingUtils.getInstance().mAutoDropBack || flag) && !connection.isIncoming())
                {
                    String s = connection.getAddress();
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.INCOMPATIBLE_DESTINATION)
                    {
                        log("VT call dropback INCOMPATIBLE_DESTINATION");
                        showReCallDialog(0x7f0d0015, s, i);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.RESOURCE_UNAVAILABLE)
                    {
                        log("VT call dropback RESOURCE_UNAVAILABLE");
                        showReCallDialog(0x7f0d0016, s, i);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.BEARER_NOT_AUTHORIZED)
                    {
                        log("VT call dropback BEARER_NOT_AUTHORIZED");
                        showReCallDialog(0x7f0d0019, s, i);
                        return true;
                    }
                    if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.BEARER_NOT_AVAIL)
                    {
                        log("VT call dropback BEARER_NOT_AVAIL");
                        showReCallDialog(0x7f0d0017, s, i);
                        return true;
                    }
                    if (disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.NORMAL && disconnectcause != com.android.internal.telephony.Connection.DisconnectCause.ERROR_UNSPECIFIED)
                    {
                        if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.NO_CIRCUIT_AVAIL)
                        {
                            log("VT call dropback NO_CIRCUIT_AVAIL");
                            showReCallDialog(0x7f0d0017, s, i);
                            return true;
                        }
                    } else
                    {
                        log("VT call dropback NORMAL or ERROR_UNSPECIFIED");
                        int j;
                        if (GeminiUtils.isGeminiSupport())
                        {
                            if (GeminiUtils.isValidSlot(i))
                                j = SystemProperties.getInt(GeminiConstants.PROPERTY_CS_NETWORK_TYPES[i], -1);
                            else
                                j = 1;
                        } else
                        {
                            j = SystemProperties.getInt("gsm.cs.network.type", -1);
                        }
                        log((new StringBuilder()).append("VT call dropback nCSNetType = ").append(j).toString());
                        if (1 == j || 2 == j)
                        {
                            showReCallDialog(0x7f0d0018, s, i);
                            return true;
                        }
                    }
                }
            }
            return false;
        }
        showGenericErrorDialog(0x7f0d018f, false);
        return true;
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
        if (!mExtension.onReceiveVTManagerStartCounter(mCM) && VTInCallScreenFlags.getInstance().mVTConnectionStarttime.mStarttime < 0L)
        {
            Call call = mCM.getActiveFgCall();
            if (mCM.hasActiveRingingCall())
                call = mCM.getFirstActiveRingingCall();
            mInCallScreen.triggerTimerStartCount(call);
            if (mCM.getActiveFgCall() != null && mCM.getActiveFgCall().getLatestConnection() != null)
            {
                VTInCallScreenFlags.getInstance().mVTConnectionStarttime.mStarttime = SystemClock.elapsedRealtime();
                VTInCallScreenFlags.getInstance().mVTConnectionStarttime.mConnection = mCM.getActiveFgCall().getLatestConnection();
                PhoneGlobals.getInstance().notificationMgr.updateInCallNotification();
                if (mVTCallBannerController != null)
                {
                    mVTCallBannerController.updateState(mCM.getActiveFgCall());
                    return;
                }
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
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        if (VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame && mExtension.onTouch(view, motionevent))
            return true;
        switch (0xff & motionevent.getAction())
        {
        case 0: // '\0'
            log("MotionEvent.ACTION_DOWN");
            hideLocalZoomOrBrightness();
            VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
            VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
            VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
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
        VTInCallScreenFlags.getInstance().reset();
        dismissVTDialogs();
        if (mVTLowVideo != null && mVTLowVideo.getBackground() != null)
            mVTLowVideo.setBackgroundDrawable(null);
        if (mVTHighVideo != null && mVTHighVideo.getBackground() != null)
            mVTHighVideo.setBackgroundDrawable(null);
        if (mBkgBitmapHandler != null)
            mBkgBitmapHandler.recycle();
    }

    void setDialer(DTMFTwelveKeyDialer dtmftwelvekeydialer)
    {
        mDialer = dtmftwelvekeydialer;
    }

    void setInCallScreenInstance(InCallScreen incallscreen)
    {
        mInCallScreen = incallscreen;
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
            if (VTInCallScreenFlags.getInstance().mVTSurfaceChangedH && VTInCallScreenFlags.getInstance().mVTSurfaceChangedL)
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
        if (VTSettingUtils.getInstance().mEnableBackCamera && !VTInCallScreenFlags.getInstance().mVTHideMeNow)
            flag1 = true;
        else
            flag1 = false;
        menuitem.setEnabled(flag1);
        menuitem1.setVisible(true);
        boolean flag2;
        if (!isDialerOpened() && VTInCallScreenFlags.getInstance().mVTVideoConnected)
            flag2 = true;
        else
            flag2 = false;
        menuitem1.setEnabled(flag2);
        menuitem2.setVisible(true);
        if (!VTInCallScreenFlags.getInstance().mVTHideMeNow)
            menuitem2.setTitle(getResources().getString(0x7f0d0042));
        else
            menuitem2.setTitle(getResources().getString(0x7f0d0043));
        boolean flag3;
        if (!ViewConfiguration.get(mInCallScreen).hasPermanentMenuKey())
            flag3 = true;
        else
            flag3 = false;
        menuitem3.setVisible(flag3);
        menuitem3.setEnabled(VTInCallScreenFlags.getInstance().mVTHasReceiveFirstFrame);
        menuitem4.setVisible(true);
        menuitem4.setEnabled(false);
        menuitem4.setTitle(0x7f0d006f);
        if (okToRecordVoice())
        {
            menuitem4.setEnabled(true);
            if (PhoneRecorderHandler.getInstance().isVTRecording())
                menuitem4.setTitle(0x7f0d0070);
        }
        menuitem5.setVisible(true);
        menuitem5.setEnabled(VTInCallScreenFlags.getInstance().mVTVideoConnected);
    }

    public void showReCallDialog(int i, String s, int j)
    {
        log("showReCallDialog... ");
        if (VTSettingUtils.getInstance().mAutoDropBack)
        {
            showToast(getResources().getString(0x7f0d004b));
            PhoneUtils.turnOnSpeaker(mInCallScreen, false, true);
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
            VTInCallScreenFlags.getInstance().mVTSurfaceChangedH = true;
        }
        if (surfaceholder == mLowVideoHolder)
        {
            log("surfaceChanged : LowVideo , set mVTSurfaceChangedL = true");
            VTInCallScreenFlags.getInstance().mVTSurfaceChangedL = true;
        }
        if (VTInCallScreenFlags.getInstance().mVTSurfaceChangedH && VTInCallScreenFlags.getInstance().mVTSurfaceChangedL)
        {
            updateVTLocalPeerDisplay();
            log("surfaceChanged : VTManager.getInstance().setVTVisible(true) start ...");
            VTManager.getInstance().setVTVisible(true);
            log("surfaceChanged : VTManager.getInstance().setVTVisible(true) end ...");
            if (!mVTWakeLock.isHeld())
                mVTWakeLock.acquire();
            if (VTInCallScreenFlags.getInstance().mVTSettingReady)
            {
                log("- set VTManager ready ! ");
                VTManager.getInstance().setVTReady();
                log("- finish set VTManager ready ! ");
                VTInCallScreenFlags.getInstance().mVTSettingReady = false;
            }
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
            VTInCallScreenFlags.getInstance().mVTSurfaceChangedH = false;
        }
        if (surfaceholder == mLowVideoHolder)
        {
            log("surfaceDestroyed : LowVideo, set mVTSurfaceChangedL = false");
            VTInCallScreenFlags.getInstance().mVTSurfaceChangedL = false;
        }
        if (!VTInCallScreenFlags.getInstance().mVTSurfaceChangedH && !VTInCallScreenFlags.getInstance().mVTSurfaceChangedL)
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

    public void updateElapsedTime(long l)
    {
        Call call = mCM.getActiveFgCall();
        if (call.getLatestConnection() != null && VTCallUtils.VTTimingMode.VT_TIMING_NONE == VTCallUtils.checkVTTimingMode(call.getLatestConnection().getAddress()))
        {
            mVTCallBannerController.updateElapsedTimeWidget(-1L);
            return;
        } else
        {
            mVTCallBannerController.updateElapsedTimeWidget(l);
            return;
        }
    }

    public void updateVTScreen(com.android.phone.Constants.VTScreenMode vtscreenmode)
    {
        log((new StringBuilder()).append("updateVTScreen : ").append(vtscreenmode).toString());
        if (vtscreenmode == com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE)
            return;
        if (mCM.getFirstActiveRingingCall().getState() == com.android.internal.telephony.Call.State.INCOMING && !mCM.getActiveFgCall().getState().isDialing())
            mVTCallBannerController.updateState(mCM.getFirstActiveRingingCall());
        else
        if (mCM.getActiveFgCall().getState() != com.android.internal.telephony.Call.State.IDLE)
            mVTCallBannerController.updateState(mCM.getActiveFgCall());
        else
            mVTCallBannerController.updateState(null);
        mInCallScreen.updateCallTime();
        mVTLowVideo.setClickable(true);
        mVTHangUp.setEnabled(true);
        log((new StringBuilder()).append("updateVTScreen : VTInCallScreenFlags.getInstance().mVTHideMeNow - ").append(VTInCallScreenFlags.getInstance().mVTHideMeNow).toString());
        log((new StringBuilder()).append("updateVTScreen : VTSettingUtils.getInstance().mEnableBackCamera - ").append(VTSettingUtils.getInstance().mEnableBackCamera).toString());
        if (!VTCallUtils.isVTActive())
        {
            VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
            VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
            VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
            hideLocalZoomOrBrightness();
            dismissVideoSettingDialogs();
            if (com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE != getVTScreenMode())
                mInCallScreen.closeOptionsMenu();
        }
        if (VTInCallScreenFlags.getInstance().mVTHideMeNow)
        {
            VTInCallScreenFlags.getInstance().mVTInLocalZoomSetting = false;
            VTInCallScreenFlags.getInstance().mVTInLocalBrightnessSetting = false;
            VTInCallScreenFlags.getInstance().mVTInLocalContrastSetting = false;
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
    static AlertDialog access$1102(VTInCallScreen vtincallscreen, AlertDialog alertdialog)
    {
        vtincallscreen.mInCallVideoSettingDialog = alertdialog;
        return alertdialog;
    }

*/









/*
    static AlertDialog access$1802(VTInCallScreen vtincallscreen, AlertDialog alertdialog)
    {
        vtincallscreen.mInCallVideoSettingLocalEffectDialog = alertdialog;
        return alertdialog;
    }

*/





/*
    static AlertDialog access$2002(VTInCallScreen vtincallscreen, AlertDialog alertdialog)
    {
        vtincallscreen.mInCallVideoSettingLocalNightmodeDialog = alertdialog;
        return alertdialog;
    }

*/



/*
    static AlertDialog access$2102(VTInCallScreen vtincallscreen, AlertDialog alertdialog)
    {
        vtincallscreen.mInCallVideoSettingPeerQualityDialog = alertdialog;
        return alertdialog;
    }

*/



/*
    static AlertDialog access$2202(VTInCallScreen vtincallscreen, AlertDialog alertdialog)
    {
        vtincallscreen.mVTVoiceReCallDialog = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$2402(VTInCallScreen vtincallscreen, AlertDialog alertdialog)
    {
        vtincallscreen.mVTRecorderSelector = alertdialog;
        return alertdialog;
    }

*/




/*
    static AlertDialog access$2602(VTInCallScreen vtincallscreen, AlertDialog alertdialog)
    {
        vtincallscreen.mVTMTAsker = alertdialog;
        return alertdialog;
    }

*/








/*
    static boolean access$702(VTInCallScreen vtincallscreen, boolean flag)
    {
        vtincallscreen.mHasMediaRecordError = flag;
        return flag;
    }

*/

}
