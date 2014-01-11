// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.Resources;

// Referenced classes of package android.view:
//            LayoutInflater

public class ContextThemeWrapper extends ContextWrapper
{

    private Context mBase;
    private LayoutInflater mInflater;
    private Configuration mOverrideConfiguration;
    private Resources mResources;
    private android.content.res.Resources.Theme mTheme;
    private int mThemeResource;

    public ContextThemeWrapper()
    {
        super(null);
    }

    public ContextThemeWrapper(Context context, int i)
    {
        super(context);
        mBase = context;
        mThemeResource = i;
    }

    private void initializeTheme()
    {
        boolean flag;
        if (mTheme == null)
            flag = true;
        else
            flag = false;
        if (flag)
        {
            mTheme = getResources().newTheme();
            android.content.res.Resources.Theme theme = mBase.getTheme();
            if (theme != null)
                mTheme.setTo(theme);
        }
        onApplyThemeResource(mTheme, mThemeResource, flag);
    }

    public void applyOverrideConfiguration(Configuration configuration)
    {
        if (mResources != null)
            throw new IllegalStateException("getResources() has already been called");
        if (mOverrideConfiguration != null)
        {
            throw new IllegalStateException("Override configuration has already been set");
        } else
        {
            mOverrideConfiguration = new Configuration(configuration);
            return;
        }
    }

    protected void attachBaseContext(Context context)
    {
        super.attachBaseContext(context);
        mBase = context;
    }

    public Resources getResources()
    {
        if (mResources != null)
            return mResources;
        if (mOverrideConfiguration == null)
        {
            mResources = super.getResources();
            return mResources;
        } else
        {
            mResources = createConfigurationContext(mOverrideConfiguration).getResources();
            return mResources;
        }
    }

    public Object getSystemService(String s)
    {
        if ("layout_inflater".equals(s))
        {
            if (mInflater == null)
                mInflater = LayoutInflater.from(mBase).cloneInContext(this);
            return mInflater;
        } else
        {
            return mBase.getSystemService(s);
        }
    }

    public android.content.res.Resources.Theme getTheme()
    {
        if (mTheme != null)
        {
            return mTheme;
        } else
        {
            mThemeResource = Resources.selectDefaultTheme(mThemeResource, getApplicationInfo().targetSdkVersion);
            initializeTheme();
            return mTheme;
        }
    }

    public int getThemeResId()
    {
        return mThemeResource;
    }

    protected void onApplyThemeResource(android.content.res.Resources.Theme theme, int i, boolean flag)
    {
        theme.applyStyle(i, true);
    }

    public void setTheme(int i)
    {
        mThemeResource = i;
        initializeTheme();
    }
}
