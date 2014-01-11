// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import com.mediatek.xlog.Xlog;

public class AdvanceSettingsEnd extends Activity
    implements android.view.View.OnClickListener
{

    private static final String TAG = "OOBE";
    private Button mBackBtn;
    protected boolean mLastStep;
    private Button mNextBtn;
    private LinearLayout mProgressbarLayout;
    protected int mStepIndex;
    private String mStepSpecialTag;
    protected int mTotalStep;

    public AdvanceSettingsEnd()
    {
        mLastStep = false;
    }

    protected String getStepSpecialTag()
    {
        return "AdvanceSettingsEnd";
    }

    protected void initLayout()
    {
        mStepSpecialTag = getStepSpecialTag();
        mTotalStep = getIntent().getIntExtra("oobe_step_total", 1);
        mStepIndex = getIntent().getIntExtra("oobe_step_index", 0);
        Xlog.i("OOBE", (new StringBuilder()).append(mStepSpecialTag).append("initLayout(), step index = ").append(mStepIndex).append("/").append(mTotalStep).toString());
        mBackBtn = (Button)findViewById(0x7f0b0006);
        mNextBtn = (Button)findViewById(0x7f0b0007);
        mBackBtn.setOnClickListener(this);
        mNextBtn.setOnClickListener(this);
        if (mTotalStep == mStepIndex)
        {
            Xlog.i("OOBE", "Get to last settings step");
            mLastStep = true;
            mNextBtn.setText(0x7f09004a);
        }
    }

    public void onClick(View view)
    {
        if (view == mNextBtn)
        {
            Xlog.d("OOBE", "Finish advance settings, exit now");
            setResult(22);
            finish();
        } else
        if (view == mBackBtn)
        {
            Xlog.d("OOBE", "bact to previous OOBE");
            setResult(21);
            finish();
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030001);
        initLayout();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4)
        {
            setResult(22);
            finish();
            return true;
        } else
        {
            return super.onKeyDown(i, keyevent);
        }
    }
}
