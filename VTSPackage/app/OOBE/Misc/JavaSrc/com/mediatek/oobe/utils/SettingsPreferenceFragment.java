// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.app.*;
import android.content.ContentResolver;
import android.content.DialogInterface;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.util.Log;
import android.widget.Button;

// Referenced classes of package com.mediatek.oobe.utils:
//            DialogCreatable, ButtonBarHandler

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
                        throw new IllegalArgumentException((new StringBuilder()).append("key_parent_fragment_id must implement ").append(com/mediatek/oobe/utils/DialogCreatable.getName()).append(", mParentFragment = ").append(mParentFragment).append(", parent id = ").append(i).toString());
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


/*
        static android.content.DialogInterface.OnCancelListener access$002(SettingsDialogFragment settingsdialogfragment, android.content.DialogInterface.OnCancelListener oncancellistener)
        {
            settingsdialogfragment.mOnCancelListener = oncancellistener;
            return oncancellistener;
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


    private static final String TAG = "SettingsPreferenceFragment";
    private SettingsDialogFragment mDialogFragment;


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

    protected Button getNextButton()
    {
        return ((ButtonBarHandler)getActivity()).getNextButton();
    }

    protected Object getSystemService(String s)
    {
        return getActivity().getSystemService(s);
    }

    protected boolean hasNextButton()
    {
        return ((ButtonBarHandler)getActivity()).hasNextButton();
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
    }

    public Dialog onCreateDialog(int i)
    {
        return null;
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

    protected void removeDialog(int i)
    {
        if (mDialogFragment != null && mDialogFragment.getDialogId() == i)
        {
            mDialogFragment.dismiss();
            mDialogFragment = null;
        }
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

    protected void showDialog(int i)
    {
        if (mDialogFragment != null)
        {
            Log.e("SettingsPreferenceFragment", "Old dialog fragment not null!");
            return;
        } else
        {
            mDialogFragment = new SettingsDialogFragment(this, i);
            mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
            return;
        }
    }



/*
    static SettingsDialogFragment access$102(SettingsPreferenceFragment settingspreferencefragment, SettingsDialogFragment settingsdialogfragment)
    {
        settingspreferencefragment.mDialogFragment = settingsdialogfragment;
        return settingsdialogfragment;
    }

*/
}
