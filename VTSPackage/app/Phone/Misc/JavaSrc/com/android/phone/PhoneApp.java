// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Application;
import android.content.res.Configuration;
import android.os.UserHandle;
import android.util.Log;
import com.mediatek.phone.HyphonManager;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class PhoneApp extends Application
{

    static final String LOG_TAG = "PhoneApp";
    PhoneGlobals mPhoneGlobals;


    public void onConfigurationChanged(Configuration configuration)
    {
        if (mPhoneGlobals != null)
            mPhoneGlobals.onConfigurationChanged(configuration);
        super.onConfigurationChanged(configuration);
    }

    public void onCreate()
    {
        if (UserHandle.myUserId() == 0)
        {
            mPhoneGlobals = new PhoneGlobals(this);
            mPhoneGlobals.onCreate();
        }
    }

    public void onTerminate()
    {
        super.onTerminate();
        Log.d("PhoneApp", "onTerminate");
        HyphonManager.getInstance().onDestroy();
    }
}
