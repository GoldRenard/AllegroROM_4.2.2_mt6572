// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Dialog;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import java.util.Locale;

// Referenced classes of package com.android.settings:
//            DialogCreatable, Utils

public class LocalePicker extends com.android.internal.app.LocalePicker
    implements com.android.internal.app.LocaleSelectionListener, DialogCreatable
{

    private static final int DLG_SHOW_GLOBAL_WARNING = 1;
    private static final String SAVE_TARGET_LOCALE = "locale";
    private static final String TAG = "LocalePicker";
    private SettingsPreferenceFragment.SettingsDialogFragment mDialogFragment;
    private Locale mTargetLocale;

    public LocalePicker()
    {
        setLocaleSelectionListener(this);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (bundle != null && bundle.containsKey("locale"))
            mTargetLocale = new Locale(bundle.getString("locale"));
    }

    public Dialog onCreateDialog(final int dialogId)
    {
        return Utils.buildGlobalChangeWarningDialog(getActivity(), 0x7f0b0925, new Runnable() {

            final LocalePicker this$0;
            final int val$dialogId;

            public void run()
            {
                removeDialog(dialogId);
                getActivity().onBackPressed();
                LocalePicker.updateLocale(mTargetLocale);
            }

            
            {
                this$0 = LocalePicker.this;
                dialogId = i;
                super();
            }
        }
);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        View view = super.onCreateView(layoutinflater, viewgroup, bundle);
        Utils.forcePrepareCustomPreferencesList(viewgroup, view, (ListView)view.findViewById(0x102000a), false);
        return view;
    }

    public void onLocaleSelected(Locale locale)
    {
        if (Utils.hasMultipleUsers(getActivity()))
        {
            mTargetLocale = locale;
            showDialog(1);
            return;
        } else
        {
            getActivity().onBackPressed();
            updateLocale(locale);
            return;
        }
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        if (mTargetLocale != null)
            bundle.putString("locale", mTargetLocale.toString());
    }

    protected void removeDialog(int i)
    {
        if (mDialogFragment != null && mDialogFragment.getDialogId() == i)
            mDialogFragment.dismiss();
        mDialogFragment = null;
    }

    protected void showDialog(int i)
    {
        if (mDialogFragment != null)
            Log.e("LocalePicker", "Old dialog fragment not null!");
        mDialogFragment = new SettingsPreferenceFragment.SettingsDialogFragment(this, i);
        mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

}
