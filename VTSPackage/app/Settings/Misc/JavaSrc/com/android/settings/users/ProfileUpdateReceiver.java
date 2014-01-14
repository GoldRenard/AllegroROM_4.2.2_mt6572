// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.users;

import android.content.*;
import android.os.UserHandle;
import android.os.UserManager;
import com.android.settings.Utils;

public class ProfileUpdateReceiver extends BroadcastReceiver
{

    private static final String KEY_PROFILE_NAME_COPIED_ONCE = "name_copied_once";


    static void copyProfileName(Context context)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("profile", 0);
        if (!sharedpreferences.contains("name_copied_once"))
        {
            int i = UserHandle.myUserId();
            UserManager usermanager = (UserManager)context.getSystemService("user");
            String s = Utils.getMeProfileName(context, false);
            if (s != null && s.length() > 0)
            {
                usermanager.setUserName(i, s);
                sharedpreferences.edit().putBoolean("name_copied_once", true).commit();
                return;
            }
        }
    }

    public void onReceive(final Context context, Intent intent)
    {
        (new Thread() {

            final ProfileUpdateReceiver this$0;
            final Context val$context;

            public void run()
            {
                Utils.copyMeProfilePhoto(context, null);
                ProfileUpdateReceiver.copyProfileName(context);
            }

            
            {
                this$0 = ProfileUpdateReceiver.this;
                context = context1;
                super();
            }
        }
).start();
    }
}
