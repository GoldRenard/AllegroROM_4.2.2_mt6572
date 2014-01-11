// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.Context;
import android.content.Intent;
import android.location.Country;
import android.location.CountryDetector;
import android.net.Uri;
import android.os.RemoteException;
import android.os.SystemProperties;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;
import android.util.Log;
import com.android.i18n.phonenumbers.NumberParseException;
import com.android.i18n.phonenumbers.PhoneNumberUtil;
import com.android.i18n.phonenumbers.geocoding.PhoneNumberOfflineGeocoder;
import com.android.internal.telephony.ITelephony;
import com.mediatek.phone.GeminiConstants;
import com.mediatek.phone.SIMInfoWrapper;
import com.mediatek.telephony.PhoneNumberUtilsEx;
import java.util.*;

// Referenced classes of package com.mediatek.calloption:
//            Request

public class CallOptionUtils
{
    public static final class NumberInfo
    {

        public String mAreaCode;
        public String mAreaCodePrefix;
        public String mCountryCode;
        public String mSubscriber;

        public String toString()
        {
            return (new StringBuilder()).append("country code = ").append(mCountryCode).append(", area code = ").append(mAreaCode).append(", subscriber number = ").append(mSubscriber).append(", area code prefix = ").append(mAreaCodePrefix).toString();
        }

        public NumberInfo(String s, String s1, String s2, String s3)
        {
            mCountryCode = s;
            mAreaCode = s1;
            mSubscriber = s2;
            mAreaCodePrefix = s3;
        }
    }


    public static final int MODEM_MASK_TDSCDMA = 8;
    public static final int MODEM_MASK_WCDMA = 4;
    private static final String TAG = "CallOptionUtils";


    public static int get3GCapabilitySIM(Request request)
    {
        if (request.getTelephonyInterface() == null)
            return 0;
        int i;
        try
        {
            i = request.getTelephonyInterface().get3GCapabilitySIM();
        }
        catch (RemoteException remoteexception)
        {
            log("RemoteException happens in get3GCapabilitySIM()");
            return 0;
        }
        return i;
    }

    public static boolean get3GCapabilitySIMBySlot(int i)
    {
        String s1;
        String s = "gsm.baseband.capability";
        if (i == 1)
            s = (new StringBuilder()).append(s).append("2").toString();
        s1 = SystemProperties.get(s);
        Log.d("CallOptionUtils", (new StringBuilder()).append("gsm.baseband.capability ").append(s1).toString());
        if (s1 == null || "".equals(s1))
            return false;
        int j = Integer.valueOf(s1, 16).intValue();
        boolean flag;
        if ((j & 8) == 8 || (j & 4) == 4)
            flag = true;
        else
            flag = false;
_L2:
        return flag;
        NumberFormatException numberformatexception;
        numberformatexception;
        log("parse value of basband error");
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public static List get3GCapabilitySlots()
    {
        ArrayList arraylist = new ArrayList();
        int ai[] = GeminiConstants.SLOTS;
        int i = ai.length;
        for (int j = 0; j < i; j++)
        {
            int k = ai[j];
            if (get3GCapabilitySIMBySlot(k))
                arraylist.add(Integer.valueOf(k));
        }

        return arraylist;
    }

    public static String getCityGeoDescription(String s, String s1, Locale locale)
    {
        PhoneNumberUtil phonenumberutil = PhoneNumberUtil.getInstance();
        PhoneNumberOfflineGeocoder phonenumberofflinegeocoder = PhoneNumberOfflineGeocoder.getInstance();
        com.android.i18n.phonenumbers.Phonenumber.PhoneNumber phonenumber = null;
        try
        {
            log((new StringBuilder()).append("parsing '").append(s).append("' for countryIso '").append(s1).append("'...").toString());
            phonenumber = phonenumberutil.parse(s, s1);
            log((new StringBuilder()).append("- parsed number: ").append(phonenumber).toString());
        }
        catch (NumberParseException numberparseexception)
        {
            log((new StringBuilder()).append("getGeoDescription: NumberParseException for incoming number '").append(s).append("'").toString());
        }
        if (phonenumber != null)
        {
            String s2 = phonenumberofflinegeocoder.getDescriptionForNumber(phonenumber, locale);
            log((new StringBuilder()).append("- got description = ").append(s2).toString());
            return s2;
        } else
        {
            return null;
        }
    }

    public static final String getCurrentCountryISO(Context context)
    {
        return ((CountryDetector)context.getSystemService("country_detector")).detectCountry().getCountryIso();
    }

    public static String getInitialNumber(Context context, Intent intent)
    {
        log((new StringBuilder()).append("getInitialNumber(): ").append(intent).toString());
        if (TextUtils.isEmpty(intent.getAction()))
            return null;
        if (intent.hasExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL"))
            return intent.getStringExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL");
        else
            return getNumberFromIntent(context, intent);
    }

    private static String getNumberFromIntent(Context context, Intent intent)
    {
        Uri uri = intent.getData();
        if ("sip".equals(uri.getScheme()))
            return uri.getSchemeSpecificPart();
        if ("voicemail:".equals(intent.getData().toString()))
        {
            long l = android.provider.Settings.System.getLong(context.getContentResolver(), "voice_call_sim_setting", -5L);
            SIMInfoWrapper siminfowrapper = SIMInfoWrapper.getDefault();
            if (l > 0L && siminfowrapper.getSlotIdBySimId((int)l) >= 0)
                intent.putExtra("simId", siminfowrapper.getSlotIdBySimId((int)l));
        }
        log("getNumberFromIntent .....");
        return PhoneNumberUtils.getNumberFromIntent(intent, context);
    }

    public static NumberInfo getNumberInfo(String s, String s1)
    {
        log("getNumberInfo()..");
        PhoneNumberUtil phonenumberutil = PhoneNumberUtil.getInstance();
        com.android.i18n.phonenumbers.Phonenumber.PhoneNumber phonenumber;
        try
        {
            phonenumber = phonenumberutil.parse(s, s1);
        }
        catch (NumberParseException numberparseexception)
        {
            log("NumberParseException happens");
            return new NumberInfo(s1, "", s, "");
        }
        if (phonenumber == null)
        {
            log("phoneNumber is null");
            return new NumberInfo(s1, "", s, "");
        }
        String s2 = phonenumberutil.getNationalSignificantNumber(phonenumber);
        String s3 = "";
        String s4 = phonenumber.getPossibleNationalPrefix();
        log((new StringBuilder()).append("phone number = ").append(phonenumber).toString());
        log((new StringBuilder()).append("nationalSignificantNumber = ").append(s2).toString());
        int i = phonenumberutil.getLengthOfGeographicalAreaCode(phonenumber);
        String s5;
        if (i > 0)
        {
            s3 = s2.substring(0, i);
            s5 = s2.substring(i);
            log((new StringBuilder()).append("areaCode = ").append(s3).toString());
            log((new StringBuilder()).append("subscriberNumber = ").append(s5).toString());
        } else
        {
            s5 = s2;
        }
        return new NumberInfo(String.valueOf(phonenumber.getCountryCode()), s3, s5, s4);
    }

    public static int getSimState(Request request, int i)
    {
        if (request.getTelephonyInterface() == null)
            return 0;
        int k = request.getTelephonyInterface().getSimState(i);
        int j = k;
_L2:
        return j;
        RemoteException remoteexception;
        remoteexception;
        log("RemoteException happens in getSimState()");
        j = 0;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public static boolean isRadioOn(Request request, int i)
    {
        if (request.getTelephonyInterface() == null)
            return false;
        if (!request.isMultipleSim())
            break MISSING_BLOCK_LABEL_38;
        request.getTelephonyInterface().isRadioOnGemini(i);
        RemoteException remoteexception;
        return false;
        try
        {
            request.getTelephonyInterface().isRadioOn();
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception)
        {
            log("RemoteException happens in isRadioOn()");
            return false;
        }
        return false;
    }

    public static boolean isSimInsert(Request request, int i)
    {
        if (request.getTelephonyInterface() == null)
            return false;
        boolean flag;
        try
        {
            flag = request.getTelephonyInterface().isSimInsert(i);
        }
        catch (RemoteException remoteexception)
        {
            log("RemoteException happens in isSimInsert()");
            return false;
        }
        return flag;
    }

    public static boolean isSimReady(Request request, int i)
    {
        return getSimState(request, i) == 5;
    }

    public static boolean isValidNumberForCountryISO(Context context, String s, String s1)
    {
        boolean flag1 = PhoneNumberUtil.getInstance().isValidNumberForRegion(PhoneNumberUtil.getInstance().parse(s, s1), s1);
        boolean flag = flag1;
_L8:
        log((new StringBuilder()).append("isValidNumberForCountryISO(), PhoneNumberUtil.isValidNumberForRegion() result = ").append(flag).toString());
        if (flag) goto _L2; else goto _L1
_L1:
        int i;
        i = PhoneNumberUtilsEx.isValidNumber(s1, s);
        log((new StringBuilder()).append("isValidNumberForCountryISO(), result2 = ").append(i).toString());
        i;
        JVM INSTR tableswitch 1 6: default 120
    //                   1 203
    //                   2 209
    //                   3 209
    //                   4 215
    //                   5 203
    //                   6 238;
           goto _L3 _L4 _L5 _L5 _L6 _L4 _L7
_L7:
        break MISSING_BLOCK_LABEL_238;
_L3:
        flag = false;
_L2:
        log((new StringBuilder()).append("isValidNumberForCountryISO(), number = ").append(s).append(", country ISO = ").append(s1).append(", result = ").append(flag).toString());
        return flag;
        NumberParseException numberparseexception;
        numberparseexception;
        log((new StringBuilder()).append("catch NumberParseException, exception info = ").append(numberparseexception.toString()).toString());
        flag = false;
          goto _L8
_L4:
        flag = false;
          goto _L2
_L5:
        flag = true;
          goto _L2
_L6:
        if (getCurrentCountryISO(context).equals(s1))
            flag = true;
        else
            flag = false;
          goto _L2
        flag = false;
          goto _L2
    }

    private static void log(String s)
    {
        Log.d("CallOptionUtils", s);
    }

    public static String queryIPPrefix(Context context, int i, boolean flag)
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("ipprefix");
        if (flag)
            stringbuilder.append(SIMInfoWrapper.getDefault().getSimInfoBySlot(i).mSimId);
        String s = stringbuilder.toString();
        String s1 = android.provider.Settings.System.getString(context.getContentResolver(), s);
        log((new StringBuilder()).append("queryIPPrefix, ipPrefix = ").append(s1).toString());
        return s1;
    }
}
