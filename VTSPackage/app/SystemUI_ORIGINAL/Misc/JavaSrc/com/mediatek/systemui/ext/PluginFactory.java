// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.systemui.ext;

import android.content.Context;
import android.content.pm.Signature;
import com.mediatek.pluginmanager.PluginManager;

// Referenced classes of package com.mediatek.systemui.ext:
//            IStatusBarPlugin, DefaultStatusBarPlugin

public class PluginFactory
{

    private static IStatusBarPlugin mStatusBarPlugin = null;


    public static IStatusBarPlugin getStatusBarPlugin(Context context)
    {
        com/mediatek/systemui/ext/PluginFactory;
        JVM INSTR monitorenter ;
        IStatusBarPlugin istatusbarplugin = mStatusBarPlugin;
        if (istatusbarplugin != null)
            break MISSING_BLOCK_LABEL_34;
        mStatusBarPlugin = (IStatusBarPlugin)PluginManager.createPluginObject(context, com/mediatek/systemui/ext/IStatusBarPlugin.getName(), "1.0.0", "class", new Signature[0]);
_L1:
        IStatusBarPlugin istatusbarplugin1 = mStatusBarPlugin;
        com/mediatek/systemui/ext/PluginFactory;
        JVM INSTR monitorexit ;
        return istatusbarplugin1;
        com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception;
        objectcreationexception;
        mStatusBarPlugin = new DefaultStatusBarPlugin(context);
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

}
