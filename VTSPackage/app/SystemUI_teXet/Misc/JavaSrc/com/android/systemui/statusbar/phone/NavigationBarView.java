// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.util.AttributeSet;
import android.util.Slog;
import android.view.*;
import android.view.animation.AccelerateInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.android.internal.statusbar.IStatusBarService;
import com.android.systemui.statusbar.BaseStatusBar;
import com.android.systemui.statusbar.DelegateViewHelper;
import com.android.systemui.statusbar.policy.DeadZone;
import com.android.systemui.statusbar.policy.KeyButtonView;
import com.mediatek.xlog.Xlog;
import java.io.FileDescriptor;
import java.io.PrintWriter;

// Referenced classes of package com.android.systemui.statusbar.phone:
//            PhoneStatusBar

public class NavigationBarView extends LinearLayout
{
    private class H extends Handler
    {

        final NavigationBarView this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 8686: 
                String s = (new StringBuilder()).append("").append(message.obj).toString();
                int i = getWidth();
                int j = getHeight();
                int k = mCurrentView.getWidth();
                int l = mCurrentView.getHeight();
                if (j != l || i != k)
                {
                    Object aobj[] = new Object[5];
                    aobj[0] = s;
                    aobj[1] = Integer.valueOf(i);
                    aobj[2] = Integer.valueOf(j);
                    aobj[3] = Integer.valueOf(k);
                    aobj[4] = Integer.valueOf(l);
                    Slog.w("PhoneStatusBar/NavigationBarView", String.format("*** Invalid layout in navigation bar (%s this=%dx%d cur=%dx%d)", aobj));
                    requestLayout();
                    return;
                }
                break;
            }
        }

        private H()
        {
            this$0 = NavigationBarView.this;
            super();
        }

    }


    static final boolean ANIMATE_HIDE_TRANSITION = false;
    static final boolean DEBUG = false;
    static final boolean DEBUG_DEADZONE = false;
    static final int MSG_CHECK_INVALID_LAYOUT = 8686;
    static final boolean NAVBAR_ALWAYS_AT_RIGHT = true;
    static final boolean SLIPPERY_WHEN_DISABLED = true;
    static final String TAG = "PhoneStatusBar/NavigationBarView";
    static final boolean WORKAROUND_INVALID_LAYOUT = true;
    private Drawable mBackAltIcon;
    private Drawable mBackAltLandIcon;
    private Drawable mBackIcon;
    private Drawable mBackLandIcon;
    protected IStatusBarService mBarService;
    int mBarSize;
    private Context mContext;
    View mCurrentView;
    private DeadZone mDeadZone;
    private DelegateViewHelper mDelegateHelper;
    int mDisabledFlags;
    final Display mDisplay;
    private H mHandler;
    boolean mHidden;
    android.view.View.OnTouchListener mLightsOutListener;
    boolean mLowProfile;
    int mNavigationIconHints;
    View mRotatedViews[];
    boolean mScreenOn;
    boolean mShowMenu;
    boolean mVertical;

    public NavigationBarView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mContext = null;
        mCurrentView = null;
        mRotatedViews = new View[4];
        mDisabledFlags = 0;
        mNavigationIconHints = 0;
        mHandler = new H();
        mLightsOutListener = new android.view.View.OnTouchListener() {

            final NavigationBarView this$0;

            public boolean onTouch(View view, MotionEvent motionevent)
            {
                if (motionevent.getAction() == 0)
                {
                    setLowProfile(false, false, false);
                    try
                    {
                        mBarService.setSystemUiVisibility(0, 1);
                    }
                    catch (RemoteException remoteexception)
                    {
                        return false;
                    }
                }
                return false;
            }

            
            {
                this$0 = NavigationBarView.this;
                super();
            }
        }
;
        mContext = context;
        mHidden = false;
        mDisplay = ((WindowManager)context.getSystemService("window")).getDefaultDisplay();
        mBarService = com.android.internal.statusbar.IStatusBarService.Stub.asInterface(ServiceManager.getService("statusbar"));
        Resources resources = mContext.getResources();
        mBarSize = resources.getDimensionPixelSize(0x7f0d0014);
        mVertical = false;
        mShowMenu = false;
        mDelegateHelper = new DelegateViewHelper(this);
        mBackIcon = resources.getDrawable(0x7f0200c1);
        mBackLandIcon = resources.getDrawable(0x7f0200c3);
        mBackAltIcon = resources.getDrawable(0x7f0200c2);
        mBackAltLandIcon = resources.getDrawable(0x7f0200c2);
    }

    private String getResourceName(int i)
    {
        if (i != 0)
        {
            Resources resources = mContext.getResources();
            String s;
            try
            {
                s = resources.getResourceName(i);
            }
            catch (android.content.res.Resources.NotFoundException notfoundexception)
            {
                return "(unknown)";
            }
            return s;
        } else
        {
            return "(null)";
        }
    }

    private void postCheckForInvalidLayout(String s)
    {
        mHandler.obtainMessage(8686, 0, 0, s).sendToTarget();
    }

    private static String visibilityToString(int i)
    {
        switch (i)
        {
        case 8: // '\b'
            return "GONE";

        case 4: // '\004'
            return "INVISIBLE";
        }
        return "VISIBLE";
    }

    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        printwriter.println("NavigationBarView {");
        Rect rect = new Rect();
        Point point = new Point();
        mDisplay.getRealSize(point);
        printwriter.println(String.format((new StringBuilder()).append("      this: ").append(PhoneStatusBar.viewInfo(this)).append(" ").append(visibilityToString(getVisibility())).toString(), new Object[0]));
        getWindowVisibleDisplayFrame(rect);
        boolean flag;
        if (rect.right <= point.x && rect.bottom <= point.y)
            flag = false;
        else
            flag = true;
        StringBuilder stringbuilder = (new StringBuilder()).append("      window: ").append(rect.toShortString()).append(" ").append(visibilityToString(getWindowVisibility()));
        String s;
        if (flag)
            s = " OFFSCREEN!";
        else
            s = "";
        printwriter.println(stringbuilder.append(s).toString());
        Object aobj[] = new Object[4];
        aobj[0] = getResourceName(mCurrentView.getId());
        aobj[1] = Integer.valueOf(mCurrentView.getWidth());
        aobj[2] = Integer.valueOf(mCurrentView.getHeight());
        aobj[3] = visibilityToString(mCurrentView.getVisibility());
        printwriter.println(String.format("      mCurrentView: id=%s (%dx%d) %s", aobj));
        Object aobj1[] = new Object[5];
        aobj1[0] = Integer.valueOf(mDisabledFlags);
        String s1;
        if (mVertical)
            s1 = "true";
        else
            s1 = "false";
        aobj1[1] = s1;
        String s2;
        if (mHidden)
            s2 = "true";
        else
            s2 = "false";
        aobj1[2] = s2;
        String s3;
        if (mLowProfile)
            s3 = "true";
        else
            s3 = "false";
        aobj1[3] = s3;
        String s4;
        if (mShowMenu)
            s4 = "true";
        else
            s4 = "false";
        aobj1[4] = s4;
        printwriter.println(String.format("      disabled=0x%08x vertical=%s hidden=%s low=%s menu=%s", aobj1));
        View view = getBackButton();
        View view1 = getHomeButton();
        View view2 = getRecentsButton();
        View view3 = getMenuButton();
        printwriter.println((new StringBuilder()).append("      back: ").append(PhoneStatusBar.viewInfo(view)).append(" ").append(visibilityToString(view.getVisibility())).toString());
        printwriter.println((new StringBuilder()).append("      home: ").append(PhoneStatusBar.viewInfo(view1)).append(" ").append(visibilityToString(view1.getVisibility())).toString());
        printwriter.println((new StringBuilder()).append("      rcnt: ").append(PhoneStatusBar.viewInfo(view2)).append(" ").append(visibilityToString(view2.getVisibility())).toString());
        printwriter.println((new StringBuilder()).append("      menu: ").append(PhoneStatusBar.viewInfo(view3)).append(" ").append(visibilityToString(view3.getVisibility())).toString());
        printwriter.println("    }");
    }

    public View getBackButton()
    {
        return mCurrentView.findViewById(0x7f080066);
    }

    public View getHomeButton()
    {
        return mCurrentView.findViewById(0x7f080067);
    }

    public View getMenuButton()
    {
        return mCurrentView.findViewById(0x7f080069);
    }

    public View getRecentsButton()
    {
        return mCurrentView.findViewById(0x7f080068);
    }

    public View getSearchLight()
    {
        return mCurrentView.findViewById(0x7f08006b);
    }

    public void hideForIPOShutdown()
    {
        for (int i = 0; i < 4; i++)
            if (mRotatedViews[i] != null && mRotatedViews[i].getVisibility() != 8)
                mRotatedViews[i].setVisibility(4);

    }

    public void notifyScreenOn(boolean flag)
    {
        mScreenOn = flag;
        setDisabledFlags(mDisabledFlags, true);
    }

    public void onFinishInflate()
    {
        View aview[] = mRotatedViews;
        View aview1[] = mRotatedViews;
        View view = findViewById(0x7f080064);
        aview1[2] = view;
        aview[0] = view;
        mRotatedViews[1] = findViewById(0x7f08006d);
        mRotatedViews[3] = findViewById(0x7f08006d);
        mCurrentView = mRotatedViews[0];
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return mDelegateHelper.onInterceptTouchEvent(motionevent);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        DelegateViewHelper delegateviewhelper = mDelegateHelper;
        View aview[] = new View[3];
        aview[0] = getHomeButton();
        aview[1] = getBackButton();
        aview[2] = getRecentsButton();
        delegateviewhelper.setInitialTouchRegion(aview);
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        boolean flag;
        if (i > 0 && j > i)
            flag = true;
        else
            flag = false;
        if (flag != mVertical)
        {
            mVertical = flag;
            reorient();
        }
        postCheckForInvalidLayout("sizeChanged");
        super.onSizeChanged(i, j, k, l);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mDeadZone != null && motionevent.getAction() == 4)
            mDeadZone.poke(motionevent);
        if (mDelegateHelper != null && mDelegateHelper.onInterceptTouchEvent(motionevent))
            return true;
        else
            return super.onTouchEvent(motionevent);
    }

    public void reorient()
    {
        int i = mDisplay.getRotation();
        for (int j = 0; j < 4; j++)
            mRotatedViews[j].setVisibility(8);

        mCurrentView = mRotatedViews[i];
        mCurrentView.setVisibility(0);
        mDeadZone = (DeadZone)mCurrentView.findViewById(0x7f08006c);
        setLowProfile(mLowProfile, false, true);
        setDisabledFlags(mDisabledFlags, true);
        setMenuVisibility(mShowMenu, true);
        setNavigationIconHints(mNavigationIconHints, true);
    }

    public void setBar(BaseStatusBar basestatusbar)
    {
        mDelegateHelper.setBar(basestatusbar);
    }

    public void setDelegateView(View view)
    {
        mDelegateHelper.setDelegateView(view);
    }

    public void setDisabledFlags(int i)
    {
        setDisabledFlags(i, false);
    }

    public void setDisabledFlags(int i, boolean flag)
    {
        View view3;
        byte byte3;
label0:
        {
            byte byte0 = 4;
            boolean flag1 = true;
            if (!flag && mDisabledFlags == i)
                return;
            mDisabledFlags = i;
            boolean flag2;
            if ((0x200000 & i) != 0)
                flag2 = flag1;
            else
                flag2 = false;
            boolean flag3;
            if ((0x1000000 & i) != 0)
                flag3 = flag1;
            else
                flag3 = false;
            boolean flag4;
            if ((0x400000 & i) != 0 && (8 & mNavigationIconHints) == 0)
                flag4 = flag1;
            else
                flag4 = false;
            boolean flag5;
            if ((0x2000000 & i) != 0)
                flag5 = flag1;
            else
                flag5 = false;
            if (!flag2 || !flag3 || !flag4 || !flag5)
                flag1 = false;
            setSlippery(flag1);
            if (!mScreenOn && mCurrentView != null)
            {
                ViewGroup viewgroup = (ViewGroup)mCurrentView.findViewById(0x7f080065);
                LayoutTransition layouttransition;
                if (viewgroup == null)
                    layouttransition = null;
                else
                    layouttransition = viewgroup.getLayoutTransition();
                if (layouttransition != null)
                    layouttransition.disableTransitionType(3);
            }
            View view = getBackButton();
            byte byte1;
            if (flag4)
                byte1 = byte0;
            else
                byte1 = 0;
            view.setVisibility(byte1);
            View view1 = getHomeButton();
            byte byte2;
            if (flag2)
                byte2 = byte0;
            else
                byte2 = 0;
            view1.setVisibility(byte2);
            View view2 = getRecentsButton();
            if (!flag3)
                byte0 = 0;
            view2.setVisibility(byte0);
            view3 = getSearchLight();
            if (flag2)
            {
                byte3 = 0;
                if (!flag5)
                    break label0;
            }
            byte3 = 8;
        }
        view3.setVisibility(byte3);
    }

    public void setHidden(boolean flag)
    {
        if (flag == mHidden)
            return;
        mHidden = flag;
        StringBuilder stringbuilder = new StringBuilder();
        String s;
        if (flag)
            s = "HIDING";
        else
            s = "SHOWING";
        Slog.d("PhoneStatusBar/NavigationBarView", stringbuilder.append(s).append(" navigation bar").toString());
        setLowProfile(false);
    }

    public void setLowProfile(boolean flag)
    {
        setLowProfile(flag, true, false);
    }

    public void setLowProfile(boolean flag, boolean flag1, boolean flag2)
    {
        long l = 250L;
        float f = 1.0F;
        if (!flag2 && flag == mLowProfile)
            return;
        mLowProfile = flag;
        View view = mCurrentView.findViewById(0x7f080065);
        final View lowLights = mCurrentView.findViewById(0x7f08006a);
        view.animate().cancel();
        lowLights.animate().cancel();
        if (!flag1)
        {
            float f2;
            if (flag)
                f2 = 0.0F;
            else
                f2 = f;
            view.setAlpha(f2);
            if (!flag)
                f = 0.0F;
            lowLights.setAlpha(f);
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            lowLights.setVisibility(byte0);
            return;
        }
        ViewPropertyAnimator viewpropertyanimator = view.animate();
        float f1;
        if (flag)
            f1 = 0.0F;
        else
            f1 = f;
        ViewPropertyAnimator viewpropertyanimator1 = viewpropertyanimator.alpha(f1);
        long l1;
        if (flag)
            l1 = 750L;
        else
            l1 = l;
        viewpropertyanimator1.setDuration(l1).start();
        lowLights.setOnTouchListener(mLightsOutListener);
        if (lowLights.getVisibility() == 8)
        {
            lowLights.setAlpha(0.0F);
            lowLights.setVisibility(0);
        }
        ViewPropertyAnimator viewpropertyanimator2 = lowLights.animate();
        if (!flag)
            f = 0.0F;
        ViewPropertyAnimator viewpropertyanimator3 = viewpropertyanimator2.alpha(f);
        if (flag)
            l = 750L;
        ViewPropertyAnimator viewpropertyanimator4 = viewpropertyanimator3.setDuration(l).setInterpolator(new AccelerateInterpolator(2.0F));
        AnimatorListenerAdapter animatorlisteneradapter;
        if (flag)
            animatorlisteneradapter = null;
        else
            animatorlisteneradapter = new AnimatorListenerAdapter() {

                final NavigationBarView this$0;
                final View val$lowLights;

                public void onAnimationEnd(Animator animator)
                {
                    lowLights.setVisibility(8);
                }

            
            {
                this$0 = NavigationBarView.this;
                lowLights = view;
                super();
            }
            }
;
        viewpropertyanimator4.setListener(animatorlisteneradapter).start();
    }

    public void setMenuVisibility(boolean flag)
    {
        setMenuVisibility(flag, false);
    }

    public void setMenuVisibility(boolean flag, boolean flag1)
    {
        if (!flag1 && mShowMenu == flag)
            return;
        mShowMenu = flag;
        View view = getMenuButton();
        byte byte0;
        if (mShowMenu)
            byte0 = 0;
        else
            byte0 = 4;
        view.setVisibility(byte0);
    }

    public void setNavigationIconHints(int i)
    {
        setNavigationIconHints(i, false);
    }

    public void setNavigationIconHints(int i, boolean flag)
    {
        float f = 0.5F;
        if (!flag && i == mNavigationIconHints)
            return;
        mNavigationIconHints = i;
        View view = getBackButton();
        float f1;
        if ((i & 1) != 0)
            f1 = f;
        else
            f1 = 1.0F;
        view.setAlpha(f1);
        View view1 = getHomeButton();
        float f2;
        if ((i & 2) != 0)
            f2 = f;
        else
            f2 = 1.0F;
        view1.setAlpha(f2);
        View view2 = getRecentsButton();
        if ((i & 4) == 0)
            f = 1.0F;
        view2.setAlpha(f);
        ImageView imageview = (ImageView)getBackButton();
        Drawable drawable;
        if ((i & 8) != 0)
        {
            if (mVertical)
                drawable = mBackAltLandIcon;
            else
                drawable = mBackAltIcon;
        } else
        if (mVertical)
            drawable = mBackLandIcon;
        else
            drawable = mBackIcon;
        imageview.setImageDrawable(drawable);
        setDisabledFlags(mDisabledFlags, true);
    }

    public void setSlippery(boolean flag)
    {
label0:
        {
            android.view.WindowManager.LayoutParams layoutparams = (android.view.WindowManager.LayoutParams)getLayoutParams();
            if (layoutparams == null)
                break label0;
            boolean flag1;
            if ((0x4000000 & layoutparams.flags) != 0)
                flag1 = true;
            else
                flag1 = false;
            if (!flag1 && flag)
            {
                layoutparams.flags = 0x4000000 | layoutparams.flags;
            } else
            {
                if (!flag1 || flag)
                    break label0;
                layoutparams.flags = 0xfbffffff & layoutparams.flags;
            }
            ((WindowManager)getContext().getSystemService("window")).updateViewLayout(this, layoutparams);
        }
    }

    public void upDateResources()
    {
        int i = ((WindowManager)mContext.getSystemService("window")).getDefaultDisplay().getRotation();
        Xlog.d("PhoneStatusBar/NavigationBarView", (new StringBuilder()).append("NavigationBarView upDateResources   rot = ").append(i).toString());
        KeyButtonView keybuttonview = (KeyButtonView)getBackButton();
        KeyButtonView keybuttonview1 = (KeyButtonView)getHomeButton();
        KeyButtonView keybuttonview2 = (KeyButtonView)getRecentsButton();
        KeyButtonView keybuttonview3 = (KeyButtonView)getMenuButton();
        switch (i)
        {
        case 1: // '\001'
            keybuttonview.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e5));
            keybuttonview1.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e5));
            keybuttonview2.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e5));
            keybuttonview3.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e5));
            return;

        case 0: // '\0'
        case 2: // '\002'
            keybuttonview.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e4));
            keybuttonview1.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e4));
            keybuttonview2.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e4));
            keybuttonview3.setGlowBackgroud(mContext.getResources().getDrawable(0x7f0200e4));
            return;
        }
    }
}
