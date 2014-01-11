// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.screenshot;

import android.animation.*;
import android.app.NotificationManager;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.media.MediaActionSound;
import android.util.DisplayMetrics;
import android.view.*;
import android.view.animation.Interpolator;
import android.widget.ImageView;

// Referenced classes of package com.android.systemui.screenshot:
//            SaveImageInBackgroundData, SaveImageInBackgroundTask

class GlobalScreenshot
{

    private static final float BACKGROUND_ALPHA = 0.5F;
    private static final int SCREENSHOT_DROP_IN_DURATION = 430;
    private static final float SCREENSHOT_DROP_IN_MIN_SCALE = 0.725F;
    private static final int SCREENSHOT_DROP_OUT_DELAY = 500;
    private static final int SCREENSHOT_DROP_OUT_DURATION = 430;
    private static final float SCREENSHOT_DROP_OUT_MIN_SCALE = 0.45F;
    private static final float SCREENSHOT_DROP_OUT_MIN_SCALE_OFFSET = 0F;
    private static final int SCREENSHOT_DROP_OUT_SCALE_DURATION = 370;
    private static final int SCREENSHOT_FAST_DROP_OUT_DURATION = 320;
    private static final float SCREENSHOT_FAST_DROP_OUT_MIN_SCALE = 0.6F;
    private static final int SCREENSHOT_FLASH_TO_PEAK_DURATION = 130;
    private static final int SCREENSHOT_NOTIFICATION_ID = 789;
    private static final float SCREENSHOT_SCALE = 1F;
    private ImageView mBackgroundView;
    private float mBgPadding;
    private float mBgPaddingScale;
    private MediaActionSound mCameraSound;
    private Context mContext;
    private Display mDisplay;
    private Matrix mDisplayMatrix;
    private DisplayMetrics mDisplayMetrics;
    private int mNotificationIconSize;
    private NotificationManager mNotificationManager;
    private Bitmap mScreenBitmap;
    private AnimatorSet mScreenshotAnimation;
    private ImageView mScreenshotFlash;
    private View mScreenshotLayout;
    private ImageView mScreenshotView;
    private android.view.WindowManager.LayoutParams mWindowLayoutParams;
    private WindowManager mWindowManager;

    public GlobalScreenshot(Context context)
    {
        Resources resources = context.getResources();
        mContext = context;
        LayoutInflater layoutinflater = (LayoutInflater)context.getSystemService("layout_inflater");
        mDisplayMatrix = new Matrix();
        mScreenshotLayout = layoutinflater.inflate(0x7f04000e, null);
        mBackgroundView = (ImageView)mScreenshotLayout.findViewById(0x7f080064);
        mScreenshotView = (ImageView)mScreenshotLayout.findViewById(0x7f080065);
        mScreenshotFlash = (ImageView)mScreenshotLayout.findViewById(0x7f080066);
        mScreenshotLayout.setFocusable(true);
        mScreenshotLayout.setOnTouchListener(new android.view.View.OnTouchListener() {

            final GlobalScreenshot this$0;

            public boolean onTouch(View view, MotionEvent motionevent)
            {
                return true;
            }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
        }
);
        mWindowLayoutParams = new android.view.WindowManager.LayoutParams(-1, -1, 0, 0, 2015, 0x1080500, -3);
        mWindowLayoutParams.setTitle("ScreenshotAnimation");
        mWindowManager = (WindowManager)context.getSystemService("window");
        mNotificationManager = (NotificationManager)context.getSystemService("notification");
        mDisplay = mWindowManager.getDefaultDisplay();
        mDisplayMetrics = new DisplayMetrics();
        mDisplay.getRealMetrics(mDisplayMetrics);
        mNotificationIconSize = resources.getDimensionPixelSize(0x1050006);
        mBgPadding = resources.getDimensionPixelSize(0x7f0d002b);
        mBgPaddingScale = mBgPadding / (float)mDisplayMetrics.widthPixels;
        mCameraSound = new MediaActionSound();
        mCameraSound.load(0);
    }

    private ValueAnimator createScreenshotDropInAnimation()
    {
        final Interpolator flashAlphaInterpolator = new Interpolator() {

            final GlobalScreenshot this$0;

            public float getInterpolation(float f)
            {
                if (f <= 0.6046512F)
                    return (float)Math.sin(3.1415926535897931D * (double)(f / 0.6046512F));
                else
                    return 0.0F;
            }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
        }
;
        final Interpolator scaleInterpolator = new Interpolator() {

            final GlobalScreenshot this$0;

            public float getInterpolation(float f)
            {
                if (f < 0.3023256F)
                    return 0.0F;
                else
                    return (f - 0.6046512F) / 0.3953488F;
            }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
        }
;
        ValueAnimator valueanimator = ValueAnimator.ofFloat(new float[] {
            0.0F, 1.0F
        });
        valueanimator.setDuration(430L);
        valueanimator.addListener(new AnimatorListenerAdapter() {

            final GlobalScreenshot this$0;

            public void onAnimationEnd(Animator animator)
            {
                mScreenshotFlash.setVisibility(8);
            }

            public void onAnimationStart(Animator animator)
            {
                mBackgroundView.setAlpha(0.0F);
                mBackgroundView.setVisibility(0);
                mScreenshotView.setAlpha(0.0F);
                mScreenshotView.setTranslationX(0.0F);
                mScreenshotView.setTranslationY(0.0F);
                mScreenshotView.setScaleX(1.0F + mBgPaddingScale);
                mScreenshotView.setScaleY(1.0F + mBgPaddingScale);
                mScreenshotView.setVisibility(0);
                mScreenshotFlash.setAlpha(0.0F);
                mScreenshotFlash.setVisibility(0);
            }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
        }
);
        valueanimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

            final GlobalScreenshot this$0;
            final Interpolator val$flashAlphaInterpolator;
            final Interpolator val$scaleInterpolator;

            public void onAnimationUpdate(ValueAnimator valueanimator1)
            {
                float f = ((Float)valueanimator1.getAnimatedValue()).floatValue();
                float f1 = (1.0F + mBgPaddingScale) - 0.275F * scaleInterpolator.getInterpolation(f);
                mBackgroundView.setAlpha(0.5F * scaleInterpolator.getInterpolation(f));
                mScreenshotView.setAlpha(f);
                mScreenshotView.setScaleX(f1);
                mScreenshotView.setScaleY(f1);
                mScreenshotFlash.setAlpha(flashAlphaInterpolator.getInterpolation(f));
            }

            
            {
                this$0 = GlobalScreenshot.this;
                scaleInterpolator = interpolator;
                flashAlphaInterpolator = interpolator1;
                super();
            }
        }
);
        return valueanimator;
    }

    private ValueAnimator createScreenshotDropOutAnimation(int i, int j, boolean flag, boolean flag1)
    {
        ValueAnimator valueanimator = ValueAnimator.ofFloat(new float[] {
            0.0F, 1.0F
        });
        valueanimator.setStartDelay(500L);
        valueanimator.addListener(new AnimatorListenerAdapter() {

            final GlobalScreenshot this$0;

            public void onAnimationEnd(Animator animator)
            {
                mBackgroundView.setVisibility(8);
                mScreenshotView.setVisibility(8);
                mScreenshotView.setLayerType(0, null);
            }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
        }
);
        if (flag && flag1)
        {
            final Interpolator scaleInterpolator = new Interpolator() {

                final GlobalScreenshot this$0;

                public float getInterpolation(float f2)
                {
                    float f3 = 1.0F;
                    if (f2 < 0.8604651F)
                        f3 = (float)(1.0D - Math.pow(f3 - f2 / 0.8604651F, 2D));
                    return f3;
                }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
            }
;
            float f = ((float)i - 2.0F * mBgPadding) / 2.0F;
            float f1 = ((float)j - 2.0F * mBgPadding) / 2.0F;
            final PointF finalPos = new PointF(-f + 0.45F * f, -f1 + 0.45F * f1);
            valueanimator.setDuration(430L);
            valueanimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

                final GlobalScreenshot this$0;
                final PointF val$finalPos;
                final Interpolator val$scaleInterpolator;

                public void onAnimationUpdate(ValueAnimator valueanimator1)
                {
                    float f2 = ((Float)valueanimator1.getAnimatedValue()).floatValue();
                    float f3 = (0.725F + mBgPaddingScale) - 0.275F * scaleInterpolator.getInterpolation(f2);
                    mBackgroundView.setAlpha(0.5F * (1.0F - f2));
                    mScreenshotView.setAlpha(1.0F - scaleInterpolator.getInterpolation(f2));
                    mScreenshotView.setScaleX(f3);
                    mScreenshotView.setScaleY(f3);
                    mScreenshotView.setTranslationX(f2 * finalPos.x);
                    mScreenshotView.setTranslationY(f2 * finalPos.y);
                }

            
            {
                this$0 = GlobalScreenshot.this;
                scaleInterpolator = interpolator;
                finalPos = pointf;
                super();
            }
            }
);
            return valueanimator;
        } else
        {
            valueanimator.setDuration(320L);
            valueanimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

                final GlobalScreenshot this$0;

                public void onAnimationUpdate(ValueAnimator valueanimator1)
                {
                    float f2 = ((Float)valueanimator1.getAnimatedValue()).floatValue();
                    float f3 = (0.725F + mBgPaddingScale) - 0.125F * f2;
                    mBackgroundView.setAlpha(0.5F * (1.0F - f2));
                    mScreenshotView.setAlpha(1.0F - f2);
                    mScreenshotView.setScaleX(f3);
                    mScreenshotView.setScaleY(f3);
                }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
            }
);
            return valueanimator;
        }
    }

    private float getDegreesForRotation(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            return 90F;

        case 2: // '\002'
            return 180F;

        case 1: // '\001'
            return 270F;
        }
        return 0.0F;
    }

    static void notifyScreenshotError(Context context, NotificationManager notificationmanager)
    {
        Resources resources = context.getResources();
        notificationmanager.notify(789, (new android.app.Notification.Builder(context)).setTicker(resources.getString(0x7f0b0047)).setContentTitle(resources.getString(0x7f0b0047)).setContentText(resources.getString(0x7f0b0048)).setSmallIcon(0x7f02015b).setWhen(System.currentTimeMillis()).setAutoCancel(true).getNotification());
    }

    private void saveScreenshotInWorkerThread(Runnable runnable)
    {
        SaveImageInBackgroundData saveimageinbackgrounddata = new SaveImageInBackgroundData();
        saveimageinbackgrounddata.context = mContext;
        saveimageinbackgrounddata.image = mScreenBitmap;
        saveimageinbackgrounddata.iconSize = mNotificationIconSize;
        saveimageinbackgrounddata.finisher = runnable;
        (new SaveImageInBackgroundTask(mContext, saveimageinbackgrounddata, mNotificationManager, 789)).execute(new SaveImageInBackgroundData[] {
            saveimageinbackgrounddata
        });
    }

    private void startAnimation(final Runnable finisher, int i, int j, boolean flag, boolean flag1)
    {
        mScreenshotView.setImageBitmap(mScreenBitmap);
        mScreenshotLayout.requestFocus();
        if (mScreenshotAnimation != null)
            mScreenshotAnimation.end();
        mWindowManager.addView(mScreenshotLayout, mWindowLayoutParams);
        ValueAnimator valueanimator = createScreenshotDropInAnimation();
        ValueAnimator valueanimator1 = createScreenshotDropOutAnimation(i, j, flag, flag1);
        mScreenshotAnimation = new AnimatorSet();
        mScreenshotAnimation.playSequentially(new Animator[] {
            valueanimator, valueanimator1
        });
        mScreenshotAnimation.addListener(new AnimatorListenerAdapter() {

            final GlobalScreenshot this$0;
            final Runnable val$finisher;

            public void onAnimationEnd(Animator animator)
            {
                saveScreenshotInWorkerThread(finisher);
                mWindowManager.removeView(mScreenshotLayout);
            }

            
            {
                this$0 = GlobalScreenshot.this;
                finisher = runnable;
                super();
            }
        }
);
        mScreenshotLayout.post(new Runnable() {

            final GlobalScreenshot this$0;

            public void run()
            {
                mCameraSound.play(0);
                mScreenshotView.setLayerType(2, null);
                mScreenshotView.buildLayer();
                mScreenshotAnimation.start();
            }

            
            {
                this$0 = GlobalScreenshot.this;
                super();
            }
        }
);
    }

    void takeScreenshot(Runnable runnable, boolean flag, boolean flag1)
    {
        mDisplay.getRealMetrics(mDisplayMetrics);
        float af[] = new float[2];
        af[0] = mDisplayMetrics.widthPixels;
        af[1] = mDisplayMetrics.heightPixels;
        float f = getDegreesForRotation(mDisplay.getRotation());
        boolean flag2;
        if (f > 0.0F)
            flag2 = true;
        else
            flag2 = false;
        if (flag2)
        {
            mDisplayMatrix.reset();
            mDisplayMatrix.preRotate(-f);
            mDisplayMatrix.mapPoints(af);
            af[0] = Math.abs(af[0]);
            af[1] = Math.abs(af[1]);
        }
        mScreenBitmap = Surface.screenshot((int)af[0], (int)af[1]);
        if (mScreenBitmap == null)
        {
            notifyScreenshotError(mContext, mNotificationManager);
            runnable.run();
            return;
        }
        if (flag2)
        {
            Bitmap bitmap = Bitmap.createBitmap(mDisplayMetrics.widthPixels, mDisplayMetrics.heightPixels, android.graphics.Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            canvas.translate(bitmap.getWidth() / 2, bitmap.getHeight() / 2);
            canvas.rotate(f);
            canvas.translate(-af[0] / 2.0F, -af[1] / 2.0F);
            canvas.drawBitmap(mScreenBitmap, 0.0F, 0.0F, null);
            canvas.setBitmap(null);
            mScreenBitmap = bitmap;
        }
        mScreenBitmap.setHasAlpha(false);
        mScreenBitmap.prepareToDraw();
        startAnimation(runnable, mDisplayMetrics.widthPixels, mDisplayMetrics.heightPixels, flag, flag1);
    }









}
