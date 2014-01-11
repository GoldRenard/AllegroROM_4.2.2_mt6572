// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Intent;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.*;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.util.*;

// Referenced classes of package android.app:
//            ListActivity

public abstract class LauncherActivity extends ListActivity
{
    private class ActivityAdapter extends BaseAdapter
        implements Filterable
    {

        private final Object lock = new Object();
        protected List mActivitiesList;
        private Filter mFilter;
        protected final IconResizer mIconResizer;
        protected final LayoutInflater mInflater;
        private ArrayList mOriginalValues;
        private final boolean mShowIcons;
        final LauncherActivity this$0;

        private void bindView(View view, ListItem listitem)
        {
            TextView textview = (TextView)view;
            textview.setText(listitem.label);
            if (mShowIcons)
            {
                if (listitem.icon == null)
                    listitem.icon = mIconResizer.createIconThumbnail(listitem.resolveInfo.loadIcon(getPackageManager()));
                textview.setCompoundDrawablesWithIntrinsicBounds(listitem.icon, null, null, null);
            }
        }

        public int getCount()
        {
            if (mActivitiesList != null)
                return mActivitiesList.size();
            else
                return 0;
        }

        public Filter getFilter()
        {
            if (mFilter == null)
                mFilter = new ArrayFilter();
            return mFilter;
        }

        public Object getItem(int i)
        {
            return Integer.valueOf(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            View view1;
            if (view == null)
                view1 = mInflater.inflate(0x1090022, viewgroup, false);
            else
                view1 = view;
            bindView(view1, (ListItem)mActivitiesList.get(i));
            return view1;
        }

        public Intent intentForPosition(int i)
        {
            Intent intent;
            if (mActivitiesList == null)
            {
                intent = null;
            } else
            {
                intent = new Intent(mIntent);
                ListItem listitem = (ListItem)mActivitiesList.get(i);
                intent.setClassName(listitem.packageName, listitem.className);
                if (listitem.extras != null)
                {
                    intent.putExtras(listitem.extras);
                    return intent;
                }
            }
            return intent;
        }

        public ListItem itemForPosition(int i)
        {
            if (mActivitiesList == null)
                return null;
            else
                return (ListItem)mActivitiesList.get(i);
        }



/*
        static ArrayList access$102(ActivityAdapter activityadapter, ArrayList arraylist)
        {
            activityadapter.mOriginalValues = arraylist;
            return arraylist;
        }

*/


        public ActivityAdapter(IconResizer iconresizer)
        {
            this$0 = LauncherActivity.this;
            super();
            mIconResizer = iconresizer;
            mInflater = (LayoutInflater)getSystemService("layout_inflater");
            mShowIcons = onEvaluateShowIcons();
            mActivitiesList = makeListItems();
        }
    }

    private class ActivityAdapter.ArrayFilter extends Filter
    {

        final ActivityAdapter this$1;

        protected android.widget.Filter.FilterResults performFiltering(CharSequence charsequence)
        {
            android.widget.Filter.FilterResults filterresults;
            filterresults = new android.widget.Filter.FilterResults();
            if (mOriginalValues == null)
                synchronized (lock)
                {
                    mOriginalValues = new ArrayList(mActivitiesList);
                }
            if (charsequence == null || charsequence.length() == 0)
            {
                synchronized (lock)
                {
                    ArrayList arraylist = new ArrayList(mOriginalValues);
                    filterresults.values = arraylist;
                    filterresults.count = arraylist.size();
                }
                return filterresults;
            }
            break MISSING_BLOCK_LABEL_128;
            exception1;
            obj1;
            JVM INSTR monitorexit ;
            throw exception1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
            String s = charsequence.toString().toLowerCase();
            ArrayList arraylist1 = mOriginalValues;
            int i = arraylist1.size();
            ArrayList arraylist2 = new ArrayList(i);
            int j = 0;
label0:
            do
            {
                if (j < i)
                {
                    ListItem listitem = (ListItem)arraylist1.get(j);
                    String as[] = listitem.label.toString().toLowerCase().split(" ");
                    int k = as.length;
                    int l = 0;
                    do
                    {
label1:
                        {
                            if (l < k)
                            {
                                if (!as[l].startsWith(s))
                                    break label1;
                                arraylist2.add(listitem);
                            }
                            j++;
                            continue label0;
                        }
                        l++;
                    } while (true);
                }
                filterresults.values = arraylist2;
                filterresults.count = arraylist2.size();
                return filterresults;
            } while (true);
        }

        protected void publishResults(CharSequence charsequence, android.widget.Filter.FilterResults filterresults)
        {
            mActivitiesList = (List)filterresults.values;
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

        private ActivityAdapter.ArrayFilter()
        {
            this$1 = ActivityAdapter.this;
            super();
        }

    }

    public class IconResizer
    {

        private Canvas mCanvas;
        private int mIconHeight;
        private int mIconWidth;
        private final Rect mOldBounds = new Rect();
        final LauncherActivity this$0;

        public Drawable createIconThumbnail(Drawable drawable)
        {
            int i = mIconWidth;
            int j = mIconHeight;
            int k = drawable.getIntrinsicWidth();
            int l = drawable.getIntrinsicHeight();
            if (drawable instanceof PaintDrawable)
            {
                PaintDrawable paintdrawable = (PaintDrawable)drawable;
                paintdrawable.setIntrinsicWidth(i);
                paintdrawable.setIntrinsicHeight(j);
            }
            if (i > 0 && j > 0)
                if (i >= k && j >= l)
                {
                    if (k < i && l < j)
                    {
                        android.graphics.Bitmap.Config config1 = android.graphics.Bitmap.Config.ARGB_8888;
                        Bitmap bitmap1 = Bitmap.createBitmap(mIconWidth, mIconHeight, config1);
                        Canvas canvas1 = mCanvas;
                        canvas1.setBitmap(bitmap1);
                        mOldBounds.set(drawable.getBounds());
                        int k1 = (i - k) / 2;
                        int l1 = (j - l) / 2;
                        drawable.setBounds(k1, l1, k1 + k, l1 + l);
                        drawable.draw(canvas1);
                        drawable.setBounds(mOldBounds);
                        BitmapDrawable bitmapdrawable = new BitmapDrawable(getResources(), bitmap1);
                        canvas1.setBitmap(null);
                        return bitmapdrawable;
                    }
                } else
                {
                    float f = (float)k / (float)l;
                    if (k > l)
                        j = (int)((float)i / f);
                    else
                    if (l > k)
                        i = (int)(f * (float)j);
                    android.graphics.Bitmap.Config config;
                    if (drawable.getOpacity() != -1)
                        config = android.graphics.Bitmap.Config.ARGB_8888;
                    else
                        config = android.graphics.Bitmap.Config.RGB_565;
                    Bitmap bitmap = Bitmap.createBitmap(mIconWidth, mIconHeight, config);
                    Canvas canvas = mCanvas;
                    canvas.setBitmap(bitmap);
                    mOldBounds.set(drawable.getBounds());
                    int i1 = (mIconWidth - i) / 2;
                    int j1 = (mIconHeight - j) / 2;
                    drawable.setBounds(i1, j1, i1 + i, j1 + j);
                    drawable.draw(canvas);
                    drawable.setBounds(mOldBounds);
                    drawable = new BitmapDrawable(getResources(), bitmap);
                    canvas.setBitmap(null);
                }
            return drawable;
        }

        public IconResizer()
        {
            this$0 = LauncherActivity.this;
            super();
            mIconWidth = -1;
            mIconHeight = -1;
            mCanvas = new Canvas();
            mCanvas.setDrawFilter(new PaintFlagsDrawFilter(4, 2));
            int i = (int)getResources().getDimension(0x1050000);
            mIconHeight = i;
            mIconWidth = i;
        }
    }

    public static class ListItem
    {

        public String className;
        public Bundle extras;
        public Drawable icon;
        public CharSequence label;
        public String packageName;
        public ResolveInfo resolveInfo;


        ListItem(PackageManager packagemanager, ResolveInfo resolveinfo, IconResizer iconresizer)
        {
            resolveInfo = resolveinfo;
            label = resolveinfo.loadLabel(packagemanager);
            Object obj = resolveinfo.activityInfo;
            if (obj == null)
                obj = resolveinfo.serviceInfo;
            if (label == null && obj != null)
                label = ((ComponentInfo) (resolveinfo.activityInfo)).name;
            if (iconresizer != null)
                icon = iconresizer.createIconThumbnail(resolveinfo.loadIcon(packagemanager));
            packageName = ((ComponentInfo) (obj)).applicationInfo.packageName;
            className = ((ComponentInfo) (obj)).name;
        }
    }


    IconResizer mIconResizer;
    Intent mIntent;
    PackageManager mPackageManager;


    private void updateAlertTitle()
    {
        TextView textview = (TextView)findViewById(0x102025b);
        if (textview != null)
            textview.setText(getTitle());
    }

    private void updateButtonText()
    {
        Button button = (Button)findViewById(0x1020019);
        if (button != null)
            button.setOnClickListener(new android.view.View.OnClickListener() {

                final LauncherActivity this$0;

                public void onClick(View view)
                {
                    finish();
                }

            
            {
                this$0 = LauncherActivity.this;
                super();
            }
            }
);
    }

    protected Intent getTargetIntent()
    {
        return new Intent();
    }

    protected Intent intentForPosition(int i)
    {
        return ((ActivityAdapter)super.mAdapter).intentForPosition(i);
    }

    protected ListItem itemForPosition(int i)
    {
        return ((ActivityAdapter)super.mAdapter).itemForPosition(i);
    }

    public List makeListItems()
    {
        List list = onQueryPackageManager(mIntent);
        onSortResultList(list);
        ArrayList arraylist = new ArrayList(list.size());
        int i = list.size();
        for (int j = 0; j < i; j++)
        {
            ResolveInfo resolveinfo = (ResolveInfo)list.get(j);
            arraylist.add(new ListItem(mPackageManager, resolveinfo, null));
        }

        return arraylist;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mPackageManager = getPackageManager();
        requestWindowFeature(5);
        setProgressBarIndeterminateVisibility(true);
        onSetContentView();
        mIconResizer = new IconResizer();
        mIntent = new Intent(getTargetIntent());
        mIntent.setComponent(null);
        super.mAdapter = new ActivityAdapter(mIconResizer);
        setListAdapter(super.mAdapter);
        getListView().setTextFilterEnabled(true);
        updateAlertTitle();
        updateButtonText();
        setProgressBarIndeterminateVisibility(false);
    }

    protected boolean onEvaluateShowIcons()
    {
        return true;
    }

    protected void onListItemClick(ListView listview, View view, int i, long l)
    {
        startActivity(intentForPosition(i));
    }

    protected List onQueryPackageManager(Intent intent)
    {
        return mPackageManager.queryIntentActivities(intent, 0);
    }

    protected void onSetContentView()
    {
        setContentView(0x1090021);
    }

    protected void onSortResultList(List list)
    {
        Collections.sort(list, new android.content.pm.ResolveInfo.DisplayNameComparator(mPackageManager));
    }

    public void setTitle(int i)
    {
        super.setTitle(i);
        updateAlertTitle();
    }

    public void setTitle(CharSequence charsequence)
    {
        super.setTitle(charsequence);
        updateAlertTitle();
    }
}
