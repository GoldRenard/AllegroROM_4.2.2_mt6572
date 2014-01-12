// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaScannerConnection;
import android.os.Environment;
import android.util.Log;
import java.io.*;

public class CarouselViewUtilities
{


    public static boolean writeBitmapToFile(Context context, Bitmap bitmap, String s)
    {
        File file = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        File file1 = new File(file, s);
        try
        {
            file.mkdirs();
            FileOutputStream fileoutputstream = new FileOutputStream(file1);
            String as[] = new String[1];
            as[0] = file1.toString();
            MediaScannerConnection.scanFile(context, as, null, null);
            bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, fileoutputstream);
        }
        catch (IOException ioexception)
        {
            Log.w("ExternalStorage", (new StringBuilder()).append("Error writing ").append(file1).toString(), ioexception);
            return false;
        }
        return true;
    }
}
