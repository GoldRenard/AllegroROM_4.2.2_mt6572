// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.backup;

import android.app.WallpaperManager;
import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.view.Display;
import android.view.WindowManager;
import java.io.File;

// Referenced classes of package android.app.backup:
//            FileBackupHelperBase, BackupHelper, BackupDataInputStream, BackupDataOutput

public class WallpaperBackupHelper extends FileBackupHelperBase
    implements BackupHelper
{

    private static final boolean DEBUG = false;
    private static final String STAGE_FILE = (new File(Environment.getUserSystemDirectory(0), "wallpaper-tmp")).getAbsolutePath();
    private static final String TAG = "WallpaperBackupHelper";
    public static final String WALLPAPER_IMAGE = (new File(Environment.getUserSystemDirectory(0), "wallpaper")).getAbsolutePath();
    public static final String WALLPAPER_IMAGE_KEY = "/data/data/com.android.settings/files/wallpaper";
    public static final String WALLPAPER_INFO = (new File(Environment.getUserSystemDirectory(0), "wallpaper_info.xml")).getAbsolutePath();
    public static final String WALLPAPER_INFO_KEY = "/data/system/wallpaper_info.xml";
    Context mContext;
    double mDesiredMinHeight;
    double mDesiredMinWidth;
    String mFiles[];
    String mKeys[];

    public WallpaperBackupHelper(Context context, String as[], String as1[])
    {
        super(context);
        mContext = context;
        mFiles = as;
        mKeys = as1;
        WallpaperManager wallpapermanager = (WallpaperManager)context.getSystemService("wallpaper");
        mDesiredMinWidth = wallpapermanager.getDesiredMinimumWidth();
        mDesiredMinHeight = wallpapermanager.getDesiredMinimumHeight();
        if (mDesiredMinWidth <= 0.0D || mDesiredMinHeight <= 0.0D)
        {
            Display display = ((WindowManager)context.getSystemService("window")).getDefaultDisplay();
            Point point = new Point();
            display.getSize(point);
            mDesiredMinWidth = point.x;
            mDesiredMinHeight = point.y;
        }
    }

    public void performBackup(ParcelFileDescriptor parcelfiledescriptor, BackupDataOutput backupdataoutput, ParcelFileDescriptor parcelfiledescriptor1)
    {
        performBackup_checked(parcelfiledescriptor, backupdataoutput, parcelfiledescriptor1, mFiles, mKeys);
    }

    public void restoreEntity(BackupDataInputStream backupdatainputstream)
    {
        String s = backupdatainputstream.getKey();
        if (isKeyInList(s, mKeys))
            if (s.equals("/data/data/com.android.settings/files/wallpaper"))
            {
                File file = new File(STAGE_FILE);
                if (writeFile(file, backupdatainputstream))
                {
                    android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
                    options.inJustDecodeBounds = true;
                    BitmapFactory.decodeFile(STAGE_FILE, options);
                    double d = mDesiredMinWidth / (double)options.outWidth;
                    double d1 = mDesiredMinHeight / (double)options.outHeight;
                    if (d > 0.0D && d < 1.3300000000000001D && d1 > 0.0D && d1 < 1.3300000000000001D)
                    {
                        file.renameTo(new File(WALLPAPER_IMAGE));
                    } else
                    {
                        file.delete();
                        return;
                    }
                }
            } else
            if (s.equals("/data/system/wallpaper_info.xml"))
            {
                writeFile(new File(WALLPAPER_INFO), backupdatainputstream);
                return;
            }
    }

    public volatile void writeNewStateDescription(ParcelFileDescriptor parcelfiledescriptor)
    {
        super.writeNewStateDescription(parcelfiledescriptor);
    }

}
