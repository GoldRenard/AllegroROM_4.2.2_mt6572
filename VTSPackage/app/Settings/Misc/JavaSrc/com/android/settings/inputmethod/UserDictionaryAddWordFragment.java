// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.app.Fragment;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import com.mediatek.xlog.Xlog;
import java.util.Locale;

// Referenced classes of package com.android.settings.inputmethod:
//            UserDictionaryAddWordContents, UserDictionaryLocalePicker

public class UserDictionaryAddWordFragment extends Fragment
    implements android.widget.AdapterView.OnItemSelectedListener, com.android.internal.app.LocalePicker.LocaleSelectionListener
{

    private static final int OPTIONS_MENU_DELETE = 1;
    private UserDictionaryAddWordContents mContents;
    private InputMethodManager mImm;
    private boolean mIsDeleting;
    private View mRootView;

    public UserDictionaryAddWordFragment()
    {
        mIsDeleting = false;
    }

    private void updateSpinner()
    {
        java.util.ArrayList arraylist = mContents.getLocalesList(getActivity());
        Spinner spinner = (Spinner)mRootView.findViewById(0x7f0801a5);
        ArrayAdapter arrayadapter = new ArrayAdapter(getActivity(), 0x1090008, arraylist);
        arrayadapter.setDropDownViewResource(0x1090009);
        spinner.setAdapter(arrayadapter);
        spinner.setOnItemSelectedListener(this);
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        setHasOptionsMenu(true);
        getActivity();
        mImm = (InputMethodManager)getActivity().getSystemService("input_method");
        StringBuilder stringbuilder = (new StringBuilder()).append("onActivityCreated input manager ");
        String s;
        if (mImm == null)
            s = "is";
        else
            s = "is not";
        Xlog.d("InputMethod", stringbuilder.append(s).append(" null").toString());
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 1, 0, 0x7f0b0857).setIcon(0x108003c).setShowAsAction(5);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mRootView = layoutinflater.inflate(0x7f040099, null);
        mIsDeleting = false;
        if (mContents == null)
            mContents = new UserDictionaryAddWordContents(mRootView, getArguments());
        return mRootView;
    }

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        UserDictionaryAddWordContents.LocaleRenderer localerenderer = (UserDictionaryAddWordContents.LocaleRenderer)adapterview.getItemAtPosition(i);
        if (localerenderer.isMoreLanguages())
        {
            ((PreferenceActivity)getActivity()).startPreferenceFragment(new UserDictionaryLocalePicker(this), true);
            return;
        } else
        {
            mContents.updateLocale(localerenderer.getLocaleString());
            return;
        }
    }

    public void onLocaleSelected(Locale locale)
    {
        mContents.updateLocale(locale.toString());
        getActivity().onBackPressed();
    }

    public void onNothingSelected(AdapterView adapterview)
    {
        Bundle bundle = getArguments();
        mContents.updateLocale(bundle.getString("locale"));
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 1)
        {
            mContents.delete(getActivity());
            mIsDeleting = true;
            getActivity().onBackPressed();
            return true;
        } else
        {
            return false;
        }
    }

    public void onPause()
    {
        super.onPause();
        if (getResources().getBoolean(0x7f090006))
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("onPause input manager ");
            String s;
            if (mImm == null)
                s = "is";
            else
                s = "is not";
            Xlog.d("InputMethod", stringbuilder.append(s).append(" null").toString());
            if (mImm != null)
                mImm.hideSoftInputFromWindow(getActivity().getCurrentFocus().getWindowToken(), 0);
        }
        if (!mIsDeleting)
            mContents.apply(getActivity(), null);
    }

    public void onResume()
    {
        super.onResume();
        updateSpinner();
    }
}
