// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.view.View;

// Referenced classes of package android.widget:
//            ResourceCursorTreeAdapter, TextView, ImageView

public abstract class SimpleCursorTreeAdapter extends ResourceCursorTreeAdapter
{
    public static interface ViewBinder
    {

        public abstract boolean setViewValue(View view, Cursor cursor, int i);
    }


    private int mChildFrom[];
    private String mChildFromNames[];
    private int mChildTo[];
    private int mGroupFrom[];
    private String mGroupFromNames[];
    private int mGroupTo[];
    private ViewBinder mViewBinder;

    public SimpleCursorTreeAdapter(Context context, Cursor cursor, int i, int j, String as[], int ai[], int k, 
            int l, String as1[], int ai1[])
    {
        super(context, cursor, i, j, k, l);
        init(as, ai, as1, ai1);
    }

    public SimpleCursorTreeAdapter(Context context, Cursor cursor, int i, int j, String as[], int ai[], int k, 
            String as1[], int ai1[])
    {
        super(context, cursor, i, j, k);
        init(as, ai, as1, ai1);
    }

    public SimpleCursorTreeAdapter(Context context, Cursor cursor, int i, String as[], int ai[], int j, String as1[], 
            int ai1[])
    {
        super(context, cursor, i, j);
        init(as, ai, as1, ai1);
    }

    private void bindView(View view, Context context, Cursor cursor, int ai[], int ai1[])
    {
label0:
        {
            ViewBinder viewbinder = mViewBinder;
            int i = 0;
            do
            {
                if (i >= ai1.length)
                    break label0;
                View view1 = view.findViewById(ai1[i]);
                if (view1 != null)
                {
                    boolean flag = false;
                    if (viewbinder != null)
                        flag = viewbinder.setViewValue(view1, cursor, ai[i]);
                    if (!flag)
                    {
                        String s = cursor.getString(ai[i]);
                        if (s == null)
                            s = "";
                        if (view1 instanceof TextView)
                        {
                            setViewText((TextView)view1, s);
                        } else
                        {
                            if (!(view1 instanceof ImageView))
                                break;
                            setViewImage((ImageView)view1, s);
                        }
                    }
                }
                i++;
            } while (true);
            throw new IllegalStateException("SimpleCursorTreeAdapter can bind values only to TextView and ImageView!");
        }
    }

    private void init(String as[], int ai[], String as1[], int ai1[])
    {
        mGroupFromNames = as;
        mGroupTo = ai;
        mChildFromNames = as1;
        mChildTo = ai1;
    }

    private void initFromColumns(Cursor cursor, String as[], int ai[])
    {
        for (int i = -1 + as.length; i >= 0; i--)
            ai[i] = cursor.getColumnIndexOrThrow(as[i]);

    }

    protected void bindChildView(View view, Context context, Cursor cursor, boolean flag)
    {
        if (mChildFrom == null)
        {
            mChildFrom = new int[mChildFromNames.length];
            initFromColumns(cursor, mChildFromNames, mChildFrom);
        }
        bindView(view, context, cursor, mChildFrom, mChildTo);
    }

    protected void bindGroupView(View view, Context context, Cursor cursor, boolean flag)
    {
        if (mGroupFrom == null)
        {
            mGroupFrom = new int[mGroupFromNames.length];
            initFromColumns(cursor, mGroupFromNames, mGroupFrom);
        }
        bindView(view, context, cursor, mGroupFrom, mGroupTo);
    }

    public ViewBinder getViewBinder()
    {
        return mViewBinder;
    }

    public void setViewBinder(ViewBinder viewbinder)
    {
        mViewBinder = viewbinder;
    }

    protected void setViewImage(ImageView imageview, String s)
    {
        try
        {
            imageview.setImageResource(Integer.parseInt(s));
            return;
        }
        catch (NumberFormatException numberformatexception)
        {
            imageview.setImageURI(Uri.parse(s));
        }
    }

    public void setViewText(TextView textview, String s)
    {
        textview.setText(s);
    }
}
