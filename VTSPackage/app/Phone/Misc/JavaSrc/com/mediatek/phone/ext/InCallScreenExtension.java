// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import com.android.internal.telephony.CallManager;
import com.android.internal.telephony.Connection;

// Referenced classes of package com.mediatek.phone.ext:
//            IInCallScreen, IInCallControlState

public class InCallScreenExtension
{


    public boolean dismissDialogs()
    {
        return false;
    }

    public boolean handleOnScreenMenuItemClick(MenuItem menuitem)
    {
        return false;
    }

    public boolean handleOnscreenButtonClick(int i)
    {
        return false;
    }

    public void onCreate(Bundle bundle, Activity activity, IInCallScreen iincallscreen, CallManager callmanager)
    {
    }

    public void onDestroy(Activity activity)
    {
    }

    public boolean onDisconnect(Connection connection)
    {
        return false;
    }

    public boolean onPhoneStateChanged(CallManager callmanager)
    {
        return false;
    }

    public void setupMenuItems(Menu menu, IInCallControlState iincallcontrolstate)
    {
    }

    public boolean updateScreen(CallManager callmanager, boolean flag)
    {
        return false;
    }
}
