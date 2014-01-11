// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.admin;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Handler;
import android.os.RemoteCallback;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserHandle;
import android.util.Log;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.util.Iterator;
import java.util.List;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package android.app.admin:
//            IDevicePolicyManager, DeviceAdminInfo

public class DevicePolicyManager
{

    public static final String ACTION_ADD_DEVICE_ADMIN = "android.app.action.ADD_DEVICE_ADMIN";
    public static final String ACTION_DEVICE_POLICY_MANAGER_STATE_CHANGED = "android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED";
    public static final String ACTION_SET_NEW_PASSWORD = "android.app.action.SET_NEW_PASSWORD";
    public static final String ACTION_START_ENCRYPTION = "android.app.action.START_ENCRYPTION";
    public static final int ENCRYPTION_STATUS_ACTIVATING = 2;
    public static final int ENCRYPTION_STATUS_ACTIVE = 3;
    public static final int ENCRYPTION_STATUS_INACTIVE = 1;
    public static final int ENCRYPTION_STATUS_UNSUPPORTED = 0;
    public static final String EXTRA_ADD_EXPLANATION = "android.app.extra.ADD_EXPLANATION";
    public static final String EXTRA_DEVICE_ADMIN = "android.app.extra.DEVICE_ADMIN";
    public static final int KEYGUARD_DISABLE_FEATURES_ALL = 0x7fffffff;
    public static final int KEYGUARD_DISABLE_FEATURES_NONE = 0;
    public static final int KEYGUARD_DISABLE_SECURE_CAMERA = 2;
    public static final int KEYGUARD_DISABLE_WIDGETS_ALL = 1;
    public static final int PASSWORD_QUALITY_ALPHABETIC = 0x40000;
    public static final int PASSWORD_QUALITY_ALPHANUMERIC = 0x50000;
    public static final int PASSWORD_QUALITY_BIOMETRIC_WEAK = 32768;
    public static final int PASSWORD_QUALITY_COMPLEX = 0x60000;
    public static final int PASSWORD_QUALITY_NUMERIC = 0x20000;
    public static final int PASSWORD_QUALITY_SOMETHING = 0x10000;
    public static final int PASSWORD_QUALITY_UNSPECIFIED = 0;
    public static final int PASSWORD_QUALITY_VOICE_WEAK = 16384;
    public static final int RESET_PASSWORD_REQUIRE_ENTRY = 1;
    private static String TAG = "DevicePolicyManager";
    public static final int WIPE_EXTERNAL_STORAGE = 1;
    private final Context mContext;
    private final IDevicePolicyManager mService = IDevicePolicyManager.Stub.asInterface(ServiceManager.getService("device_policy"));

    private DevicePolicyManager(Context context, Handler handler)
    {
        mContext = context;
    }

    public static DevicePolicyManager create(Context context, Handler handler)
    {
        DevicePolicyManager devicepolicymanager = new DevicePolicyManager(context, handler);
        if (devicepolicymanager.mService != null)
            return devicepolicymanager;
        else
            return null;
    }

    public List getActiveAdmins()
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_33;
        List list = mService.getActiveAdmins(UserHandle.myUserId());
        return list;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return null;
    }

    public DeviceAdminInfo getAdminInfo(ComponentName componentname)
    {
        android.content.pm.ActivityInfo activityinfo;
        ResolveInfo resolveinfo;
        DeviceAdminInfo deviceadmininfo;
        try
        {
            activityinfo = mContext.getPackageManager().getReceiverInfo(componentname, 128);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w(TAG, (new StringBuilder()).append("Unable to retrieve device policy ").append(componentname).toString(), namenotfoundexception);
            return null;
        }
        resolveinfo = new ResolveInfo();
        resolveinfo.activityInfo = activityinfo;
        try
        {
            deviceadmininfo = new DeviceAdminInfo(mContext, resolveinfo);
        }
        catch (XmlPullParserException xmlpullparserexception)
        {
            Log.w(TAG, (new StringBuilder()).append("Unable to parse device policy ").append(componentname).toString(), xmlpullparserexception);
            return null;
        }
        catch (IOException ioexception)
        {
            Log.w(TAG, (new StringBuilder()).append("Unable to parse device policy ").append(componentname).toString(), ioexception);
            return null;
        }
        return deviceadmininfo;
    }

    public boolean getCameraDisabled(ComponentName componentname)
    {
        return getCameraDisabled(componentname, UserHandle.myUserId());
    }

    public boolean getCameraDisabled(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        boolean flag = mService.getCameraDisabled(componentname, i);
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return false;
    }

    public int getCurrentFailedPasswordAttempts()
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_33;
        int i = mService.getCurrentFailedPasswordAttempts(UserHandle.myUserId());
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return -1;
    }

    public ComponentName getGlobalProxyAdmin()
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_33;
        ComponentName componentname = mService.getGlobalProxyAdmin(UserHandle.myUserId());
        return componentname;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return null;
    }

    public int getKeyguardDisabledFeatures(ComponentName componentname)
    {
        return getKeyguardDisabledFeatures(componentname, UserHandle.myUserId());
    }

    public int getKeyguardDisabledFeatures(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getKeyguardDisabledFeatures(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getMaximumFailedPasswordsForWipe(ComponentName componentname)
    {
        return getMaximumFailedPasswordsForWipe(componentname, UserHandle.myUserId());
    }

    public int getMaximumFailedPasswordsForWipe(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getMaximumFailedPasswordsForWipe(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public long getMaximumTimeToLock(ComponentName componentname)
    {
        return getMaximumTimeToLock(componentname, UserHandle.myUserId());
    }

    public long getMaximumTimeToLock(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        long l = mService.getMaximumTimeToLock(componentname, i);
        return l;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0L;
    }

    public long getPasswordExpiration(ComponentName componentname)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_36;
        long l = mService.getPasswordExpiration(componentname, UserHandle.myUserId());
        return l;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0L;
    }

    public long getPasswordExpirationTimeout(ComponentName componentname)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_36;
        long l = mService.getPasswordExpirationTimeout(componentname, UserHandle.myUserId());
        return l;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0L;
    }

    public int getPasswordHistoryLength(ComponentName componentname)
    {
        return getPasswordHistoryLength(componentname, UserHandle.myUserId());
    }

    public int getPasswordHistoryLength(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordHistoryLength(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordMaximumLength(int i)
    {
        return 16;
    }

    public int getPasswordMinimumLength(ComponentName componentname)
    {
        return getPasswordMinimumLength(componentname, UserHandle.myUserId());
    }

    public int getPasswordMinimumLength(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordMinimumLength(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordMinimumLetters(ComponentName componentname)
    {
        return getPasswordMinimumLetters(componentname, UserHandle.myUserId());
    }

    public int getPasswordMinimumLetters(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordMinimumLetters(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordMinimumLowerCase(ComponentName componentname)
    {
        return getPasswordMinimumLowerCase(componentname, UserHandle.myUserId());
    }

    public int getPasswordMinimumLowerCase(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordMinimumLowerCase(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordMinimumNonLetter(ComponentName componentname)
    {
        return getPasswordMinimumNonLetter(componentname, UserHandle.myUserId());
    }

    public int getPasswordMinimumNonLetter(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordMinimumNonLetter(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordMinimumNumeric(ComponentName componentname)
    {
        return getPasswordMinimumNumeric(componentname, UserHandle.myUserId());
    }

    public int getPasswordMinimumNumeric(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordMinimumNumeric(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordMinimumSymbols(ComponentName componentname)
    {
        return getPasswordMinimumSymbols(componentname, UserHandle.myUserId());
    }

    public int getPasswordMinimumSymbols(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordMinimumSymbols(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordMinimumUpperCase(ComponentName componentname)
    {
        return getPasswordMinimumUpperCase(componentname, UserHandle.myUserId());
    }

    public int getPasswordMinimumUpperCase(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordMinimumUpperCase(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public int getPasswordQuality(ComponentName componentname)
    {
        return getPasswordQuality(componentname, UserHandle.myUserId());
    }

    public int getPasswordQuality(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_34;
        int j = mService.getPasswordQuality(componentname, i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public void getRemoveWarning(ComponentName componentname, RemoteCallback remotecallback)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.getRemoveWarning(componentname, remotecallback, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public boolean getStorageEncryption(ComponentName componentname)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_36;
        boolean flag = mService.getStorageEncryption(componentname, UserHandle.myUserId());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return false;
    }

    public int getStorageEncryptionStatus()
    {
        return getStorageEncryptionStatus(UserHandle.myUserId());
    }

    public int getStorageEncryptionStatus(int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_33;
        int j = mService.getStorageEncryptionStatus(i);
        return j;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public boolean hasGrantedPolicy(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_37;
        boolean flag = mService.hasGrantedPolicy(componentname, i, UserHandle.myUserId());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return false;
    }

    public boolean isActivePasswordSufficient()
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_33;
        boolean flag = mService.isActivePasswordSufficient(UserHandle.myUserId());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return false;
    }

    public boolean isAdminActive(ComponentName componentname)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_36;
        boolean flag = mService.isAdminActive(componentname, UserHandle.myUserId());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return false;
    }

    public void lockNow()
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_16;
        mService.lockNow();
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public boolean packageHasActiveAdmins(String s)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_36;
        boolean flag = mService.packageHasActiveAdmins(s, UserHandle.myUserId());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return false;
    }

    public void removeActiveAdmin(ComponentName componentname)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_20;
        mService.removeActiveAdmin(componentname, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void reportFailedPasswordAttempt(int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_17;
        mService.reportFailedPasswordAttempt(i);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void reportSuccessfulPasswordAttempt(int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_17;
        mService.reportSuccessfulPasswordAttempt(i);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public boolean resetPassword(String s, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_37;
        boolean flag = mService.resetPassword(s, i, UserHandle.myUserId());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return false;
    }

    public void setActiveAdmin(ComponentName componentname, boolean flag)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setActiveAdmin(componentname, flag, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setActivePasswordState(int i, int j, int k, int l, int i1, int j1, int k1, 
            int l1, int i2)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_31;
        mService.setActivePasswordState(i, j, k, l, i1, j1, k1, l1, i2);
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setCameraDisabled(ComponentName componentname, boolean flag)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setCameraDisabled(componentname, flag, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public ComponentName setGlobalProxy(ComponentName componentname, Proxy proxy, List list)
    {
        if (proxy == null)
            throw new NullPointerException();
        if (mService == null) goto _L2; else goto _L1
_L1:
        if (!proxy.equals(Proxy.NO_PROXY)) goto _L4; else goto _L3
_L3:
        String s;
        String s1;
        s = null;
        s1 = null;
_L8:
        return mService.setGlobalProxy(componentname, s, s1, UserHandle.myUserId());
_L4:
        if (!proxy.type().equals(java.net.Proxy.Type.HTTP))
            throw new IllegalArgumentException();
          goto _L5
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
_L2:
        return null;
_L5:
        String s2;
        int i;
        InetSocketAddress inetsocketaddress = (InetSocketAddress)proxy.address();
        s2 = inetsocketaddress.getHostName();
        i = inetsocketaddress.getPort();
        s = (new StringBuilder()).append(s2).append(":").append(Integer.toString(i)).toString();
        if (list != null) goto _L7; else goto _L6
_L6:
        s1 = "";
_L12:
        android.net.Proxy.validate(s2, Integer.toString(i), s1);
          goto _L8
_L7:
        StringBuilder stringbuilder = new StringBuilder();
        boolean flag = true;
        Iterator iterator = list.iterator();
_L11:
        if (!iterator.hasNext()) goto _L10; else goto _L9
_L9:
        String s4 = (String)iterator.next();
        if (flag)
            break MISSING_BLOCK_LABEL_253;
        stringbuilder = stringbuilder.append(",");
_L13:
        stringbuilder = stringbuilder.append(s4.trim());
          goto _L11
_L10:
        String s3 = stringbuilder.toString();
        s1 = s3;
          goto _L12
        flag = false;
          goto _L13
    }

    public void setKeyguardDisabledFeatures(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setKeyguardDisabledFeatures(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setMaximumFailedPasswordsForWipe(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setMaximumFailedPasswordsForWipe(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setMaximumTimeToLock(ComponentName componentname, long l)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setMaximumTimeToLock(componentname, l, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordExpirationTimeout(ComponentName componentname, long l)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordExpirationTimeout(componentname, l, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordHistoryLength(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordHistoryLength(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordMinimumLength(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordMinimumLength(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordMinimumLetters(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordMinimumLetters(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordMinimumLowerCase(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordMinimumLowerCase(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordMinimumNonLetter(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordMinimumNonLetter(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordMinimumNumeric(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordMinimumNumeric(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordMinimumSymbols(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordMinimumSymbols(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordMinimumUpperCase(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordMinimumUpperCase(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public void setPasswordQuality(ComponentName componentname, int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_21;
        mService.setPasswordQuality(componentname, i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

    public int setStorageEncryption(ComponentName componentname, boolean flag)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_37;
        int i = mService.setStorageEncryption(componentname, flag, UserHandle.myUserId());
        return i;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return 0;
    }

    public void wipeData(int i)
    {
        if (mService == null)
            break MISSING_BLOCK_LABEL_20;
        mService.wipeData(i, UserHandle.myUserId());
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.w(TAG, "Failed talking with device policy service", remoteexception);
        return;
    }

}
