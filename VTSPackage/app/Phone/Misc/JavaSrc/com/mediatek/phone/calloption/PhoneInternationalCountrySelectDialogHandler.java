// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.mediatek.calloption.InternationalCountrySelectDialogHandler;

public class PhoneInternationalCountrySelectDialogHandler extends InternationalCountrySelectDialogHandler
{

    private static final String TAG = "PhoneInternationalCountrySelectDialogHandler";

    public PhoneInternationalCountrySelectDialogHandler(Context context, com.mediatek.calloption.InternationalCountrySelectDialogHandler.OnCountrySelectListener oncountryselectlistener)
    {
        super(context, oncountryselectlistener);
    }

    private static void log(String s)
    {
        Log.d("PhoneInternationalCountrySelectDialogHandler", s);
    }

    protected void initDialogView()
    {
        super.mDialogView = LayoutInflater.from(super.mContext).inflate(0x7f040020, null, false);
        ListView listview = (ListView)super.mDialogView.findViewById(0x7f080014);
        super.mListAdapter = new SimpleAdapter(super.mContext, super.mCountryInfoMapList, 0x7f040021, new String[] {
            "CountryName", "CountryCode"
        }, new int[] {
            0x7f080097, 0x7f080096
        });
        listview.setAdapter(super.mListAdapter);
        listview.setOnItemClickListener(this);
        super.mSearchView = (SearchView)super.mDialogView.findViewById(0x7f080093);
        super.mSearchView.setImeOptions(3);
        super.mSearchView.setIconifiedByDefault(true);
        super.mSearchView.setQueryHint(super.mContext.getString(0x104000c));
        super.mSearchView.setIconified(false);
        super.mSearchView.setOnQueryTextListener(this);
        super.mNoSearchResult = (TextView)super.mDialogView.findViewById(0x7f080094);
        super.mCountryListView = (ListView)super.mDialogView.findViewById(0x7f080014);
        super.mMoreButton = (Button)super.mDialogView.findViewById(0x7f080095);
        super.mMoreButton.setText(super.mContext.getString(0x104039b));
        super.mMoreButton.setOnClickListener(this);
    }
}
