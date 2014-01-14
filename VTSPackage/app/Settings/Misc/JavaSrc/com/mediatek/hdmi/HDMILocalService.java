// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.hdmi;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.media.AudioManager;
import android.os.*;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.hdmi.IHDMINative;
import com.mediatek.telephony.TelephonyManagerEx;
import java.util.Arrays;

// Referenced classes of package com.mediatek.hdmi:
//            NvRAMAgent

public class HDMILocalService extends Service
{
    private class HDMIServiceReceiver extends BroadcastReceiver
    {

        final HDMILocalService this$0;

        public void onReceive(Context context, Intent intent)
        {
            boolean flag = true;
            String s = intent.getAction();
            if ("android.intent.action.HDMI_PLUG".equals(s))
            {
                if (intent.getIntExtra("state", 0) != flag)
                    flag = false;
                HDMILocalService.sIsCablePluged = flag;
                dealWithCablePluged();
            } else
            {
                if ("android.intent.action.HEADSET_PLUG".equals(s))
                {
                    Log.e("hdmi", "receive the headset plugin and do nothing");
                    return;
                }
                if ("android.intent.action.ACTION_BOOT_IPO".equals(s))
                {
                    Log.e("hdmi", "HDMI local service receive IPO boot up broadcast");
                    dealWithIPO(flag);
                    return;
                }
                if ("android.intent.action.ACTION_SHUTDOWN_IPO".equals(s))
                {
                    dealWithIPO(false);
                    return;
                }
            }
        }

        private HDMIServiceReceiver()
        {
            this$0 = HDMILocalService.this;
            super();
        }

    }

    public class LocalBinder extends Binder
    {

        final HDMILocalService this$0;

        public HDMILocalService getService()
        {
            return HDMILocalService.this;
        }

        public LocalBinder()
        {
            this$0 = HDMILocalService.this;
            super();
        }
    }


    public static final String ACTION_CABLE_STATE_CHANGED = "com.mediatek.hdmi.localservice.action.CABLE_STATE_CHANGED";
    public static final String ACTION_EDID_UPDATED = "com.mediatek.hdmi.localservice.action.EDID_UPDATED";
    public static final String ACTION_IPO_BOOTUP = "android.intent.action.ACTION_BOOT_IPO";
    public static final String ACTION_IPO_SHUTDOWN = "android.intent.action.ACTION_SHUTDOWN_IPO";
    private static final int AP_CFG_RDCL_FILE_HDCP_KEY_LID = 42;
    private static final String GET_HDMI_AUDIO_STATUS = "GetHDMIAudioStatus";
    private static final String HDMI_AUDIO_STATUS_DISABLED = "GetHDMIAudioStatus=false";
    private static final String HDMI_AUDIO_STATUS_ENABLED = "GetHDMIAudioStatus=true";
    public static final String KEY_HDMI_AUDIO_STATUS = "hdmi_audio_status";
    public static final String KEY_HDMI_COLOR_SPACE = "hdmi_color_space";
    public static final String KEY_HDMI_DEEP_COLOR = "hdmi_deep_color";
    public static final String KEY_HDMI_ENABLE_STATUS = "hdmi_enable_status";
    public static final String KEY_HDMI_VIDEO_RESOLUTION = "hdmi_video_resolution";
    public static final String KEY_HDMI_VIDEO_STATUS = "hdmi_video_status";
    private static final String LOCAL_TAG = " >> HDMILocalService.";
    private static final String SET_HDMI_AUDIO_DISABLED = "SetHDMIAudioEnable=0";
    private static final String SET_HDMI_AUDIO_ENABLED = "SetHDMIAudioEnable=1";
    private static final int SLEEP_TIME = 140;
    private static final String TAG = "hdmi";
    public static int sEdid[] = null;
    public static int sEdidPrev[] = null;
    private static boolean sHMDIAudioTargetState = true;
    private static boolean sHMDITargetState = true;
    private static boolean sHMDIVideoTargetState = true;
    private static boolean sIsCablePluged = false;
    private static boolean sIsCallStateIdle = true;
    private static boolean sIsRunning = true;
    private static android.os.PowerManager.WakeLock sWakeLock = null;
    private static int sWiredHeadSetPlugState = 0;
    private AudioManager mAudioManager;
    private final IBinder mBinder = new LocalBinder();
    private IHDMINative mHdmiNative;
    private PhoneStateListener mPhoneStateListener;
    private HDMIServiceReceiver mReceiver;
    private TelephonyManager mTelephonyManager;

    public HDMILocalService()
    {
        mHdmiNative = null;
        mAudioManager = null;
        mTelephonyManager = null;
        mReceiver = null;
        mPhoneStateListener = new PhoneStateListener() {

            final HDMILocalService this$0;

            public void onCallStateChanged(int i, String s)
            {
                Log.i("hdmi", (new StringBuilder()).append(" >> HDMILocalService. Phone state changed, new state=").append(i).toString());
                if (i != 0)
                {
                    HDMILocalService.sIsCallStateIdle = false;
                    dealWithCallStateChanged();
                    return;
                }
                if (mTelephonyManager == null)
                    mTelephonyManager = (TelephonyManager)getSystemService("phone");
                TelephonyManagerEx telephonymanagerex = TelephonyManagerEx.getDefault();
                int j = telephonymanagerex.getCallState(0);
                int k = telephonymanagerex.getCallState(1);
                Log.e("hdmi", (new StringBuilder()).append(" >> HDMILocalService.phone state change, sim1=").append(j).append(", sim2=").append(k).toString());
                if (j == 0 && k == 0)
                {
                    HDMILocalService.sIsCallStateIdle = true;
                    dealWithCallStateChanged();
                    return;
                } else
                {
                    Log.e("hdmi", " >> HDMILocalService. phone is not idle for gemini phone");
                    HDMILocalService.sIsCallStateIdle = false;
                    dealWithCallStateChanged();
                    return;
                }
            }

            
            {
                this$0 = HDMILocalService.this;
                super();
            }
        }
;
    }

    private void dealWithCablePluged()
    {
        Log.e("hdmi", (new StringBuilder()).append(" >> HDMILocalService.dealWithCablePluged(), is cable pluged in?").append(sIsCablePluged).toString());
        Intent intent = new Intent("com.mediatek.hdmi.localservice.action.CABLE_STATE_CHANGED");
        intent.putExtra("cable_pluged", sIsCablePluged);
        sendBroadcast(intent);
        showNotification(sIsCablePluged);
        if (sIsCablePluged)
        {
            updateAudioState();
            enableVideoImp(sHMDIVideoTargetState);
            initVideoResolution();
            if (mHdmiNative.ishdmiForceAwake() && sWakeLock != null && !sWakeLock.isHeld())
                sWakeLock.acquire();
        } else
        {
            Log.e("hdmi", " >> HDMILocalService.dealWithCablePluged() sleep 140ms for audio");
            try
            {
                Thread.sleep(140L);
            }
            catch (InterruptedException interruptedexception)
            {
                interruptedexception.printStackTrace();
            }
            enableAudioImp(false);
            enableVideoImp(false);
            if (mHdmiNative.ishdmiForceAwake() && sWakeLock != null && sWakeLock.isHeld())
            {
                sWakeLock.release();
                return;
            }
        }
    }

    private void dealWithCallStateChanged()
    {
        Log.i("hdmi", " >> HDMILocalService.updateAudioStateByPhone()");
        if (sHMDIAudioTargetState)
        {
            updateAudioState();
            return;
        } else
        {
            Log.i("hdmi", " >> HDMILocalService. audio was off, just return");
            return;
        }
    }

    private void dealWithHeadSetChanged()
    {
        Log.e("hdmi", (new StringBuilder()).append(" >> HDMILocalService.dealWithHeadSetChanged(), headset new state = ").append(sWiredHeadSetPlugState).toString());
        if (sHMDIAudioTargetState)
        {
            updateAudioState();
            return;
        } else
        {
            Log.i("hdmi", " >> HDMILocalService. audio was off, just return");
            return;
        }
    }

    private void dealWithIPO(boolean flag)
    {
        Log.i("hdmi", (new StringBuilder()).append("dealWithIPO(), is bootUp?").append(flag).append(", sHMDITargetState=").append(sHMDITargetState).toString());
        if (sHMDITargetState)
            mHdmiNative.enableHDMI(flag);
        if (flag)
        {
            Log.i("hdmi", "reset audio state for IPO boot up");
            updateAudioState();
            return;
        } else
        {
            Log.i("hdmi", "shut down audio for IPO shut down");
            enableAudioImp(false);
            return;
        }
    }

    private boolean enableAudioImp(boolean flag)
    {
        Log.e("hdmi", (new StringBuilder()).append(" >> HDMILocalService.enableAudioImp(").append(flag).append(")").toString());
        if (mAudioManager == null)
            mAudioManager = (AudioManager)getSystemService("audio");
        if (mAudioManager != null)
        {
            String s = mAudioManager.getParameters("GetHDMIAudioStatus");
            if ((!flag || !"GetHDMIAudioStatus=true".equals(s)) && (flag || !"GetHDMIAudioStatus=false".equals(s)))
            {
                if (mAudioManager.enableHdmiAudio(flag))
                {
                    Log.i("hdmi", (new StringBuilder()).append(" >> HDMILocalService.enableAudio(").append(flag).append(") success").toString());
                    return true;
                } else
                {
                    Log.i("hdmi", (new StringBuilder()).append(" >> HDMILocalService.enableAudio(").append(flag).append(") fail, current state=").append(s).toString());
                    return false;
                }
            } else
            {
                Log.i("hdmi", (new StringBuilder()).append(" >> HDMILocalService.  audio driver status is already what we need [").append(s).append("]").toString());
                return true;
            }
        } else
        {
            Log.e("hdmi", ">>HDMILocalService.enableAudio(), fail to get AudioManager service");
            return false;
        }
    }

    private boolean enableHDMIImpl(boolean flag)
    {
        Log.e("hdmi", (new StringBuilder()).append(" >> HDMILocalService.enableHDMIImpl(), new state=").append(flag).toString());
        return mHdmiNative.enableHDMI(flag);
    }

    private boolean enableVideoImp(boolean flag)
    {
        Log.e("hdmi", (new StringBuilder()).append(">>HDMILocalService.enableVideoImp, new state=").append(flag).toString());
        return mHdmiNative.enableVideo(flag);
    }

    private void initColorSpaceAndDeepColor()
    {
        Log.i("hdmi", ">>HDMILocalService.initColorSpaceAndDeepColor(), init color space=RGB, init deep color=8bit");
        setDeepColor(0, 1);
    }

    private void initHDMITargetState()
    {
        int i = android.provider.Settings.System.getInt(getContentResolver(), "hdmi_enable_status", 1);
        int j = android.provider.Settings.System.getInt(getContentResolver(), "hdmi_audio_status", 1);
        int k = android.provider.Settings.System.getInt(getContentResolver(), "hdmi_video_status", 0);
        Log.i("hdmi", (new StringBuilder()).append(" >> HDMILocalService.initHDMITargetState(), initHDMIState=").append(i).append(", initHDMIAudioState=").append(j).append(", initHDMIVideoState=").append(k).toString());
        boolean flag;
        if (i == 1)
            flag = true;
        else
            flag = false;
        sHMDITargetState = flag;
        boolean flag1;
        if (j == 1)
            flag1 = true;
        else
            flag1 = false;
        sHMDIAudioTargetState = flag1;
        boolean flag2;
        if (k == 1)
            flag2 = true;
        else
            flag2 = false;
        sHMDIVideoTargetState = flag2;
        if (sHMDITargetState)
        {
            Log.i("hdmi", " >> HDMILocalService. enable HDMI after boot up complete");
            enableHDMI(true);
            return;
        } else
        {
            Log.i("hdmi", " >> HDMILocalService. disable HDMI after boot up complete");
            enableHDMI(false);
            return;
        }
    }

    private void initVideoResolution()
    {
        String s = android.provider.Settings.System.getString(getContentResolver(), "hdmi_video_resolution");
        Log.i("hdmi", (new StringBuilder()).append(">>HDMILocalService.initVideoResolution(), init resolution=").append(s).toString());
        if (s == null || "".equals(s))
        {
            Log.e("hdmi", ">>No init resolution, set it to Auto by default");
            s = "3";
        }
        setVideoResolution(Integer.parseInt(s));
    }

    private void initVideoResolution8193()
    {
        String s = android.provider.Settings.System.getString(getContentResolver(), "hdmi_video_resolution");
        Log.i("hdmi", (new StringBuilder()).append(">>HDMILocalService.initVideoResolution8193(), init resolution=").append(s).toString());
        boolean flag;
        if (sEdidPrev == null)
            flag = false;
        else
        if (Arrays.equals(sEdid, sEdidPrev))
            flag = false;
        else
            flag = true;
        if (s == null || "".equals(s) || flag)
        {
            Log.e("hdmi", ">>No init resolution or EDID changed, set it by default");
            if (sEdid != null)
            {
                if (1 == (1 & sEdid[0] >> 1))
                    s = "2";
                else
                if (1 == (1 & sEdid[1] >> 11))
                    s = "3";
                else
                if (1 == (1 & sEdid[0]))
                    s = "100";
                else
                if (1 == (1 & sEdid[1] >> 10))
                    s = "101";
                else
                    s = "100";
            } else
            {
                s = "100";
            }
        }
        Log.i("hdmi", (new StringBuilder()).append(">>Final resolution in init resolution is: ").append(s).toString());
        setVideoResolution(Integer.parseInt(s));
    }

    private void showNotification(boolean flag)
    {
        NotificationManager notificationmanager = (NotificationManager)getSystemService("notification");
        if (notificationmanager == null)
        {
            Log.e("hdmi", "Fail to get NotificationManager instance");
            return;
        }
        if (flag)
        {
            Log.i("hdmi", "HDMI cable is pluged in, give notification now");
            Notification notification = new Notification();
            String s = getResources().getString(0x7f0b00bf);
            String s1 = getResources().getString(0x7f0b00c0);
            notification.icon = 0x7f020062;
            notification.tickerText = s;
            notification.flags = 35;
            notification.setLatestEventInfo(this, s, s1, PendingIntent.getActivity(this, 0, Intent.makeRestartActivityTask(new ComponentName("com.android.settings", "com.android.settings.HDMISettings")), 0));
            notificationmanager.notify(0x7f020062, notification);
            return;
        } else
        {
            Log.i("hdmi", "HDMI cable is pluged out, clear notification now");
            notificationmanager.cancel(0x7f020062);
            return;
        }
    }

    private boolean updateAudioState()
    {
        Log.i("hdmi", (new StringBuilder()).append(" >> HDMILocalService.updateAudioState(), HDMI target state=").append(sHMDITargetState).append("\n sIsCablePluged=").append(sIsCablePluged).append("\n audioTargetState=").append(sHMDIAudioTargetState).append("\n sIsCallStateIdle=").append(sIsCallStateIdle).append("\n sWiredHeadSetPlugState=").append(sWiredHeadSetPlugState).toString());
        if (sHMDITargetState && sIsCablePluged)
        {
            if (sHMDIAudioTargetState && sIsCallStateIdle && sWiredHeadSetPlugState != 1)
                return enableAudioImp(true);
            else
                return enableAudioImp(false);
        } else
        {
            return false;
        }
    }

    private void updateEDID(boolean flag)
    {
        if (flag)
        {
            sEdid = getEDID();
            if (sEdid != null)
            {
                for (int j = 0; j < sEdid.length; j++)
                    Log.i("hdmi", (new StringBuilder()).append("sEdid[").append(j).append("] = ").append(sEdid[j]).toString());

                sendBroadcast(new Intent("com.mediatek.hdmi.localservice.action.EDID_UPDATED"));
            } else
            {
                Log.i("hdmi", "sEdid is still null!");
            }
            if (sEdidPrev != null)
            {
                for (int i = 0; i < sEdidPrev.length; i++)
                    Log.i("hdmi", (new StringBuilder()).append("sEdidPrev[").append(i).append("] = ").append(sEdidPrev[i]).toString());

            } else
            {
                Log.i("hdmi", "sEdidPrev is null!");
            }
            return;
        } else
        {
            sEdidPrev = sEdid;
            sEdid = null;
            return;
        }
    }

    public boolean enableAudio(boolean flag)
    {
        Log.i("hdmi", (new StringBuilder()).append(">>HDMILocalService.enableAudio(), new state=").append(flag).toString());
        sHMDIAudioTargetState = flag;
        return updateAudioState();
    }

    public boolean enableCEC(boolean flag)
    {
        Log.e("hdmi", (new StringBuilder()).append(">>HDMILocalService.enableCEC, new state=").append(flag).toString());
        return mHdmiNative.enableCEC(flag);
    }

    public boolean enableHDMI(boolean flag)
    {
        Log.i("hdmi", (new StringBuilder()).append(" >> HDMILocalService.enableHDMI(), new state=").append(flag).toString());
        sHMDITargetState = flag;
        return enableHDMIImpl(flag);
    }

    public boolean enableVideo(boolean flag)
    {
        Log.i("hdmi", (new StringBuilder()).append(">>HDMILocalService.enableVideo(), new state=").append(flag).toString());
        sHMDIVideoTargetState = flag;
        return enableVideoImp(flag);
    }

    public boolean getAudioEnabledStatus()
    {
        Log.i("hdmi", ">>HDMILocalService.getAudioEnabledStatus");
        if (mAudioManager == null)
            mAudioManager = (AudioManager)getSystemService("audio");
        if (mAudioManager != null && "GetHDMIAudioStatus=true".equals(mAudioManager.getParameters("GetHDMIAudioStatus")))
        {
            Log.i("hdmi", "HDMI audeo is enabled");
            return true;
        } else
        {
            Log.i("hdmi", "HDMI audio is disabled");
            return false;
        }
    }

    public char[] getCECAddr()
    {
        Log.i("hdmi", ">>HDMILocalService.getCECAddr");
        return mHdmiNative.getCECAddr();
    }

    public int[] getCECCmd()
    {
        Log.i("hdmi", ">>HDMILocalService.getCECCmd");
        return mHdmiNative.getCECCmd();
    }

    public int[] getEDID()
    {
        Log.i("hdmi", ">>HDMILocalService.getEDID");
        return mHdmiNative.getEDID();
    }

    public boolean isCablePluged()
    {
        Log.d("hdmi", (new StringBuilder()).append(" >> HDMILocalService.isCablePluged?").append(sIsCablePluged).toString());
        return sIsCablePluged;
    }

    public IBinder onBind(Intent intent)
    {
        Log.i("hdmi", ">>HDMILocalService.onBind()");
        return mBinder;
    }

    public void onCreate()
    {
        Log.i("hdmi", ">>HDMILocalService.onCreate()");
        mHdmiNative = (IHDMINative)MediatekClassFactory.createInstance(com/mediatek/common/hdmi/IHDMINative, new Object[0]);
        if (mHdmiNative == null)
            Log.e("hdmi", "Native is not created");
        if (mReceiver == null)
            mReceiver = new HDMIServiceReceiver();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.HDMI_PLUG");
        intentfilter.addAction("android.intent.action.HEADSET_PLUG");
        intentfilter.addAction("android.intent.action.ACTION_BOOT_IPO");
        intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
        registerReceiver(mReceiver, intentfilter);
        if (mTelephonyManager == null)
            mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManager.listen(mPhoneStateListener, 32);
        if (sWakeLock == null)
            sWakeLock = ((PowerManager)getSystemService("power")).newWakeLock(6, "HDMILocalService");
        initHDMITargetState();
        super.onCreate();
    }

    public void onDestroy()
    {
        sIsRunning = false;
        if (mHdmiNative.ishdmiForceAwake() && sWakeLock != null && sWakeLock.isHeld())
            sWakeLock.release();
        unregisterReceiver(mReceiver);
        mTelephonyManager.listen(mPhoneStateListener, 0);
        Log.i("hdmi", ">>HDMILocalService.onDestroy()");
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        Log.i("hdmi", (new StringBuilder()).append(">>HDMILocalService.onStartCommand(), startId=").append(j).append(": intent=").append(intent).toString());
        sIsRunning = true;
        if (intent != null)
        {
            String s = intent.getStringExtra("bootup_action");
            if (s != null && s.equals("android.intent.action.ACTION_BOOT_IPO"))
            {
                Log.i("hdmi", "IPO boot up complete, try to resume HDMI driver status");
                dealWithIPO(true);
            }
        }
        return 0;
    }

    public void setCECAddr(byte byte0, byte abyte0[], char c, char c1)
    {
        Log.e("hdmi", ">>HDMILocalService.setCECAddr");
        mHdmiNative.setCECAddr(byte0, abyte0, c, c1);
    }

    public void setCECCmd(byte byte0, byte byte1, char c, byte abyte0[], int i, byte byte2)
    {
        Log.e("hdmi", ">>HDMILocalService.setCECCmd");
        mHdmiNative.setCECCmd(byte0, byte1, c, abyte0, i, byte2);
    }

    public boolean setDeepColor(int i, int j)
    {
        Log.i("hdmi", (new StringBuilder()).append(">>HDMILocalService.setVideoResolution(), new deepColor=").append(j).append(" colorspace=").append(i).toString());
        return mHdmiNative.setDeepColor(i, j);
    }

    public boolean setHDCPKey()
    {
        byte abyte0[];
        NvRAMAgent nvramagent;
        abyte0 = null;
        Log.i("hdmi", ">>HDMILocalService.setHDCPKey()");
        nvramagent = NvRAMAgent.Stub.asInterface(ServiceManager.getService("NvRAMAgent"));
        if (nvramagent == null)
            break MISSING_BLOCK_LABEL_122;
        Log.i("hdmi", "Read HDCP key from nvram");
        abyte0 = nvramagent.readFile(42);
        int i = 0;
_L2:
        if (i >= 287)
            break; /* Loop/switch isn't completed */
        Log.i("hdmi", (new StringBuilder()).append("HDCP Key[").append(i).append("] = ").append(abyte0[i]).toString());
        i++;
        if (true) goto _L2; else goto _L1
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
_L1:
        if (abyte0 != null)
            return mHdmiNative.setHDCPKey(abyte0);
        else
            return false;
        Log.i("hdmi", "NvRAMAgent is null!");
        abyte0 = null;
          goto _L1
    }

    public boolean setVideoResolution(int i)
    {
        Log.i("hdmi", (new StringBuilder()).append(">>HDMILocalService.setVideoResolution(), new resolution=").append(i).toString());
        return mHdmiNative.setVideoConfig(i);
    }



/*
    static boolean access$002(boolean flag)
    {
        sIsCablePluged = flag;
        return flag;
    }

*/




/*
    static boolean access$302(boolean flag)
    {
        sIsCallStateIdle = flag;
        return flag;
    }

*/




/*
    static TelephonyManager access$502(HDMILocalService hdmilocalservice, TelephonyManager telephonymanager)
    {
        hdmilocalservice.mTelephonyManager = telephonymanager;
        return telephonymanager;
    }

*/
}
