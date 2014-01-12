// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import com.android.systemui.statusbar.GestureRecorder;
import com.android.systemui.statusbar.policy.*;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PanelView, PhoneStatusBarView, PhoneStatusBar, QuickSettingsContainerView, 
//            QuickSettings, PanelBar

public class SettingsPanelView extends PanelView
{

    Drawable mHandleBar;
    int mHandleBarHeight;
    View mHandleView;
    private QuickSettings mQS;
    private QuickSettingsContainerView mQSContainer;

    public SettingsPanelView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        int i = getHeight() - mHandleBarHeight - getPaddingBottom();
        canvas.translate(0.0F, i);
        mHandleBar.setState(mHandleView.getDrawableState());
        mHandleBar.draw(canvas);
        canvas.translate(0.0F, -i);
    }

    public void fling(float f, boolean flag)
    {
        GestureRecorder gesturerecorder = ((PhoneStatusBarView)super.mBar).mBar.getGestureRecorder();
        if (gesturerecorder != null)
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("fling ");
            String s;
            if (f > 0.0F)
                s = "open";
            else
                s = "closed";
            gesturerecorder.tag(stringbuilder.append(s).toString(), (new StringBuilder()).append("settings,v=").append(f).toString());
        }
        super.fling(f, flag);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mQSContainer = (QuickSettingsContainerView)findViewById(0x7f08003e);
        Resources resources = getContext().getResources();
        mHandleBar = resources.getDrawable(0x7f020233);
        mHandleBarHeight = resources.getDimensionPixelSize(0x7f0d0033);
        mHandleView = findViewById(0x7f080037);
        setContentDescription(resources.getString(0x7f0b00c5));
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        if (flag)
        {
            int i1 = getPaddingLeft();
            int j1 = getPaddingRight();
            mHandleBar.setBounds(i1, 0, getWidth() - j1, mHandleBarHeight);
        }
    }

    public void setBar(PanelBar panelbar)
    {
        super.setBar(panelbar);
        if (mQS != null)
            mQS.setBar(panelbar);
    }

    public void setImeWindowStatus(boolean flag)
    {
        if (mQS != null)
            mQS.setImeWindowStatus(flag);
    }

    public void setQuickSettings(QuickSettings quicksettings)
    {
        mQS = quicksettings;
    }

    public void setService(PhoneStatusBar phonestatusbar)
    {
        if (mQS != null)
            mQS.setService(phonestatusbar);
    }

    public void setup(NetworkController networkcontroller, BluetoothController bluetoothcontroller, BatteryController batterycontroller, LocationController locationcontroller)
    {
        if (mQS != null)
            mQS.setup(batterycontroller);
    }

    void updateResources()
    {
        if (mQS != null)
            mQS.updateResources();
        if (mQSContainer != null)
            mQSContainer.updateResources();
        requestLayout();
    }
}
