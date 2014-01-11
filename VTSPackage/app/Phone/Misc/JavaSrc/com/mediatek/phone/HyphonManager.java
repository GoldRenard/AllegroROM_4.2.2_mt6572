// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.Context;
import android.location.*;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import java.util.HashMap;

public final class HyphonManager
    implements CountryListener
{

    private static final boolean DBG = true;
    private static final String TAG = "HyphonManager";
    private static HyphonManager sMe;
    private Context mContext;
    private String mCurrentCountryIso;
    private HashMap mHyphonMaps;

    private HyphonManager()
    {
        log("HyphonManager()");
        mHyphonMaps = new HashMap();
    }

    private String detectCountry(boolean flag)
    {
        CountryDetector countrydetector = (CountryDetector)mContext.getSystemService("country_detector");
        if (flag)
            countrydetector.addCountryListener(this, null);
        Country country = countrydetector.detectCountry();
        String s = null;
        if (country != null)
        {
            log((new StringBuilder()).append("detect country, iso = ").append(country.getCountryIso()).append(" source = ").append(country.getSource()).toString());
            s = country.getCountryIso();
        }
        return s;
    }

    public static HyphonManager getInstance()
    {
        if (sMe == null)
            sMe = new HyphonManager();
        return sMe;
    }

    private static void log(String s)
    {
        Log.d("HyphonManager", s);
    }

    public String formatNumber(String s)
    {
        String s1 = null;
        if (s != null)
        {
            if (mContext == null)
            {
                log("formatNumber(), mContext is null, just return null");
                return null;
            }
            if (mCurrentCountryIso == null)
                mCurrentCountryIso = detectCountry(false);
            s1 = (String)mHyphonMaps.get(s);
            if (s1 == null)
            {
                String s2 = PhoneNumberUtils.formatNumber(s, mCurrentCountryIso);
                if (s2 != null)
                {
                    mHyphonMaps.put(s, s2);
                    return s2;
                } else
                {
                    return s;
                }
            }
        }
        return s1;
    }

    public void init(Context context)
    {
        mContext = context;
        mCurrentCountryIso = detectCountry(true);
    }

    public void onCountryDetected(Country country)
    {
        log((new StringBuilder()).append("onCountryDetected, country = ").append(country).toString());
        log((new StringBuilder()).append("mCurrentCountryIso = ").append(mCurrentCountryIso).append(", countryIso = ").append(country.getCountryIso()).toString());
        if (mCurrentCountryIso == null || !mCurrentCountryIso.equals(country.getCountryIso()))
        {
            mCurrentCountryIso = country.getCountryIso();
            mHyphonMaps.clear();
        }
    }

    public void onDestroy()
    {
        if (mContext != null)
            ((CountryDetector)mContext.getSystemService("country_detector")).removeCountryListener(this);
    }
}
