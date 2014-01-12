// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import android.content.Context;
import android.util.Log;
import java.io.*;

public class BluetoothPbapWriter
{

    public static final boolean DEBUG = true;
    private static final String TAG = "BluetoothPbapWriter";
    FileOutputStream mOutputStream;
    String mResultPath;

    public BluetoothPbapWriter()
    {
        mResultPath = null;
        mOutputStream = null;
    }

    public String getPath()
    {
        return mResultPath;
    }

    public boolean init(Context context)
    {
        if (mOutputStream != null)
            break MISSING_BLOCK_LABEL_37;
        File file;
        mOutputStream = context.openFileOutput("btpbaptmp.vcf", 1);
        file = context.getFileStreamPath("btpbaptmp.vcf");
        if (file != null)
            try
            {
                mResultPath = file.getAbsolutePath();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                mOutputStream = null;
            }
        return mOutputStream != null;
    }

    public void terminate()
    {
        if (mOutputStream == null)
            break MISSING_BLOCK_LABEL_14;
        mOutputStream.close();
        return;
        IOException ioexception;
        ioexception;
        mOutputStream = null;
        return;
    }

    public boolean write(String s)
    {
        if (mOutputStream == null)
            break MISSING_BLOCK_LABEL_22;
        mOutputStream.write(s.getBytes("UTF-8"));
        return true;
        try
        {
            Log.e("BluetoothPbapWriter", "mOutputStream is null when calling write");
        }
        catch (IOException ioexception)
        {
            Log.e("BluetoothPbapWriter", "write output stream failed");
            return false;
        }
        return false;
    }
}
