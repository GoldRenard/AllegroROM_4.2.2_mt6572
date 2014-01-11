// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.*;

// Referenced classes of package android.widget:
//            FrameLayout, ZoomControls

public class ZoomButtonsController
    implements android.view.View.OnTouchListener
{
    private class Container extends FrameLayout
    {

        final ZoomButtonsController this$0;

        public boolean dispatchKeyEvent(KeyEvent keyevent)
        {
            if (onContainerKey(keyevent))
                return true;
            else
                return super.dispatchKeyEvent(keyevent);
        }

        public Container(Context context)
        {
            this$0 = ZoomButtonsController.this;
            super(context);
        }
    }

    public static interface OnZoomListener
    {

        public abstract void onVisibilityChanged(boolean flag);

        public abstract void onZoom(boolean flag);
    }


    private static final int MSG_DISMISS_ZOOM_CONTROLS = 3;
    private static final int MSG_POST_CONFIGURATION_CHANGED = 2;
    private static final int MSG_POST_SET_VISIBLE = 4;
    private static final String TAG = "ZoomButtonsController";
    private static final int ZOOM_CONTROLS_TIMEOUT = (int)ViewConfiguration.getZoomControlsTimeout();
    private static final int ZOOM_CONTROLS_TOUCH_PADDING = 20;
    private boolean mAutoDismissControls;
    private OnZoomListener mCallback;
    private final IntentFilter mConfigurationChangedFilter = new IntentFilter("android.intent.action.CONFIGURATION_CHANGED");
    private final BroadcastReceiver mConfigurationChangedReceiver = new BroadcastReceiver() {

        final ZoomButtonsController this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (!mIsVisible)
            {
                return;
            } else
            {
                mHandler.removeMessages(2);
                mHandler.sendEmptyMessage(2);
                return;
            }
        }

            
            {
                this$0 = ZoomButtonsController.this;
                super();
            }
    }
;
    private final FrameLayout mContainer = createContainer();
    private android.view.WindowManager.LayoutParams mContainerLayoutParams;
    private final int mContainerRawLocation[] = new int[2];
    private final Context mContext;
    private ZoomControls mControls;
    private final Handler mHandler = new Handler() {

        final ZoomButtonsController this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 4: // '\004'
                if (mOwnerView.getWindowToken() == null)
                {
                    Log.e("ZoomButtonsController", "Cannot make the zoom controller visible if the owner view is not attached to a window.");
                    return;
                } else
                {
                    setVisible(true);
                    return;
                }

            case 3: // '\003'
                setVisible(false);
                return;

            case 2: // '\002'
                onPostConfigurationChanged();
                return;
            }
        }

            
            {
                this$0 = ZoomButtonsController.this;
                super();
            }
    }
;
    private boolean mIsVisible;
    private final View mOwnerView;
    private final int mOwnerViewRawLocation[] = new int[2];
    private Runnable mPostedVisibleInitializer;
    private boolean mReleaseTouchListenerOnUp;
    private final int mTempIntArray[] = new int[2];
    private final Rect mTempRect = new Rect();
    private int mTouchPaddingScaledSq;
    private View mTouchTargetView;
    private final int mTouchTargetWindowLocation[] = new int[2];
    private final WindowManager mWindowManager;

    public ZoomButtonsController(View view)
    {
        mAutoDismissControls = true;
        mContext = view.getContext();
        mWindowManager = (WindowManager)mContext.getSystemService("window");
        mOwnerView = view;
        mTouchPaddingScaledSq = (int)(20F * mContext.getResources().getDisplayMetrics().density);
        mTouchPaddingScaledSq = mTouchPaddingScaledSq * mTouchPaddingScaledSq;
    }

    private FrameLayout createContainer()
    {
        android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(-2, -2);
        layoutparams.gravity = 0x800033;
        layoutparams.flags = 0x20218;
        layoutparams.height = -2;
        layoutparams.width = -1;
        layoutparams.type = 1000;
        layoutparams.format = -3;
        layoutparams.windowAnimations = 0x10301eb;
        mContainerLayoutParams = layoutparams;
        Container container = new Container(mContext);
        container.setLayoutParams(layoutparams);
        container.setMeasureAllChildren(true);
        ((LayoutInflater)mContext.getSystemService("layout_inflater")).inflate(0x10900ec, container);
        mControls = (ZoomControls)container.findViewById(0x10203ba);
        mControls.setOnZoomInClickListener(new android.view.View.OnClickListener() {

            final ZoomButtonsController this$0;

            public void onClick(View view)
            {
                dismissControlsDelayed(ZoomButtonsController.ZOOM_CONTROLS_TIMEOUT);
                if (mCallback != null)
                    mCallback.onZoom(true);
            }

            
            {
                this$0 = ZoomButtonsController.this;
                super();
            }
        }
);
        mControls.setOnZoomOutClickListener(new android.view.View.OnClickListener() {

            final ZoomButtonsController this$0;

            public void onClick(View view)
            {
                dismissControlsDelayed(ZoomButtonsController.ZOOM_CONTROLS_TIMEOUT);
                if (mCallback != null)
                    mCallback.onZoom(false);
            }

            
            {
                this$0 = ZoomButtonsController.this;
                super();
            }
        }
);
        return container;
    }

    private void dismissControlsDelayed(int i)
    {
        if (mAutoDismissControls)
        {
            mHandler.removeMessages(3);
            mHandler.sendEmptyMessageDelayed(3, i);
        }
    }

    private View findViewForTouch(int i, int j)
    {
        int k = i - mContainerRawLocation[0];
        int l = j - mContainerRawLocation[1];
        Rect rect = mTempRect;
        View view = null;
        int i1 = 0x7fffffff;
        for (int j1 = -1 + mContainer.getChildCount(); j1 >= 0; j1--)
        {
            View view1 = mContainer.getChildAt(j1);
            if (view1.getVisibility() != 0)
                continue;
            view1.getHitRect(rect);
            if (rect.contains(k, l))
                return view1;
            int k1;
            if (k >= rect.left && k <= rect.right)
                k1 = 0;
            else
                k1 = Math.min(Math.abs(rect.left - k), Math.abs(k - rect.right));
            int l1;
            if (l >= rect.top && l <= rect.bottom)
                l1 = 0;
            else
                l1 = Math.min(Math.abs(rect.top - l), Math.abs(l - rect.bottom));
            int i2 = k1 * k1 + l1 * l1;
            if (i2 < mTouchPaddingScaledSq && i2 < i1)
            {
                view = view1;
                i1 = i2;
            }
        }

        return view;
    }

    private boolean isInterestingKey(int i)
    {
        switch (i)
        {
        case 4: // '\004'
        case 19: // '\023'
        case 20: // '\024'
        case 21: // '\025'
        case 22: // '\026'
        case 23: // '\027'
        case 66: // 'B'
            return true;
        }
        return false;
    }

    private boolean onContainerKey(KeyEvent keyevent)
    {
label0:
        {
            int i = keyevent.getKeyCode();
            if (isInterestingKey(i))
            {
                if (i == 4)
                {
                    if (keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0)
                    {
                        if (mOwnerView != null)
                        {
                            android.view.KeyEvent.DispatcherState dispatcherstate = mOwnerView.getKeyDispatcherState();
                            if (dispatcherstate != null)
                                dispatcherstate.startTracking(keyevent, this);
                        }
                        break label0;
                    }
                    if (keyevent.getAction() == 1 && keyevent.isTracking() && !keyevent.isCanceled())
                    {
                        setVisible(false);
                        return true;
                    }
                } else
                {
                    dismissControlsDelayed(ZOOM_CONTROLS_TIMEOUT);
                }
                return false;
            }
            ViewRootImpl viewrootimpl = mOwnerView.getViewRootImpl();
            if (viewrootimpl != null)
            {
                viewrootimpl.dispatchKey(keyevent);
                return true;
            }
        }
        return true;
    }

    private void onPostConfigurationChanged()
    {
        dismissControlsDelayed(ZOOM_CONTROLS_TIMEOUT);
        refreshPositioningVariables();
    }

    private void refreshPositioningVariables()
    {
        if (mOwnerView.getWindowToken() != null)
        {
            int i = mOwnerView.getHeight();
            int j = mOwnerView.getWidth();
            int k = i - mContainer.getHeight();
            mOwnerView.getLocationOnScreen(mOwnerViewRawLocation);
            mContainerRawLocation[0] = mOwnerViewRawLocation[0];
            mContainerRawLocation[1] = k + mOwnerViewRawLocation[1];
            int ai[] = mTempIntArray;
            mOwnerView.getLocationInWindow(ai);
            mContainerLayoutParams.x = ai[0];
            mContainerLayoutParams.width = j;
            mContainerLayoutParams.y = k + ai[1];
            if (mIsVisible)
            {
                mWindowManager.updateViewLayout(mContainer, mContainerLayoutParams);
                return;
            }
        }
    }

    private void setTouchTargetView(View view)
    {
        mTouchTargetView = view;
        if (view != null)
            view.getLocationInWindow(mTouchTargetWindowLocation);
    }

    public ViewGroup getContainer()
    {
        return mContainer;
    }

    public View getZoomControls()
    {
        return mControls;
    }

    public boolean isAutoDismissed()
    {
        return mAutoDismissControls;
    }

    public boolean isVisible()
    {
        return mIsVisible;
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        if (motionevent.getPointerCount() <= 1)
        {
            if (mReleaseTouchListenerOnUp)
            {
                if (i == 1 || i == 3)
                {
                    mOwnerView.setOnTouchListener(null);
                    setTouchTargetView(null);
                    mReleaseTouchListenerOnUp = false;
                }
                return true;
            }
            dismissControlsDelayed(ZOOM_CONTROLS_TIMEOUT);
            View view1 = mTouchTargetView;
            switch (i)
            {
            case 1: // '\001'
            case 3: // '\003'
                setTouchTargetView(null);
                break;

            case 0: // '\0'
                view1 = findViewForTouch((int)motionevent.getRawX(), (int)motionevent.getRawY());
                setTouchTargetView(view1);
                break;
            }
            if (view1 != null)
            {
                int j = mContainerRawLocation[0] + mTouchTargetWindowLocation[0];
                int k = mContainerRawLocation[1] + mTouchTargetWindowLocation[1];
                MotionEvent motionevent1 = MotionEvent.obtain(motionevent);
                motionevent1.offsetLocation(mOwnerViewRawLocation[0] - j, mOwnerViewRawLocation[1] - k);
                float f = motionevent1.getX();
                float f1 = motionevent1.getY();
                if (f < 0.0F && f > -20F)
                    motionevent1.offsetLocation(-f, 0.0F);
                if (f1 < 0.0F && f1 > -20F)
                    motionevent1.offsetLocation(0.0F, -f1);
                boolean flag = view1.dispatchTouchEvent(motionevent1);
                motionevent1.recycle();
                return flag;
            }
        }
        return false;
    }

    public void setAutoDismissed(boolean flag)
    {
        if (mAutoDismissControls == flag)
        {
            return;
        } else
        {
            mAutoDismissControls = flag;
            return;
        }
    }

    public void setFocusable(boolean flag)
    {
        int i = mContainerLayoutParams.flags;
        if (flag)
        {
            android.view.WindowManager.LayoutParams layoutparams1 = mContainerLayoutParams;
            layoutparams1.flags = -9 & layoutparams1.flags;
        } else
        {
            android.view.WindowManager.LayoutParams layoutparams = mContainerLayoutParams;
            layoutparams.flags = 8 | layoutparams.flags;
        }
        if (mContainerLayoutParams.flags != i && mIsVisible)
            mWindowManager.updateViewLayout(mContainer, mContainerLayoutParams);
    }

    public void setOnZoomListener(OnZoomListener onzoomlistener)
    {
        mCallback = onzoomlistener;
    }

    public void setVisible(boolean flag)
    {
label0:
        {
            if (flag)
            {
                if (mOwnerView.getWindowToken() == null)
                {
                    if (!mHandler.hasMessages(4))
                        mHandler.sendEmptyMessage(4);
                    break label0;
                }
                dismissControlsDelayed(ZOOM_CONTROLS_TIMEOUT);
            }
            if (mIsVisible != flag)
            {
                mIsVisible = flag;
                if (flag)
                {
                    if (mContainerLayoutParams.token == null)
                        mContainerLayoutParams.token = mOwnerView.getWindowToken();
                    mWindowManager.addView(mContainer, mContainerLayoutParams);
                    if (mPostedVisibleInitializer == null)
                        mPostedVisibleInitializer = new Runnable() {

                            final ZoomButtonsController this$0;

                            public void run()
                            {
                                refreshPositioningVariables();
                                if (mCallback != null)
                                    mCallback.onVisibilityChanged(true);
                            }

            
            {
                this$0 = ZoomButtonsController.this;
                super();
            }
                        }
;
                    mHandler.post(mPostedVisibleInitializer);
                    mContext.registerReceiver(mConfigurationChangedReceiver, mConfigurationChangedFilter);
                    mOwnerView.setOnTouchListener(this);
                    mReleaseTouchListenerOnUp = false;
                    return;
                }
                if (mTouchTargetView != null)
                    mReleaseTouchListenerOnUp = true;
                else
                    mOwnerView.setOnTouchListener(null);
                mContext.unregisterReceiver(mConfigurationChangedReceiver);
                mWindowManager.removeView(mContainer);
                mHandler.removeCallbacks(mPostedVisibleInitializer);
                if (mCallback != null)
                {
                    mCallback.onVisibilityChanged(false);
                    return;
                }
            }
        }
    }

    public void setZoomInEnabled(boolean flag)
    {
        mControls.setIsZoomInEnabled(flag);
    }

    public void setZoomOutEnabled(boolean flag)
    {
        mControls.setIsZoomOutEnabled(flag);
    }

    public void setZoomSpeed(long l)
    {
        mControls.setZoomSpeed(l);
    }










}
