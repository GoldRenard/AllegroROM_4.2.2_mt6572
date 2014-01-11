// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import com.android.internal.telephony.ITelephony;
import com.android.settings.Utils;
import com.mediatek.settings.ext.ISimRoamingExt;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.gemini:
//            SimCheckboxEntrance, SimInfoPreference

public class SimDataRoamingSettings extends SimCheckboxEntrance
    implements android.content.DialogInterface.OnClickListener
{

    private static final int DLG_ROAMING_WARNING = 1;
    private static final String TAG = "SimDataRoamingSettings";
    private long mCurrentSimID;
    private int mCurrentSimSlot;
    private ISimRoamingExt mExt;
    private SimInfoPreference mSimInfoPref;
    private ITelephony mTelephony;


    private boolean getDataRoamingState()
    {
        int i = android.provider.Settings.Secure.getInt(getActivity().getContentResolver(), "data_roaming", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    private void setDataRoaming(boolean flag)
    {
        if (android.provider.Telephony.SIMInfo.getSIMInfoBySlot(getActivity(), mCurrentSimSlot) != null)
        {
            int i;
            try
            {
                if (mTelephony != null)
                    mTelephony.setDataRoamingEnabledGemini(flag, mCurrentSimSlot);
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("SimDataRoamingSettings", "mTelephony exception");
                return;
            }
            if (flag)
                i = 1;
            else
                i = 0;
            android.provider.Telephony.SIMInfo.setDataRoaming(getActivity(), i, mCurrentSimID);
            return;
        } else
        {
            Xlog.d("SimDataRoamingSettings", (new StringBuilder()).append("sim slot ").append(mCurrentSimSlot).append(" has been plug out").toString());
            return;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            setDataRoaming(true);
            mSimInfoPref.setCheck(true);
        } else
        if (i == -2)
        {
            mSimInfoPref.setCheck(false);
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mTelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        mExt = Utils.getSimRoamingExtPlugin(getActivity());
    }

    public Dialog onCreateDialog(int i)
    {
        if (1 == i)
        {
            Activity activity = getActivity();
            String s = mExt.getRoamingWarningMsg(activity, 0x7f0b0358);
            Xlog.d("SimDataRoamingSettings", (new StringBuilder()).append("msg=").append(s).toString());
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            builder.setMessage(s).setTitle(0x1040014).setIcon(0x1080027).setPositiveButton(0x1040013, this).setNegativeButton(0x1040009, this);
            return builder.create();
        } else
        {
            return super.onCreateDialog(i);
        }
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        long l = Long.parseLong(preference.getKey());
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(getActivity(), l);
        if (siminfo != null)
        {
            int i = siminfo.mDataRoaming;
            mCurrentSimSlot = siminfo.mSlot;
            mCurrentSimID = siminfo.mSimId;
            mSimInfoPref = (SimInfoPreference)preference;
            if (i == 0)
            {
                showDialog(1);
                return true;
            } else
            {
                setDataRoaming(false);
                mSimInfoPref.setCheck(false);
                return true;
            }
        } else
        {
            return false;
        }
    }

    protected boolean shouldDisableWhenRadioOff()
    {
        return true;
    }

    protected void updateCheckState(SimInfoPreference siminfopreference, android.provider.Telephony.SIMInfo siminfo)
    {
        boolean flag = true;
        if (siminfo.mDataRoaming != flag)
            flag = false;
        siminfopreference.setCheck(flag);
    }
}
