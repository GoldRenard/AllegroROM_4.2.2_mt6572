// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.animation.TimeAnimator;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.BitmapDrawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.util.Random;

// Referenced classes of package com.android.systemui:
//            BeanBagDream

public class BeanBag extends Activity
{
    public static class Board extends FrameLayout
    {

        static int BEANS[] = {
            0x7f02012f, 0x7f02012f, 0x7f02012f, 0x7f02012f, 0x7f020130, 0x7f020130, 0x7f020131, 0x7f020131, 0x7f020132
        };
        static int COLORS[] = {
            0xff00cc00, 0xffcc0000, 0xff0000cc, -256, -32768, 0xff00ccff, -65408, 0xff8000ff, -32640, 0xff8080ff, 
            0xffb0c0d0, 0xffdddddd, 0xff333333
        };
        static float LUCKY = 0.001F;
        static int MAX_RADIUS;
        static float MAX_SCALE;
        static float MIN_SCALE = 0.2F;
        static int NUM_BEANS = 40;
        static Random sRNG = new Random();
        private int boardHeight;
        private int boardWidth;
        TimeAnimator mAnim;

        static float clamp(float f, float f1, float f2)
        {
            if (f < f1)
                return f1;
            if (f > f2)
                return f2;
            else
                return f;
        }

        static float dot(float f, float f1, float f2, float f3)
        {
            return f3 + (f1 + f * f2);
        }

        static boolean flip()
        {
            return sRNG.nextBoolean();
        }

        static float lerp(float f, float f1, float f2)
        {
            return f + f2 * (f1 - f);
        }

        static float mag(float f, float f1)
        {
            return (float)Math.sqrt(f * f + f1 * f1);
        }

        static Object pick(Object aobj[])
        {
            if (aobj.length == 0)
                return null;
            else
                return aobj[sRNG.nextInt(aobj.length)];
        }

        static int pickInt(int ai[])
        {
            if (ai.length == 0)
                return 0;
            else
                return ai[sRNG.nextInt(ai.length)];
        }

        static float randfrange(float f, float f1)
        {
            return lerp(f, f1, sRNG.nextFloat());
        }

        static int randsign()
        {
            return !sRNG.nextBoolean() ? -1 : 1;
        }

        private void reset()
        {
            removeAllViews();
            android.view.ViewGroup.LayoutParams layoutparams = new android.view.ViewGroup.LayoutParams(-2, -2);
            for (int i = 0; i < NUM_BEANS; i++)
            {
                Bean bean = new Bean(getContext(), null);
                addView(bean, layoutparams);
                bean.z = (float)i / (float)NUM_BEANS;
                bean.z = bean.z * bean.z;
                bean.reset();
                bean.x = randfrange(0.0F, boardWidth);
                bean.y = randfrange(0.0F, boardHeight);
            }

            if (mAnim != null)
                mAnim.cancel();
            mAnim = new TimeAnimator();
            mAnim.setTimeListener(new android.animation.TimeAnimator.TimeListener() {

                private long lastPrint;
                final Board this$0;

                public void onTimeUpdate(TimeAnimator timeanimator, long l, long l1)
                {
                    for (int i = 0; i < getChildCount(); i++)
                    {
                        android.view.View view = getChildAt(i);
                        if (!(view instanceof Board.Bean))
                            continue;
                        Board.Bean bean = (Board.Bean)view;
                        bean.update((float)l1 / 1000F);
                        for (int j = i + 1; j < getChildCount(); j++)
                        {
                            android.view.View view1 = getChildAt(j);
                            if (view1 instanceof Board.Bean)
                                bean.overlap((Board.Bean)view1);
                        }

                        bean.setRotation(bean.a);
                        bean.setX(bean.x - bean.getPivotX());
                        bean.setY(bean.y - bean.getPivotY());
                        if (bean.x < (float)(-Board.MAX_RADIUS) || bean.x > (float)(boardWidth + Board.MAX_RADIUS) || bean.y < (float)(-Board.MAX_RADIUS) || bean.y > (float)(boardHeight + Board.MAX_RADIUS))
                            bean.reset();
                    }

                }

            
            {
                this$0 = Board.this;
                super();
                lastPrint = 0L;
            }
            }
);
        }

        public boolean isOpaque()
        {
            return false;
        }

        protected void onDetachedFromWindow()
        {
            super.onDetachedFromWindow();
            stopAnimation();
        }

        public void onDraw(Canvas canvas)
        {
        }

        protected void onSizeChanged(int i, int j, int k, int l)
        {
            super.onSizeChanged(i, j, k, l);
            boardWidth = i;
            boardHeight = j;
        }

        public void startAnimation()
        {
            stopAnimation();
            if (mAnim == null)
            {
                post(new Runnable() {

                    final Board this$0;

                    public void run()
                    {
                        reset();
                        startAnimation();
                    }

            
            {
                this$0 = Board.this;
                super();
            }
                }
);
                return;
            } else
            {
                mAnim.start();
                return;
            }
        }

        public void stopAnimation()
        {
            if (mAnim != null)
                mAnim.cancel();
        }

        static 
        {
            MAX_SCALE = 1.0F;
            MAX_RADIUS = (int)(576F * MAX_SCALE);
        }




        public Board(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            setSystemUiVisibility(1);
            setWillNotDraw(true);
        }
    }

    public class Board.Bean extends ImageView
    {

        public static final float VMAX = 1000F;
        public static final float VMIN = 100F;
        public float a;
        public boolean grabbed;
        public long grabtime;
        public float grabx;
        private float grabx_offset;
        public float graby;
        private float graby_offset;
        public int h;
        public float r;
        final Board this$0;
        public float va;
        public float vx;
        public float vy;
        public int w;
        public float x;
        public float y;
        public float z;

        private void pickBean()
        {
            int i = Board.pickInt(Board.BEANS);
            if (Board.randfrange(0.0F, 1.0F) <= Board.LUCKY)
                i = 0x7f020115;
            BitmapDrawable bitmapdrawable = (BitmapDrawable)getContext().getResources().getDrawable(i);
            Bitmap bitmap = bitmapdrawable.getBitmap();
            h = bitmap.getHeight();
            w = bitmap.getWidth();
            setImageDrawable(bitmapdrawable);
            Paint paint = new Paint();
            int j = Board.pickInt(Board.COLORS);
            float af[] = (new ColorMatrix()).getArray();
            af[0] = (float)((0xff0000 & j) >> 16) / 255F;
            af[5] = (float)((0xff00 & j) >> 8) / 255F;
            af[10] = (float)(j & 0xff) / 255F;
            paint.setColorFilter(new ColorMatrixColorFilter(af));
            if (i == 0x7f020115)
                paint = null;
            setLayerType(2, paint);
        }

        public boolean onTouchEvent(MotionEvent motionevent)
        {
            switch (motionevent.getAction())
            {
            case 1: // '\001'
            case 3: // '\003'
                grabbed = false;
                float f = (float)Board.randsign() * Board.clamp(0.33F * Board.mag(vx, vy), 0.0F, 1080F);
                va = Board.randfrange(0.5F * f, f);
                return true;

            case 0: // '\0'
                grabbed = true;
                grabx_offset = motionevent.getRawX() - x;
                graby_offset = motionevent.getRawY() - y;
                va = 0.0F;
                // fall through

            case 2: // '\002'
                grabx = motionevent.getRawX() - grabx_offset;
                graby = motionevent.getRawY() - graby_offset;
                grabtime = motionevent.getEventTime();
                return true;

            default:
                return true;
            }
        }

        public float overlap(Board.Bean bean)
        {
            return Board.mag(x - bean.x, y - bean.y) - r - bean.r;
        }

        public void reset()
        {
            pickBean();
            float f = Board.lerp(Board.MIN_SCALE, Board.MAX_SCALE, z);
            setScaleX(f);
            setScaleY(f);
            r = f * (0.3F * (float)Math.max(h, w));
            a = Board.randfrange(0.0F, 360F);
            va = Board.randfrange(-30F, 30F);
            vx = Board.randfrange(-40F, 40F) * z;
            vy = Board.randfrange(-40F, 40F) * z;
            float f1 = boardHeight;
            float f2 = boardWidth;
            if (Board.flip())
            {
                float f6;
                if (vx < 0.0F)
                    f6 = f2 + 2.0F * r;
                else
                    f6 = 4F * -r;
                x = f6;
                float f7 = 0.5F * Board.randfrange(0.0F, f1 - 3F * r);
                float f8;
                if (vy < 0.0F)
                    f8 = f1 * 0.5F;
                else
                    f8 = 0.0F;
                y = f8 + f7;
                return;
            }
            float f3;
            if (vy < 0.0F)
                f3 = f1 + 2.0F * r;
            else
                f3 = 4F * -r;
            y = f3;
            float f4 = 0.5F * Board.randfrange(0.0F, f2 - 3F * r);
            int i = vx != 0.0F;
            float f5 = 0.0F;
            if (i < 0)
                f5 = f2 * 0.5F;
            x = f4 + f5;
        }

        public String toString()
        {
            Object aobj[] = new Object[4];
            aobj[0] = Float.valueOf(getX());
            aobj[1] = Float.valueOf(getY());
            aobj[2] = Integer.valueOf(getWidth());
            aobj[3] = Integer.valueOf(getHeight());
            return String.format("<bean (%.1f, %.1f) (%d x %d)>", aobj);
        }

        public void update(float f)
        {
            if (grabbed)
            {
                vx = 0.75F * vx + 0.25F * ((grabx - x) / f);
                x = grabx;
                vy = 0.75F * vy + 0.25F * ((graby - y) / f);
                y = graby;
                return;
            } else
            {
                x = x + f * vx;
                y = y + f * vy;
                a = a + f * va;
                return;
            }
        }

        public Board.Bean(Context context, AttributeSet attributeset)
        {
            this$0 = Board.this;
            super(context, attributeset);
        }
    }


    static final boolean DEBUG;
    private Board mBoard;


    public void onPause()
    {
        super.onPause();
        mBoard.stopAnimation();
    }

    public void onResume()
    {
        super.onResume();
        mBoard.startAnimation();
    }

    public void onStart()
    {
        super.onStart();
        getPackageManager().setComponentEnabledSetting(new ComponentName(this, com/android/systemui/BeanBagDream), 1, 0);
        getWindow().addFlags(0x80001);
        mBoard = new Board(this, null);
        setContentView(mBoard);
    }
}
