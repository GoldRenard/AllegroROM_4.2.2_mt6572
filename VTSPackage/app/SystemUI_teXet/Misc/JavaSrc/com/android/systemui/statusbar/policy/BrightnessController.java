// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.hardware.SensorManager;
import android.os.*;
import android.widget.ImageView;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.android.systemui.statusbar.policy:
//            CurrentUserTracker, ToggleSlider

public class BrightnessController
    implements ToggleSlider.Listener
{
    public static interface BrightnessStateChangeCallback
    {

        public abstract void onBrightnessLevelChanged();
    }


    private static final String TAG = "StatusBar.BrightnessController";
    private final boolean mAutomaticAvailable;
    private ArrayList mChangeCallbacks;
    private final Context mContext;
    private final ToggleSlider mControl;
    private final ImageView mIcon;
    private final int mMaximumBacklight;
    private final int mMinimumBacklight;
    private final IPowerManager mPower = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
    private final CurrentUserTracker mUserTracker;

    public BrightnessController(Context context, ImageView imageview, ToggleSlider toggleslider)
    {
        mChangeCallbacks = new ArrayList();
        mContext = context;
        mIcon = imageview;
        mControl = toggleslider;
        mUserTracker = new CurrentUserTracker(mContext);
        PowerManager powermanager = (PowerManager)context.getSystemService("power");
        mMinimumBacklight = powermanager.getMinimumScreenBrightnessSetting();
        mMaximumBacklight = powermanager.getMaximumScreenBrightnessSetting();
        boolean flag;
        if (((SensorManager)context.getSystemService("sensor")).getDefaultSensor(5) != null)
            flag = true;
        else
            flag = false;
        mAutomaticAvailable = flag;
        Xlog.d("StatusBar.BrightnessController", (new StringBuilder()).append("mAutomaticAvailable=").append(mAutomaticAvailable).toString());
        toggleslider.setOnChangedListener(this);
    }

    private void setBrightness(int i)
    {
        try
        {
            mPower.setTemporaryScreenBrightnessSettingOverride(i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void setMode(int i)
    {
        android.provider.Settings.System.putIntForUser(mContext.getContentResolver(), "screen_brightness_mode", i, mUserTracker.getCurrentUserId());
    }

    private void updateIcon(boolean flag)
    {
        if (mIcon != null)
        {
            ImageView imageview = mIcon;
            int i;
            if (flag)
                i = 0x7f020052;
            else
                i = 0x7f020051;
            imageview.setImageResource(i);
        }
    }

    public void addStateChangedCallback(BrightnessStateChangeCallback brightnessstatechangecallback)
    {
        mChangeCallbacks.add(brightnessstatechangecallback);
    }

    public void onChanged(ToggleSlider toggleslider, boolean flag, boolean flag1, int i)
    {
        int j;
        if (flag1)
            j = 1;
        else
            j = 0;
        setMode(j);
        updateIcon(flag1);
        if (!flag1)
        {
            final int val = i + mMinimumBacklight;
            setBrightness(val);
            if (!flag)
                AsyncTask.execute(new Runnable() {

                    final BrightnessController this$0;
                    final int val$val;

                    public void run()
                    {
                        android.provider.Settings.System.putIntForUser(mContext.getContentResolver(), "screen_brightness", val, mUserTracker.getCurrentUserId());
                    }

            
            {
                this$0 = BrightnessController.this;
                val = i;
                super();
            }
                }
);
        }
        for (Iterator iterator = mChangeCallbacks.iterator(); iterator.hasNext(); ((BrightnessStateChangeCallback)iterator.next()).onBrightnessLevelChanged());
    }

    public void onInit(ToggleSlider toggleslider)
    {
        boolean flag = true;
        if (!mAutomaticAvailable) goto _L2; else goto _L1
_L1:
        int l = android.provider.Settings.System.getIntForUser(mContext.getContentResolver(), "screen_brightness_mode", mUserTracker.getCurrentUserId());
        int k = l;
_L3:
        int i;
        int j;
        android.provider.Settings.SettingNotFoundException settingnotfoundexception1;
        boolean flag1;
        if (k != 0)
            flag1 = flag;
        else
            flag1 = false;
        toggleslider.setChecked(flag1);
        if (k == 0)
            flag = false;
        updateIcon(flag);
_L4:
        j = android.provider.Settings.System.getIntForUser(mContext.getContentResolver(), "screen_brightness", mUserTracker.getCurrentUserId());
        i = j;
_L5:
        toggleslider.setMax(mMaximumBacklight - mMinimumBacklight);
        toggleslider.setValue(i - mMinimumBacklight);
        return;
        settingnotfoundexception1;
        k = 0;
          goto _L3
_L2:
        toggleslider.setChecked(false);
        updateIcon(false);
        toggleslider.hideToggle();
          goto _L4
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        settingnotfoundexception;
        i = mMaximumBacklight;
          goto _L5
    }


}
