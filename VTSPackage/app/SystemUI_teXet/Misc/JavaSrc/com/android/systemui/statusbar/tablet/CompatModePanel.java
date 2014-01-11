// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.app.ActivityManager;
import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RadioButton;

// Referenced classes of package com.android.systemui.statusbar.tablet:
//            StatusBarPanel

public class CompatModePanel extends FrameLayout
    implements StatusBarPanel, android.view.View.OnClickListener
{

    private static final boolean DEBUG = false;
    private static final String TAG = "CompatModePanel";
    private ActivityManager mAM;
    private boolean mAttached;
    private Context mContext;
    private RadioButton mOffButton;
    private RadioButton mOnButton;
    private View mTrigger;

    public CompatModePanel(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mAttached = false;
        mContext = context;
        mAM = (ActivityManager)context.getSystemService("activity");
    }

    private void refresh()
    {
        boolean flag = true;
        int i = mAM.getFrontActivityScreenCompatMode();
        if (i != -1 && i != -2)
        {
            boolean flag1;
            if (i == flag)
                flag1 = flag;
            else
                flag1 = false;
            mOnButton.setChecked(flag1);
            RadioButton radiobutton = mOffButton;
            if (flag1)
                flag = false;
            radiobutton.setChecked(flag);
            return;
        } else
        {
            closePanel();
            return;
        }
    }

    public void closePanel()
    {
        setVisibility(8);
        if (mTrigger != null)
            mTrigger.setSelected(false);
    }

    public boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        if (i >= 0 && i < getWidth() && j >= 0 && j < getHeight())
            return super.dispatchHoverEvent(motionevent);
        else
            return true;
    }

    public boolean isInContentArea(int i, int j)
    {
        return false;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (!mAttached)
            mAttached = true;
    }

    public void onClick(View view)
    {
        if (view == mOnButton)
            mAM.setFrontActivityScreenCompatMode(1);
        else
        if (view == mOffButton)
        {
            mAM.setFrontActivityScreenCompatMode(0);
            return;
        }
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mAttached)
            mAttached = false;
    }

    public void onFinishInflate()
    {
        mOnButton = (RadioButton)findViewById(0x7f0800d7);
        mOffButton = (RadioButton)findViewById(0x7f0800d6);
        mOnButton.setOnClickListener(this);
        mOffButton.setOnClickListener(this);
        refresh();
    }

    public void openPanel()
    {
        setVisibility(0);
        if (mTrigger != null)
            mTrigger.setSelected(true);
        refresh();
    }

    public void setTrigger(View view)
    {
        mTrigger = view;
    }
}
