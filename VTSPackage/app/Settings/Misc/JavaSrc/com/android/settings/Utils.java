// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.ActivityManager;
import android.app.Dialog;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.net.*;
import android.os.*;
import android.os.storage.IMountService;
import android.preference.*;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import com.mediatek.pluginmanager.Plugin;
import com.mediatek.pluginmanager.PluginManager;
import com.mediatek.settings.ext.*;
import com.mediatek.storage.StorageManagerEx;
import java.io.*;
import java.net.InetAddress;
import java.util.*;

// Referenced classes of package com.android.settings:
//            IconPreferenceScreen

public class Utils
{

    private static final String FILE_DISABLE_APPS_LIST = "/system/etc/disableapplist.txt";
    private static final String META_DATA_PREFERENCE_ICON = "com.android.settings.icon";
    private static final String META_DATA_PREFERENCE_SUMMARY = "com.android.settings.summary";
    private static final String META_DATA_PREFERENCE_TITLE = "com.android.settings.title";
    private static final String TAG = "Utils";
    public static final int UPDATE_PREFERENCE_FLAG_SET_TITLE_TO_MATCHING_ACTIVITY = 1;
    public static ArrayList disableAppList = readFile("/system/etc/disableapplist.txt");
    private static ArrayList mList = new ArrayList();


    public static Dialog buildGlobalChangeWarningDialog(Context context, int i, Runnable runnable)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(context);
        builder.setTitle(i);
        builder.setMessage(0x7f0b0924);
        builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener(runnable) {

            final Runnable val$positiveAction;

            public void onClick(DialogInterface dialoginterface, int j)
            {
                positiveAction.run();
            }

            
            {
                positiveAction = runnable;
                super();
            }
        }
);
        builder.setNegativeButton(0x1040000, null);
        return builder.create();
    }

    public static boolean copyMeProfilePhoto(Context context, UserInfo userinfo)
    {
        Uri uri = android.provider.ContactsContract.Profile.CONTENT_URI;
        UserManager usermanager = (UserManager)context.getSystemService("user");
        int i;
        InputStream inputstream;
        if (userinfo != null)
            i = userinfo.id;
        else
            i = UserHandle.myUserId();
        inputstream = android.provider.ContactsContract.Contacts.openContactPhotoInputStream(context.getContentResolver(), uri, true);
        if (inputstream == null)
        {
            usermanager.setUserIcon(i, null);
            return false;
        }
        usermanager.setUserIcon(i, BitmapFactory.decodeStream(inputstream));
        try
        {
            inputstream.close();
        }
        catch (IOException ioexception)
        {
            return true;
        }
        return true;
    }

    public static Locale createLocaleFromString(String s)
    {
        if (s == null)
            return Locale.getDefault();
        String as[] = s.split("_", 3);
        if (1 == as.length)
            return new Locale(as[0]);
        if (2 == as.length)
            return new Locale(as[0], as[1]);
        else
            return new Locale(as[0], as[1], as[2]);
    }

    public static void forcePrepareCustomPreferencesList(ViewGroup viewgroup, View view, ListView listview, boolean flag)
    {
        listview.setScrollBarStyle(0x2000000);
        listview.setClipToPadding(false);
        prepareCustomPreferencesList(viewgroup, view, listview, flag);
    }

    private static String formatIpAddresses(LinkProperties linkproperties)
    {
        String s = null;
        if (linkproperties != null)
        {
            Iterator iterator = linkproperties.getAddresses().iterator();
            boolean flag = iterator.hasNext();
            s = null;
            if (flag)
            {
                s = "";
                do
                {
                    if (!iterator.hasNext())
                        break;
                    s = (new StringBuilder()).append(s).append(((InetAddress)iterator.next()).getHostAddress()).toString();
                    if (iterator.hasNext())
                        s = (new StringBuilder()).append(s).append(", ").toString();
                } while (true);
            }
        }
        return s;
    }

    public static IApnEditorExt getApnEditorPlugin(Context context)
    {
        IApnEditorExt iapneditorext;
        try
        {
            iapneditorext = (IApnEditorExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IApnEditorExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            return new DefaultApnEditorExt();
        }
        return iapneditorext;
    }

    public static IAudioProfileExt getAudioProfilePlgin(Context context)
    {
        IAudioProfileExt iaudioprofileext;
        try
        {
            iaudioprofileext = (IAudioProfileExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IAudioProfileExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            Log.i("Utils", "Plugin ObjectCreationException");
            return new DefaultAudioProfileExt(context);
        }
        return iaudioprofileext;
    }

    public static String getBatteryPercentage(Intent intent)
    {
        int i = intent.getIntExtra("level", 0);
        int j = intent.getIntExtra("scale", 100);
        return (new StringBuilder()).append(String.valueOf((i * 100) / j)).append("%").toString();
    }

    public static String getBatteryStatus(Resources resources, Intent intent)
    {
        int i = intent.getIntExtra("plugged", 0);
        int j = intent.getIntExtra("status", 1);
        if (j == 2)
        {
            String s = resources.getString(0x7f0b02aa);
            if (i > 0)
            {
                int k;
                if (i == 1)
                    k = 0x7f0b02ab;
                else
                if (i == 2)
                    k = 0x7f0b02ac;
                else
                    k = 0x7f0b02ad;
                s = (new StringBuilder()).append(s).append(" ").append(resources.getString(k)).toString();
            }
            return s;
        }
        if (j == 3)
            return resources.getString(0x7f0b02ae);
        if (j == 4)
            return resources.getString(0x7f0b02af);
        if (j == 5)
            return resources.getString(0x7f0b02b0);
        else
            return resources.getString(0x7f0b02a9);
    }

    public static String getDefaultIpAddresses(Context context)
    {
        return formatIpAddresses(((ConnectivityManager)context.getSystemService("connectivity")).getActiveLinkProperties());
    }

    public static IDeviceInfoSettingsExt getDeviceInfoSettingsPlugin(Context context)
    {
        IDeviceInfoSettingsExt ideviceinfosettingsext;
        try
        {
            ideviceinfosettingsext = (IDeviceInfoSettingsExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IDeviceInfoSettingsExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            return new DefaultDeviceInfoSettingsExt();
        }
        return ideviceinfosettingsext;
    }

    private static String getLocalProfileGivenName(Context context)
    {
        ContentResolver contentresolver;
        Cursor cursor;
        contentresolver = context.getContentResolver();
        cursor = contentresolver.query(android.provider.ContactsContract.Profile.CONTENT_RAW_CONTACTS_URI, new String[] {
            "_id"
        }, "account_type IS NULL AND account_name IS NULL", null, null);
        if (cursor != null) goto _L2; else goto _L1
_L1:
        return null;
_L2:
        boolean flag = cursor.moveToFirst();
        if (!flag)
        {
            cursor.close();
            return null;
        }
        long l = cursor.getLong(0);
        Cursor cursor1;
        cursor.close();
        cursor1 = contentresolver.query(android.provider.ContactsContract.Profile.CONTENT_URI.buildUpon().appendPath("data").build(), new String[] {
            "data2", "data3"
        }, (new StringBuilder()).append("raw_contact_id=").append(l).toString(), null, null);
        if (cursor1 == null) goto _L1; else goto _L3
_L3:
        boolean flag1 = cursor1.moveToFirst();
        if (!flag1)
        {
            cursor1.close();
            return null;
        }
        break MISSING_BLOCK_LABEL_167;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
        String s;
        String s1;
        s = cursor1.getString(0);
        if (!TextUtils.isEmpty(s))
            break MISSING_BLOCK_LABEL_199;
        s1 = cursor1.getString(1);
        s = s1;
        cursor1.close();
        return s;
        Exception exception1;
        exception1;
        cursor1.close();
        throw exception1;
    }

    public static String getMeProfileName(Context context, boolean flag)
    {
        if (flag)
            return getProfileDisplayName(context);
        else
            return getShorterNameIfPossible(context);
    }

    public static ISettingsMiscExt getMiscPlugin(Context context)
    {
        ISettingsMiscExt isettingsmiscext;
        try
        {
            isettingsmiscext = (ISettingsMiscExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/ISettingsMiscExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            return new DefaultSettingsMiscExt();
        }
        return isettingsmiscext;
    }

    private static final String getProfileDisplayName(Context context)
    {
        Cursor cursor;
        cursor = context.getContentResolver().query(android.provider.ContactsContract.Profile.CONTENT_URI, new String[] {
            "display_name"
        }, null, null, null);
        if (cursor == null)
            return null;
        boolean flag = cursor.moveToFirst();
        if (!flag)
        {
            cursor.close();
            return null;
        }
        String s = cursor.getString(0);
        cursor.close();
        return s;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    public static IRcseOnlyApnExtension getRcseApnPlugin(Context context)
    {
        PluginManager pluginmanager = PluginManager.create(context, com/mediatek/settings/ext/IRcseOnlyApnExtension.getName(), new Signature[0]);
        Log.d("Utils", (new StringBuilder()).append("Current plug-in counts: ").append(pluginmanager.getPluginCount()).toString());
        int i;
        IRcseOnlyApnExtension ircseonlyapnextension;
        Plugin plugin;
        try
        {
            i = pluginmanager.getPluginCount();
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            Log.d("Utils", "error get object");
            return null;
        }
        ircseonlyapnextension = null;
        if (i <= 0)
            break MISSING_BLOCK_LABEL_83;
        plugin = pluginmanager.getPlugin(0);
        ircseonlyapnextension = null;
        if (plugin == null)
            break MISSING_BLOCK_LABEL_83;
        ircseonlyapnextension = (IRcseOnlyApnExtension)plugin.createObject();
        return ircseonlyapnextension;
    }

    public static IReplaceApnProfileExt getReplaceApnPlugin(Context context)
    {
        IReplaceApnProfileExt ireplaceapnprofileext;
        try
        {
            ireplaceapnprofileext = (IReplaceApnProfileExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IReplaceApnProfileExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            Log.d("Utils", "Enter the default DefaultReplaceApnProfile");
            return new DefaultReplaceApnProfile();
        }
        return ireplaceapnprofileext;
    }

    private static String getShorterNameIfPossible(Context context)
    {
        String s = getLocalProfileGivenName(context);
        if (!TextUtils.isEmpty(s))
            return s;
        else
            return getProfileDisplayName(context);
    }

    public static ISimManagementExt getSimManagmentExtPlugin(Context context)
    {
        ISimManagementExt isimmanagementext;
        try
        {
            isimmanagementext = (ISimManagementExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/ISimManagementExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            Log.d("Utils", "Enter the default ISimManagementExt");
            return new DefaultSimManagementExt();
        }
        return isimmanagementext;
    }

    public static ISimRoamingExt getSimRoamingExtPlugin(Context context)
    {
        ISimRoamingExt isimroamingext;
        try
        {
            isimroamingext = (ISimRoamingExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/ISimRoamingExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            Log.d("Utils", "Enter the default ISimRoamingExt");
            return new DefaultSimRoamingExt();
        }
        return isimroamingext;
    }

    public static IStatusExt getStatusExtPlugin(Context context)
    {
        IStatusExt istatusext;
        try
        {
            istatusext = (IStatusExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IStatusExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            return new DefaultStatusExt();
        }
        return istatusext;
    }

    public static IStatusGeminiExt getStatusGeminiExtPlugin(Context context)
    {
        IStatusGeminiExt istatusgeminiext;
        try
        {
            istatusgeminiext = (IStatusGeminiExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IStatusGeminiExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            return new DefaultStatusGeminiExt();
        }
        return istatusgeminiext;
    }

    public static int getTetheringLabel(ConnectivityManager connectivitymanager)
    {
        String as[] = connectivitymanager.getTetherableUsbRegexs();
        String as1[] = connectivitymanager.getTetherableWifiRegexs();
        String as2[] = connectivitymanager.getTetherableBluetoothRegexs();
        boolean flag;
        if (as.length != 0)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (as1.length != 0)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (as2.length != 0)
            flag2 = true;
        else
            flag2 = false;
        if (flag1 && flag && flag2)
            return 0x7f0b05d0;
        if (flag1 && flag)
            return 0x7f0b05d0;
        if (flag1 && flag2)
            return 0x7f0b05d0;
        if (flag1)
            return 0x7f0b05cd;
        if (flag && flag2)
            return 0x7f0b05cf;
        return !flag ? 0x7f0b05ce : 0x7f0b05cc;
    }

    public static IWifiApDialogExt getWifiApDialogPlugin(Context context)
    {
        IWifiApDialogExt iwifiapdialogext;
        try
        {
            iwifiapdialogext = (IWifiApDialogExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IWifiApDialogExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            return new DefaultWifiApDialogExt();
        }
        return iwifiapdialogext;
    }

    public static String getWifiIpAddresses(Context context)
    {
        return formatIpAddresses(((ConnectivityManager)context.getSystemService("connectivity")).getLinkProperties(1));
    }

    public static IWifiExt getWifiPlugin(Context context)
    {
        IWifiExt iwifiext;
        try
        {
            iwifiext = (IWifiExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IWifiExt.getName(), new Signature[0]);
            Log.i("Utils", "Plugin object created");
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            DefaultWifiExt defaultwifiext = new DefaultWifiExt(context);
            Log.i("Utils", "Plugin ObjectCreationException");
            return defaultwifiext;
        }
        return iwifiext;
    }

    public static IWifiSettingsExt getWifiSettingsPlugin(Context context)
    {
        IWifiSettingsExt iwifisettingsext;
        try
        {
            iwifisettingsext = (IWifiSettingsExt)PluginManager.createPluginObject(context, com/mediatek/settings/ext/IWifiSettingsExt.getName(), new Signature[0]);
            Log.i("Utils", "Plugin object created");
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            DefaultWifiSettingsExt defaultwifisettingsext = new DefaultWifiSettingsExt();
            Log.i("Utils", "Plugin ObjectCreationException");
            return defaultwifisettingsext;
        }
        return iwifisettingsext;
    }

    public static boolean hasMultipleUsers(Context context)
    {
        return ((UserManager)context.getSystemService("user")).getUsers().size() > 1;
    }

    public static boolean isExSdcardInserted()
    {
        boolean flag = StorageManagerEx.getSdSwapState();
        Log.d("Utils", (new StringBuilder()).append("isExSdcardInserted : ").append(flag).toString());
        return flag;
    }

    public static boolean isMonkeyRunning()
    {
        return ActivityManager.isUserAMonkey();
    }

    public static boolean isPackageExist(Context context, String s)
    {
        try
        {
            context.getPackageManager().getPackageInfo(s, 1);
        }
        catch (Exception exception)
        {
            return false;
        }
        return true;
    }

    public static boolean isSomeStorageEmulated()
    {
        IMountService imountservice = android.os.storage.IMountService.Stub.asInterface(ServiceManager.getService("mount"));
        if (imountservice == null) goto _L2; else goto _L1
_L1:
        boolean flag1 = imountservice.isExternalStorageEmulated();
        boolean flag = flag1;
_L4:
        Log.d("Utils", (new StringBuilder()).append("isExistEmulatedStorage : ").append(flag).toString());
        return flag;
_L2:
        Log.e("Utils", "MountService return null");
        flag = false;
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Log.e("Utils", "RemoteException happens, couldn't talk to MountService");
        flag = false;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static boolean isVoiceCapable(Context context)
    {
        TelephonyManager telephonymanager = (TelephonyManager)context.getSystemService("phone");
        return telephonymanager != null && telephonymanager.isVoiceCapable();
    }

    public static boolean isWifiOnly(Context context)
    {
        boolean flag = ((ConnectivityManager)context.getSystemService("connectivity")).isNetworkSupported(0);
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }

    public static void prepareCustomPreferencesList(ViewGroup viewgroup, View view, View view1, boolean flag)
    {
        boolean flag1;
        if (view1.getScrollBarStyle() == 0x2000000)
            flag1 = true;
        else
            flag1 = false;
        if (flag1 && (viewgroup instanceof PreferenceFrameLayout))
        {
            ((android.preference.PreferenceFrameLayout.LayoutParams)view.getLayoutParams()).removeBorders = true;
            Resources resources = view1.getResources();
            int i = resources.getDimensionPixelSize(0x1050029);
            int j = resources.getDimensionPixelSize(0x1050028);
            int k;
            if (flag)
                k = 0;
            else
                k = i;
            view1.setPadding(k, 0, k, j);
        }
    }

    public static ArrayList readFile(String s)
    {
        File file;
        FileReader filereader;
        BufferedReader bufferedreader;
        mList.clear();
        file = new File(s);
        filereader = null;
        bufferedreader = null;
        IOException ioexception;
        FileReader filereader1;
        Exception exception;
        IOException ioexception1;
        IOException ioexception2;
        boolean flag;
        BufferedReader bufferedreader1;
        String s1;
        ArrayList arraylist;
        IOException ioexception3;
        IOException ioexception4;
        try
        {
            flag = file.exists();
        }
        // Misplaced declaration of an exception variable
        catch (IOException ioexception)
        {
            bufferedreader = null;
            filereader = null;
            continue; /* Loop/switch isn't completed */
        }
        bufferedreader = null;
        filereader = null;
        if (!flag) goto _L2; else goto _L1
_L1:
        filereader1 = new FileReader(file);
        bufferedreader1 = new BufferedReader(filereader1);
_L5:
        s1 = bufferedreader1.readLine();
        if (s1 == null) goto _L4; else goto _L3
_L3:
        Log.d("Utils", (new StringBuilder()).append(" read line ").append(s1).toString());
        mList.add(s1);
          goto _L5
        ioexception;
        bufferedreader = bufferedreader1;
        filereader = filereader1;
_L11:
        Log.d("Utils", "IOException");
        ioexception.printStackTrace();
        if (bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception2)
            {
                ioexception2.printStackTrace();
                return null;
            }
        if (filereader == null)
            break MISSING_BLOCK_LABEL_144;
        filereader.close();
_L7:
        return null;
_L2:
        Log.d("Utils", (new StringBuilder()).append("file in ").append(s).append(" does not exist!").toString());
        if (false)
        {
            try
            {
                throw null;
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception4)
            {
                ioexception4.printStackTrace();
            }
            break MISSING_BLOCK_LABEL_197;
        }
        if (true) goto _L7; else goto _L6
_L6:
        throw null;
        return null;
_L4:
        arraylist = mList;
        if (bufferedreader1 == null)
            break MISSING_BLOCK_LABEL_214;
        bufferedreader1.close();
        if (filereader1 != null)
            try
            {
                filereader1.close();
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception3)
            {
                ioexception3.printStackTrace();
            }
        return arraylist;
        exception;
_L9:
        if (bufferedreader == null)
            break MISSING_BLOCK_LABEL_256;
        bufferedreader.close();
        if (filereader != null)
            try
            {
                filereader.close();
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception1)
            {
                ioexception1.printStackTrace();
            }
        throw exception;
        exception;
        filereader = filereader1;
        bufferedreader = null;
        continue; /* Loop/switch isn't completed */
        exception;
        bufferedreader = bufferedreader1;
        filereader = filereader1;
        if (true) goto _L9; else goto _L8
        ioexception;
        filereader = filereader1;
        bufferedreader = null;
        if (true) goto _L11; else goto _L10
_L10:
    }

    public static boolean updateHeaderToSpecificActivityFromMetaDataOrRemove(Context context, List list, android.preference.PreferenceActivity.Header header)
    {
        Intent intent = header.intent;
        if (intent == null) goto _L2; else goto _L1
_L1:
        PackageManager packagemanager;
        List list1;
        int i;
        int j;
        packagemanager = context.getPackageManager();
        list1 = packagemanager.queryIntentActivities(intent, 128);
        i = list1.size();
        j = 0;
_L6:
        if (j >= i) goto _L2; else goto _L3
_L3:
        ResolveInfo resolveinfo = (ResolveInfo)list1.get(j);
        if ((1 & resolveinfo.activityInfo.applicationInfo.flags) == 0) goto _L5; else goto _L4
_L4:
        String s = null;
        Resources resources;
        Bundle bundle;
        resources = packagemanager.getResourcesForApplication(((PackageItemInfo) (resolveinfo.activityInfo)).packageName);
        bundle = resolveinfo.activityInfo.metaData;
        String s1;
        s1 = null;
        s = null;
        if (resources == null)
            break MISSING_BLOCK_LABEL_170;
        s1 = null;
        s = null;
        if (bundle == null)
            break MISSING_BLOCK_LABEL_170;
        String s2;
        resources.getDrawable(bundle.getInt("com.android.settings.icon"));
        s = resources.getString(bundle.getInt("com.android.settings.title"));
        s2 = resources.getString(bundle.getInt("com.android.settings.summary"));
        s1 = s2;
_L7:
        if (TextUtils.isEmpty(s))
            s = resolveinfo.loadLabel(packagemanager).toString();
        header.title = s;
        header.summary = s1;
        header.intent = (new Intent()).setClassName(((PackageItemInfo) (resolveinfo.activityInfo)).packageName, resolveinfo.activityInfo.name);
        return true;
_L5:
        j++;
          goto _L6
_L2:
        list.remove(header);
        return false;
        android.content.res.Resources.NotFoundException notfoundexception;
        notfoundexception;
        s1 = null;
          goto _L7
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        s1 = null;
          goto _L7
    }

    public static boolean updatePreferenceToSpecificActivityFromMetaDataOrRemove(Context context, PreferenceGroup preferencegroup, String s)
    {
        IconPreferenceScreen iconpreferencescreen;
        Intent intent;
        iconpreferencescreen = (IconPreferenceScreen)preferencegroup.findPreference(s);
        if (iconpreferencescreen == null)
            return false;
        intent = iconpreferencescreen.getIntent();
        if (intent == null) goto _L2; else goto _L1
_L1:
        PackageManager packagemanager;
        List list;
        int i;
        int j;
        packagemanager = context.getPackageManager();
        list = packagemanager.queryIntentActivities(intent, 128);
        i = list.size();
        j = 0;
_L6:
        if (j >= i) goto _L2; else goto _L3
_L3:
        ResolveInfo resolveinfo = (ResolveInfo)list.get(j);
        if ((1 & resolveinfo.activityInfo.applicationInfo.flags) == 0) goto _L5; else goto _L4
_L4:
        android.graphics.drawable.Drawable drawable;
        String s1;
        drawable = null;
        s1 = null;
        Resources resources;
        Bundle bundle;
        resources = packagemanager.getResourcesForApplication(((PackageItemInfo) (resolveinfo.activityInfo)).packageName);
        bundle = resolveinfo.activityInfo.metaData;
        String s2;
        drawable = null;
        s2 = null;
        s1 = null;
        if (resources == null)
            break MISSING_BLOCK_LABEL_198;
        drawable = null;
        s2 = null;
        s1 = null;
        if (bundle == null)
            break MISSING_BLOCK_LABEL_198;
        String s3;
        drawable = resources.getDrawable(bundle.getInt("com.android.settings.icon"));
        s1 = resources.getString(bundle.getInt("com.android.settings.title"));
        s3 = resources.getString(bundle.getInt("com.android.settings.summary"));
        s2 = s3;
_L7:
        if (TextUtils.isEmpty(s1))
            s1 = resolveinfo.loadLabel(packagemanager).toString();
        iconpreferencescreen.setIcon(drawable);
        iconpreferencescreen.setTitle(s1);
        iconpreferencescreen.setSummary(s2);
        iconpreferencescreen.setIntent((new Intent()).setClassName(((PackageItemInfo) (resolveinfo.activityInfo)).packageName, resolveinfo.activityInfo.name));
        return true;
_L5:
        j++;
          goto _L6
_L2:
        preferencegroup.removePreference(iconpreferencescreen);
        return false;
        android.content.res.Resources.NotFoundException notfoundexception;
        notfoundexception;
        s2 = null;
          goto _L7
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        s2 = null;
          goto _L7
    }

    public static boolean updatePreferenceToSpecificActivityOrRemove(Context context, PreferenceGroup preferencegroup, String s, int i)
    {
        Preference preference = preferencegroup.findPreference(s);
        if (preference == null)
            return false;
        Intent intent = preference.getIntent();
        if (intent != null)
        {
            PackageManager packagemanager = context.getPackageManager();
            List list = packagemanager.queryIntentActivities(intent, 0);
            int j = list.size();
            for (int k = 0; k < j; k++)
            {
                ResolveInfo resolveinfo = (ResolveInfo)list.get(k);
                if ((1 & resolveinfo.activityInfo.applicationInfo.flags) != 0)
                {
                    preference.setIntent((new Intent()).setClassName(((PackageItemInfo) (resolveinfo.activityInfo)).packageName, resolveinfo.activityInfo.name));
                    if ((i & 1) != 0)
                        preference.setTitle(resolveinfo.loadLabel(packagemanager));
                    return true;
                }
            }

        }
        preferencegroup.removePreference(preference);
        return false;
    }

}
