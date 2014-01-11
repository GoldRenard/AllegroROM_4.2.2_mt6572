// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.*;
import com.mediatek.xlog.Xlog;

public class OOBEStepActivity extends Activity
    implements android.view.View.OnClickListener
{

    protected static final String TAG = "OOBE";
    protected Button mBackBtn;
    protected boolean mLastStep;
    protected Button mNextBtn;
    protected LinearLayout mProgressbarLayout;
    private TextView mSettingTitle;
    protected int mStepIndex;
    private String mStepSpecialTag;
    protected int mTotalStep;

    public OOBEStepActivity()
    {
        mLastStep = false;
        mStepSpecialTag = "";
    }

    protected void finishActivityByResultCode(int i)
    {
        setResult(i, new Intent());
        finish();
        Xlog.i("OOBE", (new StringBuilder()).append("Finish ").append(getStepSpecialTag()).toString());
    }

    protected String getStepSpecialTag()
    {
        return "OOBEStepActivity";
    }

    protected void initLayout()
    {
        mStepSpecialTag = getStepSpecialTag();
        mTotalStep = getIntent().getIntExtra("oobe_step_total", 1);
        mStepIndex = getIntent().getIntExtra("oobe_step_index", 0);
        Xlog.i("OOBE", (new StringBuilder()).append(mStepSpecialTag).append("initLayout(), step index = ").append(mStepIndex).append("/").append(mTotalStep).toString());
        mSettingTitle = (TextView)findViewById(0x7f0b0057);
        mProgressbarLayout = (LinearLayout)findViewById(0x7f0b0030);
        mBackBtn = (Button)findViewById(0x7f0b0006);
        mNextBtn = (Button)findViewById(0x7f0b0007);
        if (mStepIndex == 1)
            mBackBtn.setVisibility(4);
        mBackBtn.setOnClickListener(this);
        mNextBtn.setOnClickListener(this);
        for (int i = 0; i < mTotalStep; i++)
        {
            ImageView imageview = (ImageView)mProgressbarLayout.getChildAt(i);
            if (i == -1 + mStepIndex)
                imageview.setImageResource(0x7f020033);
            else
                imageview.setImageResource(0x7f020032);
            imageview.setVisibility(0);
        }

        if (mTotalStep == mStepIndex)
        {
            Xlog.i("OOBE", "Get to last settings step");
            mLastStep = true;
            mNextBtn.setText(0x7f090048);
        }
    }

    protected void initSpecialLayout(int i, int j)
    {
        mSettingTitle.setText(i);
    }

    public void onClick(View view)
    {
        if (view == mBackBtn)
        {
            onNextStep(false);
            return;
        }
        if (view == mNextBtn)
        {
            onNextStep(true);
            return;
        } else
        {
            Xlog.d("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append("Which button is clicked??").toString());
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030009);
        initLayout();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        boolean flag = true;
        i;
        JVM INSTR tableswitch 4 4: default 92
    //                   4 20;
           goto _L1 _L2
_L2:
        int j;
        Xlog.i("OOBE", "Press back button to former settings");
        j = android.provider.Settings.System.getInt(getContentResolver(), "oobe_has_run", 0);
        StringBuilder stringbuilder = (new StringBuilder()).append("Is first started?");
        boolean flag1 = false;
        if (j == 0)
            flag1 = flag;
        Xlog.i("OOBE", stringbuilder.append(flag1).toString());
        if (j == 0) goto _L4; else goto _L3
_L3:
        finishActivityByResultCode(21);
_L1:
        flag = super.onKeyDown(i, keyevent);
_L4:
        return flag;
    }

    public void onNextStep(boolean flag)
    {
        if (!flag)
        {
            Xlog.i("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append(">>Back to former settings, mStepIndex=").append(mStepIndex).toString());
            finishActivityByResultCode(21);
            return;
        } else
        {
            Xlog.i("OOBE", (new StringBuilder()).append(getStepSpecialTag()).append(">>Forward to next settings").toString());
            finishActivityByResultCode(20);
            return;
        }
    }
}
