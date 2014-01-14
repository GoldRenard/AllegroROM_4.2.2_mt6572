// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import java.util.*;

class Tweener
{

    private static final boolean DEBUG = false;
    private static final String TAG = "Tweener";
    private static android.animation.Animator.AnimatorListener mCleanupListener = new AnimatorListenerAdapter() {

        public void onAnimationCancel(Animator animator1)
        {
            Tweener.remove(animator1);
        }

        public void onAnimationEnd(Animator animator1)
        {
            Tweener.remove(animator1);
        }

    }
;
    private static HashMap sTweens = new HashMap();
    ObjectAnimator animator;

    public Tweener(ObjectAnimator objectanimator)
    {
        animator = objectanimator;
    }

    private static void remove(Animator animator1)
    {
        Iterator iterator = sTweens.entrySet().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((Tweener)((java.util.Map.Entry)iterator.next()).getValue()).animator != animator1)
                continue;
            iterator.remove();
            break;
        } while (true);
    }

    private static transient void replace(ArrayList arraylist, Object aobj[])
    {
        int i = aobj.length;
        for (int j = 0; j < i; j++)
        {
            Object obj = aobj[j];
            Tweener tweener = (Tweener)sTweens.get(obj);
            if (tweener == null)
                continue;
            tweener.animator.cancel();
            if (arraylist != null)
                tweener.animator.setValues((PropertyValuesHolder[])arraylist.toArray(new PropertyValuesHolder[arraylist.size()]));
            else
                sTweens.remove(tweener);
        }

    }

    public static void reset()
    {
        sTweens.clear();
    }

    public static transient Tweener to(Object obj, long l, Object aobj[])
    {
        long l1 = 0L;
        android.animation.ValueAnimator.AnimatorUpdateListener animatorupdatelistener = null;
        android.animation.Animator.AnimatorListener animatorlistener = null;
        TimeInterpolator timeinterpolator = null;
        ArrayList arraylist = new ArrayList(aobj.length / 2);
        for (int i = 0; i < aobj.length; i += 2)
        {
            if (!(aobj[i] instanceof String))
                throw new IllegalArgumentException((new StringBuilder()).append("Key must be a string: ").append(aobj[i]).toString());
            String s = (String)aobj[i];
            Object obj1 = aobj[i + 1];
            if ("simultaneousTween".equals(s))
                continue;
            if ("ease".equals(s))
            {
                timeinterpolator = (TimeInterpolator)obj1;
                continue;
            }
            if (!"onUpdate".equals(s) && !"onUpdateListener".equals(s))
            {
                if (!"onComplete".equals(s) && !"onCompleteListener".equals(s))
                {
                    if ("delay".equals(s))
                    {
                        l1 = ((Number)obj1).longValue();
                        continue;
                    }
                    if ("syncWith".equals(s))
                        continue;
                    if (obj1 instanceof float[])
                    {
                        float af[] = new float[2];
                        af[0] = ((float[])(float[])obj1)[0];
                        af[1] = ((float[])(float[])obj1)[1];
                        arraylist.add(PropertyValuesHolder.ofFloat(s, af));
                        continue;
                    }
                    if (obj1 instanceof int[])
                    {
                        int ai[] = new int[2];
                        ai[0] = ((int[])(int[])obj1)[0];
                        ai[1] = ((int[])(int[])obj1)[1];
                        arraylist.add(PropertyValuesHolder.ofInt(s, ai));
                        continue;
                    }
                    if (obj1 instanceof Number)
                        arraylist.add(PropertyValuesHolder.ofFloat(s, new float[] {
                            ((Number)obj1).floatValue()
                        }));
                    else
                        throw new IllegalArgumentException((new StringBuilder()).append("Bad argument for key \"").append(s).append("\" with value ").append(obj1.getClass()).toString());
                } else
                {
                    animatorlistener = (android.animation.Animator.AnimatorListener)obj1;
                }
            } else
            {
                animatorupdatelistener = (android.animation.ValueAnimator.AnimatorUpdateListener)obj1;
            }
        }

        Tweener tweener = (Tweener)sTweens.get(obj);
        ObjectAnimator objectanimator;
        if (tweener == null)
        {
            objectanimator = ObjectAnimator.ofPropertyValuesHolder(obj, (PropertyValuesHolder[])arraylist.toArray(new PropertyValuesHolder[arraylist.size()]));
            tweener = new Tweener(objectanimator);
            sTweens.put(obj, tweener);
        } else
        {
            objectanimator = ((Tweener)sTweens.get(obj)).animator;
            replace(arraylist, new Object[] {
                obj
            });
        }
        if (timeinterpolator != null)
            objectanimator.setInterpolator(timeinterpolator);
        objectanimator.setStartDelay(l1);
        objectanimator.setDuration(l);
        objectanimator.removeAllUpdateListeners();
        if (animatorupdatelistener != null)
            objectanimator.addUpdateListener(animatorupdatelistener);
        objectanimator.removeAllListeners();
        objectanimator.addListener(mCleanupListener);
        if (animatorlistener != null)
            objectanimator.addListener(animatorlistener);
        return tweener;
    }

    transient Tweener from(Object obj, long l, Object aobj[])
    {
        return to(obj, l, aobj);
    }


}
