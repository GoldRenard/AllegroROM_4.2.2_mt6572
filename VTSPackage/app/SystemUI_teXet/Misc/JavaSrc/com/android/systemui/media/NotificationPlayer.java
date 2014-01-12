// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.media;

import android.content.Context;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.*;
import android.util.Log;
import java.io.IOException;
import java.util.LinkedList;

public class NotificationPlayer
    implements android.media.MediaPlayer.OnCompletionListener
{
    private final class CmdThread extends Thread
    {

        final NotificationPlayer this$0;

        public void run()
        {
_L6:
            Command command;
            synchronized (mCmdQueue)
            {
                command = (Command)mCmdQueue.removeFirst();
            }
            command.code;
            JVM INSTR tableswitch 1 2: default 52
        //                       1 102
        //                       2 113;
               goto _L1 _L2 _L3
_L1:
            synchronized (mCmdQueue)
            {
                if (mCmdQueue.size() != 0)
                    break; /* Loop/switch isn't completed */
                mThread = null;
                releaseWakeLock();
            }
            return;
            exception;
            linkedlist;
            JVM INSTR monitorexit ;
            throw exception;
_L2:
            startSound(command);
            continue; /* Loop/switch isn't completed */
_L3:
            if (mPlayer != null)
            {
                long l = SystemClock.uptimeMillis() - command.requestTime;
                if (l > 1000L)
                    Log.w(mTag, (new StringBuilder()).append("Notification stop delayed by ").append(l).append("msecs").toString());
                synchronized (mPlayerLock)
                {
                    mPlayer.stop();
                    mPlayer.release();
                    mPlayer = null;
                    mAudioManager.abandonAudioFocus(mAudioFocusChangeListener);
                    mAudioManager = null;
                    if (mLooper != null && mLooper.getThread().getState() != Thread.State.TERMINATED)
                        mLooper.quit();
                }
            } else
            {
                Log.w(mTag, "STOP command without a player");
            }
            if (true) goto _L1; else goto _L4
            exception2;
            obj;
            JVM INSTR monitorexit ;
            throw exception2;
_L4:
            linkedlist1;
            JVM INSTR monitorexit ;
            if (true) goto _L6; else goto _L5
_L5:
            exception1;
            linkedlist1;
            JVM INSTR monitorexit ;
            throw exception1;
        }

        CmdThread()
        {
            this$0 = NotificationPlayer.this;
            super((new StringBuilder()).append("NotificationPlayer-").append(mTag).toString());
        }
    }

    private static final class Command
    {

        int code;
        Context context;
        boolean looping;
        long requestTime;
        int stream;
        Uri uri;

        public String toString()
        {
            return (new StringBuilder()).append("{ code=").append(code).append(" looping=").append(looping).append(" stream=").append(stream).append(" uri=").append(uri).append(" }").toString();
        }

        private Command()
        {
        }

    }

    private final class CreationAndCompletionThread extends Thread
    {

        public Command mCmd;
        final NotificationPlayer this$0;

        public void run()
        {
            Looper.prepare();
            mLooper = Looper.myLooper();
            this;
            JVM INSTR monitorenter ;
            AudioManager audiomanager = (AudioManager)mCmd.context.getSystemService("audio");
            MediaPlayer mediaplayer;
            mediaplayer = new MediaPlayer();
            mediaplayer.setAudioStreamType(mCmd.stream);
            mediaplayer.setDataSource(mCmd.context, mCmd.uri);
_L5:
            mediaplayer.setLooping(mCmd.looping);
            mediaplayer.prepare();
            if (mCmd.uri == null || mCmd.uri.getEncodedPath() == null || mCmd.uri.getEncodedPath().length() <= 0) goto _L2; else goto _L1
_L1:
            if (!mCmd.looping) goto _L4; else goto _L3
_L3:
            audiomanager.requestAudioFocus(mAudioFocusChangeListener, mCmd.stream, 1);
_L2:
            mediaplayer.setOnCompletionListener(NotificationPlayer.this);
            mediaplayer.start();
            synchronized (mPlayerLock)
            {
                if (mPlayer != null)
                    mPlayer.release();
                mPlayer = mediaplayer;
            }
_L6:
            mAudioManager = audiomanager;
            notify();
            this;
            JVM INSTR monitorexit ;
            Looper.loop();
            return;
            IOException ioexception;
            ioexception;
            mCmd.uri = android.provider.Settings.System.DEFAULT_NOTIFICATION_URI;
            mediaplayer.setDataSource(mCmd.context, mCmd.uri);
              goto _L5
            Exception exception1;
            exception1;
            Log.w(mTag, (new StringBuilder()).append("error loading sound for ").append(mCmd.uri).toString(), exception1);
              goto _L6
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
_L4:
            audiomanager.requestAudioFocus(mAudioFocusChangeListener, mCmd.stream, 3);
              goto _L2
            exception2;
            obj;
            JVM INSTR monitorexit ;
            throw exception2;
              goto _L5
        }

        public CreationAndCompletionThread(Command command)
        {
            this$0 = NotificationPlayer.this;
            super();
            mCmd = command;
        }
    }


    private static final int PLAY = 1;
    private static final int STOP = 2;
    private static final boolean mDebug;
    private android.media.AudioManager.OnAudioFocusChangeListener mAudioFocusChangeListener;
    private AudioManager mAudioManager;
    private LinkedList mCmdQueue;
    private final Object mCompletionHandlingLock = new Object();
    private CreationAndCompletionThread mCompletionThread;
    private Looper mLooper;
    private MediaPlayer mPlayer;
    private Object mPlayerLock;
    private int mState;
    private String mTag;
    private CmdThread mThread;
    private android.os.PowerManager.WakeLock mWakeLock;

    public NotificationPlayer(String s)
    {
        mCmdQueue = new LinkedList();
        mState = 2;
        mPlayerLock = new Object();
        mAudioFocusChangeListener = new android.media.AudioManager.OnAudioFocusChangeListener() {

            final NotificationPlayer this$0;

            public void onAudioFocusChange(int i)
            {
                if (mPlayer == null)
                    return;
                i;
                JVM INSTR tableswitch -3 1: default 48
            //                           -3 49
            //                           -2 49
            //                           -1 179
            //                           0 48
            //                           1 119;
                   goto _L1 _L2 _L2 _L3 _L1 _L4
_L1:
                return;
_L2:
                Object obj2 = mPlayerLock;
                obj2;
                JVM INSTR monitorenter ;
                if (mPlayer != null && mPlayer.isLooping() && mPlayer.isPlaying())
                {
                    mPlayer.pause();
                    return;
                }
                  goto _L5
                Exception exception2;
                exception2;
                obj2;
                JVM INSTR monitorexit ;
                throw exception2;
_L4:
                synchronized (mPlayerLock)
                {
                    if (mPlayer != null && !mPlayer.isPlaying())
                        mPlayer.start();
                }
                return;
                exception1;
                obj1;
                JVM INSTR monitorexit ;
                throw exception1;
_L5:
                obj2;
                JVM INSTR monitorexit ;
_L3:
                synchronized (mPlayerLock)
                {
                    if (mPlayer != null)
                        mPlayer.stop();
                }
                return;
                exception;
                obj;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = NotificationPlayer.this;
                super();
            }
        }
;
        if (s != null)
        {
            mTag = s;
            return;
        } else
        {
            mTag = "NotificationPlayer";
            return;
        }
    }

    private void acquireWakeLock()
    {
        if (mWakeLock != null)
            mWakeLock.acquire();
    }

    private void enqueueLocked(Command command)
    {
        mCmdQueue.add(command);
        if (mThread == null)
        {
            acquireWakeLock();
            mThread = new CmdThread();
            mThread.start();
        }
    }

    private void releaseWakeLock()
    {
        if (mWakeLock != null)
            mWakeLock.release();
    }

    private void startSound(Command command)
    {
        Object obj = mCompletionHandlingLock;
        obj;
        JVM INSTR monitorenter ;
        synchronized (mPlayerLock)
        {
            if (mPlayer != null)
            {
                mPlayer.stop();
                mPlayer.release();
                mPlayer = null;
                mAudioManager.abandonAudioFocus(mAudioFocusChangeListener);
                mAudioManager = null;
            }
        }
        if (mLooper != null && mLooper.getThread().getState() != Thread.State.TERMINATED)
            mLooper.quit();
        mCompletionThread = new CreationAndCompletionThread(command);
        synchronized (mCompletionThread)
        {
            mCompletionThread.start();
            mCompletionThread.wait();
        }
        obj;
        JVM INSTR monitorexit ;
        long l = SystemClock.uptimeMillis() - command.requestTime;
        if (l <= 1000L)
            break MISSING_BLOCK_LABEL_188;
        Log.w(mTag, (new StringBuilder()).append("Notification sound delayed by ").append(l).append("msecs").toString());
        return;
        exception2;
        obj1;
        JVM INSTR monitorexit ;
        throw exception2;
        Exception exception1;
        exception1;
        obj;
        JVM INSTR monitorexit ;
        try
        {
            throw exception1;
        }
        catch (Exception exception)
        {
            Log.w(mTag, (new StringBuilder()).append("error loading sound for ").append(command.uri).toString(), exception);
        }
        return;
        exception3;
        creationandcompletionthread;
        JVM INSTR monitorexit ;
        throw exception3;
    }

    public void onCompletion(MediaPlayer mediaplayer)
    {
        if (mAudioManager != null)
            mAudioManager.abandonAudioFocus(mAudioFocusChangeListener);
        LinkedList linkedlist = mCmdQueue;
        linkedlist;
        JVM INSTR monitorenter ;
        if (mCmdQueue.size() == 0)
            synchronized (mCompletionHandlingLock)
            {
                if (mLooper != null)
                    mLooper.quit();
                mCompletionThread = null;
            }
        linkedlist;
        JVM INSTR monitorexit ;
        return;
        exception1;
        obj;
        JVM INSTR monitorexit ;
        throw exception1;
        Exception exception;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void play(Context context, Uri uri, boolean flag, int i)
    {
        Command command = new Command();
        command.requestTime = SystemClock.uptimeMillis();
        command.code = 1;
        command.context = context;
        command.uri = uri;
        command.looping = flag;
        command.stream = i;
        synchronized (mCmdQueue)
        {
            enqueueLocked(command);
            mState = 1;
        }
        return;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setUsesWakeLock(Context context)
    {
        if (mWakeLock == null && mThread == null)
        {
            mWakeLock = ((PowerManager)context.getSystemService("power")).newWakeLock(1, mTag);
            return;
        } else
        {
            throw new RuntimeException((new StringBuilder()).append("assertion failed mWakeLock=").append(mWakeLock).append(" mThread=").append(mThread).toString());
        }
    }

    public void stop()
    {
        synchronized (mCmdQueue)
        {
            if (mState != 2)
            {
                Command command = new Command();
                command.requestTime = SystemClock.uptimeMillis();
                command.code = 2;
                enqueueLocked(command);
                mState = 2;
            }
        }
        return;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }



/*
    static Looper access$002(NotificationPlayer notificationplayer, Looper looper)
    {
        notificationplayer.mLooper = looper;
        return looper;
    }

*/





/*
    static MediaPlayer access$302(NotificationPlayer notificationplayer, MediaPlayer mediaplayer)
    {
        notificationplayer.mPlayer = mediaplayer;
        return mediaplayer;
    }

*/




/*
    static AudioManager access$502(NotificationPlayer notificationplayer, AudioManager audiomanager)
    {
        notificationplayer.mAudioManager = audiomanager;
        return audiomanager;
    }

*/




/*
    static CmdThread access$802(NotificationPlayer notificationplayer, CmdThread cmdthread)
    {
        notificationplayer.mThread = cmdthread;
        return cmdthread;
    }

*/

}
