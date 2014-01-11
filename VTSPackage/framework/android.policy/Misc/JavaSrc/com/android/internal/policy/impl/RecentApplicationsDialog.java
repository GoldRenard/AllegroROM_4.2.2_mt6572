// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.*;
import android.widget.TextView;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl:
//            IconUtilities

public class RecentApplicationsDialog extends Dialog
    implements android.view.View.OnClickListener
{
    class RecentTag
    {

        android.app.ActivityManager.RecentTaskInfo info;
        Intent intent;
        final RecentApplicationsDialog this$0;

        RecentTag()
        {
            this$0 = RecentApplicationsDialog.this;
            super();
        }
    }


    private static final boolean DBG_FORCE_EMPTY_LIST = false;
    private static final int MAX_RECENT_TASKS = 16;
    private static final int NUM_BUTTONS = 8;
    private static StatusBarManager sStatusBar;
    IntentFilter mBroadcastIntentFilter;
    private BroadcastReceiver mBroadcastReceiver;
    Runnable mCleanup;
    Handler mHandler;
    final TextView mIcons[] = new TextView[8];
    View mNoAppsText;

    public RecentApplicationsDialog(Context context)
    {
        super(context, 0x1030308);
        mBroadcastIntentFilter = new IntentFilter("android.intent.action.CLOSE_SYSTEM_DIALOGS");
        mHandler = new Handler();
        mCleanup = new Runnable() {

            final RecentApplicationsDialog this$0;

            public void run()
            {
                TextView atextview[] = mIcons;
                int i = atextview.length;
                for (int j = 0; j < i; j++)
                {
                    TextView textview = atextview[j];
                    textview.setCompoundDrawables(null, null, null, null);
                    textview.setTag(null);
                }

            }

            
            {
                this$0 = RecentApplicationsDialog.this;
                super();
            }
        }
;
        mBroadcastReceiver = new BroadcastReceiver() {

            final RecentApplicationsDialog this$0;

            public void onReceive(Context context1, Intent intent)
            {
                if ("android.intent.action.CLOSE_SYSTEM_DIALOGS".equals(intent.getAction()) && !"recentapps".equals(intent.getStringExtra("reason")))
                    dismiss();
            }

            
            {
                this$0 = RecentApplicationsDialog.this;
                super();
            }
        }
;
    }

    private void reloadButtons()
    {
        Context context = getContext();
        PackageManager packagemanager = context.getPackageManager();
        List list = ((ActivityManager)context.getSystemService("activity")).getRecentTasks(16, 2);
        ActivityInfo activityinfo = (new Intent("android.intent.action.MAIN")).addCategory("android.intent.category.HOME").resolveActivityInfo(packagemanager, 0);
        IconUtilities iconutilities = new IconUtilities(getContext());
        int i = 0;
        int j = list.size();
        for (int k = 0; k < j && i < 8; k++)
        {
            android.app.ActivityManager.RecentTaskInfo recenttaskinfo = (android.app.ActivityManager.RecentTaskInfo)list.get(k);
            Intent intent = new Intent(recenttaskinfo.baseIntent);
            if (recenttaskinfo.origActivity != null)
                intent.setComponent(recenttaskinfo.origActivity);
            if (activityinfo != null && activityinfo.packageName.equals(intent.getComponent().getPackageName()) && activityinfo.name.equals(intent.getComponent().getClassName()))
                continue;
            intent.setFlags(0x10000000 | 0xffdfffff & intent.getFlags());
            ResolveInfo resolveinfo = packagemanager.resolveActivity(intent, 0);
            if (resolveinfo == null)
                continue;
            ActivityInfo activityinfo1 = resolveinfo.activityInfo;
            String s = activityinfo1.loadLabel(packagemanager).toString();
            android.graphics.drawable.Drawable drawable = activityinfo1.loadIcon(packagemanager);
            if (s != null && s.length() > 0 && drawable != null)
            {
                TextView textview = mIcons[i];
                textview.setText(s);
                textview.setCompoundDrawables(null, iconutilities.createIconDrawable(drawable), null, null);
                RecentTag recenttag = new RecentTag();
                recenttag.info = recenttaskinfo;
                recenttag.intent = intent;
                textview.setTag(recenttag);
                textview.setVisibility(0);
                textview.setPressed(false);
                textview.clearFocus();
                i++;
            }
        }

        View view = mNoAppsText;
        byte byte0;
        if (i == 0)
            byte0 = 0;
        else
            byte0 = 8;
        view.setVisibility(byte0);
        for (; i < 8; i++)
            mIcons[i].setVisibility(8);

    }

    private void switchTo(RecentTag recenttag)
    {
        if (recenttag.info.id >= 0)
            ((ActivityManager)getContext().getSystemService("activity")).moveTaskToFront(recenttag.info.id, 1);
        else
        if (recenttag.intent != null)
        {
            recenttag.intent.addFlags(0x104000);
            try
            {
                getContext().startActivity(recenttag.intent);
                return;
            }
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                Log.w("Recent", "Unable to launch recent task", activitynotfoundexception);
            }
            return;
        }
    }

    public void dismissAndSwitch()
    {
        int i = mIcons.length;
        RecentTag recenttag = null;
        for (int j = 0; j < i && mIcons[j].getVisibility() == 0; j++)
        {
            if (j != 0 && !mIcons[j].hasFocus())
                continue;
            recenttag = (RecentTag)mIcons[j].getTag();
            if (mIcons[j].hasFocus())
                break;
        }

        if (recenttag != null)
            switchTo(recenttag);
        dismiss();
    }

    public void onClick(View view)
    {
        TextView atextview[] = mIcons;
        int i = atextview.length;
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    TextView textview = atextview[j];
                    if (textview != view)
                        break label0;
                    switchTo((RecentTag)textview.getTag());
                }
                dismiss();
                return;
            }
            j++;
        } while (true);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Context context = getContext();
        if (sStatusBar == null)
            sStatusBar = (StatusBarManager)context.getSystemService("statusbar");
        Window window = getWindow();
        window.requestFeature(1);
        window.setType(2028);
        window.setFlags(0x20000, 0x20000);
        window.setTitle("Recents");
        setContentView(0x10900af);
        android.view.WindowManager.LayoutParams layoutparams = window.getAttributes();
        layoutparams.width = -1;
        layoutparams.height = -1;
        window.setAttributes(layoutparams);
        window.setFlags(0, 2);
        mIcons[0] = (TextView)findViewById(0x1020356);
        mIcons[1] = (TextView)findViewById(0x1020019);
        mIcons[2] = (TextView)findViewById(0x102001a);
        mIcons[3] = (TextView)findViewById(0x102001b);
        mIcons[4] = (TextView)findViewById(0x1020357);
        mIcons[5] = (TextView)findViewById(0x1020358);
        mIcons[6] = (TextView)findViewById(0x1020359);
        mIcons[7] = (TextView)findViewById(0x102035a);
        mNoAppsText = findViewById(0x1020355);
        TextView atextview[] = mIcons;
        int i = atextview.length;
        for (int j = 0; j < i; j++)
            atextview[j].setOnClickListener(this);

    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i != 61) goto _L2; else goto _L1
_L1:
        boolean flag;
        int k;
        flag = keyevent.isShiftPressed();
        int j = mIcons.length;
        for (k = 0; k < j && mIcons[k].getVisibility() == 0; k++);
        if (k == 0) goto _L4; else goto _L3
_L3:
        int l;
        int i1;
        if (flag)
            l = k - 1;
        else
            l = 0;
        i1 = 0;
_L9:
        if (i1 >= k) goto _L6; else goto _L5
_L5:
        if (!mIcons[i1].hasFocus()) goto _L8; else goto _L7
_L7:
        if (flag)
            l = (-1 + (i1 + k)) % k;
        else
            l = (i1 + 1) % k;
_L6:
        byte byte0;
        if (flag)
            byte0 = 1;
        else
            byte0 = 2;
        if (mIcons[l].requestFocus(byte0))
            mIcons[l].playSoundEffect(SoundEffectConstants.getContantForFocusDirection(byte0));
_L4:
        return true;
_L8:
        i1++;
        if (true) goto _L9; else goto _L2
_L2:
        return super.onKeyDown(i, keyevent);
    }

    public void onStart()
    {
        super.onStart();
        reloadButtons();
        if (sStatusBar != null)
            sStatusBar.disable(0x10000);
        getContext().registerReceiver(mBroadcastReceiver, mBroadcastIntentFilter);
        mHandler.removeCallbacks(mCleanup);
    }

    public void onStop()
    {
        super.onStop();
        if (sStatusBar != null)
            sStatusBar.disable(0);
        getContext().unregisterReceiver(mBroadcastReceiver);
        mHandler.postDelayed(mCleanup, 100L);
    }
}
