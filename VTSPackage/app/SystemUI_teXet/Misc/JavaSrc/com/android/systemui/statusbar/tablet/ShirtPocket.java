// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.animation.*;
import android.content.ClipData;
import android.content.Context;
import android.graphics.*;
import android.util.AttributeSet;
import android.view.*;
import android.widget.ImageView;

public class ShirtPocket extends ImageView
{
    public static class DropZone extends View
    {

        ShirtPocket mPocket;

        private void hide(boolean flag)
        {
            AnimatorListenerAdapter animatorlisteneradapter = new AnimatorListenerAdapter() {

                final DropZone this$0;

                public void onAnimationEnd(Animator animator)
                {
                    setTranslationY(2 + getHeight());
                    setAlpha(0.0F);
                }

            
            {
                this$0 = DropZone.this;
                super();
            }
            }
;
            if (flag)
            {
                float af[] = new float[2];
                af[0] = getAlpha();
                af[1] = 0.0F;
                ObjectAnimator objectanimator = ObjectAnimator.ofFloat(this, "alpha", af);
                objectanimator.addListener(animatorlisteneradapter);
                objectanimator.start();
                return;
            } else
            {
                animatorlisteneradapter.onAnimationEnd(null);
                return;
            }
        }

        private void show(boolean flag)
        {
            setTranslationY(0.0F);
            if (flag)
            {
                setAlpha(0.0F);
                ObjectAnimator.ofFloat(this, "alpha", new float[] {
                    0.0F, 1.0F
                }).start();
                return;
            } else
            {
                setAlpha(1.0F);
                return;
            }
        }

        public void onAttachedToWindow()
        {
            super.onAttachedToWindow();
            if (mPocket.holding())
            {
                show(false);
                return;
            } else
            {
                hide(false);
                return;
            }
        }

        public boolean onDragEvent(DragEvent dragevent)
        {
            switch (dragevent.getAction())
            {
            case 4: // '\004'
                hide(true);
                return true;

            case 3: // '\003'
                mPocket.stash(dragevent.getClipData());
                return true;

            case 1: // '\001'
                show(true);
                return true;

            case 2: // '\002'
            case 5: // '\005'
            case 6: // '\006'
            default:
                return true;
            }
        }

        public void setPocket(ShirtPocket shirtpocket)
        {
            mPocket = shirtpocket;
        }

        public DropZone(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }
    }


    private static final boolean DEBUG = false;
    private static final String TAG = "StatusBar/ShirtPocket";
    ObjectAnimator mAnimHide;
    ObjectAnimator mAnimShow;
    private ClipData mClipping;
    private ImageView mPreviewIcon;

    public ShirtPocket(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mClipping = null;
    }

    private void stash(ClipData clipdata)
    {
        mClipping = clipdata;
        if (mClipping != null)
        {
            setVisibility(0);
            Bitmap bitmap = mClipping.getIcon();
            if (bitmap != null)
                setImageBitmap(bitmap);
            else
            if (mClipping.getItemCount() > 0)
                return;
            return;
        } else
        {
            setVisibility(8);
            return;
        }
    }

    public boolean holding()
    {
        return mClipping != null;
    }

    protected void onAttachedToWindow()
    {
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        boolean flag = false;
        if (i == 0)
        {
            ClipData clipdata = mClipping;
            flag = false;
            if (clipdata != null)
            {
                Bitmap bitmap = clipdata.getIcon();
                Object obj;
                if (bitmap != null)
                    obj = new android.view.View.DragShadowBuilder(bitmap) {

                        final ShirtPocket this$0;
                        final Bitmap val$icon;

                        public void onDrawShadow(Canvas canvas)
                        {
                            canvas.drawBitmap(icon, 0.0F, 0.0F, new Paint());
                        }

                        public void onProvideShadowMetrics(Point point, Point point1)
                        {
                            point.set(icon.getWidth(), icon.getHeight());
                            point1.set(point.x / 2, point.y / 2);
                        }

            
            {
                this$0 = ShirtPocket.this;
                icon = bitmap;
                super(final_view);
            }
                    }
;
                else
                    obj = new android.view.View.DragShadowBuilder(this);
                startDrag(clipdata, ((android.view.View.DragShadowBuilder) (obj)), null, 0);
                stash(null);
                flag = true;
            }
        }
        return flag;
    }

}
