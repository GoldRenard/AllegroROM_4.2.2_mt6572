// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.thememanager;

import android.app.*;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.os.*;
import android.view.*;
import android.widget.*;
import com.android.settings.DialogCreatable;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.thememanager:
//            Themes, ThemeData

public class ThemeManager extends SettingsPreferenceFragment
    implements android.widget.AdapterView.OnItemClickListener, DialogCreatable
{
    private class SetThemeTask extends AsyncTask
    {

        private Context mContext;
        final ThemeManager this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Integer[])aobj);
        }

        protected transient Void doInBackground(Integer ainteger[])
        {
            int i;
            IActivityManager iactivitymanager;
            i = ainteger[0].intValue();
            iactivitymanager = ActivityManagerNative.getDefault();
            synchronized (mLock)
            {
                if (mThemeDatas == null)
                    Xlog.e("ThemeManager", "doInBackground error occured, mThemeDatas becomes null.");
                Configuration configuration = iactivitymanager.getConfiguration();
                configuration.skin = ((ThemeData)mThemeDatas.get(i)).getThemePath().toString();
                Xlog.d("ThemeManager", (new StringBuilder()).append("doInBackground() am.updateConfiguration() config.skin = ").append(configuration.skin).toString());
                iactivitymanager.updateConfiguration(configuration);
            }
            break MISSING_BLOCK_LABEL_140;
            exception;
            obj;
            JVM INSTR monitorexit ;
            try
            {
                throw exception;
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("ThemeManager", "Update configuration for theme changed failed.");
                remoteexception.printStackTrace();
            }
            return null;
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Void)obj);
        }

        protected void onPostExecute(Void void1)
        {
            mStatusBarManager.disable(0);
        }

        protected void onPreExecute()
        {
            showSetThemeDialog();
        }

        public SetThemeTask(Context context)
        {
            this$0 = ThemeManager.this;
            super();
            mContext = context;
        }
    }

    class ThemeAdapter extends BaseAdapter
    {

        private Context mContext;
        private ArrayList mThemeDatas;
        final ThemeManager this$0;

        public int getCount()
        {
            return mThemeDatas.size();
        }

        public Object getItem(int i)
        {
            return mThemeDatas.get(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            ViewHolder viewholder;
            if (view == null)
            {
                view = mInflater.inflate(0x7f04008e, null);
                viewholder = new ViewHolder();
                viewholder.mText = (TextView)view.findViewById(0x7f08017e);
                viewholder.mIcon = (ImageView)view.findViewById(0x7f08017d);
                view.setTag(viewholder);
            } else
            {
                viewholder = (ViewHolder)view.getTag();
            }
            ThemeData themedata = (ThemeData)mThemeDatas.get(i);
            viewholder.mText.setText(themedata.getThemeName());
            if ("android".equals(themedata.getPackageName()))
            {
                android.graphics.Bitmap bitmap1 = BitmapFactory.decodeStream(getResources().openRawResource(0x7f02005f));
                viewholder.mIcon.setImageBitmap(bitmap1);
                return view;
            } else
            {
                android.graphics.Bitmap bitmap = getResources().getThemePreview(themedata.getThemePath());
                viewholder.mIcon.setImageBitmap(bitmap);
                return view;
            }
        }

        public ThemeAdapter(Context context, ArrayList arraylist)
        {
            this$0 = ThemeManager.this;
            super();
            mContext = context;
            mThemeDatas = arraylist;
        }
    }

    static class ViewHolder
    {

        ImageView mIcon;
        TextView mText;

    }


    static final String DEFAULT_THEME_PACKAGE_NAME = "android";
    private static final String TAG = "ThemeManager";
    private int mCurrentPosition;
    private LayoutInflater mInflater;
    private Object mLock;
    private ProgressDialog mProgressDialog;
    private StatusBarManager mStatusBarManager;
    private int mThemeCount;
    private ArrayList mThemeDatas;
    private ListView mThemeList;

    public ThemeManager()
    {
        mThemeDatas = new ArrayList();
        mLock = new Object();
    }

    private void finishSetThemeDialog()
    {
        Xlog.d("ThemeManager", "finishSetThemeDialog()");
        if (mProgressDialog != null)
        {
            mProgressDialog.dismiss();
            mProgressDialog = null;
        }
    }

    private static String getPackageNameLastPart(String s)
    {
        return String.valueOf(s.subSequence(1 + s.lastIndexOf('.'), s.length()));
    }

    static String getThemeName(Context context, String s, int i)
    {
        PackageManager packagemanager = context.getPackageManager();
        String s1 = null;
        try
        {
            s1 = String.valueOf(packagemanager.getResourcesForApplication(s).getText(i));
            Xlog.d("ThemeManager", (new StringBuilder()).append("get theme name ").append(s1).append(" from id ").append(Integer.toHexString(i)).toString());
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Xlog.d("TAG", (new StringBuilder()).append("PackageManager cann't find resources for ").append(s).toString());
            return s1;
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            Xlog.d("TAG", "Cann't find string in theme package, use default name.");
            Resources resources = context.getResources();
            Object aobj[] = new Object[1];
            aobj[0] = getPackageNameLastPart(s);
            return resources.getString(0x7f0b00c4, aobj);
        }
        return s1;
    }

    public static String getThemeSummary(Context context)
    {
        Cursor cursor;
        String s1;
        String s = context.getResources().getConfiguration().skin;
        cursor = context.getContentResolver().query(Themes.CONTENT_URI, new String[] {
            "package_name", "theme_name_id"
        }, "theme_path=?", new String[] {
            s
        }, null);
        s1 = null;
        if (cursor == null) goto _L2; else goto _L1
_L1:
        boolean flag = cursor.moveToFirst();
        s1 = null;
        if (!flag) goto _L4; else goto _L3
_L3:
        String s2;
        int i;
        s2 = cursor.getString(0);
        i = cursor.getInt(1);
        if (!s2.equals("android")) goto _L6; else goto _L5
_L5:
        String s4 = context.getString(0x7f0b00c3);
        s1 = s4;
_L4:
        cursor.close();
_L2:
        return s1;
_L6:
        String s3 = getThemeName(context, s2, i);
        s1 = s3;
          goto _L4
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    private void loadThemesFromDatabase()
    {
        Configuration configuration;
        Cursor cursor;
        if (mThemeDatas != null)
            mThemeDatas.clear();
        configuration = getResources().getConfiguration();
        cursor = getActivity().getContentResolver().query(Themes.CONTENT_URI, null, null, null, null);
        if (cursor == null)
        {
            Xlog.w("ThemeManager", "There is no theme in database.");
            return;
        }
        cursor.moveToFirst();
        int i = 0;
_L10:
        String s;
        String s1;
        int j;
        if (cursor.isAfterLast())
            break MISSING_BLOCK_LABEL_358;
        s = cursor.getString(cursor.getColumnIndex("package_name"));
        s1 = cursor.getString(cursor.getColumnIndex("theme_path"));
        j = cursor.getInt(cursor.getColumnIndex("theme_name_id"));
        if (configuration == null)
            break MISSING_BLOCK_LABEL_142;
        if (configuration.skin.equals(s1))
            mCurrentPosition = i;
        if (!s.equals("android")) goto _L2; else goto _L1
_L1:
        String s2 = getResources().getString(0x7f0b00c3);
_L5:
        if (s2 == null) goto _L4; else goto _L3
_L3:
        ThemeData themedata;
        ArrayList arraylist;
        themedata = new ThemeData();
        themedata.setPackageName(s);
        themedata.setThemePath(s1);
        themedata.setThemeName(s2);
        arraylist = mThemeDatas;
        int k = i + 1;
        arraylist.add(i, themedata);
        Xlog.d("ThemeManager", (new StringBuilder()).append("position = ").append(k).append(" ThemePath = ").append(s1).append(" ThemeNameId = ").append(j).toString());
_L6:
        cursor.moveToNext();
        i = k;
        continue; /* Loop/switch isn't completed */
_L2:
        s2 = getThemeName(getActivity(), s, j);
          goto _L5
_L4:
        getActivity().getContentResolver().delete(Themes.CONTENT_URI, "package_name = ?", new String[] {
            s
        });
        Xlog.d("ThemeManager", (new StringBuilder()).append("delete record whose package name is = ").append(s).toString());
        k = i;
          goto _L6
        mThemeCount = i;
        cursor.close();
        i;
        return;
        Exception exception;
        exception;
_L8:
        cursor.close();
        throw exception;
        exception;
        i;
        if (true) goto _L8; else goto _L7
_L7:
        if (true) goto _L10; else goto _L9
_L9:
    }

    private void showSetThemeDialog()
    {
        Xlog.d("ThemeManager", "showSetThemeDialog()");
        if (mProgressDialog == null)
        {
            mProgressDialog = ProgressDialog.show(getActivity(), null, getString(0x7f0b00c5), true, false);
            return;
        } else
        {
            Xlog.d("ThemeManager", "showSetThemeDialog mProgressDialog != null.");
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.d("ThemeManager", "onCreate");
        mInflater = (LayoutInflater)getActivity().getSystemService("layout_inflater");
        mStatusBarManager = (StatusBarManager)getSystemService("statusbar");
        loadThemesFromDatabase();
    }

    public void onDestroy()
    {
        Xlog.d("ThemeManager", "onDestroy");
        finishSetThemeDialog();
        super.onDestroy();
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        mStatusBarManager.disable(0x10000);
        if (mCurrentPosition != i)
        {
            SetThemeTask setthemetask = new SetThemeTask(getActivity());
            Integer ainteger[] = new Integer[1];
            ainteger[0] = Integer.valueOf(i);
            setthemetask.execute(ainteger);
            mCurrentPosition = i;
            return;
        } else
        {
            mStatusBarManager.disable(0);
            return;
        }
    }

    public void onStart()
    {
        super.onStart();
        mThemeList = getListView();
        mThemeList.setAdapter(new ThemeAdapter(getActivity(), mThemeDatas));
        mThemeList.setOnItemClickListener(this);
    }





}
