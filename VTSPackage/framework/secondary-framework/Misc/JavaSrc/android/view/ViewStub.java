// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.util.AttributeSet;
import java.lang.ref.WeakReference;

// Referenced classes of package android.view:
//            View, ViewGroup, LayoutInflater

public final class ViewStub extends View
{
    public static interface OnInflateListener
    {

        public abstract void onInflate(ViewStub viewstub, View view);
    }


    private OnInflateListener mInflateListener;
    private int mInflatedId;
    private WeakReference mInflatedViewRef;
    private LayoutInflater mInflater;
    private int mLayoutResource;

    public ViewStub(Context context)
    {
        mLayoutResource = 0;
        initialize(context);
    }

    public ViewStub(Context context, int i)
    {
        mLayoutResource = 0;
        mLayoutResource = i;
        initialize(context);
    }

    public ViewStub(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ViewStub(Context context, AttributeSet attributeset, int i)
    {
        mLayoutResource = 0;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ViewStub, i, 0);
        mInflatedId = typedarray.getResourceId(1, -1);
        mLayoutResource = typedarray.getResourceId(0, 0);
        typedarray.recycle();
        TypedArray typedarray1 = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.View, i, 0);
        super.mID = typedarray1.getResourceId(8, -1);
        typedarray1.recycle();
        initialize(context);
    }

    private void initialize(Context context)
    {
        super.mContext = context;
        setVisibility(8);
        setWillNotDraw(true);
    }

    protected void dispatchDraw(Canvas canvas)
    {
    }

    public void draw(Canvas canvas)
    {
    }

    public int getInflatedId()
    {
        return mInflatedId;
    }

    public LayoutInflater getLayoutInflater()
    {
        return mInflater;
    }

    public int getLayoutResource()
    {
        return mLayoutResource;
    }

    public View inflate()
    {
        ViewParent viewparent = getParent();
        if (viewparent != null && (viewparent instanceof ViewGroup))
        {
            if (mLayoutResource != 0)
            {
                ViewGroup viewgroup = (ViewGroup)viewparent;
                LayoutInflater layoutinflater;
                if (mInflater != null)
                    layoutinflater = mInflater;
                else
                    layoutinflater = LayoutInflater.from(super.mContext);
                View view = layoutinflater.inflate(mLayoutResource, viewgroup, false);
                if (mInflatedId != -1)
                    view.setId(mInflatedId);
                int i = viewgroup.indexOfChild(this);
                viewgroup.removeViewInLayout(this);
                ViewGroup.LayoutParams layoutparams = getLayoutParams();
                if (layoutparams != null)
                    viewgroup.addView(view, i, layoutparams);
                else
                    viewgroup.addView(view, i);
                mInflatedViewRef = new WeakReference(view);
                if (mInflateListener != null)
                    mInflateListener.onInflate(this, view);
                return view;
            } else
            {
                throw new IllegalArgumentException("ViewStub must have a valid layoutResource");
            }
        } else
        {
            throw new IllegalStateException("ViewStub must have a non-null ViewGroup viewParent");
        }
    }

    protected void onMeasure(int i, int j)
    {
        setMeasuredDimension(0, 0);
    }

    public void setInflatedId(int i)
    {
        mInflatedId = i;
    }

    public void setLayoutInflater(LayoutInflater layoutinflater)
    {
        mInflater = layoutinflater;
    }

    public void setLayoutResource(int i)
    {
        mLayoutResource = i;
    }

    public void setOnInflateListener(OnInflateListener oninflatelistener)
    {
        mInflateListener = oninflatelistener;
    }

    public void setVisibility(int i)
    {
        if (mInflatedViewRef != null)
        {
            View view = (View)mInflatedViewRef.get();
            if (view != null)
                view.setVisibility(i);
            else
                throw new IllegalStateException("setVisibility called on un-referenced view");
        } else
        {
            super.setVisibility(i);
            if (i == 0 || i == 4)
            {
                inflate();
                return;
            }
        }
    }
}
