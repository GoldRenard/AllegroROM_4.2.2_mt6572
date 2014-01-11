// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.util.AttributeSet;
import com.mediatek.xlog.Xlog;

// Referenced classes of package android.widget:
//            RelativeLayout, ImageView

public class WeatherAnimateView extends RelativeLayout
{

    private static final int ANIM_DURATION = 800;
    private static final int IMAGEVIEW_ALPHA_OPAQUE = 1;
    private static final int IMAGEVIEW_ALPHA_TRANSPARENT = 0;
    private static final String PROPERTY_IMAGEVIEW_ALPHA = "alpha";
    private static final String TAG = "WeatherAnimationView";
    private Animator mFadeInAnimator;
    private Animator mFadeOutAnimator;
    private ImageView mInView;
    private Bitmap mLastRes;
    private ImageView mOutView;

    public WeatherAnimateView(Context context)
    {
        super(context);
        mLastRes = null;
    }

    public WeatherAnimateView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mLastRes = null;
        initAnimation();
    }

    public WeatherAnimateView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mLastRes = null;
        initAnimation();
    }

    private void initAnimation()
    {
        mFadeInAnimator = ObjectAnimator.ofFloat(mInView, "alpha", new float[] {
            0.0F, 1.0F
        });
        mFadeInAnimator.setDuration(800L);
        mFadeOutAnimator = ObjectAnimator.ofFloat(mOutView, "alpha", new float[] {
            1.0F, 0.0F
        });
        mFadeOutAnimator.setDuration(800L);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        Xlog.d("WeatherAnimationView", "onFinishInflate");
        mOutView = (ImageView)findViewWithTag("tag_weather_out_view");
        mInView = (ImageView)findViewWithTag("tag_weather_in_view");
        initAnimation();
    }

    public void setImageViewBitmap(final Bitmap res)
    {
        Xlog.d("WeatherAnimationView", (new StringBuilder()).append("setImageViewBitmap mLastResId = ").append(mLastRes).append(", new res=").append(res).toString());
        if (mLastRes == null)
        {
            mLastRes = res;
            mOutView.setVisibility(4);
            mInView.setImageBitmap(res);
            mInView.setVisibility(0);
            mFadeInAnimator.setTarget(mInView);
            mFadeInAnimator.start();
            return;
        } else
        {
            ImageView imageview = mOutView;
            mOutView = mInView;
            mInView = imageview;
            mFadeOutAnimator.addListener(new android.animation.Animator.AnimatorListener() {

                final WeatherAnimateView this$0;
                final Bitmap val$res;

                public void onAnimationCancel(Animator animator)
                {
                    Xlog.d("WeatherAnimationView", "onAnimationCancel");
                }

                public void onAnimationEnd(Animator animator)
                {
                    Xlog.d("WeatherAnimationView", "onAnimationEnd");
                    mOutView.setVisibility(4);
                    mLastRes = res;
                    mInView.setImageBitmap(res);
                    mInView.setVisibility(0);
                    mFadeInAnimator.setTarget(mInView);
                    mFadeInAnimator.start();
                }

                public void onAnimationRepeat(Animator animator)
                {
                }

                public void onAnimationStart(Animator animator)
                {
                }

            
            {
                this$0 = WeatherAnimateView.this;
                res = bitmap;
                super();
            }
            }
);
            mOutView.setImageBitmap(mLastRes);
            mOutView.setVisibility(0);
            mFadeOutAnimator.setTarget(mOutView);
            mFadeOutAnimator.start();
            return;
        }
    }

    public void setLastRes(Bitmap bitmap)
    {
        mLastRes = bitmap;
    }



/*
    static Bitmap access$102(WeatherAnimateView weatheranimateview, Bitmap bitmap)
    {
        weatheranimateview.mLastRes = bitmap;
        return bitmap;
    }

*/


}
