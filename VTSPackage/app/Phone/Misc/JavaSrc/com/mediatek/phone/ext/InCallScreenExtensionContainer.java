// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import com.android.internal.telephony.CallManager;
import com.android.internal.telephony.Connection;
import java.util.Iterator;
import java.util.LinkedList;

// Referenced classes of package com.mediatek.phone.ext:
//            InCallScreenExtension, IInCallScreen, IInCallControlState

public class InCallScreenExtensionContainer extends InCallScreenExtension
{

    private static final String LOG_TAG = "InCallScreenExtensionContainer";
    private LinkedList mSubExtensionList;


    private static void log(String s)
    {
        Log.d("InCallScreenExtensionContainer", s);
    }

    public void add(InCallScreenExtension incallscreenextension)
    {
        if (mSubExtensionList == null)
        {
            log("create sub extension list");
            mSubExtensionList = new LinkedList();
        }
        log((new StringBuilder()).append("add extension, extension is ").append(incallscreenextension).toString());
        mSubExtensionList.add(incallscreenextension);
    }

    public boolean dismissDialogs()
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("dismissDialogs(), sub extension list is null, just return");
                break label0;
            }
            log("dismissDialogs()");
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((InCallScreenExtension)iterator.next()).dismissDialogs());
            return true;
        }
        return false;
    }

    public boolean handleOnScreenMenuItemClick(MenuItem menuitem)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("handleOnScreenMenuItemClick(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("handleOnScreenMenuItemClick(), menuItem is ").append(menuitem).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((InCallScreenExtension)iterator.next()).handleOnScreenMenuItemClick(menuitem));
            return true;
        }
        return false;
    }

    public boolean handleOnscreenButtonClick(int i)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("handleOnscreenButtonClick(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("handleOnscreenButtonClick(), id = ").append(i).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((InCallScreenExtension)iterator.next()).handleOnscreenButtonClick(i));
            return true;
        }
        return false;
    }

    public void onCreate(Bundle bundle, Activity activity, IInCallScreen iincallscreen, CallManager callmanager)
    {
        if (mSubExtensionList == null)
        {
            log("onCreate(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("onCreate(), icicle is ").append(bundle).append(" incallscreen activity is ").append(activity).append(" incallscreen host is ").append(iincallscreen).append(" call manager is ").append(callmanager).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((InCallScreenExtension)iterator.next()).onCreate(bundle, activity, iincallscreen, callmanager));
        }
    }

    public void onDestroy(Activity activity)
    {
        if (mSubExtensionList == null)
        {
            log("onDestroy(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("onDestroy(), incallscreen activity is ").append(activity).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((InCallScreenExtension)iterator.next()).onDestroy(activity));
        }
    }

    public boolean onDisconnect(Connection connection)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("onDisconnect(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("onDisconnect(), connection is ").append(connection).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((InCallScreenExtension)iterator.next()).onDisconnect(connection));
            return true;
        }
        return false;
    }

    public boolean onPhoneStateChanged(CallManager callmanager)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("onPhoneStateChanged(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("onPhoneStateChanged(), call manager is ").append(callmanager).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((InCallScreenExtension)iterator.next()).onPhoneStateChanged(callmanager));
            return true;
        }
        return false;
    }

    public void remove(InCallScreenExtension incallscreenextension)
    {
        if (mSubExtensionList == null)
        {
            log("remove extension, sub extension list is null, just return");
            return;
        } else
        {
            log((new StringBuilder()).append("remove extension, extension is ").append(incallscreenextension).toString());
            mSubExtensionList.remove(incallscreenextension);
            return;
        }
    }

    public void setupMenuItems(Menu menu, IInCallControlState iincallcontrolstate)
    {
        if (mSubExtensionList == null)
        {
            log("setupMenuItems(), sub extension list is null, just return");
        } else
        {
            log((new StringBuilder()).append("setupMenuItems(), menu is ").append(menu).append(", incallcontrolstate is ").append(iincallcontrolstate).toString());
            for (Iterator iterator = mSubExtensionList.iterator(); iterator.hasNext(); ((InCallScreenExtension)iterator.next()).setupMenuItems(menu, iincallcontrolstate));
        }
    }

    public boolean updateScreen(CallManager callmanager, boolean flag)
    {
label0:
        {
            if (mSubExtensionList == null)
            {
                log("updateScreen(), sub extension list is null, just return");
                break label0;
            }
            log((new StringBuilder()).append("updateScreen(), call manage is ").append(callmanager).append(" isForeground is ").append(flag).toString());
            Iterator iterator = mSubExtensionList.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((InCallScreenExtension)iterator.next()).updateScreen(callmanager, flag));
            return true;
        }
        return false;
    }
}
