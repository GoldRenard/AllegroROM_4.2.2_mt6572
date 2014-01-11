// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.app.Dialog;
import android.content.*;
import android.database.Cursor;
import android.os.RemoteException;
import android.telephony.PhoneNumberUtils;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import com.android.i18n.phonenumbers.PhoneNumberUtil;
import com.android.internal.telephony.ITelephony;
import com.mediatek.phone.GeminiConstants;
import com.mediatek.phone.SIMInfoWrapper;
import com.mediatek.phone.provider.CallHistoryAsync;
import com.mediatek.telephony.PhoneNumberUtilsEx;
import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, CallOptionUtils, Request, InternationalDialogHandler

public abstract class InternationalCallOptionHandler extends CallOptionBaseHandler
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener, android.content.DialogInterface.OnCancelListener
{

    private static final String COUNTRY_ISO_CHINA = "CN";
    private static final String COUNTRY_ISO_TAIWAN = "TW";
    private static final String COUNTRY_ISO_USA = "US";
    private static final String INTERNATIONAL_DIALING_PREFERENCE_KEY = "international_dialing_key";
    private static final String TAG = "InternationalCallOptionHandler";
    protected InternationalDialogHandler mDialogHandler;
    private Request mRequest;


    private void addValidCountryISOFromCallHistory(Context context, String s, ArrayList arraylist, boolean flag, String s1)
    {
        Cursor cursor = com.mediatek.phone.provider.CallHistory.Calls.getAllCountryISO(context);
        if (cursor == null) goto _L2; else goto _L1
_L1:
        cursor.moveToFirst();
_L7:
        if (cursor.isAfterLast()) goto _L4; else goto _L3
_L3:
        String s2;
        s2 = cursor.getString(0);
        if (!TextUtils.isEmpty(s1) && s1.equals(s2) || !CallOptionUtils.isValidNumberForCountryISO(context, s, s2))
            continue; /* Loop/switch isn't completed */
        if (!flag) goto _L6; else goto _L5
_L5:
        arraylist.add(s2);
        cursor.close();
_L2:
        return;
_L6:
        if (!arraylist.contains(s2))
            arraylist.add(s2);
        cursor.moveToNext();
          goto _L7
_L4:
        cursor.close();
        return;
    }

    private ArrayList findValidCountryISO(Context context, String s, String s1, String s2, boolean flag)
    {
        ArrayList arraylist = new ArrayList();
        if (!TextUtils.isEmpty(s1) && CallOptionUtils.isValidNumberForCountryISO(context, s, s1))
        {
            arraylist.add(s1);
            if (flag)
                return arraylist;
        }
        String s3 = CallOptionUtils.getCurrentCountryISO(context);
        if ((TextUtils.isEmpty(s2) || !s2.equals(s3)) && CallOptionUtils.isValidNumberForCountryISO(context, s, s3))
        {
            if (flag)
            {
                arraylist.add(s3);
                return arraylist;
            }
            if (!arraylist.contains(s3))
                arraylist.add(s3);
        }
        TelephonyManager telephonymanager = TelephonyManager.getDefault();
        if (mRequest.isMultipleSim())
        {
            int ai[] = GeminiConstants.SLOTS;
            int i = ai.length;
            for (int j = 0; j < i; j++)
            {
                String s5 = telephonymanager.getSimCountryIsoGemini(ai[j]).toUpperCase();
                if (!TextUtils.isEmpty(s5) && (TextUtils.isEmpty(s2) || !s2.equals(s5)) && CallOptionUtils.isValidNumberForCountryISO(context, s, s5))
                {
                    if (flag)
                    {
                        arraylist.add(s5);
                        return arraylist;
                    }
                    if (!arraylist.contains(s5))
                        arraylist.add(s5);
                }
            }

        } else
        {
            String s4 = telephonymanager.getSimCountryIso().toUpperCase();
            if (!TextUtils.isEmpty(s4) && (TextUtils.isEmpty(s2) || !s2.equals(s4)) && CallOptionUtils.isValidNumberForCountryISO(context, s, s4))
            {
                if (flag)
                {
                    arraylist.add(s4);
                    return arraylist;
                }
                if (!arraylist.contains(s4))
                    arraylist.add(s4);
            }
        }
        addValidCountryISOFromCallHistory(context, s, arraylist, flag, s2);
        return arraylist;
    }

    private String findValidCountryISOFromDefaultCountry(Context context, String s)
    {
        String s1 = "";
        if (!CallOptionUtils.getCurrentCountryISO(context).equals("CN") && CallOptionUtils.isValidNumberForCountryISO(context, s, "CN"))
        {
            s1 = "CN";
        } else
        {
            if (!CallOptionUtils.getCurrentCountryISO(context).equals("TW") && CallOptionUtils.isValidNumberForCountryISO(context, s, "TW"))
                return "TW";
            if (!CallOptionUtils.getCurrentCountryISO(context).equals("US") && CallOptionUtils.isValidNumberForCountryISO(context, s, "US"))
                return "US";
        }
        return s1;
    }

    private static void log(String s)
    {
        Log.d("InternationalCallOptionHandler", s);
    }

    public void dismissDialog()
    {
        log("dismissDialog()");
        if (mDialogHandler != null)
            mDialogHandler.onHandledDialogDismiss();
        super.dismissDialog();
    }

    public void handleRequest(Request request)
    {
        String s;
        int i;
        int j;
        log("handleRequest()");
        mRequest = request;
        s = CallOptionUtils.getInitialNumber(request.getApplicationContext(), request.getIntent());
        i = android.provider.Settings.System.getInt(request.getApplicationContext().getContentResolver(), "international_dialing_key", 0);
        log((new StringBuilder()).append("internationalDialingSetting = ").append(i).toString());
        j = request.getIntent().getIntExtra("com.android.phone.extra.international", 0);
        log((new StringBuilder()).append("internationalDialOption = ").append(j).toString());
        if (!TextUtils.isEmpty(s) && !s.startsWith("+") && !s.endsWith("#") && !request.getIntent().getBooleanExtra("com.android.phone.extra.ip", false) && 2 != j && (1 == i || 1 == j) && SIMInfoWrapper.getDefault().getInsertedSimCount() != 0 && !PhoneNumberUtils.isEmergencyNumber(s)) goto _L2; else goto _L1
_L1:
        log("number beging with + or international dialing setting is off or some other conditions, dial directly");
        if (super.mSuccessor != null)
            super.mSuccessor.handleRequest(request);
_L6:
        return;
_L2:
        boolean flag1 = request.getTelephonyInterface().isOffhook();
        boolean flag = flag1;
_L4:
        if (!flag)
            break; /* Loop/switch isn't completed */
        log("is offhook");
        if (6 != PhoneNumberUtilsEx.isValidNumber(CallOptionUtils.getCurrentCountryISO(request.getActivityContext()), s))
            break; /* Loop/switch isn't completed */
        log("current phone state is offhook and number is valid when call exists, so call directly");
        if (super.mSuccessor != null)
        {
            super.mSuccessor.handleRequest(request);
            return;
        }
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        log("Remote exception happen when call ITelephony::isOffhook()");
        flag = false;
        if (true) goto _L4; else goto _L3
_L3:
        String s1;
        com.mediatek.phone.provider.CallHistory.Calls.CallInfo callinfo;
        s1 = CallOptionUtils.getCurrentCountryISO(request.getApplicationContext());
        log((new StringBuilder()).append("CallHistory getCallInfo start, number2 = ").append(s).toString());
        callinfo = com.mediatek.phone.provider.CallHistory.Calls.getCallInfo(request.getApplicationContext(), s);
        if (1 == j || callinfo == null)
            break; /* Loop/switch isn't completed */
        log("CallHistory getCallInfo end, get same call history!");
        log((new StringBuilder()).append("number = ").append(s).append(", number2 = ").append(s).append(", country iso = ").append(callinfo.mCountryISO).append(",").append(" area code = ").append(callinfo.mAreaCode).append(", confirm = ").append(callinfo.mConfirm).toString());
        String s10 = callinfo.mCountryISO;
        String s11 = callinfo.mAreaCode;
        long l = callinfo.mConfirm;
        if (s10.equals(s1))
        {
            log("find same call history, and call history's country iso is same as current one, dial directly");
            if (super.mSuccessor != null)
            {
                super.mSuccessor.handleRequest(request);
                return;
            }
        } else
        {
            log("The current country ISO is different with recorded one");
            String s12 = PhoneNumberUtilsEx.getInternationalPrefix(s10);
            Matcher matcher = Pattern.compile(s12).matcher(s);
            if (!matcher.matches() && matcher.lookingAt())
            {
                log("The dialed number starts with recorded country ISO's international prefix");
                if (!PhoneNumberUtilsEx.getInternationalPrefix(s1).equals(s12))
                {
                    log("Current country ISO's international prefix is different with that of recorded one");
                    String s20 = matcher.replaceFirst("+");
                    if (1L == l && !request.getIntent().getBooleanExtra("com.android.phone.extra.forbid_dialog", false))
                    {
                        log("confirm is 1, pop up internation prefix confirm dialog");
                        Locale locale2 = new Locale(Locale.getDefault().getLanguage(), s1);
                        InternationalDialogHandler.PrefixInfo prefixinfo8 = new InternationalDialogHandler.PrefixInfo(null, locale2.getDisplayCountry(Locale.getDefault()), s10, s1, null, null, false, s, s20, null, null, null);
                        showDialog(request.getActivityContext(), 0, j, prefixinfo8, this, this, this);
                        (new CallHistoryAsync()).updateConfirmFlag(new com.mediatek.phone.provider.CallHistoryAsync.UpdateConfirmFlagArgs(request.getApplicationContext(), s, 0L));
                        return;
                    }
                    request.getIntent().putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", s20);
                }
                log("Current country ISO's international prefix is same as that of recorded one, dial directly");
                if (super.mSuccessor != null)
                {
                    super.mSuccessor.handleRequest(request);
                    return;
                }
            } else
            {
                log((new StringBuilder()).append("number2 = ").append(s).append(", countryISORecorded = ").append(s10).toString());
                if (1L == l && !request.getIntent().getBooleanExtra("com.android.phone.extra.forbid_dialog", false))
                {
                    log("confirm == 1, show confirm dialog");
                    Locale locale1 = new Locale(Locale.getDefault().getLanguage(), s10);
                    String s14 = String.valueOf(PhoneNumberUtil.getInstance().getCountryCodeForRegion(s10));
                    String s15 = locale1.getDisplayCountry(Locale.getDefault());
                    CallOptionUtils.NumberInfo numberinfo1 = CallOptionUtils.getNumberInfo(s, s10);
                    if (!PhoneNumberUtilsEx.isAreaCodeNeeded(s10, s))
                    {
                        log("The number with recorded country prefix can be dialed directly, pop up country single select dialog");
                        InternationalDialogHandler.PrefixInfo prefixinfo7 = new InternationalDialogHandler.PrefixInfo(s14, s15, s10, s1, numberinfo1.mAreaCode, null, false, s, null, numberinfo1.mSubscriber, numberinfo1.mAreaCodePrefix, null);
                        showDialog(request.getActivityContext(), 2, j, prefixinfo7, this, this, this);
                        return;
                    }
                    if (!TextUtils.isEmpty(s11))
                    {
                        log("area code recorded is not empty");
                        String s19 = CallOptionUtils.getCityGeoDescription((new StringBuilder()).append(s11).append(s).toString(), s10, locale1);
                        InternationalDialogHandler.PrefixInfo prefixinfo6 = new InternationalDialogHandler.PrefixInfo(s14, s15, s10, s1, s11, s19, false, s, null, s, numberinfo1.mAreaCodePrefix, null);
                        showDialog(request.getActivityContext(), 1, j, prefixinfo6, this, this, this);
                        return;
                    }
                    log("area code recorded is empty");
                    if (numberinfo1 != null && !TextUtils.isEmpty(numberinfo1.mAreaCode))
                    {
                        log("The number already has area code");
                        String s18 = CallOptionUtils.getCityGeoDescription(s, s10, locale1);
                        log((new StringBuilder()).append("area name is ").append(s18).toString());
                        InternationalDialogHandler.PrefixInfo prefixinfo5 = new InternationalDialogHandler.PrefixInfo(s14, s15, s10, s1, numberinfo1.mAreaCode, s18, false, s, null, numberinfo1.mSubscriber, null, null);
                        showDialog(request.getActivityContext(), 1, j, prefixinfo5, this, this, this);
                        return;
                    }
                    log("The number do not include area code");
                    String s16 = com.mediatek.phone.provider.CallHistory.Calls.getLatestAreaCode(mRequest.getApplicationContext(), s10);
                    if (!TextUtils.isEmpty(s16))
                    {
                        log("can get latest area code from other recorded number");
                        String s17 = CallOptionUtils.getCityGeoDescription((new StringBuilder()).append(s16).append(s).toString(), s10, locale1);
                        InternationalDialogHandler.PrefixInfo prefixinfo4 = new InternationalDialogHandler.PrefixInfo(s14, s15, s10, s1, s16, s17, true, s, null, numberinfo1.mSubscriber, numberinfo1.mAreaCodePrefix, null);
                        showDialog(request.getActivityContext(), 7, j, prefixinfo4, this, this, this);
                        return;
                    } else
                    {
                        log("can NOT get latest area code from other recorded number");
                        InternationalDialogHandler.PrefixInfo prefixinfo3 = new InternationalDialogHandler.PrefixInfo(s14, s15, s10, s1, null, null, true, s, null, numberinfo1.mSubscriber, numberinfo1.mAreaCodePrefix, null);
                        showDialog(request.getActivityContext(), 6, j, prefixinfo3, this, this, this);
                        return;
                    }
                }
                String s13 = PhoneNumberUtils.formatNumberToE164((new StringBuilder()).append(s11).append(s).toString(), s10);
                if (s13 == null)
                    request.getIntent().putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", s);
                else
                    request.getIntent().putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", s13);
                if (super.mSuccessor != null)
                {
                    super.mSuccessor.handleRequest(request);
                    return;
                }
            }
        }
        if (true) goto _L6; else goto _L5
_L5:
        String s2;
        String s3;
        ArrayList arraylist;
        String s4;
        log("CallHistory getCallInfo end, do not find same call history!");
        s2 = "";
        s3 = "";
        if (1 == j)
        {
            if (callinfo != null)
                s2 = callinfo.mCountryISO;
            s3 = s1;
        }
        arraylist = findValidCountryISO(request.getApplicationContext(), s, s2, s3, true);
        if (arraylist == null || arraylist.isEmpty())
            s4 = "";
        else
            s4 = (String)arraylist.get(0);
        if (1 == j)
            break MISSING_BLOCK_LABEL_1462;
        if (TextUtils.isEmpty(s4))
        {
            log("can not find valid country iso, show invalid number dialog");
            showInvalidNumberDialog(request.getActivityContext(), this, this, this);
            return;
        }
        if (!s1.equals(s4))
            break; /* Loop/switch isn't completed */
        log("The number is valid for current country ISO, dial directly");
        if (super.mSuccessor != null)
        {
            super.mSuccessor.handleRequest(request);
            return;
        }
        if (true) goto _L6; else goto _L7
_L7:
        log("The number is NOT valid for current country ISO");
        CallOptionUtils.NumberInfo numberinfo;
        Locale locale;
        String s5;
        String s6;
        if (1 == j && TextUtils.isEmpty(s4))
        {
            log("can not find valid country iso, set default country ISO");
            String s9 = findValidCountryISOFromDefaultCountry(request.getApplicationContext(), s);
            InternationalDialogHandler.PrefixInfo prefixinfo2;
            if (TextUtils.isEmpty(s9))
            {
                log("default valid country ISO is null");
            } else
            {
                arraylist.add(s9);
                s4 = s9;
            }
        } else
        {
            arraylist = findValidCountryISO(request.getApplicationContext(), s, s2, s3, false);
        }
        numberinfo = CallOptionUtils.getNumberInfo(s, s4);
        log((new StringBuilder()).append("valid country ISO = ").append(s4).toString());
        log((new StringBuilder()).append("number info = ").append(numberinfo).toString());
        locale = new Locale(Locale.getDefault().getLanguage(), s4);
        s5 = String.valueOf(PhoneNumberUtil.getInstance().getCountryCodeForRegion(s4));
        s6 = locale.getDisplayCountry(Locale.getDefault());
        if (!PhoneNumberUtilsEx.isAreaCodeNeeded(s4, s))
        {
            log("the number can be dialed directly, just show dialog for country selection");
            prefixinfo2 = new InternationalDialogHandler.PrefixInfo(s5, s6, s4, s1, numberinfo.mAreaCode, null, false, s, null, numberinfo.mSubscriber, numberinfo.mAreaCodePrefix, arraylist);
            showDialog(request.getActivityContext(), 3, j, prefixinfo2, this, this, this);
            return;
        }
        String s7 = com.mediatek.phone.provider.CallHistory.Calls.getLatestAreaCode(mRequest.getApplicationContext(), s4);
        log((new StringBuilder()).append("latest area code = ").append(s7).toString());
        if (!TextUtils.isEmpty(s7))
        {
            log("can get latest area code from records");
            String s8 = CallOptionUtils.getCityGeoDescription((new StringBuilder()).append(s7).append(s).toString(), s4, locale);
            InternationalDialogHandler.PrefixInfo prefixinfo1 = new InternationalDialogHandler.PrefixInfo(s5, s6, s4, s1, s7, s8, true, s, null, s, numberinfo.mAreaCodePrefix, arraylist);
            showDialog(request.getActivityContext(), 5, j, prefixinfo1, this, this, this);
            return;
        } else
        {
            log("can NOT get latest area code from records");
            InternationalDialogHandler.PrefixInfo prefixinfo = new InternationalDialogHandler.PrefixInfo(s5, s6, s4, s1, null, null, true, s, null, s, numberinfo.mAreaCodePrefix, arraylist);
            showDialog(request.getActivityContext(), 4, j, prefixinfo, this, this, this);
            return;
        }
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        log("onCancel()");
        mRequest.getResultHandler().onHandlingFinish();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            if (mDialogHandler == null)
            {
                if (super.mSuccessor != null)
                    super.mSuccessor.handleRequest(mRequest);
            } else
            {
                String s = mDialogHandler.getSelectResult();
                if (s != null)
                {
                    String s1 = CallOptionUtils.getInitialNumber(mRequest.getApplicationContext(), mRequest.getIntent());
                    if (PhoneNumberUtils.stripSeparators(s1).equals(PhoneNumberUtils.stripSeparators(s)))
                        (new CallHistoryAsync()).deleteCall(new com.mediatek.phone.provider.CallHistoryAsync.DeleteCallArgs(mRequest.getApplicationContext(), s1));
                    else
                        mRequest.getIntent().putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", s);
                } else
                {
                    log("no select from alert dialog, something wrong");
                }
                if (super.mSuccessor != null)
                {
                    super.mSuccessor.handleRequest(mRequest);
                    return;
                }
            }
        } else
        if (i == -2)
        {
            super.mDialog.cancel();
            return;
        }
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        log("onDismiss()");
    }

    protected abstract void showDialog(Context context, int i, int j, InternationalDialogHandler.PrefixInfo prefixinfo, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener);

    protected abstract void showInvalidNumberDialog(Context context, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener);
}
