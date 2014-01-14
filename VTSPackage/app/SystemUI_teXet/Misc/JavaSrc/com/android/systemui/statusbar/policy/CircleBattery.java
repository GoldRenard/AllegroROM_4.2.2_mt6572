// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.*;
import android.os.Handler;
import android.util.AttributeSet;
import android.widget.ImageView;

public class CircleBattery extends ImageView
    implements BatteryController.BatteryStateChangeCallback
{
    class SettingsObserver extends ContentObserver
    {

        final CircleBattery this$0;

        public void observe()
        {
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("status_bar_battery"), false, this);
            onChange(true);
        }

        public void onChange(boolean flag)
        {
            updateSettings();
        }

        public void unobserve()
        {
            mContext.getContentResolver().unregisterContentObserver(this);
        }

        SettingsObserver(Handler handler)
        {
            this$0 = CircleBattery.this;
            super(handler);
        }
    }


    private static final String STATUS_BAR_BATTERY_PREF = "status_bar_battery";
    private boolean mActivated;
    private int mAnimOffset;
    private boolean mAttached;
    private int mBatteryStatus;
    private int mCircleSize;
    private Context mContext;
    private Handler mHandler;
    private final Runnable mInvalidate;
    private boolean mIsAnimating;
    private int mLevel;
    private SettingsObserver mObserver;
    private Paint mPaintFont;
    private Paint mPaintGray;
    private Paint mPaintRed;
    private Paint mPaintSystem;
    private boolean mPercentage;
    private RectF mRectLeft;
    private Float mTextLeftX;
    private Float mTextY;
    private int mWarningLevel;

    public CircleBattery(Context context)
    {
        this(context, null);
    }

    public CircleBattery(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public CircleBattery(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mInvalidate = new Runnable() {

            final CircleBattery this$0;

            public void run()
            {
                if (mActivated && mAttached)
                    invalidate();
            }

            
            {
                this$0 = CircleBattery.this;
                super();
            }
        }
;
        mContext = context;
        mHandler = new Handler();
        mObserver = new SettingsObserver(mHandler);
        Resources resources = getResources();
        mPaintFont = new Paint();
        mPaintFont.setAntiAlias(true);
        mPaintFont.setDither(true);
        mPaintFont.setStyle(android.graphics.Paint.Style.STROKE);
        mPaintGray = new Paint(mPaintFont);
        mPaintSystem = new Paint(mPaintFont);
        mPaintRed = new Paint(mPaintFont);
        mPaintGray.setStrokeCap(android.graphics.Paint.Cap.BUTT);
        mPaintSystem.setStrokeCap(android.graphics.Paint.Cap.BUTT);
        mPaintRed.setStrokeCap(android.graphics.Paint.Cap.BUTT);
        mPaintFont.setColor(resources.getColor(0x1060013));
        mPaintSystem.setColor(resources.getColor(0x1060013));
        mPaintGray.setColor(resources.getColor(0x1060000));
        mPaintRed.setColor(resources.getColor(0x1060016));
        mPaintFont.setTextAlign(android.graphics.Paint.Align.CENTER);
        mPaintFont.setFakeBoldText(true);
        mWarningLevel = context.getResources().getInteger(0x10e001a);
    }

    private void initSizeBasedStuff()
    {
        if (mCircleSize == 0)
            initSizeMeasureIconHeight();
        mPaintFont.setTextSize((float)mCircleSize / 2.0F);
        float f = (float)mCircleSize / 6.5F;
        mPaintRed.setStrokeWidth(f);
        mPaintSystem.setStrokeWidth(f);
        mPaintGray.setStrokeWidth(f / 3.5F);
        int i = getPaddingLeft();
        mRectLeft = new RectF((float)i + f / 2.0F, 0.0F + f / 2.0F, ((float)mCircleSize - f / 2.0F) + (float)i, (float)mCircleSize - f / 2.0F);
        Rect rect = new Rect();
        mPaintFont.getTextBounds("99", 0, "99".length(), rect);
        mTextLeftX = Float.valueOf((float)mCircleSize / 2.0F + (float)getPaddingLeft());
        mTextY = Float.valueOf(1.0F + (((float)mCircleSize / 2.0F + (float)(rect.bottom - rect.top) / 2.0F) - f / 2.0F));
        onMeasure(0, 0);
    }

    private void initSizeMeasureIconHeight()
    {
        Bitmap bitmap = BitmapFactory.decodeResource(getResources(), 0x7f020229);
        int i = bitmap.getWidth() / 2;
        mCircleSize = 0;
        for (int j = 0; j < bitmap.getHeight(); j++)
            if (Color.alpha(bitmap.getPixel(i, j)) > 5)
                mCircleSize = 1 + mCircleSize;

    }

    private void updateChargeAnim()
    {
        if (getBatteryStatus() != 2)
        {
            if (mIsAnimating)
            {
                mIsAnimating = false;
                mAnimOffset = 0;
                mHandler.removeCallbacks(mInvalidate);
            }
            return;
        }
        mIsAnimating = true;
        if (mAnimOffset > 360)
            mAnimOffset = 0;
        else
            mAnimOffset = 3 + mAnimOffset;
        mHandler.removeCallbacks(mInvalidate);
        mHandler.postDelayed(mInvalidate, 50L);
    }

    protected void drawCircle(Canvas canvas, int i, int j, float f, RectF rectf)
    {
        int k = 1;
        Paint paint = mPaintSystem;
        if (getBatteryStatus() != k)
            k = 0;
        if (k != 0)
        {
            paint = mPaintGray;
            i = 100;
        } else
        if (i < mWarningLevel)
            paint = mPaintRed;
        else
        if (getBatteryStatus() == 5)
            i = 100;
        canvas.drawArc(rectf, 270F, 360F, false, mPaintGray);
        canvas.drawArc(rectf, j + 270, 3.6F * (float)i, false, paint);
        if (k != 0)
        {
            mPaintFont.setColor(paint.getColor());
            canvas.drawText("?", f, mTextY.floatValue(), mPaintFont);
        } else
        if (i < 100 && mPercentage)
        {
            mPaintFont.setColor(paint.getColor());
            canvas.drawText(Integer.toString(i), f, mTextY.floatValue(), mPaintFont);
            return;
        }
    }

    protected int getBatteryLevel()
    {
        return mLevel;
    }

    protected int getBatteryStatus()
    {
        return mBatteryStatus;
    }

    protected boolean isBatteryPresent()
    {
        return true;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (!mAttached)
        {
            mAttached = true;
            mObserver.observe();
            mHandler.postDelayed(mInvalidate, 250L);
        }
    }

    public void onBatteryLevelChanged(int i, int j)
    {
        mLevel = i;
        mBatteryStatus = j;
        updateVisibility();
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mAttached)
        {
            mAttached = false;
            mObserver.unobserve();
            mRectLeft = null;
            mCircleSize = 0;
        }
    }

    protected void onDraw(Canvas canvas)
    {
        if (mRectLeft == null)
            initSizeBasedStuff();
        updateChargeAnim();
        boolean flag;
        if (getBatteryStatus() == 2)
            flag = true;
        else
            flag = false;
        int i = 0;
        if (flag)
            i = mAnimOffset;
        drawCircle(canvas, getBatteryLevel(), i, mTextLeftX.floatValue(), mRectLeft);
    }

    protected void onMeasure(int i, int j)
    {
        if (mCircleSize == 0)
            initSizeMeasureIconHeight();
        setMeasuredDimension(mCircleSize + getPaddingLeft(), mCircleSize);
    }

    public void updateSettings()
    {
        boolean flag = true;
        int i = android.provider.Settings.System.getInt(mContext.getContentResolver(), "status_bar_battery", 0);
        boolean flag1;
        if (i != 2 && i != 3)
            flag1 = false;
        else
            flag1 = flag;
        mActivated = flag1;
        if (i != 3)
            flag = false;
        mPercentage = flag;
        updateVisibility();
    }

    protected void updateVisibility()
    {
        byte byte0;
        if (mActivated && isBatteryPresent())
            byte0 = 0;
        else
            byte0 = 8;
        setVisibility(byte0);
        if (mActivated && mAttached)
            invalidate();
    }



}
