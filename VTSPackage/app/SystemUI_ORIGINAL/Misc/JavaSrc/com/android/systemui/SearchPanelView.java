// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.animation.LayoutTransition;
import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.util.AttributeSet;
import android.util.Slog;
import android.view.*;
import android.widget.FrameLayout;
import com.android.internal.widget.multiwaveview.GlowPadView;
import com.android.systemui.recent.StatusBarTouchProxy;
import com.android.systemui.statusbar.BaseStatusBar;
import com.android.systemui.statusbar.tablet.StatusBarPanel;

public class SearchPanelView extends FrameLayout
    implements StatusBarPanel, android.app.ActivityOptions.OnAnimationStartedListener
{
    class GlowPadTriggerListener
        implements com.android.internal.widget.multiwaveview.GlowPadView.OnTriggerListener
    {

        boolean mWaitingForLaunch;
        final SearchPanelView this$0;

        public void onFinishFinalAnimation()
        {
        }

        public void onGrabbed(View view, int i)
        {
        }

        public void onGrabbedStateChange(View view, int i)
        {
            if (!mWaitingForLaunch && i == 0)
                mBar.hideSearchPanel();
        }

        public void onReleased(View view, int i)
        {
        }

        public void onTrigger(View view, int i)
        {
            switch (mGlowPadView.getResourceIdForTarget(i))
            {
            case 17302164: 
                mWaitingForLaunch = true;
                startAssistActivity();
                vibrate();
                return;
            }
        }

        GlowPadTriggerListener()
        {
            this$0 = SearchPanelView.this;
            super();
        }
    }


    private static final String ASSIST_ICON_METADATA_NAME = "com.android.systemui.action_assist_icon";
    static final boolean DEBUG = false;
    private static final int SEARCH_PANEL_HOLD_DURATION = 0;
    static final String TAG = "SearchPanelView";
    private BaseStatusBar mBar;
    private final Context mContext;
    private GlowPadView mGlowPadView;
    final GlowPadTriggerListener mGlowPadViewListener;
    private final android.view.ViewTreeObserver.OnPreDrawListener mPreDrawListener;
    private View mSearchTargetsContainer;
    private boolean mShowing;
    private StatusBarTouchProxy mStatusBarTouchProxy;
    private IWindowManager mWm;

    public SearchPanelView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SearchPanelView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mGlowPadViewListener = new GlowPadTriggerListener();
        mPreDrawListener = new android.view.ViewTreeObserver.OnPreDrawListener() {

            final SearchPanelView this$0;

            public boolean onPreDraw()
            {
                getViewTreeObserver().removeOnPreDrawListener(this);
                mGlowPadView.resumeAnimations();
                return false;
            }

            
            {
                this$0 = SearchPanelView.this;
                super();
            }
        }
;
        mContext = context;
        mWm = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
    }

    private LayoutTransition createLayoutTransitioner()
    {
        LayoutTransition layouttransition = new LayoutTransition();
        layouttransition.setDuration(200L);
        layouttransition.setStartDelay(1, 0L);
        layouttransition.setAnimator(3, null);
        return layouttransition;
    }

    private void maybeSwapSearchIcon()
    {
        Intent intent = ((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2);
        if (intent != null)
        {
            android.content.ComponentName componentname = intent.getComponent();
            if (componentname != null)
                if (mGlowPadView.replaceTargetDrawablesIfPresent(componentname, "com.android.systemui.action_assist_icon", 0x1080294));
        }
    }

    private boolean pointInside(int i, int j, View view)
    {
        int k = view.getLeft();
        int l = view.getRight();
        int i1 = view.getTop();
        int j1 = view.getBottom();
        return i >= k && i < l && j >= i1 && j < j1;
    }

    private void startAssistActivity()
    {
        if (mBar.isDeviceProvisioned()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        mBar.animateCollapsePanels(1);
        boolean flag1 = mWm.isKeyguardLocked();
        boolean flag = flag1;
_L4:
        if (flag)
        {
            Intent intent;
            RemoteException remoteexception1;
            ActivityNotFoundException activitynotfoundexception;
            ActivityOptions activityoptions;
            try
            {
                mWm.showAssistant();
            }
            catch (RemoteException remoteexception2) { }
            onAnimationStarted();
            return;
        }
        intent = ((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2);
        if (intent != null)
        {
            try
            {
                ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
            }
            // Misplaced declaration of an exception variable
            catch (RemoteException remoteexception1) { }
            try
            {
                activityoptions = ActivityOptions.makeCustomAnimation(mContext, 0x7f050010, 0x7f050011, getHandler(), this);
                intent.addFlags(0x10000000);
                mContext.startActivityAsUser(intent, activityoptions.toBundle(), new UserHandle(-2));
                return;
            }
            // Misplaced declaration of an exception variable
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                Slog.w("SearchPanelView", (new StringBuilder()).append("Activity not found for ").append(intent.getAction()).toString());
            }
            onAnimationStarted();
            return;
        }
        if (true) goto _L1; else goto _L3
_L3:
        RemoteException remoteexception;
        remoteexception;
        flag = false;
          goto _L4
    }

    private void vibrate()
    {
        Context context = getContext();
        if (android.provider.Settings.System.getIntForUser(context.getContentResolver(), "haptic_feedback_enabled", 1, -2) != 0)
        {
            Resources resources = context.getResources();
            ((Vibrator)context.getSystemService("vibrator")).vibrate(resources.getInteger(0x7f0c0003));
        }
    }

    public boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        if (i >= 0 && i < getWidth() && j >= 0 && j < getHeight())
            return super.dispatchHoverEvent(motionevent);
        else
            return true;
    }

    public void hide(boolean flag)
    {
        if (mBar != null)
        {
            mBar.animateCollapsePanels(0);
            return;
        } else
        {
            setVisibility(4);
            return;
        }
    }

    public boolean isAssistantAvailable()
    {
        return ((SearchManager)mContext.getSystemService("search")).getAssistIntent(mContext, -2) != null;
    }

    public boolean isInContentArea(int i, int j)
    {
        return pointInside(i, j, mSearchTargetsContainer) || mStatusBarTouchProxy != null && pointInside(i, j, mStatusBarTouchProxy);
    }

    public boolean isShowing()
    {
        return mShowing;
    }

    public void onAnimationStarted()
    {
        postDelayed(new Runnable() {

            final SearchPanelView this$0;

            public void run()
            {
                mGlowPadViewListener.mWaitingForLaunch = false;
                mBar.hideSearchPanel();
            }

            
            {
                this$0 = SearchPanelView.this;
                super();
            }
        }
, 0L);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mContext.getSystemService("layout_inflater");
        mSearchTargetsContainer = findViewById(0x7f0800c8);
        mStatusBarTouchProxy = (StatusBarTouchProxy)findViewById(0x7f080102);
        mGlowPadView = (GlowPadView)findViewById(0x7f0800ca);
        mGlowPadView.setOnTriggerListener(mGlowPadViewListener);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
    }

    public void setBar(BaseStatusBar basestatusbar)
    {
        mBar = basestatusbar;
    }

    public void setStatusBarView(View view)
    {
        if (mStatusBarTouchProxy != null)
            mStatusBarTouchProxy.setStatusBar(view);
    }

    public void show(boolean flag, boolean flag1)
    {
        if (!flag)
        {
            LayoutTransition layouttransition;
            if (flag1)
                layouttransition = createLayoutTransitioner();
            else
                layouttransition = null;
            ((ViewGroup)mSearchTargetsContainer).setLayoutTransition(layouttransition);
        }
        mShowing = flag;
        if (flag)
        {
            maybeSwapSearchIcon();
            if (getVisibility() != 0)
            {
                setVisibility(0);
                mGlowPadView.suspendAnimations();
                mGlowPadView.ping();
                getViewTreeObserver().addOnPreDrawListener(mPreDrawListener);
                vibrate();
            }
            setFocusable(true);
            setFocusableInTouchMode(true);
            requestFocus();
            return;
        } else
        {
            setVisibility(4);
            return;
        }
    }




}
