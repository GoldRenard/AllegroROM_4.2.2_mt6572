// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.providers.settings;

import android.app.ActivityManagerNative;
import android.app.IActivityManager;
import android.app.backup.IBackupManager;
import android.content.Context;
import android.content.res.*;
import android.media.AudioManager;
import android.os.*;
import android.text.TextUtils;
import java.util.Locale;

public class SettingsHelper
{

    private AudioManager mAudioManager;
    private Context mContext;

    public SettingsHelper(Context context)
    {
        mContext = context;
        mAudioManager = (AudioManager)context.getSystemService("audio");
    }

    private boolean isAlreadyConfiguredCriticalAccessibilitySetting(String s)
    {
        if (!"accessibility_enabled".equals(s) && !"accessibility_script_injection".equals(s) && !"speak_password".equals(s) && !"touch_exploration_enabled".equals(s))
        {
            if (!"touch_exploration_granted_accessibility_services".equals(s) && !"enabled_accessibility_services".equals(s))
                return false;
            if (TextUtils.isEmpty(android.provider.Settings.Secure.getString(mContext.getContentResolver(), s)))
                return false;
        } else
        if (android.provider.Settings.Secure.getInt(mContext.getContentResolver(), s, 0) == 0)
            return false;
        return true;
    }

    private void setAutoRestore(boolean flag)
    {
        IBackupManager ibackupmanager;
        try
        {
            ibackupmanager = android.app.backup.IBackupManager.Stub.asInterface(ServiceManager.getService("backup"));
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (ibackupmanager == null)
            break MISSING_BLOCK_LABEL_20;
        ibackupmanager.setAutoRestore(flag);
    }

    private void setBrightness(int i)
    {
        IPowerManager ipowermanager;
        try
        {
            ipowermanager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (ipowermanager == null)
            break MISSING_BLOCK_LABEL_20;
        ipowermanager.setTemporaryScreenBrightnessSettingOverride(i);
    }

    private void setGpsLocation(String s)
    {
        boolean flag;
        if (!"gps".equals(s) && !s.startsWith("gps,") && !s.endsWith(",gps") && !s.contains(",gps,"))
            flag = false;
        else
            flag = true;
        android.provider.Settings.Secure.setLocationProviderEnabled(mContext.getContentResolver(), "gps", flag);
    }

    private void setSoundEffects(boolean flag)
    {
        if (flag)
        {
            mAudioManager.loadSoundEffects();
            return;
        } else
        {
            mAudioManager.unloadSoundEffects();
            return;
        }
    }

    void applyAudioSettings()
    {
        (new AudioManager(mContext)).reloadAudioSettings();
    }

    byte[] getLocaleData()
    {
        Locale locale = mContext.getResources().getConfiguration().locale;
        String s = locale.getLanguage();
        String s1 = locale.getCountry();
        if (!TextUtils.isEmpty(s1))
            s = (new StringBuilder()).append(s).append("_").append(s1).toString();
        return s.getBytes();
    }

    public boolean restoreValue(String s, String s1)
    {
        if ("screen_brightness".equals(s))
            setBrightness(Integer.parseInt(s1));
        else
        if ("sound_effects_enabled".equals(s))
        {
            int j = Integer.parseInt(s1);
            boolean flag1 = false;
            if (j == 1)
                flag1 = true;
            setSoundEffects(flag1);
        } else
        {
            if ("location_providers_allowed".equals(s))
            {
                setGpsLocation(s1);
                return false;
            }
            if ("backup_auto_restore".equals(s))
            {
                int i = Integer.parseInt(s1);
                boolean flag = false;
                if (i == 1)
                    flag = true;
                setAutoRestore(flag);
            } else
            if (isAlreadyConfiguredCriticalAccessibilitySetting(s))
                return false;
        }
        return true;
    }

    void setLocaleData(byte abyte0[], int i)
    {
        Configuration configuration;
        configuration = mContext.getResources().getConfiguration();
        configuration.locale;
        if (!configuration.userSetLocale) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int j;
        String as[] = mContext.getAssets().getLocales();
        String s = new String(abyte0, 0, i);
        String s1 = new String(abyte0, 0, 2);
        String s2;
        int k;
        Locale locale;
        RemoteException remoteexception;
        IActivityManager iactivitymanager;
        Configuration configuration1;
        if (i > 4)
            s2 = new String(abyte0, 3, 2);
        else
            s2 = "";
        j = 0;
_L4:
        k = as.length;
        locale = null;
        if (j >= k)
            continue; /* Loop/switch isn't completed */
        if (!as[j].equals(s))
            break MISSING_BLOCK_LABEL_173;
        locale = new Locale(s1, s2);
        if (locale == null) goto _L1; else goto _L3
_L3:
        try
        {
            iactivitymanager = ActivityManagerNative.getDefault();
            configuration1 = iactivitymanager.getConfiguration();
            configuration1.locale = locale;
            configuration1.userSetLocale = true;
            iactivitymanager.updateConfiguration(configuration1);
            return;
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception)
        {
            return;
        }
        j++;
          goto _L4
    }
}
