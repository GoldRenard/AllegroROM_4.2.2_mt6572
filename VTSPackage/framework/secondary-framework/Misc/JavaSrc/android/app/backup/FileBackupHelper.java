// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.backup;

import android.content.Context;
import android.os.ParcelFileDescriptor;
import java.io.File;

// Referenced classes of package android.app.backup:
//            FileBackupHelperBase, BackupHelper, BackupDataInputStream, BackupDataOutput

public class FileBackupHelper extends FileBackupHelperBase
    implements BackupHelper
{

    private static final boolean DEBUG = false;
    private static final String TAG = "FileBackupHelper";
    Context mContext;
    String mFiles[];
    File mFilesDir;

    public transient FileBackupHelper(Context context, String as[])
    {
        super(context);
        mContext = context;
        mFilesDir = context.getFilesDir();
        mFiles = as;
    }

    public void performBackup(ParcelFileDescriptor parcelfiledescriptor, BackupDataOutput backupdataoutput, ParcelFileDescriptor parcelfiledescriptor1)
    {
        String as[] = mFiles;
        File file = mContext.getFilesDir();
        int i = as.length;
        String as1[] = new String[i];
        for (int j = 0; j < i; j++)
            as1[j] = (new File(file, as[j])).getAbsolutePath();

        performBackup_checked(parcelfiledescriptor, backupdataoutput, parcelfiledescriptor1, as1, as);
    }

    public void restoreEntity(BackupDataInputStream backupdatainputstream)
    {
        String s = backupdatainputstream.getKey();
        if (isKeyInList(s, mFiles))
            writeFile(new File(mFilesDir, s), backupdatainputstream);
    }

    public volatile void writeNewStateDescription(ParcelFileDescriptor parcelfiledescriptor)
    {
        super.writeNewStateDescription(parcelfiledescriptor);
    }
}
