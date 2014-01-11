// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.graphics.drawable.Drawable;
import android.view.View;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            SecurityMessageDisplay

public class KeyguardSecurityViewHelper
{


    public static void hideBouncer(SecurityMessageDisplay securitymessagedisplay, View view, Drawable drawable, int i)
    {
label0:
        {
            if (securitymessagedisplay != null)
                securitymessagedisplay.hideBouncer(i);
            if (view != null)
            {
                view.setVisibility(0);
                if (i > 0)
                {
                    ObjectAnimator objectanimator1 = ObjectAnimator.ofFloat(view, "alpha", new float[] {
                        1.0F
                    });
                    objectanimator1.setDuration(i);
                    objectanimator1.start();
                } else
                {
                    view.setAlpha(1.0F);
                }
            }
            if (drawable != null)
            {
                if (i <= 0)
                    break label0;
                ObjectAnimator objectanimator = ObjectAnimator.ofInt(drawable, "alpha", new int[] {
                    255, 0
                });
                objectanimator.setDuration(i);
                objectanimator.start();
            }
            return;
        }
        drawable.setAlpha(0);
    }

    public static void showBouncer(SecurityMessageDisplay securitymessagedisplay, View view, Drawable drawable, int i)
    {
label0:
        {
            if (securitymessagedisplay != null)
                securitymessagedisplay.showBouncer(i);
            if (view != null)
                if (i > 0)
                {
                    ObjectAnimator objectanimator1 = ObjectAnimator.ofFloat(view, "alpha", new float[] {
                        0.0F
                    });
                    objectanimator1.setDuration(i);
                    objectanimator1.addListener(new AnimatorListenerAdapter(view) {

                        private boolean mCanceled;
                        final View val$ecaView;

                        public void onAnimationCancel(Animator animator)
                        {
                            mCanceled = true;
                            ecaView.setAlpha(1.0F);
                        }

                        public void onAnimationEnd(Animator animator)
                        {
                            View view1 = ecaView;
                            byte byte0;
                            if (mCanceled)
                                byte0 = 0;
                            else
                                byte0 = 4;
                            view1.setVisibility(byte0);
                        }

            
            {
                ecaView = view;
                super();
            }
                    }
);
                    objectanimator1.start();
                } else
                {
                    view.setAlpha(0.0F);
                    view.setVisibility(4);
                }
            if (drawable != null)
            {
                if (i <= 0)
                    break label0;
                ObjectAnimator objectanimator = ObjectAnimator.ofInt(drawable, "alpha", new int[] {
                    0, 255
                });
                objectanimator.setDuration(i);
                objectanimator.start();
            }
            return;
        }
        drawable.setAlpha(255);
    }
}
