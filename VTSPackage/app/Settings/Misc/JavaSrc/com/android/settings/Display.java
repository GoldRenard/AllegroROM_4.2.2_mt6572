// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.content.res.*;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.widget.*;

public class Display extends Activity
    implements android.view.View.OnClickListener
{

    private Configuration mCurConfig;
    private DisplayMetrics mDisplayMetrics;
    private Spinner mFontSize;
    private android.widget.AdapterView.OnItemSelectedListener mFontSizeChanged;
    private TextView mPreview;
    private TypedValue mTextSizeTyped;

    public Display()
    {
        mFontSizeChanged = new android.widget.AdapterView.OnItemSelectedListener() {

            final Display this$0;

            public void onItemSelected(AdapterView adapterview, View view, int i, long l)
            {
                if (i == 0)
                    mCurConfig.fontScale = 0.75F;
                else
                if (i == 2)
                    mCurConfig.fontScale = 1.25F;
                else
                    mCurConfig.fontScale = 1.0F;
                updateFontScale();
            }

            public void onNothingSelected(AdapterView adapterview)
            {
            }

            
            {
                this$0 = Display.this;
                super();
            }
        }
;
        mCurConfig = new Configuration();
    }

    private void updateFontScale()
    {
        mDisplayMetrics.scaledDensity = mDisplayMetrics.density * mCurConfig.fontScale;
        float f = mTextSizeTyped.getDimension(mDisplayMetrics);
        mPreview.setTextSize(0, f);
    }

    public void onClick(View view)
    {
        try
        {
            ActivityManagerNative.getDefault().updatePersistentConfiguration(mCurConfig);
        }
        catch (RemoteException remoteexception) { }
        finish();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040035);
        mFontSize = (Spinner)findViewById(0x7f08007e);
        mFontSize.setOnItemSelectedListener(mFontSizeChanged);
        String as[] = new String[3];
        Resources resources = getResources();
        as[0] = resources.getString(0x7f0b0295);
        as[1] = resources.getString(0x7f0b0296);
        as[2] = resources.getString(0x7f0b0297);
        ArrayAdapter arrayadapter = new ArrayAdapter(this, 0x1090008, as);
        arrayadapter.setDropDownViewResource(0x1090009);
        mFontSize.setAdapter(arrayadapter);
        mPreview = (TextView)findViewById(0x7f08007f);
        mPreview.setText(resources.getText(0x7f0b0298));
        Button button = (Button)findViewById(0x7f080080);
        button.setText(resources.getText(0x7f0b0299));
        button.setOnClickListener(this);
        mTextSizeTyped = new TypedValue();
        TypedArray typedarray = obtainStyledAttributes(android.R.styleable.TextView);
        typedarray.getValue(2, mTextSizeTyped);
        DisplayMetrics displaymetrics = getResources().getDisplayMetrics();
        mDisplayMetrics = new DisplayMetrics();
        mDisplayMetrics.density = displaymetrics.density;
        mDisplayMetrics.heightPixels = displaymetrics.heightPixels;
        mDisplayMetrics.scaledDensity = displaymetrics.scaledDensity;
        mDisplayMetrics.widthPixels = displaymetrics.widthPixels;
        mDisplayMetrics.xdpi = displaymetrics.xdpi;
        mDisplayMetrics.ydpi = displaymetrics.ydpi;
        typedarray.recycle();
    }

    public void onResume()
    {
        super.onResume();
        try
        {
            mCurConfig.updateFrom(ActivityManagerNative.getDefault().getConfiguration());
        }
        catch (RemoteException remoteexception) { }
        if (mCurConfig.fontScale < 1.0F)
            mFontSize.setSelection(0);
        else
        if (mCurConfig.fontScale > 1.0F)
            mFontSize.setSelection(2);
        else
            mFontSize.setSelection(1);
        updateFontScale();
    }


}
