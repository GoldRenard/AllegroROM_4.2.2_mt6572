// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.thememanager;

import android.content.*;
import android.content.pm.*;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.*;
import android.net.Uri;
import com.mediatek.xlog.Xlog;
import java.text.Collator;
import java.util.*;

// Referenced classes of package com.mediatek.thememanager:
//            Themes, ThemeManager

public class ThemeProvider extends ContentProvider
{
    private static class DatabaseHelper extends SQLiteOpenHelper
    {

        private final Collator mCollator = Collator.getInstance();
        private Context mContext;
        private final Comparator mThemeNameComparator = new _cls1();

        public void initDatabase(SQLiteDatabase sqlitedatabase)
        {
            List list = mContext.getPackageManager().getInstalledPackages(0);
            ArrayList arraylist = new ArrayList();
            PackageInfo packageinfo = null;
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                PackageInfo packageinfo2 = (PackageInfo)iterator.next();
                Xlog.d("ThemeProvider", (new StringBuilder()).append("initDatabase: packageName = ").append(packageinfo2.packageName).append(",isThemePackage = ").append(packageinfo2.isThemePackage).append(",themeNameId = ").append(packageinfo2.themeNameId).toString());
                if (packageinfo2.packageName.equals("android"))
                    packageinfo = packageinfo2;
                if (1 == packageinfo2.isThemePackage)
                    arraylist.add(packageinfo2);
            } while (true);
            Collections.sort(arraylist, mThemeNameComparator);
            if (packageinfo != null)
                arraylist.add(0, packageinfo);
            ContentValues contentvalues;
            for (Iterator iterator1 = arraylist.iterator(); iterator1.hasNext(); sqlitedatabase.insert("theme", null, contentvalues))
            {
                PackageInfo packageinfo1 = (PackageInfo)iterator1.next();
                contentvalues = new ContentValues();
                contentvalues.put("package_name", packageinfo1.packageName);
                contentvalues.put("theme_path", packageinfo1.applicationInfo.sourceDir);
                contentvalues.put("theme_name_id", Integer.valueOf(packageinfo1.themeNameId));
            }

            list.clear();
            arraylist.clear();
        }

        public void onCreate(SQLiteDatabase sqlitedatabase)
        {
            Xlog.d("ThemeProvider", "Enter DatabaseHelper.onCreate()");
            sqlitedatabase.execSQL("Create table theme( _id INTEGER PRIMARY KEY AUTOINCREMENT,package_name TEXT,theme_path TEXT,theme_name_id INTEGER);");
            initDatabase(sqlitedatabase);
            Xlog.d("ThemeProvider", "Leave DatabaseHelper.onCreate()");
        }

        public void onUpgrade(SQLiteDatabase sqlitedatabase, int i, int j)
        {
            Xlog.d("ThemeProvider", (new StringBuilder()).append("Upgrading database from version ").append(i).append(" to ").append(j).append(", which will destroy all old data").toString());
            sqlitedatabase.execSQL("DROP TABLE IF EXISTStheme");
            onCreate(sqlitedatabase);
        }



        public DatabaseHelper(Context context)
        {
            super(context, "themes.db", null, 1);
            mContext = context;
        }
    }


    private static final String DATABASE_NAME = "themes.db";
    private static final int DATABASE_VERSION = 1;
    private static final String TABLE_NAME = "theme";
    private static final String TAG = "ThemeProvider";
    private SQLiteDatabase mDatabase;
    private DatabaseHelper mDatabaseHelper;


    public int delete(Uri uri, String s, String as[])
    {
        Xlog.d("ThemeProvider", "Enter delete()");
        mDatabase = mDatabaseHelper.getWritableDatabase();
        return mDatabase.delete("theme", s, as);
    }

    public String getType(Uri uri)
    {
        return null;
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        Xlog.d("ThemeProvider", "Enter insert()");
        mDatabase = mDatabaseHelper.getWritableDatabase();
        ContentValues contentvalues1 = new ContentValues(contentvalues);
        long l = mDatabase.insert("theme", null, contentvalues1);
        if (l > 0L)
        {
            Uri uri1 = ContentUris.appendId(Themes.CONTENT_URI.buildUpon(), l).build();
            Xlog.d("ThemeProvider", "Leave insert()");
            return uri1;
        } else
        {
            throw new SQLException((new StringBuilder()).append("Failed to insert row into ").append(uri).toString());
        }
    }

    public boolean onCreate()
    {
        mDatabaseHelper = new DatabaseHelper(getContext());
        return true;
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        Xlog.d("ThemeProvider", "Enter query()");
        SQLiteQueryBuilder sqlitequerybuilder = new SQLiteQueryBuilder();
        SQLiteDatabase sqlitedatabase = mDatabaseHelper.getWritableDatabase();
        sqlitequerybuilder.setTables("theme");
        Xlog.d("ThemeProvider", (new StringBuilder()).append("query(): uri: ").append(uri.toString()).toString());
        Cursor cursor = sqlitequerybuilder.query(sqlitedatabase, as, s, as1, null, null, s1);
        if (cursor != null)
            cursor.setNotificationUri(getContext().getContentResolver(), uri);
        Xlog.d("ThemeProvider", "Leave query()");
        return cursor;
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
        return 0;
    }

    // Unreferenced inner class com/mediatek/thememanager/ThemeProvider$DatabaseHelper$1

/* anonymous class */
    class DatabaseHelper._cls1
        implements Comparator
    {

        final DatabaseHelper this$0;

        public int compare(PackageInfo packageinfo, PackageInfo packageinfo1)
        {
            String s = ThemeManager.getThemeName(mContext, packageinfo.packageName, packageinfo.themeNameId);
            String s1 = ThemeManager.getThemeName(mContext, packageinfo1.packageName, packageinfo1.themeNameId);
            return mCollator.compare(s, s1);
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((PackageInfo)obj, (PackageInfo)obj1);
        }

            
            {
                this$0 = DatabaseHelper.this;
                super();
            }
    }

}
