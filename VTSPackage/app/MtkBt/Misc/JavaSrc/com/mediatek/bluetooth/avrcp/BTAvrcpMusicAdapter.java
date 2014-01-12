// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.content.*;
import android.media.AudioManager;
import android.os.*;
import android.util.Log;
import android.widget.Toast;
import com.android.music.IMediaPlaybackService;
import java.lang.ref.WeakReference;
import java.util.BitSet;

// Referenced classes of package com.mediatek.bluetooth.avrcp:
//            BluetoothAvrcpService, IBTAvrcpMusic, BTAvrcpSystemListener

public class BTAvrcpMusicAdapter extends Thread
{
    class AvrcpMusicAdapterStub extends IBTAvrcpMusicCallback.Stub
    {

        WeakReference mAdapter;
        final BTAvrcpMusicAdapter this$0;

        public void notifyAppSettingChanged()
        {
            if (!mRegBit.get(8))
            {
                return;
            } else
            {
                mRegBit.clear(8);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] callback notifyAppSettingChanged ", new Object[0]));
                return;
            }
        }

        public void notifyNowPlayingContentChanged()
        {
        }

        public void notifyPlaybackPosChanged()
        {
            if (!mRegBit.get(5))
            {
                return;
            } else
            {
                mRegBit.clear(5);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] callback notifyPlaybackPosChanged ", new Object[0]));
                return;
            }
        }

        public void notifyPlaybackStatus(byte byte0)
        {
        }

        public void notifyTrackChanged(long l)
        {
        }

        public void notifyTrackReachEnd()
        {
            if (!mRegBit.get(3))
            {
                return;
            } else
            {
                mRegBit.clear(3);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] callback notifyTrackReachEnd ", new Object[0]));
                return;
            }
        }

        public void notifyTrackReachStart()
        {
label0:
            {
                synchronized (mRegBit)
                {
                    if (mRegBit.get(4))
                        break label0;
                }
                return;
            }
            mRegBit.clear(4);
            bitset;
            JVM INSTR monitorexit ;
            Log.i("MMI_AVRCP", String.format("[BT][AVRCP] callback notifyTrackReachStart ", new Object[0]));
            return;
            exception;
            bitset;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void notifyVolumehanged(byte byte0)
        {
            if (!mRegBit.get(13))
            {
                return;
            } else
            {
                mRegBit.clear(13);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] callback notifyVolumehanged ", new Object[0]));
                mAvrcpSrv.notificationVolumeChangedNative((byte)0, (byte)0, byte0);
                return;
            }
        }

        AvrcpMusicAdapterStub(BTAvrcpMusicAdapter btavrcpmusicadapter1)
        {
            this$0 = BTAvrcpMusicAdapter.this;
            super();
            mAdapter = new WeakReference(btavrcpmusicadapter1);
        }
    }


    public static final int AVRCP_PLAY_PAUSE = 2;
    public static final int AVRCP_PLAY_PLAYING = 1;
    public static final int AVRCP_PLAY_STOP = 0;
    public static final String DEFAULT_METADATA_STRING = " ";
    public static final int LAST = 3;
    public static final String META_CHANGED = "com.android.music.metachanged";
    public static final int NEXT = 2;
    public static final int NOW = 1;
    public static final String PLAYBACK_COMPLETE = "com.android.music.playbackcomplete";
    public static final String PLAYSTATE_CHANGED = "com.android.music.playstatechanged";
    private static final int PLAY_UPDATE_PERIOD = 1000;
    public static final String QUEUE_CHANGED = "com.android.music.queuechanged";
    public static final String QUIT_PLAYBACK = "com.android.music.quitplayback";
    private static final int STATUS_FWD_SEEK = 3;
    private static final int STATUS_PAUSED = 2;
    private static final int STATUS_PLAYING = 1;
    private static final int STATUS_REV_SEEK = 4;
    private static final int STATUS_STOPPED = 0;
    public static final String TAG = "MMI_AVRCP";
    private static boolean mExtraAttribute = true;
    private static int mPlayStatus = 0;
    private static int mPreviousFFPlayStatus = 1;
    private static int mPreviousPlayStatus = 0;
    private static boolean mStartReceiver = false;
    private static String sMusicAlbum = null;
    private static String sMusicArtist = null;
    private static long sMusicId = -1L;
    private static boolean sMusicPlaying = false;
    private static String sMusicTrack = null;
    private static boolean sPlayServiceInterface = true;
    private final int mActionKey = 17;
    private final int mActionKeyInfo = 33;
    private final int mActionRegNotify = 34;
    private final int mActionSetSetting = 18;
    private AvrcpMusicAdapterStub mAdapterCallback;
    private long mAddToNowList[];
    private byte mAttrs[];
    private int mAudioMax;
    private AudioManager mAudioMgr;
    private BluetoothAvrcpService mAvrcpSrv;
    private byte mCapabilities[];
    private boolean mConnected;
    private ServiceConnection mConnection;
    private Context mContext;
    public byte mCurEqualSetting;
    public byte mCurRepeatSetting;
    public byte mCurScanSetting;
    public byte mCurShuffleSetting;
    private byte mCurValue[];
    private boolean mDebug;
    private Handler mHandler;
    private boolean mInitCapability;
    private IBTAvrcpMusic mMusicService;
    private long mNotifySongId;
    private BitSet mPendingRegBit;
    private ServiceConnection mPlayConnection;
    private IMediaPlaybackService mPlayService;
    private boolean mPlayStartBind;
    private byte mPlayerStatus;
    private BitSet mRegBit;
    private volatile Looper mServiceLooper;
    private boolean mStartBind;
    private BroadcastReceiver mStatusListener;
    private BTAvrcpSystemListener mSystemListener;
    private boolean mUpdateSending;
    private byte mValueNum[];
    private byte mValuesEqualizer[];
    private byte mValuesRepeat[];
    private byte mValuesScan[];
    private byte mValuesShuffle[];
    private byte mVolume;

    BTAvrcpMusicAdapter(Context context, BluetoothAvrcpService bluetoothavrcpservice)
    {
        mAvrcpSrv = null;
        mAudioMgr = null;
        mAudioMax = 100;
        mPlayerStatus = 2;
        mVolume = 18;
        mCurEqualSetting = 1;
        mCurRepeatSetting = 1;
        mCurShuffleSetting = 1;
        mCurScanSetting = 1;
        mStartBind = false;
        mServiceLooper = null;
        mNotifySongId = 0L;
        mPlayStartBind = false;
        mPlayService = null;
        mConnected = false;
        mUpdateSending = false;
        mInitCapability = false;
        mSystemListener = new BTAvrcpSystemListener(this) {

            final BTAvrcpMusicAdapter this$0;

            public void onBatteryStatusChange(int i)
            {
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                Log.i("MIS_AVRCP", String.format("[BT][AVRCP] onBatteryStatusChange status:%d", aobj));
            }

            public void onSystemStatusChange(int i)
            {
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                Log.i("MIS_AVRCP", String.format("[BT][AVRCP] onSystemStatusChange status:%d", aobj));
            }

            public void onVolumeStatusChange(int i)
            {
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                Log.i("MIS_AVRCP", String.format("[BT][AVRCP] onSystemStatusChange volumn:%d", aobj));
            }

            
            {
                this$0 = BTAvrcpMusicAdapter.this;
                super(btavrcpmusicadapter1);
            }
        }
;
        mMusicService = null;
        mDebug = false;
        mStatusListener = new BroadcastReceiver() {

            final BTAvrcpMusicAdapter this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s = intent.getAction();
                Log.i("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] onReceive mStatusListener: ").append(s).toString());
                if (s.equals("com.android.music.metachanged"))
                {
                    BTAvrcpMusicAdapter.updateMusicTrackInfo(intent);
                    if (!passNotifyMsg(2, 0))
                        Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive EVENT_TRACK_CHANGED fail");
                    byte byte1 = getPlayerstatus();
                    if (!passNotifyMsg(1, byte1))
                        Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive EVENT_PLAYBACK_STATUS_CHANGED fail");
                } else
                if (s.equals("com.android.music.playstatechanged"))
                {
                    BTAvrcpMusicAdapter.updateMusicTrackInfo(intent);
                    byte byte0 = getPlayerstatus();
                    if (BTAvrcpMusicAdapter.mPreviousPlayStatus != byte0)
                    {
                        BTAvrcpMusicAdapter.mPreviousPlayStatus = byte0;
                        if (!passNotifyMsg(1, byte0))
                            Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive EVENT_PLAYBACK_STATUS_CHANGED fail");
                        if (!passNotifyMsg(2, byte0))
                        {
                            Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive EVENT_TRACK_CHANGED fail");
                            return;
                        }
                    }
                } else
                {
                    if (s.equals("com.android.music.quitplayback"))
                    {
                        Log.i("MMI_AVRCP", "[BT][AVRCP] action equals BTAvrcpMusicAdapter.QUIT_PLAYBACK");
                        return;
                    }
                    if (s.equals("com.android.music.queuechanged"))
                    {
                        BTAvrcpMusicAdapter.updateMusicTrackInfo(intent);
                        if (!passNotifyMsg(9, 0))
                        {
                            Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive EVENT_NOW_PLAYING_CONTENT_CHANGED fail");
                            return;
                        }
                    } else
                    {
                        if (s.equals("android.intent.action.SCREEN_OFF"))
                        {
                            Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive action equals ACTION_SCREEN_OFF");
                            return;
                        }
                        if (s.equals("android.intent.action.SCREEN_ON"))
                        {
                            Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive action equals ACTION_SCREEN_ON");
                            return;
                        }
                    }
                }
            }

            
            {
                this$0 = BTAvrcpMusicAdapter.this;
                super();
            }
        }
;
        mPlayConnection = new ServiceConnection() {

            final BTAvrcpMusicAdapter this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                Object aobj[] = new Object[1];
                aobj[0] = componentname.getClassName();
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] PlayService onServiceConnected className:%s", aobj));
                mPlayService = com.android.music.IMediaPlaybackService.Stub.asInterface(ibinder);
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                Object aobj[] = new Object[1];
                aobj[0] = componentname.getClassName();
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] PlayService onServiceDisconnected className:%s", aobj));
                if (mMusicService != null)
                    Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] unregistercallback ", new Object[0]));
                mPlayService = null;
            }

            
            {
                this$0 = BTAvrcpMusicAdapter.this;
                super();
            }
        }
;
        mConnection = new ServiceConnection() {

            final BTAvrcpMusicAdapter this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                Object aobj[] = new Object[1];
                aobj[0] = componentname.getClassName();
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] onServiceConnected className:%s", aobj));
                mMusicService = IBTAvrcpMusic.Stub.asInterface(ibinder);
                if (mDebug)
                    Toast.makeText(mContext, "[BT][AVRCP] MusicService onConnected", 0).show();
                if (mMusicService != null)
                {
                    Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] registercallback", new Object[0]));
                    mMusicService.registerCallback(mAdapterCallback);
                    Object aobj1[] = new Object[1];
                    aobj1[0] = Long.valueOf(mMusicService.getAudioId());
                    Log.i("MMI_AVRCP", String.format("[BT][AVRCP] mMusicService.getAudioId:%d", aobj1));
                    return;
                }
                try
                {
                    Log.i("MMI_AVRCP", String.format("[BT][AVRCP] mMusicService.getAudioId:null", new Object[0]));
                    return;
                }
                catch (RemoteException remoteexception)
                {
                    Log.e("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] BTAvrcpMusicAdapter mMusicService.registerCallback exception.error message:").append(remoteexception.getMessage()).toString());
                }
                return;
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                Object aobj[] = new Object[1];
                aobj[0] = componentname.getClassName();
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] onServiceDisconnected className:%s", aobj));
                if (mMusicService != null)
                {
                    Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] unregistercallback ", new Object[0]));
                    try
                    {
                        mMusicService.unregisterCallback(mAdapterCallback);
                    }
                    catch (RemoteException remoteexception)
                    {
                        Log.e("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] mMusicService.unregisterCallback exception.error message:").append(remoteexception.getMessage()).toString());
                    }
                }
                mMusicService = null;
                if (mDebug)
                    Toast.makeText(mContext, "[BT][AVRCP] MusicService onDisconnected !", 0).show();
            }

            
            {
                this$0 = BTAvrcpMusicAdapter.this;
                super();
            }
        }
;
        mAdapterCallback = new AvrcpMusicAdapterStub(this);
        mContext = context;
        mAvrcpSrv = bluetoothavrcpservice;
        mAudioMgr = (AudioManager)context.getSystemService("audio");
        setName("BTAvrcpMusicAdapterThread ");
        if (mAudioMgr != null)
        {
            mAudioMax = mAudioMgr.getStreamMaxVolume(3);
            mVolume = convertToAbosoluteVolume(mAudioMgr.getStreamVolume(3));
        } else
        {
            mAudioMax = 0;
            mVolume = 0;
        }
        convertToMgrVolume((byte)63);
        convertToMgrVolume((byte)127);
        convertToAbosoluteVolume(mAudioMax / 2);
        convertToAbosoluteVolume(mAudioMax);
        Log.i("MMI_AVRCP", "[BT][AVRCP] BTAvrcpMusicAdapter construct");
        checkCapability();
        mStartReceiver = false;
    }

    private void checkCapability()
    {
        byte byte0 = getSupportVersion();
        if (mInitCapability)
        {
            Log.i("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] version:").append(Byte.toString(byte0)).toString());
            return;
        }
        Log.i("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] init capability version:").append(Byte.toString(byte0)).toString());
        mInitCapability = true;
        mAttrs = new byte[2];
        mValueNum = new byte[2];
        mCurValue = new byte[4];
        if (byte0 == 14)
            mCapabilities = new byte[5];
        else
            mCapabilities = new byte[2];
        byte abyte0[] = mCapabilities;
        byte byte1 = (byte)1;
        abyte0[0] = 1;
        byte abyte1[] = mCapabilities;
        byte byte2 = (byte)(byte1 + 1);
        abyte1[byte1] = 2;
        if (byte0 == 14)
        {
            byte abyte6[] = mCapabilities;
            byte byte5 = (byte)(byte2 + 1);
            abyte6[byte2] = 9;
            byte abyte7[] = mCapabilities;
            byte byte6 = (byte)(byte5 + 1);
            abyte7[byte5] = 10;
            byte abyte8[] = mCapabilities;
            byte _tmp = (byte)(byte6 + 1);
            abyte8[byte6] = 11;
        }
        byte abyte2[] = mAttrs;
        byte byte3 = (byte)1;
        abyte2[0] = 2;
        byte abyte3[] = mAttrs;
        byte _tmp1 = (byte)(byte3 + 1);
        abyte3[byte3] = 3;
        byte abyte4[] = mValueNum;
        byte byte4 = (byte)1;
        abyte4[0] = 2;
        byte abyte5[] = mValueNum;
        byte _tmp2 = (byte)(byte4 + 1);
        abyte5[byte4] = 2;
        mCurValue[0] = 1;
        mCurValue[1] = 1;
        mValuesRepeat = new byte[3];
        mValuesShuffle = new byte[2];
        mValuesRepeat[0] = 1;
        mValuesRepeat[1] = 2;
        mValuesRepeat[2] = 3;
        mValuesShuffle[0] = 1;
        mValuesShuffle[1] = 2;
        mRegBit = new BitSet(16);
        mRegBit.clear();
        mPendingRegBit = new BitSet(16);
        mPendingRegBit.clear();
        if (BluetoothAvrcpService.sSupportMusicUI)
        {
            start();
            return;
        } else
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP] No AvrcpMusic debug looper");
            return;
        }
    }

    private void checkPlayStatusChange()
    {
        int i = getPlayerstatus();
        if (mPreviousPlayStatus != i)
        {
            mPreviousPlayStatus = i;
            if (!passNotifyMsg(2, i))
                Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive EVENT_TRACK_CHANGED fail");
            if (!passNotifyMsg(1, mPlayStatus))
                Log.i("MMI_AVRCP", "[BT][AVRCP] onReceive EVENT_PLAYBACK_STATUS_CHANGED fail");
        }
    }

    private byte convertToAbosoluteVolume(int i)
    {
        byte byte0 = (byte)(int)(127F * ((float)i / (float)mAudioMax));
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Byte.valueOf(byte0);
        aobj[2] = Integer.valueOf(mAudioMax);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP] Adapter convertToAbosoluteVolume Mgr(%d) to abs(%d) MaxMgr(%d)", aobj));
        return byte0;
    }

    private int convertToMgrVolume(byte byte0)
    {
        int i = (int)(((float)byte0 / 127F) * (float)mAudioMax);
        Object aobj[] = new Object[3];
        aobj[0] = Byte.valueOf(byte0);
        aobj[1] = Integer.valueOf(i);
        aobj[2] = Integer.valueOf(mAudioMax);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP] Adapter convertToMgrVolume absolute(%d) to Mgr(%d) MaxMgr(%d)", aobj));
        return i;
    }

    private void handleKeyMessage(Message message)
    {
        switch (message.what)
        {
        default:
            return;

        case 17: // '\021'
            Object aobj3[] = new Object[1];
            aobj3[0] = Integer.valueOf(message.arg1);
            String s = String.format("[BT][AVRCP] Receive a Avrcpkey:%d ", aobj3);
            Object aobj4[] = new Object[3];
            aobj4[0] = Integer.valueOf(message.what);
            aobj4[1] = Integer.valueOf(message.arg1);
            aobj4[2] = Integer.valueOf(message.arg2);
            Log.i("MMI_AVRCP", String.format("[BT][AVRCP] ACTION_KEY msg.what:%d arg1:%d arg2:%d", aobj4));
            Toast.makeText(mContext, s, 0).show();
            handleKeyMessageKeyEvent(message);
            return;

        case 33: // '!'
            Object aobj1[] = new Object[3];
            aobj1[0] = Integer.valueOf(message.what);
            aobj1[1] = Integer.valueOf(message.arg1);
            aobj1[2] = Integer.valueOf(message.arg2);
            Log.i("MMI_AVRCP", String.format("[BT][AVRCP] KEY_INFO msg.what:%d arg1:%d arg2:%d", aobj1));
            switch (message.arg1)
            {
            default:
                Object aobj2[] = new Object[1];
                aobj2[0] = Integer.valueOf(message.arg1);
                String.format("KeyCode:%d", aobj2);
                return;

            case 64: // '@'
                return;

            case 65: // 'A'
                return;

            case 66: // 'B'
                return;

            case 67: // 'C'
                return;

            case 68: // 'D'
                return;

            case 69: // 'E'
                return;

            case 70: // 'F'
                return;

            case 71: // 'G'
                return;

            case 72: // 'H'
                if (message.arg2 == 0)
                {
                    if (mPlayStatus == 4)
                    {
                        Log.i("MMI_AVRCP", "[AVRCP] back to playing status from rev_seek");
                        mPlayStatus = mPreviousFFPlayStatus;
                        Log.v("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] update-info back mPlayStatus:").append(Integer.toString(mPlayStatus)).toString());
                    }
                } else
                {
                    if (mPlayStatus == 4 || mPlayStatus == 3)
                        mPreviousFFPlayStatus = 1;
                    else
                        mPreviousFFPlayStatus = mPlayStatus;
                    mPlayStatus = 4;
                }
                checkPlayStatusChange();
                return;

            case 73: // 'I'
                if (message.arg2 == 0)
                {
                    if (mPlayStatus == 3)
                    {
                        Log.i("MMI_AVRCP", "[AVRCP] back to playing status from fwd_seek");
                        mPlayStatus = mPreviousFFPlayStatus;
                        Log.v("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] update-info back mPlayStatus:").append(Integer.toString(mPlayStatus)).toString());
                    }
                } else
                {
                    if (mPlayStatus == 4 || mPlayStatus == 3)
                        mPreviousFFPlayStatus = 1;
                    else
                        mPreviousFFPlayStatus = mPlayStatus;
                    mPlayStatus = 3;
                }
                checkPlayStatusChange();
                return;

            case 74: // 'J'
                return;

            case 75: // 'K'
                return;

            case 76: // 'L'
                return;
            }

        case 34: // '"'
            Object aobj[] = new Object[4];
            aobj[0] = Integer.valueOf(message.what);
            aobj[1] = Integer.valueOf(message.arg1);
            aobj[2] = Integer.valueOf(message.arg2);
            aobj[3] = Integer.valueOf(mRegBit.cardinality());
            Log.i("MMI_AVRCP", String.format("[BT][AVRCP] ACTION_REG_NOTIFY for notifyChange msg.what:%d arg1:%d arg2:%d cardinality:%d", aobj));
            break;
        }
        BitSet bitset = mRegBit;
        bitset;
        JVM INSTR monitorenter ;
        message.arg1;
        JVM INSTR lookupswitch 3: default 608
    //                   1: 620
    //                   2: 657
    //                   9: 729;
           goto _L1 _L2 _L3 _L4
_L1:
        return;
        Exception exception;
        exception;
        bitset;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        if (!mRegBit.get(1)) goto _L1; else goto _L5
_L5:
        mAvrcpSrv.notificationPlayStatusChangedNative((byte)0, (byte)0, (byte)message.arg1);
        mRegBit.clear(1);
          goto _L1
_L3:
        if (!mRegBit.get(2)) goto _L1; else goto _L6
_L6:
        mNotifySongId = sMusicId;
        Log.i("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] songid:").append(mNotifySongId).toString());
        mAvrcpSrv.notificationTrackChangedNative((byte)0, (byte)0, mNotifySongId);
        mRegBit.clear(2);
          goto _L1
_L4:
        if (!mRegBit.get(9)) goto _L1; else goto _L7
_L7:
        mAvrcpSrv.notificationNowPlayingChangedNative((byte)0, (byte)0);
        mRegBit.clear(9);
          goto _L1
    }

    private void handleKeyMessageKeyEvent(Message message)
    {
        if (mMusicService != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        message.arg1;
        JVM INSTR tableswitch 68 76: default 64
    //                   68 126
    //                   69 149
    //                   70 171
    //                   71 64
    //                   72 64
    //                   73 64
    //                   74 64
    //                   75 194
    //                   76 204;
           goto _L3 _L4 _L5 _L6 _L3 _L3 _L3 _L3 _L7 _L8
_L3:
        RemoteException remoteexception;
        Object aobj[];
        Object aobj1[] = new Object[1];
        aobj1[0] = Integer.valueOf(message.what);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP] Unhandle AvrcpKey:%d", aobj1));
        return;
_L4:
        if (1 == mMusicService.getPlayStatus()) goto _L1; else goto _L9
_L9:
        mMusicService.play();
        return;
_L5:
        if (mMusicService.getPlayStatus() == 0) goto _L1; else goto _L10
_L10:
        mMusicService.stop();
        return;
_L6:
        if (1 != mMusicService.getPlayStatus()) goto _L1; else goto _L11
_L11:
        mMusicService.pause();
        return;
_L7:
        try
        {
            mMusicService.next();
            return;
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception)
        {
            aobj = new Object[1];
            aobj[0] = Integer.valueOf(message.what);
            Log.i("MMI_AVRCP", String.format("[BT][AVRCP] AVRCP fail to passToHandleMessage what:%d", aobj));
            return;
        }
_L8:
        mMusicService.prev();
        return;
    }

    private void handleSettingMessage(Message message)
    {
    }

    public static boolean hasStartReceiver()
    {
        return mStartReceiver;
    }

    private boolean sendHandlerMessageDelayed(int i, int j, int k, long l)
    {
        if (mContext != null && mHandler != null)
        {
            Message message = mHandler.obtainMessage();
            message.what = i;
            message.arg1 = j;
            message.arg2 = k;
            boolean flag = mHandler.sendMessageDelayed(message, l);
            if (!flag)
                Log.e("MMI_AVRCP", "[BT][AVRCP] sendMessageDelayed fail ! ");
            return flag;
        } else
        {
            return false;
        }
    }

    public static void updateMusicTrackInfo(Intent intent)
    {
        if (intent != null)
        {
            if (intent.getAction().equals("com.android.music.metachanged"))
            {
                sMusicArtist = intent.getStringExtra("artist");
                sMusicAlbum = intent.getStringExtra("album");
                sMusicTrack = intent.getStringExtra("track");
                sMusicId = intent.getLongExtra("id", -1L);
                StringBuilder stringbuilder2 = (new StringBuilder()).append("[BT][AVRCP] update-info id:");
                Object aobj2[] = new Object[1];
                aobj2[0] = Long.valueOf(sMusicId);
                Log.i("MMI_AVRCP", stringbuilder2.append(String.format("%d", aobj2)).toString());
            }
            if (intent.getAction().equals("com.android.music.playstatechanged"))
            {
                Boolean boolean1 = Boolean.valueOf(intent.getBooleanExtra("playing", false));
                Boolean boolean2 = Boolean.valueOf(intent.getBooleanExtra("playstate", false));
                boolean flag;
                if (!boolean1.booleanValue() && !boolean2.booleanValue())
                    flag = false;
                else
                    flag = true;
                sMusicPlaying = flag;
                Log.i("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] update-info playing:").append(Boolean.toString(boolean1.booleanValue())).append(" ").append(Boolean.toString(boolean2.booleanValue())).toString());
            }
        }
        if (sMusicArtist != null)
        {
            StringBuilder stringbuilder1 = (new StringBuilder()).append("[BT][AVRCP] track-info artist:").append(sMusicArtist).append(" isPlaying:");
            Object aobj1[] = new Object[1];
            aobj1[0] = Boolean.valueOf(sMusicPlaying);
            Log.i("MMI_AVRCP", stringbuilder1.append(String.format("%b", aobj1)).append(" id:").append(Long.toString(sMusicId)).toString());
            return;
        } else
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("[BT][AVRCP] track-info isPlaying:");
            Object aobj[] = new Object[1];
            aobj[0] = Boolean.valueOf(sMusicPlaying);
            Log.i("MMI_AVRCP", stringbuilder.append(String.format("%b", aobj)).append(" id:").append(Long.toString(sMusicId)).toString());
            return;
        }
    }

    private static void updateNewPlayStatus(int i)
    {
        int j = mPlayStatus;
        Log.v("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] updateNewPlayStatuso status:").append(Integer.toString(mPlayStatus)).append(" newStatus:").append(Integer.toString(i)).toString());
        if (3 != i && 4 != i && 1 != i)
            mPlayStatus = i;
        else
        if (3 != mPlayStatus && 4 != 1)
            mPlayStatus = 1;
        if (j != mPlayStatus)
            Log.v("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] update-info new mPlayStatus:").append(Integer.toString(mPlayStatus)).toString());
    }

    public void abortContinueInd()
    {
        Log.w("MMI_AVRCP", "Receive an abort indication !");
    }

    public boolean addToNowPlaying(long l)
    {
        checkAndBindPlayService(true);
        IMediaPlaybackService imediaplaybackservice = mPlayService;
        boolean flag = false;
        if (imediaplaybackservice != null)
        {
            try
            {
                long al[] = {
                    l
                };
                mPlayService.enqueue(al, 3);
                Object aobj[] = new Object[1];
                aobj[0] = Long.valueOf(al[0]);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] enqueu %d", aobj));
            }
            catch (RemoteException remoteexception)
            {
                Log.w("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] BTAvrcpMusicAdapter addToNowPlaying enqueue exception:").append(remoteexception.getMessage()).toString());
                return false;
            }
            flag = true;
        }
        return flag;
    }

    public void checkAndBindMusicService()
    {
    }

    public void checkAndBindPlayService(boolean flag)
    {
        if (!sPlayServiceInterface)
            break MISSING_BLOCK_LABEL_38;
        if (mPlayService != null)
            break MISSING_BLOCK_LABEL_37;
        try
        {
            startToBindPlayService();
        }
        catch (Exception exception)
        {
            return;
        }
        if (!flag)
            break MISSING_BLOCK_LABEL_37;
        sleep(2000L);
        Log.w("MMI_AVRCP", "[BT][AVRCP] sleep 2000 to wait for binding ");
        return;
        Log.w("MMI_AVRCP", "[BT][AVRCP] ignore the mMusic playService");
        return;
    }

    public void deinit()
    {
        if (mConnection != null && mStartBind)
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP] Adapter deinit");
            if (mMusicService != null)
            {
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP][TT] unregistercallback ", new Object[0]));
                try
                {
                    mMusicService.unregisterCallback(mAdapterCallback);
                }
                catch (RemoteException remoteexception)
                {
                    Log.e("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP][TT] unregistercallback exception: ").append(remoteexception.getMessage()).toString());
                }
            }
            mMusicService = null;
            stopToBind();
        }
        if (mPlayService != null)
        {
            mAvrcpSrv.unbindService(mPlayConnection);
            mPlayService = null;
        }
        if (mServiceLooper != null)
        {
            mServiceLooper.quit();
            mServiceLooper = null;
        }
        stopReceiver();
        if (mHandler == null)
            break MISSING_BLOCK_LABEL_141;
        Log.i("MMI_AVRCP", "[BT][AVRCP] BTAvrcpMusicAdapter mHandler join 2");
        interrupt();
        join(100L);
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        Log.i("MMI_AVRCP", "[BT][AVRCP] join fail");
        return;
    }

    public byte getAbsoluteVolume()
    {
        return mVolume;
    }

    public byte getCurPlayerAppValue(byte byte0)
    {
        int i = 0;
        checkAndBindMusicService();
        if (mMusicService != null)
            switch (byte0)
            {
            default:
                Object aobj4[] = new Object[1];
                aobj4[0] = Byte.valueOf(byte0);
                Log.w("MMI_AVRCP", String.format("[BT][AVRCP] attr_id is not find attr_id:%d", aobj4));
                return 0;

            case 2: // '\002'
                try
                {
                    i = mMusicService.getRepeatMode();
                    Object aobj3[] = new Object[1];
                    aobj3[0] = Integer.valueOf(i);
                    Log.i("MMI_AVRCP", String.format("[BT][AVRCP] getRepeatMode ret %d", aobj3));
                }
                catch (RemoteException remoteexception1)
                {
                    Object aobj2[] = new Object[2];
                    aobj2[0] = Integer.valueOf(i);
                    aobj2[1] = remoteexception1.toString();
                    Log.w("MMI_AVRCP", String.format("[BT][AVRCP] Exception ! Fail to getRepeatMode %d %s", aobj2));
                }
                return (byte)i;

            case 3: // '\003'
                break;
            }
        else
            return 1;
        try
        {
            i = mMusicService.getShuffleMode();
            Object aobj1[] = new Object[1];
            aobj1[0] = Integer.valueOf(i);
            Log.i("MMI_AVRCP", String.format("[BT][AVRCP] getShuffleMode ret %d", aobj1));
        }
        catch (RemoteException remoteexception)
        {
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(i);
            aobj[1] = remoteexception.toString();
            Log.w("MMI_AVRCP", String.format("[BT][AVRCP] Exception ! Fail to getShuffleMode %d %s", aobj));
        }
        return (byte)i;
    }

    public String getElementAttribute(long l, int i)
    {
label0:
        {
            boolean flag = true;
            Object aobj[] = new Object[flag];
            if (mPlayService == null)
                flag = false;
            aobj[0] = Boolean.valueOf(flag);
            Log.w("MMI_AVRCP", String.format("[BT][AVRCP] AVRCP getElementAttribute %b", aobj));
            String s = null;
            switch (i)
            {
            default:
                break label0;

            case 3: // '\003'
                s = sMusicAlbum;
                if (s == null)
                    s = "";
                break;

            case 4: // '\004'
            case 5: // '\005'
            case 6: // '\006'
            case 7: // '\007'
                break;

            case 2: // '\002'
                s = sMusicArtist;
                if (s == null)
                    s = "";
                break;

            case 1: // '\001'
                s = sMusicTrack;
                if (s == null)
                    s = "";
                break;
            }
            if (s == null)
                s = "";
            return s;
        }
        return null;
    }

    public long[] getNowPlaying()
    {
        checkAndBindPlayService(true);
        if (mPlayService == null)
        {
            Log.i("MMI_AVRCP", "[AVRCP] no mPlayService for getNowPlaying");
            return null;
        }
        long al[];
        al = mPlayService.getQueue();
        Log.i("MMI_AVRCP", "[AVRCP] getQueue from mPlayService");
        if (al != null)
            try
            {
                Log.i("MMI_AVRCP", (new StringBuilder()).append("[AVRCP] getQueue from mPlayService length:").append(Integer.toString(al.length)).toString());
            }
            catch (RemoteException remoteexception)
            {
                al = null;
            }
        return al;
    }

    public String getPlayerAppAttrText(byte byte0)
    {
        switch (byte0)
        {
        case 4: // '\004'
            return "Scan Setting";

        case 3: // '\003'
            return "Shuffle Setting";

        case 2: // '\002'
            return "RepeatMode Setting";

        case 1: // '\001'
            return "Equalizer Setting";
        }
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.w("MMI_AVRCP", String.format("[BT][AVRCP] getPlayerAppAttrText unknow id:%d", aobj));
        return null;
    }

    public String getPlayerAppValueText(byte byte0, byte byte1)
    {
        switch (byte0)
        {
        case 4: // '\004'
            switch (byte1)
            {
            case 2: // '\002'
                return "Equal On";

            case 1: // '\001'
                return "Equal Off";
            }
            return null;

        case 3: // '\003'
            switch (byte1)
            {
            case 2: // '\002'
                return "Shuffle All";

            case 1: // '\001'
                return "Shuffle Off";
            }
            return null;

        case 2: // '\002'
            switch (byte1)
            {
            case 3: // '\003'
                return "Repeat All";

            case 2: // '\002'
                return "Repeat Single";

            case 1: // '\001'
                return "Repeat Off";
            }
            return null;

        case 1: // '\001'
            switch (byte1)
            {
            case 2: // '\002'
                return "Equal On";

            case 1: // '\001'
                return "Equal Off";
            }
            return null;
        }
        return null;
    }

    public byte getPlayerstatus()
    {
        byte byte0;
        if (sMusicPlaying)
            byte0 = 1;
        else
        if (-1L != sMusicId)
            byte0 = 2;
        else
            byte0 = 0;
        mPlayerStatus = byte0;
        return byte0;
    }

    public int getPlayerstatusSongLength()
    {
        checkAndBindPlayService(true);
        if (mPlayService == null) goto _L2; else goto _L1
_L1:
        long l = mPlayService.duration();
        int i = (int)l;
_L3:
        return i;
        RemoteException remoteexception;
        remoteexception;
        i = 0;
        if (true) goto _L3; else goto _L2
_L2:
        return 0;
    }

    public int getPlayerstatusSongPos()
    {
        checkAndBindPlayService(true);
        if (mPlayService == null) goto _L2; else goto _L1
_L1:
        long l = mPlayService.position();
        int i = (int)l;
_L3:
        return i;
        RemoteException remoteexception;
        remoteexception;
        i = 0;
        if (true) goto _L3; else goto _L2
_L2:
        return 0;
    }

    public byte getSupportVersion()
    {
        checkAndBindPlayService(false);
        return ((byte)(!sPlayServiceInterface ? 13 : 14));
    }

    public void informBatteryStatus(byte byte0)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP] informBatteryStatus status:%d", aobj));
    }

    public boolean informDisplayCharset(byte byte0, short aword0[])
    {
        for (byte byte1 = 0; byte1 < aword0.length && byte1 < byte0; byte1++)
        {
            Object aobj[] = new Object[2];
            aobj[0] = Byte.valueOf(byte1);
            aobj[1] = Short.valueOf(aword0[byte1]);
            Log.w("MMI_AVRCP", String.format("[BT][AVRCP] charset i:%d value:%d", aobj));
            if (aword0[byte1] == 106)
                return true;
        }

        return false;
    }

    public void init()
    {
        startReceiver();
    }

    public byte[] listPlayerAppAttribute()
    {
        return mAttrs;
    }

    public byte[] listPlayerAppValue(byte byte0)
    {
        switch (byte0)
        {
        case 4: // '\004'
            return mValuesScan;

        case 3: // '\003'
            return mValuesShuffle;

        case 2: // '\002'
            return mValuesRepeat;

        case 1: // '\001'
            return mValuesEqualizer;
        }
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.w("MMI_AVRCP", String.format("[BT][AVRCP] listPlayerAppValue attr_id:%d", aobj));
        return null;
    }

    public void notificationBatteryStatusChanged(byte byte0, byte byte1, byte byte2)
    {
        if (mAvrcpSrv != null)
            mAvrcpSrv.notificationBatteryStatusChanged(byte0, byte1, byte2);
    }

    public void notificationSystemStatusChanged(byte byte0, byte byte1, byte byte2)
    {
        if (mAvrcpSrv != null)
            mAvrcpSrv.notificationSystemStatusChanged(byte0, byte1, byte2);
    }

    public void notificationVolumeChanged(byte byte0, byte byte1, byte byte2)
    {
        if (mAvrcpSrv != null)
            mAvrcpSrv.notificationVolumeChanged(byte0, byte1, byte2);
    }

    public void onConnect()
    {
        Log.i("MMI_AVRCP", "[BT][AVRCP] Adapter onConnect");
        startToBind();
        Log.i("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] mbPlayServiceInterface is ").append(Boolean.toString(sPlayServiceInterface)).toString());
        synchronized (mRegBit)
        {
            mRegBit.clear();
        }
        if (mPendingRegBit != null)
            synchronized (mPendingRegBit)
            {
                mPendingRegBit.clear();
            }
        mConnected = true;
        return;
        exception;
        bitset;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        bitset1;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    public void onDisconnect()
    {
        if (mConnection != null && mStartBind)
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP] Adapter onDisconnect");
            if (mMusicService != null)
            {
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP][TT] unregistercallback ", new Object[0]));
                try
                {
                    mMusicService.unregisterCallback(mAdapterCallback);
                }
                catch (RemoteException remoteexception)
                {
                    Object aobj[] = new Object[1];
                    aobj[0] = remoteexception.getMessage();
                    Log.e("MMI_AVRCP", String.format("[BT][AVRCP][TT] BTAvrcpMusicAdapter onDisconnect unregistercallback Exception: %s", aobj));
                }
            }
            mMusicService = null;
            stopToBind();
        }
        synchronized (mRegBit)
        {
            mRegBit.clear();
        }
        synchronized (mPendingRegBit)
        {
            mPendingRegBit.clear();
        }
        mConnected = false;
        mUpdateSending = false;
        return;
        exception;
        bitset;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        bitset1;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    public boolean passNotifyMsg(int i, int j)
    {
        if (mHandler != null)
        {
            Message message = mHandler.obtainMessage();
            message.what = 34;
            message.arg1 = i;
            message.arg2 = j;
            mHandler.sendMessage(message);
            return true;
        } else
        {
            return false;
        }
    }

    public void passThroughKeyInd(int i, byte byte0)
    {
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(0);
        Log.v("MMI_AVRCP", String.format("[BT][AVRCP] Receive a Avrcpkey:%d (APKey:%d)", aobj));
        if (mContext != null && byte0 == 1 && BluetoothAvrcpService.sSupportMusicUI && mHandler != null)
        {
            Message message = mHandler.obtainMessage();
            message.what = 33;
            message.arg1 = i;
            message.arg2 = byte0;
            mHandler.sendMessage(message);
        }
    }

    public void passToHandleMessage(Message message)
    {
        switch (message.what)
        {
        case 18: // '\022'
            handleSettingMessage(message);
            return;
        }
        handleKeyMessage(message);
    }

    public boolean playItems(long l)
    {
        boolean flag;
        if (l == 0L)
        {
            Log.v("MMI_AVRCP", "[BT][AVRCP] Wrong id 0");
            return true;
        }
        checkAndBindPlayService(true);
        IMediaPlaybackService imediaplaybackservice = mPlayService;
        flag = false;
        if (imediaplaybackservice == null)
            break MISSING_BLOCK_LABEL_89;
        long al[] = {
            l
        };
        mPlayService.enqueue(al, 1);
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(al[0]);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP] enqueu %d", aobj));
        flag = true;
_L2:
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] BTAvrcpMusicAdapter playItem enqueue exception:").append(remoteexception.getMessage()).toString());
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public byte[] playerAppCapabilities()
    {
        return mCapabilities;
    }

    public boolean registerNotification(byte byte0, int i)
    {
        boolean flag = false;
        byte0;
        JVM INSTR tableswitch 1 13: default 68
    //                   1 186
    //                   2 186
    //                   3 153
    //                   4 153
    //                   5 153
    //                   6 349
    //                   7 349
    //                   8 153
    //                   9 186
    //                   10 68
    //                   11 68
    //                   12 68
    //                   13 375;
           goto _L1 _L2 _L2 _L3 _L3 _L3 _L4 _L4 _L3 _L2 _L1 _L1 _L1 _L5
_L1:
        if (flag)
            synchronized (mRegBit)
            {
                mRegBit.set(byte0);
                flag = mRegBit.get(byte0);
                Object aobj1[] = new Object[3];
                aobj1[0] = Byte.valueOf(byte0);
                aobj1[1] = Boolean.valueOf(flag);
                aobj1[2] = Integer.valueOf(mRegBit.cardinality());
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] mRegBit set %d Reg:%b cardinality:%d", aobj1));
            }
        return flag;
_L3:
        Object aobj2[] = new Object[1];
        aobj2[0] = Byte.valueOf(byte0);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP] MusicAdapter blocks support register event:%d", aobj2));
        flag = false;
        continue; /* Loop/switch isn't completed */
_L2:
        flag = false;
        byte0;
        JVM INSTR lookupswitch 3: default 224
    //                   1: 256
    //                   2: 279
    //                   9: 334;
           goto _L6 _L7 _L8 _L9
_L6:
        Log.w("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] registerNotification ").append(Integer.toString(byte0)).toString());
        continue; /* Loop/switch isn't completed */
_L7:
        byte byte1 = getPlayerstatus();
        mAvrcpSrv.notificationPlayStatusChangedNative((byte)0, (byte)1, byte1);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L8:
        getPlayerstatus();
        JVM INSTR tableswitch 1 2: default 304
    //                   1 326
    //                   2 326;
           goto _L10 _L11 _L11
_L10:
        long l = -1L;
_L12:
        mAvrcpSrv.notificationTrackChangedNative((byte)0, (byte)1, l);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L11:
        l = sMusicId;
        if (true) goto _L12; else goto _L9
_L9:
        mAvrcpSrv.notificationNowPlayingChangedNative((byte)0, (byte)1);
        flag = true;
        if (true) goto _L6; else goto _L4
_L4:
        BTAvrcpSystemListener btavrcpsystemlistener = mSystemListener;
        flag = false;
        if (btavrcpsystemlistener != null)
            flag = mSystemListener.regNotificationEvent(byte0, i);
        continue; /* Loop/switch isn't completed */
_L5:
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP] MusicAdapter blocks support register event:%d", aobj));
        flag = false;
        if (true) goto _L1; else goto _L13
_L13:
        exception;
        bitset;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void run()
    {
        Looper.prepare();
        mServiceLooper = Looper.myLooper();
        mHandler = new Handler() {

            final BTAvrcpMusicAdapter this$0;

            public void handleMessage(Message message)
            {
                passToHandleMessage(message);
            }

            
            {
                this$0 = BTAvrcpMusicAdapter.this;
                super();
            }
        }
;
        Looper.loop();
        mHandler = null;
    }

    public void sendAvrcpKeyEvent(int i, byte byte0)
    {
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(0);
        Log.v("MMI_AVRCP", String.format("[BT][AVRCP] Receive a Avrcpkey:%d (APKey:%d)", aobj));
        if (mContext != null && byte0 == 1 && mHandler != null)
        {
            Message message = mHandler.obtainMessage();
            message.what = 17;
            message.arg1 = i;
            message.arg2 = byte0;
            mHandler.sendMessage(message);
        }
    }

    public boolean setAbsoluteVolume(byte byte0)
    {
        if (mAudioMgr != null)
        {
            int i = convertToMgrVolume(byte0);
            if (mAudioMgr != null)
            {
                int j = mAudioMgr.getStreamVolume(3);
                mAudioMgr.setStreamVolume(3, i, 4);
                int k = mAudioMgr.getStreamVolume(3);
                Object aobj[] = new Object[3];
                aobj[0] = Integer.valueOf(j);
                aobj[1] = Integer.valueOf(i);
                aobj[2] = Integer.valueOf(k);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] Adapter before:%d to-set:%d after:%d", aobj));
                if (k == i)
                {
                    mVolume = byte0;
                    return true;
                }
            }
        }
        return false;
    }

    public boolean setPlayerAppValue(byte byte0, byte byte1)
    {
        boolean flag;
        int i;
        checkAndBindMusicService();
        flag = false;
        i = 0;
        if (byte0 != 2) goto _L2; else goto _L1
_L1:
        int k = mMusicService.getRepeatMode();
        i = k;
_L4:
        if (byte1 == i)
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP] Already in repeat mode");
            return true;
        }
        break; /* Loop/switch isn't completed */
        RemoteException remoteexception2;
        remoteexception2;
        Object aobj4[] = new Object[2];
        aobj4[0] = Byte.valueOf(byte1);
        aobj4[1] = remoteexception2.toString();
        Log.w("MMI_AVRCP", String.format("[BT][AVRCP] Exception ! Fail to getRepeatMode %s", aobj4));
        i = 0;
        if (true) goto _L4; else goto _L3
_L3:
        flag = false;
        byte1;
        JVM INSTR tableswitch 1 3: default 120
    //                   1 157
    //                   2 157
    //                   3 157;
           goto _L2 _L5 _L5 _L5
_L2:
        if (byte0 != 3) goto _L7; else goto _L6
_L6:
        int j = mMusicService.getShuffleMode();
        i = j;
_L9:
        if (byte1 == i)
        {
            Log.i("MMI_AVRCP", "Already in shutffle mode");
            return true;
        }
        break; /* Loop/switch isn't completed */
_L5:
        flag = mMusicService.setRepeatMode(byte1);
        if (flag)
            try
            {
                Object aobj6[] = new Object[1];
                aobj6[0] = Boolean.toString(flag);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] setRepeatMode ret %s", aobj6));
            }
            catch (RemoteException remoteexception3)
            {
                Object aobj5[] = new Object[2];
                aobj5[0] = Byte.valueOf(byte1);
                aobj5[1] = remoteexception3.toString();
                Log.w("MMI_AVRCP", String.format("[BT][AVRCP] Exception ! Fail to setRepeatMode %d %s", aobj5));
            }
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Object aobj1[] = new Object[1];
        aobj1[0] = remoteexception.toString();
        Log.w("MMI_AVRCP", String.format("[BT][AVRCP] Exception ! Fail to getShuffleMode %s", aobj1));
        if (true) goto _L9; else goto _L8
_L8:
        byte1;
        JVM INSTR tableswitch 1 3: default 308
    //                   1 350
    //                   2 350
    //                   3 308;
           goto _L7 _L10 _L10 _L7
_L7:
        if (!flag)
        {
            Object aobj[] = new Object[2];
            aobj[0] = Byte.valueOf(byte0);
            aobj[1] = Byte.valueOf(byte1);
            Log.w("MMI_AVRCP", String.format("[BT][AVRCP] fail to set attr_id:%d to value:%d", aobj));
        }
        return flag;
_L10:
        flag = mMusicService.setShuffleMode(byte1);
        if (flag)
            try
            {
                Object aobj3[] = new Object[1];
                aobj3[0] = Boolean.toString(flag);
                Log.i("MMI_AVRCP", String.format("[BT][AVRCP] setShuffleMode ret %s", aobj3));
            }
            catch (RemoteException remoteexception1)
            {
                Object aobj2[] = new Object[2];
                aobj2[0] = Byte.valueOf(byte1);
                aobj2[1] = remoteexception1.toString();
                Log.w("MMI_AVRCP", String.format("[BT][AVRCP] Exception ! Fail to setShuffleMode %d %s", aobj2));
                Log.w("MMI_AVRCP", remoteexception1.toString());
            }
        if (true) goto _L7; else goto _L11
_L11:
        if (true) goto _L2; else goto _L12
_L12:
    }

    public void startReceiver()
    {
        Log.i("MMI_AVRCP", "[BT][AVRCP][b] startReceiver");
        if (mStartReceiver)
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP][b] startReceiver ignore");
            return;
        } else
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP][b] startReceiver music intent");
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("com.android.music.playstatechanged");
            intentfilter.addAction("com.android.music.metachanged");
            intentfilter.addAction("com.android.music.quitplayback");
            intentfilter.addAction("com.android.music.queuechanged");
            intentfilter.addAction("android.intent.action.SCREEN_ON");
            intentfilter.addAction("android.intent.action.SCREEN_OFF");
            mAvrcpSrv.registerReceiver(mStatusListener, new IntentFilter(intentfilter));
            mStartReceiver = true;
            return;
        }
    }

    public void startToBind()
    {
    }

    public void startToBindPlayService()
    {
        if (mPlayService != null || !sPlayServiceInterface)
            return;
        sPlayServiceInterface = false;
        boolean flag;
        mAvrcpSrv.startService(new Intent("com.android.music.MediaPlaybackService"));
        flag = mAvrcpSrv.bindService(new Intent("com.android.music.MediaPlaybackService"), mPlayConnection, 0);
        Object aobj[] = new Object[1];
        aobj[0] = Boolean.valueOf(flag);
        Log.i("MMI_AVRCP", String.format("[BT][AVRCP][b] startPlaybackService bBindRet:%b", aobj));
        sPlayServiceInterface = flag;
        if (flag)
            break MISSING_BLOCK_LABEL_108;
        Log.i("MMI_AVRCP", "[BT][AVRCP] mMusicService does not have play interface ");
        mPlayStartBind = true;
_L2:
        Log.i("MMI_AVRCP", (new StringBuilder()).append("[BT][AVRCP] mbPlayServiceInterface is ").append(Boolean.toString(sPlayServiceInterface)).toString());
        return;
        SecurityException securityexception;
        securityexception;
        sPlayServiceInterface = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void stopReceiver()
    {
        if (!mStartReceiver)
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP][b] stopReceiver ignore");
            return;
        } else
        {
            Log.i("MMI_AVRCP", "[BT][AVRCP] startReceiver stop ");
            mAvrcpSrv.unregisterReceiver(mStatusListener);
            mStartReceiver = false;
            return;
        }
    }

    public void stopToBind()
    {
        Log.i("MMI_AVRCP", "[BT][AVRCP][b] stopToBind");
        mAvrcpSrv.unbindService(mConnection);
        mStartBind = false;
        Log.i("MMI_AVRCP", "[BT][AVRCP][b] PlayService stopToBind");
        mAvrcpSrv.unbindService(mPlayConnection);
        mPlayStartBind = false;
    }




/*
    static int access$002(int i)
    {
        mPreviousPlayStatus = i;
        return i;
    }

*/


/*
    static IMediaPlaybackService access$102(BTAvrcpMusicAdapter btavrcpmusicadapter, IMediaPlaybackService imediaplaybackservice)
    {
        btavrcpmusicadapter.mPlayService = imediaplaybackservice;
        return imediaplaybackservice;
    }

*/



/*
    static IBTAvrcpMusic access$202(BTAvrcpMusicAdapter btavrcpmusicadapter, IBTAvrcpMusic ibtavrcpmusic)
    {
        btavrcpmusicadapter.mMusicService = ibtavrcpmusic;
        return ibtavrcpmusic;
    }

*/





}
