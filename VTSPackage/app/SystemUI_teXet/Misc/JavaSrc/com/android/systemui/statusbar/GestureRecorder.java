// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.os.*;
import android.util.Slog;
import android.view.MotionEvent;
import java.io.*;
import java.util.*;

public class GestureRecorder
{
    public class Gesture
    {

        boolean mComplete;
        long mDownTime;
        private LinkedList mRecords;
        private HashSet mTags;
        final GestureRecorder this$0;

        public void add(MotionEvent motionevent)
        {
            mRecords.add(new MotionEventRecord(motionevent.getEventTime(), motionevent));
            if (mDownTime < 0L)
                mDownTime = motionevent.getDownTime();
            else
            if (mDownTime != motionevent.getDownTime())
                Slog.w(GestureRecorder.TAG, (new StringBuilder()).append("Assertion failure in GestureRecorder: event downTime (").append(motionevent.getDownTime()).append(") does not match gesture downTime (").append(mDownTime).append(")").toString());
            switch (motionevent.getActionMasked())
            {
            case 1: // '\001'
            case 3: // '\003'
                mComplete = true;
                return;

            case 2: // '\002'
            default:
                return;
            }
        }

        public boolean isComplete()
        {
            return mComplete;
        }

        public void tag(long l, String s, String s1)
        {
            mRecords.add(new TagRecord(l, s, s1));
            mTags.add(s);
        }

        public String toJson()
        {
            StringBuilder stringbuilder = new StringBuilder();
            boolean flag = true;
            stringbuilder.append("[");
            for (Iterator iterator = mRecords.iterator(); iterator.hasNext();)
            {
                Record record = (Record)iterator.next();
                if (!flag)
                    stringbuilder.append(", ");
                stringbuilder.append(record.toJson());
                flag = false;
            }

            stringbuilder.append("]");
            return stringbuilder.toString();
        }

        public Gesture()
        {
            this$0 = GestureRecorder.this;
            super();
            mRecords = new LinkedList();
            mTags = new HashSet();
            mDownTime = -1L;
            mComplete = false;
        }
    }

    public class Gesture.MotionEventRecord extends Gesture.Record
    {

        public MotionEvent event;
        final Gesture this$1;

        String actionName(int i)
        {
            switch (i)
            {
            case 3: // '\003'
                return "cancel";

            case 2: // '\002'
                return "move";

            case 1: // '\001'
                return "up";

            case 0: // '\0'
                return "down";
            }
            return String.valueOf(i);
        }

        public String toJson()
        {
            Object aobj[] = new Object[6];
            aobj[0] = Long.valueOf(super.time);
            aobj[1] = actionName(event.getAction());
            aobj[2] = Float.valueOf(event.getRawX());
            aobj[3] = Float.valueOf(event.getRawY());
            aobj[4] = Float.valueOf(event.getSize());
            aobj[5] = Float.valueOf(event.getPressure());
            return String.format("{\"type\":\"motion\", \"time\":%d, \"action\":\"%s\", \"x\":%.2f, \"y\":%.2f, \"s\":%.2f, \"p\":%.2f}", aobj);
        }

        public Gesture.MotionEventRecord(long l, MotionEvent motionevent)
        {
            this$1 = Gesture.this;
            super();
            super.time = l;
            event = motionevent.copy();
        }
    }

    public abstract class Gesture.Record
    {

        final Gesture this$1;
        long time;

        public abstract String toJson();

        public Gesture.Record()
        {
            this$1 = Gesture.this;
            super();
        }
    }

    public class Gesture.TagRecord extends Gesture.Record
    {

        public String info;
        public String tag;
        final Gesture this$1;

        public String toJson()
        {
            Object aobj[] = new Object[3];
            aobj[0] = Long.valueOf(super.time);
            aobj[1] = tag;
            aobj[2] = info;
            return String.format("{\"type\":\"tag\", \"time\":%d, \"tag\":\"%s\", \"info\":\"%s\"}", aobj);
        }

        public Gesture.TagRecord(long l, String s, String s1)
        {
            this$1 = Gesture.this;
            super();
            super.time = l;
            tag = s;
            info = s1;
        }
    }


    public static final boolean DEBUG = true;
    static final long SAVE_DELAY = 5000L;
    static final int SAVE_MESSAGE = 6351;
    public static final String TAG = com/android/systemui/statusbar/GestureRecorder.getSimpleName();
    private Gesture mCurrentGesture;
    private LinkedList mGestures;
    private Handler mHandler;
    private int mLastSaveLen;
    private String mLogfile;

    public GestureRecorder(String s)
    {
        mLastSaveLen = -1;
        mHandler = new Handler() {

            final GestureRecorder this$0;

            public void handleMessage(Message message)
            {
                if (message.what == 6351)
                    save();
            }

            
            {
                this$0 = GestureRecorder.this;
                super();
            }
        }
;
        mLogfile = s;
        mGestures = new LinkedList();
        mCurrentGesture = null;
    }

    public void add(MotionEvent motionevent)
    {
        synchronized (mGestures)
        {
            if (mCurrentGesture == null || mCurrentGesture.isComplete())
            {
                mCurrentGesture = new Gesture();
                mGestures.add(mCurrentGesture);
            }
            mCurrentGesture.add(motionevent);
        }
        saveLater();
        return;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        save();
        if (mLastSaveLen >= 0)
        {
            printwriter.println((new StringBuilder()).append(String.valueOf(mLastSaveLen)).append(" gestures written to ").append(mLogfile).toString());
            return;
        } else
        {
            printwriter.println("error writing gestures");
            return;
        }
    }

    public void save()
    {
        LinkedList linkedlist = mGestures;
        linkedlist;
        JVM INSTR monitorenter ;
        BufferedWriter bufferedwriter = new BufferedWriter(new FileWriter(mLogfile, true));
        bufferedwriter.append((new StringBuilder()).append(toJsonLocked()).append("\n").toString());
        bufferedwriter.close();
        mGestures.clear();
        if (mCurrentGesture != null && !mCurrentGesture.isComplete())
            mGestures.add(mCurrentGesture);
        String s1 = TAG;
        Object aobj1[] = new Object[2];
        aobj1[0] = Integer.valueOf(mLastSaveLen);
        aobj1[1] = mLogfile;
        Slog.v(s1, String.format("Wrote %d complete gestures to %s", aobj1));
_L1:
        return;
        IOException ioexception;
        ioexception;
        String s = TAG;
        Object aobj[] = new Object[1];
        aobj[0] = mLogfile;
        Slog.e(s, String.format("Couldn't write gestures to %s", aobj), ioexception);
        mLastSaveLen = -1;
          goto _L1
        Exception exception;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void saveLater()
    {
        mHandler.removeMessages(6351);
        mHandler.sendEmptyMessageDelayed(6351, 5000L);
    }

    public void tag(long l, String s)
    {
        tag(l, s, null);
    }

    public void tag(long l, String s, String s1)
    {
        synchronized (mGestures)
        {
            if (mCurrentGesture == null)
            {
                mCurrentGesture = new Gesture();
                mGestures.add(mCurrentGesture);
            }
            mCurrentGesture.tag(l, s, s1);
        }
        saveLater();
        return;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void tag(String s)
    {
        tag(SystemClock.uptimeMillis(), s, null);
    }

    public void tag(String s, String s1)
    {
        tag(SystemClock.uptimeMillis(), s, s1);
    }

    public String toJson()
    {
        String s;
        synchronized (mGestures)
        {
            s = toJsonLocked();
        }
        return s;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public String toJsonLocked()
    {
        StringBuilder stringbuilder = new StringBuilder();
        boolean flag = true;
        stringbuilder.append("[");
        int i = 0;
        Iterator iterator = mGestures.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Gesture gesture = (Gesture)iterator.next();
            if (gesture.isComplete())
            {
                if (!flag)
                    stringbuilder.append(",");
                stringbuilder.append(gesture.toJson());
                i++;
                flag = false;
            }
        } while (true);
        mLastSaveLen = i;
        stringbuilder.append("]");
        return stringbuilder.toString();
    }

}
