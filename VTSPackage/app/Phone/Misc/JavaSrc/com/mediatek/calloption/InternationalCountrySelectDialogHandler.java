// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.app.Dialog;
import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.*;
import com.android.i18n.phonenumbers.PhoneNumberUtil;
import com.mediatek.telephony.PhoneNumberUtilsEx;
import java.util.*;

public abstract class InternationalCountrySelectDialogHandler
    implements android.view.View.OnClickListener, android.widget.SearchView.OnQueryTextListener, android.widget.AdapterView.OnItemClickListener
{
    public static interface OnCountrySelectListener
    {

        public abstract void onCountrySelected(String s, String s1, String s2);
    }


    protected static final String MAP_KEY_NAME_COUNTRY_CODE = "CountryCode";
    protected static final String MAP_KEY_NAME_COUNTRY_ENGLISH_NAME = "CountryEnglisName";
    protected static final String MAP_KEY_NAME_COUNTRY_ISO = "CountryISO";
    protected static final String MAP_KEY_NAME_COUNTRY_NAME = "CountryName";
    private static final String TAG = "InternationalCountrySelectDialogHandler";
    protected Context mContext;
    protected List mCountryInfoMapList;
    protected ListView mCountryListView;
    protected OnCountrySelectListener mCountrySelectListener;
    protected ArrayList mDefaultCountryISOList;
    protected Dialog mDialog;
    protected View mDialogView;
    protected boolean mIsInflated;
    protected boolean mIsMoreButtonClicked;
    protected SimpleAdapter mListAdapter;
    protected Button mMoreButton;
    protected TextView mNoSearchResult;
    protected SearchView mSearchView;

    public InternationalCountrySelectDialogHandler(Context context, OnCountrySelectListener oncountryselectlistener)
    {
        mContext = context;
        mCountrySelectListener = oncountryselectlistener;
        mCountryInfoMapList = new ArrayList();
    }

    private void addDefaultCountryInfoToMapList(List list, ArrayList arraylist)
    {
        for (int i = 0; i < arraylist.size(); i++)
            if (!isSameMapItemExits(list, (String)arraylist.get(i)))
            {
                Locale locale = new Locale(Locale.getDefault().getLanguage(), (String)arraylist.get(i));
                HashMap hashmap = new HashMap();
                hashmap.put("CountryISO", arraylist.get(i));
                hashmap.put("CountryCode", (new StringBuilder()).append("+").append(String.valueOf(PhoneNumberUtil.getInstance().getCountryCodeForRegion((String)arraylist.get(i)))).toString());
                hashmap.put("CountryName", locale.getDisplayCountry(Locale.getDefault()));
                hashmap.put("CountryEnglisName", locale.getDisplayCountry(Locale.ENGLISH));
                list.add(hashmap);
            }

    }

    private void addSupportedCountryInfoToMapList(List list)
    {
        Map map = PhoneNumberUtilsEx.getCountryCodeToRegionCodeMap();
        for (Iterator iterator = map.keySet().iterator(); iterator.hasNext();)
        {
            Integer integer = (Integer)iterator.next();
            Iterator iterator1 = ((List)map.get(integer)).iterator();
            while (iterator1.hasNext()) 
            {
                String s = (String)iterator1.next();
                if (!isSameMapItemExits(list, s))
                {
                    Locale locale = new Locale(Locale.getDefault().getLanguage(), s);
                    HashMap hashmap = new HashMap();
                    hashmap.put("CountryISO", s);
                    hashmap.put("CountryCode", (new StringBuilder()).append("+").append(String.valueOf(integer)).toString());
                    hashmap.put("CountryName", locale.getDisplayCountry(Locale.getDefault()));
                    hashmap.put("CountryEnglisName", locale.getDisplayCountry(Locale.ENGLISH));
                    list.add(hashmap);
                }
            }
        }

    }

    private List getCountryInfoMapList(ArrayList arraylist, boolean flag)
    {
        ArrayList arraylist1 = new ArrayList();
        addDefaultCountryInfoToMapList(arraylist1, arraylist);
        if (!flag)
            addSupportedCountryInfoToMapList(arraylist1);
        return arraylist1;
    }

    private boolean isSameMapItemExits(List list, String s)
    {
        for (ListIterator listiterator = list.listIterator(); listiterator.hasNext();)
            if (((Map)listiterator.next()).get("CountryISO").equals(s))
                return true;

        return false;
    }

    private static void log(String s)
    {
        Log.d("InternationalCountrySelectDialogHandler", s);
    }

    private void searchCountryInfoFromMap(String s, List list, List list1)
    {
        Iterator iterator = list.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Map map = (Map)iterator.next();
            String s1 = (String)map.get("CountryName");
            String s2 = (String)map.get("CountryCode");
            String s3 = (String)map.get("CountryEnglisName");
            if (s1.toUpperCase().contains(s.toUpperCase()) || s3.toUpperCase().contains(s.toUpperCase()) || s2.contains(s))
            {
                HashMap hashmap = new HashMap();
                hashmap.put("CountryISO", map.get("CountryISO"));
                hashmap.put("CountryCode", s2);
                hashmap.put("CountryName", s1);
                hashmap.put("CountryEnglisName", s3);
                list1.add(hashmap);
            }
        } while (true);
    }

    public void dismissHandledDialog()
    {
        if (mDialog != null && mDialog.isShowing())
            mDialog.dismiss();
    }

    protected abstract void initDialogView();

    public void onClick(View view)
    {
        mIsMoreButtonClicked = true;
        view.setVisibility(8);
        addSupportedCountryInfoToMapList(mCountryInfoMapList);
        mListAdapter.notifyDataSetChanged();
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        Map map = (Map)adapterview.getItemAtPosition(i);
        mCountrySelectListener.onCountrySelected((String)map.get("CountryISO"), ((String)map.get("CountryCode")).substring(1), (String)map.get("CountryName"));
        if (mDialog != null)
            mDialog.dismiss();
    }

    public boolean onQueryTextChange(String s)
    {
        mCountryInfoMapList.removeAll(mCountryInfoMapList);
        if (!TextUtils.isEmpty(s))
        {
            ArrayList arraylist = new ArrayList();
            addDefaultCountryInfoToMapList(arraylist, mDefaultCountryISOList);
            addSupportedCountryInfoToMapList(arraylist);
            searchCountryInfoFromMap(s, arraylist, mCountryInfoMapList);
            mMoreButton.setVisibility(8);
        } else
        {
            addDefaultCountryInfoToMapList(mCountryInfoMapList, mDefaultCountryISOList);
            if (mIsMoreButtonClicked)
            {
                mMoreButton.setVisibility(8);
                addSupportedCountryInfoToMapList(mCountryInfoMapList);
            } else
            {
                mMoreButton.setVisibility(0);
            }
        }
        if (mCountryInfoMapList.size() == 0)
        {
            mNoSearchResult.setVisibility(0);
            mCountryListView.setVisibility(8);
        } else
        {
            mNoSearchResult.setVisibility(8);
            mCountryListView.setVisibility(0);
        }
        mListAdapter.notifyDataSetChanged();
        return false;
    }

    public boolean onQueryTextSubmit(String s)
    {
        return false;
    }

    public void showCountrySelectDialog(ArrayList arraylist)
    {
        mDefaultCountryISOList = arraylist;
        mCountryInfoMapList.removeAll(mCountryInfoMapList);
        addDefaultCountryInfoToMapList(mCountryInfoMapList, mDefaultCountryISOList);
        if (mIsInflated)
        {
            mMoreButton.setVisibility(0);
            mSearchView.setQuery("", false);
        } else
        {
            initDialogView();
            mIsInflated = true;
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
            builder.setView(mDialogView);
            mDialog = builder.create();
        }
        mSearchView.clearFocus();
        mNoSearchResult.setVisibility(8);
        mCountryListView.setVisibility(0);
        mDialog.show();
    }
}
