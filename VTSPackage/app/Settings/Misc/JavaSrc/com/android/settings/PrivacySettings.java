// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Dialog;
import android.app.backup.IBackupManager;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class PrivacySettings extends SettingsPreferenceFragment
    implements android.content.DialogInterface.OnClickListener
{

    private static final String AUTO_RESTORE = "auto_restore";
    private static final String BACKUP_CATEGORY = "backup_category";
    private static final String BACKUP_DATA = "backup_data";
    private static final String CONFIGURE_ACCOUNT = "configure_account";
    private static final int DIALOG_ERASE_BACKUP = 2;
    private static final String DRM_RESET = "drm_settings";
    private static final String GSETTINGS_PROVIDER = "com.google.settings";
    private static final String PERSONAL_DATA_CATEGORY = "personal_data";
    private static final String TAG = "PrivacySettings";
    private CheckBoxPreference mAutoRestore;
    private CheckBoxPreference mBackup;
    private IBackupManager mBackupManager;
    private PreferenceScreen mConfigure;
    private Dialog mConfirmDialog;
    private int mDialogType;


    private void setBackupEnabled(boolean flag)
    {
        boolean flag1 = true;
        if (mBackupManager != null)
            try
            {
                mBackupManager.setBackupEnabled(flag);
                mBackupManager.setBackupProvisioned(flag);
            }
            catch (RemoteException remoteexception)
            {
                CheckBoxPreference checkboxpreference = mBackup;
                boolean flag2;
                CheckBoxPreference checkboxpreference1;
                if (!flag)
                    flag2 = flag1;
                else
                    flag2 = false;
                checkboxpreference.setChecked(flag2);
                checkboxpreference1 = mAutoRestore;
                if (flag)
                    flag1 = false;
                checkboxpreference1.setEnabled(flag1);
                return;
            }
        mBackup.setChecked(flag);
        mAutoRestore.setEnabled(flag);
        mConfigure.setEnabled(flag);
    }

    private void setConfigureSummary(String s)
    {
        if (s != null)
        {
            mConfigure.setSummary(s);
            return;
        } else
        {
            mConfigure.setSummary(0x7f0b07f2);
            return;
        }
    }

    private void showEraseBackupDialog()
    {
        mBackup.setChecked(true);
        mDialogType = 2;
        CharSequence charsequence = getResources().getText(0x7f0b07fc);
        mConfirmDialog = (new android.app.AlertDialog.Builder(getActivity())).setMessage(charsequence).setTitle(0x7f0b07fb).setIconAttribute(0x1010355).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, this).show();
    }

    private void updateConfigureSummary()
    {
        try
        {
            String s = mBackupManager.getCurrentTransport();
            setConfigureSummary(mBackupManager.getDestinationString(s));
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void updateToggles()
    {
        android.content.ContentResolver contentresolver;
        boolean flag;
        android.content.Intent intent;
        contentresolver = getContentResolver();
        flag = false;
        intent = null;
        String s2;
        flag = mBackupManager.isBackupEnabled();
        String s1 = mBackupManager.getCurrentTransport();
        intent = mBackupManager.getConfigurationIntent(s1);
        s2 = mBackupManager.getDestinationString(s1);
        String s = s2;
_L1:
        mBackup.setChecked(flag);
        boolean flag1;
        boolean flag2;
        if (flag)
        {
            IBackupManager ibackupmanager = android.app.backup.IBackupManager.Stub.asInterface(ServiceManager.getService("backup"));
            RemoteException remoteexception;
            CheckBoxPreference checkboxpreference;
            if (ibackupmanager != null)
                try
                {
                    ibackupmanager.setBackupProvisioned(true);
                }
                catch (RemoteException remoteexception1)
                {
                    Xlog.e("PrivacySettings", "set backup provisioned false!");
                }
        }
        checkboxpreference = mAutoRestore;
        if (android.provider.Settings.Secure.getInt(contentresolver, "backup_auto_restore", 1) == 1)
            flag1 = true;
        else
            flag1 = false;
        checkboxpreference.setChecked(flag1);
        mAutoRestore.setEnabled(flag);
        if (intent != null && flag)
            flag2 = true;
        else
            flag2 = false;
        mConfigure.setEnabled(flag2);
        mConfigure.setIntent(intent);
        setConfigureSummary(s);
        return;
        remoteexception;
        mBackup.setEnabled(false);
        s = null;
          goto _L1
    }

    protected int getHelpResource()
    {
        return 0x7f0b0932;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1 && mDialogType == 2)
        {
            setBackupEnabled(false);
            updateConfigureSummary();
        }
        mDialogType = 0;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050023);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mBackupManager = android.app.backup.IBackupManager.Stub.asInterface(ServiceManager.getService("backup"));
        mBackup = (CheckBoxPreference)preferencescreen.findPreference("backup_data");
        mAutoRestore = (CheckBoxPreference)preferencescreen.findPreference("auto_restore");
        mConfigure = (PreferenceScreen)preferencescreen.findPreference("configure_account");
        if (getActivity().getPackageManager().resolveContentProvider("com.google.settings", 0) == null)
            preferencescreen.removePreference(findPreference("backup_category"));
        updateToggles();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        boolean flag = true;
        if (preference != mBackup) goto _L2; else goto _L1
_L1:
        if (!mBackup.isChecked())
            showEraseBackupDialog();
        else
            setBackupEnabled(flag);
_L4:
        return super.onPreferenceTreeClick(preferencescreen, preference);
_L2:
        if (preference == mAutoRestore)
        {
            boolean flag1 = mAutoRestore.isChecked();
            try
            {
                mBackupManager.setAutoRestore(flag1);
            }
            catch (RemoteException remoteexception)
            {
                CheckBoxPreference checkboxpreference = mAutoRestore;
                if (flag1)
                    flag = false;
                checkboxpreference.setChecked(flag);
            }
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void onResume()
    {
        super.onResume();
        updateToggles();
    }

    public void onStop()
    {
        if (mConfirmDialog != null && mConfirmDialog.isShowing())
            mConfirmDialog.dismiss();
        mConfirmDialog = null;
        mDialogType = 0;
        super.onStop();
    }
}
