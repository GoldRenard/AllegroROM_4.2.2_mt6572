// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.view.View;
import android.widget.Toast;
import com.mediatek.drm.OmaDrmClient;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class DrmSettings extends SettingsPreferenceFragment
{

    private static final int DIALOG_RESET = 1000;
    private static final String DRM_RESET = "drm_settings";
    private static final String TAG = "DrmSettings";
    private static OmaDrmClient sClient;
    private static Preference sPreferenceReset;
    private View mContentView;
    private Context mContext;


    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050018);
        sPreferenceReset = findPreference("drm_settings");
        mContext = getActivity();
        sClient = new OmaDrmClient(mContext);
    }

    public Dialog onCreateDialog(int i)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
        switch (i)
        {
        case 1000: 
            builder.setMessage(getResources().getString(0x7f0b00cc));
            builder.setTitle(getResources().getString(0x7f0b00ca));
            builder.setIcon(0x1080027);
            builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final DrmSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    if (DrmSettings.sClient != null)
                    {
                        int k = DrmSettings.sClient.removeAllRights();
                        OmaDrmClient _tmp = DrmSettings.sClient;
                        if (k == 0)
                        {
                            Toast.makeText(mContext, 0x7f0b00cd, 0).show();
                            DrmSettings.sPreferenceReset.setEnabled(false);
                        } else
                        {
                            Xlog.i("DrmSettings", "removeAllRights fail!");
                        }
                        DrmSettings.sClient = null;
                    }
                }

            
            {
                this$0 = DrmSettings.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x1040000, null);
            return builder.create();
        }
        return null;
    }

    public void onDestroy()
    {
        super.onDestroy();
        sClient = null;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == sPreferenceReset)
            showDialog(1000);
        return false;
    }



/*
    static OmaDrmClient access$002(OmaDrmClient omadrmclient)
    {
        sClient = omadrmclient;
        return omadrmclient;
    }

*/


}
