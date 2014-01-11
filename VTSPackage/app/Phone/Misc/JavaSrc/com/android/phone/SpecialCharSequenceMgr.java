// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import android.view.Window;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.TelephonyCapabilities;
import com.mediatek.phone.gemini.GeminiUtils;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, SimContacts

public class SpecialCharSequenceMgr
{

    private static final boolean DBG = false;
    private static final String MMI_IMEI_DISPLAY = "*#06#";
    private static final String TAG = "PhoneGlobals";

    private SpecialCharSequenceMgr()
    {
    }

    private static boolean handleAdnEntry(Context context, String s)
    {
        int i;
        if (!PhoneGlobals.getInstance().getKeyguardManager().inKeyguardRestrictedInputMode())
            if ((i = s.length()) > 1 && i < 5 && s.endsWith("#"))
            {
                int j = i - 1;
                try
                {
                    int k = Integer.parseInt(s.substring(0, j));
                    Intent intent = new Intent("android.intent.action.PICK");
                    intent.setClassName("com.android.phone", com/android/phone/SimContacts.getName());
                    intent.setFlags(0x10000000);
                    intent.putExtra("index", k);
                    PhoneGlobals.getInstance().startActivity(intent);
                }
                catch (NumberFormatException numberformatexception)
                {
                    return false;
                }
                return true;
            }
        return false;
    }

    static boolean handleChars(Context context, String s)
    {
        return handleChars(context, s, null);
    }

    static boolean handleChars(Context context, String s, Activity activity)
    {
        String s1 = PhoneNumberUtils.stripSeparators(s);
        return handleIMEIDisplay(context, s1) || handlePinEntry(context, s1, activity) || handleAdnEntry(context, s1) || handleSecretCode(context, s1);
    }

    static boolean handleCharsForLockedDevice(Context context, String s, Activity activity, int i)
    {
        String s1 = PhoneNumberUtils.stripSeparators(s);
        return s1 != null && handlePinEntryGemini(context, s1, activity, i);
    }

    private static boolean handleIMEIDisplay(Context context, String s)
    {
        if (s.equals("*#06#"))
        {
            showDeviceIdPanel(context);
            return true;
        } else
        {
            return false;
        }
    }

    private static boolean handlePinEntry(Context context, String s, Activity activity)
    {
        return handlePinEntryGemini(context, s, activity, 0);
    }

    private static boolean handlePinEntryGemini(Context context, String s, Activity activity, int i)
    {
        if ((s.startsWith("**04") || s.startsWith("**05")) && s.endsWith("#"))
        {
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            boolean flag = GeminiUtils.handlePinMmi(phoneglobals.phone, s, i);
            log((new StringBuilder()).append("SpecialCharSequenceMgr , handlePinEntryGemini(), simId:").append(i).append(", isMMIHandled:").append(flag).toString());
            if (flag && s.startsWith("**05*"))
                phoneglobals.setPukEntryActivity(activity);
            return flag;
        } else
        {
            return false;
        }
    }

    private static boolean handleSecretCode(Context context, String s)
    {
        int i = s.length();
        if (i > 8 && s.startsWith("*#*#") && s.endsWith("#*#*"))
        {
            context.sendBroadcast(new Intent("android.provider.Telephony.SECRET_CODE", Uri.parse((new StringBuilder()).append("android_secret_code://").append(s.substring(4, i - 4)).toString())));
            return true;
        } else
        {
            return false;
        }
    }

    private static void log(String s)
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("[SpecialCharSequenceMgr] ").append(s).toString());
    }

    private static void showDeviceIdPanel(Context context)
    {
        Phone phone = PhoneGlobals.getPhone();
        int i = TelephonyCapabilities.getDeviceIdLabel(phone);
        String s = phone.getDeviceId();
        AlertDialog alertdialog = (new android.app.AlertDialog.Builder(context)).setTitle(i).setMessage(s).setPositiveButton(0x7f0d0192, null).setCancelable(false).create();
        alertdialog.getWindow().setType(2007);
        alertdialog.show();
    }
}
