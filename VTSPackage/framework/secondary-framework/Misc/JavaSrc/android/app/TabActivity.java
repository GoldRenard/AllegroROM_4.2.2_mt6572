// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.os.Bundle;
import android.widget.*;

// Referenced classes of package android.app:
//            ActivityGroup, LocalActivityManager, Activity

public class TabActivity extends ActivityGroup
{

    private String mDefaultTab;
    private int mDefaultTabIndex;
    private TabHost mTabHost;

    public TabActivity()
    {
        mDefaultTab = null;
        mDefaultTabIndex = -1;
    }

    private void ensureTabHost()
    {
        if (mTabHost == null)
            setContentView(0x10900d0);
    }

    public TabHost getTabHost()
    {
        ensureTabHost();
        return mTabHost;
    }

    public TabWidget getTabWidget()
    {
        return mTabHost.getTabWidget();
    }

    protected void onChildTitleChanged(Activity activity, CharSequence charsequence)
    {
        if (getLocalActivityManager().getCurrentActivity() == activity)
        {
            android.view.View view = mTabHost.getCurrentTabView();
            if (view != null && (view instanceof TextView))
                ((TextView)view).setText(charsequence);
        }
    }

    public void onContentChanged()
    {
        super.onContentChanged();
        mTabHost = (TabHost)findViewById(0x1020012);
        if (mTabHost == null)
        {
            throw new RuntimeException("Your content must have a TabHost whose id attribute is 'android.R.id.tabhost'");
        } else
        {
            mTabHost.setup(getLocalActivityManager());
            return;
        }
    }

    protected void onPostCreate(Bundle bundle)
    {
        super.onPostCreate(bundle);
        ensureTabHost();
        if (mTabHost.getCurrentTab() == -1)
            mTabHost.setCurrentTab(0);
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        super.onRestoreInstanceState(bundle);
        ensureTabHost();
        String s = bundle.getString("currentTab");
        if (s != null)
            mTabHost.setCurrentTabByTag(s);
        if (mTabHost.getCurrentTab() < 0)
            if (mDefaultTab != null)
                mTabHost.setCurrentTabByTag(mDefaultTab);
            else
            if (mDefaultTabIndex >= 0)
            {
                mTabHost.setCurrentTab(mDefaultTabIndex);
                return;
            }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        String s = mTabHost.getCurrentTabTag();
        if (s != null)
            bundle.putString("currentTab", s);
    }

    public void setDefaultTab(int i)
    {
        mDefaultTab = null;
        mDefaultTabIndex = i;
    }

    public void setDefaultTab(String s)
    {
        mDefaultTab = s;
        mDefaultTabIndex = -1;
    }
}
