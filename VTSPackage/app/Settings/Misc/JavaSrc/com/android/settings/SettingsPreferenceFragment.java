// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.widget.Button;

// Referenced classes of package com.android.settings:
//            DialogCreatable, ButtonBarHandler, HelpUtils

public class SettingsPreferenceFragment extends PreferenceFragment
    implements DialogCreatable
{
    public static class SettingsDialogFragment extends DialogFragment
    {

        private static final String KEY_DIALOG_ID = "key_dialog_id";
        private static final String KEY_PARENT_FRAGMENT_ID = "key_parent_fragment_id";
        private int mDialogId;
        private android.content.DialogInterface.OnCancelListener mOnCancelListener;
        private android.content.DialogInterface.OnDismissListener mOnDismissListener;
        private Fragment mParentFragment;

        public int getDialogId()
        {
            return mDialogId;
        }

        public void onCancel(DialogInterface dialoginterface)
        {
            super.onCancel(dialoginterface);
            if (mOnCancelListener != null)
                mOnCancelListener.onCancel(dialoginterface);
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            if (bundle != null)
            {
                mDialogId = bundle.getInt("key_dialog_id", 0);
                int i = bundle.getInt("key_parent_fragment_id", -1);
                if (i > -1)
                {
                    mParentFragment = getFragmentManager().findFragmentById(i);
                    if (!(mParentFragment instanceof DialogCreatable))
                        throw new IllegalArgumentException((new StringBuilder()).append("key_parent_fragment_id must implement ").append(com/android/settings/DialogCreatable.getName()).toString());
                }
                if (mParentFragment instanceof SettingsPreferenceFragment)
                    ((SettingsPreferenceFragment)mParentFragment).mDialogFragment = this;
            }
            return ((DialogCreatable)mParentFragment).onCreateDialog(mDialogId);
        }

        public void onDetach()
        {
            super.onDetach();
            if ((mParentFragment instanceof SettingsPreferenceFragment) && ((SettingsPreferenceFragment)mParentFragment).mDialogFragment == this)
                ((SettingsPreferenceFragment)mParentFragment).mDialogFragment = null;
        }

        public void onDismiss(DialogInterface dialoginterface)
        {
            super.onDismiss(dialoginterface);
            if (mOnDismissListener != null)
                mOnDismissListener.onDismiss(dialoginterface);
        }

        public void onSaveInstanceState(Bundle bundle)
        {
            super.onSaveInstanceState(bundle);
            if (mParentFragment != null)
            {
                bundle.putInt("key_dialog_id", mDialogId);
                bundle.putInt("key_parent_fragment_id", mParentFragment.getId());
            }
        }

        public void onStart()
        {
            super.onStart();
            if (mParentFragment != null && (mParentFragment instanceof SettingsPreferenceFragment))
                ((SettingsPreferenceFragment)mParentFragment).onDialogShowing();
        }


/*
        static android.content.DialogInterface.OnCancelListener access$002(SettingsDialogFragment settingsdialogfragment, android.content.DialogInterface.OnCancelListener oncancellistener)
        {
            settingsdialogfragment.mOnCancelListener = oncancellistener;
            return oncancellistener;
        }

*/


/*
        static android.content.DialogInterface.OnDismissListener access$102(SettingsDialogFragment settingsdialogfragment, android.content.DialogInterface.OnDismissListener ondismisslistener)
        {
            settingsdialogfragment.mOnDismissListener = ondismisslistener;
            return ondismisslistener;
        }

*/


        public SettingsDialogFragment(DialogCreatable dialogcreatable, int i)
        {
            mDialogId = i;
            if (!(dialogcreatable instanceof Fragment))
            {
                throw new IllegalArgumentException((new StringBuilder()).append("fragment argument must be an instance of ").append(android/app/Fragment.getName()).toString());
            } else
            {
                mParentFragment = (Fragment)dialogcreatable;
                return;
            }
        }
    }


    private static final int MENU_HELP = 101;
    private static final String TAG = "SettingsPreferenceFragment";
    private SettingsDialogFragment mDialogFragment;
    private String mHelpUrl;


    public void finish()
    {
        getActivity().onBackPressed();
    }

    public final void finishFragment()
    {
        getActivity().onBackPressed();
    }

    protected ContentResolver getContentResolver()
    {
        return getActivity().getContentResolver();
    }

    protected int getHelpResource()
    {
        return 0;
    }

    protected Button getNextButton()
    {
        return ((ButtonBarHandler)getActivity()).getNextButton();
    }

    protected PackageManager getPackageManager()
    {
        return getActivity().getPackageManager();
    }

    protected Object getSystemService(String s)
    {
        return getActivity().getSystemService(s);
    }

    protected boolean hasNextButton()
    {
        return ((ButtonBarHandler)getActivity()).hasNextButton();
    }

    public boolean isDialogShowing(int i)
    {
        if (mDialogFragment != null && mDialogFragment.getDialogId() == i)
        {
            Dialog dialog = mDialogFragment.getDialog();
            if (dialog != null)
                return dialog.isShowing();
        }
        return false;
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        if (!TextUtils.isEmpty(mHelpUrl))
            setHasOptionsMenu(true);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        int i = getHelpResource();
        if (i != 0)
            mHelpUrl = getResources().getString(i);
    }

    public Dialog onCreateDialog(int i)
    {
        return null;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        if (mHelpUrl != null && getActivity() != null)
        {
            android.view.MenuItem menuitem = menu.add(0, 101, 0, 0x7f0b0928);
            HelpUtils.prepareHelpMenuItem(getActivity(), menuitem, mHelpUrl);
        }
    }

    public void onDetach()
    {
        if (isRemoving() && mDialogFragment != null)
        {
            mDialogFragment.dismiss();
            mDialogFragment = null;
        }
        super.onDetach();
    }

    public void onDialogShowing()
    {
    }

    protected void removeDialog(int i)
    {
        if (mDialogFragment != null && mDialogFragment.getDialogId() == i)
            mDialogFragment.dismiss();
        mDialogFragment = null;
    }

    protected void removePreference(String s)
    {
        android.preference.Preference preference = findPreference(s);
        if (preference != null)
            getPreferenceScreen().removePreference(preference);
    }

    protected void setCancelable(boolean flag)
    {
        if (mDialogFragment != null)
            mDialogFragment.setCancelable(flag);
    }

    protected void setOnCancelListener(android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        if (mDialogFragment != null)
            mDialogFragment.mOnCancelListener = oncancellistener;
    }

    protected void setOnDismissListener(android.content.DialogInterface.OnDismissListener ondismisslistener)
    {
        if (mDialogFragment != null)
            mDialogFragment.mOnDismissListener = ondismisslistener;
    }

    protected void showDialog(int i)
    {
        if (mDialogFragment != null)
            Log.e("SettingsPreferenceFragment", "Old dialog fragment not null!");
        mDialogFragment = new SettingsDialogFragment(this, i);
        mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

    public boolean startFragment(Fragment fragment, String s, int i, Bundle bundle)
    {
        if (getActivity() instanceof PreferenceActivity)
        {
            ((PreferenceActivity)getActivity()).startPreferencePanel(s, bundle, 0x7f0b0392, null, fragment, i);
            return true;
        } else
        {
            Log.w("SettingsPreferenceFragment", (new StringBuilder()).append("Parent isn't PreferenceActivity, thus there's no way to launch the given Fragment (name: ").append(s).append(", requestCode: ").append(i).append(")").toString());
            return false;
        }
    }

    public boolean startFragment(Fragment fragment, String s, int i, Bundle bundle, int j)
    {
        if (getActivity() instanceof PreferenceActivity)
        {
            ((PreferenceActivity)getActivity()).startPreferencePanel(s, bundle, j, null, fragment, i);
            return true;
        } else
        {
            Log.w("SettingsPreferenceFragment", (new StringBuilder()).append("Parent isn't PreferenceActivity, thus there's no way to launch the given Fragment (name: ").append(s).append(", requestCode: ").append(i).append(")").toString());
            return false;
        }
    }



/*
    static SettingsDialogFragment access$202(SettingsPreferenceFragment settingspreferencefragment, SettingsDialogFragment settingsdialogfragment)
    {
        settingspreferencefragment.mDialogFragment = settingsdialogfragment;
        return settingsdialogfragment;
    }

*/
}
