// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;
import java.lang.ref.WeakReference;

// Referenced classes of package com.mediatek.bluetooth.avrcp:
//            BTAvrcpProfile, BTAvrcpBrowserAdapter, BTAvrcpMusicAdapter, BluetoothAvrcpReceiver

public class BluetoothAvrcpService extends Service
    implements Runnable
{
    static class ServiceStub extends IBTAvrcpService.Stub
    {

        WeakReference mService;

        public boolean connect(String s)
        {
            if (s.length() == 17)
            {
                ((BluetoothAvrcpService)mService.get()).connectNative(s);
                return true;
            } else
            {
                return false;
            }
        }

        public boolean connectBrowse()
        {
            ((BluetoothAvrcpService)mService.get()).connectBrowseNative();
            return true;
        }

        public boolean debugPTSAttributes(int i)
        {
            if (i == 170)
            {
                Log.e("EXT_AVRCP", "[BT][AVRCP] stop server self !");
                ((BluetoothAvrcpService)mService.get()).disable();
                ((BluetoothAvrcpService)mService.get()).stopSelf();
                return true;
            }
            if (mService.get() != null)
            {
                Log.e("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] debugPTSAttributes mode to ").append(i).toString());
                BluetoothAvrcpService _tmp = (BluetoothAvrcpService)mService.get();
                BluetoothAvrcpService.sPTSDebugMode = i;
                return true;
            } else
            {
                Log.v("EXT_AVRCP", "[BT][AVRCP] mService not exist ");
                return false;
            }
        }

        public boolean disconnect()
        {
            ((BluetoothAvrcpService)mService.get()).disconnectNative();
            return true;
        }

        public boolean disconnectBrowse()
        {
            ((BluetoothAvrcpService)mService.get()).disconnectBrowseNative();
            return true;
        }

        public byte getStatus()
        {
            return 0;
        }

        public boolean selectPlayerId(int i)
        {
            short word0 = (short)i;
            if (mService.get() != null)
            {
                if (word0 != 1 && word0 != 2)
                {
                    Log.e("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] Out of range player_id:").append(word0).toString());
                    return false;
                }
                ((BluetoothAvrcpService)mService.get()).mCurPlayerId = word0;
                Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] player_id:").append(word0).append(" availFalg:").append(((BluetoothAvrcpService)mService.get()).mTrackAvailableChangedFlag).append(" addresflag:").append(((BluetoothAvrcpService)mService.get()).mTrackAddressedPlayerChangedFlag).toString());
                if (((BluetoothAvrcpService)mService.get()).mTrackAvailableChangedFlag)
                {
                    ((BluetoothAvrcpService)mService.get()).mTrackAvailableChangedFlag = false;
                    ((BluetoothAvrcpService)mService.get()).notificationAvailPlayersChangedNative((byte)0, (byte)0);
                }
                if (((BluetoothAvrcpService)mService.get()).mTrackAddressedPlayerChangedFlag)
                {
                    ((BluetoothAvrcpService)mService.get()).mTrackAddressedPlayerChangedFlag = false;
                    ((BluetoothAvrcpService)mService.get()).notificationAddressedPlayerChangedNative((byte)0, (byte)0, word0, (short)0);
                }
                return false;
            } else
            {
                Log.v("EXT_AVRCP", "[BT][AVRCP] mService not exist ");
                return false;
            }
        }

        public boolean setDebugElementAttribute()
        {
            int ai[] = {
                1, 5, 2
            };
            ((BluetoothAvrcpService)mService.get()).connectInd(new byte[0], "Test", 0);
            ((BluetoothAvrcpService)mService.get()).setBrowsedplayerInd((short)1);
            ((BluetoothAvrcpService)mService.get()).getItemAttributesInd((byte)0, 1L, (short)0, (byte)3, ai);
            ((BluetoothAvrcpService)mService.get()).getItemAttributesInd((byte)1, 1L, (short)0, (byte)3, ai);
            ((BluetoothAvrcpService)mService.get()).getItemAttributesInd((byte)2, 1L, (short)0, (byte)3, ai);
            ((BluetoothAvrcpService)mService.get()).getItemAttributesInd((byte)3, 1L, (short)0, (byte)3, ai);
            ((BluetoothAvrcpService)mService.get()).getItemAttributesInd((byte)4, 1L, (short)0, (byte)3, ai);
            Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] uid1 ").append(0x7fffffffffffffffL).toString());
            ((BluetoothAvrcpService)mService.get()).changePathInd(0, (byte)1, 0x7fffffffffffffffL);
            Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] uid2 ").append(0x8000000000000000L).toString());
            ((BluetoothAvrcpService)mService.get()).changePathInd(0, (byte)1, 0x8000000000000000L);
            debugPTSAttributes(3);
            return true;
        }

        ServiceStub(BluetoothAvrcpService bluetoothavrcpservice)
        {
            mService = new WeakReference(bluetoothavrcpservice);
        }
    }


    private static final byte FAIL = 1;
    public static final int FILENAME_ATTR_ID = 1;
    private static final byte OK = 0;
    public static final byte STATUS_OK = 4;
    public static final String TAG = "EXT_AVRCP";
    public static final short UTF8_ARRAY[] = {
        106, 106, 106, 106, 106, 106, 106
    };
    private static final short UTF8_CHARSET = 106;
    private static final String UT_TAG = "[BT][AVRCP_UT][BluetoothAvrcpService]";
    public static boolean sDebugMsg = false;
    public static int sPTSDebugMode = 0;
    public static boolean sSupportBrowse = false;
    public static boolean sSupportMusicUI = false;
    public static boolean sUtState = false;
    BTAvrcpMusicAdapter mAdapter;
    private final IBinder mBinder = new ServiceStub(this);
    BTAvrcpBrowserAdapter mBrowserAdapter;
    private Context mContext;
    private short mCurBrowserId;
    private short mCurPlayerId;
    private int mNativeObject;
    private int mStartId;
    private boolean mStopped;
    private Thread mThread;
    private boolean mTrackAddressedPlayerChangedFlag;
    private boolean mTrackAvailableChangedFlag;
    private byte mVersion;

    public BluetoothAvrcpService()
    {
        mStopped = false;
        mCurPlayerId = 1;
        mCurBrowserId = 0;
        mTrackAvailableChangedFlag = false;
        mTrackAddressedPlayerChangedFlag = false;
        mStartId = -1;
        mVersion = 10;
        Log.v("EXT_AVRCP", "[BT][AVRCP] BluetoothAvrcpService Constructor enable");
        mVersion = BTAvrcpProfile.getPreferVersion();
        Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getPreferVersion:").append(Integer.toString(mVersion)).toString());
        if (mVersion >= 14)
            sSupportBrowse = true;
        if (mVersion >= 13)
            sSupportMusicUI = true;
        mBrowserAdapter = new BTAvrcpBrowserAdapter(this);
        if (!sUtState)
        {
            Log.d("[BT][AVRCP_UT][BluetoothAvrcpService]", "[API: service constructor] load library : extavrcp_jni");
            System.loadLibrary("extavrcp_jni");
        } else
        {
            Log.d("[BT][AVRCP_UT][BluetoothAvrcpService]", "[API: service constructor] load library : extavrcp_ut");
            System.loadLibrary("extavrcp_ut");
        }
        classInitNative();
    }

    private static native boolean classInitNative();

    private native void cleanupNativeObjectNative();

    private native void disableNative();

    private native boolean enableNative();

    public static native int getMaxPlayerNumNative();

    private native void initializeNativeObjectNative();

    public static boolean isSupportBrowse()
    {
        return sSupportBrowse;
    }

    private native boolean listenerNativeEventLoop(boolean flag);

    private void notifyProfileState(int i)
    {
        Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] notifyProfileState: ").append(i).toString());
        Intent intent = new Intent("android.bluetooth.profilemanager.action.PROFILE_CHANGED");
        intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_AVRCP);
        intent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", i);
    }

    private void parseIntent(Intent intent)
    {
        String s = intent.getStringExtra("action");
        Log.v("EXT_AVRCP", (new StringBuilder()).append("action: ").append(s).toString());
        int i = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000);
        if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(s))
        {
            if (i == 12)
            {
                if (mAdapter == null)
                {
                    mAdapter = new BTAvrcpMusicAdapter(this, this);
                    mAdapter.init();
                }
                if (mAdapter != null)
                    enable();
            } else
            if (i == 10)
            {
                disable();
                stopSelf(mStartId);
                return;
            } else
            {
                Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] parseIntent state ").append(i).toString());
                return;
            }
        } else
        {
            Log.v("EXT_AVRCP", "[BT][AVRCP] intent without action");
            if (mAdapter == null)
            {
                mAdapter = new BTAvrcpMusicAdapter(this, this);
                mAdapter.init();
            }
            if (mAdapter != null)
            {
                enable();
                return;
            }
        }
    }

    private void testBrowser()
    {
        mBrowserAdapter.search("es");
    }

    private native void wakeupListenerNative();

    public void abortContinueInd()
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] abortContinueInd");
        if (mAdapter != null)
            mAdapter.abortContinueInd();
    }

    public void activateCnf(byte byte0, int i)
    {
        Object aobj[] = new Object[2];
        aobj[0] = Byte.valueOf(byte0);
        aobj[1] = Integer.valueOf(i);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] activate_cnf index:%d result:%d", aobj));
        if (4096 != i && i != 0)
        {
            notifyProfileState(14);
            return;
        } else
        {
            notifyProfileState(11);
            return;
        }
    }

    public native boolean activateConfigNative(byte byte0, byte byte1, byte byte2);

    public native boolean activateReqNative(byte byte0);

    public void addTonowplayingInd(byte byte0, long l, short word0)
    {
        Object aobj[] = new Object[3];
        aobj[0] = Byte.valueOf(byte0);
        aobj[1] = Long.valueOf(l);
        aobj[2] = Short.valueOf(word0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] addTonowplayingInd scope:%d  uid:%d uid_counter:%d", aobj));
        if (word0 == mBrowserAdapter.getUidCounter())
        {
            if (byte0 == 1 && !mBrowserAdapter.checkSongIdExisted(l))
            {
                Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] addTonowplayingInd Warning try to add a not exist id:").append(l).toString());
                addTonowplayingRspNative((byte)9, (byte)9);
                return;
            }
            if (mAdapter.addToNowPlaying(l))
            {
                addTonowplayingRspNative((byte)0, (byte)4);
                return;
            } else
            {
                addTonowplayingRspNative((byte)14, (byte)14);
                return;
            }
        } else
        {
            Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] addTonowplayingInd Warning try to add a not exist id:").append(l).toString());
            addTonowplayingRspNative((byte)1, (byte)1);
            return;
        }
    }

    public native boolean addTonowplayingRspNative(byte byte0, byte byte1);

    public void changePathInd(int i, byte byte0, long l)
    {
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Byte.valueOf(byte0);
        aobj[2] = Long.valueOf(l);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] changePathInd uid_counter:%d dir:%d uid:%d", aobj));
        if (mBrowserAdapter.changePath((short)i, byte0, l))
        {
            Log.v("EXT_AVRCP", "Wait for broserAdapter to call changePathRspNavtive");
            return;
        } else
        {
            changePathRspNative((byte)12, (byte)0, 0);
            return;
        }
    }

    public native boolean changePathRspNative(byte byte0, byte byte1, int i);

    public native boolean connectBrowseNative();

    public void connectCnf(int i)
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] connect_cnf result:%d");
        mAdapter.onConnect();
    }

    public void connectInd(byte abyte0[], String s, int i)
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] connect_ind");
        mAdapter.onConnect();
        if (mBrowserAdapter != null)
            mBrowserAdapter.onConnect();
        mTrackAvailableChangedFlag = false;
        mTrackAddressedPlayerChangedFlag = false;
        mCurPlayerId = 1;
    }

    public native boolean connectNative(String s);

    public native boolean connectReqNative(String s);

    public void deactivateCnf(byte byte0, int i)
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] deactivate_cnf index:%d result:%d");
        if (4096 != i && i != 0)
        {
            notifyProfileState(14);
            return;
        } else
        {
            notifyProfileState(13);
            return;
        }
    }

    public native boolean deactivateReqNative(byte byte0);

    public void disable()
    {
        Log.i("EXT_AVRCP", "[BT][AVRCP] +disable");
        Log.v("EXT_AVRCP", "[BT][AVRCP] AVRCP disable start");
        deactivateReqNative((byte)0);
        if (mThread != null)
        {
            shutdownIndThread();
            try
            {
                mThread.join(10000L);
            }
            catch (InterruptedException interruptedexception)
            {
                Log.w("EXT_AVRCP", "[BT][AVRCP] Excpetion ".concat(interruptedexception.toString()));
            }
            mThread = null;
        }
        Log.v("EXT_AVRCP", "[BT][AVRCP] Invoke AVRCP cleanupNativeObjectNative");
        disableNative();
        Log.i("EXT_AVRCP", "[BT][AVRCP] -disable");
    }

    public native boolean disconnectBrowseNative();

    public void disconnectInd()
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] disconnect_ind");
        mAdapter.onDisconnect();
        if (mBrowserAdapter != null)
            mBrowserAdapter.onDisconnect();
        sPTSDebugMode = 0;
    }

    public native boolean disconnectNative();

    public native boolean disconnectReqNative();

    public boolean enable()
    {
        Log.i("EXT_AVRCP", "[BT][AVRCP] enable - ignore test");
        if (mThread == null)
        {
            if (!enableNative())
            {
                Log.e("EXT_AVRCP", "[BT][AVRCP] Could not init BluetoothDunService");
                notifyProfileState(14);
                return false;
            }
            mVersion = BTAvrcpProfile.getPreferVersion();
            byte byte0 = mAdapter.getSupportVersion();
            Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] mVersion:").append(Integer.toString(mVersion)).append(" music:").append(Integer.toString(byte0)).toString());
            if (mVersion > byte0)
                mVersion = byte0;
            switch (mVersion)
            {
            case 13: // '\r'
                sSupportMusicUI = true;
                sSupportBrowse = false;
                Log.v("EXT_AVRCP", "[BT][AVRCP] Support AVRCP1.3");
                break;

            case 14: // '\016'
                sSupportMusicUI = true;
                sSupportBrowse = true;
                Log.v("EXT_AVRCP", "[BT][AVRCP] Support AVRCP1.4");
                break;

            default:
                sSupportMusicUI = false;
                sSupportBrowse = false;
                Log.v("EXT_AVRCP", "[BT][AVRCP] Support AVRCP1.0");
                mVersion = 10;
                break;
            }
            activateConfigNative(mVersion, (byte)1, (byte)0);
            activateReqNative((byte)0);
            mThread = new Thread(this);
            mThread.setName("BluetoothAvrcpServiceThread");
            mThread.start();
        } else
        {
            Log.i("EXT_AVRCP", "enable - ignore");
        }
        notifyProfileState(10);
        return true;
    }

    public native boolean getCapabilitiesRspNative(byte byte0, byte byte1, byte abyte0[]);

    public void getCurPlayerAppValueInd(byte byte0, byte abyte0[])
    {
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getCurPlayerAppValueInd count:%d", aobj));
        if (byte0 == 0)
        {
            byte0 = 4;
            Object aobj2[] = new Object[1];
            aobj2[0] = Byte.valueOf(byte0);
            Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getCurPlayerAppValueInd Change to All count:%d", aobj2));
            abyte0 = new byte[4];
            for (byte byte3 = 0; byte3 < 4; byte3++)
                abyte0[byte3] = (byte)(byte3 + 1);

        }
        byte abyte1[] = new byte[byte0];
        byte abyte2[] = new byte[byte0];
        byte byte1 = 0;
        for (byte byte2 = 0; byte2 < byte0; byte2++)
        {
            int i;
            if (abyte0 != null && abyte0.length >= byte2)
                i = abyte0[byte2];
            else
                i = byte2;
            abyte1[byte1] = i;
            abyte2[byte1] = mAdapter.getCurPlayerAppValue(i);
            if (abyte2[byte1] != 0)
            {
                byte1++;
            } else
            {
                Object aobj1[] = new Object[2];
                aobj1[0] = Byte.valueOf(i);
                aobj1[1] = Byte.valueOf(abyte2[byte1]);
                Log.w("EXT_AVRCP", String.format("[BT][AVRCP] getCurPlayerAppValueInd attr_id:%d ret:%d", aobj1));
            }
        }

        if (byte1 != 0)
        {
            getCurplayerappValueRspNative((byte)0, byte1, abyte1, abyte2);
            return;
        } else
        {
            getCurplayerappValueRspNative((byte)1, byte1, abyte1, abyte2);
            return;
        }
    }

    public native boolean getCurplayerappValueRspNative(byte byte0, byte byte1, byte abyte0[], byte abyte1[]);

    public void getElementAttributesInd(long l, byte byte0, int ai[])
    {
        StringBuffer stringbuffer = new StringBuffer();
        int[] _tmp = ai;
        Object aobj[] = new Object[2];
        aobj[0] = Long.valueOf(l);
        aobj[1] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getElementAttributesInd id:%d count:%d ", aobj));
        for (int i = 0; i < byte0; i++)
        {
            Object aobj6[] = new Object[2];
            aobj6[0] = Integer.valueOf(i);
            aobj6[1] = Integer.valueOf(ai[i]);
            stringbuffer.append(String.format(" [%d]:%x", aobj6));
        }

        Log.v("EXT_AVRCP", stringbuffer.toString());
        if (byte0 == 0 || ai == null)
        {
            byte0 = 3;
            ai = new int[3];
            for (byte byte1 = 0; byte1 < byte0; byte1++)
                ai[byte1] = byte1 + 1;

            Object aobj1[] = new Object[1];
            aobj1[0] = Byte.valueOf(byte0);
            Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getElementAttributesInd Create all attrs count:%d ", aobj1));
            int[] _tmp1 = ai;
        }
        int j = sPTSDebugMode;
        int ai1[];
        if (byte0 == 0)
        {
            byte0 = 3;
            ai1 = new int[byte0];
            for (byte byte6 = 0; byte6 < byte0; byte6++)
                ai1[byte6] = byte6 + 1;

        } else
        {
            ai1 = new int[ai.length];
            for (byte byte2 = 0; byte2 < byte0; byte2++)
                ai1[byte2] = ai[byte2];

        }
        if (ai1 != null)
        {
            Object aobj5[] = new Object[2];
            aobj5[0] = Integer.valueOf(ai1.length);
            aobj5[1] = Integer.valueOf(sPTSDebugMode);
            Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getElementAttributesInd pts_attirbute_ids.length:%d mPTSDebugMode:%d", aobj5));
        }
        for (byte byte3 = 0; byte3 < byte0; byte3++)
        {
            String s;
            if (0L == l)
                s = mAdapter.getElementAttribute(l, ai1[byte3]);
            else
                s = mBrowserAdapter.getItemAttribute((byte)1, l, (short)0, ai1[byte3]);
            if (j != 0)
            {
                StringBuffer stringbuffer1 = new StringBuffer();
                Log.e("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] PTS test mode !!! generate a 512 byte data cur mode:").append(sPTSDebugMode).toString());
                stringbuffer1.append("[BT][AVRCP] PTS debug mode Start:");
                for (int k = 0; k < 512; k++)
                {
                    Object aobj4[] = new Object[2];
                    aobj4[0] = Integer.valueOf(k);
                    aobj4[1] = Integer.valueOf(k);
                    stringbuffer1.append(String.format("[%d]=%d", aobj4));
                }

                s = stringbuffer1.toString();
            }
            if (s == null)
            {
                Object aobj3[] = new Object[3];
                aobj3[0] = Long.valueOf(l);
                aobj3[1] = Byte.valueOf(byte3);
                aobj3[2] = Integer.valueOf(ai[byte3]);
                Log.v("EXT_AVRCP", String.format("[BT][AVRCP] Fail to getElementAttributes from adapter id:%d i:%d attr_id:%d. Use empty data", aobj3));
                s = "";
            }
            if (j != 0)
            {
                Object aobj2[] = new Object[2];
                aobj2[0] = Byte.valueOf(byte3);
                aobj2[1] = Byte.valueOf(byte0);
                Log.v("EXT_AVRCP", String.format("[BT][AVRCP] PTS %d %d", aobj2));
                byte byte5 = (byte)ai1[byte3];
                getElementAttributesRspNative((byte)0, byte3, byte0, byte5, (short)106, s);
            } else
            {
                byte byte4 = (byte)ai[byte3];
                getElementAttributesRspNative((byte)0, byte3, byte0, byte4, (short)106, s);
            }
        }

    }

    public native boolean getElementAttributesRspNative(byte byte0, byte byte1, byte byte2, byte byte3, short word0, String s);

    public native boolean getFileSystemItemEndRspNative(byte byte0, byte byte1, short word0);

    public native boolean getFileSystemItemFileAttrRspNative(byte byte0, byte byte1, byte byte2, int i, short word0, short word1, String s);

    public native boolean getFileSystemItemFileRspNative(byte byte0, byte byte1, byte byte2, long l, byte byte3, short word0, 
            short word1, String s);

    public native boolean getFileSystemItemFolderRspNative(byte byte0, byte byte1, byte byte2, long l, byte byte3, byte byte4, 
            short word0, short word1, String s);

    public native boolean getFileSystemItemStartRspNative();

    public void getFileSystemitemsList(int i, int j, byte byte0, int ai[])
    {
        if (i > j)
        {
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(i);
            aobj[1] = Integer.valueOf(j);
            Log.w("EXT_AVRCP", String.format("[BT][AVRCP] getFileSystemitemsList Wrong range start:%d end:%d", aobj));
            getFileSystemItemEndRspNative((byte)11, (byte)11, (short)0);
            return;
        }
        if (mBrowserAdapter != null)
        {
            mBrowserAdapter.getFileSystemitemsList(i, j, byte0, ai);
            return;
        } else
        {
            getFileSystemItemEndRspNative((byte)3, (byte)1, (short)0);
            return;
        }
    }

    public void getItemAttributesInd(byte byte0, long l, short word0, byte byte1, int ai[])
    {
        int i = 0;
        Object aobj[] = new Object[3];
        aobj[0] = Byte.valueOf(byte0);
        aobj[1] = Long.valueOf(l);
        aobj[2] = Short.valueOf(word0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getItemAttributesInd scope:%d id:%d uid_counter:%d", aobj));
        byte byte2 = 0;
        do
        {
            boolean flag;
            if (byte2 < byte1)
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (byte1 != 255)
                flag1 = true;
            else
                flag1 = false;
            if (!(flag1 & flag))
                break;
            Log.v("EXT_AVRCP", (new StringBuilder()).append(" i:").append(byte2).append(" ").append(ai[byte2]).toString());
            byte2++;
        } while (true);
        if (byte1 == 0)
        {
            byte1 = 3;
            ai = new int[3];
            ai[0] = 1;
            ai[1] = 2;
            ai[2] = 3;
        }
        if (l == 0L)
        {
            String as1[] = new String[byte1];
            int ai2[] = new int[byte1];
            for (byte byte5 = 0; byte5 < byte1; byte5++)
            {
                String s1 = mAdapter.getElementAttribute(l, ai[byte5]);
                if (s1 != null)
                {
                    ai2[i] = ai[byte5];
                    as1[i] = s1;
                    i++;
                }
            }

            Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getItemAttributesInd 0(playing) num:").append(i).toString());
            for (byte byte6 = 0; byte6 < i; byte6++)
            {
                StringBuilder stringbuilder1 = new StringBuilder();
                Object aobj2[] = new Object[2];
                aobj2[0] = Integer.valueOf(ai2[byte6]);
                aobj2[1] = Short.valueOf(UTF8_ARRAY[byte6]);
                Log.v("EXT_AVRCP", stringbuilder1.append(String.format("[BT][AVRCP] getItemAttributesInd id:%d array:%d ", aobj2)).append(" s:").append(as1[byte6]).toString());
            }

            getItemattributesRspNative((byte)0, (byte)4, (byte)i, ai2, UTF8_ARRAY, as1);
            return;
        }
        if (byte0 <= 3)
        {
            String as[] = new String[byte1];
            int ai1[] = new int[byte1];
            if (mBrowserAdapter.isItemExist(byte0, l, word0))
            {
                int j = 0;
                for (byte byte3 = 0; byte3 < byte1; byte3++)
                {
                    String s = mBrowserAdapter.getItemAttribute(byte0, l, word0, ai[byte3]);
                    if (s != null)
                    {
                        ai1[j] = ai[byte3];
                        as[j] = s;
                        j++;
                    }
                }

                Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getItemAttributesInd num:").append(j).toString());
                for (byte byte4 = 0; byte4 < j; byte4++)
                {
                    StringBuilder stringbuilder = new StringBuilder();
                    Object aobj1[] = new Object[2];
                    aobj1[0] = Integer.valueOf(ai1[byte4]);
                    aobj1[1] = Short.valueOf(UTF8_ARRAY[byte4]);
                    Log.v("EXT_AVRCP", stringbuilder.append(String.format("[BT][AVRCP] getItemAttributesInd id:%d array:%d ", aobj1)).append(" s:").append(as[byte4]).toString());
                }

                getItemattributesRspNative((byte)0, (byte)4, (byte)j, ai1, UTF8_ARRAY, as);
                return;
            } else
            {
                getItemattributesRspNative((byte)1, (byte)9, (byte)0, new int[0], new short[0], new String[0]);
                Log.v("EXT_AVRCP", "[BT][AVRCP] getItemAttributesInd Item not exist");
                return;
            }
        } else
        {
            getItemattributesRspNative((byte)1, (byte)10, (byte)0, new int[0], new short[0], new String[0]);
            return;
        }
    }

    public native boolean getItemattributesRspNative(byte byte0, byte byte1, byte byte2, int ai[], short aword0[], String as[]);

    public void getMediaPlayerList(int i, int j)
    {
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(j);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getMediaPlayerList start:%d end:%d  [test:1]", aobj));
        byte abyte0[] = {
            0, 0, 0, 0, 0, -121, 1, 56, -5, -16, 
            0, 112, 0, 0, 0, 0
        };
        byte byte0 = mAdapter.getPlayerstatus();
        if (i > 1)
        {
            getMediaPlayerListRspNative((byte)22, (byte)0, (byte)1, byte0, (short)0, (short)1, (byte)0, (byte)0, abyte0, new String("Error"));
            return;
        }
        if (i >= 0 && j >= 1)
        {
            if (j - i > 1)
            {
                getMediaPlayerListRspNative((byte)0, (byte)0, (byte)1, byte0, (short)0, (short)1, (byte)0, (byte)0, abyte0, new String("Player1"));
                return;
            } else
            {
                getMediaPlayerListRspNative((byte)0, (byte)0, (byte)1, byte0, (short)0, (short)1, (byte)0, (byte)0, abyte0, new String("Player0"));
                return;
            }
        } else
        {
            String s = new String("Error");
            getMediaPlayerListRspNative((byte)22, (byte)0, (byte)1, (byte)0, (short)0, (short)1, (byte)0, (byte)0, abyte0, s);
            return;
        }
    }

    public native boolean getMediaPlayerListRspNative(byte byte0, byte byte1, byte byte2, byte byte3, short word0, short word1, byte byte4, 
            byte byte5, byte abyte0[], String s);

    public boolean getNowPlayingItemFileAttrRspNative(byte byte0, byte byte1, byte byte2, int i, short word0, short word1, String s)
    {
        return getFileSystemItemFileAttrRspNative(byte0, byte1, byte2, i, word0, word1, s);
    }

    public boolean getNowPlayingItemFileRspNative(byte byte0, byte byte1, byte byte2, long l, byte byte3, short word0, 
            short word1, String s)
    {
        if (byte3 != 0 && byte3 != 1)
        {
            Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] wrong mediatype:").append(byte3).toString());
            byte3 = 0;
        }
        return getFileSystemItemFileRspNative(byte0, byte1, byte2, l, byte3, word0, word1, s);
    }

    public boolean getNowPlayingItemRspNative(byte byte0, byte byte1, short word0)
    {
        return getFileSystemItemEndRspNative(byte0, byte1, word0);
    }

    public boolean getNowPlayingItemStartRspNative()
    {
        return getFileSystemItemStartRspNative();
    }

    public void getNowPlayingitemsList(int i, int j, byte byte0, int ai[])
    {
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(j);
        aobj[2] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getNowPlayingitemsList start:%d end:%d count:%d", aobj));
        for (int k = 0; k < byte0; k++)
            Log.v("EXT_AVRCP", (new StringBuilder()).append(" i:").append(k).append(" ").append(ai[k]).toString());

        long al[] = mAdapter.getNowPlaying();
        if (al != null && i <= j)
        {
            getNowPlayingItemStartRspNative();
            if (i > al.length)
            {
                Object aobj1[] = new Object[2];
                aobj1[0] = Integer.valueOf(i);
                aobj1[1] = Integer.valueOf(al.length);
                Log.w("EXT_AVRCP", String.format("[BT][AVRCP] getNowPlayingitemsList start:%d playlist:%d", aobj1));
                getNowPlayingItemRspNative((byte)1, (byte)11, (short)0);
                return;
            }
            if (al.length == 0)
            {
                getNowPlayingItemRspNative((byte)1, (byte)11, (short)0);
                return;
            }
            int l;
            if (1 + (j - i) > al.length - i)
                l = al.length - i;
            else
                l = 1 + (j - i);
            if (l == 0)
            {
                Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] No data to return. list.length").append(al.length).append(" start:").append(i).append(" end:").append(j).toString());
                getNowPlayingItemRspNative((byte)1, (byte)11, (short)0);
                return;
            }
            Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] list.length").append(al.length).append(" start:").append(i).append(" end:").append(j).toString());
            short word0 = mBrowserAdapter.getUidCounter();
            for (int i1 = i; i1 <= j; i1++)
            {
                int j1 = al.length;
                if (i1 >= j1)
                    break;
                int k1 = 0;
                int l1 = 0;
                do
                {
                    int i2 = ai.length;
                    if (l1 >= i2)
                        break;
                    String s1 = mBrowserAdapter.getItemAttribute((byte)3, al[i1], word0, ai[l1]);
                    if (s1 != null)
                    {
                        getNowPlayingItemFileAttrRspNative((byte)0, (byte)i1, (byte)k1, ai[l1], (short)106, (short)s1.length(), s1);
                        k1++;
                    }
                    l1++;
                } while (true);
                String s = mBrowserAdapter.getItemAttribute((byte)3, al[i1], word0, 1);
                if (s == null)
                {
                    Log.w("EXT_AVRCP", "[BT][AVRCP] Use 'ID:<id>' as filename");
                    s = (new StringBuilder()).append("ID:").append(i1).toString();
                }
                getNowPlayingItemFileRspNative((byte)0, (byte)i1, (byte)l, al[i1], (byte)0, (short)106, (short)s.length(), s);
            }

            getNowPlayingItemRspNative((byte)0, (byte)0, (short)0);
            return;
        } else
        {
            Log.w("EXT_AVRCP", String.format("[BT][AVRCP] getNowPlayingitemsList no playlist !", new Object[0]));
            getNowPlayingItemRspNative((byte)1, (byte)11, (short)0);
            return;
        }
    }

    public void getPlayerAppAttrTextInd(byte byte0, byte abyte0[])
    {
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getPlayerAppAttrTextInd count:%d", aobj));
        if (byte0 > abyte0.length)
            byte0 = (byte)abyte0.length;
        if (byte0 == 0)
        {
            byte byte5 = abyte0[0];
            getPlayerappAttributeTextRspNative((byte)1, (byte)0, byte0, byte5, 106, "empty");
        } else
        if (1 == byte0)
        {
            String s1 = mAdapter.getPlayerAppAttrText(abyte0[0]);
            if (s1 == null)
            {
                Object aobj1[] = new Object[1];
                aobj1[0] = Byte.valueOf(abyte0[0]);
                Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getPlayerAppAttrTextInd attr_id:%d  is null", aobj1));
                byte byte4 = abyte0[0];
                getPlayerappAttributeTextRspNative((byte)1, (byte)0, byte0, byte4, 106, "null");
            } else
            {
                byte byte3 = abyte0[0];
                getPlayerappAttributeTextRspNative((byte)0, (byte)0, byte0, byte3, 106, s1);
            }
        } else
        {
            for (byte byte1 = 0; byte1 < byte0; byte1++)
            {
                String s = mAdapter.getPlayerAppAttrText(abyte0[byte1]);
                if (s == null)
                    s = "";
                byte byte2 = abyte0[byte1];
                getPlayerappAttributeTextRspNative((byte)0, byte1, byte0, byte2, 106, s);
            }

        }
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getPlayerAppAttrTextInd done", new Object[0]));
    }

    public void getPlayerAppValueTextInd(byte byte0, byte byte1, byte abyte0[])
    {
        Object aobj[] = new Object[2];
        aobj[0] = Byte.valueOf(byte0);
        aobj[1] = Byte.valueOf(byte1);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getPlayerAppValueTextInd attrId:%d count:%d", aobj));
        byte byte2;
        for (byte2 = 0; byte2 < byte1; byte2++)
        {
            Object aobj1[] = new Object[3];
            aobj1[0] = Byte.valueOf(byte0);
            aobj1[1] = Byte.valueOf(byte2);
            aobj1[2] = Byte.valueOf(abyte0[byte2]);
            Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getPlayerAppValueTextInd attrId:%d i:%d count:%d", aobj1));
        }

        if (byte1 > abyte0.length)
            byte1 = (byte)abyte0.length;
        if (byte1 == 0)
        {
            byte byte7 = abyte0[byte2];
            getPlayerappValueTextRspNative((byte)1, byte2, byte1, byte0, byte7, "");
        } else
        if (1 == byte1)
        {
            String s1 = mAdapter.getPlayerAppValueText(byte0, abyte0[0]);
            if (s1 == null)
            {
                byte byte6 = abyte0[0];
                getPlayerappValueTextRspNative((byte)1, (byte)0, byte1, byte0, byte6, s1);
            } else
            {
                byte byte5 = abyte0[0];
                getPlayerappValueTextRspNative((byte)0, (byte)0, byte1, byte0, byte5, s1);
            }
        } else
        {
            for (byte byte3 = 0; byte3 < byte1; byte3++)
            {
                String s = mAdapter.getPlayerAppValueText(byte0, abyte0[byte3]);
                if (s == null)
                    s = "";
                byte byte4 = abyte0[byte3];
                getPlayerappValueTextRspNative((byte)0, byte3, byte1, byte0, byte4, s);
            }

        }
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getPlayerAppAttrTextInd done", new Object[0]));
    }

    public native int getPlayerIdNative();

    public native boolean getPlayerappAttributeTextRspNative(byte byte0, byte byte1, byte byte2, byte byte3, int i, String s);

    public native boolean getPlayerappValueTextRspNative(byte byte0, byte byte1, byte byte2, byte byte3, byte byte4, String s);

    public void getPlayerstatusInd()
    {
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] get_playerstatus_ind ", new Object[0]));
        byte byte0 = mAdapter.getPlayerstatus();
        int i = mAdapter.getPlayerstatusSongLength();
        int j = mAdapter.getPlayerstatusSongPos();
        if (byte0 != 255)
        {
            getPlayerstatusRspNative((byte)0, i, j, byte0);
            return;
        } else
        {
            Object aobj[] = new Object[1];
            aobj[0] = Byte.valueOf(byte0);
            Log.v("EXT_AVRCP", String.format("[BT][AVRCP] get_playerstatus_ind error:%d", aobj));
            getPlayerstatusRspNative((byte)0, 0, 0, (byte)0);
            return;
        }
    }

    public native boolean getPlayerstatusRspNative(byte byte0, int i, int j, byte byte1);

    public void getSearchResultitemsList(int i, int j, byte byte0, int ai[])
    {
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(j);
        aobj[2] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] getSearchResultitemsList start:%d end:%d count:%d", aobj));
        for (int k = 0; k < byte0; k++)
            Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] i:").append(k).append(" ").append(ai[k]).toString());

        if (mBrowserAdapter == null)
        {
            getSearchedItemRspNative((byte)1, (byte)19, (short)0);
            return;
        }
        if (i > j)
        {
            getSearchedItemRspNative((byte)1, (byte)11, (short)0);
            return;
        }
        long al[] = mBrowserAdapter.getSearchedList();
        if (al != null && i >= al.length)
        {
            Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] getSearchResultitemsList start:").append(i).append(" Searchedlist.length:").append(al.length).toString());
            getSearchedItemRspNative((byte)1, (byte)11, (short)0);
            return;
        }
        if (al != null && al.length == 0)
        {
            getSearchedItemRspNative((byte)1, (byte)11, (short)0);
            return;
        }
        getSearchedItemStartRspNative();
        if (al != null)
        {
            int l = al.length;
            if (j >= l)
                j = -1 + al.length;
            int i1;
            if (1 + (j - i) > al.length - i)
                i1 = al.length - i;
            else
                i1 = 1 + (j - i);
            if (i1 == 0)
            {
                Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] No data to return. list.length").append(al.length).append(" start:").append(i).append(" end:").append(j).toString());
                getSearchedItemRspNative((byte)1, (byte)11, (short)0);
                return;
            }
            Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] Searchedlist.length").append(al.length).append(" start:").append(i).append(" end:").append(j).toString());
            for (int j1 = i; j1 <= j; j1++)
            {
                int k1 = al.length;
                if (j1 >= k1)
                    break;
                int l1 = 0;
                int i2 = 0;
                do
                {
                    int j2 = ai.length;
                    if (i2 >= j2)
                        break;
                    BTAvrcpBrowserAdapter btavrcpbrowseradapter = mBrowserAdapter;
                    int k2 = ai[i2];
                    String s1 = btavrcpbrowseradapter.getSearchedItemAttribute(j1, k2);
                    if (s1 != null)
                    {
                        getSearchedItemFileAttrRspNative((byte)0, (byte)j1, (byte)l1, ai[i2], (short)106, (short)s1.length(), s1);
                        l1++;
                    }
                    i2++;
                } while (true);
                String s = mBrowserAdapter.getSearchedItemAttribute(j1, 1);
                if (s == null)
                    s = "";
                Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] got i:").append(j1).append(" uid:").append(al[j1]).append(" SongName:").append(s).toString());
                getSearchedItemFileRspNative((byte)0, (byte)j1, (byte)i1, al[j1], (byte)3, (short)106, (short)s.length(), s);
            }

            getSearchedItemRspNative((byte)0, (byte)0, (short)0);
            return;
        } else
        {
            Log.w("EXT_AVRCP", "[BT][AVRCP] No Searchedlist !");
            getSearchedItemRspNative((byte)1, (byte)11, (short)0);
            return;
        }
    }

    public boolean getSearchedItemFileAttrRspNative(byte byte0, byte byte1, byte byte2, int i, short word0, short word1, String s)
    {
        return getFileSystemItemFileAttrRspNative(byte0, byte1, byte2, i, word0, word1, s);
    }

    public boolean getSearchedItemFileRspNative(byte byte0, byte byte1, byte byte2, long l, byte byte3, short word0, 
            short word1, String s)
    {
        return getFileSystemItemFileRspNative(byte0, byte1, byte2, l, byte3, word0, word1, s);
    }

    public boolean getSearchedItemRspNative(byte byte0, byte byte1, short word0)
    {
        return getFileSystemItemEndRspNative(byte0, byte1, word0);
    }

    public boolean getSearchedItemStartRspNative()
    {
        return getFileSystemItemStartRspNative();
    }

    public native boolean informBatteryStatusRspNative(byte byte0);

    public void informBatteryStatusofctInd(byte byte0)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] informBatteryStatusofctInd  status:%d", aobj));
        mAdapter.informBatteryStatus(byte0);
        informBatteryStatusRspNative((byte)0);
    }

    public void informDisplayCharsetInd(byte byte0, short aword0[])
    {
        StringBuffer stringbuffer = new StringBuffer();
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] informDisplayCharsetInd count:%d", aobj));
        for (short word0 = 0; word0 < byte0; word0++)
        {
            Object aobj1[] = new Object[2];
            aobj1[0] = Short.valueOf(word0);
            aobj1[1] = Short.valueOf(aword0[word0]);
            stringbuffer.append(String.format("[BT][AVRCP]  [%d]:%x", aobj1));
        }

        Log.v("EXT_AVRCP", stringbuffer.toString());
        if (mAdapter.informDisplayCharset(byte0, aword0))
        {
            informDisplayCharsetRspNative((byte)0);
            return;
        } else
        {
            informDisplayCharsetRspNative((byte)3);
            return;
        }
    }

    public native boolean informDisplayCharsetRspNative(byte byte0);

    public void listPlayerAppAttributeInd()
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] listPlayerAppAttributeInd");
        byte abyte0[] = mAdapter.listPlayerAppAttribute();
        if (abyte0.length > 0)
        {
            listPlayerappAttributeRspNative((byte)0, (byte)abyte0.length, abyte0);
            return;
        } else
        {
            listPlayerappAttributeRspNative((byte)3, (byte)0, new byte[1]);
            return;
        }
    }

    public void listPlayerAppValueInd(byte byte0)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] listPlayerAppValueInd attrId:%d", aobj));
        byte abyte0[] = mAdapter.listPlayerAppValue(byte0);
        if (abyte0 != null && abyte0.length > 0)
        {
            listPlayerappValuesRspNative((byte)0, byte0, (byte)abyte0.length, abyte0);
            return;
        } else
        {
            listPlayerappValuesRspNative((byte)1, byte0, (byte)0, new byte[1]);
            return;
        }
    }

    public native boolean listPlayerappAttributeRspNative(byte byte0, byte byte1, byte abyte0[]);

    public native boolean listPlayerappValuesRspNative(byte byte0, byte byte1, byte byte2, byte abyte0[]);

    public native boolean notificationAddressedPlayerChangedNative(byte byte0, byte byte1, short word0, short word1);

    public native boolean notificationApplicationSettingChangedNative(byte byte0, byte byte1, byte byte2, byte abyte0[], byte abyte1[]);

    public native boolean notificationAvailPlayersChangedNative(byte byte0, byte byte1);

    public void notificationBatteryStatusChanged(byte byte0, byte byte1, byte byte2)
    {
        notificationBatteryStatusChangedNative(byte0, byte1, byte2);
    }

    public native boolean notificationBatteryStatusChangedNative(byte byte0, byte byte1, byte byte2);

    public native boolean notificationNowPlayingChangedNative(byte byte0, byte byte1);

    public native boolean notificationPlayPosChangedNative(byte byte0, byte byte1, int i);

    public native boolean notificationPlayStatusChangedNative(byte byte0, byte byte1, byte byte2);

    public void notificationSystemStatusChanged(byte byte0, byte byte1, byte byte2)
    {
        notificationSystemStatusChangedNative(byte0, byte1, byte2);
    }

    public native boolean notificationSystemStatusChangedNative(byte byte0, byte byte1, byte byte2);

    public native boolean notificationTrackChangedNative(byte byte0, byte byte1, long l);

    public native boolean notificationTrackReachedEndNative(byte byte0, byte byte1);

    public native boolean notificationTrackReachedStartNative(byte byte0, byte byte1);

    public native boolean notificationUIDSChangedNative(byte byte0, byte byte1, short word0);

    public void notificationVolumeChanged(byte byte0, byte byte1, byte byte2)
    {
        notificationVolumeChangedNative(byte0, byte1, byte2);
    }

    public native boolean notificationVolumeChangedNative(byte byte0, byte byte1, byte byte2);

    public IBinder onBind(Intent intent)
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] AVRCP Service onBind");
        return mBinder;
    }

    public void onCreate()
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] AVRCP Service onCreate");
        mContext = getApplicationContext();
        if (mAdapter == null)
        {
            Log.v("EXT_AVRCP", "AVRCP initializeNativeObjectNative");
            initializeNativeObjectNative();
            mAdapter = new BTAvrcpMusicAdapter(this, this);
            enable();
            mAdapter.init();
        }
        BluetoothAvrcpReceiver.sAvrcpServer = this;
    }

    public void onDestroy()
    {
        super.onDestroy();
        Log.v("EXT_AVRCP", "[BT][AVRCP] AVRCP Service onDestroy");
        disable();
        cleanupNativeObjectNative();
        if (mAdapter != null)
        {
            mAdapter.deinit();
            mAdapter = null;
        }
        if (mBrowserAdapter != null)
        {
            mBrowserAdapter.deinit();
            mBrowserAdapter = null;
        }
        BluetoothAvrcpReceiver.sAvrcpServer = null;
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] AVRCP Service onStartCommand flags:").append(i).append(" startId:").append(j).toString());
        int k = super.onStartCommand(intent, i, j);
        mStartId = j;
        if (k == 1)
        {
            if (intent != null)
            {
                parseIntent(intent);
                return k;
            } else
            {
                Log.v("EXT_AVRCP", "[BT][AVRCP] onStartCommand null intent");
                return k;
            }
        } else
        {
            Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] onStartCommand retCode ").append(k).toString());
            return k;
        }
    }

    public void passThroughKeyInd(int i, byte byte0)
    {
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] pass_through_key key:%d isPress:%d", aobj));
        mAdapter.passThroughKeyInd(i, byte0);
    }

    public void playItemsInd(byte byte0, long l, short word0)
    {
        Object aobj[] = new Object[3];
        aobj[0] = Byte.valueOf(byte0);
        aobj[1] = Long.valueOf(l);
        aobj[2] = Short.valueOf(word0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] playItemsInd idx:%d uid:%d player_id:%d", aobj));
        if (word0 == mBrowserAdapter.getUidCounter())
        {
            if (byte0 == 1 && !mBrowserAdapter.checkSongIdExisted(l))
            {
                Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] playItemsInd Warning try to add a not exist id:").append(l).toString());
                playItemsRspNative((byte)9, (byte)9);
                return;
            }
            if (mAdapter.playItems(l))
            {
                playItemsRspNative((byte)0, (byte)0);
                return;
            } else
            {
                playItemsRspNative((byte)1, (byte)14);
                return;
            }
        } else
        {
            playItemsRspNative((byte)5, (byte)0);
            return;
        }
    }

    public native boolean playItemsRspNative(byte byte0, byte byte1);

    public void playerAppCapabilitiesInd(int i)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] playerAppCapabilitiesInd type:%d", aobj));
        byte abyte0[] = mAdapter.playerAppCapabilities();
        if (abyte0 != null)
        {
            getCapabilitiesRspNative((byte)0, (byte)abyte0.length, abyte0);
            return;
        } else
        {
            getCapabilitiesRspNative((byte)3, (byte)0, new byte[1]);
            return;
        }
    }

    public void registerNotificationInd(byte byte0, int i)
    {
        Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP](test1) registerNotificationInd eventId:").append(byte0).append(" interval:").append(i).toString());
        boolean flag;
        if (byte0 != 10 && byte0 != 11)
        {
            if (12 == byte0)
                flag = mBrowserAdapter.registerNotification(byte0, i);
            else
                flag = mAdapter.registerNotification(byte0, i);
        } else
        {
            flag = false;
            switch (byte0)
            {
            case 11: // '\013'
                flag = false;
                break;

            case 10: // '\n'
                flag = false;
                break;
            }
        }
        if (!flag)
        {
            Log.v("EXT_AVRCP", "[BT][AVRCP] registerNotificationInd fail and reject it");
            switch (byte0)
            {
            case 13: // '\r'
                notificationVolumeChangedNative((byte)3, (byte)3, (byte)0);
                return;

            case 12: // '\f'
                notificationUIDSChangedNative((byte)0, (byte)1, (short)0);
                return;

            case 11: // '\013'
                notificationAddressedPlayerChangedNative((byte)3, (byte)3, (short)0, (short)0);
                return;

            case 10: // '\n'
                notificationAvailPlayersChangedNative((byte)3, (byte)3);
                return;

            case 9: // '\t'
                notificationNowPlayingChangedNative((byte)3, (byte)3);
                return;

            case 8: // '\b'
                byte abyte0[] = new byte[2];
                byte abyte1[] = new byte[2];
                abyte0[0] = 2;
                abyte0[1] = 3;
                abyte1[0] = 1;
                abyte1[1] = 1;
                notificationApplicationSettingChangedNative((byte)0, (byte)1, (byte)2, abyte0, abyte1);
                return;

            case 7: // '\007'
                notificationSystemStatusChangedNative((byte)3, (byte)1, (byte)2);
                return;

            case 6: // '\006'
                notificationBatteryStatusChangedNative((byte)3, (byte)1, (byte)2);
                return;

            case 5: // '\005'
                notificationPlayPosChangedNative((byte)3, (byte)1, 123);
                return;

            case 4: // '\004'
                notificationTrackReachedStartNative((byte)3, (byte)1);
                return;

            case 3: // '\003'
                notificationTrackReachedEndNative((byte)3, (byte)1);
                return;

            case 2: // '\002'
                notificationTrackChangedNative((byte)3, (byte)1, 0x12345678L);
                return;

            case 1: // '\001'
                notificationPlayStatusChangedNative((byte)3, (byte)1, (byte)1);
                return;

            default:
                Log.e("EXT_AVRCP", "[BT][AVRCP] register fail but don't know how to reject it");
                break;
            }
        }
    }

    public void run()
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] AVRCP run!!!");
        do
        {
            if (mStopped)
                break;
            if (!listenerNativeEventLoop(false))
                mStopped = true;
        } while (true);
        Log.v("EXT_AVRCP", "[BT][AVRCP] AVRCP Int Thread stop!!!");
    }

    public void searchInd(short word0, String s)
    {
        Object aobj[] = new Object[2];
        aobj[0] = Short.valueOf(word0);
        aobj[1] = s;
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] searchInd charset:0x%x text:'%s'", aobj));
        if (!mBrowserAdapter.search(s))
            searchRspNative((byte)16, (byte)0, (short)0, 0);
    }

    public native boolean searchRspNative(byte byte0, byte byte1, short word0, int i);

    public void sendAvrcpKeyEventInd(int i, byte byte0)
    {
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Byte.valueOf(byte0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] sendAvrcpKeyEventInd key:%d isPress:%d", aobj));
        mAdapter.sendAvrcpKeyEvent(i, byte0);
    }

    public native boolean sendKeyReqNative(int i);

    public void setAbsoluteVolumeInd(byte byte0, byte byte1)
    {
        byte byte2 = (byte)(byte1 & 0x7f);
        Log.v("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] set_absolute_volume_ind idx:").append(byte0).append(" volume:").append(byte1).append("newvol:").append(byte2).toString());
        if (mAdapter.setAbsoluteVolume(byte2))
        {
            mAdapter.getAbsoluteVolume();
            setAbsoluteVolumeRspNative((byte)0, (byte)0, byte1);
            return;
        } else
        {
            setAbsoluteVolumeRspNative((byte)1, (byte)1, (byte)0);
            return;
        }
    }

    public native boolean setAbsoluteVolumeRspNative(byte byte0, byte byte1, byte byte2);

    public void setAddressedplayerInd(short word0)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Short.valueOf(word0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] set_addressedplayer_ind playerId:%d", aobj));
        if (word0 == 1)
        {
            mCurPlayerId = word0;
            setAddressedplayerRspNative((byte)0, (byte)4);
            return;
        } else
        {
            setAddressedplayerRspNative((byte)17, (byte)11);
            return;
        }
    }

    public native boolean setAddressedplayerRspNative(byte byte0, byte byte1);

    public void setBrowsedplayerInd(short word0)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Short.valueOf(word0);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] setBrowsedplayerInd player_id:%d", aobj));
        if (word0 != 1)
        {
            Log.w("EXT_AVRCP", (new StringBuilder()).append("[BT][AVRCP] invalid player id:").append(word0).toString());
            setBrowsedplayerRspNative((byte)17, (byte)0, (short)0, 0, (short)106, (byte)0, new String[1]);
            return;
        }
        if (word0 != mCurPlayerId && mBrowserAdapter != null)
        {
            mBrowserAdapter.onSelect();
            setBrowsedplayerRspNative((byte)19, (byte)0, (short)0, 0, (short)106, (byte)0, new String[1]);
            return;
        }
        if (mBrowserAdapter != null)
        {
            short word1 = mBrowserAdapter.getUidCounter();
            int i = mBrowserAdapter.getCurPathItems();
            byte byte0 = mBrowserAdapter.getCurPathDepth();
            String as[] = mBrowserAdapter.getCurPaths();
            Object aobj1[] = new Object[3];
            aobj1[0] = Short.valueOf(word1);
            aobj1[1] = Integer.valueOf(i);
            aobj1[2] = Integer.valueOf(byte0);
            Log.w("EXT_AVRCP", String.format("[BT][AVRCP] browserAdapter uid_counter:%d num:%d depth:%d", aobj1));
            setBrowsedplayerRspNative((byte)0, (byte)0, word1, i, (short)106, byte0, as);
            return;
        } else
        {
            setBrowsedplayerRspNative((byte)19, (byte)0, (short)0, 0, (short)106, (byte)0, new String[1]);
            return;
        }
    }

    public native boolean setBrowsedplayerRspNative(byte byte0, byte byte1, short word0, int i, short word1, byte byte2, String as[]);

    public void setPlayerAppValueInd(byte byte0, byte abyte0[], byte abyte1[])
    {
        boolean flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Byte.valueOf(byte0);
        aobj[1] = Integer.valueOf(abyte0.length);
        Log.v("EXT_AVRCP", String.format("[BT][AVRCP] setPlayerAppValueInd count:%d length:%d", aobj));
        for (byte byte1 = 0; byte1 < byte0 && byte1 < abyte0.length && byte1 < abyte1.length; byte1++)
        {
            Object aobj1[] = new Object[3];
            aobj1[0] = Byte.valueOf(byte1);
            aobj1[1] = Byte.valueOf(abyte0[byte1]);
            aobj1[2] = Byte.valueOf(abyte1[byte1]);
            Log.v("EXT_AVRCP", String.format("[BT][AVRCP] setPlayerAppValueInd i:%d id:%d value:%d", aobj1));
            flag = mAdapter.setPlayerAppValue(abyte0[byte1], abyte1[byte1]);
        }

        if (flag)
        {
            setPlayerappValueRspNative((byte)0);
            return;
        } else
        {
            setPlayerappValueRspNative((byte)1);
            return;
        }
    }

    public native boolean setPlayerappValueRspNative(byte byte0);

    void shutdownIndThread()
    {
        Log.v("EXT_AVRCP", "[BT][AVRCP] +shutdownIndThread start");
        mStopped = true;
        wakeupListenerNative();
        Log.v("EXT_AVRCP", "[BT][AVRCP] +shutdownIndThread end");
    }

    public native boolean testparmnum(byte byte0, byte byte1, byte byte2, byte byte3, byte byte4, byte byte5, byte byte6, 
            byte byte7, byte byte8, byte byte9, byte byte10, byte byte11);



/*
    static short access$002(BluetoothAvrcpService bluetoothavrcpservice, short word0)
    {
        bluetoothavrcpservice.mCurPlayerId = word0;
        return word0;
    }

*/



/*
    static boolean access$102(BluetoothAvrcpService bluetoothavrcpservice, boolean flag)
    {
        bluetoothavrcpservice.mTrackAvailableChangedFlag = flag;
        return flag;
    }

*/



/*
    static boolean access$202(BluetoothAvrcpService bluetoothavrcpservice, boolean flag)
    {
        bluetoothavrcpservice.mTrackAddressedPlayerChangedFlag = flag;
        return flag;
    }

*/
}
