// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.ActivityManager;
import android.appwidget.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import java.lang.ref.WeakReference;
import java.util.List;

// Referenced classes of package com.android.settings:
//            AppWidgetLoader

public class KeyguardAppWidgetPickActivity extends Activity
    implements android.widget.AdapterView.OnItemClickListener, AppWidgetLoader.ItemConstructor
{
    protected static class AppWidgetAdapter extends BaseAdapter
    {

        private final LayoutInflater mInflater;
        private final List mItems;

        public void cancelAllWidgetPreviewLoaders()
        {
            for (int i = 0; i < mItems.size(); i++)
                ((Item)mItems.get(i)).cancelLoadingWidgetPreview();

        }

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
                view = mInflater.inflate(0x7f04003e, viewgroup, false);
            Item item = (Item)getItem(i);
            ((TextView)view.findViewById(0x7f0800b8)).setText(item.label);
            ImageView imageview = (ImageView)view.findViewById(0x7f080023);
            imageview.setImageDrawable(null);
            item.loadWidgetPreview(imageview);
            return view;
        }

        public AppWidgetAdapter(Context context, List list)
        {
            mInflater = (LayoutInflater)context.getSystemService("layout_inflater");
            mItems = list;
        }
    }

    public static class Item
        implements AppWidgetLoader.LabelledItem
    {

        protected static android.app.LauncherActivity.IconResizer sResizer;
        int appWidgetPreviewId;
        String className;
        Bundle extras;
        int iconId;
        CharSequence label;
        private Context mContext;
        private WidgetPreviewLoader mWidgetPreviewLoader;
        String packageName;

        void cancelLoadingWidgetPreview()
        {
            if (mWidgetPreviewLoader != null)
            {
                mWidgetPreviewLoader.cancel(false);
                mWidgetPreviewLoader = null;
            }
        }

        Intent getIntent()
        {
            Intent intent = new Intent();
            if (packageName != null && className != null)
            {
                intent.setClassName(packageName, className);
                if (extras != null)
                    intent.putExtras(extras);
                return intent;
            } else
            {
                intent.setAction("android.intent.action.CREATE_SHORTCUT");
                intent.putExtra("android.intent.extra.shortcut.NAME", label);
                return intent;
            }
        }

        public CharSequence getLabel()
        {
            return label;
        }

        void loadWidgetPreview(ImageView imageview)
        {
            mWidgetPreviewLoader = new WidgetPreviewLoader(mContext, imageview);
            mWidgetPreviewLoader.executeOnExecutor(AsyncTask.SERIAL_EXECUTOR, (Void[])null);
        }

        Item(Context context, CharSequence charsequence)
        {
            label = charsequence;
            mContext = context;
        }
    }

    class Item.WidgetPreviewLoader extends AsyncTask
    {

        private int mIconDpi;
        private PackageManager mPackageManager;
        private Resources mResources;
        private ImageView mView;
        CanvasCache sCachedAppWidgetPreviewCanvas;
        RectCache sCachedAppWidgetPreviewDestRect;
        PaintCache sCachedAppWidgetPreviewPaint;
        RectCache sCachedAppWidgetPreviewSrcRect;
        final Item this$0;

        private Bitmap getWidgetPreview(ComponentName componentname, int i, int j, int k, int l)
        {
            String s;
            int i1;
            Bitmap bitmap;
            int j1;
            int k1;
            int l1;
            int i2;
            Bitmap bitmap1;
            s = componentname.getPackageName();
            if (k < 0)
                k = 0x7fffffff;
            if (l < 0)
                l = 0x7fffffff;
            i1 = mResources.getDimensionPixelSize(0x7f0d0003);
            Drawable drawable = null;
            if (i != 0)
            {
                drawable = mPackageManager.getDrawable(s, i, null);
                if (drawable == null)
                    Log.w("KeyguardAppWidgetPickActivity", (new StringBuilder()).append("Can't load widget preview drawable 0x").append(Integer.toHexString(i)).append(" for provider: ").append(componentname).toString());
            }
            bitmap = null;
            boolean flag;
            float f;
            if (drawable != null)
                flag = true;
            else
                flag = false;
            if (!flag) goto _L2; else goto _L1
_L1:
            j1 = drawable.getIntrinsicWidth();
            k1 = drawable.getIntrinsicHeight();
_L4:
            f = 1.0F;
            if (j1 > k)
                f = (float)k / (float)j1;
            l1 = (int)(f * (float)j1);
            i2 = (int)(f * (float)k1);
            bitmap1 = Bitmap.createBitmap(l1, Math.min(i2, l), android.graphics.Bitmap.Config.ARGB_8888);
            if (flag)
            {
                renderDrawableToBitmap(drawable, bitmap1, 0, 0, l1, i2);
                return bitmap1;
            }
            break; /* Loop/switch isn't completed */
_L2:
            Drawable drawable1;
            j1 = i1;
            k1 = i1;
            android.graphics.Bitmap.Config config = android.graphics.Bitmap.Config.ARGB_8888;
            bitmap = Bitmap.createBitmap(j1, k1, config);
            drawable1 = null;
            if (j <= 0)
                break MISSING_BLOCK_LABEL_249;
            drawable1 = getFullResIcon(s, j);
            if (drawable1 != null)
                try
                {
                    renderDrawableToBitmap(drawable1, bitmap, 0, 0, i1, i1);
                }
                catch (android.content.res.Resources.NotFoundException notfoundexception) { }
            if (true) goto _L4; else goto _L3
_L3:
            Canvas canvas = (Canvas)sCachedAppWidgetPreviewCanvas.get();
            Rect rect = (Rect)sCachedAppWidgetPreviewSrcRect.get();
            Rect rect1 = (Rect)sCachedAppWidgetPreviewDestRect.get();
            canvas.setBitmap(bitmap1);
            rect.set(0, 0, bitmap.getWidth(), bitmap.getHeight());
            rect1.set(0, 0, l1, i2);
            Paint paint = (Paint)sCachedAppWidgetPreviewPaint.get();
            if (paint == null)
            {
                paint = new Paint();
                paint.setFilterBitmap(true);
                sCachedAppWidgetPreviewPaint.set(paint);
            }
            canvas.drawBitmap(bitmap, rect, rect1, paint);
            canvas.setBitmap(null);
            return bitmap1;
        }

        private void renderDrawableToBitmap(Drawable drawable, Bitmap bitmap, int i, int j, int k, int l)
        {
            renderDrawableToBitmap(drawable, bitmap, i, j, k, l, 1.0F);
        }

        private void renderDrawableToBitmap(Drawable drawable, Bitmap bitmap, int i, int j, int k, int l, float f)
        {
            if (bitmap != null)
            {
                Canvas canvas = new Canvas(bitmap);
                canvas.scale(f, f);
                Rect rect = drawable.copyBounds();
                drawable.setBounds(i, j, i + k, j + l);
                drawable.draw(canvas);
                drawable.setBounds(rect);
                canvas.setBitmap(null);
            }
        }

        public volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        public transient Void doInBackground(Void avoid[])
        {
            if (!isCancelled())
            {
                int i = mResources.getDimensionPixelSize(0x7f0d001d);
                int j = mResources.getDimensionPixelSize(0x7f0d001e);
                publishProgress(new Bitmap[] {
                    getWidgetPreview(new ComponentName(packageName, className), appWidgetPreviewId, iconId, i, j)
                });
            }
            return null;
        }

        public Drawable getFullResDefaultActivityIcon()
        {
            return getFullResIcon(Resources.getSystem(), 0x10d0000);
        }

        public Drawable getFullResIcon(Resources resources, int i)
        {
            Drawable drawable1 = resources.getDrawableForDensity(i, mIconDpi);
            Drawable drawable = drawable1;
_L1:
            android.content.res.Resources.NotFoundException notfoundexception;
            if (drawable != null)
                return drawable;
            else
                return getFullResDefaultActivityIcon();
            notfoundexception;
            drawable = null;
              goto _L1
        }

        public Drawable getFullResIcon(String s, int i)
        {
            Resources resources1 = mPackageManager.getResourcesForApplication(s);
            Resources resources = resources1;
_L1:
            android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
            if (resources != null && i != 0)
                return getFullResIcon(resources, i);
            else
                return getFullResDefaultActivityIcon();
            namenotfoundexception;
            resources = null;
              goto _L1
        }

        public transient void onProgressUpdate(Bitmap abitmap[])
        {
            if (!isCancelled())
            {
                Bitmap bitmap = abitmap[0];
                mView.setImageBitmap(bitmap);
            }
        }

        public volatile void onProgressUpdate(Object aobj[])
        {
            onProgressUpdate((Bitmap[])aobj);
        }

        public Item.WidgetPreviewLoader(Context context, ImageView imageview)
        {
            this$0 = Item.this;
            super();
            sCachedAppWidgetPreviewCanvas = new CanvasCache();
            sCachedAppWidgetPreviewSrcRect = new RectCache();
            sCachedAppWidgetPreviewDestRect = new RectCache();
            sCachedAppWidgetPreviewPaint = new PaintCache();
            mResources = context.getResources();
            mPackageManager = context.getPackageManager();
            mIconDpi = ((ActivityManager)context.getSystemService("activity")).getLauncherLargeIconDensity();
            mView = imageview;
        }
    }

    class Item.WidgetPreviewLoader.BitmapCache extends Item.WidgetPreviewLoader.WeakReferenceThreadLocal
    {

        final Item.WidgetPreviewLoader this$1;

        protected Bitmap initialValue()
        {
            return null;
        }

        protected volatile Object initialValue()
        {
            return initialValue();
        }

        Item.WidgetPreviewLoader.BitmapCache()
        {
            this$1 = Item.WidgetPreviewLoader.this;
            super();
        }
    }

    class Item.WidgetPreviewLoader.CanvasCache extends Item.WidgetPreviewLoader.WeakReferenceThreadLocal
    {

        final Item.WidgetPreviewLoader this$1;

        protected Canvas initialValue()
        {
            return new Canvas();
        }

        protected volatile Object initialValue()
        {
            return initialValue();
        }

        Item.WidgetPreviewLoader.CanvasCache()
        {
            this$1 = Item.WidgetPreviewLoader.this;
            super();
        }
    }

    class Item.WidgetPreviewLoader.PaintCache extends Item.WidgetPreviewLoader.WeakReferenceThreadLocal
    {

        final Item.WidgetPreviewLoader this$1;

        protected Paint initialValue()
        {
            return null;
        }

        protected volatile Object initialValue()
        {
            return initialValue();
        }

        Item.WidgetPreviewLoader.PaintCache()
        {
            this$1 = Item.WidgetPreviewLoader.this;
            super();
        }
    }

    class Item.WidgetPreviewLoader.RectCache extends Item.WidgetPreviewLoader.WeakReferenceThreadLocal
    {

        final Item.WidgetPreviewLoader this$1;

        protected Rect initialValue()
        {
            return new Rect();
        }

        protected volatile Object initialValue()
        {
            return initialValue();
        }

        Item.WidgetPreviewLoader.RectCache()
        {
            this$1 = Item.WidgetPreviewLoader.this;
            super();
        }
    }

    abstract class Item.WidgetPreviewLoader.WeakReferenceThreadLocal
    {

        private ThreadLocal mThreadLocal;
        final Item.WidgetPreviewLoader this$1;

        public Object get()
        {
            WeakReference weakreference = (WeakReference)mThreadLocal.get();
            if (weakreference == null)
            {
                Object obj1 = initialValue();
                mThreadLocal.set(new WeakReference(obj1));
                return obj1;
            }
            Object obj = weakreference.get();
            if (obj == null)
            {
                obj = initialValue();
                mThreadLocal.set(new WeakReference(obj));
            }
            return obj;
        }

        abstract Object initialValue();

        public void set(Object obj)
        {
            mThreadLocal.set(new WeakReference(obj));
        }

        public Item.WidgetPreviewLoader.WeakReferenceThreadLocal()
        {
            this$1 = Item.WidgetPreviewLoader.this;
            super();
            mThreadLocal = new ThreadLocal();
        }
    }


    private static final int REQUEST_CREATE_APPWIDGET = 127;
    private static final int REQUEST_PICK_APPWIDGET = 126;
    private static final String TAG = "KeyguardAppWidgetPickActivity";
    private boolean mAddingToKeyguard;
    private AppWidgetAdapter mAppWidgetAdapter;
    private int mAppWidgetId;
    private AppWidgetLoader mAppWidgetLoader;
    private AppWidgetManager mAppWidgetManager;
    private Bundle mExtraConfigureOptions;
    private GridView mGridView;
    private List mItems;
    private LockPatternUtils mLockPatternUtils;
    private Intent mResultData;

    public KeyguardAppWidgetPickActivity()
    {
        mAddingToKeyguard = true;
    }

    private void finishDelayedAndShowLockScreen(int i)
    {
        IWindowManager iwindowmanager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        Bundle bundle = null;
        if (i != 0)
        {
            bundle = new Bundle();
            bundle.putInt("showappwidget", i);
        }
        ViewGroup viewgroup;
        int j;
        try
        {
            iwindowmanager.lockNow(bundle);
        }
        catch (RemoteException remoteexception) { }
        viewgroup = (ViewGroup)findViewById(0x7f080062);
        viewgroup.setBackgroundColor(0xff000000);
        j = viewgroup.getChildCount();
        for (int k = 0; k < j; k++)
            viewgroup.getChildAt(k).setVisibility(4);

        mGridView.postDelayed(new Runnable() {

            final KeyguardAppWidgetPickActivity this$0;

            public void run()
            {
                finish();
            }

            
            {
                this$0 = KeyguardAppWidgetPickActivity.this;
                super();
            }
        }
, 500L);
    }

    public Item createItem(Context context, AppWidgetProviderInfo appwidgetproviderinfo, Bundle bundle)
    {
        Item item = new Item(context, appwidgetproviderinfo.label);
        item.appWidgetPreviewId = appwidgetproviderinfo.previewImage;
        item.iconId = appwidgetproviderinfo.icon;
        item.packageName = appwidgetproviderinfo.provider.getPackageName();
        item.className = appwidgetproviderinfo.provider.getClassName();
        item.extras = bundle;
        return item;
    }

    public volatile Object createItem(Context context, AppWidgetProviderInfo appwidgetproviderinfo, Bundle bundle)
    {
        return createItem(context, appwidgetproviderinfo, bundle);
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        int k;
label0:
        {
label1:
            {
                super.onActivityResult(i, j, intent);
                if (i == 126 || i == 127)
                {
                    if (intent == null)
                        k = 0;
                    else
                        k = intent.getIntExtra("appWidgetId", 0);
                    if (i != 126 || j != -1)
                        break label0;
                    AppWidgetProviderInfo appwidgetproviderinfo = AppWidgetManager.getInstance(this).getAppWidgetInfo(k);
                    if (appwidgetproviderinfo.configure == null)
                        break label1;
                    Intent intent1 = new Intent("android.appwidget.action.APPWIDGET_CONFIGURE");
                    intent1.setComponent(appwidgetproviderinfo.configure);
                    intent1.addFlags(0x800000);
                    intent1.putExtra("appWidgetId", k);
                    startActivityForResultSafely(intent1, 127);
                }
                return;
            }
            onActivityResult(127, -1, intent);
            return;
        }
        if (i == 127 && j == -1)
        {
            mLockPatternUtils.addAppWidget(k, 0);
            finishDelayedAndShowLockScreen(k);
            return;
        }
        if (mAddingToKeyguard && mAppWidgetId != 0)
            AppWidgetHost.deleteAppWidgetIdForSystem(mAppWidgetId);
        finishDelayedAndShowLockScreen(0);
    }

    protected void onCreate(Bundle bundle)
    {
        setContentView(0x7f04003f);
        super.onCreate(bundle);
        setResultData(0, null);
        Intent intent = getIntent();
        if (intent.hasExtra("appWidgetId"))
            mAppWidgetId = intent.getIntExtra("appWidgetId", 0);
        else
            finish();
        mExtraConfigureOptions = intent.getBundleExtra("appWidgetOptions");
        if (!"tablet".equals(SystemProperties.get("ro.build.characteristics")))
            setRequestedOrientation(7);
        mGridView = (GridView)findViewById(0x7f0800b9);
        DisplayMetrics displaymetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(displaymetrics);
        int i = getResources().getDimensionPixelSize(0x7f0d001f);
        if (i < displaymetrics.widthPixels)
            mGridView.getLayoutParams().width = i;
        mAppWidgetManager = AppWidgetManager.getInstance(this);
        mAppWidgetLoader = new AppWidgetLoader(this, mAppWidgetManager, this);
        mItems = mAppWidgetLoader.getItems(getIntent());
        mAppWidgetAdapter = new AppWidgetAdapter(this, mItems);
        mGridView.setAdapter(mAppWidgetAdapter);
        mGridView.setOnItemClickListener(this);
        mLockPatternUtils = new LockPatternUtils(this);
    }

    protected void onDestroy()
    {
        if (mAppWidgetAdapter != null)
            mAppWidgetAdapter.cancelAllWidgetPreviewLoaders();
        super.onDestroy();
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        Item item;
        Intent intent;
        item = (Item)mItems.get(i);
        intent = item.getIntent();
        if (item.extras == null) goto _L2; else goto _L1
_L1:
        byte byte0;
        byte0 = -1;
        setResultData(byte0, intent);
_L3:
        IllegalArgumentException illegalargumentexception;
        if (mAddingToKeyguard)
        {
            onActivityResult(126, byte0, mResultData);
            return;
        } else
        {
            finish();
            return;
        }
_L2:
        if (mAddingToKeyguard && mAppWidgetId == 0)
            mAppWidgetId = AppWidgetHost.allocateAppWidgetIdForSystem(0x4b455947);
        mAppWidgetManager.bindAppWidgetId(mAppWidgetId, intent.getComponent(), mExtraConfigureOptions);
        byte0 = -1;
_L4:
        setResultData(byte0, null);
          goto _L3
        illegalargumentexception;
        byte0 = 0;
          goto _L4
    }

    void setResultData(int i, Intent intent)
    {
        Intent intent1;
        if (intent != null)
            intent1 = intent;
        else
            intent1 = new Intent();
        intent1.putExtra("appWidgetId", mAppWidgetId);
        mResultData = intent1;
        setResult(i, intent1);
    }

    void startActivityForResultSafely(Intent intent, int i)
    {
        try
        {
            startActivityForResult(intent, i);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Toast.makeText(this, 0x7f0b0628, 0).show();
            return;
        }
        catch (SecurityException securityexception)
        {
            Toast.makeText(this, 0x7f0b0628, 0).show();
            Log.e("KeyguardAppWidgetPickActivity", (new StringBuilder()).append("Settings does not have the permission to launch ").append(intent).toString(), securityexception);
            return;
        }
    }
}
