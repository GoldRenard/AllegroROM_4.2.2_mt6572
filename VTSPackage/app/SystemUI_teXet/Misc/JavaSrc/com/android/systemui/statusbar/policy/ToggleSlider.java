// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.*;

public class ToggleSlider extends RelativeLayout
    implements android.widget.CompoundButton.OnCheckedChangeListener, android.widget.SeekBar.OnSeekBarChangeListener
{
    public static interface Listener
    {

        public abstract void onChanged(ToggleSlider toggleslider, boolean flag, boolean flag1, int i);

        public abstract void onInit(ToggleSlider toggleslider);
    }


    private static final String TAG = "StatusBar.ToggleSlider";
    private TextView mLabel;
    private Listener mListener;
    private SeekBar mSlider;
    private CompoundButton mToggle;
    private boolean mTracking;

    public ToggleSlider(Context context)
    {
        this(context, null);
    }

    public ToggleSlider(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ToggleSlider(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        View.inflate(context, 0x7f040031, this);
        Resources resources = context.getResources();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.systemui.R.styleable.ToggleSlider, i, 0);
        mToggle = (CompoundButton)findViewById(0x7f0800c7);
        mToggle.setOnCheckedChangeListener(this);
        mToggle.setBackgroundDrawable(resources.getDrawable(0x7f020238));
        mSlider = (SeekBar)findViewById(0x7f0800c8);
        mSlider.setOnSeekBarChangeListener(this);
        mLabel = (TextView)findViewById(0x7f0800c9);
        mLabel.setText(typedarray.getString(0));
        typedarray.recycle();
    }

    public void hideToggle()
    {
        mToggle.getLayoutParams().width = 1;
        mToggle.setVisibility(4);
        mLabel.setVisibility(4);
    }

    public boolean isChecked()
    {
        return mToggle.isChecked();
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (mListener != null)
            mListener.onInit(this);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        Resources resources = getContext().getResources();
        android.graphics.drawable.Drawable drawable;
        android.graphics.drawable.Drawable drawable1;
        if (flag)
        {
            drawable = resources.getDrawable(0x10804db);
            drawable1 = resources.getDrawable(0x7f020236);
        } else
        {
            drawable = resources.getDrawable(0x10804df);
            drawable1 = resources.getDrawable(0x10804e1);
        }
        mSlider.setThumb(drawable);
        mSlider.setProgressDrawable(drawable1);
        if (mListener != null)
            mListener.onChanged(this, mTracking, flag, mSlider.getProgress());
    }

    public void onProgressChanged(SeekBar seekbar, int i, boolean flag)
    {
        if (mListener != null)
            mListener.onChanged(this, mTracking, mToggle.isChecked(), i);
    }

    public void onStartTrackingTouch(SeekBar seekbar)
    {
        mTracking = true;
        if (mListener != null)
            mListener.onChanged(this, mTracking, mToggle.isChecked(), mSlider.getProgress());
        mToggle.setChecked(false);
    }

    public void onStopTrackingTouch(SeekBar seekbar)
    {
        mTracking = false;
        if (mListener != null)
            mListener.onChanged(this, mTracking, mToggle.isChecked(), mSlider.getProgress());
    }

    public void setChecked(boolean flag)
    {
        mToggle.setChecked(flag);
    }

    public void setMax(int i)
    {
        mSlider.setMax(i);
    }

    public void setOnChangedListener(Listener listener)
    {
        mListener = listener;
    }

    public void setValue(int i)
    {
        mSlider.setProgress(i);
    }
}
