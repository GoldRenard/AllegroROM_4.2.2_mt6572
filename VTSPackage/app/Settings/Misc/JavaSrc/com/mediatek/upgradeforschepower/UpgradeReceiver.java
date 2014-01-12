// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.upgradeforschepower;

import android.content.*;
import com.mediatek.xlog.Xlog;
import java.io.*;

public class UpgradeReceiver extends BroadcastReceiver
{

    private static final String SCHPWRS_DB_PATH = "data/data/com.android.settings/databases/schpwrs.db";
    private static final String TAG = "UpgradeReceiver";
    private static final String TEMP_DB_PATH = "/data/schpwrs.db";
    private File mSettingSchPwrsDbFile;


    private void copyDbFileToPhoneStorage()
    {
        File file;
        FileInputStream fileinputstream;
        FileOutputStream fileoutputstream;
        Xlog.v("UpgradeReceiver", "copyDbFileToPhoneStorage()");
        file = new File("/data/schpwrs.db");
        fileinputstream = null;
        fileoutputstream = null;
        FileInputStream fileinputstream1 = new FileInputStream(mSettingSchPwrsDbFile);
        FileOutputStream fileoutputstream1 = new FileOutputStream(file);
        byte abyte0[] = new byte[1024];
_L3:
        int i = fileinputstream1.read(abyte0);
        if (i <= 0) goto _L2; else goto _L1
_L1:
        fileoutputstream1.write(abyte0, 0, i);
          goto _L3
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        fileoutputstream = fileoutputstream1;
        fileinputstream = fileinputstream1;
_L10:
        Xlog.w("UpgradeReceiver", (new StringBuilder()).append("FileNotFoundException ").append(filenotfoundexception.getMessage()).toString());
        IOException ioexception4;
        if (fileoutputstream != null)
            try
            {
                fileoutputstream.flush();
                fileoutputstream.close();
            }
            catch (IOException ioexception3)
            {
                Xlog.w("UpgradeReceiver", (new StringBuilder()).append("IOException ").append(ioexception3.getMessage()).toString());
                return;
            }
        if (fileinputstream == null)
            break MISSING_BLOCK_LABEL_141;
        fileinputstream.close();
_L5:
        return;
_L2:
        if (fileoutputstream1 != null)
            try
            {
                fileoutputstream1.flush();
                fileoutputstream1.close();
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception4)
            {
                Xlog.w("UpgradeReceiver", (new StringBuilder()).append("IOException ").append(ioexception4.getMessage()).toString());
                return;
            }
        if (fileinputstream1 == null)
            break MISSING_BLOCK_LABEL_167;
        fileinputstream1.close();
        Xlog.v("UpgradeReceiver", "Copy done return true");
        return;
        IOException ioexception;
        ioexception;
_L8:
        Xlog.w("UpgradeReceiver", (new StringBuilder()).append("IOException ").append(ioexception.getMessage()).toString());
        if (fileoutputstream == null)
            continue; /* Loop/switch isn't completed */
        fileoutputstream.flush();
        fileoutputstream.close();
        if (fileinputstream == null) goto _L5; else goto _L4
_L4:
        try
        {
            fileinputstream.close();
            return;
        }
        catch (IOException ioexception2)
        {
            Xlog.w("UpgradeReceiver", (new StringBuilder()).append("IOException ").append(ioexception2.getMessage()).toString());
        }
        return;
        Exception exception;
        exception;
_L7:
        if (fileoutputstream != null)
            try
            {
                fileoutputstream.flush();
                fileoutputstream.close();
            }
            catch (IOException ioexception1)
            {
                Xlog.w("UpgradeReceiver", (new StringBuilder()).append("IOException ").append(ioexception1.getMessage()).toString());
                return;
            }
        if (fileinputstream == null)
            break MISSING_BLOCK_LABEL_352;
        fileinputstream.close();
        throw exception;
        exception;
        fileinputstream = fileinputstream1;
        fileoutputstream = null;
        continue; /* Loop/switch isn't completed */
        exception;
        fileoutputstream = fileoutputstream1;
        fileinputstream = fileinputstream1;
        if (true) goto _L7; else goto _L6
_L6:
        ioexception;
        fileinputstream = fileinputstream1;
        fileoutputstream = null;
          goto _L8
        ioexception;
        fileoutputstream = fileoutputstream1;
        fileinputstream = fileinputstream1;
          goto _L8
        filenotfoundexception;
        fileinputstream = null;
        fileoutputstream = null;
        continue; /* Loop/switch isn't completed */
        filenotfoundexception;
        fileinputstream = fileinputstream1;
        fileoutputstream = null;
        if (true) goto _L10; else goto _L9
_L9:
    }

    public void onReceive(Context context, Intent intent)
    {
        Xlog.v("UpgradeReceiver", (new StringBuilder()).append("onReceive = ").append(intent.getAction()).toString());
        mSettingSchPwrsDbFile = new File("data/data/com.android.settings/databases/schpwrs.db");
        if (mSettingSchPwrsDbFile.exists())
        {
            copyDbFileToPhoneStorage();
            if (!mSettingSchPwrsDbFile.delete())
                Xlog.w("UpgradeReceiver", "delete settings db file failed.");
            return;
        } else
        {
            Xlog.w("UpgradeReceiver", "com.android.settings/databases/schpwrs.db does not exist");
            return;
        }
    }
}
