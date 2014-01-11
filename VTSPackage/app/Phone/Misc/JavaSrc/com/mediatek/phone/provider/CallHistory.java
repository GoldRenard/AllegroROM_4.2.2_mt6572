// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.provider;

import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.provider.BaseColumns;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;
import android.util.Log;
import com.android.i18n.phonenumbers.PhoneNumberUtil;
import com.mediatek.calloption.CallOptionUtils;
import com.mediatek.telephony.PhoneNumberUtilsEx;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// Referenced classes of package com.mediatek.phone.provider:
//            SelectionBuilder

public class CallHistory
{
    public static class Calls
        implements BaseColumns
    {

        public static final String AREA_CODE = "area_code";
        private static final String AREA_CODE_PROJECTION[] = {
            "area_code"
        };
        private static final int CALL_HISTORY_MAX_COUNT = 1000;
        private static final String CALL_INFO_PROJECTION[] = {
            "country_iso", "area_code", "confirm"
        };
        public static final String CONFIRM = "confirm";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/calls";
        public static final Uri CONTENT_URI_CALLS = Uri.parse("content://call_history/calls");
        public static final String COUNTRY_ISO = "country_iso";
        private static final String COUNTRY_ISO_PROJECTION[] = {
            "country_iso"
        };
        public static final String DATE = "date";
        public static final String DEFAULT_SORT_ORDER = "date DESC";
        public static final String NUMBER = "number";

        public static void addCallNumber(Context context, String s, String s1, long l, int i, boolean flag)
        {
            CallHistory.log((new StringBuilder()).append("addCallNumber(), number = ").append(s).append(", currentCountryISO = ").append(s1).append(", slotId = ").append(i).append(", isMultiSim = ").append(flag).toString());
            String s2 = CallOptionUtils.queryIPPrefix(context, i, flag);
            if (!TextUtils.isEmpty(s2) && !s.equals(s2) && s.startsWith(s2))
                s = s.replaceFirst(s2, "");
            com.mediatek.calloption.CallOptionUtils.NumberInfo numberinfo = CallOptionUtils.getNumberInfo(s, s1);
            String s3 = s1;
            if (numberinfo == null)
            {
                CallHistory.log("addCallNumber(), numberInfo is null");
                addCallNumberInternal(context, s, s3, "", l);
            } else
            {
                if (!TextUtils.isEmpty(numberinfo.mCountryCode))
                {
                    s3 = PhoneNumberUtil.getInstance().getRegionCodeForCountryCode(Integer.valueOf(numberinfo.mCountryCode).intValue());
                    CallHistory.log((new StringBuilder()).append("addCallNumber(), numberInfo.mCountryCode is NOT empty, countryISO = ").append(s3).toString());
                }
                addCallNumberInternal(context, numberinfo.mSubscriber, s3, numberinfo.mAreaCode, l);
                if (!TextUtils.isEmpty(numberinfo.mAreaCode))
                    addCallNumberInternal(context, (new StringBuilder()).append(numberinfo.mAreaCodePrefix).append(numberinfo.mAreaCode).append(numberinfo.mSubscriber).toString(), s3, "", l);
                String s4 = PhoneNumberUtilsEx.getInternationalPrefix(s1);
                if (!TextUtils.isEmpty(s4))
                {
                    Matcher matcher = Pattern.compile(s4).matcher(s);
                    if (!matcher.matches() && matcher.lookingAt())
                    {
                        addCallNumberInternal(context, s, s1, "", l);
                        return;
                    }
                }
            }
        }

        private static void addCallNumberInternal(Context context, String s, String s1, String s2, long l)
        {
            ContentResolver contentresolver = context.getContentResolver();
            CallInfo callinfo = getCallInfo(context, s);
            if (callinfo != null)
            {
                long l1 = callinfo.mConfirm;
                if (1L == l1 && callinfo.mCountryISO.equals(s1))
                {
                    CallHistory.log("addCallNumber(), set confirm from 1 to 0");
                    l1 = 0L;
                }
                ContentValues contentvalues1 = new ContentValues(4);
                contentvalues1.put("country_iso", s1);
                if (!TextUtils.isEmpty(s2))
                    contentvalues1.put("area_code", s2);
                contentvalues1.put("date", Long.valueOf(l));
                contentvalues1.put("confirm", Long.valueOf(l1));
                CallHistory.log((new StringBuilder()).append("addCallNumber(), country iso = ").append(s1).append(", area code = ").append(s2).append(", confirm = ").append(l1).toString());
                SelectionBuilder selectionbuilder = new SelectionBuilder((new StringBuilder()).append("number = '").append(s).append("'").toString());
                contentresolver.update(CONTENT_URI_CALLS, contentvalues1, selectionbuilder.build(), null);
                return;
            }
            ContentValues contentvalues = new ContentValues(5);
            contentvalues.put("number", s);
            contentvalues.put("country_iso", s1);
            if (!TextUtils.isEmpty(s2))
                contentvalues.put("area_code", s2);
            contentvalues.put("date", Long.valueOf(l));
            contentvalues.put("confirm", Long.valueOf(1L));
            contentresolver.insert(CONTENT_URI_CALLS, contentvalues);
            removeExpiredEntries(context);
        }

        public static int deleteNumber(Context context, String s)
        {
            ContentResolver contentresolver = context.getContentResolver();
            String s1 = (new StringBuilder()).append("number = '").append(s).append("'").toString();
            CallInfo callinfo = getCallInfo(context, s);
            if (callinfo != null && !TextUtils.isEmpty(callinfo.mCountryISO))
            {
                com.mediatek.calloption.CallOptionUtils.NumberInfo numberinfo = CallOptionUtils.getNumberInfo(s, callinfo.mCountryISO);
                if (numberinfo != null)
                {
                    s1 = (new StringBuilder()).append(s1).append(" OR number = '").append(numberinfo.mSubscriber).append("'").toString();
                    if (!TextUtils.isEmpty(numberinfo.mAreaCode))
                        s1 = (new StringBuilder()).append(s1).append(" OR number = '").append(numberinfo.mAreaCodePrefix).append(numberinfo.mAreaCode).append(numberinfo.mSubscriber).append("'").toString();
                }
            }
            return contentresolver.delete(CONTENT_URI_CALLS, s1, null);
        }

        public static Cursor getAllCountryISO(Context context)
        {
            Cursor cursor = context.getContentResolver().query(CONTENT_URI_CALLS, COUNTRY_ISO_PROJECTION, null, null, "date");
            if (cursor == null)
            {
                CallHistory.log("cursor is null...");
                return null;
            } else
            {
                return cursor;
            }
        }

        public static CallInfo getCallInfo(Context context, String s)
        {
            String s1 = PhoneNumberUtils.stripSeparators(s);
            SelectionBuilder selectionbuilder = new SelectionBuilder((new StringBuilder()).append("number = '").append(s1).append("'").toString());
            CallHistory.log((new StringBuilder()).append("select builder = ").append(selectionbuilder.build()).toString());
            Cursor cursor = context.getContentResolver().query(CONTENT_URI_CALLS, CALL_INFO_PROJECTION, selectionbuilder.build(), null, "date DESC");
            if (cursor == null)
            {
                CallHistory.log("cursor is null...");
                return null;
            }
            if (cursor.getCount() <= 0)
            {
                CallHistory.log((new StringBuilder()).append("cursor count is ").append(cursor.getCount()).toString());
                cursor.close();
                return null;
            }
            cursor.moveToFirst();
            if (!TextUtils.isEmpty(cursor.getString(0)) && cursor.getLong(2) >= 0L)
            {
                CallInfo callinfo = new CallInfo(cursor.getString(0), cursor.getString(1), cursor.getLong(2));
                cursor.close();
                return callinfo;
            } else
            {
                CallHistory.log("country code is empty or count < 0");
                cursor.close();
                return null;
            }
        }

        public static String getLatestAreaCode(Context context, String s)
        {
            SelectionBuilder selectionbuilder = new SelectionBuilder((new StringBuilder()).append("country_iso = '").append(s).append("'").toString());
            selectionbuilder.addClause("area_code IS NOT NULL");
            Cursor cursor = context.getContentResolver().query(CONTENT_URI_CALLS, AREA_CODE_PROJECTION, selectionbuilder.build(), null, "date DESC LIMIT 1");
            if (cursor == null)
            {
                CallHistory.log("cursor is null...");
                return null;
            }
            if (cursor.getCount() == 0)
            {
                CallHistory.log("cursor count is 0");
                cursor.close();
                return null;
            } else
            {
                cursor.moveToFirst();
                String s1 = cursor.getString(0);
                cursor.close();
                return s1;
            }
        }

        private static void removeExpiredEntries(Context context)
        {
            context.getContentResolver().delete(CONTENT_URI_CALLS, "_id IN (SELECT _id FROM calls ORDER BY date DESC LIMIT -1 OFFSET 1000)", null);
        }

        public static int updateConfirmFlag(Context context, String s, long l)
        {
            ContentResolver contentresolver = context.getContentResolver();
            ContentValues contentvalues = new ContentValues(1);
            contentvalues.put("confirm", Long.valueOf(l));
            SelectionBuilder selectionbuilder = new SelectionBuilder((new StringBuilder()).append("number = '").append(s).append("'").toString());
            return contentresolver.update(CONTENT_URI_CALLS, contentvalues, selectionbuilder.build(), null);
        }


    }

    public static final class Calls.CallInfo
    {

        public final String mAreaCode;
        public final long mConfirm;
        public final String mCountryISO;

        public Calls.CallInfo(String s, String s1, long l)
        {
            mCountryISO = s;
            mAreaCode = s1;
            mConfirm = l;
        }
    }


    public static final String AUTHORITY = "call_history";
    public static final Uri CONTENT_URI = Uri.parse("content://call_history");
    private static final String TAG = "CallHistory";


    private static void log(String s)
    {
        Log.d("CallHistory", s);
    }


}
