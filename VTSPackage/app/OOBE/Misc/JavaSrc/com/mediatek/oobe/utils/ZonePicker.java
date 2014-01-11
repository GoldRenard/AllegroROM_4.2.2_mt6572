// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.app.*;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.util.Log;
import android.view.*;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import com.mediatek.xlog.Xlog;
import java.io.IOException;
import java.text.CollationKey;
import java.text.Collator;
import java.util.*;
import org.xmlpull.v1.XmlPullParserException;

public class ZonePicker extends ListFragment
{
    private static class MyComparator
        implements Comparator
    {

        private String mSortingKey;

        private boolean isComparable(Object obj)
        {
            return obj != null && (obj instanceof Comparable);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((HashMap)obj, (HashMap)obj1);
        }

        public int compare(HashMap hashmap, HashMap hashmap1)
        {
            Collator collator = Collator.getInstance();
            Object obj = hashmap.get(mSortingKey);
            Object obj1 = hashmap1.get(mSortingKey);
            if (!isComparable(obj))
                return !isComparable(obj1) ? 0 : 1;
            if (!isComparable(obj1))
                return -1;
            CollationKey collationkey = collator.getCollationKey(obj.toString());
            CollationKey collationkey1 = collator.getCollationKey(obj1.toString());
            if ("name".equals(mSortingKey))
                return collationkey.compareTo(collationkey1);
            else
                return ((Comparable)obj).compareTo(obj1);
        }

        public void setSortingKey(String s)
        {
            mSortingKey = s;
        }

        public MyComparator(String s)
        {
            mSortingKey = s;
        }
    }

    public static interface ZoneSelectionListener
    {

        public abstract void onZoneSelected(TimeZone timezone);
    }


    private static final int HOURS_1 = 0x36ee80;
    private static final String KEY_DISPLAYNAME = "name";
    private static final String KEY_GMT = "gmt";
    private static final String KEY_ID = "id";
    private static final String KEY_OFFSET = "offset";
    private static final int MENU_ALPHABETICAL = 1;
    private static final int MENU_TIMEZONE = 2;
    private static final String TAG = "ZonePicker";
    private static final String XMLTAG_TIMEZONE = "timezone";
    private SimpleAdapter mAlphabeticalAdapter;
    private ZoneSelectionListener mListener;
    private boolean mSortedByTimezone;
    private SimpleAdapter mTimezoneSortedAdapter;


    private static void addItem(List list, String s, String s1, long l)
    {
        HashMap hashmap = new HashMap();
        hashmap.put("id", s);
        hashmap.put("name", s1);
        int i = TimeZone.getTimeZone(s).getOffset(l);
        int j = Math.abs(i);
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("GMT");
        if (i < 0)
            stringbuilder.append('-');
        else
            stringbuilder.append('+');
        stringbuilder.append(j / 0x36ee80);
        stringbuilder.append(':');
        int k = (j / 60000) % 60;
        if (k < 10)
            stringbuilder.append('0');
        stringbuilder.append(k);
        hashmap.put("gmt", stringbuilder.toString());
        hashmap.put("offset", Integer.valueOf(i));
        list.add(hashmap);
    }

    public static SimpleAdapter constructTimezoneAdapter(Context context, boolean flag)
    {
        return constructTimezoneAdapter(context, flag, 0x7f03001d);
    }

    public static SimpleAdapter constructTimezoneAdapter(Context context, boolean flag, int i)
    {
        String as[] = {
            "name", "gmt"
        };
        int ai[] = {
            0x1020014, 0x1020015
        };
        String s;
        if (flag)
            s = "name";
        else
            s = "offset";
        MyComparator mycomparator = new MyComparator(s);
        List list = getZones(context);
        Collections.sort(list, mycomparator);
        return new SimpleAdapter(context, list, i, as, ai);
    }

    public static int getTimeZoneIndex(SimpleAdapter simpleadapter, TimeZone timezone)
    {
        String s = timezone.getID();
        int i = simpleadapter.getCount();
        for (int j = 0; j < i; j++)
            if (s.equals((String)((HashMap)simpleadapter.getItem(j)).get("id")))
                return j;

        return -1;
    }

    private static List getZones(Context context)
    {
        ArrayList arraylist;
        long l;
        arraylist = new ArrayList();
        l = Calendar.getInstance().getTimeInMillis();
        XmlResourceParser xmlresourceparser;
        for (xmlresourceparser = context.getResources().getXml(0x7f050009); xmlresourceparser.next() != 2;);
        xmlresourceparser.next();
_L1:
        if (xmlresourceparser.getEventType() == 3)
            break MISSING_BLOCK_LABEL_183;
        while (xmlresourceparser.getEventType() != 2) 
        {
            if (xmlresourceparser.getEventType() == 1)
                return arraylist;
            try
            {
                xmlresourceparser.next();
            }
            catch (XmlPullParserException xmlpullparserexception)
            {
                Log.e("ZonePicker", "Ill-formatted timezones.xml file");
                return arraylist;
            }
            catch (IOException ioexception)
            {
                Log.e("ZonePicker", "Unable to read timezones.xml file");
                return arraylist;
            }
        }
        if (xmlresourceparser.getName().equals("timezone"))
            addItem(arraylist, xmlresourceparser.getAttributeValue(0), xmlresourceparser.nextText(), l);
        for (; xmlresourceparser.getEventType() != 3; xmlresourceparser.next());
        xmlresourceparser.next();
          goto _L1
        xmlresourceparser.close();
        return arraylist;
    }

    public static TimeZone obtainTimeZoneFromItem(Object obj)
    {
        return TimeZone.getTimeZone((String)((Map)obj).get("id"));
    }

    private void setSorting(boolean flag)
    {
        SimpleAdapter simpleadapter;
        if (flag)
            simpleadapter = mTimezoneSortedAdapter;
        else
            simpleadapter = mAlphabeticalAdapter;
        setListAdapter(simpleadapter);
        mSortedByTimezone = flag;
        int i = getTimeZoneIndex(simpleadapter, TimeZone.getDefault());
        if (i >= 0)
            setSelection(i);
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Xlog.d("ZonePicker", "ZonePicker onActivityCreated");
        Activity activity = getActivity();
        mTimezoneSortedAdapter = constructTimezoneAdapter(activity, false);
        mAlphabeticalAdapter = constructTimezoneAdapter(activity, true);
        setSorting(true);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 1, 0, 0x7f09002d).setIcon(0x108009c);
        menu.add(0, 2, 0, 0x7f09002e).setIcon(0x7f020014);
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        String s = (String)((Map)listview.getItemAtPosition(i)).get("id");
        ((AlarmManager)getActivity().getSystemService("alarm")).setTimeZone(s);
        TimeZone timezone = TimeZone.getTimeZone(s);
        if (mListener != null)
        {
            mListener.onZoneSelected(timezone);
            return;
        } else
        {
            getActivity().onBackPressed();
            return;
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 1: // '\001'
            setSorting(false);
            return true;

        case 2: // '\002'
            setSorting(true);
            return true;
        }
        return false;
    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        if (mSortedByTimezone)
        {
            menu.findItem(2).setVisible(false);
            menu.findItem(1).setVisible(true);
            return;
        } else
        {
            menu.findItem(2).setVisible(true);
            menu.findItem(1).setVisible(false);
            return;
        }
    }

    public void setZoneSelectionListener(ZoneSelectionListener zoneselectionlistener)
    {
        mListener = zoneselectionlistener;
    }
}
