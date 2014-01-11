// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.os.Handler;

class DoubleDigitManager
{
    static interface CallBack
    {

        public abstract void singleDigitFinal(int i);

        public abstract boolean singleDigitIntermediate(int i);

        public abstract boolean twoDigitsFinal(int i, int j);
    }


    private Integer intermediateDigit;
    private final CallBack mCallBack;
    private final long timeoutInMillis;

    public DoubleDigitManager(long l, CallBack callback)
    {
        timeoutInMillis = l;
        mCallBack = callback;
    }

    public void reportDigit(int i)
    {
        if (intermediateDigit == null)
        {
            intermediateDigit = Integer.valueOf(i);
            (new Handler()).postDelayed(new Runnable() {

                final DoubleDigitManager this$0;

                public void run()
                {
                    if (intermediateDigit != null)
                    {
                        mCallBack.singleDigitFinal(intermediateDigit.intValue());
                        intermediateDigit = null;
                    }
                }

            
            {
                this$0 = DoubleDigitManager.this;
                super();
            }
            }
, timeoutInMillis);
            if (!mCallBack.singleDigitIntermediate(i))
            {
                intermediateDigit = null;
                mCallBack.singleDigitFinal(i);
            }
        } else
        if (mCallBack.twoDigitsFinal(intermediateDigit.intValue(), i))
        {
            intermediateDigit = null;
            return;
        }
    }



/*
    static Integer access$002(DoubleDigitManager doubledigitmanager, Integer integer)
    {
        doubledigitmanager.intermediateDigit = integer;
        return integer;
    }

*/

}
