// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.bluetooth.*;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.os.ServiceManager;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import com.android.internal.telephony.GsmAlphabet;
import com.android.internal.telephony.ITelephony;
import com.mediatek.telephony.SimInfoManager;
import com.mediatek.telephony.TelephonyManagerEx;
import java.util.HashMap;

// Referenced classes of package com.android.phone:
//            BluetoothHandsfree

public class BluetoothAtPhonebook
{
    private class PhonebookResult
    {

        public Cursor cursor;
        public int nameColumn;
        public int numberColumn;
        final BluetoothAtPhonebook this$0;
        public int typeColumn;

        private PhonebookResult()
        {
            this$0 = BluetoothAtPhonebook.this;
            super();
        }

    }


    private static final String ACCESS_AUTHORITY_CLASS = "com.android.settings.bluetooth.BluetoothPermissionRequest";
    private static final String ACCESS_AUTHORITY_PACKAGE = "com.android.settings";
    private static final String BLUETOOTH_ADMIN_PERM = "android.permission.BLUETOOTH_ADMIN";
    private static final String CALLS_PROJECTION[] = {
        "_id", "number"
    };
    private static final boolean DBG = false;
    private static final String INCOMING_CALL_WHERE = "type=1";
    private static final int MAX_PHONEBOOK_SIZE = 16384;
    private static final String MISSED_CALL_WHERE = "type=3";
    private static final String OUTGOING_CALL_WHERE = "type=2";
    private static final String PHONES_PROJECTION[] = {
        "_id", "display_name", "data1", "data2"
    };
    private static final String TAG = "BluetoothAtPhonebook";
    private static final String VISIBLE_PHONEBOOK_WHERE = "in_visible_group=1";
    static final Uri mIccUri = Uri.parse("content://icc/adn/");
    static final Uri mIccUri1;
    static final Uri mIccUri2;
    static final Uri mIccUri3;
    static final Uri mIccUri4;
    static final Uri mIccUriTable[];
    static final Uri mIccUsim1Uri;
    static final Uri mIccUsim2Uri;
    static final Uri mIccUsim3Uri;
    static final Uri mIccUsim4Uri;
    static final Uri mIccUsimUri = Uri.parse("content://icc/pbr");
    static final Uri mIccUsimUriTable[];
    private final ITelephony iTel = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
    private String mCharacterSet;
    private boolean mCheckingAccessPermission;
    private final Context mContext;
    private int mCpbrIndex1;
    private int mCpbrIndex2;
    private String mCurrentPhonebook;
    private final BluetoothHandsfree mHandsfree;
    private final HashMap mPhonebooks = new HashMap(5);

    public BluetoothAtPhonebook(Context context, BluetoothHandsfree bluetoothhandsfree)
    {
        mCharacterSet = "UTF-8";
        mContext = context;
        mHandsfree = bluetoothhandsfree;
        mPhonebooks.put("DC", new PhonebookResult());
        mPhonebooks.put("RC", new PhonebookResult());
        mPhonebooks.put("MC", new PhonebookResult());
        mPhonebooks.put("ME", new PhonebookResult());
        mPhonebooks.put("SM", new PhonebookResult());
        mCurrentPhonebook = "ME";
        mCpbrIndex2 = -1;
        mCpbrIndex1 = -1;
        mCheckingAccessPermission = false;
    }

    private int SIMstatusToCME()
    {
        log("SIMstatusToCME : ");
        int i = TelephonyManagerEx.getDefault().getSimState(getDefaultSIM());
        log((new StringBuilder()).append("SIM status = ").append(i).toString());
        switch (i)
        {
        case 4: // '\004'
            return 5;

        case 3: // '\003'
            return 12;

        case 2: // '\002'
            return 11;

        case 0: // '\0'
        case 1: // '\001'
            return 10;
        }
        return 13;
    }

    private boolean checkAccessPermission()
    {
        BluetoothDevice bluetoothdevice = mHandsfree.getHeadset().getRemoteDevice();
        if (bluetoothdevice.getTrustState())
        {
            return true;
        } else
        {
            Intent intent = new Intent("android.bluetooth.device.action.CONNECTION_ACCESS_REQUEST");
            intent.setClassName("com.android.settings", "com.android.settings.bluetooth.BluetoothPermissionRequest");
            intent.putExtra("android.bluetooth.device.extra.ACCESS_REQUEST_TYPE", 2);
            intent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
            mContext.sendBroadcast(intent, "android.permission.BLUETOOTH_ADMIN");
            return false;
        }
    }

    private int getMaxPhoneBookSize(int i)
    {
        int j = 100;
        this;
        JVM INSTR monitorenter ;
        int k;
        if (i >= j)
            j = i;
        k = roundUpToPowerOfTwo(j + j / 2);
        this;
        JVM INSTR monitorexit ;
        return k;
        Exception exception;
        exception;
        throw exception;
    }

    private static String getPhoneType(int i)
    {
        switch (i)
        {
        case 4: // '\004'
        case 5: // '\005'
            return "F";

        case 3: // '\003'
            return "W";

        case 2: // '\002'
            return "M";

        case 1: // '\001'
            return "H";
        }
        return "O";
    }

    private PhonebookResult getPhonebookResult(String s, boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (s != null) goto _L2; else goto _L1
_L1:
        PhonebookResult phonebookresult = null;
_L4:
        this;
        JVM INSTR monitorexit ;
        return phonebookresult;
_L2:
        phonebookresult = (PhonebookResult)mPhonebooks.get(s);
        if (phonebookresult != null)
            break MISSING_BLOCK_LABEL_43;
        phonebookresult = new PhonebookResult();
        if (flag)
            break MISSING_BLOCK_LABEL_55;
        if (phonebookresult.cursor != null)
            continue; /* Loop/switch isn't completed */
        boolean flag1 = queryPhonebook(s, phonebookresult);
        if (!flag1)
            phonebookresult = null;
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    private Uri getSIMUri()
    {
        int i = getDefaultSIM();
        Uri uri;
        if (iTel != null && iTel.getIccCardTypeGemini(i).equals("USIM"))
        {
            if (i < mIccUsimUriTable.length)
                return mIccUsimUriTable[i];
            break MISSING_BLOCK_LABEL_88;
        }
        if (i >= mIccUriTable.length)
            break MISSING_BLOCK_LABEL_88;
        uri = mIccUriTable[i];
        return uri;
        Exception exception;
        exception;
        log((new StringBuilder()).append("getSIMUri : caught exception ").append(exception.toString()).toString());
        return null;
    }

    private static void log(String s)
    {
        Log.d("BluetoothAtPhonebook", s);
    }

    private AtCommandResult processCpbrCommand()
    {
label0:
        {
            PhonebookResult phonebookresult = getPhonebookResult(mCurrentPhonebook, false);
            AtCommandResult atcommandresult;
            if (phonebookresult == null)
            {
                if ("SM".equals(mCurrentPhonebook))
                    atcommandresult = mHandsfree.reportCmeError(SIMstatusToCME());
                else
                    return mHandsfree.reportCmeError(3);
            } else
            {
                if (phonebookresult.cursor.getCount() == 0 || mCpbrIndex1 <= 0 || mCpbrIndex2 < mCpbrIndex1 || mCpbrIndex1 > phonebookresult.cursor.getCount())
                    break label0;
                atcommandresult = new AtCommandResult(0);
                phonebookresult.cursor.moveToPosition(-1 + mCpbrIndex1);
                int i = mCpbrIndex1;
                do
                {
                    if (i > mCpbrIndex2)
                        break;
                    String s = phonebookresult.cursor.getString(phonebookresult.numberColumn);
                    String s1;
                    if (phonebookresult.nameColumn == -1)
                    {
                        Cursor cursor = mContext.getContentResolver().query(Uri.withAppendedPath(android.provider.ContactsContract.PhoneLookup.CONTENT_FILTER_URI, s), new String[] {
                            "display_name", "type"
                        }, null, null, null);
                        s1 = null;
                        if (cursor != null)
                        {
                            boolean flag = cursor.moveToFirst();
                            s1 = null;
                            if (flag)
                            {
                                s1 = cursor.getString(0);
                                cursor.getInt(1);
                            }
                            cursor.close();
                        }
                    } else
                    {
                        s1 = phonebookresult.cursor.getString(phonebookresult.nameColumn);
                    }
                    if (s1 == null)
                        s1 = "";
                    String s2 = s1.trim();
                    if (s2.length() > 28)
                        s2 = s2.substring(0, 28);
                    if (phonebookresult.typeColumn != -1)
                    {
                        int k = phonebookresult.cursor.getInt(phonebookresult.typeColumn);
                        s2 = (new StringBuilder()).append(s2).append("/").append(getPhoneType(k)).toString();
                    }
                    if (s == null)
                        s = "";
                    int j = PhoneNumberUtils.toaFromString(s);
                    String s3 = PhoneNumberUtils.stripSeparators(s.trim());
                    if (s3.length() > 30)
                        s3 = s3.substring(0, 30);
                    if (s3.equals("-1"))
                    {
                        s3 = "";
                        s2 = mContext.getString(0x7f0d0176);
                    }
                    if (!s2.equals("") && mCharacterSet.equals("GSM"))
                    {
                        byte abyte0[] = GsmAlphabet.stringToGsm8BitPacked(s2);
                        if (abyte0 == null)
                            s2 = mContext.getString(0x7f0d0176);
                        else
                            s2 = new String(abyte0);
                    }
                    atcommandresult.addResponse((new StringBuilder()).append("+CPBR: ").append(i).append(",\"").append(s3).append("\",").append(j).append(",\"").append(s2).append("\"").toString());
                    if (!phonebookresult.cursor.moveToNext())
                        break;
                    i++;
                } while (true);
            }
            return atcommandresult;
        }
        return new AtCommandResult(0);
    }

    private boolean queryPhonebook(String s, PhonebookResult phonebookresult)
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        boolean flag1;
        flag = true;
        flag1 = false;
        log((new StringBuilder()).append("queryPhonebook ").append(s).toString());
        if (!s.equals("ME")) goto _L2; else goto _L1
_L1:
        String s1;
        flag = false;
        s1 = "indicate_phone_or_sim_contact=-1";
_L7:
        if (phonebookresult.cursor != null)
        {
            phonebookresult.cursor.close();
            phonebookresult.cursor = null;
        }
        if (!flag || flag1) goto _L4; else goto _L3
_L3:
        Cursor cursor;
        phonebookresult.cursor = mContext.getContentResolver().query(android.provider.CallLog.Calls.CONTENT_URI, CALLS_PROJECTION, s1, null, "date DESC LIMIT 16384");
        cursor = phonebookresult.cursor;
        if (cursor != null) goto _L6; else goto _L5
_L5:
        boolean flag2 = false;
_L8:
        this;
        JVM INSTR monitorexit ;
        return flag2;
_L2:
        if (!s.equals("DC"))
            break MISSING_BLOCK_LABEL_140;
        s1 = "type=2";
        flag1 = false;
          goto _L7
        if (!s.equals("RC"))
            break MISSING_BLOCK_LABEL_159;
        s1 = "type=1";
        flag1 = false;
          goto _L7
        if (!s.equals("MC"))
            break MISSING_BLOCK_LABEL_178;
        s1 = "type=3";
        flag1 = false;
          goto _L7
        if (!s.equals("SM"))
            break MISSING_BLOCK_LABEL_373;
        flag1 = true;
        s1 = "indicate_phone_or_sim_contact > 0";
          goto _L7
_L6:
        phonebookresult.numberColumn = phonebookresult.cursor.getColumnIndexOrThrow("number");
        phonebookresult.typeColumn = -1;
        phonebookresult.nameColumn = -1;
_L9:
        Log.i("BluetoothAtPhonebook", (new StringBuilder()).append("Refreshed phonebook ").append(s).append(" with ").append(phonebookresult.cursor.getCount()).append(" results").toString());
        flag2 = true;
          goto _L8
_L4:
        phonebookresult.cursor = mContext.getContentResolver().query(android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI, PHONES_PROJECTION, s1, null, "data1 LIMIT 16384");
        if (phonebookresult.cursor != null)
            break MISSING_BLOCK_LABEL_318;
        flag2 = false;
          goto _L8
        phonebookresult.numberColumn = phonebookresult.cursor.getColumnIndex("data1");
        phonebookresult.typeColumn = phonebookresult.cursor.getColumnIndex("data2");
        phonebookresult.nameColumn = phonebookresult.cursor.getColumnIndex("display_name");
          goto _L9
        Exception exception;
        exception;
        throw exception;
        flag2 = false;
          goto _L8
    }

    private int roundUpToPowerOfTwo(int i)
    {
        int j = i | i >> 1;
        int k = j | j >> 2;
        int l = k | k >> 4;
        int i1 = l | l >> 8;
        return 1 + (i1 | i1 >> 16);
    }

    public int getDefaultSIM()
    {
        int i;
        int j;
        int k;
        i = (int)android.provider.Settings.System.getLong(mContext.getContentResolver(), "voice_call_sim_setting", -5L);
        log((new StringBuilder()).append("getDefaultSIM : SIM ID=").append(i).toString());
        if ((long)i != -5L && (long)i != -1L)
            break MISSING_BLOCK_LABEL_199;
        log("No default SIM, get first inserted SIM");
        j = BluetoothHandsfree.getSimCount();
        k = 0;
_L2:
        int i1;
        int l = j + 0;
        i1 = 0;
        if (k >= l)
            break MISSING_BLOCK_LABEL_132;
        if (!iTel.isSimInsert(k))
            break MISSING_BLOCK_LABEL_159;
        log((new StringBuilder()).append("getDefaultSim():first inserted SIM found [").append(k + 1).append("]").toString());
        i1 = k;
        try
        {
            log((new StringBuilder()).append("getDefaultSim():The default SIM is ").append(i1).toString());
        }
        catch (Exception exception)
        {
            log((new StringBuilder()).append("getDefaultSim():exception thrown [").append(exception).append(", default SIM set to GEMINI_SIM_1").toString());
            return 0;
        }
        return i1;
        k++;
        if (true) goto _L2; else goto _L1
_L1:
        int j1 = SimInfoManager.getSlotById(mContext, i);
        log((new StringBuilder()).append("getDefaultSIM : Sim Id in Settings.System.VOICE_CALL_SIM_SETTING=").append(j1).toString());
        return j1;
    }

    public String getLastDialledNumber()
    {
        return getLastDialledNumber(null);
    }

    public String getLastDialledNumber(HashMap hashmap)
    {
        Cursor cursor;
        String as[] = {
            "number", "vtcall"
        };
        cursor = mContext.getContentResolver().query(android.provider.CallLog.Calls.CONTENT_URI, as, "type=2", null, "date DESC LIMIT 1");
        if (cursor == null)
        {
            cursor.close();
            return null;
        }
        if (cursor.getCount() >= 1)
            break MISSING_BLOCK_LABEL_73;
        cursor.close();
        cursor.close();
        return null;
        String s;
        cursor.moveToNext();
        s = cursor.getString(cursor.getColumnIndexOrThrow("number"));
        cursor.close();
        cursor.close();
        return s;
        Exception exception1;
        exception1;
        log(exception1.toString());
        cursor.close();
        return null;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    void handleAccessPermissionResult(Intent intent)
    {
        if (!mCheckingAccessPermission)
            return;
        BluetoothAudioGateway bluetoothaudiogateway = mHandsfree.getHeadset();
        if (intent.getAction().equals("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY"))
            if (intent.getIntExtra("android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT", 2) == 1)
            {
                BluetoothDevice bluetoothdevice = bluetoothaudiogateway.getRemoteDevice();
                if (intent.getBooleanExtra("android.bluetooth.device.extra.ALWAYS_ALLOWED", false))
                    bluetoothdevice.setTrust(true);
                bluetoothaudiogateway.sendURC(processCpbrCommand().toString());
            } else
            {
                bluetoothaudiogateway.sendURC("ERROR");
            }
        mCpbrIndex2 = -1;
        mCpbrIndex1 = -1;
        mCheckingAccessPermission = false;
    }

    public void register(AtParser atparser)
    {
        atparser.register("+CSCS", new AtCommandHandler() {

            final BluetoothAtPhonebook this$0;

            public AtCommandResult handleReadCommand()
            {
                return new AtCommandResult((new StringBuilder()).append("+CSCS: \"").append(mCharacterSet).append("\"").toString());
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj.length < 1)
                    return new AtCommandResult(1);
                String s = ((String)aobj[0]).replace("\"", "");
                if (!s.equals("GSM") && !s.equals("IRA") && !s.equals("UTF-8") && !s.equals("UTF8"))
                {
                    return mHandsfree.reportCmeError(4);
                } else
                {
                    mCharacterSet = s;
                    return new AtCommandResult(0);
                }
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+CSCS: (\"UTF-8\",\"IRA\",\"GSM\")");
            }

            
            {
                this$0 = BluetoothAtPhonebook.this;
                super();
            }
        }
);
        atparser.register("+CPBS", new AtCommandHandler() {

            final BluetoothAtPhonebook this$0;

            public AtCommandResult handleReadCommand()
            {
                PhonebookResult phonebookresult = getPhonebookResult(mCurrentPhonebook, true);
                if (phonebookresult == null)
                {
                    if ("SM".equals(mCurrentPhonebook))
                        return mHandsfree.reportCmeError(SIMstatusToCME());
                    else
                        return mHandsfree.reportCmeError(3);
                } else
                {
                    int i = phonebookresult.cursor.getCount();
                    return new AtCommandResult((new StringBuilder()).append("+CPBS: \"").append(mCurrentPhonebook).append("\",").append(i).append(",").append(getMaxPhoneBookSize(i)).toString());
                }
            }

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (aobj.length >= 1 && (aobj[0] instanceof String))
                {
                    String s;
                    for (s = ((String)aobj[0]).trim(); s.endsWith("\""); s = s.substring(0, -1 + s.length()));
                    for (; s.startsWith("\""); s = s.substring(1, s.length()));
                    if (getPhonebookResult(s, false) == null)
                    {
                        return mHandsfree.reportCmeError(4);
                    } else
                    {
                        mCurrentPhonebook = s;
                        return new AtCommandResult(0);
                    }
                } else
                {
                    return new AtCommandResult(1);
                }
            }

            public AtCommandResult handleTestCommand()
            {
                return new AtCommandResult("+CPBS: (\"ME\",\"SM\",\"DC\",\"RC\",\"MC\")");
            }

            
            {
                this$0 = BluetoothAtPhonebook.this;
                super();
            }
        }
);
        atparser.register("+CPBR", new AtCommandHandler() {

            final BluetoothAtPhonebook this$0;

            public AtCommandResult handleSetCommand(Object aobj[])
            {
                if (mCpbrIndex1 != -1)
                    return mHandsfree.reportCmeError(3);
                if (aobj.length >= 1 && (aobj[0] instanceof Integer))
                {
                    int i = ((Integer)aobj[0]).intValue();
                    int j;
                    if (aobj.length == 1)
                    {
                        j = i;
                    } else
                    {
                        if (!(aobj[1] instanceof Integer))
                            return mHandsfree.reportCmeError(25);
                        j = ((Integer)aobj[1]).intValue();
                    }
                    mCpbrIndex1 = i;
                    mCpbrIndex2 = j;
                    mCheckingAccessPermission = true;
                    if (checkAccessPermission())
                    {
                        mCheckingAccessPermission = false;
                        AtCommandResult atcommandresult = processCpbrCommand();
                        mCpbrIndex1 = mCpbrIndex2 = -1;
                        return atcommandresult;
                    } else
                    {
                        return new AtCommandResult(2);
                    }
                } else
                {
                    return new AtCommandResult(1);
                }
            }

            public AtCommandResult handleTestCommand()
            {
                PhonebookResult phonebookresult = getPhonebookResult(mCurrentPhonebook, false);
                if (phonebookresult == null)
                    if ("SM".equals(mCurrentPhonebook))
                        return mHandsfree.reportCmeError(SIMstatusToCME());
                    else
                        return mHandsfree.reportCmeError(3);
                int i = phonebookresult.cursor.getCount();
                if (i == 0)
                    i = 1;
                return new AtCommandResult((new StringBuilder()).append("+CPBR: (1-").append(i).append("),30,30").toString());
            }

            
            {
                this$0 = BluetoothAtPhonebook.this;
                super();
            }
        }
);
    }

    void resetAtState()
    {
        this;
        JVM INSTR monitorenter ;
        mCharacterSet = "UTF-8";
        mCpbrIndex2 = -1;
        mCpbrIndex1 = -1;
        mCheckingAccessPermission = false;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    static 
    {
        mIccUri1 = Uri.parse("content://icc/adn1/");
        mIccUri2 = Uri.parse("content://icc/adn2/");
        mIccUri3 = Uri.parse("content://icc/adn3/");
        mIccUri4 = Uri.parse("content://icc/adn4/");
        mIccUsim1Uri = Uri.parse("content://icc/pbr1/");
        mIccUsim2Uri = Uri.parse("content://icc/pbr2/");
        mIccUsim3Uri = Uri.parse("content://icc/pbr3/");
        mIccUsim4Uri = Uri.parse("content://icc/pbr4/");
        Uri auri[] = new Uri[4];
        auri[0] = mIccUri1;
        auri[1] = mIccUri2;
        auri[2] = mIccUri3;
        auri[3] = mIccUri4;
        mIccUriTable = auri;
        Uri auri1[] = new Uri[4];
        auri1[0] = mIccUsim1Uri;
        auri1[1] = mIccUsim2Uri;
        auri1[2] = mIccUsim3Uri;
        auri1[3] = mIccUsim4Uri;
        mIccUsimUriTable = auri1;
    }




/*
    static String access$102(BluetoothAtPhonebook bluetoothatphonebook, String s)
    {
        bluetoothatphonebook.mCharacterSet = s;
        return s;
    }

*/





/*
    static String access$302(BluetoothAtPhonebook bluetoothatphonebook, String s)
    {
        bluetoothatphonebook.mCurrentPhonebook = s;
        return s;
    }

*/






/*
    static int access$702(BluetoothAtPhonebook bluetoothatphonebook, int i)
    {
        bluetoothatphonebook.mCpbrIndex1 = i;
        return i;
    }

*/


/*
    static int access$802(BluetoothAtPhonebook bluetoothatphonebook, int i)
    {
        bluetoothatphonebook.mCpbrIndex2 = i;
        return i;
    }

*/


/*
    static boolean access$902(BluetoothAtPhonebook bluetoothatphonebook, boolean flag)
    {
        bluetoothatphonebook.mCheckingAccessPermission = flag;
        return flag;
    }

*/
}
