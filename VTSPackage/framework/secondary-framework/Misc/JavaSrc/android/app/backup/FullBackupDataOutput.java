// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.backup;

import android.os.ParcelFileDescriptor;

// Referenced classes of package android.app.backup:
//            BackupDataOutput

public class FullBackupDataOutput
{

    private BackupDataOutput mData;

    public FullBackupDataOutput(ParcelFileDescriptor parcelfiledescriptor)
    {
        mData = new BackupDataOutput(parcelfiledescriptor.getFileDescriptor());
    }

    public BackupDataOutput getData()
    {
        return mData;
    }
}
