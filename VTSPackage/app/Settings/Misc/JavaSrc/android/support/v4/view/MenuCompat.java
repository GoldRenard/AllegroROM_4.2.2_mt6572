// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.view;

import android.view.MenuItem;

// Referenced classes of package android.support.v4.view:
//            MenuItemCompatHoneycomb

public class MenuCompat
{
    static class BaseMenuVersionImpl
        implements MenuVersionImpl
    {

        public boolean setShowAsAction(MenuItem menuitem, int i)
        {
            return false;
        }

    }

    static class HoneycombMenuVersionImpl
        implements MenuVersionImpl
    {

        public boolean setShowAsAction(MenuItem menuitem, int i)
        {
            MenuItemCompatHoneycomb.setShowAsAction(menuitem, i);
            return true;
        }

    }

    static interface MenuVersionImpl
    {

        public abstract boolean setShowAsAction(MenuItem menuitem, int i);
    }


    static final MenuVersionImpl IMPL;


    public static boolean setShowAsAction(MenuItem menuitem, int i)
    {
        return IMPL.setShowAsAction(menuitem, i);
    }

    static 
    {
        if (android.os.Build.VERSION.SDK_INT >= 11)
            IMPL = new HoneycombMenuVersionImpl();
        else
            IMPL = new BaseMenuVersionImpl();
    }
}
