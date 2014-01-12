// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.mediatek.oobe.basic.MainActivity;
import com.mediatek.xlog.Xlog;

public class WizardActivity extends Activity
{

    private static final String TAG = "OOBE";


    public void initOOBE()
    {
        Xlog.d("OOBE", "WizardActivity.initOOBE()");
        Intent intent = new Intent(this, com/mediatek/oobe/basic/MainActivity);
        intent.setFlags(0x10000000);
        startActivity(intent);
        finish();
    }

    protected void onCreate(Bundle bundle)
    {
        Xlog.d("OOBE", "WizardActivity.onCreate()");
        super.onCreate(bundle);
        initOOBE();
    }
}
