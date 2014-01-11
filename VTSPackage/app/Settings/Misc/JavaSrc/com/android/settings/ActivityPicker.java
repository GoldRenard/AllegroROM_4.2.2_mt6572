// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.*;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.*;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.android.internal.app.AlertActivity;
import java.util.*;

public class ActivityPicker extends AlertActivity
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnCancelListener
{
    private static class EmptyDrawable extends Drawable
    {

        private final int mHeight;
        private final int mWidth;

        public void draw(Canvas canvas)
        {
        }

        public int getIntrinsicHeight()
        {
            return mHeight;
        }

        public int getIntrinsicWidth()
        {
            return mWidth;
        }

        public int getMinimumHeight()
        {
            return mHeight;
        }

        public int getMinimumWidth()
        {
            return mWidth;
        }

        public int getOpacity()
        {
            return -3;
        }

        public void setAlpha(int i)
        {
        }

        public void setColorFilter(ColorFilter colorfilter)
        {
        }

        EmptyDrawable(int i, int j)
        {
            mWidth = i;
            mHeight = j;
        }
    }

    private static class IconResizer
    {

        private final Canvas mCanvas = new Canvas();
        private final int mIconHeight;
        private final int mIconWidth;
        private final DisplayMetrics mMetrics;
        private final Rect mOldBounds = new Rect();

        public Drawable createIconThumbnail(Drawable drawable)
        {
            int i;
            int j;
            i = mIconWidth;
            j = mIconHeight;
            if (drawable == null)
            {
                EmptyDrawable emptydrawable = new EmptyDrawable(i, j);
                return emptydrawable;
            }
            if (!(drawable instanceof PaintDrawable)) goto _L2; else goto _L1
_L1:
            PaintDrawable paintdrawable = (PaintDrawable)drawable;
            paintdrawable.setIntrinsicWidth(i);
            paintdrawable.setIntrinsicHeight(j);
_L12:
            int k;
            int l;
            k = drawable.getIntrinsicWidth();
            l = drawable.getIntrinsicHeight();
            if (k <= 0 || l <= 0) goto _L4; else goto _L3
_L3:
            if (i >= k && j >= l) goto _L6; else goto _L5
_L5:
            float f = (float)k / (float)l;
            if (k <= l) goto _L8; else goto _L7
_L7:
            j = (int)((float)i / f);
_L13:
            if (drawable.getOpacity() == -1) goto _L10; else goto _L9
_L9:
            android.graphics.Bitmap.Config config = android.graphics.Bitmap.Config.ARGB_8888;
_L14:
            Bitmap bitmap;
            Canvas canvas;
            int i1;
            int j1;
            bitmap = Bitmap.createBitmap(mIconWidth, mIconHeight, config);
            canvas = mCanvas;
            canvas.setBitmap(bitmap);
            mOldBounds.set(drawable.getBounds());
            i1 = (mIconWidth - i) / 2;
            j1 = (mIconHeight - j) / 2;
            int k1;
            int l1;
            k1 = i1 + i;
            l1 = j1 + j;
            BitmapDrawable bitmapdrawable1;
            drawable.setBounds(i1, j1, k1, l1);
            drawable.draw(canvas);
            Rect rect = mOldBounds;
            drawable.setBounds(rect);
            bitmapdrawable1 = new BitmapDrawable(bitmap);
            ((BitmapDrawable)bitmapdrawable1).setTargetDensity(mMetrics);
            canvas.setBitmap(null);
            drawable = bitmapdrawable1;
_L4:
            return drawable;
_L2:
            if (!(drawable instanceof BitmapDrawable)) goto _L12; else goto _L11
_L11:
            BitmapDrawable bitmapdrawable = (BitmapDrawable)drawable;
            if (bitmapdrawable.getBitmap().getDensity() == 0)
                bitmapdrawable.setTargetDensity(mMetrics);
              goto _L12
            Throwable throwable;
            throwable;
_L16:
            drawable = new EmptyDrawable(i, j);
              goto _L4
_L8:
            if (l > k)
                i = (int)(f * (float)j);
              goto _L13
_L10:
            config = android.graphics.Bitmap.Config.RGB_565;
              goto _L14
_L6:
            if (k >= i || l >= j) goto _L4; else goto _L15
_L15:
            Bitmap bitmap1;
            Canvas canvas1;
            int i2;
            int j2;
            android.graphics.Bitmap.Config config1 = android.graphics.Bitmap.Config.ARGB_8888;
            bitmap1 = Bitmap.createBitmap(mIconWidth, mIconHeight, config1);
            canvas1 = mCanvas;
            canvas1.setBitmap(bitmap1);
            mOldBounds.set(drawable.getBounds());
            i2 = (i - k) / 2;
            j2 = (j - l) / 2;
            int k2;
            int l2;
            k2 = i2 + k;
            l2 = j2 + l;
            drawable.setBounds(i2, j2, k2, l2);
            drawable.draw(canvas1);
            Rect rect1 = mOldBounds;
            drawable.setBounds(rect1);
            bitmapdrawable1 = new BitmapDrawable(bitmap1);
            ((BitmapDrawable)bitmapdrawable1).setTargetDensity(mMetrics);
            canvas1.setBitmap(null);
            drawable = bitmapdrawable1;
              goto _L4
            Throwable throwable1;
            throwable1;
            bitmapdrawable1;
              goto _L16
        }

        public IconResizer(int i, int j, DisplayMetrics displaymetrics)
        {
            mCanvas.setDrawFilter(new PaintFlagsDrawFilter(4, 2));
            mMetrics = displaymetrics;
            mIconWidth = i;
            mIconHeight = j;
        }
    }

    protected static class PickAdapter extends BaseAdapter
    {

        private final LayoutInflater mInflater;
        private final List mItems;

        public int getCount()
        {
            return mItems.size();
        }

        public Object getItem(int i)
        {
            return mItems.get(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            if (view == null)
                view = mInflater.inflate(0x7f040056, viewgroup, false);
            Item item = (Item)getItem(i);
            TextView textview = (TextView)view;
            textview.setText(item.label);
            textview.setCompoundDrawablesWithIntrinsicBounds(item.icon, null, null, null);
            return view;
        }

        public PickAdapter(Context context, List list)
        {
            mInflater = (LayoutInflater)context.getSystemService("layout_inflater");
            mItems = list;
        }
    }

    public static class PickAdapter.Item
        implements AppWidgetLoader.LabelledItem
    {

        protected static IconResizer sResizer;
        String className;
        Bundle extras;
        Drawable icon;
        CharSequence label;
        String packageName;

        Intent getIntent(Intent intent)
        {
            Intent intent1 = new Intent(intent);
            if (packageName != null && className != null)
            {
                intent1.setClassName(packageName, className);
                if (extras != null)
                    intent1.putExtras(extras);
                return intent1;
            } else
            {
                intent1.setAction("android.intent.action.CREATE_SHORTCUT");
                intent1.putExtra("android.intent.extra.shortcut.NAME", label);
                return intent1;
            }
        }

        public CharSequence getLabel()
        {
            return label;
        }

        protected IconResizer getResizer(Context context)
        {
            if (sResizer == null)
            {
                Resources resources = context.getResources();
                int i = (int)resources.getDimension(0x1050000);
                sResizer = new IconResizer(i, i, resources.getDisplayMetrics());
            }
            return sResizer;
        }

        PickAdapter.Item(Context context, PackageManager packagemanager, ResolveInfo resolveinfo)
        {
            label = resolveinfo.loadLabel(packagemanager);
            if (label == null && resolveinfo.activityInfo != null)
                label = resolveinfo.activityInfo.name;
            icon = getResizer(context).createIconThumbnail(resolveinfo.loadIcon(packagemanager));
            packageName = ((PackageItemInfo) (resolveinfo.activityInfo.applicationInfo)).packageName;
            className = resolveinfo.activityInfo.name;
        }

        PickAdapter.Item(Context context, CharSequence charsequence, Drawable drawable)
        {
            label = charsequence;
            icon = getResizer(context).createIconThumbnail(drawable);
        }
    }


    private PickAdapter mAdapter;
    private Intent mBaseIntent;


    protected Intent getIntentForPosition(int i)
    {
        return ((PickAdapter.Item)mAdapter.getItem(i)).getIntent(mBaseIntent);
    }

    protected List getItems()
    {
        PackageManager packagemanager;
        ArrayList arraylist;
        ArrayList arraylist1;
        ArrayList arraylist2;
        packagemanager = getPackageManager();
        arraylist = new ArrayList();
        Intent intent = getIntent();
        arraylist1 = intent.getStringArrayListExtra("android.intent.extra.shortcut.NAME");
        arraylist2 = intent.getParcelableArrayListExtra("android.intent.extra.shortcut.ICON_RESOURCE");
        if (arraylist1 == null || arraylist2 == null || arraylist1.size() != arraylist2.size()) goto _L2; else goto _L1
_L1:
        int i = 0;
_L3:
        String s;
        if (i >= arraylist1.size())
            break; /* Loop/switch isn't completed */
        s = (String)arraylist1.get(i);
        Drawable drawable1;
        android.content.Intent.ShortcutIconResource shortcuticonresource = (android.content.Intent.ShortcutIconResource)arraylist2.get(i);
        Resources resources = packagemanager.getResourcesForApplication(shortcuticonresource.packageName);
        drawable1 = resources.getDrawable(resources.getIdentifier(shortcuticonresource.resourceName, null, null));
        Drawable drawable = drawable1;
_L4:
        arraylist.add(new PickAdapter.Item(this, s, drawable));
        i++;
        if (true) goto _L3; else goto _L2
_L2:
        if (mBaseIntent != null)
            putIntentItems(mBaseIntent, arraylist);
        return arraylist;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        drawable = null;
          goto _L4
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        setResult(0);
        finish();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        setResult(-1, getIntentForPosition(i));
        finish();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        android.os.Parcelable parcelable = intent.getParcelableExtra("android.intent.extra.INTENT");
        if (parcelable instanceof Intent)
        {
            mBaseIntent = (Intent)parcelable;
        } else
        {
            mBaseIntent = new Intent("android.intent.action.MAIN", null);
            mBaseIntent.addCategory("android.intent.category.DEFAULT");
        }
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mOnClickListener = this;
        alertparams.mOnCancelListener = this;
        if (intent.hasExtra("android.intent.extra.TITLE"))
            alertparams.mTitle = intent.getStringExtra("android.intent.extra.TITLE");
        else
            alertparams.mTitle = getTitle();
        mAdapter = new PickAdapter(this, getItems());
        alertparams.mAdapter = mAdapter;
        setupAlert();
    }

    protected void putIntentItems(Intent intent, List list)
    {
        PackageManager packagemanager = getPackageManager();
        List list1 = packagemanager.queryIntentActivities(intent, 0);
        Collections.sort(list1, new android.content.pm.ResolveInfo.DisplayNameComparator(packagemanager));
        int i = list1.size();
        for (int j = 0; j < i; j++)
            list.add(new PickAdapter.Item(this, packagemanager, (ResolveInfo)list1.get(j)));

    }
}
