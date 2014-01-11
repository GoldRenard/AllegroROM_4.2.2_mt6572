// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.quicklaunch;

import android.content.Context;
import android.content.res.ColorStateList;
import android.preference.Preference;
import android.util.TypedValue;
import android.view.View;
import android.widget.TextView;

public class ShortcutPreference extends Preference
    implements Comparable
{

    private static String STRING_ASSIGN_APPLICATION;
    private static String STRING_NO_SHORTCUT;
    private static int sDimAlpha;
    private static ColorStateList sDimSummaryColor;
    private static ColorStateList sDimTitleColor;
    private static ColorStateList sRegularSummaryColor;
    private static ColorStateList sRegularTitleColor;
    private static Object sStaticVarsLock = new Object();
    private boolean mHasBookmark;
    private char mShortcut;

    public ShortcutPreference(Context context, char c)
    {
        super(context);
        synchronized (sStaticVarsLock)
        {
            if (STRING_ASSIGN_APPLICATION == null)
            {
                STRING_ASSIGN_APPLICATION = context.getString(0x7f0b06ed);
                STRING_NO_SHORTCUT = context.getString(0x7f0b06ee);
                TypedValue typedvalue = new TypedValue();
                context.getTheme().resolveAttribute(0x1010033, typedvalue, true);
                sDimAlpha = (int)(255F * typedvalue.getFloat());
            }
        }
        mShortcut = c;
        setWidgetLayoutResource(0x7f040079);
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int compareTo(Preference preference)
    {
        if (!(preference instanceof ShortcutPreference))
            return super.compareTo(preference);
        char c = ((ShortcutPreference)preference).mShortcut;
        if (Character.isDigit(mShortcut) && Character.isLetter(c))
            return 1;
        if (Character.isDigit(c) && Character.isLetter(mShortcut))
            return -1;
        else
            return mShortcut - c;
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((Preference)obj);
    }

    public char getShortcut()
    {
        return mShortcut;
    }

    public CharSequence getSummary()
    {
        if (mHasBookmark)
            return super.getSummary();
        else
            return STRING_NO_SHORTCUT;
    }

    public CharSequence getTitle()
    {
        if (mHasBookmark)
            return super.getTitle();
        else
            return STRING_ASSIGN_APPLICATION;
    }

    public boolean hasBookmark()
    {
        return mHasBookmark;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        TextView textview = (TextView)view.findViewById(0x7f08012d);
        if (textview != null)
            textview.setText(String.valueOf(mShortcut));
        TextView textview1 = (TextView)view.findViewById(0x1020016);
        synchronized (sStaticVarsLock)
        {
            if (sRegularTitleColor == null)
            {
                sRegularTitleColor = textview1.getTextColors();
                sDimTitleColor = sRegularTitleColor.withAlpha(sDimAlpha);
            }
        }
        ColorStateList colorstatelist;
        TextView textview2;
        ColorStateList colorstatelist1;
        if (mHasBookmark)
            colorstatelist = sRegularTitleColor;
        else
            colorstatelist = sDimTitleColor;
        if (colorstatelist != null)
            textview1.setTextColor(colorstatelist);
        textview2 = (TextView)view.findViewById(0x1020010);
        synchronized (sStaticVarsLock)
        {
            if (sRegularSummaryColor == null)
            {
                sRegularSummaryColor = textview2.getTextColors();
                sDimSummaryColor = sRegularSummaryColor.withAlpha(sDimAlpha);
            }
        }
        if (mHasBookmark)
            colorstatelist1 = sRegularSummaryColor;
        else
            colorstatelist1 = sDimSummaryColor;
        if (colorstatelist1 != null)
            textview2.setTextColor(colorstatelist1);
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    public void setHasBookmark(boolean flag)
    {
        if (flag != mHasBookmark)
        {
            mHasBookmark = flag;
            notifyChanged();
        }
    }

    public void setShortcut(char c)
    {
        if (c != mShortcut)
        {
            mShortcut = c;
            notifyChanged();
        }
    }

}
