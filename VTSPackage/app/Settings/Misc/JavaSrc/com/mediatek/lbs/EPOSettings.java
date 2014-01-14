// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lbs;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.preference.*;
import android.view.*;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.common.epo.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.lbs:
//            EpoProgressCategory

public class EPOSettings extends SettingsPreferenceFragment
{

    private static final int ABOUT_DIALOG_ID = 2;
    private static final int ALERT_DIALOG_ID = 1;
    private static final int EPO_DOWNLAOD_INITATE_STATE = 0;
    private static final int EPO_DOWNLOAD_COMPLETE_STATE = 100;
    private static final int ERROR_DIALOG_ID = 0;
    private static final String KEY_ABOUT_EPO = "epo_about";
    private static final String KEY_AUTO_DOWNLOAD = "auto_download";
    private static final String KEY_DOWNLOAD_TIME = "download_time";
    private static final String KEY_EPO_INFO_CAT = "epo_info_cat";
    private static final String KEY_EXPIRE_TIME = "expire_time";
    private static final String KEY_START_TIME = "start_time";
    protected static final int MENU_EPO_DOWNLOAD = 1;
    private static final String XLOGTAG = "Settings/EPO";
    private CheckBoxPreference mAutoDownloadPreference;
    private MenuItem mDownloadMenuItem;
    private Preference mDownloadTimePreference;
    private EpoProgressCategory mEPOInfoCategory;
    private MtkEpoClientManager mEpoMgr;
    private boolean mEpoStatus;
    private final MtkEpoStatusListener mEpoStatusListener = new MtkEpoStatusListener() {

        final EPOSettings this$0;

        public void onStatusChanged(int i)
        {
            updateEpoProgressToMmi(i);
        }

            
            {
                this$0 = EPOSettings.this;
                super();
            }
    }
;
    private String mErrorMessage;
    private Preference mExpireTimePreference;
    private Preference mStartTimePreference;

    public EPOSettings()
    {
        mEpoStatus = false;
    }

    private void epoEnableAuto(boolean flag)
    {
        if (flag)
        {
            mEpoMgr.enableAutoDownload(true);
            return;
        } else
        {
            mEpoMgr.enableAutoDownload(false);
            return;
        }
    }

    private void handleStatusChanged()
    {
        if (!isNetworkAvailable())
        {
            mErrorMessage = getResources().getString(0x7f0b0071);
            showDialog(0);
            return;
        }
        boolean flag = mEpoStatus;
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        mEpoStatus = flag1;
        if (mEpoStatus)
        {
            if (mDownloadMenuItem != null)
                mDownloadMenuItem.setTitle(0x7f0b0072);
            int i = mEpoMgr.startDownload();
            log((new StringBuilder()).append("startDownload ret=").append(i).toString());
            return;
        }
        String s = getResources().getString(0x7f0b0073);
        mEPOInfoCategory.setText(s);
        mEPOInfoCategory.setProgress(true);
        if (mDownloadMenuItem != null)
            mDownloadMenuItem.setTitle(0x7f0b0070);
        mEpoMgr.stopDownload();
    }

    private void handleStopDownload()
    {
        mEpoStatus = false;
        if (mDownloadMenuItem != null)
            mDownloadMenuItem.setTitle(0x7f0b0070);
    }

    private boolean isGpsAvailable()
    {
        return android.provider.Settings.Secure.isLocationProviderEnabled(getContentResolver(), "gps");
    }

    private boolean isNetworkAvailable()
    {
        NetworkInfo networkinfo = ((ConnectivityManager)getSystemService("connectivity")).getActiveNetworkInfo();
        return networkinfo != null && networkinfo.isConnected();
    }

    private void log(String s)
    {
        Xlog.d("Settings/EPO", s);
    }

    private void updateEpoProgressToMmi(int i)
    {
        if (i >= 0 && i <= 100)
        {
            log((new StringBuilder()).append("progress=").append(i).toString());
            String s1 = getResources().getString(0x7f0b0074);
            mEPOInfoCategory.setText((new StringBuilder()).append(s1).append(" (").append(i).append("%)").toString());
            mEPOInfoCategory.setProgress(true);
            return;
        }
        if (i == 200)
        {
            log("epo started");
            return;
        }
        if (i == 201)
        {
            log("epo update success");
            mEPOInfoCategory.setProgress(false);
            handleStopDownload();
            updatePage();
            return;
        }
        if (i == 202)
        {
            log("epo update failure");
            mEPOInfoCategory.setProgress(false);
            handleStopDownload();
            mErrorMessage = getResources().getString(0x7f0b0075);
            showDialog(0);
            return;
        }
        if (i == 203)
        {
            log("epo update canceled");
            mEPOInfoCategory.setProgress(false);
            handleStopDownload();
            return;
        }
        if (i == 300)
        {
            log("epo is idle");
            mEPOInfoCategory.setProgress(false);
            handleStopDownload();
            return;
        }
        if (i == 204)
        {
            log("epo is canceling");
            String s = getResources().getString(0x7f0b0073);
            mEPOInfoCategory.setText(s);
            mEPOInfoCategory.setProgress(true);
            return;
        } else
        {
            log("WARNING: unknown status recv");
            return;
        }
    }

    public void initPage()
    {
        mAutoDownloadPreference = (CheckBoxPreference)findPreference("auto_download");
        mEPOInfoCategory = (EpoProgressCategory)findPreference("epo_info_cat");
        mDownloadTimePreference = findPreference("download_time");
        mStartTimePreference = findPreference("start_time");
        mExpireTimePreference = findPreference("expire_time");
        mDownloadTimePreference.setEnabled(false);
        mStartTimePreference.setEnabled(false);
        mExpireTimePreference.setEnabled(false);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f05001a);
        log("onCreate");
        mEpoMgr = (MtkEpoClientManager)getSystemService("mtk-epo-client");
        if (mEpoMgr == null)
            log("ERR: cannot get EPO client service");
        initPage();
        setHasOptionsMenu(true);
    }

    public Dialog onCreateDialog(int i)
    {
        if (i == 0)
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0076).setIcon(0x1080027).setMessage(mErrorMessage).setPositiveButton(0x7f0b0077, null).create();
        if (i == 1)
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0078).setIcon(0x1080027).setMessage(0x7f0b0079).setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                final EPOSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                }

            
            {
                this$0 = EPOSettings.this;
                super();
            }
            }
).setNegativeButton(0x1040009, null).create();
        if (i == 2)
        {
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0065).setIcon(0x108009b).setMessage(0x7f0b0066).setPositiveButton(0x104000a, null).create();
        } else
        {
            log("There is no such Dialog id");
            return null;
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        super.onCreateOptionsMenu(menu, menuinflater);
        log("onCreateOptionsMenu");
        menu.add(0, 1, 0, 0x7f0b0070).setShowAsAction(1);
        mDownloadMenuItem = menu.findItem(1);
        int i = mEpoMgr.getProgress();
        if (i != 300 || i != 204)
        {
            mDownloadMenuItem.setTitle(0x7f0b0072);
            mEpoStatus = true;
        }
        updateEpoProgressToMmi(i);
    }

    public void onDestroy()
    {
        super.onDestroy();
        log("onDestroy");
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 1)
            handleStatusChanged();
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        super.onPause();
        log("onPause");
        mEpoMgr.removeStatusListener(mEpoStatusListener);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        super.onPreferenceTreeClick(preferencescreen, preference);
        String s = preference.getKey();
        if ("auto_download".equals(s))
            epoEnableAuto(((CheckBoxPreference)preference).isChecked());
        else
        if ("epo_about".equals(s))
            showDialog(2);
        return false;
    }

    public void onResume()
    {
        super.onResume();
        log("onResume");
        updatePage();
        mEpoMgr.addStatusListener(mEpoStatusListener);
        updateEpoProgressToMmi(mEpoMgr.getProgress());
    }

    public void updatePage()
    {
        MtkEpoFileInfo mtkepofileinfo = mEpoMgr.getEpoFileInfo();
        if (mtkepofileinfo != null)
        {
            mStartTimePreference.setSummary(mtkepofileinfo.getStartTimeString());
            mDownloadTimePreference.setSummary(mtkepofileinfo.getDownloadTimeString());
            mExpireTimePreference.setSummary(mtkepofileinfo.getExpireTimeString());
        }
        mAutoDownloadPreference.setChecked(mEpoMgr.getAutoDownloadStatus());
    }

}
