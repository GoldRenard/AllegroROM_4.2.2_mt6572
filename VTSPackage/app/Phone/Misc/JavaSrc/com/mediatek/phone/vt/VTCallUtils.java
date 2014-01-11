// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.app.ActivityManagerNative;
import android.app.IActivityManager;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.RemoteException;
import android.os.SystemProperties;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.android.internal.telephony.sip.SipPhone;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneUtils;
import com.mediatek.phone.GeminiConstants;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.settings.VTAdvancedSetting;
import com.mediatek.settings.VTSettingUtils;
import com.mediatek.telephony.PhoneNumberUtilsEx;
import com.mediatek.vt.VTManager;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

// Referenced classes of package com.mediatek.phone.vt:
//            VTInCallScreenFlags

public final class VTCallUtils
{
    public static final class VTTimingMode extends Enum
    {

        private static final VTTimingMode $VALUES[];
        public static final VTTimingMode VT_TIMING_DEFAULT;
        public static final VTTimingMode VT_TIMING_NONE;

        public static VTTimingMode valueOf(String s)
        {
            return (VTTimingMode)Enum.valueOf(com/mediatek/phone/vt/VTCallUtils$VTTimingMode, s);
        }

        public static VTTimingMode[] values()
        {
            return (VTTimingMode[])$VALUES.clone();
        }

        static 
        {
            VT_TIMING_NONE = new VTTimingMode("VT_TIMING_NONE", 0);
            VT_TIMING_DEFAULT = new VTTimingMode("VT_TIMING_DEFAULT", 1);
            VTTimingMode avttimingmode[] = new VTTimingMode[2];
            avttimingmode[0] = VT_TIMING_NONE;
            avttimingmode[1] = VT_TIMING_DEFAULT;
            $VALUES = avttimingmode;
        }

        private VTTimingMode(String s, int i)
        {
            super(s, i);
        }
    }


    private static final int BITMAP_COMPRESS_QUALITY = 100;
    private static final String CHANGE_FILE_PERMISSION = "chmod 640 ";
    private static final boolean DBG = true;
    private static final String LOG_TAG = "VTCallUtils";
    private static final boolean VDBG = true;
    public static final String VT_CALL_END = "android.phone.extra.VT_CALL_END";
    public static final String VT_CALL_START = "android.phone.extra.VT_CALL_START";
    private static boolean sDialWithSpeakerOff = false;
    private static String sNumbersDefault[] = {
        "12535", "13800100011", "+8612535", "+8613800100011"
    };
    private static String sNumbersNone[] = {
        "12531", "+8612531"
    };

    private VTCallUtils()
    {
    }

    private static void checkDefaultPictureFile()
    {
        if (!(new File(VTAdvancedSetting.getPicPathDefault())).exists())
        {
            log("checkVTFile() : the default pic file not exists , create it ! ");
            Bitmap bitmap;
            try
            {
                Bitmap bitmap1 = BitmapFactory.decodeResource(PhoneGlobals.getInstance().getResources(), 0x7f020104);
                saveMyBitmap(VTAdvancedSetting.getPicPathDefault(), bitmap1);
                bitmap1.recycle();
                log((new StringBuilder()).append(" - Bitmap.isRecycled() : ").append(bitmap1.isRecycled()).toString());
            }
            catch (IOException ioexception1)
            {
                ioexception1.printStackTrace();
            }
        }
        if ((new File(VTAdvancedSetting.getPicPathDefault2())).exists())
            break MISSING_BLOCK_LABEL_138;
        log("checkVTFile() : the default pic2 file not exists , create it ! ");
        bitmap = BitmapFactory.decodeResource(PhoneGlobals.getInstance().getResources(), 0x7f020104);
        saveMyBitmap(VTAdvancedSetting.getPicPathDefault2(), bitmap);
        bitmap.recycle();
        log((new StringBuilder()).append(" - Bitmap.isRecycled() : ").append(bitmap.isRecycled()).toString());
        return;
        IOException ioexception;
        ioexception;
        ioexception.printStackTrace();
        return;
    }

    private static void checkUserSelectPictureFile(int i)
    {
        if (!(new File(VTAdvancedSetting.getPicPathUserselect(i))).exists())
        {
            log("checkVTFile() : the default user select pic file not exists , create it ! ");
            Bitmap bitmap;
            try
            {
                Bitmap bitmap1 = BitmapFactory.decodeResource(PhoneGlobals.getInstance().getResources(), 0x7f020104);
                saveMyBitmap(VTAdvancedSetting.getPicPathUserselect(i), bitmap1);
                bitmap1.recycle();
                log((new StringBuilder()).append(" - Bitmap.isRecycled() : ").append(bitmap1.isRecycled()).toString());
            }
            catch (IOException ioexception1)
            {
                ioexception1.printStackTrace();
            }
        }
        if (!(new File(VTAdvancedSetting.getPicPathUserselect2(i))).exists())
        {
            log("checkVTFile() : the default user select pic2 file not exists , create it ! ");
            try
            {
                bitmap = BitmapFactory.decodeResource(PhoneGlobals.getInstance().getResources(), 0x7f020104);
                saveMyBitmap(VTAdvancedSetting.getPicPathUserselect2(i), bitmap);
                bitmap.recycle();
                log((new StringBuilder()).append(" - Bitmap.isRecycled() : ").append(bitmap.isRecycled()).toString());
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
            }
        }
        log("end checkVTFile() ! ");
    }

    public static void checkVTFile()
    {
        log("start checkVTFile() !");
        checkDefaultPictureFile();
        int ai[] = GeminiUtils.getSlots();
        int i = ai.length;
        for (int j = 0; j < i; j++)
            checkUserSelectPictureFile(ai[j]);

        log("end checkVTFile() ! ");
    }

    public static void checkVTFile(int i)
    {
        log((new StringBuilder()).append("start checkVTFile() !, slotId = ").append(i).toString());
        checkDefaultPictureFile();
        checkUserSelectPictureFile(i);
        log("end checkVTFile() ! ");
    }

    public static VTTimingMode checkVTTimingMode(String s)
    {
        log((new StringBuilder()).append("checkVTTimingMode - number:").append(s).toString());
        ArrayList arraylist = new ArrayList(Arrays.asList(sNumbersNone));
        ArrayList arraylist1 = new ArrayList(Arrays.asList(sNumbersDefault));
        if (arraylist.indexOf(s) >= 0)
        {
            log((new StringBuilder()).append("checkVTTimingMode - return:").append(VTTimingMode.VT_TIMING_NONE).toString());
            return VTTimingMode.VT_TIMING_NONE;
        }
        if (arraylist1.indexOf(s) >= 0)
        {
            log((new StringBuilder()).append("checkVTTimingMode - return:").append(VTTimingMode.VT_TIMING_DEFAULT).toString());
            return VTTimingMode.VT_TIMING_DEFAULT;
        } else
        {
            return VTTimingMode.VT_TIMING_DEFAULT;
        }
    }

    public static boolean isVTActive()
    {
        return false;
    }

    public static boolean isVTCallActive()
    {
        return false;
    }

    public static boolean isVTDialWithSpeakerOff()
    {
        return false;
    }

    public static boolean isVTIdle()
    {
        return true;
    }

    public static boolean isVTRinging()
    {
        return false;
    }

    public static boolean isVideoCall(Call call)
    {
        if (call != null && call.getLatestConnection() != null)
            return call.getLatestConnection().isVideo();
        else
            return false;
    }

    private static void log(String s)
    {
        Log.d("VTCallUtils", s);
    }

    public static int placeVTCall(Phone phone, String s, Uri uri, int i)
    {
        log((new StringBuilder()).append("placeVTCall: '").append(s).append("'...").append("simId : ").append(i).toString());
        if (com.android.internal.telephony.PhoneConstants.State.IDLE != PhoneGlobals.getInstance().mCM.getState())
            return 2;
        if (!PhoneNumberUtilsEx.isIdleSsString(s)) goto _L2; else goto _L1
_L1:
        log("the number for VT call is idle ss string");
        return 2;
        CallStateException callstateexception;
        callstateexception;
        byte byte0;
        Log.w("VTCallUtils", "Exception from vtDial()", callstateexception);
        byte0 = 2;
_L8:
        return byte0;
_L2:
        if (!PhoneNumberUtils.isUriNumber(s) && !(phone instanceof SipPhone))
            break MISSING_BLOCK_LABEL_107;
        log("the number for VT call is idle uri string");
        return 2;
        int j = GeminiUtils.getIndexInArray(i, GeminiUtils.getSlots());
        int k;
        k = 0;
        if (j == -1)
            break MISSING_BLOCK_LABEL_137;
        k = SystemProperties.getInt(GeminiConstants.PROPERTY_CS_NETWORK_TYPES[j], -1);
        log((new StringBuilder()).append("==> placeVTCall(): nCSNetType: ").append(k).append(" index=").append(j).toString());
        VTSettingUtils.getInstance().updateVTSettingState(i);
        if (1 == k || 2 == k)
            break MISSING_BLOCK_LABEL_541;
        VTInCallScreenFlags.getInstance().reset();
        if (!VTInCallScreenFlags.getInstance().mVTInControlRes)
        {
            PhoneGlobals.getInstance().sendBroadcast(new Intent("android.phone.extra.VT_CALL_START"));
            VTInCallScreenFlags.getInstance().mVTInControlRes = true;
        }
        VTInCallScreenFlags.getInstance().mVTIsMT = false;
        VTInCallScreenFlags.getInstance().mVTSlotId = i;
        checkVTFile(i);
        VTSettingUtils.getInstance().updateVTEngineerModeValues();
        VTInCallScreenFlags.getInstance().mVTPeerBigger = VTSettingUtils.getInstance().mPeerBigger;
        log("- set VTManager open ! ");
        if (!GeminiUtils.isGeminiSupport()) goto _L4; else goto _L3
_L3:
        Object obj = PhoneGlobals.getInstance().mCMGemini;
_L5:
        VTManager.getInstance().setVTOpen(PhoneGlobals.getInstance().getBaseContext(), obj, i);
        log("- finish set VTManager open ! ");
        if (!VTInCallScreenFlags.getInstance().mVTSurfaceChangedH || !VTInCallScreenFlags.getInstance().mVTSurfaceChangedL)
            break MISSING_BLOCK_LABEL_435;
        log("- set VTManager ready ! ");
        VTManager.getInstance().setVTReady();
        log("- finish set VTManager ready ! ");
_L6:
        Connection connection;
        PhoneUtils.placeCallRegister(phone);
        connection = vtDial(phone, s, i);
        log((new StringBuilder()).append("vtDial() returned: ").append(connection).toString());
        if (connection != null)
            break MISSING_BLOCK_LABEL_445;
        if (phone.getPhoneType() != 1)
            break MISSING_BLOCK_LABEL_543;
        log((new StringBuilder()).append("dialed MMI code: ").append(s).toString());
        byte0 = 1;
        continue; /* Loop/switch isn't completed */
_L4:
        obj = PhoneGlobals.getInstance().mCM;
          goto _L5
        VTInCallScreenFlags.getInstance().mVTSettingReady = true;
          goto _L6
        PhoneUtils.setAudioControlState(2);
        byte0 = 0;
        if (uri == null)
            continue; /* Loop/switch isn't completed */
        boolean flag = uri.getScheme().equals("content");
        byte0 = 0;
        if (!flag)
            continue; /* Loop/switch isn't completed */
        Object obj1 = connection.getUserData();
        if (obj1 != null)
            break MISSING_BLOCK_LABEL_500;
        connection.setUserData(uri);
        byte0 = 0;
        continue; /* Loop/switch isn't completed */
        if (!(obj1 instanceof CallerInfo))
            break MISSING_BLOCK_LABEL_523;
        ((CallerInfo)obj1).contactRefUri = uri;
        byte0 = 0;
        continue; /* Loop/switch isn't completed */
        ((com.android.phone.PhoneUtils.CallerInfoToken)obj1).currentInfo.contactRefUri = uri;
        byte0 = 0;
        continue; /* Loop/switch isn't completed */
        return 3;
        byte0 = 2;
        if (true) goto _L8; else goto _L7
_L7:
    }

    public static void saveMyBitmap(String s, Bitmap bitmap)
        throws IOException
    {
        File file;
        log("saveMyBitmap()...");
        file = new File(s);
        file.createNewFile();
        FileOutputStream fileoutputstream = new FileOutputStream(file);
        FileOutputStream fileoutputstream1 = fileoutputstream;
_L1:
        bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, fileoutputstream1);
        FileNotFoundException filenotfoundexception;
        try
        {
            fileoutputstream1.flush();
        }
        catch (IOException ioexception)
        {
            ioexception.printStackTrace();
        }
        try
        {
            log("Change file visit right for mediaserver process");
            String s1 = (new StringBuilder()).append("chmod 640 ").append(file.getAbsolutePath()).toString();
            Runtime.getRuntime().exec(s1);
        }
        catch (IOException ioexception1)
        {
            ioexception1.printStackTrace();
            log("exception happens when change file permission");
        }
        try
        {
            fileoutputstream1.close();
            return;
        }
        catch (IOException ioexception2)
        {
            ioexception2.printStackTrace();
        }
        break MISSING_BLOCK_LABEL_142;
        filenotfoundexception;
        filenotfoundexception.printStackTrace();
        fileoutputstream1 = null;
          goto _L1
    }

    public static void setVTDialWithSpeakerOff(boolean flag)
    {
        sDialWithSpeakerOff = flag;
    }

    public static void showVTIncomingCallUi()
    {
        log("showVTIncomingCallUi()...");
        VTSettingUtils.getInstance().updateVTEngineerModeValues();
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        try
        {
            ActivityManagerNative.getDefault().closeSystemDialogs("call");
        }
        catch (RemoteException remoteexception)
        {
            remoteexception.printStackTrace();
        }
        phoneglobals.requestWakeState(com.android.phone.PhoneGlobals.WakeState.FULL);
        log("- updating notification from showVTIncomingCall()...");
        phoneglobals.displayCallScreen(true);
    }

    private static Connection vtDial(Phone phone, String s, int i)
        throws CallStateException
    {
        if (GeminiUtils.isGeminiSupport())
            return PhoneGlobals.getInstance().mCMGemini.vtDialGemini(phone, s, GeminiUtils.getDefaultSlot());
        else
            return PhoneGlobals.getInstance().mCM.vtDial(phone, s);
    }

}
