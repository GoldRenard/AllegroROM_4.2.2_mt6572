// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.content.Context;
import android.util.Log;
import android.view.*;
import com.android.internal.policy.IPolicy;

// Referenced classes of package com.android.internal.policy.impl:
//            PhoneFallbackEventHandler, PhoneLayoutInflater, PhoneWindow, PhoneWindowManager

public class Policy
    implements IPolicy
{

    private static final String TAG = "PhonePolicy";
    private static final String preload_classes[] = {
        "com.android.internal.policy.impl.PhoneLayoutInflater", "com.android.internal.policy.impl.PhoneWindow", "com.android.internal.policy.impl.PhoneWindow$1", "com.android.internal.policy.impl.PhoneWindow$DialogMenuCallback", "com.android.internal.policy.impl.PhoneWindow$DecorView", "com.android.internal.policy.impl.PhoneWindow$PanelFeatureState", "com.android.internal.policy.impl.PhoneWindow$PanelFeatureState$SavedState"
    };


    public FallbackEventHandler makeNewFallbackEventHandler(Context context)
    {
        return new PhoneFallbackEventHandler(context);
    }

    public LayoutInflater makeNewLayoutInflater(Context context)
    {
        return new PhoneLayoutInflater(context);
    }

    public Window makeNewWindow(Context context)
    {
        return new PhoneWindow(context);
    }

    public WindowManagerPolicy makeNewWindowManager()
    {
        return new PhoneWindowManager();
    }

    static 
    {
        String as[] = preload_classes;
        int i = as.length;
        int j = 0;
        while (j < i) 
        {
            String s = as[j];
            try
            {
                Class.forName(s);
            }
            catch (ClassNotFoundException classnotfoundexception)
            {
                Log.e("PhonePolicy", (new StringBuilder()).append("Could not preload class for phone policy: ").append(s).toString());
            }
            j++;
        }
    }
}
