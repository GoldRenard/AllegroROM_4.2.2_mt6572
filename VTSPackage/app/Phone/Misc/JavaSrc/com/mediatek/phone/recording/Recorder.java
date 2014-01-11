// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.recording;

import android.media.MediaRecorder;
import android.os.Bundle;
import android.util.Log;
import com.mediatek.storage.StorageManagerEx;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Recorder
    implements android.media.MediaRecorder.OnErrorListener
{
    public static interface OnStateChangedListener
    {

        public abstract void onError(int i);

        public abstract void onStateChanged(int i);
    }


    public static final int IDLE_STATE = 0;
    public static final int INTERNAL_ERROR = 2;
    public static final int NO_ERROR = 0;
    public static final int RECORDING_STATE = 1;
    static final String SAMPLE_LENGTH_KEY = "sample_length";
    static final String SAMPLE_PATH_KEY = "sample_path";
    static final String SAMPLE_PREFIX = "recording";
    public static final int SDCARD_ACCESS_ERROR = 1;
    private static final String TAG = "Recorder";
    OnStateChangedListener mOnStateChangedListener;
    MediaRecorder mRecorder;
    File mSampleFile;
    long mSampleLength;
    long mSampleStart;
    int mState;
    public String recordFilePatch;

    public Recorder()
    {
        mState = 0;
        recordFilePatch = null;
    }

    private void handleException()
    {
        setError(2);
        mRecorder.reset();
        mRecorder.release();
        mRecorder = null;
    }

    private void setError(int i)
    {
        if (mOnStateChangedListener != null)
            mOnStateChangedListener.onError(i);
    }

    private void setState(int i)
    {
        if (i == mState)
        {
            return;
        } else
        {
            mState = i;
            signalStateChanged(mState);
            return;
        }
    }

    private void signalStateChanged(int i)
    {
        if (mOnStateChangedListener != null)
            mOnStateChangedListener.onStateChanged(i);
    }

    public void clear()
    {
        stop();
        mSampleLength = 0L;
        signalStateChanged(0);
    }

    public void delete()
    {
        stop();
        if (mSampleFile != null)
            mSampleFile.delete();
        mSampleFile = null;
        mSampleLength = 0L;
        signalStateChanged(0);
    }

    public int getMaxAmplitude()
    {
        if (mState != 1)
            return 0;
        else
            return mRecorder.getMaxAmplitude();
    }

    public void log(String s)
    {
        Log.d("Recorder", s);
    }

    public void onError(MediaRecorder mediarecorder, int i, int j)
    {
        log("onError");
        if (i == 1)
            stop();
    }

    public int progress()
    {
        if (mState == 1)
            return (int)((System.currentTimeMillis() - mSampleStart) / 1000L);
        else
            return 0;
    }

    public void restoreState(Bundle bundle)
    {
        String s = bundle.getString("sample_path");
        if (s != null)
        {
            long l = bundle.getLong("sample_length", -1L);
            if (l != -1L)
            {
                File file = new File(s);
                if (file.exists() && (mSampleFile == null || mSampleFile.getAbsolutePath().compareTo(file.getAbsolutePath()) != 0))
                {
                    delete();
                    mSampleFile = file;
                    mSampleLength = l;
                    signalStateChanged(0);
                    return;
                }
            }
        }
    }

    public File sampleFile()
    {
        return mSampleFile;
    }

    public long sampleLength()
    {
        return mSampleLength;
    }

    public void saveState(Bundle bundle)
    {
        bundle.putString("sample_path", mSampleFile.getAbsolutePath());
        bundle.putLong("sample_length", mSampleLength);
    }

    public void setOnStateChangedListener(OnStateChangedListener onstatechangedlistener)
    {
        mOnStateChangedListener = onstatechangedlistener;
    }

    public void startRecording(int i, String s)
        throws IOException
    {
        log("startRecording");
        stop();
        String s1 = (new SimpleDateFormat("yyyy-MM-dd_HH.mm.ss")).format(new Date());
        File file = new File(StorageManagerEx.getDefaultPath());
        if (!file.canWrite())
        {
            Log.i("Recorder", "----- file can't write!! ---");
            file = new File("/sdcard/sdcard");
        }
        File file1 = new File((new StringBuilder()).append(file.getAbsolutePath()).append("/PhoneRecord").toString());
        if (!file1.exists())
            file1.mkdirs();
        try
        {
            mSampleFile = File.createTempFile(s1, s, file1);
            recordFilePatch = (new StringBuilder()).append(": ").append(mSampleFile.getAbsolutePath()).toString();
        }
        catch (IOException ioexception)
        {
            setError(1);
            Log.i("Recorder", "----***------- can't access sdcard !!");
            throw ioexception;
        }
        log("finish creating temp file, start to record");
        mRecorder = new MediaRecorder();
        mRecorder.setOnErrorListener(this);
        mRecorder.setAudioSource(1);
        mRecorder.setOutputFormat(i);
        mRecorder.setAudioEncoder(1);
        mRecorder.setOutputFile(mSampleFile.getAbsolutePath());
        try
        {
            mRecorder.prepare();
            mRecorder.start();
            mSampleStart = System.currentTimeMillis();
            setState(1);
            return;
        }
        catch (IOException ioexception1)
        {
            log("startRecording, IOException");
            handleException();
            throw ioexception1;
        }
        catch (RuntimeException runtimeexception)
        {
            log("startRecording, RuntimeException");
            handleException();
            throw runtimeexception;
        }
    }

    public int state()
    {
        return mState;
    }

    public void stop()
    {
        log("stop");
        stopRecording();
    }

    public void stopRecording()
    {
        log("stopRecording");
        if (mRecorder == null)
        {
            return;
        } else
        {
            mSampleLength = System.currentTimeMillis() - mSampleStart;
            mRecorder.stop();
            mRecorder.release();
            mRecorder = null;
            setState(0);
            return;
        }
    }
}
