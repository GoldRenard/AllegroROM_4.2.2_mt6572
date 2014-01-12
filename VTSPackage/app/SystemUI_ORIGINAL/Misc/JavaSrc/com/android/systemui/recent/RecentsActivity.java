// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.UserHandle;
import android.view.*;
import com.android.systemui.statusbar.tablet.StatusBarPanel;
import java.util.List;

// Referenced classes of package com.android.systemui.recent:
//            RecentsPanelView, RecentTasksLoader

public class RecentsActivity extends Activity
{
    public class TouchOutsideListener
        implements android.view.View.OnTouchListener
    {

        private StatusBarPanel mPanel;
        final RecentsActivity this$0;

        public boolean onTouch(View view, MotionEvent motionevent)
        {
            int i = motionevent.getAction();
            if (i != 4 && (i != 0 || mPanel.isInContentArea((int)motionevent.getX(), (int)motionevent.getY())))
            {
                return false;
            } else
            {
                dismissAndGoHome();
                return true;
            }
        }

        public TouchOutsideListener(StatusBarPanel statusbarpanel)
        {
            this$0 = RecentsActivity.this;
            super();
            mPanel = statusbarpanel;
        }
    }


    public static final String CANCEL_PRELOAD_INTENT = "com.android.systemui.recent.CANCEL_PRELOAD";
    public static final String CLOSE_RECENTS_INTENT = "com.android.systemui.recent.action.CLOSE";
    public static final String PRELOAD_INTENT = "com.android.systemui.recent.action.PRELOAD";
    public static final String PRELOAD_PERMISSION = "com.android.systemui.recent.permission.PRELOAD";
    public static final String TOGGLE_RECENTS_INTENT = "com.android.systemui.recent.action.TOGGLE_RECENTS";
    public static final String WAITING_FOR_WINDOW_ANIMATION_PARAM = "com.android.systemui.recent.WAITING_FOR_WINDOW_ANIMATION";
    private static final String WAS_SHOWING = "was_showing";
    public static final String WINDOW_ANIMATION_START_INTENT = "com.android.systemui.recent.action.WINDOW_ANIMATION_START";
    private boolean mForeground;
    private IntentFilter mIntentFilter;
    private BroadcastReceiver mIntentReceiver;
    private RecentsPanelView mRecentsPanel;
    private boolean mShowing;

    public RecentsActivity()
    {
        mIntentReceiver = new BroadcastReceiver() {

            final RecentsActivity this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("com.android.systemui.recent.action.CLOSE".equals(intent.getAction()))
                {
                    if (mRecentsPanel != null && mRecentsPanel.isShowing() && mShowing && !mForeground)
                        mRecentsPanel.show(false);
                } else
                if ("com.android.systemui.recent.action.WINDOW_ANIMATION_START".equals(intent.getAction()) && mRecentsPanel != null)
                {
                    mRecentsPanel.onWindowAnimationStart();
                    return;
                }
            }

            
            {
                this$0 = RecentsActivity.this;
                super();
            }
        }
;
    }

    public static boolean forceOpaqueBackground(Context context)
    {
        return WallpaperManager.getInstance(context).getWallpaperInfo() != null;
    }

    private void handleIntent(Intent intent, boolean flag)
    {
label0:
        {
            super.onNewIntent(intent);
            if ("com.android.systemui.recent.action.TOGGLE_RECENTS".equals(intent.getAction()) && mRecentsPanel != null)
            {
                if (!mRecentsPanel.isShowing())
                    break label0;
                dismissAndGoBack();
            }
            return;
        }
        RecentTasksLoader recenttasksloader = RecentTasksLoader.getInstance(this);
        boolean flag1 = false;
        if (flag)
        {
            boolean flag2 = intent.getBooleanExtra("com.android.systemui.recent.WAITING_FOR_WINDOW_ANIMATION", false);
            flag1 = false;
            if (flag2)
                flag1 = true;
        }
        mRecentsPanel.show(true, recenttasksloader.getLoadedTasks(), recenttasksloader.isFirstScreenful(), flag1);
    }

    private void updateWallpaperVisibility(boolean flag)
    {
        int i;
        if (flag)
            i = 0x100000;
        else
            i = 0;
        if (i != (0x100000 & getWindow().getAttributes().flags))
            getWindow().setFlags(i, 0x100000);
    }

    public void dismissAndGoBack()
    {
        if (mRecentsPanel != null)
        {
            List list = ((ActivityManager)getSystemService("activity")).getRecentTasks(2, 3);
            if (list.size() > 1 && mRecentsPanel.simulateClick(((android.app.ActivityManager.RecentTaskInfo)list.get(1)).persistentId))
                return;
            mRecentsPanel.show(false);
        }
        finish();
    }

    public void dismissAndGoHome()
    {
        if (mRecentsPanel != null)
        {
            Intent intent = new Intent("android.intent.action.MAIN", null);
            intent.addCategory("android.intent.category.HOME");
            intent.addFlags(0x10200000);
            startActivityAsUser(intent, new UserHandle(-2));
            mRecentsPanel.show(false);
        }
    }

    boolean isActivityShowing()
    {
        return mShowing;
    }

    boolean isForeground()
    {
        return mForeground;
    }

    public void onBackPressed()
    {
        dismissAndGoBack();
    }

    protected void onCreate(Bundle bundle)
    {
        setContentView(0x7f040033);
        mRecentsPanel = (RecentsPanelView)findViewById(0x7f0800c3);
        mRecentsPanel.setOnTouchListener(new TouchOutsideListener(mRecentsPanel));
        RecentTasksLoader.getInstance(this).setRecentsPanel(mRecentsPanel, mRecentsPanel);
        mRecentsPanel.setMinSwipeAlpha((float)getResources().getInteger(0x7f0c0008) / 100F);
        if (bundle == null || bundle.getBoolean("was_showing"))
        {
            Intent intent = getIntent();
            boolean flag;
            if (bundle == null)
                flag = true;
            else
                flag = false;
            handleIntent(intent, flag);
        }
        mIntentFilter = new IntentFilter();
        mIntentFilter.addAction("com.android.systemui.recent.action.CLOSE");
        mIntentFilter.addAction("com.android.systemui.recent.action.WINDOW_ANIMATION_START");
        registerReceiver(mIntentReceiver, mIntentFilter);
        super.onCreate(bundle);
    }

    protected void onDestroy()
    {
        RecentTasksLoader.getInstance(this).setRecentsPanel(null, mRecentsPanel);
        unregisterReceiver(mIntentReceiver);
        super.onDestroy();
    }

    protected void onNewIntent(Intent intent)
    {
        handleIntent(intent, true);
    }

    public void onPause()
    {
        overridePendingTransition(0x7f05000e, 0x7f05000f);
        mForeground = false;
        super.onPause();
    }

    public void onResume()
    {
        mForeground = true;
        super.onResume();
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        bundle.putBoolean("was_showing", mRecentsPanel.isShowing());
    }

    public void onStart()
    {
        if (forceOpaqueBackground(this))
            updateWallpaperVisibility(false);
        else
            updateWallpaperVisibility(true);
        mShowing = true;
        if (mRecentsPanel != null)
        {
            mRecentsPanel.refreshRecentTasks();
            mRecentsPanel.refreshViews();
        }
        super.onStart();
    }

    public void onStop()
    {
        mShowing = false;
        if (mRecentsPanel != null)
            mRecentsPanel.onUiHidden();
        super.onStop();
    }



}
