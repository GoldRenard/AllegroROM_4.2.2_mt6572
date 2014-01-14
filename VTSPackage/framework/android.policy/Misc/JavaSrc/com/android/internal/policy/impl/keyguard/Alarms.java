// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.os.Parcel;
import android.text.format.DateFormat;
import android.util.Log;
import java.text.SimpleDateFormat;
import java.util.*;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            Alarm

public class Alarms
{

    public static final String ALARM_ALERT_ACTION = "com.android.deskclock.ALARM_ALERT";
    public static final String ALARM_ALERT_SILENT = "silent";
    public static final String ALARM_DISMISS_ACTION = "com.android.deskclock.ALARM_DISMISS";
    public static final String ALARM_DONE_ACTION = "com.android.deskclock.ALARM_DONE";
    public static final String ALARM_INTENT_EXTRA = "intent.extra.alarm";
    public static final String ALARM_KILLED = "alarm_killed";
    public static final String ALARM_KILLED_TIMEOUT = "alarm_killed_timeout";
    public static final String ALARM_RAW_DATA = "intent.extra.alarm_raw";
    public static final String ALARM_SNOOZE_ACTION = "com.android.deskclock.ALARM_SNOOZE";
    public static final String ALARM_SNOOZE_CANCELLED = "com.android.deskclock.ALARM_SNOOZE_CANCELLED";
    public static final String CANCEL_SNOOZE = "cancel_snooze";
    private static final String DM12 = "E h:mm aa";
    private static final String DM24 = "E kk:mm";
    static final int INVALID_ALARM_ID = -1;
    private static final String M12 = "h:mm aa";
    static final String M24 = "kk:mm";
    public static final String NEXT_ALARM_TIME_SET = "com.android.deskclock.NEXT_ALARM_TIME_SET";
    static final String PREFERENCES = "AlarmClock";
    private static final String PREF_SNOOZE_IDS = "snooze_ids";
    private static final String PREF_SNOOZE_TIME = "snooze_time";
    private static final String TAG = "PowerOffAlarm";


    public static long addAlarm(Context context, Alarm alarm)
    {
        ContentValues contentvalues = createContentValues(alarm);
        alarm.id = (int)ContentUris.parseId(context.getContentResolver().insert(Alarm.Columns.CONTENT_URI, contentvalues));
        long l = calculateAlarm(alarm);
        if (alarm.enabled)
            clearSnoozeIfNeeded(context, l);
        setNextAlert(context);
        return l;
    }

    private static long calculateAlarm(Alarm alarm)
    {
        return calculateAlarm(alarm.hour, alarm.minutes, alarm.daysOfWeek).getTimeInMillis();
    }

    static Calendar calculateAlarm(int i, int j, Alarm.DaysOfWeek daysofweek)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        int k = calendar.get(11);
        int l = calendar.get(12);
        if (i < k || i == k && j <= l)
            calendar.add(6, 1);
        calendar.set(11, i);
        calendar.set(12, j);
        calendar.set(13, 0);
        calendar.set(14, 0);
        int i1 = daysofweek.getNextAlarm(calendar);
        if (i1 > 0)
            calendar.add(7, i1);
        return calendar;
    }

    private static Alarm calculateNextAlert(Context context)
    {
        long l;
        long l1;
        SharedPreferences sharedpreferences;
        HashSet hashset;
        Cursor cursor;
        l = 0x7fffffffffffffffL;
        l1 = System.currentTimeMillis();
        sharedpreferences = context.getSharedPreferences("AlarmClock", 0);
        hashset = new HashSet();
        int i;
        for (Iterator iterator = sharedpreferences.getStringSet("snooze_ids", new HashSet()).iterator(); iterator.hasNext(); hashset.add(getAlarm(context.getContentResolver(), i)))
            i = Integer.parseInt((String)iterator.next());

        cursor = getFilteredAlarmsCursor(context.getContentResolver());
        if (cursor == null)
            break MISSING_BLOCK_LABEL_156;
        boolean flag;
        if (cursor.moveToFirst())
            do
            {
                hashset.add(new Alarm(cursor));
                flag = cursor.moveToNext();
            } while (flag);
        cursor.close();
        Alarm alarm;
        Iterator iterator1;
        alarm = null;
        iterator1 = hashset.iterator();
_L2:
        if (!iterator1.hasNext())
            break; /* Loop/switch isn't completed */
        Alarm alarm1 = (Alarm)iterator1.next();
        if (alarm1.time == 0L)
            alarm1.time = calculateAlarm(alarm1);
        updateAlarmTimeForSnooze(sharedpreferences, alarm1);
        Exception exception;
        if (alarm1.time < l1)
        {
            Log.v("PowerOffAlarm", (new StringBuilder()).append("Disabling expired alarm set for ").append(formatTime(alarm1.time)).toString());
            enableAlarmInternal(context, alarm1, false);
        } else
        if (alarm1.time < l)
        {
            l = alarm1.time;
            alarm = alarm1;
        }
        continue; /* Loop/switch isn't completed */
        exception;
        cursor.close();
        throw exception;
        if (true) goto _L2; else goto _L1
_L1:
        return alarm;
    }

    private static void clearAllSnoozePreferences(Context context, SharedPreferences sharedpreferences)
    {
        NotificationManager notificationmanager = (NotificationManager)context.getSystemService("notification");
        Set set = sharedpreferences.getStringSet("snooze_ids", new HashSet());
        android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
        String s;
        for (Iterator iterator = set.iterator(); iterator.hasNext(); editor.remove(getAlarmPrefSnoozeTimeKey(s)))
        {
            s = (String)iterator.next();
            notificationmanager.cancel(Integer.parseInt(s));
        }

        editor.remove("snooze_ids");
        editor.apply();
    }

    private static void clearSnoozeIfNeeded(Context context, long l)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("AlarmClock", 0);
        Iterator iterator = sharedpreferences.getStringSet("snooze_ids", new HashSet()).iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            String s = (String)iterator.next();
            if (l < sharedpreferences.getLong(getAlarmPrefSnoozeTimeKey(s), 0L))
                clearSnoozePreference(context, sharedpreferences, Integer.parseInt(s));
        } while (true);
    }

    private static void clearSnoozePreference(Context context, SharedPreferences sharedpreferences, int i)
    {
        String s = Integer.toString(i);
        Set set = sharedpreferences.getStringSet("snooze_ids", new HashSet());
        if (set.contains(s))
            ((NotificationManager)context.getSystemService("notification")).cancel(i);
        android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
        set.remove(s);
        editor.putStringSet("snooze_ids", set);
        editor.remove(getAlarmPrefSnoozeTimeKey(s));
        editor.apply();
    }

    private static ContentValues createContentValues(Alarm alarm)
    {
        ContentValues contentvalues = new ContentValues(8);
        long l = 0L;
        if (!alarm.daysOfWeek.isRepeatSet())
            l = calculateAlarm(alarm);
        if (alarm.id != -1)
            contentvalues.put("_id", Integer.valueOf(alarm.id));
        int i;
        if (alarm.enabled)
            i = 1;
        else
            i = 0;
        contentvalues.put("enabled", Integer.valueOf(i));
        contentvalues.put("hour", Integer.valueOf(alarm.hour));
        contentvalues.put("minutes", Integer.valueOf(alarm.minutes));
        contentvalues.put("alarmtime", Long.valueOf(l));
        contentvalues.put("daysofweek", Integer.valueOf(alarm.daysOfWeek.getCoded()));
        contentvalues.put("vibrate", Boolean.valueOf(alarm.vibrate));
        contentvalues.put("message", alarm.label);
        String s;
        if (alarm.alert == null)
            s = "silent";
        else
            s = alarm.alert.toString();
        contentvalues.put("alert", s);
        return contentvalues;
    }

    public static void deleteAlarm(Context context, int i)
    {
        if (i == -1)
        {
            return;
        } else
        {
            ContentResolver contentresolver = context.getContentResolver();
            disableSnoozeAlert(context, i);
            contentresolver.delete(ContentUris.withAppendedId(Alarm.Columns.CONTENT_URI, i), "", null);
            setNextAlert(context);
            return;
        }
    }

    static void disableAlert(Context context)
    {
        ((AlarmManager)context.getSystemService("alarm")).cancel(PendingIntent.getBroadcast(context, 0, new Intent("com.android.deskclock.ALARM_ALERT"), 0x10000000));
        setStatusBarIcon(context, false);
        saveNextAlarm(context, "");
    }

    public static void disableExpiredAlarms(Context context)
    {
        Cursor cursor;
        long l;
        cursor = getFilteredAlarmsCursor(context.getContentResolver());
        l = System.currentTimeMillis();
        boolean flag;
        if (cursor.moveToFirst())
            do
            {
                Alarm alarm = new Alarm(cursor);
                if (alarm.time != 0L && alarm.time < l)
                {
                    Log.v("PowerOffAlarm", (new StringBuilder()).append("Disabling expired alarm set for ").append(formatTime(alarm.time)).toString());
                    enableAlarmInternal(context, alarm, false);
                }
                flag = cursor.moveToNext();
            } while (flag);
        cursor.close();
        return;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    static void disableSnoozeAlert(Context context, int i)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("AlarmClock", 0);
        if (hasAlarmBeenSnoozed(sharedpreferences, i))
            clearSnoozePreference(context, sharedpreferences, i);
    }

    public static void enableAlarm(Context context, int i, boolean flag)
    {
        enableAlarmInternal(context, i, flag);
        setNextAlert(context);
    }

    private static void enableAlarmInternal(Context context, int i, boolean flag)
    {
        enableAlarmInternal(context, getAlarm(context.getContentResolver(), i), flag);
    }

    private static void enableAlarmInternal(Context context, Alarm alarm, boolean flag)
    {
        if (alarm == null)
            return;
        ContentResolver contentresolver = context.getContentResolver();
        ContentValues contentvalues = new ContentValues(2);
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        contentvalues.put("enabled", Integer.valueOf(i));
        if (flag)
        {
            long l = 0L;
            if (!alarm.daysOfWeek.isRepeatSet())
                l = calculateAlarm(alarm);
            contentvalues.put("alarmtime", Long.valueOf(l));
        } else
        {
            disableSnoozeAlert(context, alarm.id);
        }
        contentresolver.update(ContentUris.withAppendedId(Alarm.Columns.CONTENT_URI, alarm.id), contentvalues, null, null);
    }

    private static void enableAlert(Context context, Alarm alarm, long l)
    {
        AlarmManager alarmmanager = (AlarmManager)context.getSystemService("alarm");
        Log.v("PowerOffAlarm", (new StringBuilder()).append("** setAlert id ").append(alarm.id).append(" atTime ").append(l).toString());
        Intent intent = new Intent("com.android.deskclock.ALARM_ALERT");
        Parcel parcel = Parcel.obtain();
        alarm.writeToParcel(parcel, 0);
        parcel.setDataPosition(0);
        intent.putExtra("intent.extra.alarm_raw", parcel.marshall());
        alarmmanager.set(0, l, PendingIntent.getBroadcast(context, 0, intent, 0x10000000));
        setStatusBarIcon(context, true);
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(l);
        saveNextAlarm(context, formatDayAndTime(context, calendar));
    }

    private static String formatDayAndTime(Context context, Calendar calendar)
    {
        String s;
        if (get24HourMode(context))
            s = "E kk:mm";
        else
            s = "E h:mm aa";
        if (calendar == null)
            return "";
        else
            return (String)DateFormat.format(s, calendar);
    }

    public static String formatTime(long l)
    {
        return (new SimpleDateFormat("HH:mm:ss.SSS aaa")).format(new Date(l));
    }

    static String formatTime(Context context, int i, int j, Alarm.DaysOfWeek daysofweek)
    {
        return formatTime(context, calculateAlarm(i, j, daysofweek));
    }

    static String formatTime(Context context, Calendar calendar)
    {
        String s;
        if (get24HourMode(context))
            s = "kk:mm";
        else
            s = "h:mm aa";
        if (calendar == null)
            return "";
        else
            return (String)DateFormat.format(s, calendar);
    }

    public static boolean get24HourMode(Context context)
    {
        return DateFormat.is24HourFormat(context);
    }

    public static Alarm getAlarm(ContentResolver contentresolver, int i)
    {
        Cursor cursor = contentresolver.query(ContentUris.withAppendedId(Alarm.Columns.CONTENT_URI, i), Alarm.Columns.ALARM_QUERY_COLUMNS, null, null, null);
        Alarm alarm = null;
        if (cursor != null)
        {
            boolean flag = cursor.moveToFirst();
            alarm = null;
            if (flag)
                alarm = new Alarm(cursor);
            cursor.close();
        }
        return alarm;
    }

    private static String getAlarmPrefSnoozeTimeKey(int i)
    {
        return getAlarmPrefSnoozeTimeKey(Integer.toString(i));
    }

    private static String getAlarmPrefSnoozeTimeKey(String s)
    {
        return (new StringBuilder()).append("snooze_time").append(s).toString();
    }

    public static Cursor getAlarmsCursor(ContentResolver contentresolver)
    {
        return contentresolver.query(Alarm.Columns.CONTENT_URI, Alarm.Columns.ALARM_QUERY_COLUMNS, null, null, "hour, minutes ASC, _id DESC");
    }

    public static CursorLoader getAlarmsCursorLoader(Context context)
    {
        return new CursorLoader(context, Alarm.Columns.CONTENT_URI, Alarm.Columns.ALARM_QUERY_COLUMNS, null, null, "hour, minutes ASC, _id DESC");
    }

    private static Cursor getFilteredAlarmsCursor(ContentResolver contentresolver)
    {
        return contentresolver.query(Alarm.Columns.CONTENT_URI, Alarm.Columns.ALARM_QUERY_COLUMNS, "enabled=1", null, null);
    }

    private static boolean hasAlarmBeenSnoozed(SharedPreferences sharedpreferences, int i)
    {
        Set set = sharedpreferences.getStringSet("snooze_ids", null);
        return set != null && set.contains(Integer.toString(i));
    }

    static void saveNextAlarm(Context context, String s)
    {
        android.provider.Settings.System.putString(context.getContentResolver(), "next_alarm_formatted", s);
    }

    static void saveSnoozeAlert(Context context, int i, long l)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("AlarmClock", 0);
        if (i == -1)
        {
            clearAllSnoozePreferences(context, sharedpreferences);
        } else
        {
            Set set = sharedpreferences.getStringSet("snooze_ids", new HashSet());
            set.add(Integer.toString(i));
            android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
            editor.putStringSet("snooze_ids", set);
            editor.putLong(getAlarmPrefSnoozeTimeKey(i), l);
            editor.apply();
        }
        setNextAlert(context);
    }

    public static long setAlarm(Context context, Alarm alarm)
    {
        ContentValues contentvalues = createContentValues(alarm);
        long l = context.getContentResolver().update(ContentUris.withAppendedId(Alarm.Columns.CONTENT_URI, alarm.id), contentvalues, null, null);
        if (l < 1L)
        {
            Log.e("PowerOffAlarm", (new StringBuilder()).append("Error updating alarm ").append(alarm).toString());
            return l;
        }
        long l1 = calculateAlarm(alarm);
        if (alarm.enabled)
        {
            disableSnoozeAlert(context, alarm.id);
            clearSnoozeIfNeeded(context, l1);
        }
        setNextAlert(context);
        return l1;
    }

    public static void setNextAlert(Context context)
    {
        Alarm alarm = calculateNextAlert(context);
        if (alarm != null)
            enableAlert(context, alarm, alarm.time);
        else
            disableAlert(context);
        context.sendBroadcast(new Intent("com.android.deskclock.NEXT_ALARM_TIME_SET"));
    }

    private static void setStatusBarIcon(Context context, boolean flag)
    {
        Intent intent = new Intent("android.intent.action.ALARM_CHANGED");
        intent.putExtra("alarmSet", flag);
        context.sendBroadcast(intent);
    }

    private static boolean updateAlarmTimeForSnooze(SharedPreferences sharedpreferences, Alarm alarm)
    {
        if (!hasAlarmBeenSnoozed(sharedpreferences, alarm.id))
        {
            return false;
        } else
        {
            alarm.time = sharedpreferences.getLong(getAlarmPrefSnoozeTimeKey(alarm.id), -1L);
            return true;
        }
    }
}
