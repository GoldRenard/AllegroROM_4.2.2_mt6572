// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.app.AlarmManager;
import android.app.ListActivity;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.view.*;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import com.mediatek.xlog.Xlog;
import java.io.IOException;
import java.util.*;
import org.xmlpull.v1.XmlPullParserException;

public class ZoneList extends ListActivity
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
            Object obj = hashmap.get(mSortingKey);
            Object obj1 = hashmap1.get(mSortingKey);
            if (!isComparable(obj))
                return !isComparable(obj1) ? 0 : 1;
            if (!isComparable(obj1))
                return -1;
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


    private static final int HOURS_1 = 0x36ee80;
    private static final int HOURS_24 = 0x5265c00;
    private static final int HOURS_HALF = 0x1b7740;
    private static final String KEY_DISPLAYNAME = "name";
    private static final String KEY_GMT = "gmt";
    private static final String KEY_ID = "id";
    private static final String KEY_OFFSET = "offset";
    private static final int MENU_ALPHABETICAL = 1;
    private static final int MENU_TIMEZONE = 2;
    private static final String TAG = "ZoneList";
    private static final String XMLTAG_TIMEZONE = "timezone";
    private SimpleAdapter mAlphabeticalAdapter;
    private int mDefault;
    private boolean mSortedByTimezone;
    private SimpleAdapter mTimezoneSortedAdapter;


    private List getZones()
    {
        ArrayList arraylist;
        long l;
        arraylist = new ArrayList();
        l = Calendar.getInstance().getTimeInMillis();
        XmlResourceParser xmlresourceparser;
        for (xmlresourceparser = getResources().getXml(0x7f050009); xmlresourceparser.next() != 2;);
        xmlresourceparser.next();
_L1:
        if (xmlresourceparser.getEventType() == 3)
            break MISSING_BLOCK_LABEL_184;
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
                Xlog.e("ZoneList", "Ill-formatted timezones.xml file");
                return arraylist;
            }
            catch (IOException ioexception)
            {
                Xlog.e("ZoneList", "Unable to read timezones.xml file");
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

    private void setSorting(boolean flag)
    {
        SimpleAdapter simpleadapter;
        if (flag)
            simpleadapter = mTimezoneSortedAdapter;
        else
            simpleadapter = mAlphabeticalAdapter;
        setListAdapter(simpleadapter);
        mSortedByTimezone = flag;
    }

    protected void addItem(List list, String s, String s1, long l)
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
        if (s.equals(TimeZone.getDefault().getID()))
            mDefault = list.size();
        list.add(hashmap);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        String as[] = {
            "name", "gmt"
        };
        int ai[] = {
            0x1020014, 0x1020015
        };
        MyComparator mycomparator = new MyComparator("offset");
        List list = getZones();
        Collections.sort(list, mycomparator);
        mTimezoneSortedAdapter = new SimpleAdapter(this, list, 0x1090004, as, ai);
        ArrayList arraylist = new ArrayList(list);
        mycomparator.setSortingKey("name");
        Collections.sort(arraylist, mycomparator);
        mAlphabeticalAdapter = new SimpleAdapter(this, arraylist, 0x1090004, as, ai);
        setSorting(true);
        setSelection(mDefault);
        setResult(0);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        menu.add(0, 1, 0, 0x7f09002d).setIcon(0x108009c);
        menu.add(0, 2, 0, 0x7f09002e).setIcon(0x7f020014);
        return true;
    }

    protected void onListItemClick(ListView listview, View view, int i, long l)
    {
        Map map = (Map)listview.getItemAtPosition(i);
        ((AlarmManager)getSystemService("alarm")).setTimeZone((String)map.get("id"));
        setResult(-1);
        finish();
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

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        if (mSortedByTimezone)
        {
            menu.findItem(2).setVisible(false);
            menu.findItem(1).setVisible(true);
            return true;
        } else
        {
            menu.findItem(2).setVisible(true);
            menu.findItem(1).setVisible(false);
            return true;
        }
    }
}
