// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.media.*;
import android.os.*;
import android.util.Log;
import android.widget.ImageView;
import android.widget.SeekBar;
import java.util.HashMap;

// Referenced classes of package android.view:
//            LayoutInflater, View, ViewGroup, Window, 
//            MotionEvent

public class VolumePanel extends Handler
    implements android.widget.SeekBar.OnSeekBarChangeListener, View.OnClickListener
{
    private class StreamControl
    {

        ViewGroup group;
        ImageView icon;
        int iconMuteRes;
        int iconRes;
        SeekBar seekbarView;
        int streamType;
        final VolumePanel this$0;

        private StreamControl()
        {
            this$0 = VolumePanel.this;
            super();
        }

    }

    private static final class StreamResources extends Enum
    {

        private static final StreamResources $VALUES[];
        public static final StreamResources AlarmStream;
        public static final StreamResources BluetoothSCOStream;
        public static final StreamResources FMStream;
        public static final StreamResources MATVStream;
        public static final StreamResources MasterStream;
        public static final StreamResources MediaStream;
        public static final StreamResources NotificationStream;
        public static final StreamResources RemoteStream;
        public static final StreamResources RingerStream;
        public static final StreamResources VoiceStream;
        int descRes;
        int iconMuteRes;
        int iconRes;
        boolean show;
        int streamType;

        public static StreamResources valueOf(String s)
        {
            return (StreamResources)Enum.valueOf(android/view/VolumePanel$StreamResources, s);
        }

        public static StreamResources[] values()
        {
            return (StreamResources[])$VALUES.clone();
        }

        static 
        {
            BluetoothSCOStream = new StreamResources("BluetoothSCOStream", 0, 6, 0x10403fd, 0x108029a, 0x108029a, false);
            RingerStream = new StreamResources("RingerStream", 1, 2, 0x10403fe, 0x108029f, 0x10802a0, true);
            VoiceStream = new StreamResources("VoiceStream", 2, 0, 0x10403ff, 0x108029e, 0x108029e, false);
            AlarmStream = new StreamResources("AlarmStream", 3, 4, 0x10403fa, 0x1080298, 0x1080299, true);
            FMStream = new StreamResources("FMStream", 4, 10, 0x2050051, 0x108064c, 0x108064d, false);
            MATVStream = new StreamResources("MATVStream", 5, 11, 0x2050052, 0x108064c, 0x108064d, false);
            MediaStream = new StreamResources("MediaStream", 6, 3, 0x1040400, 0x10802a2, 0x10802a3, true);
            NotificationStream = new StreamResources("NotificationStream", 7, 5, 0x1040401, 0x108029c, 0x108029d, true);
            MasterStream = new StreamResources("MasterStream", 8, -100, 0x1040400, 0x10802a2, 0x10802a3, false);
            RemoteStream = new StreamResources("RemoteStream", 9, -200, 0x1040400, 0x108031a, 0x108030e, false);
            StreamResources astreamresources[] = new StreamResources[10];
            astreamresources[0] = BluetoothSCOStream;
            astreamresources[1] = RingerStream;
            astreamresources[2] = VoiceStream;
            astreamresources[3] = AlarmStream;
            astreamresources[4] = FMStream;
            astreamresources[5] = MATVStream;
            astreamresources[6] = MediaStream;
            astreamresources[7] = NotificationStream;
            astreamresources[8] = MasterStream;
            astreamresources[9] = RemoteStream;
            $VALUES = astreamresources;
        }

        private StreamResources(String s, int i, int j, int k, int l, int i1, boolean flag)
        {
            super(s, i);
            streamType = j;
            descRes = k;
            iconRes = l;
            iconMuteRes = i1;
            show = flag;
        }
    }

    private static class WarningDialogReceiver extends BroadcastReceiver
        implements android.content.DialogInterface.OnDismissListener
    {

        private Context mContext;
        private Dialog mDialog;

        public void onDismiss(DialogInterface dialoginterface)
        {
            mContext.unregisterReceiver(this);
            synchronized (VolumePanel.sConfirmSafeVolumeLock)
            {
                VolumePanel.sConfirmSafeVolumeDialog = null;
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void onReceive(Context context, Intent intent)
        {
            mDialog.cancel();
            synchronized (VolumePanel.sConfirmSafeVolumeLock)
            {
                VolumePanel.sConfirmSafeVolumeDialog = null;
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        WarningDialogReceiver(Context context, Dialog dialog)
        {
            mContext = context;
            mDialog = dialog;
            context.registerReceiver(this, new IntentFilter("android.intent.action.CLOSE_SYSTEM_DIALOGS"));
        }
    }


    private static final int BEEP_DURATION = 150;
    private static final int FREE_DELAY = 10000;
    private static boolean LOGD = false;
    private static final int MAX_VOLUME = 100;
    private static final int MSG_DISPLAY_SAFE_VOLUME_WARNING = 11;
    private static final int MSG_FREE_RESOURCES = 1;
    private static final int MSG_MUTE_CHANGED = 7;
    private static final int MSG_PLAY_SOUND = 2;
    private static final int MSG_REMOTE_VOLUME_CHANGED = 8;
    private static final int MSG_REMOTE_VOLUME_UPDATE_IF_SHOWN = 9;
    private static final int MSG_RINGER_MODE_CHANGED = 6;
    private static final int MSG_SLIDER_VISIBILITY_CHANGED = 10;
    private static final int MSG_STOP_SOUNDS = 3;
    private static final int MSG_TIMEOUT = 5;
    private static final int MSG_VIBRATE = 4;
    private static final int MSG_VOLUME_CHANGED = 0;
    public static final int PLAY_SOUND_DELAY = 300;
    private static final String PREF_MODE_VOLUME_OVERLAY = "volume_overlay_mode";
    private static final String PREF_VOLBTN_MUSIC_CTRL = "volbtn_music_controls";
    private static final String PREF_VOLUME_ADJUST_SOUNDS = "volume_adjust_sounds";
    private static final StreamResources STREAMS[];
    private static final int STREAM_MASTER = -100;
    private static final String TAG = "VolumePanel";
    private static final int TIMEOUT_DELAY = 3000;
    public static final int VIBRATE_DELAY = 300;
    private static final int VIBRATE_DURATION = 300;
    public static final int VOLUME_OVERLAY_EXPANDABLE = 1;
    public static final int VOLUME_OVERLAY_EXPANDED = 2;
    public static final int VOLUME_OVERLAY_NONE = 3;
    public static final int VOLUME_OVERLAY_SINGLE;
    private static AlertDialog sConfirmSafeVolumeDialog;
    private static Object sConfirmSafeVolumeLock = new Object();
    private int mActiveStreamType;
    private AudioManager mAudioManager;
    protected AudioService mAudioService;
    protected Context mContext;
    private int mCurrentOverlayStyle;
    private final Dialog mDialog;
    private final View mDivider;
    private final View mMoreButton;
    private final ViewGroup mPanel;
    private final boolean mPlayMasterStreamTones;
    private boolean mRingIsSilent;
    private ContentObserver mSettingsObserver;
    private boolean mShowCombinedVolumes;
    private final ViewGroup mSliderGroup;
    private HashMap mStreamControls;
    private ToneGenerator mToneGenerators[];
    private Vibrator mVibrator;
    private final View mView;
    private boolean mVoiceCapable;
    private boolean mVolumeLinkNotification;

    public VolumePanel(Context context, AudioService audioservice)
    {
        mCurrentOverlayStyle = -1;
        mActiveStreamType = -1;
        mSettingsObserver = new ContentObserver(this) {

            final VolumePanel this$0;

            public void onChange(boolean flag4)
            {
                int j = android.provider.Settings.System.getInt(mContext.getContentResolver(), "volume_overlay_mode", 0);
                changeOverlayStyle(j);
            }

            
            {
                this$0 = VolumePanel.this;
                super(handler);
            }
        }
;
        mContext = context;
        mAudioManager = (AudioManager)context.getSystemService("audio");
        mAudioService = audioservice;
        if (context.getResources().getBoolean(0x1110010))
        {
            for (int i = 0; i < STREAMS.length; i++)
            {
                StreamResources streamresources = STREAMS[i];
                boolean flag3;
                if (streamresources.streamType == -100)
                    flag3 = true;
                else
                    flag3 = false;
                streamresources.show = flag3;
            }

        }
        mView = ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(0x10900e3, null);
        mView.setOnTouchListener(new View.OnTouchListener() {

            final VolumePanel this$0;

            public boolean onTouch(View view, MotionEvent motionevent)
            {
                resetTimeout();
                return false;
            }

            
            {
                this$0 = VolumePanel.this;
                super();
            }
        }
);
        mPanel = (ViewGroup)mView.findViewById(0x10203ae);
        mSliderGroup = (ViewGroup)mView.findViewById(0x10203af);
        mMoreButton = (ImageView)mView.findViewById(0x1020323);
        mDivider = (ImageView)mView.findViewById(0x10203b0);
        mDialog = new Dialog(context, 0x103030a) {

            final VolumePanel this$0;

            public boolean onTouchEvent(MotionEvent motionevent)
            {
                if (isShowing() && motionevent.getAction() == 4)
                {
                    forceTimeout();
                    return true;
                } else
                {
                    return false;
                }
            }

            
            {
                this$0 = VolumePanel.this;
                super(context, i);
            }
        }
;
        mDialog.setTitle("Volume control");
        mDialog.setContentView(mView);
        mDialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

            final VolumePanel this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                mActiveStreamType = -1;
                mAudioManager.forceVolumeControlStream(mActiveStreamType);
            }

            
            {
                this$0 = VolumePanel.this;
                super();
            }
        }
);
        Window window = mDialog.getWindow();
        window.setGravity(48);
        WindowManager.LayoutParams layoutparams = (WindowManager.LayoutParams)window.getAttributes();
        layoutparams.token = null;
        layoutparams.y = mContext.getResources().getDimensionPixelOffset(0x105004d);
        layoutparams.type = 2020;
        layoutparams.width = -2;
        layoutparams.height = -2;
        layoutparams.privateFlags = 0x20 | layoutparams.privateFlags;
        window.setAttributes(layoutparams);
        window.addFlags(0x40028);
        mToneGenerators = new ToneGenerator[AudioSystem.getNumStreamTypes()];
        mVibrator = (Vibrator)context.getSystemService("vibrator");
        mVoiceCapable = context.getResources().getBoolean(0x1110030);
        mVolumeLinkNotification = true;
        changeOverlayStyle(android.provider.Settings.System.getInt(context.getContentResolver(), "volume_overlay_mode", 0));
        context.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("volume_overlay_mode"), false, mSettingsObserver);
        boolean flag = context.getResources().getBoolean(0x1110010);
        boolean flag1 = mContext.getResources().getBoolean(0x1110011);
        boolean flag2;
        if (flag && flag1)
            flag2 = true;
        else
            flag2 = false;
        mPlayMasterStreamTones = flag2;
        mMoreButton.setOnClickListener(this);
        listenToRingerMode();
    }

    private void addOtherVolumes()
    {
        if (mShowCombinedVolumes)
        {
            for (int i = 0; i < STREAMS.length; i++)
            {
                int j = STREAMS[i].streamType;
                if (STREAMS[i].show && j != mActiveStreamType && (mVoiceCapable || j != 2) && (!mVoiceCapable || !mVolumeLinkNotification || j != 5))
                {
                    StreamControl streamcontrol = (StreamControl)mStreamControls.get(Integer.valueOf(j));
                    mSliderGroup.addView(streamcontrol.group);
                    updateSlider(streamcontrol);
                }
            }

        }
    }

    private void changeOverlayStyle(int i)
    {
        Log.i("VolumePanel", (new StringBuilder()).append("changeOverlayStyle : ").append(i).toString());
        if (i == mCurrentOverlayStyle)
            return;
        switch (i)
        {
        case 3: // '\003'
            mShowCombinedVolumes = false;
            mCurrentOverlayStyle = 3;
            return;

        case 2: // '\002'
            mMoreButton.setVisibility(8);
            mDivider.setVisibility(8);
            mShowCombinedVolumes = true;
            if (mCurrentOverlayStyle == 3)
            {
                addOtherVolumes();
                expand();
            }
            mCurrentOverlayStyle = 2;
            return;

        case 1: // '\001'
            mMoreButton.setVisibility(0);
            mDivider.setVisibility(0);
            mShowCombinedVolumes = true;
            mCurrentOverlayStyle = 1;
            return;

        case 0: // '\0'
            mMoreButton.setVisibility(8);
            mDivider.setVisibility(8);
            mShowCombinedVolumes = false;
            mCurrentOverlayStyle = 0;
            return;
        }
    }

    private void collapse()
    {
        mMoreButton.setVisibility(0);
        mDivider.setVisibility(0);
        int i = mSliderGroup.getChildCount();
        for (int j = 1; j < i; j++)
            mSliderGroup.getChildAt(j).setVisibility(8);

    }

    private void createSliders()
    {
        LayoutInflater layoutinflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
        mStreamControls = new HashMap(STREAMS.length);
        Resources resources = mContext.getResources();
        for (int i = 0; i < STREAMS.length; i++)
        {
            StreamResources streamresources = STREAMS[i];
            int j = streamresources.streamType;
            StreamControl streamcontrol = new StreamControl();
            streamcontrol.streamType = j;
            streamcontrol.group = (ViewGroup)layoutinflater.inflate(0x10900e4, null);
            streamcontrol.group.setTag(streamcontrol);
            streamcontrol.icon = (ImageView)streamcontrol.group.findViewById(0x10203b1);
            streamcontrol.icon.setTag(streamcontrol);
            streamcontrol.icon.setContentDescription(resources.getString(streamresources.descRes));
            streamcontrol.iconRes = streamresources.iconRes;
            streamcontrol.iconMuteRes = streamresources.iconMuteRes;
            streamcontrol.icon.setImageResource(streamcontrol.iconRes);
            streamcontrol.icon.setOnClickListener(this);
            streamcontrol.seekbarView = (SeekBar)streamcontrol.group.findViewById(0x1020352);
            int k;
            if (j != 6 && j != 0)
                k = 0;
            else
                k = 1;
            streamcontrol.seekbarView.setMax(k + getStreamMaxVolume(j));
            streamcontrol.seekbarView.setOnSeekBarChangeListener(this);
            streamcontrol.seekbarView.setTag(streamcontrol);
            mStreamControls.put(Integer.valueOf(j), streamcontrol);
        }

    }

    private void expand()
    {
        int i = mSliderGroup.getChildCount();
        for (int j = 0; j < i; j++)
            if (mSliderGroup.getChildAt(j).getVisibility() != 0)
                mSliderGroup.getChildAt(j).setVisibility(0);

        mMoreButton.setVisibility(8);
        mDivider.setVisibility(8);
    }

    private void forceTimeout()
    {
        removeMessages(5);
        sendMessage(obtainMessage(5));
    }

    private ToneGenerator getOrCreateToneGenerator(int i)
    {
        if (i != -100)
            break MISSING_BLOCK_LABEL_15;
        if (!mPlayMasterStreamTones)
            break MISSING_BLOCK_LABEL_100;
        i = 1;
        this;
        JVM INSTR monitorenter ;
        ToneGenerator tonegenerator = mToneGenerators[i];
        if (tonegenerator != null)
            break MISSING_BLOCK_LABEL_44;
        mToneGenerators[i] = new ToneGenerator(i, 100);
_L2:
        ToneGenerator tonegenerator1 = mToneGenerators[i];
        this;
        JVM INSTR monitorexit ;
        return tonegenerator1;
        RuntimeException runtimeexception;
        runtimeexception;
        if (!LOGD) goto _L2; else goto _L1
_L1:
        Log.d("VolumePanel", (new StringBuilder()).append("ToneGenerator constructor failed with RuntimeException: ").append(runtimeexception).toString());
          goto _L2
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        return null;
    }

    private int getStreamMaxVolume(int i)
    {
        if (i == -100)
            return mAudioManager.getMasterMaxVolume();
        if (i == -200)
            return mAudioService.getRemoteStreamMaxVolume();
        else
            return mAudioManager.getStreamMaxVolume(i);
    }

    private int getStreamVolume(int i)
    {
        if (i == -100)
            return mAudioManager.getMasterVolume();
        if (i == -200)
            return mAudioService.getRemoteStreamVolume();
        else
            return mAudioManager.getStreamVolume(i);
    }

    private void hideSlider(int i)
    {
        int j = mSliderGroup.getChildCount();
        for (int k = 0; k < j; k++)
            if (i == ((StreamControl)mSliderGroup.getChildAt(k).getTag()).streamType)
                mSliderGroup.getChildAt(k).setVisibility(8);

    }

    private boolean isExpanded()
    {
        return mMoreButton.getVisibility() != 0;
    }

    private boolean isMuted(int i)
    {
        if (i == -100)
            return mAudioManager.isMasterMute();
        if (i == -200)
            return mAudioService.getRemoteStreamVolume() <= 0;
        else
            return mAudioManager.isStreamMute(i);
    }

    private void listenToRingerMode()
    {
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.media.RINGER_MODE_CHANGED");
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        intentfilter.addAction("android.intent.action.SKIN_CHANGED");
        mContext.registerReceiver(new BroadcastReceiver() {

            final VolumePanel this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if (s.equals("android.media.RINGER_MODE_CHANGED"))
                {
                    removeMessages(6);
                    sendMessage(obtainMessage(6));
                }
                if (s.equals("android.intent.action.SCREEN_OFF"))
                {
                    if (mDialog.isShowing())
                        forceTimeout();
                } else
                if (s.equals("android.intent.action.SKIN_CHANGED"))
                {
                    createSliders();
                    reorderSliders(mActiveStreamType);
                    return;
                }
            }

            
            {
                this$0 = VolumePanel.this;
                super();
            }
        }
, intentfilter);
    }

    private void reorderSliders(int i)
    {
        mSliderGroup.removeAllViews();
        StreamControl streamcontrol = (StreamControl)mStreamControls.get(Integer.valueOf(i));
        if (streamcontrol == null)
        {
            Log.e("VolumePanel", (new StringBuilder()).append("Missing stream type! - ").append(i).toString());
            mActiveStreamType = -1;
        } else
        {
            mSliderGroup.addView(streamcontrol.group);
            mActiveStreamType = i;
            streamcontrol.group.setVisibility(0);
            updateSlider(streamcontrol);
        }
        addOtherVolumes();
    }

    private void resetTimeout()
    {
        removeMessages(5);
        sendMessageDelayed(obtainMessage(5), 3000L);
    }

    private void setMusicIcon(int i, int j)
    {
        StreamControl streamcontrol = (StreamControl)mStreamControls.get(Integer.valueOf(3));
        if (streamcontrol != null)
        {
            streamcontrol.iconRes = i;
            streamcontrol.iconMuteRes = j;
            ImageView imageview = streamcontrol.icon;
            int k;
            if (isMuted(streamcontrol.streamType))
                k = streamcontrol.iconMuteRes;
            else
                k = streamcontrol.iconRes;
            imageview.setImageResource(k);
        }
    }

    private void setStreamVolume(int i, int j, int k)
    {
        if (i == -100)
        {
            mAudioManager.setMasterVolume(j, k);
            return;
        }
        if (i == -200)
        {
            mAudioService.setRemoteStreamVolume(j);
            return;
        } else
        {
            mAudioManager.setStreamVolume(i, j, k);
            return;
        }
    }

    private void updateSlider(StreamControl streamcontrol)
    {
        streamcontrol.seekbarView.setProgress(getStreamVolume(streamcontrol.streamType));
        boolean flag = isMuted(streamcontrol.streamType);
        ImageView imageview = streamcontrol.icon;
        int i;
        if (flag)
            i = streamcontrol.iconMuteRes;
        else
            i = streamcontrol.iconRes;
        imageview.setImageResource(i);
        if (streamcontrol.streamType == 2 && mAudioManager.getRingerMode() == 1)
            streamcontrol.icon.setImageResource(0x10802a1);
        else
        if (streamcontrol.streamType == 3 && mAudioManager.getRingerMode() == 1)
            streamcontrol.icon.setImageResource(0x10802a3);
        if (streamcontrol.streamType == -200)
        {
            streamcontrol.seekbarView.setEnabled(true);
            return;
        }
        if (streamcontrol.streamType != mAudioManager.getMasterStreamType() && flag)
        {
            streamcontrol.seekbarView.setEnabled(false);
            return;
        } else
        {
            streamcontrol.seekbarView.setEnabled(true);
            return;
        }
    }

    private void updateStates()
    {
        int i = mSliderGroup.getChildCount();
        for (int j = 0; j < i; j++)
            updateSlider((StreamControl)mSliderGroup.getChildAt(j).getTag());

    }

    public void handleMessage(Message message)
    {
label0:
        {
label1:
            {
label2:
                {
label3:
                    {
label4:
                        {
label5:
                            {
                                switch (message.what)
                                {
                                default:
                                    break;

                                case 0: // '\0'
                                    break label0;

                                case 1: // '\001'
                                    break label2;

                                case 2: // '\002'
                                    break label4;

                                case 3: // '\003'
                                    break label3;

                                case 4: // '\004'
                                    break label5;

                                case 7: // '\007'
                                    break label1;

                                case 11: // '\013'
                                    onDisplaySafeVolumeWarning();
                                    return;

                                case 10: // '\n'
                                    onSliderVisibilityChanged(message.arg1, message.arg2);
                                    return;

                                case 9: // '\t'
                                    onRemoteVolumeUpdateIfShown();
                                    return;

                                case 8: // '\b'
                                    onRemoteVolumeChanged(message.arg1, message.arg2);
                                    return;

                                case 6: // '\006'
                                    if (mDialog.isShowing())
                                    {
                                        updateStates();
                                        return;
                                    }
                                    break;

                                case 5: // '\005'
                                    if (mDialog.isShowing())
                                    {
                                        mDialog.dismiss();
                                        mActiveStreamType = -1;
                                        return;
                                    }
                                    break;
                                }
                                return;
                            }
                            onVibrate();
                            return;
                        }
                        onPlaySound(message.arg1, message.arg2);
                        return;
                    }
                    onStopSounds();
                    return;
                }
                onFreeResources();
                return;
            }
            onMuteChanged(message.arg1, message.arg2);
            return;
        }
        onVolumeChanged(message.arg1, message.arg2);
    }

    public void onClick(View view)
    {
        if (view == mMoreButton)
            expand();
        else
        if (view instanceof ImageView)
        {
            Intent intent = new Intent("android.settings.SOUND_SETTINGS");
            intent.setFlags(0x10200000);
            forceTimeout();
            mContext.startActivity(intent);
            return;
        }
        resetTimeout();
    }

    protected void onDisplaySafeVolumeWarning()
    {
label0:
        {
            synchronized (sConfirmSafeVolumeLock)
            {
                if (sConfirmSafeVolumeDialog == null)
                    break label0;
            }
            return;
        }
        sConfirmSafeVolumeDialog = (new android.app.AlertDialog.Builder(mContext)).setMessage(0x1040545).setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

            final VolumePanel this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                mAudioService.disableSafeMediaVolume();
            }

            
            {
                this$0 = VolumePanel.this;
                super();
            }
        }
).setNegativeButton(0x1040009, null).setIconAttribute(0x1010355).create();
        WarningDialogReceiver warningdialogreceiver = new WarningDialogReceiver(mContext, sConfirmSafeVolumeDialog);
        sConfirmSafeVolumeDialog.setOnDismissListener(warningdialogreceiver);
        sConfirmSafeVolumeDialog.getWindow().setType(2009);
        sConfirmSafeVolumeDialog.show();
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected void onFreeResources()
    {
        this;
        JVM INSTR monitorenter ;
        int i = -1 + mToneGenerators.length;
_L2:
        if (i < 0)
            break; /* Loop/switch isn't completed */
        if (mToneGenerators[i] != null)
            mToneGenerators[i].release();
        mToneGenerators[i] = null;
        i--;
        if (true) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected void onMuteChanged(int i, int j)
    {
        if (LOGD)
            Log.d("VolumePanel", (new StringBuilder()).append("onMuteChanged(streamType: ").append(i).append(", flags: ").append(j).append(")").toString());
        StreamControl streamcontrol = (StreamControl)mStreamControls.get(Integer.valueOf(i));
        if (streamcontrol != null)
        {
            ImageView imageview = streamcontrol.icon;
            int k;
            if (isMuted(streamcontrol.streamType))
                k = streamcontrol.iconMuteRes;
            else
                k = streamcontrol.iconRes;
            imageview.setImageResource(k);
        }
        onVolumeChanged(i, j);
    }

    protected void onPlaySound(int i, int j)
    {
        if (android.provider.Settings.System.getInt(mContext.getContentResolver(), "volume_adjust_sounds", 1) == 0)
            return;
        if (hasMessages(3))
        {
            removeMessages(3);
            onStopSounds();
        }
        this;
        JVM INSTR monitorenter ;
        ToneGenerator tonegenerator = getOrCreateToneGenerator(i);
        if (tonegenerator == null)
            break MISSING_BLOCK_LABEL_69;
        tonegenerator.startTone(24);
        sendMessageDelayed(obtainMessage(3), 150L);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onProgressChanged(SeekBar seekbar, int i, boolean flag)
    {
        Object obj = seekbar.getTag();
        if (flag && (obj instanceof StreamControl))
        {
            StreamControl streamcontrol = (StreamControl)obj;
            if (getStreamVolume(streamcontrol.streamType) != i)
                setStreamVolume(streamcontrol.streamType, i, 0);
        }
        resetTimeout();
    }

    protected void onRemoteVolumeChanged(int i, int j)
    {
        if (LOGD)
            Log.d("VolumePanel", (new StringBuilder()).append("onRemoteVolumeChanged(stream:").append(i).append(", flags: ").append(j).append(")").toString());
        if ((j & 1) == 0 && !mDialog.isShowing()) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorenter ;
        if (mActiveStreamType != -200)
            reorderSliders(-200);
        onShowVolumeChanged(-200, j);
        this;
        JVM INSTR monitorexit ;
_L4:
        if ((j & 4) != 0 && !mRingIsSilent)
        {
            removeMessages(2);
            sendMessageDelayed(obtainMessage(2, i, j), 300L);
        }
        if ((j & 8) != 0)
        {
            removeMessages(2);
            removeMessages(4);
            onStopSounds();
        }
        removeMessages(1);
        sendMessageDelayed(obtainMessage(1), 10000L);
        resetTimeout();
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        if (LOGD)
            Log.d("VolumePanel", "not calling onShowVolumeChanged(), no FLAG_SHOW_UI or no UI");
        if (true) goto _L4; else goto _L3
_L3:
    }

    protected void onRemoteVolumeUpdateIfShown()
    {
        if (LOGD)
            Log.d("VolumePanel", "onRemoteVolumeUpdateIfShown()");
        if (mDialog.isShowing() && mActiveStreamType == -200 && mStreamControls != null)
            onShowVolumeChanged(-200, 0);
    }

    protected void onShowVolumeChanged(int i, int j)
    {
        int k = getStreamVolume(i);
        mRingIsSilent = false;
        if (LOGD)
            Log.d("VolumePanel", (new StringBuilder()).append("onShowVolumeChanged(streamType: ").append(i).append(", flags: ").append(j).append("), index: ").append(k).toString());
        int l = getStreamMaxVolume(i);
        switch (i)
        {
        case 4: // '\004'
        case 11: // '\013'
        default:
            break;

        case 10: // '\n'
            StreamControl streamcontrol1 = (StreamControl)mStreamControls.get(Integer.valueOf(10));
            if (streamcontrol1 == null)
                break;
            streamcontrol1.iconRes = 0x108064c;
            streamcontrol1.iconMuteRes = 0x108064d;
            int j1 = getStreamVolume(streamcontrol1.streamType);
            ImageView imageview = streamcontrol1.icon;
            int k1;
            if (j1 == 0)
                k1 = streamcontrol1.iconMuteRes;
            else
                k1 = streamcontrol1.iconRes;
            imageview.setImageResource(k1);
            break;

        case -200: 
            if (LOGD)
                Log.d("VolumePanel", (new StringBuilder()).append("showing remote volume ").append(k).append(" over ").append(l).toString());
            break;

        case 6: // '\006'
            k++;
            l++;
            break;

        case 5: // '\005'
            if (RingtoneManager.getActualDefaultRingtoneUri(mContext, 2) == null)
                mRingIsSilent = true;
            break;

        case 0: // '\0'
            k++;
            l++;
            break;

        case 3: // '\003'
            if ((0x380 & mAudioManager.getDevicesForStream(3)) != 0)
                setMusicIcon(0x108029a, 0x108029b);
            else
                setMusicIcon(0x10802a2, 0x10802a3);
            break;

        case 2: // '\002'
            if (RingtoneManager.getActualDefaultRingtoneUri(mContext, 1) == null)
                mRingIsSilent = true;
            break;
        }
        StreamControl streamcontrol = (StreamControl)mStreamControls.get(Integer.valueOf(i));
        if (streamcontrol != null)
        {
            if (streamcontrol.seekbarView.getMax() != l)
                streamcontrol.seekbarView.setMax(l);
            streamcontrol.seekbarView.setProgress(k);
            if ((j & 0x20) == 0 && (i == mAudioManager.getMasterStreamType() || i == -200 || !isMuted(i)))
                streamcontrol.seekbarView.setEnabled(true);
            else
                streamcontrol.seekbarView.setEnabled(false);
        }
        if (!mDialog.isShowing() && mCurrentOverlayStyle != 3)
        {
            int i1;
            if (i == -200)
                i1 = -1;
            else
                i1 = i;
            mAudioManager.forceVolumeControlStream(i1);
            mDialog.setContentView(mView);
            if (mShowCombinedVolumes && mCurrentOverlayStyle != 2)
                collapse();
            if (mCurrentOverlayStyle == 2)
                expand();
            mDialog.show();
        }
        if (i != -200 && (j & 0x10) != 0 && mAudioService.isStreamAffectedByRingerMode(i) && mAudioManager.getRingerMode() == 1)
            sendMessageDelayed(obtainMessage(4), 300L);
    }

    protected void onSliderVisibilityChanged(int i, int j)
    {
        boolean flag = true;
        this;
        JVM INSTR monitorenter ;
        if (LOGD)
            Log.d("VolumePanel", (new StringBuilder()).append("onSliderVisibilityChanged(stream=").append(i).append(", visi=").append(j).append(")").toString());
          goto _L1
_L8:
        int k = -1 + STREAMS.length;
_L7:
        if (k < 0) goto _L3; else goto _L2
_L2:
        StreamResources streamresources = STREAMS[k];
        if (streamresources.streamType != i) goto _L5; else goto _L4
_L4:
        streamresources.show = flag;
        if (flag) goto _L3; else goto _L6
_L6:
        if (mActiveStreamType == i)
            mActiveStreamType = -1;
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L9:
        flag = false;
        break; /* Loop/switch isn't completed */
_L5:
        k--;
          goto _L7
        Exception exception;
        exception;
        throw exception;
_L1:
        if (j != flag) goto _L9; else goto _L8
    }

    public void onStartTrackingTouch(SeekBar seekbar)
    {
    }

    protected void onStopSounds()
    {
        this;
        JVM INSTR monitorenter ;
        int i = -1 + AudioSystem.getNumStreamTypes();
_L2:
        if (i < 0)
            break MISSING_BLOCK_LABEL_30;
        ToneGenerator tonegenerator = mToneGenerators[i];
        if (tonegenerator == null)
            break MISSING_BLOCK_LABEL_38;
        tonegenerator.stopTone();
        break MISSING_BLOCK_LABEL_38;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        i--;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void onStopTrackingTouch(SeekBar seekbar)
    {
        Object obj = seekbar.getTag();
        if ((obj instanceof StreamControl) && ((StreamControl)obj).streamType == -200)
            seekbar.setProgress(getStreamVolume(-200));
    }

    protected void onVibrate()
    {
        if (mAudioManager.getRingerMode() != 1)
        {
            return;
        } else
        {
            mVibrator.vibrate(300L);
            return;
        }
    }

    protected void onVolumeChanged(int i, int j)
    {
        if (LOGD)
            Log.d("VolumePanel", (new StringBuilder()).append("onVolumeChanged(streamType: ").append(i).append(", flags: ").append(j).append(")").toString());
        if ((j & 1) == 0) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorenter ;
        if (i != mActiveStreamType)
        {
            if (mCurrentOverlayStyle == 1)
                hideSlider(mActiveStreamType);
            reorderSliders(i);
        }
        onShowVolumeChanged(i, j);
        this;
        JVM INSTR monitorexit ;
_L2:
        if ((j & 4) != 0 && !mRingIsSilent)
        {
            removeMessages(2);
            sendMessageDelayed(obtainMessage(2, i, j), 300L);
        }
        if ((j & 8) != 0)
        {
            removeMessages(2);
            removeMessages(4);
            onStopSounds();
        }
        removeMessages(1);
        sendMessageDelayed(obtainMessage(1), 10000L);
        resetTimeout();
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void postDisplaySafeVolumeWarning()
    {
        if (hasMessages(11))
        {
            return;
        } else
        {
            obtainMessage(11, 0, 0).sendToTarget();
            return;
        }
    }

    public void postHasNewRemotePlaybackInfo()
    {
        if (hasMessages(9))
        {
            return;
        } else
        {
            obtainMessage(9).sendToTarget();
            return;
        }
    }

    public void postMasterMuteChanged(int i)
    {
        postMuteChanged(-100, i);
    }

    public void postMasterVolumeChanged(int i)
    {
        postVolumeChanged(-100, i);
    }

    public void postMuteChanged(int i, int j)
    {
        if (hasMessages(0))
            return;
        this;
        JVM INSTR monitorenter ;
        if (mStreamControls == null)
            createSliders();
        this;
        JVM INSTR monitorexit ;
        removeMessages(1);
        obtainMessage(7, i, j).sendToTarget();
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void postRemoteSliderVisibility(boolean flag)
    {
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        obtainMessage(10, -200, i).sendToTarget();
    }

    public void postRemoteVolumeChanged(int i, int j)
    {
        if (hasMessages(8))
            return;
        this;
        JVM INSTR monitorenter ;
        if (mStreamControls == null)
            createSliders();
        this;
        JVM INSTR monitorexit ;
        removeMessages(1);
        obtainMessage(8, i, j).sendToTarget();
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void postVolumeChanged(int i, int j)
    {
        if (hasMessages(0))
            return;
        this;
        JVM INSTR monitorenter ;
        if (mStreamControls == null)
            createSliders();
        this;
        JVM INSTR monitorexit ;
        removeMessages(1);
        obtainMessage(0, i, j).sendToTarget();
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    static 
    {
        LOGD = false;
        StreamResources astreamresources[] = new StreamResources[10];
        astreamresources[0] = StreamResources.BluetoothSCOStream;
        astreamresources[1] = StreamResources.RingerStream;
        astreamresources[2] = StreamResources.VoiceStream;
        astreamresources[3] = StreamResources.AlarmStream;
        astreamresources[4] = StreamResources.FMStream;
        astreamresources[5] = StreamResources.MATVStream;
        astreamresources[6] = StreamResources.MediaStream;
        astreamresources[7] = StreamResources.NotificationStream;
        astreamresources[8] = StreamResources.MasterStream;
        astreamresources[9] = StreamResources.RemoteStream;
        STREAMS = astreamresources;
    }




/*
    static AlertDialog access$202(AlertDialog alertdialog)
    {
        sConfirmSafeVolumeDialog = alertdialog;
        return alertdialog;
    }

*/





/*
    static int access$502(VolumePanel volumepanel, int i)
    {
        volumepanel.mActiveStreamType = i;
        return i;
    }

*/




}
