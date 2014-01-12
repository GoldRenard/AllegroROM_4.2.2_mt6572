// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.app.StatusBarManager;
import android.content.Context;
import android.content.Intent;
import android.os.UserHandle;
import android.util.AttributeSet;
import android.view.View;
import android.widget.*;
import com.android.systemui.statusbar.policy.*;

public class SettingsView extends LinearLayout
    implements android.view.View.OnClickListener
{

    static final String TAG = "SettingsView";
    AirplaneModeController mAirplane;
    BrightnessController mBrightness;
    DoNotDisturbController mDoNotDisturb;
    AutoRotateController mRotate;
    View mRotationLockContainer;
    View mRotationLockSeparator;

    public SettingsView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SettingsView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    private StatusBarManager getStatusBarManager()
    {
        return (StatusBarManager)getContext().getSystemService("statusbar");
    }

    private void onClickNetwork()
    {
        getContext().startActivity((new Intent("android.settings.WIFI_SETTINGS")).setFlags(0x10000000));
        getStatusBarManager().collapsePanels();
    }

    private void onClickSettings()
    {
        getContext().startActivityAsUser((new Intent("android.settings.SETTINGS")).setFlags(0x10000000), new UserHandle(-2));
        getStatusBarManager().collapsePanels();
    }

    public void onClick(View view)
    {
        switch (view.getId())
        {
        case 2131230995: 
            onClickSettings();
            return;

        case 2131230983: 
            onClickNetwork();
            return;
        }
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mAirplane.release();
        mDoNotDisturb.release();
        mRotate.release();
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        Context context = getContext();
        mAirplane = new AirplaneModeController(context, (CompoundButton)findViewById(0x7f080106));
        findViewById(0x7f080107).setOnClickListener(this);
        mRotationLockContainer = findViewById(0x7f08010a);
        mRotationLockSeparator = findViewById(0x7f08010e);
        mRotate = new AutoRotateController(context, (CompoundButton)findViewById(0x7f08010d), new com.android.systemui.statusbar.policy.AutoRotateController.RotationLockCallbacks() {

            final SettingsView this$0;

            public void setRotationLockControlVisibility(boolean flag)
            {
                View view = mRotationLockContainer;
                byte byte0;
                if (flag)
                    byte0 = 0;
                else
                    byte0 = 8;
                view.setVisibility(byte0);
                View view1 = mRotationLockSeparator;
                byte byte1 = 0;
                if (!flag)
                    byte1 = 8;
                view1.setVisibility(byte1);
            }

            
            {
                this$0 = SettingsView.this;
                super();
            }
        }
);
        mBrightness = new BrightnessController(context, (ImageView)findViewById(0x7f080075), (ToggleSlider)findViewById(0x7f08010f));
        mDoNotDisturb = new DoNotDisturbController(context, (CompoundButton)findViewById(0x7f080112));
        findViewById(0x7f080113).setOnClickListener(this);
    }
}
