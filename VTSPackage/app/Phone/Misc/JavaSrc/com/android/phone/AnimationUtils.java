// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.animation.*;
import android.graphics.Canvas;
import android.graphics.drawable.*;
import android.util.Log;
import android.view.View;
import android.view.ViewPropertyAnimator;
import android.widget.ImageView;

public class AnimationUtils
{
    private static class CrossFadeDrawable extends LayerDrawable
    {

        private final ObjectAnimator mAnimator = ObjectAnimator.ofInt(this, "crossFadeAlpha", new int[] {
            255, 0
        });
        private int mCrossFadeAlpha;

        public void draw(Canvas canvas)
        {
            Drawable drawable = getDrawable(0);
            Drawable drawable1 = getDrawable(1);
            if (mCrossFadeAlpha > 0)
            {
                drawable.setAlpha(mCrossFadeAlpha);
                drawable.draw(canvas);
                drawable.setAlpha(255);
            }
            if (mCrossFadeAlpha < 255)
            {
                drawable1.setAlpha(255 - mCrossFadeAlpha);
                drawable1.draw(canvas);
                drawable1.setAlpha(255);
            }
        }

        public ObjectAnimator getAnimator()
        {
            return mAnimator;
        }

        public void setCrossFadeAlpha(int i)
        {
            mCrossFadeAlpha = i;
            invalidateSelf();
        }

        public CrossFadeDrawable(Drawable adrawable[])
        {
            super(adrawable);
        }
    }

    public static class Fade
    {

        private static final int FADE_STATE_KEY = 0x7f08000b;
        private static final String FADING_OUT = "fading_out";

        public static void hide(View view, int i)
        {
            if (view.getVisibility() == 0 && (i == 4 || i == 8))
            {
                view.setTag(0x7f08000b, "fading_out");
                view.animate().cancel();
                view.animate().setDuration(250L);
                view.animate().alpha(0.0F).setListener(new AnimatorListenerAdapter(view, i) {

                    final View val$view;
                    final int val$visibility;

                    public void onAnimationEnd(Animator animator)
                    {
                        view.setAlpha(1.0F);
                        view.setVisibility(visibility);
                        view.animate().setListener(null);
                        view.setTag(0x7f08000b, null);
                    }

            
            {
                view = view1;
                visibility = i;
                super();
            }
                }
);
            }
        }

        public static boolean isFadingOut(View view)
        {
            return view.getTag(0x7f08000b) == "fading_out";
        }

        public static void show(View view)
        {
            if (view.getVisibility() != 0 || isFadingOut(view))
            {
                view.animate().setListener(null);
                view.animate().cancel();
                view.setTag(0x7f08000b, null);
                view.setAlpha(0.0F);
                view.setVisibility(0);
                view.animate().setDuration(250L);
                view.animate().alpha(1.0F);
            }
        }

    }


    public static final int ANIMATION_DURATION = 250;
    private static final boolean FADE_DBG;
    private static final String LOG_TAG = com/android/phone/AnimationUtils.getSimpleName();

    private AnimationUtils()
    {
    }

    private static void log(String s)
    {
        Log.d(LOG_TAG, s);
    }

    private static CrossFadeDrawable newCrossFadeDrawable(Drawable drawable, Drawable drawable1)
    {
        return new CrossFadeDrawable(new Drawable[] {
            drawable, drawable1
        });
    }

    public static void startCrossFade(ImageView imageview, Drawable drawable, Drawable drawable1)
    {
        boolean flag;
        if (!drawable.equals(drawable1) && (!(drawable instanceof BitmapDrawable) || !(drawable1 instanceof BitmapDrawable) || !((BitmapDrawable)drawable).getBitmap().equals(((BitmapDrawable)drawable1).getBitmap())))
            flag = false;
        else
            flag = true;
        if (!flag)
        {
            CrossFadeDrawable crossfadedrawable = newCrossFadeDrawable(drawable, drawable1);
            ObjectAnimator objectanimator = crossfadedrawable.getAnimator();
            imageview.setImageDrawable(crossfadedrawable);
            objectanimator.setDuration(250L);
            objectanimator.addListener(new AnimatorListenerAdapter(drawable, drawable1, imageview) {

                final Drawable val$from;
                final ImageView val$imageView;
                final Drawable val$to;

                public void onAnimationEnd(Animator animator)
                {
                    animator.removeAllListeners();
                    imageView.setImageDrawable(to);
                }

                public void onAnimationStart(Animator animator)
                {
                }

            
            {
                from = drawable;
                to = drawable1;
                imageView = imageview;
                super();
            }
            }
);
            objectanimator.start();
            imageview.setTag(drawable1);
        }
    }

}
