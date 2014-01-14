// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.graphics.*;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Log;
import android.view.*;
import android.widget.FrameLayout;
import android.widget.ImageView;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardWidgetFrame, KeyguardHostView, KeyguardUpdateMonitor, KeyguardActivityLauncher, 
//            KeyguardUpdateMonitorCallback

public class CameraWidgetFrame extends KeyguardWidgetFrame
    implements android.view.View.OnClickListener
{
    static interface Callbacks
    {

        public abstract void onCameraLaunchedSuccessfully();

        public abstract void onCameraLaunchedUnsuccessfully();

        public abstract void onLaunchingCamera();
    }

    private static final class FixedSizeFrameLayout extends FrameLayout
    {

        int height;
        int width;

        protected void onMeasure(int i, int j)
        {
            measureChildren(android.view.View.MeasureSpec.makeMeasureSpec(width, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(height, 0x40000000));
            setMeasuredDimension(width, height);
        }

        FixedSizeFrameLayout(Context context)
        {
            super(context);
        }
    }


    private static final boolean DEBUG = false;
    private static final int RECOVERY_DELAY = 1000;
    private static final String TAG = com/android/internal/policy/impl/keyguard/CameraWidgetFrame.getSimpleName();
    private static final int WIDGET_ANIMATION_DURATION = 250;
    private static final int WIDGET_WAIT_DURATION = 650;
    private boolean mActive;
    private final KeyguardActivityLauncher mActivityLauncher;
    private final KeyguardUpdateMonitorCallback mCallback = new KeyguardUpdateMonitorCallback() {

        private boolean mShowing;
        final CameraWidgetFrame this$0;

        void onKeyguardVisibilityChanged(boolean flag)
        {
            if (mShowing == flag)
            {
                return;
            } else
            {
                mShowing = flag;
                CameraWidgetFrame.this.onKeyguardVisibilityChanged(mShowing);
                return;
            }
        }

            
            {
                this$0 = CameraWidgetFrame.this;
                super();
            }
    }
;
    private Callbacks mCallbacks;
    private boolean mDown;
    private View mFullscreenPreview;
    private final Handler mHandler = new Handler();
    private long mLaunchCameraStart;
    private final Runnable mPostTransitionToCameraEndAction = new Runnable() {

        final CameraWidgetFrame this$0;

        public void run()
        {
            mHandler.post(mTransitionToCameraEndAction);
        }

            
            {
                this$0 = CameraWidgetFrame.this;
                super();
            }
    }
;
    private FixedSizeFrameLayout mPreview;
    private final Runnable mRecoverRunnable = new Runnable() {

        final CameraWidgetFrame this$0;

        public void run()
        {
            recover();
        }

            
            {
                this$0 = CameraWidgetFrame.this;
                super();
            }
    }
;
    private final Runnable mRenderRunnable = new Runnable() {

        final CameraWidgetFrame this$0;

        public void run()
        {
            render();
        }

            
            {
                this$0 = CameraWidgetFrame.this;
                super();
            }
    }
;
    private final Point mRenderedSize = new Point();
    private final Runnable mSecureCameraActivityStartedRunnable = new Runnable() {

        final CameraWidgetFrame this$0;

        public void run()
        {
            onSecureCameraActivityStarted();
        }

            
            {
                this$0 = CameraWidgetFrame.this;
                super();
            }
    }
;
    private final int mTmpLoc[] = new int[2];
    private final Rect mTmpRect = new Rect();
    private final Runnable mTransitionToCameraEndAction = new Runnable() {

        final CameraWidgetFrame this$0;

        public void run()
        {
            if (!mTransitioning)
                return;
            Handler handler;
            if (getWorkerHandler() != null)
                handler = getWorkerHandler();
            else
                handler = mHandler;
            mLaunchCameraStart = SystemClock.uptimeMillis();
            if (CameraWidgetFrame.DEBUG)
                Log.d(CameraWidgetFrame.TAG, (new StringBuilder()).append("Launching camera at ").append(mLaunchCameraStart).toString());
            mActivityLauncher.launchCamera(handler, mSecureCameraActivityStartedRunnable);
        }

            
            {
                this$0 = CameraWidgetFrame.this;
                super();
            }
    }
;
    private final Runnable mTransitionToCameraRunnable = new Runnable() {

        final CameraWidgetFrame this$0;

        public void run()
        {
            transitionToCamera();
        }

            
            {
                this$0 = CameraWidgetFrame.this;
                super();
            }
    }
;
    private boolean mTransitioning;
    private final KeyguardActivityLauncher.CameraWidgetInfo mWidgetInfo;
    private final WindowManager mWindowManager;

    private CameraWidgetFrame(Context context, Callbacks callbacks, KeyguardActivityLauncher keyguardactivitylauncher, KeyguardActivityLauncher.CameraWidgetInfo camerawidgetinfo, View view)
    {
        super(context);
        mCallbacks = callbacks;
        mActivityLauncher = keyguardactivitylauncher;
        mWidgetInfo = camerawidgetinfo;
        mWindowManager = (WindowManager)context.getSystemService("window");
        KeyguardUpdateMonitor.getInstance(context).registerCallback(mCallback);
        mPreview = new FixedSizeFrameLayout(context);
        mPreview.addView(view);
        addView(mPreview);
        View view1 = new View(context);
        view1.setBackgroundColor(0);
        view1.setOnClickListener(this);
        addView(view1);
        setContentDescription(context.getString(0x1040325));
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("new CameraWidgetFrame instance ").append(instanceId()).toString());
    }

    private void cancelTransitionToCamera()
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("cancelTransitionToCamera at ").append(SystemClock.uptimeMillis()).toString());
        mHandler.removeCallbacks(mTransitionToCameraRunnable);
    }

    public static CameraWidgetFrame create(Context context, Callbacks callbacks, KeyguardActivityLauncher keyguardactivitylauncher)
    {
        if (context != null && callbacks != null && keyguardactivitylauncher != null)
        {
            KeyguardActivityLauncher.CameraWidgetInfo camerawidgetinfo = keyguardactivitylauncher.getCameraWidgetInfo();
            if (camerawidgetinfo != null)
            {
                View view = getPreviewWidget(context, camerawidgetinfo);
                if (view != null)
                    return new CameraWidgetFrame(context, callbacks, keyguardactivitylauncher, camerawidgetinfo, view);
            }
        }
        return null;
    }

    private void enableWindowExitAnimation(boolean flag)
    {
        View view = getRootView();
        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
        if (layoutparams instanceof android.view.WindowManager.LayoutParams)
        {
            android.view.WindowManager.LayoutParams layoutparams1 = (android.view.WindowManager.LayoutParams)layoutparams;
            int i;
            if (flag)
                i = 0x10301e2;
            else
                i = 0;
            if (i != layoutparams1.windowAnimations)
            {
                if (DEBUG)
                    Log.d(TAG, (new StringBuilder()).append("setting windowAnimations to: ").append(i).append(" at ").append(SystemClock.uptimeMillis()).toString());
                layoutparams1.windowAnimations = i;
                mWindowManager.updateViewLayout(view, layoutparams1);
                return;
            }
        }
    }

    private static View getPreviewWidget(Context context, KeyguardActivityLauncher.CameraWidgetInfo camerawidgetinfo)
    {
        if (camerawidgetinfo.layoutId > 0)
            return inflateWidgetView(context, camerawidgetinfo);
        else
            return inflateGenericWidgetView(context);
    }

    private static View inflateGenericWidgetView(Context context)
    {
        if (DEBUG)
            Log.d(TAG, "inflateGenericWidgetView");
        ImageView imageview = new ImageView(context);
        imageview.setImageResource(0x10802e1);
        imageview.setScaleType(android.widget.ImageView.ScaleType.CENTER);
        imageview.setBackgroundColor(Color.argb(127, 0, 0, 0));
        return imageview;
    }

    private static View inflateWidgetView(Context context, KeyguardActivityLauncher.CameraWidgetInfo camerawidgetinfo)
    {
        Object obj;
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("inflateWidgetView: ").append(camerawidgetinfo.contextPackage).toString());
        obj = null;
        View view1;
        Context context1 = context.createPackageContext(camerawidgetinfo.contextPackage, 4);
        view1 = ((LayoutInflater)context1.getSystemService("layout_inflater")).cloneInContext(context1).inflate(camerawidgetinfo.layoutId, null, false);
        View view = view1;
_L2:
        if (obj != null)
            Log.w(TAG, "Error creating camera widget view", ((Throwable) (obj)));
        return view;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        obj = namenotfoundexception;
        view = null;
        continue; /* Loop/switch isn't completed */
        RuntimeException runtimeexception;
        runtimeexception;
        obj = runtimeexception;
        view = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private String instanceId()
    {
        return Integer.toHexString(hashCode());
    }

    private void onCameraLaunched()
    {
        mCallbacks.onCameraLaunchedSuccessfully();
        reset();
    }

    private void onKeyguardVisibilityChanged(boolean flag)
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("onKeyguardVisibilityChanged ").append(flag).append(" at ").append(SystemClock.uptimeMillis()).toString());
        if (mTransitioning && !flag)
        {
            mTransitioning = false;
            mHandler.removeCallbacks(mRecoverRunnable);
            if (mLaunchCameraStart > 0L)
            {
                long l = SystemClock.uptimeMillis() - mLaunchCameraStart;
                if (DEBUG)
                {
                    String s = TAG;
                    Object aobj[] = new Object[1];
                    aobj[0] = Long.valueOf(l);
                    Log.d(s, String.format("Camera took %sms to launch", aobj));
                }
                mLaunchCameraStart = 0L;
                onCameraLaunched();
            }
        }
    }

    private void onSecureCameraActivityStarted()
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("onSecureCameraActivityStarted at ").append(SystemClock.uptimeMillis()).toString());
        mHandler.postDelayed(mRecoverRunnable, 1000L);
    }

    private void recover()
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("recovering at ").append(SystemClock.uptimeMillis()).toString());
        mCallbacks.onCameraLaunchedUnsuccessfully();
        reset();
    }

    private void render()
    {
        getRootView();
        int i = getWidth();
        int j = getHeight();
        if (mRenderedSize.x == i && mRenderedSize.y == j)
        {
            if (DEBUG)
            {
                String s1 = TAG;
                Object aobj1[] = new Object[2];
                aobj1[0] = Integer.valueOf(i);
                aobj1[1] = Integer.valueOf(j);
                Log.d(s1, String.format("Already rendered at size=%sx%s", aobj1));
            }
        } else
        if (i != 0 && j != 0)
        {
            mPreview.width = i;
            mPreview.height = j;
            mPreview.requestLayout();
            int k = getWidth() - getPaddingLeft() - getPaddingRight();
            int l = getHeight() - getPaddingTop() - getPaddingBottom();
            float f = Math.min((float)k / (float)i, (float)l / (float)j);
            int i1 = (int)(f * (float)i);
            int j1 = (int)(f * (float)j);
            float f1;
            if (i1 < k)
                f1 = (k - i1) / 2;
            else
                f1 = 0.0F;
            float f2;
            if (j1 < l)
                f2 = (l - j1) / 2;
            else
                f2 = 0.0F;
            mPreview.setPivotX(0.0F);
            mPreview.setPivotY(0.0F);
            mPreview.setScaleX(f);
            mPreview.setScaleY(f);
            mPreview.setTranslationX(f1);
            mPreview.setTranslationY(f2);
            mRenderedSize.set(i, j);
            if (DEBUG)
            {
                String s = TAG;
                Object aobj[] = new Object[3];
                aobj[0] = Integer.valueOf(i);
                aobj[1] = Integer.valueOf(j);
                aobj[2] = instanceId();
                Log.d(s, String.format("Rendered camera widget size=%sx%s instance=%s", aobj));
                return;
            }
        }
    }

    private void rescheduleTransitionToCamera()
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("rescheduleTransitionToCamera at ").append(SystemClock.uptimeMillis()).toString());
        mHandler.removeCallbacks(mTransitionToCameraRunnable);
        mHandler.postDelayed(mTransitionToCameraRunnable, 650L);
    }

    private void reset()
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("reset at ").append(SystemClock.uptimeMillis()).toString());
        mLaunchCameraStart = 0L;
        mTransitioning = false;
        mDown = false;
        cancelTransitionToCamera();
        mHandler.removeCallbacks(mRecoverRunnable);
        mPreview.setVisibility(0);
        if (mFullscreenPreview != null)
        {
            mFullscreenPreview.animate().cancel();
            mFullscreenPreview.setVisibility(8);
        }
        enableWindowExitAnimation(true);
    }

    private void transitionToCamera()
    {
        if (!mTransitioning && !mDown)
        {
            mTransitioning = true;
            enableWindowExitAnimation(false);
            mPreview.getLocationInWindow(mTmpLoc);
            float f = (float)mPreview.getHeight() * mPreview.getScaleY();
            float f1 = (float)mTmpLoc[1] + f / 2.0F;
            ViewGroup viewgroup = (ViewGroup)getRootView();
            if (mFullscreenPreview == null)
            {
                mFullscreenPreview = getPreviewWidget(mContext, mWidgetInfo);
                mFullscreenPreview.setClickable(false);
                viewgroup.addView(mFullscreenPreview);
            }
            viewgroup.getWindowVisibleDisplayFrame(mTmpRect);
            float f2 = mTmpRect.height();
            float f3 = (float)mTmpRect.top + f2 / 2.0F;
            float f4 = f / f2;
            float f5 = f1 - f3;
            float f6 = mPreview.getScaleX();
            mPreview.setVisibility(8);
            mFullscreenPreview.setVisibility(0);
            mFullscreenPreview.setTranslationY(f5);
            mFullscreenPreview.setScaleX(f6);
            mFullscreenPreview.setScaleY(f4);
            mFullscreenPreview.animate().scaleX(1.0F).scaleY(1.0F).translationX(0.0F).translationY(0.0F).setDuration(250L).withEndAction(mPostTransitionToCameraEndAction).start();
            mCallbacks.onLaunchingCamera();
            return;
        } else
        {
            return;
        }
    }

    public void onActive(boolean flag)
    {
        mActive = flag;
        if (mActive)
        {
            rescheduleTransitionToCamera();
            return;
        }
        if (mCallbacks != null)
            mCallbacks.onCameraLaunchedUnsuccessfully();
        reset();
    }

    public void onBouncerShowing(boolean flag)
    {
        if (flag)
        {
            mTransitioning = false;
            mHandler.post(mRecoverRunnable);
        }
    }

    public void onClick(View view)
    {
        if (DEBUG)
            Log.d(TAG, "clicked");
        if (!mTransitioning && mActive)
        {
            cancelTransitionToCamera();
            transitionToCamera();
            return;
        } else
        {
            return;
        }
    }

    protected void onDetachedFromWindow()
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("onDetachedFromWindow: instance ").append(instanceId()).append(" at ").append(SystemClock.uptimeMillis()).toString());
        super.onDetachedFromWindow();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mCallback);
        cancelTransitionToCamera();
        mHandler.removeCallbacks(mRecoverRunnable);
        mCallbacks = null;
    }

    protected void onFocusLost()
    {
        if (DEBUG)
            Log.d(TAG, (new StringBuilder()).append("onFocusLost at ").append(SystemClock.uptimeMillis()).toString());
        cancelTransitionToCamera();
        super.onFocusLost();
    }

    public void onScreenTurnedOff()
    {
        if (DEBUG)
            Log.d(TAG, "onScreenTurnedOff");
        if (mCallbacks != null)
            mCallbacks.onCameraLaunchedUnsuccessfully();
        reset();
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        if (DEBUG)
        {
            String s = TAG;
            Object aobj[] = new Object[5];
            aobj[0] = Integer.valueOf(i);
            aobj[1] = Integer.valueOf(j);
            aobj[2] = Integer.valueOf(k);
            aobj[3] = Integer.valueOf(l);
            aobj[4] = Long.valueOf(SystemClock.uptimeMillis());
            Log.d(s, String.format("onSizeChanged new=%sx%s old=%sx%s at %s", aobj));
        }
        mHandler.post(mRenderRunnable);
        super.onSizeChanged(i, j, k, l);
    }

    public boolean onUserInteraction(MotionEvent motionevent)
    {
        boolean flag;
label0:
        {
            flag = true;
            if (mTransitioning)
            {
                if (DEBUG)
                    Log.d(TAG, "onUserInteraction eaten: mTransitioning");
            } else
            {
                getLocationOnScreen(mTmpLoc);
                int i = mTmpLoc[flag] + getHeight();
                if (motionevent.getRawY() <= (float)i)
                    break label0;
                if (DEBUG)
                {
                    Log.d(TAG, "onUserInteraction eaten: below widget");
                    return flag;
                }
            }
            return flag;
        }
        int j = motionevent.getAction();
        if (j != 0 && j != 2)
            flag = false;
        mDown = flag;
        if (mActive)
            rescheduleTransitionToCamera();
        if (DEBUG)
            Log.d(TAG, "onUserInteraction observed, not eaten");
        return false;
    }

    public void setOnLongClickListener(android.view.View.OnLongClickListener onlongclicklistener)
    {
    }

    static 
    {
        DEBUG = KeyguardHostView.DEBUG;
    }









/*
    static long access$302(CameraWidgetFrame camerawidgetframe, long l)
    {
        camerawidgetframe.mLaunchCameraStart = l;
        return l;
    }

*/






}
