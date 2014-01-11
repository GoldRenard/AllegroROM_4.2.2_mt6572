// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.recording;

import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.media.MediaRecorder;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.text.format.DateFormat;
import android.util.Log;
import android.widget.Toast;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneUtils;
import java.io.File;
import java.io.IOException;
import java.util.Date;

// Referenced classes of package com.mediatek.phone.recording:
//            Recorder

public class PhoneRecorder extends Recorder
    implements android.media.MediaScannerConnection.MediaScannerConnectionClient
{

    private static final String AUDIO_3GPP = "audio/3gpp";
    private static final String AUDIO_AMR = "audio/amr";
    private static final String AUDIO_ANY = "audio/*";
    private static final String AUDIO_DB_TITLE_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final long LOW_STORAGE_THRESHOLD = 0x80000L;
    private static final String TAG = "PhoneRecorder";
    private static boolean sFlagRecord;
    private static byte sLock[] = new byte[0];
    private static PhoneRecorder sPhoneRecorder;
    private static boolean sSDcardFullFlag;
    private AlertDialog mAlertDialog;
    private String mAudioDBPlaylistName;
    private MediaScannerConnection mConnection;
    private Context mContext;
    long mMaxFileSize;
    String mRequestedType;
    boolean mSampleInterrupted;

    private PhoneRecorder(Context context)
    {
        mRequestedType = "audio/3gpp";
        mMaxFileSize = -1L;
        mContext = context;
        mAudioDBPlaylistName = mContext.getString(0x7f0d0009);
        mConnection = new MediaScannerConnection(context, this);
    }

    private Uri addToMediaDB(File file)
    {
        ContentValues contentvalues = new ContentValues();
        long l = System.currentTimeMillis();
        file.lastModified();
        Date date = new Date(l);
        String s = DateFormat.getTimeFormat(mContext).format(date);
        String s1 = DateFormat.getDateFormat(mContext).format(date);
        (new StringBuilder()).append(s1).append(" ").append(s).toString();
        contentvalues.put("_data", file.getAbsolutePath());
        contentvalues.put("mime_type", mRequestedType);
        ContentResolver contentresolver = mContext.getContentResolver();
        Uri uri = contentresolver.insert(android.provider.MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, contentvalues);
        if (uri == null)
        {
            Log.e("PhoneRecorder", "----- Unable to save recorded audio !!");
            uri = null;
        } else
        {
            if (getPlaylistId() == -1)
                createPlaylist(contentresolver);
            addToPlaylist(contentresolver, Integer.valueOf(uri.getLastPathSegment()).intValue(), getPlaylistId());
            mContext.sendBroadcast(new Intent("android.intent.action.MEDIA_SCANNER_SCAN_FILE", uri));
            if (mConnection != null)
            {
                mConnection.connect();
                return uri;
            }
        }
        return uri;
    }

    private void addToPlaylist(ContentResolver contentresolver, int i, long l)
    {
        String as[] = {
            "count(*)"
        };
        Uri uri = android.provider.MediaStore.Audio.Playlists.Members.getContentUri("external", l);
        Cursor cursor = contentresolver.query(uri, as, null, null, null);
        if (cursor != null)
        {
            cursor.moveToFirst();
            int j = cursor.getInt(0);
            cursor.close();
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("play_order", Integer.valueOf(j + i));
            contentvalues.put("audio_id", Integer.valueOf(i));
            contentresolver.insert(uri, contentvalues);
        }
    }

    private Uri createPlaylist(ContentResolver contentresolver)
    {
        ContentValues contentvalues = new ContentValues();
        mAudioDBPlaylistName = mContext.getString(0x7f0d0009);
        contentvalues.put("name", mAudioDBPlaylistName);
        Uri uri = contentresolver.insert(android.provider.MediaStore.Audio.Playlists.getContentUri("external"), contentvalues);
        if (uri == null)
            Log.e("PhoneRecorder", "---- Unable to save recorded audio -----");
        return uri;
    }

    public static PhoneRecorder getInstance(Context context)
    {
        PhoneRecorder phonerecorder;
        synchronized (sLock)
        {
            if (sPhoneRecorder == null)
                sPhoneRecorder = new PhoneRecorder(context);
            phonerecorder = sPhoneRecorder;
        }
        return phonerecorder;
        exception;
        abyte0;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private int getPlaylistId()
    {
        Uri uri = android.provider.MediaStore.Audio.Playlists.getContentUri("external");
        String as[] = {
            "_id"
        };
        mAudioDBPlaylistName = mContext.getString(0x7f0d0009);
        String as1[] = new String[1];
        as1[0] = mAudioDBPlaylistName;
        Cursor cursor = query(uri, as, "name=?", as1, null);
        if (cursor == null)
            Log.v("PhoneRecorder", "query returns null");
        int i = -1;
        if (cursor != null)
        {
            cursor.moveToFirst();
            if (!cursor.isAfterLast())
                i = cursor.getInt(0);
            cursor.close();
        }
        return i;
    }

    public static boolean isRecording()
    {
        return sFlagRecord;
    }

    private Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        ContentResolver contentresolver;
        Cursor cursor;
        try
        {
            contentresolver = mContext.getContentResolver();
        }
        catch (UnsupportedOperationException unsupportedoperationexception)
        {
            return null;
        }
        if (contentresolver == null)
            return null;
        cursor = contentresolver.query(uri, as, s, as1, s1);
        return cursor;
    }

    public static boolean sdcardFullFlag()
    {
        boolean flag;
        if (!PhoneUtils.diskSpaceAvailable(0x200000L))
            flag = true;
        else
            flag = false;
        sSDcardFullFlag = flag;
        return sSDcardFullFlag;
    }

    public boolean ismFlagRecord()
    {
        return sFlagRecord;
    }

    public void log(String s)
    {
        Log.d("PhoneRecorder", s);
    }

    public void onError(MediaRecorder mediarecorder, int i, int j)
    {
        Log.e("PhoneRecorder", "MediaRecorder error...");
    }

    public void onMediaScannerConnected()
    {
        if (mConnection != null)
        {
            File file = sampleFile();
            if (file != null)
                mConnection.scanFile(file.getAbsolutePath(), null);
        }
    }

    public void onScanCompleted(String s, Uri uri)
    {
        if (mConnection != null)
            mConnection.disconnect();
    }

    public boolean saveSample()
    {
        if (sampleLength() != 0L)
        {
            Uri uri;
            try
            {
                uri = addToMediaDB(sampleFile());
            }
            catch (UnsupportedOperationException unsupportedoperationexception)
            {
                return false;
            }
            if (uri != null)
                return true;
        }
        return false;
    }

    public void setMContext(Context context)
    {
        mContext = context;
    }

    public void setmFlagRecord(boolean flag)
    {
        sFlagRecord = flag;
    }

    public void startRecord()
    {
        log((new StringBuilder()).append("startRecord, mRequestedType = ").append(mRequestedType).toString());
        if (sFlagRecord)
            return;
        if (!PhoneUtils.isExternalStorageMounted())
        {
            mSampleInterrupted = true;
            Log.e("PhoneRecorder", "-----Please insert an SD card----");
            return;
        }
        if (!PhoneUtils.diskSpaceAvailable(0x200000L))
        {
            mSampleInterrupted = true;
            Log.e("PhoneRecorder", "--------Storage is full-------");
            return;
        }
        if (!"audio/amr".equals(mRequestedType)) goto _L2; else goto _L1
_L1:
        startRecording(3, ".amr");
_L3:
        IOException ioexception;
        sPhoneRecorder.setmFlagRecord(true);
        return;
_L2:
        RuntimeException runtimeexception;
label0:
        {
            if (!"audio/3gpp".equals(mRequestedType))
                break label0;
            startRecording(1, ".3gpp");
        }
          goto _L3
        try
        {
label1:
            {
                if (!"audio/*".equals(mRequestedType))
                    break label1;
                startRecording(1, ".3gpp");
            }
        }
        // Misplaced declaration of an exception variable
        catch (IOException ioexception)
        {
            sPhoneRecorder.setmFlagRecord(false);
            return;
        }
        // Misplaced declaration of an exception variable
        catch (RuntimeException runtimeexception)
        {
            sPhoneRecorder.setmFlagRecord(false);
            return;
        }
          goto _L3
        throw new IllegalArgumentException("Invalid output file type requested");
    }

    public void stop()
    {
        if (!sFlagRecord)
        {
            return;
        } else
        {
            super.stop();
            sFlagRecord = false;
            return;
        }
    }

    public void stopRecord(boolean flag)
    {
        if (!sFlagRecord)
            return;
        log("stopRecord");
        stop();
        PhoneGlobals.getInstance();
        if (flag)
        {
            saveSample();
            if (sSDcardFullFlag)
            {
                Toast.makeText(mContext, mContext.getResources().getText(0x7f0d000d), 1).show();
                return;
            } else
            {
                Toast.makeText(mContext, (new StringBuilder()).append(mContext.getResources().getText(0x7f0d000e)).append(super.recordFilePatch).toString(), 1).show();
                return;
            }
        } else
        {
            delete();
            Toast.makeText(mContext, mContext.getResources().getText(0x7f0d000b), 1).show();
            return;
        }
    }

}
