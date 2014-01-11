// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.hardware.SensorManager;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.*;
import android.util.Log;
import android.widget.RemoteViews;
import com.android.settings.Utils;
import com.android.settings.bluetooth.LocalBluetoothAdapter;
import com.android.settings.bluetooth.LocalBluetoothManager;
import com.mediatek.settings.ext.ISettingsMiscExt;

public class SettingsAppWidgetProvider extends AppWidgetProvider
{
    private static final class BluetoothStateTracker extends StateTracker
    {

        private static int bluetoothStateToFiveState(int i)
        {
            switch (i)
            {
            case 13: // '\r'
                return 3;

            case 11: // '\013'
                return 2;

            case 12: // '\f'
                return 1;

            case 10: // '\n'
                return 0;
            }
            return 4;
        }

        public int getActualState(Context context)
        {
            if (SettingsAppWidgetProvider.sLocalBluetoothAdapter == null)
            {
                LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(context);
                if (localbluetoothmanager == null)
                    return 4;
                SettingsAppWidgetProvider.sLocalBluetoothAdapter = localbluetoothmanager.getBluetoothAdapter();
            }
            return bluetoothStateToFiveState(SettingsAppWidgetProvider.sLocalBluetoothAdapter.getBluetoothState());
        }

        public int getButtonDescription()
        {
            return 0x7f0b07cb;
        }

        public int getButtonId()
        {
            return 0x7f0801c5;
        }

        public int getButtonImageId(boolean flag)
        {
            return !flag ? 0x7f020043 : 0x7f020044;
        }

        public int getContainerId()
        {
            return 0x7f0801c4;
        }

        public int getIndicatorId()
        {
            return 0x7f0801c6;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            if (!"android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()))
            {
                return;
            } else
            {
                setCurrentState(context, bluetoothStateToFiveState(intent.getIntExtra("android.bluetooth.adapter.extra.STATE", -1)));
                return;
            }
        }

        protected void requestStateChange(Context context, boolean flag)
        {
            if (SettingsAppWidgetProvider.sLocalBluetoothAdapter == null)
            {
                Log.d("SettingsAppWidgetProvider", "No LocalBluetoothManager");
                return;
            } else
            {
                (flag. new AsyncTask() {

                    final BluetoothStateTracker this$0;
                    final boolean val$desiredState;

                    protected volatile Object doInBackground(Object aobj[])
                    {
                        return doInBackground((Void[])aobj);
                    }

                    protected transient Void doInBackground(Void avoid[])
                    {
                        SettingsAppWidgetProvider.sLocalBluetoothAdapter.setBluetoothEnabled(desiredState);
                        return null;
                    }

            
            {
                this$0 = final_bluetoothstatetracker;
                desiredState = Z.this;
                super();
            }
                }
).execute(new Void[0]);
                return;
            }
        }

        private BluetoothStateTracker()
        {
        }

    }

    private static final class GpsStateTracker extends StateTracker
    {

        public int getActualState(Context context)
        {
            return !android.provider.Settings.Secure.isLocationProviderEnabled(context.getContentResolver(), "gps") ? 0 : 1;
        }

        public int getButtonDescription()
        {
            return 0x7f0b07cc;
        }

        public int getButtonId()
        {
            return 0x7f0801c8;
        }

        public int getButtonImageId(boolean flag)
        {
            return !flag ? 0x7f020049 : 0x7f02004a;
        }

        public int getContainerId()
        {
            return 0x7f0801c7;
        }

        public int getIndicatorId()
        {
            return 0x7f0801c9;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            setCurrentState(context, getActualState(context));
        }

        public void requestStateChange(Context context, boolean flag)
        {
            (context. new AsyncTask() {

                final GpsStateTracker this$0;
                final Context val$context;
                final boolean val$desiredState;
                final ContentResolver val$resolver;

                protected transient Boolean doInBackground(Void avoid[])
                {
                    android.provider.Settings.Secure.setLocationProviderEnabled(resolver, "gps", desiredState);
                    return Boolean.valueOf(desiredState);
                }

                protected volatile Object doInBackground(Object aobj[])
                {
                    return doInBackground((Void[])aobj);
                }

                protected void onPostExecute(Boolean boolean1)
                {
                    GpsStateTracker gpsstatetracker = GpsStateTracker.this;
                    Context context1 = context;
                    int i;
                    if (boolean1.booleanValue())
                        i = 1;
                    else
                        i = 0;
                    gpsstatetracker.setCurrentState(context1, i);
                    SettingsAppWidgetProvider.updateWidget(context);
                }

                protected volatile void onPostExecute(Object obj)
                {
                    onPostExecute((Boolean)obj);
                }

            
            {
                this$0 = final_gpsstatetracker;
                resolver = contentresolver;
                desiredState = flag;
                context = Context.this;
                super();
            }
            }
).execute(new Void[0]);
        }

        private GpsStateTracker()
        {
        }

    }

    private static class SettingsObserver extends ContentObserver
    {

        private Context mContext;

        public void onChange(boolean flag)
        {
            Log.d("SettingsAppWidgetProvider", "SettingsObserver , onChange()");
            SettingsAppWidgetProvider.updateWidget(mContext);
        }

        void startObserving()
        {
            ContentResolver contentresolver = mContext.getContentResolver();
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("screen_brightness"), false, this);
            contentresolver.registerContentObserver(android.provider.Settings.System.getUriFor("screen_brightness_mode"), false, this);
        }

        void stopObserving()
        {
            mContext.getContentResolver().unregisterContentObserver(this);
        }

        SettingsObserver(Handler handler, Context context)
        {
            super(handler);
            mContext = context;
        }
    }

    private static abstract class StateTracker
    {

        private Boolean mActualState;
        private boolean mDeferredStateChangeRequestNeeded;
        private boolean mInTransition;
        private Boolean mIntendedState;

        private final String getContentDescription(Context context, int i)
        {
            return context.getString(0x7f0b07c5, new Object[] {
                context.getString(getButtonDescription()), context.getString(i)
            });
        }

        public abstract int getActualState(Context context);

        public abstract int getButtonDescription();

        public abstract int getButtonId();

        public abstract int getButtonImageId(boolean flag);

        public abstract int getContainerId();

        public abstract int getIndicatorId();

        public int getPosition()
        {
            return 1;
        }

        public final int getTriState(Context context)
        {
            if (mInTransition)
                return 5;
            switch (getActualState(context))
            {
            case 1: // '\001'
                return 1;

            case 0: // '\0'
                return 0;
            }
            return 5;
        }

        public final boolean isTurningOn()
        {
            return mIntendedState != null && mIntendedState.booleanValue();
        }

        public abstract void onActualStateChange(Context context, Intent intent);

        protected abstract void requestStateChange(Context context, boolean flag);

        protected final void setCurrentState(Context context, int i)
        {
            boolean flag = mInTransition;
            switch (i)
            {
            case 3: // '\003'
                mInTransition = true;
                mActualState = Boolean.valueOf(true);
                break;

            case 2: // '\002'
                mInTransition = true;
                mActualState = Boolean.valueOf(false);
                break;

            case 1: // '\001'
                mInTransition = false;
                mActualState = Boolean.valueOf(true);
                break;

            case 0: // '\0'
                mInTransition = false;
                mActualState = Boolean.valueOf(false);
                break;
            }
            if (flag && !mInTransition && mDeferredStateChangeRequestNeeded)
            {
                Log.v("SettingsAppWidgetProvider", "processing deferred state change");
                if (mActualState != null && mIntendedState != null && mIntendedState.equals(mActualState))
                    Log.v("SettingsAppWidgetProvider", "... but intended state matches, so no changes.");
                else
                if (mIntendedState != null)
                {
                    mInTransition = true;
                    requestStateChange(context, mIntendedState.booleanValue());
                }
                mDeferredStateChangeRequestNeeded = false;
            }
        }

        public final void setImageViewResources(Context context, RemoteViews remoteviews)
        {
            int i = getContainerId();
            int j = getButtonId();
            int k = getIndicatorId();
            int l = getPosition();
            switch (getTriState(context))
            {
            case 5: // '\005'
                if (isTurningOn())
                {
                    remoteviews.setContentDescription(i, getContentDescription(context, 0x7f0b07c8));
                    remoteviews.setImageViewResource(j, getButtonImageId(true));
                    remoteviews.setImageViewResource(k, SettingsAppWidgetProvider.IND_DRAWABLE_MID[l]);
                    return;
                } else
                {
                    remoteviews.setContentDescription(i, getContentDescription(context, 0x7f0b07c9));
                    remoteviews.setImageViewResource(j, getButtonImageId(false));
                    remoteviews.setImageViewResource(k, SettingsAppWidgetProvider.IND_DRAWABLE_OFF[l]);
                    return;
                }

            case 1: // '\001'
                remoteviews.setContentDescription(i, getContentDescription(context, 0x7f0b07c6));
                remoteviews.setImageViewResource(j, getButtonImageId(true));
                remoteviews.setImageViewResource(k, SettingsAppWidgetProvider.IND_DRAWABLE_ON[l]);
                return;

            case 0: // '\0'
                remoteviews.setContentDescription(i, getContentDescription(context, 0x7f0b07c7));
                remoteviews.setImageViewResource(j, getButtonImageId(false));
                remoteviews.setImageViewResource(k, SettingsAppWidgetProvider.IND_DRAWABLE_OFF[l]);
                return;

            case 2: // '\002'
            case 3: // '\003'
            case 4: // '\004'
            default:
                return;
            }
        }

        public final void toggleState(Context context)
        {
            int i = getTriState(context);
            boolean flag = false;
            switch (i)
            {
            case 2: // '\002'
            case 3: // '\003'
            case 4: // '\004'
            default:
                break;

            case 5: // '\005'
                Boolean boolean1 = mIntendedState;
                flag = false;
                if (boolean1 == null)
                    break;
                if (!mIntendedState.booleanValue())
                    flag = true;
                else
                    flag = false;
                break;

            case 0: // '\0'
                flag = true;
                break;

            case 1: // '\001'
                flag = false;
                break;
            }
            mIntendedState = Boolean.valueOf(flag);
            if (mInTransition)
            {
                mDeferredStateChangeRequestNeeded = true;
                return;
            } else
            {
                mInTransition = true;
                requestStateChange(context, flag);
                return;
            }
        }

        private StateTracker()
        {
            mInTransition = false;
            mActualState = null;
            mIntendedState = null;
            mDeferredStateChangeRequestNeeded = false;
        }

    }

    private static final class SyncStateTracker extends StateTracker
    {

        public int getActualState(Context context)
        {
            return !ContentResolver.getMasterSyncAutomatically() ? 0 : 1;
        }

        public int getButtonDescription()
        {
            return 0x7f0b07cd;
        }

        public int getButtonId()
        {
            return 0x7f0801cb;
        }

        public int getButtonImageId(boolean flag)
        {
            return !flag ? 0x7f02004b : 0x7f02004c;
        }

        public int getContainerId()
        {
            return 0x7f0801ca;
        }

        public int getIndicatorId()
        {
            return 0x7f0801cc;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            setCurrentState(context, getActualState(context));
        }

        public void requestStateChange(Context context, final boolean desiredState)
        {
            ConnectivityManager _tmp = (ConnectivityManager)context.getSystemService("connectivity");
            (context. new AsyncTask() {

                final SyncStateTracker this$0;
                final Context val$context;
                final boolean val$desiredState;
                final boolean val$sync;

                protected transient Boolean doInBackground(Void avoid[])
                {
                    if (desiredState)
                    {
                        if (!sync)
                            ContentResolver.setMasterSyncAutomatically(true);
                        return Boolean.valueOf(true);
                    }
                    if (sync)
                        ContentResolver.setMasterSyncAutomatically(false);
                    return Boolean.valueOf(false);
                }

                protected volatile Object doInBackground(Object aobj[])
                {
                    return doInBackground((Void[])aobj);
                }

                protected void onPostExecute(Boolean boolean1)
                {
                    SyncStateTracker syncstatetracker = SyncStateTracker.this;
                    Context context1 = context;
                    int i;
                    if (boolean1.booleanValue())
                        i = 1;
                    else
                        i = 0;
                    syncstatetracker.setCurrentState(context1, i);
                    SettingsAppWidgetProvider.updateWidget(context);
                }

                protected volatile void onPostExecute(Object obj)
                {
                    onPostExecute((Boolean)obj);
                }

            
            {
                this$0 = final_syncstatetracker;
                desiredState = flag;
                sync = flag1;
                context = Context.this;
                super();
            }
            }
).execute(new Void[0]);
        }

        private SyncStateTracker()
        {
        }

    }

    private static final class WifiStateTracker extends StateTracker
    {

        private static int wifiStateToFiveState(int i)
        {
            switch (i)
            {
            case 2: // '\002'
                return 2;

            case 0: // '\0'
                return 3;

            case 3: // '\003'
                return 1;

            case 1: // '\001'
                return 0;
            }
            return 4;
        }

        public int getActualState(Context context)
        {
            WifiManager wifimanager = (WifiManager)context.getApplicationContext().getSystemService("wifi");
            if (wifimanager != null)
                return wifiStateToFiveState(wifimanager.getWifiState());
            else
                return 4;
        }

        public int getButtonDescription()
        {
            return 0x7f0b07ca;
        }

        public int getButtonId()
        {
            return 0x7f0801c2;
        }

        public int getButtonImageId(boolean flag)
        {
            return !flag ? 0x7f02004d : 0x7f02004e;
        }

        public int getContainerId()
        {
            return 0x7f0801c1;
        }

        public int getIndicatorId()
        {
            return 0x7f0801c3;
        }

        public int getPosition()
        {
            return 0;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            if (!"android.net.wifi.WIFI_STATE_CHANGED".equals(intent.getAction()))
            {
                return;
            } else
            {
                setCurrentState(context, wifiStateToFiveState(intent.getIntExtra("wifi_state", -1)));
                return;
            }
        }

        protected void requestStateChange(Context context, boolean flag)
        {
            final WifiManager wifiManager = (WifiManager)context.getApplicationContext().getSystemService("wifi");
            if (wifiManager == null)
            {
                Log.d("SettingsAppWidgetProvider", "No wifiManager.");
                return;
            } else
            {
                (flag. new AsyncTask() {

                    final WifiStateTracker this$0;
                    final boolean val$desiredState;
                    final WifiManager val$wifiManager;

                    protected volatile Object doInBackground(Object aobj[])
                    {
                        return doInBackground((Void[])aobj);
                    }

                    protected transient Void doInBackground(Void avoid[])
                    {
                        int i = wifiManager.getWifiApState();
                        if (desiredState && (i == 12 || i == 13))
                            wifiManager.setWifiApEnabled(null, false);
                        wifiManager.setWifiEnabled(desiredState);
                        return null;
                    }

            
            {
                this$0 = final_wifistatetracker;
                wifiManager = wifimanager;
                desiredState = Z.this;
                super();
            }
                }
).execute(new Void[0]);
                return;
            }
        }

        private WifiStateTracker()
        {
        }

    }


    private static final int BUTTON_BLUETOOTH = 4;
    private static final int BUTTON_BRIGHTNESS = 1;
    private static final int BUTTON_GPS = 3;
    private static final int BUTTON_SYNC = 2;
    private static final int BUTTON_WIFI = 0;
    private static final float FULL_BRIGHTNESS_THRESHOLD = 0.8F;
    private static final float HALF_BRIGHTNESS_THRESHOLD = 0.3F;
    private static final int IND_DRAWABLE_MID[] = {
        0x7f02000f, 0x7f02000e, 0x7f020010
    };
    private static final int IND_DRAWABLE_OFF[] = {
        0x7f020012, 0x7f020011, 0x7f020013
    };
    private static final int IND_DRAWABLE_ON[] = {
        0x7f020015, 0x7f020014, 0x7f020016
    };
    private static final int POS_CENTER = 1;
    private static final int POS_LEFT = 0;
    private static final int POS_RIGHT = 2;
    private static final int STATE_DISABLED = 0;
    private static final int STATE_ENABLED = 1;
    private static final int STATE_INTERMEDIATE = 5;
    private static final int STATE_TURNING_OFF = 3;
    private static final int STATE_TURNING_ON = 2;
    private static final int STATE_UNKNOWN = 4;
    static final String TAG = "SettingsAppWidgetProvider";
    static final ComponentName THIS_APPWIDGET = new ComponentName("com.android.settings", "com.android.settings.widget.SettingsAppWidgetProvider");
    private static final StateTracker sBluetoothState = new BluetoothStateTracker();
    private static final StateTracker sGpsState = new GpsStateTracker();
    private static LocalBluetoothAdapter sLocalBluetoothAdapter = null;
    private static SettingsObserver sSettingsObserver;
    private static final StateTracker sSyncState = new SyncStateTracker();
    private static final StateTracker sWifiState = new WifiStateTracker();


    static RemoteViews buildUpdate(Context context)
    {
        Log.d("SettingsAppWidgetProvider", "buildUpdate()");
        RemoteViews remoteviews = new RemoteViews(context.getPackageName(), 0x7f0400a1);
        remoteviews.setOnClickPendingIntent(0x7f0801c1, getLaunchPendingIntent(context, 0));
        remoteviews.setOnClickPendingIntent(0x7f0801cd, getLaunchPendingIntent(context, 1));
        remoteviews.setOnClickPendingIntent(0x7f0801ca, getLaunchPendingIntent(context, 2));
        remoteviews.setOnClickPendingIntent(0x7f0801c7, getLaunchPendingIntent(context, 3));
        remoteviews.setOnClickPendingIntent(0x7f0801c4, getLaunchPendingIntent(context, 4));
        updateButtons(remoteviews, context);
        return remoteviews;
    }

    private static void checkObserver(Context context)
    {
        if (sSettingsObserver == null)
        {
            sSettingsObserver = new SettingsObserver(new Handler(), context.getApplicationContext());
            sSettingsObserver.startObserving();
        }
    }

    private static int getBrightness(Context context)
    {
        int i;
        try
        {
            i = android.provider.Settings.System.getInt(context.getContentResolver(), "screen_brightness");
        }
        catch (Exception exception)
        {
            return 0;
        }
        return i;
    }

    private static boolean getBrightnessMode(Context context)
    {
        int i;
        try
        {
            i = android.provider.Settings.System.getInt(context.getContentResolver(), "screen_brightness_mode");
        }
        catch (Exception exception)
        {
            Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("getBrightnessMode: ").append(exception).toString());
            return false;
        }
        return i == 1;
    }

    private static PendingIntent getLaunchPendingIntent(Context context, int i)
    {
        Intent intent = new Intent();
        intent.setClass(context, com/android/settings/widget/SettingsAppWidgetProvider);
        intent.addCategory("android.intent.category.ALTERNATIVE");
        intent.setData(Uri.parse((new StringBuilder()).append("custom:").append(i).toString()));
        PendingIntent pendingintent = PendingIntent.getBroadcast(context, 0, intent, 0);
        Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("PendingIntent , buttonId = ").append(i).append(" pi = ").append(pendingintent).toString());
        return pendingintent;
    }

    private void toggleBrightness(Context context)
    {
        IPowerManager ipowermanager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        if (ipowermanager == null) goto _L2; else goto _L1
_L1:
        PowerManager powermanager;
        ContentResolver contentresolver;
        int i;
        SensorManager sensormanager;
        powermanager = (PowerManager)context.getSystemService("power");
        contentresolver = context.getContentResolver();
        i = android.provider.Settings.System.getInt(contentresolver, "screen_brightness");
        sensormanager = (SensorManager)context.getSystemService("sensor");
        int j;
        j = 0;
        if (sensormanager == null)
            break MISSING_BLOCK_LABEL_86;
        android.hardware.Sensor sensor = sensormanager.getDefaultSensor(5);
        j = 0;
        if (sensor == null)
            break MISSING_BLOCK_LABEL_86;
        j = android.provider.Settings.System.getInt(contentresolver, "screen_brightness_mode");
        Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("begin ------toggleBrightness() ,brightnessMode =").append(j).append(" brightness = ").append(i).toString());
        if (j != 1) goto _L4; else goto _L3
_L3:
        int k = powermanager.getMinimumScreenBrightnessSetting();
        j = 0;
_L10:
        if (!context.getResources().getBoolean(0x1110018)) goto _L6; else goto _L5
_L5:
        android.provider.Settings.System.putInt(context.getContentResolver(), "screen_brightness_mode", j);
_L8:
        if (j != 0)
            break MISSING_BLOCK_LABEL_216;
        Log.i("SettingsAppWidgetProvider", (new StringBuilder()).append("-----------toggleBrightness()----setBacklightBrightness()----brightness: ").append(k).toString());
        ipowermanager.setTemporaryScreenBrightnessSettingOverride(k);
        android.provider.Settings.System.putInt(contentresolver, "screen_brightness", k);
        Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("end ------toggleBrightness(),brightnessMode =").append(android.provider.Settings.System.getInt(contentresolver, "screen_brightness_mode")).append(" brightness = ").append(android.provider.Settings.System.getInt(contentresolver, "screen_brightness")).toString());
        return;
_L4:
        if (i < powermanager.getDefaultScreenBrightnessSetting())
        {
            k = powermanager.getDefaultScreenBrightnessSetting();
            continue; /* Loop/switch isn't completed */
        }
        if (i < powermanager.getMaximumScreenBrightnessSetting())
        {
            k = powermanager.getMaximumScreenBrightnessSetting();
            continue; /* Loop/switch isn't completed */
        }
        Log.d("SettingsAppWidgetProvider", "toggleBrightness(),MAXIMUM -> AUTO");
        j = 1;
        int l = powermanager.getMinimumScreenBrightnessSetting();
        k = l;
        continue; /* Loop/switch isn't completed */
_L6:
        j = 0;
        if (true) goto _L8; else goto _L7
_L7:
        RemoteException remoteexception;
        remoteexception;
        Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("toggleBrightness1: ").append(remoteexception).toString());
        return;
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        settingnotfoundexception;
        Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("toggleBrightness2: ").append(settingnotfoundexception).toString());
_L2:
        return;
        if (true) goto _L10; else goto _L9
_L9:
    }

    private static void updateButtons(RemoteViews remoteviews, Context context)
    {
        Log.d("SettingsAppWidgetProvider", "updateButtons()");
        sWifiState.setImageViewResources(context, remoteviews);
        sBluetoothState.setImageViewResources(context, remoteviews);
        sGpsState.setImageViewResources(context, remoteviews);
        sSyncState.setImageViewResources(context, remoteviews);
        if (getBrightnessMode(context))
        {
            Log.d("SettingsAppWidgetProvider", "updateButtons , getBrightnessMode(context) == true, auto");
            Object aobj3[] = new Object[1];
            aobj3[0] = context.getString(0x7f0b07cf);
            remoteviews.setContentDescription(0x7f0801cd, context.getString(0x7f0b07ce, aobj3));
            remoteviews.setImageViewResource(0x7f0801ce, 0x7f020045);
            remoteviews.setImageViewResource(0x7f0801cf, 0x7f020016);
            return;
        }
        int i = getBrightness(context);
        Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("updateButtons, getBrightnessMode(context) == false ,manual , brightness = ").append(i).toString());
        PowerManager powermanager = (PowerManager)context.getSystemService("power");
        int j = (int)(0.8F * (float)powermanager.getMaximumScreenBrightnessSetting());
        int k = (int)(0.3F * (float)powermanager.getMaximumScreenBrightnessSetting());
        if (i > j)
        {
            Object aobj2[] = new Object[1];
            aobj2[0] = context.getString(0x7f0b07d0);
            remoteviews.setContentDescription(0x7f0801cd, context.getString(0x7f0b07ce, aobj2));
            remoteviews.setImageViewResource(0x7f0801ce, 0x7f020046);
        } else
        if (i > k)
        {
            Object aobj1[] = new Object[1];
            aobj1[0] = context.getString(0x7f0b07d1);
            remoteviews.setContentDescription(0x7f0801cd, context.getString(0x7f0b07ce, aobj1));
            remoteviews.setImageViewResource(0x7f0801ce, 0x7f020047);
        } else
        {
            Object aobj[] = new Object[1];
            aobj[0] = context.getString(0x7f0b07d2);
            remoteviews.setContentDescription(0x7f0801cd, context.getString(0x7f0b07ce, aobj));
            remoteviews.setImageViewResource(0x7f0801ce, 0x7f020048);
        }
        if (i > k)
        {
            remoteviews.setImageViewResource(0x7f0801cf, 0x7f020016);
            return;
        } else
        {
            remoteviews.setImageViewResource(0x7f0801cf, 0x7f020013);
            return;
        }
    }

    public static void updateWidget(Context context)
    {
        Log.d("SettingsAppWidgetProvider", "updateWidget()");
        RemoteViews remoteviews = buildUpdate(context);
        AppWidgetManager.getInstance(context).updateAppWidget(THIS_APPWIDGET, remoteviews);
        checkObserver(context);
    }

    public void onDisabled(Context context)
    {
        if (sSettingsObserver != null)
        {
            sSettingsObserver.stopObserving();
            sSettingsObserver = null;
        }
    }

    public void onEnabled(Context context)
    {
        checkObserver(context);
    }

    public void onReceive(Context context, Intent intent)
    {
label0:
        {
            super.onReceive(context, intent);
            String s = intent.getAction();
            Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("onReceive , action = ").append(s).toString());
            Log.d("SettingsAppWidgetProvider", (new StringBuilder()).append("onReceive , intent.hasCategory(Intent.CATEGORY_ALTERNATIVE)= ").append(intent.hasCategory("android.intent.category.ALTERNATIVE")).toString());
            if ("android.net.wifi.WIFI_STATE_CHANGED".equals(s))
                sWifiState.onActualStateChange(context, intent);
            else
            if ("android.bluetooth.adapter.action.STATE_CHANGED".equals(s))
                sBluetoothState.onActualStateChange(context, intent);
            else
            if ("android.location.PROVIDERS_CHANGED".equals(s))
                sGpsState.onActualStateChange(context, intent);
            else
            if (SyncStorageEngine.SYNC_CONNECTION_SETTING_CHANGED_INTENT.getAction().equals(s))
            {
                sSyncState.onActualStateChange(context, intent);
            } else
            {
                if (!intent.hasCategory("android.intent.category.ALTERNATIVE"))
                    break label0;
                int i = Integer.parseInt(intent.getData().getSchemeSpecificPart());
                if (i == 0)
                {
                    if (Utils.getMiscPlugin(context).isWifiToggleCouldDisabled(context))
                        sWifiState.toggleState(context);
                } else
                if (i == 1)
                    toggleBrightness(context);
                else
                if (i == 2)
                    sSyncState.toggleState(context);
                else
                if (i == 3)
                    sGpsState.toggleState(context);
                else
                if (i == 4)
                    sBluetoothState.toggleState(context);
            }
            updateWidget(context);
        }
    }

    public void onUpdate(Context context, AppWidgetManager appwidgetmanager, int ai[])
    {
        Log.d("SettingsAppWidgetProvider", "onUpdate()");
        RemoteViews remoteviews = buildUpdate(context);
        for (int i = 0; i < ai.length; i++)
            appwidgetmanager.updateAppWidget(ai[i], remoteviews);

    }







/*
    static LocalBluetoothAdapter access$802(LocalBluetoothAdapter localbluetoothadapter)
    {
        sLocalBluetoothAdapter = localbluetoothadapter;
        return localbluetoothadapter;
    }

*/
}
