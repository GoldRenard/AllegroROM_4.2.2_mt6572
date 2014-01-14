// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.appwidget.AppWidgetManager;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import com.android.internal.app.AlertActivity;

public class AllowBindAppWidgetActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener
{

    private CheckBox mAlwaysUse;
    private int mAppWidgetId;
    private AppWidgetManager mAppWidgetManager;
    private String mCallingPackage;
    private boolean mClicked;
    private ComponentName mComponentName;


    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            setResult(0);
            boolean flag;
            if (mAppWidgetId != -1 && mComponentName != null && mCallingPackage != null)
                try
                {
                    mAppWidgetManager.bindAppWidgetId(mAppWidgetId, mComponentName);
                    Intent intent = new Intent();
                    intent.putExtra("appWidgetId", mAppWidgetId);
                    setResult(-1, intent);
                }
                catch (Exception exception)
                {
                    Log.v("BIND_APPWIDGET", (new StringBuilder()).append("Error binding widget with id ").append(mAppWidgetId).append(" and component ").append(mComponentName).toString());
                }
            flag = mAlwaysUse.isChecked();
            if (flag != mAppWidgetManager.hasBindAppWidgetPermission(mCallingPackage))
                mAppWidgetManager.setBindAppWidgetPermission(mCallingPackage, flag);
        }
        finish();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        Object obj = "";
        if (intent != null)
        {
            com.android.internal.app.AlertController.AlertParams alertparams;
            CharSequence charsequence;
            try
            {
                mAppWidgetId = intent.getIntExtra("appWidgetId", -1);
                mComponentName = (ComponentName)intent.getParcelableExtra("appWidgetProvider");
                mCallingPackage = getCallingPackage();
                PackageManager packagemanager = getPackageManager();
                charsequence = packagemanager.getApplicationLabel(packagemanager.getApplicationInfo(mCallingPackage, 0));
            }
            catch (Exception exception)
            {
                mAppWidgetId = -1;
                mComponentName = null;
                mCallingPackage = null;
                Log.v("BIND_APPWIDGET", "Error getting parameters");
                setResult(0);
                finish();
                return;
            }
            obj = charsequence;
        }
        alertparams = mAlertParams;
        alertparams.mTitle = getString(0x7f0b071d);
        alertparams.mMessage = getString(0x7f0b071e, new Object[] {
            obj
        });
        alertparams.mPositiveButtonText = getString(0x7f0b0269);
        alertparams.mNegativeButtonText = getString(0x1040000);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonListener = this;
        alertparams.mView = ((LayoutInflater)getSystemService("layout_inflater")).inflate(0x1090028, null);
        mAlwaysUse = (CheckBox)alertparams.mView.findViewById(0x1020266);
        mAlwaysUse.setText(getString(0x7f0b071f, new Object[] {
            obj
        }));
        mAlwaysUse.setPadding(mAlwaysUse.getPaddingLeft(), mAlwaysUse.getPaddingTop(), mAlwaysUse.getPaddingRight(), (int)((float)mAlwaysUse.getPaddingBottom() + getResources().getDimension(0x7f0d000a)));
        mAppWidgetManager = AppWidgetManager.getInstance(this);
        mAlwaysUse.setChecked(mAppWidgetManager.hasBindAppWidgetPermission(mCallingPackage));
        setupAlert();
    }

    protected void onDestroy()
    {
        if (!mClicked)
        {
            setResult(0);
            finish();
        }
        super.onDestroy();
    }
}
