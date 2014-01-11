// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.database.Cursor;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.provider.BaseColumns;
import android.util.Log;
import java.text.DateFormatSymbols;
import java.util.*;

public final class Alarm
    implements Parcelable
{
    public static class Columns
        implements BaseColumns
    {

        public static final int ALARM_ALERT_INDEX = 8;
        public static final int ALARM_DAYS_OF_WEEK_INDEX = 3;
        public static final int ALARM_ENABLED_INDEX = 5;
        public static final int ALARM_HOUR_INDEX = 1;
        public static final int ALARM_ID_INDEX = 0;
        public static final int ALARM_MESSAGE_INDEX = 7;
        public static final int ALARM_MINUTES_INDEX = 2;
        static final String ALARM_QUERY_COLUMNS[] = {
            "_id", "hour", "minutes", "daysofweek", "alarmtime", "enabled", "vibrate", "message", "alert"
        };
        public static final String ALARM_TIME = "alarmtime";
        public static final int ALARM_TIME_INDEX = 4;
        public static final int ALARM_VIBRATE_INDEX = 6;
        public static final String ALERT = "alert";
        public static final Uri CONTENT_URI = Uri.parse("content://com.android.deskclock/alarm");
        public static final String DAYS_OF_WEEK = "daysofweek";
        public static final String DEFAULT_SORT_ORDER = "hour, minutes ASC, _id DESC";
        public static final String ENABLED = "enabled";
        public static final String HOUR = "hour";
        public static final String MESSAGE = "message";
        public static final String MINUTES = "minutes";
        public static final String VIBRATE = "vibrate";
        public static final String WHERE_ENABLED = "enabled=1";


    }

    static final class DaysOfWeek
    {

        private static int DAY_MAP[] = {
            2, 3, 4, 5, 6, 7, 1
        };
        private static HashMap DAY_TO_BIT_MASK;
        private int mDays;

        private boolean isSet(int i)
        {
            return (mDays & 1 << i) > 0;
        }

        private String toString(Context context, boolean flag, boolean flag1)
        {
            StringBuilder stringbuilder = new StringBuilder();
            if (mDays == 0)
                if (flag)
                    return context.getText(0x20500fc).toString();
                else
                    return "";
            if (mDays == 127)
                return context.getText(0x20500fb).toString();
            int i = 0;
            for (int j = mDays; j > 0; j >>= 1)
                if ((j & 1) == 1)
                    i++;

            DateFormatSymbols dateformatsymbols = new DateFormatSymbols();
            String as[];
            if (!flag1 && i > 1)
                as = dateformatsymbols.getShortWeekdays();
            else
                as = dateformatsymbols.getWeekdays();
            for (int k = 0; k < 7; k++)
            {
                if ((mDays & 1 << k) == 0)
                    continue;
                stringbuilder.append(as[DAY_MAP[k]]);
                if (--i > 0)
                    stringbuilder.append(context.getText(0x20500fd));
            }

            return stringbuilder.toString();
        }

        public boolean[] getBooleanArray()
        {
            boolean aflag[] = new boolean[7];
            for (int i = 0; i < 7; i++)
                aflag[i] = isSet(i);

            return aflag;
        }

        public int getCoded()
        {
            return mDays;
        }

        public int getNextAlarm(Calendar calendar)
        {
            int j;
            if (mDays == 0)
            {
                j = -1;
            } else
            {
                int i = (5 + calendar.get(7)) % 7;
                for (j = 0; j < 7 && !isSet((i + j) % 7); j++);
            }
            return j;
        }

        public HashSet getSetDays()
        {
            HashSet hashset = new HashSet();
            for (int i = 0; i < 7; i++)
                if (isSet(i))
                    hashset.add(Integer.valueOf(DAY_MAP[i]));

            return hashset;
        }

        public boolean isRepeatSet()
        {
            return mDays != 0;
        }

        public void set(int i, boolean flag)
        {
            if (flag)
            {
                mDays = mDays | 1 << i;
                return;
            } else
            {
                mDays = mDays & (-1 ^ 1 << i);
                return;
            }
        }

        public void set(DaysOfWeek daysofweek)
        {
            mDays = daysofweek.mDays;
        }

        public void setDayOfWeek(int i, boolean flag)
        {
            set(((Integer)DAY_TO_BIT_MASK.get(Integer.valueOf(i))).intValue(), flag);
        }

        public String toAccessibilityString(Context context)
        {
            return toString(context, false, true);
        }

        public String toString()
        {
            return (new StringBuilder()).append("DaysOfWeek{mDays=").append(mDays).append('}').toString();
        }

        public String toString(Context context, boolean flag)
        {
            return toString(context, flag, false);
        }

        static 
        {
            DAY_TO_BIT_MASK = new HashMap();
            for (int i = 0; i < DAY_MAP.length; i++)
                DAY_TO_BIT_MASK.put(Integer.valueOf(DAY_MAP[i]), Integer.valueOf(i));

        }

        DaysOfWeek(int i)
        {
            mDays = i;
        }
    }


    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public Alarm createFromParcel(Parcel parcel)
        {
            return new Alarm(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public Alarm[] newArray(int i)
        {
            return new Alarm[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final String TAG = "PowerOffAlarm";
    public Uri alert;
    public DaysOfWeek daysOfWeek;
    public boolean enabled;
    public int hour;
    public int id;
    public String label;
    public int minutes;
    public boolean silent;
    public long time;
    public boolean vibrate;

    public Alarm()
    {
        id = -1;
        hour = 0;
        minutes = 0;
        vibrate = true;
        daysOfWeek = new DaysOfWeek(0);
        label = "";
        alert = RingtoneManager.getDefaultUri(4);
    }

    public Alarm(Cursor cursor)
    {
        id = cursor.getInt(0);
        boolean flag;
        if (cursor.getInt(5) == 1)
            flag = true;
        else
            flag = false;
        enabled = flag;
        hour = cursor.getInt(1);
        minutes = cursor.getInt(2);
        daysOfWeek = new DaysOfWeek(cursor.getInt(3));
        time = cursor.getLong(4);
        int i = cursor.getInt(6);
        boolean flag1 = false;
        if (i == 1)
            flag1 = true;
        vibrate = flag1;
        label = cursor.getString(7);
        String s = cursor.getString(8);
        if ("silent".equals(s))
        {
            Log.v("PowerOffAlarm", "Alarm is marked as silent");
            silent = true;
        } else
        {
            if (s != null && s.length() != 0)
                alert = Uri.parse(s);
            if (alert == null)
            {
                alert = RingtoneManager.getDefaultUri(4);
                return;
            }
        }
    }

    public Alarm(Parcel parcel)
    {
        boolean flag = true;
        super();
        id = parcel.readInt();
        boolean flag1;
        if (parcel.readInt() == flag)
            flag1 = flag;
        else
            flag1 = false;
        enabled = flag1;
        hour = parcel.readInt();
        minutes = parcel.readInt();
        daysOfWeek = new DaysOfWeek(parcel.readInt());
        time = parcel.readLong();
        boolean flag2;
        if (parcel.readInt() == flag)
            flag2 = flag;
        else
            flag2 = false;
        vibrate = flag2;
        label = parcel.readString();
        alert = (Uri)parcel.readParcelable(null);
        if (parcel.readInt() != flag)
            flag = false;
        silent = flag;
    }

    public int describeContents()
    {
        return 0;
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof Alarm)
        {
            Alarm alarm = (Alarm)obj;
            if (id == alarm.id)
                return true;
        }
        return false;
    }

    public String getLabelOrDefault(Context context)
    {
        if (label != null && label.length() != 0)
            return label;
        else
            return context.getString(0x20500fe);
    }

    public int hashCode()
    {
        return id;
    }

    public String toString()
    {
        return (new StringBuilder()).append("Alarm{alert=").append(alert).append(", id=").append(id).append(", enabled=").append(enabled).append(", hour=").append(hour).append(", minutes=").append(minutes).append(", daysOfWeek=").append(daysOfWeek).append(", time=").append(time).append(", vibrate=").append(vibrate).append(", label='").append(label).append('\'').append(", silent=").append(silent).append('}').toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        int j = 1;
        parcel.writeInt(id);
        int k;
        if (enabled)
            k = j;
        else
            k = 0;
        parcel.writeInt(k);
        parcel.writeInt(hour);
        parcel.writeInt(minutes);
        parcel.writeInt(daysOfWeek.getCoded());
        parcel.writeLong(time);
        int l;
        if (vibrate)
            l = j;
        else
            l = 0;
        parcel.writeInt(l);
        parcel.writeString(label);
        parcel.writeParcelable(alert, i);
        if (!silent)
            j = 0;
        parcel.writeInt(j);
    }

}
