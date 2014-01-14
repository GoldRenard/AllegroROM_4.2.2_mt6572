// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            UnReadObserver

public class LockScreenNewEventView extends RelativeLayout
{

    private static final boolean DEBUG = true;
    private static final int MAX_COUNT = 99;
    private static final String MAX_COUNT_STRING = "99+";
    private static final String TAG = "NewEventView";
    boolean mAttachedToWindow;
    private Context mContext;
    private int mCount;
    private UnReadObserver mEventChangeObserver;
    private String mNumberText;
    private int mResourceId;
    Runnable mSetNumberRunnable = new Runnable() {

        final LockScreenNewEventView this$0;

        public void run()
        {
            setNumberImp(mCount);
        }

            
            {
                this$0 = LockScreenNewEventView.this;
                super();
            }
    }
;
    private ViewGroup mTopParentView;
    private ImageView mUnReadImageView;
    private TextView mUnReadTextView;

    public LockScreenNewEventView(Context context)
    {
        this(context, null);
    }

    public LockScreenNewEventView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public LockScreenNewEventView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mCount = 0;
        mAttachedToWindow = false;
        mContext = context;
        setDrawingCacheEnabled(true);
    }

    private final void setNumberImp(int i)
    {
        Xlog.d("NewEventView", (new StringBuilder()).append("setNumber count=").append(i).toString());
        if (i <= 0)
        {
            setViewVisibility(4);
            return;
        }
        setViewVisibility(0);
        if (i > 99)
            mNumberText = "99+";
        else
            mNumberText = Integer.toString(i);
        mUnReadTextView.setText(mNumberText);
    }

    public int getFakeCenterX()
    {
        return mUnReadImageView.getWidth() / 2;
    }

    public int getFakeCenterY()
    {
        return mUnReadImageView.getHeight() / 2;
    }

    public int getNewEventBitmapHeight()
    {
        if (mUnReadImageView != null && mUnReadImageView.getDrawable() != null)
            return mUnReadImageView.getDrawable().getIntrinsicHeight();
        else
            return 0;
    }

    public int getNewEventBitmapWidth()
    {
        if (mUnReadImageView != null && mUnReadImageView.getDrawable() != null)
            return mUnReadImageView.getDrawable().getIntrinsicWidth();
        else
            return 0;
    }

    public ImageView getNewEventImageView()
    {
        return mUnReadImageView;
    }

    public int getResourceId()
    {
        return mResourceId;
    }

    public void init(int i)
    {
        Xlog.i("NewEventView", "init");
        mResourceId = i;
        Drawable drawable = mContext.getResources().getDrawable(i);
        mUnReadImageView.setImageDrawable(drawable);
        setPivotY(0.5F * (float)getMeasuredHeight());
        setPivotX(0.5F * (float)getMeasuredWidth());
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mAttachedToWindow = true;
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        removeCallbacks(mSetNumberRunnable);
        mAttachedToWindow = false;
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        mUnReadTextView = (TextView)findViewById(0x2100029);
        mUnReadImageView = (ImageView)findViewById(0x2100028);
    }

    public void registerForQueryObserver(Uri uri, UnReadObserver unreadobserver)
    {
        if (unreadobserver != null)
        {
            mEventChangeObserver = unreadobserver;
            getContext().getContentResolver().registerContentObserver(uri, true, mEventChangeObserver);
        }
    }

    public void setNumber(int i)
    {
        if (mAttachedToWindow)
        {
            mCount = i;
            post(mSetNumberRunnable);
        }
    }

    public void setTopParent(ViewGroup viewgroup)
    {
        mTopParentView = viewgroup;
    }

    public void setViewVisibility(int i)
    {
        mTopParentView.setVisibility(i);
    }

    public void unRegisterNewEventObserver()
    {
        if (mEventChangeObserver != null)
            getContext().getContentResolver().unregisterContentObserver(mEventChangeObserver);
    }

    public void updateQueryBaseTime(long l)
    {
        mEventChangeObserver.updateQueryBaseTime(l);
    }


}
