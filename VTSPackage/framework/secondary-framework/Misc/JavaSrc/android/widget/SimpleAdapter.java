// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.net.Uri;
import android.view.*;
import java.util.*;

// Referenced classes of package android.widget:
//            BaseAdapter, Filterable, Checkable, TextView, 
//            ImageView, Filter

public class SimpleAdapter extends BaseAdapter
    implements Filterable
{
    private class SimpleFilter extends Filter
    {

        final SimpleAdapter this$0;

        protected Filter.FilterResults performFiltering(CharSequence charsequence)
        {
            Filter.FilterResults filterresults;
label0:
            {
                filterresults = new Filter.FilterResults();
                if (mUnfilteredData == null)
                    mUnfilteredData = new ArrayList(mData);
                if (charsequence == null || charsequence.length() == 0)
                    break label0;
                String s = charsequence.toString().toLowerCase();
                ArrayList arraylist1 = mUnfilteredData;
                int i = arraylist1.size();
                ArrayList arraylist2 = new ArrayList(i);
label1:
                for (int j = 0; j < i; j++)
                {
                    Map map = (Map)arraylist1.get(j);
                    if (map == null)
                        continue;
                    int k = mTo.length;
                    int l = 0;
                    do
                    {
                        if (l >= k)
                            continue label1;
                        String as[] = ((String)map.get(mFrom[l])).split(" ");
                        int i1 = as.length;
                        int j1 = 0;
                        do
                        {
label2:
                            {
                                if (j1 < i1)
                                {
                                    if (!as[j1].toLowerCase().startsWith(s))
                                        break label2;
                                    arraylist2.add(map);
                                }
                                l++;
                            }
                            if (true)
                                break;
                            j1++;
                        } while (true);
                    } while (true);
                }

                filterresults.values = arraylist2;
                filterresults.count = arraylist2.size();
                return filterresults;
            }
            ArrayList arraylist = mUnfilteredData;
            filterresults.values = arraylist;
            filterresults.count = arraylist.size();
            return filterresults;
        }

        protected void publishResults(CharSequence charsequence, Filter.FilterResults filterresults)
        {
            mData = (List)filterresults.values;
            if (filterresults.count > 0)
            {
                notifyDataSetChanged();
                return;
            } else
            {
                notifyDataSetInvalidated();
                return;
            }
        }

        private SimpleFilter()
        {
            this$0 = SimpleAdapter.this;
            super();
        }

    }

    public static interface ViewBinder
    {

        public abstract boolean setViewValue(View view, Object obj, String s);
    }


    private List mData;
    private int mDropDownResource;
    private SimpleFilter mFilter;
    private String mFrom[];
    private LayoutInflater mInflater;
    private int mResource;
    private int mTo[];
    private ArrayList mUnfilteredData;
    private ViewBinder mViewBinder;

    public SimpleAdapter(Context context, List list, int i, String as[], int ai[])
    {
        mData = list;
        mDropDownResource = i;
        mResource = i;
        mFrom = as;
        mTo = ai;
        mInflater = (LayoutInflater)context.getSystemService("layout_inflater");
    }

    private void bindView(int i, View view)
    {
label0:
        {
            Map map = (Map)mData.get(i);
            if (map == null)
                break label0;
            ViewBinder viewbinder = mViewBinder;
            String as[] = mFrom;
            int ai[] = mTo;
            int j = ai.length;
            int k = 0;
            View view1;
            do
            {
                if (k >= j)
                    break label0;
                view1 = view.findViewById(ai[k]);
                if (view1 != null)
                {
                    Object obj = map.get(as[k]);
                    String s;
                    if (obj == null)
                        s = "";
                    else
                        s = obj.toString();
                    if (s == null)
                        s = "";
                    boolean flag = false;
                    if (viewbinder != null)
                        flag = viewbinder.setViewValue(view1, obj, s);
                    if (!flag)
                        if (view1 instanceof Checkable)
                        {
                            if (obj instanceof Boolean)
                                ((Checkable)view1).setChecked(((Boolean)obj).booleanValue());
                            else
                            if (view1 instanceof TextView)
                            {
                                setViewText((TextView)view1, s);
                            } else
                            {
                                StringBuilder stringbuilder = (new StringBuilder()).append(view1.getClass().getName()).append(" should be bound to a Boolean, not a ");
                                Object obj1;
                                if (obj == null)
                                    obj1 = "<unknown type>";
                                else
                                    obj1 = obj.getClass();
                                throw new IllegalStateException(stringbuilder.append(obj1).toString());
                            }
                        } else
                        if (view1 instanceof TextView)
                        {
                            setViewText((TextView)view1, s);
                        } else
                        {
                            if (!(view1 instanceof ImageView))
                                break;
                            if (obj instanceof Integer)
                                setViewImage((ImageView)view1, ((Integer)obj).intValue());
                            else
                                setViewImage((ImageView)view1, s);
                        }
                }
                k++;
            } while (true);
            throw new IllegalStateException((new StringBuilder()).append(view1.getClass().getName()).append(" is not a ").append(" view that can be bounds by this SimpleAdapter").toString());
        }
    }

    private View createViewFromResource(int i, View view, ViewGroup viewgroup, int j)
    {
        View view1;
        if (view == null)
            view1 = mInflater.inflate(j, viewgroup, false);
        else
            view1 = view;
        bindView(i, view1);
        return view1;
    }

    public int getCount()
    {
        return mData.size();
    }

    public View getDropDownView(int i, View view, ViewGroup viewgroup)
    {
        return createViewFromResource(i, view, viewgroup, mDropDownResource);
    }

    public Filter getFilter()
    {
        if (mFilter == null)
            mFilter = new SimpleFilter();
        return mFilter;
    }

    public Object getItem(int i)
    {
        return mData.get(i);
    }

    public long getItemId(int i)
    {
        return (long)i;
    }

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        return createViewFromResource(i, view, viewgroup, mResource);
    }

    public ViewBinder getViewBinder()
    {
        return mViewBinder;
    }

    public void setDropDownViewResource(int i)
    {
        mDropDownResource = i;
    }

    public void setViewBinder(ViewBinder viewbinder)
    {
        mViewBinder = viewbinder;
    }

    public void setViewImage(ImageView imageview, int i)
    {
        imageview.setImageResource(i);
    }

    public void setViewImage(ImageView imageview, String s)
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



/*
    static ArrayList access$102(SimpleAdapter simpleadapter, ArrayList arraylist)
    {
        simpleadapter.mUnfilteredData = arraylist;
        return arraylist;
    }

*/



/*
    static List access$202(SimpleAdapter simpleadapter, List list)
    {
        simpleadapter.mData = list;
        return list;
    }

*/


}
