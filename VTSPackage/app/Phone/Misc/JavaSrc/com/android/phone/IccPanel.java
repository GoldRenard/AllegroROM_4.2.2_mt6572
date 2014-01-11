// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Dialog;
import android.app.StatusBarManager;
import android.content.Context;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Window;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class IccPanel extends Dialog
{

    protected static final String TAG = "PhoneGlobals";
    private StatusBarManager mStatusBarManager;

    public IccPanel(Context context)
    {
        super(context, 0x7f0f0000);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Window window = getWindow();
        window.setType(2007);
        window.setLayout(-1, -1);
        window.setGravity(17);
        mStatusBarManager = (StatusBarManager)PhoneGlobals.getInstance().getSystemService("statusbar");
        requestWindowFeature(1);
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4)
            return true;
        else
            return super.onKeyDown(i, keyevent);
    }

    protected void onStart()
    {
        super.onStart();
        mStatusBarManager.disable(0x10000);
    }

    public void onStop()
    {
        super.onStop();
        mStatusBarManager.disable(0);
    }
}
