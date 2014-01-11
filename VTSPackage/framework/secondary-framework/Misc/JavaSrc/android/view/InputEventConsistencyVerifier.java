// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.app.ActivityManager;
import android.os.Build;
import android.util.Log;

// Referenced classes of package android.view:
//            InputEvent, MotionEvent, KeyEvent

public final class InputEventConsistencyVerifier
{
    private static final class KeyState
    {

        private static KeyState mRecycledList;
        private static Object mRecycledListLock = new Object();
        public int deviceId;
        public int keyCode;
        public KeyState next;
        public int source;
        public boolean unhandled;

        public static KeyState obtain(int i, int j, int k)
        {
            Object obj = mRecycledListLock;
            obj;
            JVM INSTR monitorenter ;
            KeyState keystate = mRecycledList;
            if (keystate == null)
                break MISSING_BLOCK_LABEL_53;
            mRecycledList = keystate.next;
_L1:
            obj;
            JVM INSTR monitorexit ;
            keystate.deviceId = i;
            keystate.source = j;
            keystate.keyCode = k;
            keystate.unhandled = false;
            return keystate;
            keystate = new KeyState();
              goto _L1
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void recycle()
        {
            synchronized (mRecycledListLock)
            {
                next = mRecycledList;
                mRecycledList = next;
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }


        private KeyState()
        {
        }
    }


    private static final String EVENT_TYPE_GENERIC_MOTION = "GenericMotionEvent";
    private static final String EVENT_TYPE_KEY = "KeyEvent";
    private static final String EVENT_TYPE_TOUCH = "TouchEvent";
    private static final String EVENT_TYPE_TRACKBALL = "TrackballEvent";
    public static final int FLAG_RAW_DEVICE_INPUT = 1;
    private static final boolean IS_ENG_BUILD = false;
    private static final int RECENT_EVENTS_TO_LOG = 5;
    private static boolean mGotMonkeySettings = false;
    private static boolean mIsRunningMonkey = false;
    private final Object mCaller;
    private InputEvent mCurrentEvent;
    private String mCurrentEventType;
    private final int mFlags;
    private boolean mHoverEntered;
    private KeyState mKeyStateList;
    private int mLastEventSeq;
    private String mLastEventType;
    private int mLastNestingLevel;
    private final String mLogTag;
    private int mMostRecentEventIndex;
    private InputEvent mRecentEvents[];
    private boolean mRecentEventsUnhandled[];
    private int mTouchEventStreamDeviceId;
    private boolean mTouchEventStreamIsTainted;
    private int mTouchEventStreamPointers;
    private int mTouchEventStreamSource;
    private boolean mTouchEventStreamUnhandled;
    private boolean mTrackballDown;
    private boolean mTrackballUnhandled;
    private StringBuilder mViolationMessage;

    public InputEventConsistencyVerifier(Object obj, int i)
    {
        this(obj, i, android/view/InputEventConsistencyVerifier.getSimpleName());
    }

    public InputEventConsistencyVerifier(Object obj, int i, String s)
    {
        mTouchEventStreamDeviceId = -1;
        mCaller = obj;
        mFlags = i;
        if (s == null)
            s = "InputEventConsistencyVerifier";
        mLogTag = s;
        if (!mGotMonkeySettings)
        {
            mIsRunningMonkey = ActivityManager.isUserAMonkey();
            mGotMonkeySettings = true;
        }
    }

    private void addKeyState(int i, int j, int k)
    {
        KeyState keystate = KeyState.obtain(i, j, k);
        keystate.next = mKeyStateList;
        mKeyStateList = keystate;
    }

    private static void appendEvent(StringBuilder stringbuilder, int i, InputEvent inputevent, boolean flag)
    {
        stringbuilder.append(i).append(": sent at ").append(inputevent.getEventTimeNano());
        stringbuilder.append(", ");
        if (flag)
            stringbuilder.append("(unhandled) ");
        stringbuilder.append(inputevent);
    }

    private void ensureHistorySizeIsZeroForThisAction(MotionEvent motionevent)
    {
        int i = motionevent.getHistorySize();
        if (i != 0)
            problem((new StringBuilder()).append("History size is ").append(i).append(" but it should always be 0 for ").append(MotionEvent.actionToString(motionevent.getAction())).toString());
    }

    private void ensureMetaStateIsNormalized(int i)
    {
        int j = KeyEvent.normalizeMetaState(i);
        if (j != i)
        {
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(i);
            aobj[1] = Integer.valueOf(j);
            problem(String.format("Metastate not normalized.  Was 0x%08x but expected 0x%08x.", aobj));
        }
    }

    private void ensurePointerCountIsOneForThisAction(MotionEvent motionevent)
    {
        int i = motionevent.getPointerCount();
        if (i != 1)
            problem((new StringBuilder()).append("Pointer count is ").append(i).append(" but it should always be 1 for ").append(MotionEvent.actionToString(motionevent.getAction())).toString());
    }

    private KeyState findKeyState(int i, int j, int k, boolean flag)
    {
        KeyState keystate = null;
        for (KeyState keystate1 = mKeyStateList; keystate1 != null; keystate1 = keystate1.next)
        {
            if (keystate1.deviceId == i && keystate1.source == j && keystate1.keyCode == k)
            {
                if (flag)
                {
                    if (keystate != null)
                        keystate.next = keystate1.next;
                    else
                        mKeyStateList = keystate1.next;
                    keystate1.next = null;
                }
                return keystate1;
            }
            keystate = keystate1;
        }

        return null;
    }

    private void finishEvent()
    {
        if (mViolationMessage != null && mViolationMessage.length() != 0)
        {
            if (!mCurrentEvent.isTainted())
            {
                mViolationMessage.append("\n  in ").append(mCaller);
                mViolationMessage.append("\n  ");
                appendEvent(mViolationMessage, 0, mCurrentEvent, false);
                if (mRecentEvents != null && !mIsRunningMonkey)
                {
                    mViolationMessage.append("\n  -- recent events --");
                    int j = 0;
                    do
                    {
                        if (j >= 5)
                            break;
                        int k = ((5 + mMostRecentEventIndex) - j) % 5;
                        InputEvent inputevent = mRecentEvents[k];
                        if (inputevent == null)
                            break;
                        mViolationMessage.append("\n  ");
                        appendEvent(mViolationMessage, j + 1, inputevent, mRecentEventsUnhandled[k]);
                        j++;
                    } while (true);
                }
                Log.d(mLogTag, mViolationMessage.toString());
                mCurrentEvent.setTainted(true);
            }
            mViolationMessage.setLength(0);
        }
        if (!mIsRunningMonkey)
        {
            if (mRecentEvents == null)
            {
                mRecentEvents = new InputEvent[5];
                mRecentEventsUnhandled = new boolean[5];
            }
            int i = (1 + mMostRecentEventIndex) % 5;
            mMostRecentEventIndex = i;
            if (mRecentEvents[i] != null)
                mRecentEvents[i].recycle();
            mRecentEvents[i] = mCurrentEvent.copy();
            mRecentEventsUnhandled[i] = false;
        }
        mCurrentEvent = null;
        mCurrentEventType = null;
    }

    public static boolean isInstrumentationEnabled()
    {
        return IS_ENG_BUILD;
    }

    private void problem(String s)
    {
        if (mViolationMessage == null)
            mViolationMessage = new StringBuilder();
        if (mViolationMessage.length() == 0)
            mViolationMessage.append(mCurrentEventType).append(": ");
        else
            mViolationMessage.append("\n  ");
        mViolationMessage.append(s);
    }

    private boolean startEvent(InputEvent inputevent, int i, String s)
    {
        int j = inputevent.getSequenceNumber();
        if (j == mLastEventSeq && i < mLastNestingLevel && s == mLastEventType)
            return false;
        if (i > 0)
        {
            mLastEventSeq = j;
            mLastEventType = s;
            mLastNestingLevel = i;
        } else
        {
            mLastEventSeq = -1;
            mLastEventType = null;
            mLastNestingLevel = 0;
        }
        mCurrentEvent = inputevent;
        mCurrentEventType = s;
        return true;
    }

    public void onGenericMotionEvent(MotionEvent motionevent, int i)
    {
        if (!startEvent(motionevent, i, "GenericMotionEvent"))
            return;
        int j;
        int k;
        ensureMetaStateIsNormalized(motionevent.getMetaState());
        j = motionevent.getAction();
        k = motionevent.getSource();
        if ((k & 2) == 0) goto _L2; else goto _L1
_L1:
        j;
        JVM INSTR tableswitch 7 10: default 72
    //                   7 104
    //                   8 139
    //                   9 84
    //                   10 112;
           goto _L3 _L4 _L5 _L6 _L7
_L3:
        problem("Invalid action for generic pointer event.");
_L8:
        finishEvent();
        return;
_L6:
        ensurePointerCountIsOneForThisAction(motionevent);
        mHoverEntered = true;
          goto _L8
        Exception exception;
        exception;
        finishEvent();
        throw exception;
_L4:
        ensurePointerCountIsOneForThisAction(motionevent);
          goto _L8
_L7:
        ensurePointerCountIsOneForThisAction(motionevent);
        if (!mHoverEntered)
            problem("ACTION_HOVER_EXIT without prior ACTION_HOVER_ENTER");
        mHoverEntered = false;
          goto _L8
_L5:
        ensureHistorySizeIsZeroForThisAction(motionevent);
        ensurePointerCountIsOneForThisAction(motionevent);
          goto _L8
_L10:
        problem("Invalid action for generic joystick event.");
          goto _L8
_L11:
        ensurePointerCountIsOneForThisAction(motionevent);
          goto _L8
_L2:
        if ((k & 0x10) == 0) goto _L8; else goto _L9
_L9:
        j;
        JVM INSTR tableswitch 2 2: default 152
    //                   2 162;
           goto _L10 _L11
    }

    public void onInputEvent(InputEvent inputevent, int i)
    {
        if (inputevent instanceof KeyEvent)
        {
            onKeyEvent((KeyEvent)inputevent, i);
            return;
        }
        MotionEvent motionevent = (MotionEvent)inputevent;
        if (motionevent.isTouchEvent())
        {
            onTouchEvent(motionevent, i);
            return;
        }
        if ((4 & motionevent.getSource()) != 0)
        {
            onTrackballEvent(motionevent, i);
            return;
        } else
        {
            onGenericMotionEvent(motionevent, i);
            return;
        }
    }

    public void onKeyEvent(KeyEvent keyevent, int i)
    {
        if (!startEvent(keyevent, i, "KeyEvent"))
            return;
        int j;
        int k;
        int l;
        int i1;
        ensureMetaStateIsNormalized(keyevent.getMetaState());
        j = keyevent.getAction();
        k = keyevent.getDeviceId();
        l = keyevent.getSource();
        i1 = keyevent.getKeyCode();
        j;
        JVM INSTR tableswitch 0 2: default 72
    //                   0 111
    //                   1 192
    //                   2 106;
           goto _L1 _L2 _L3 _L4
_L1:
        problem((new StringBuilder()).append("Invalid action ").append(KeyEvent.actionToString(j)).append(" for key event.").toString());
_L4:
        finishEvent();
        return;
_L2:
        KeyState keystate1 = findKeyState(k, l, i1, false);
        if (keystate1 == null) goto _L6; else goto _L5
_L5:
        if (!keystate1.unhandled) goto _L8; else goto _L7
_L7:
        keystate1.unhandled = false;
          goto _L4
        Exception exception;
        exception;
        finishEvent();
        throw exception;
_L8:
        if ((1 & mFlags) != 0 || keyevent.getRepeatCount() != 0) goto _L4; else goto _L9
_L9:
        problem("ACTION_DOWN but key is already down and this event is not a key repeat.");
          goto _L4
_L6:
        addKeyState(k, l, i1);
          goto _L4
_L3:
        KeyState keystate = findKeyState(k, l, i1, true);
        if (keystate != null) goto _L11; else goto _L10
_L10:
        problem("ACTION_UP but key was not down.");
          goto _L4
_L11:
        keystate.recycle();
          goto _L4
    }

    public void onTouchEvent(MotionEvent motionevent, int i)
    {
        int j;
        int i1;
        int k1;
        int l1;
        if (!startEvent(motionevent, i, "TouchEvent"))
            return;
        j = motionevent.getAction();
        boolean flag;
        int k;
        int l;
        if (j == 0 || j == 3 || j == 4)
            flag = true;
        else
            flag = false;
        if (flag && (mTouchEventStreamIsTainted || mTouchEventStreamUnhandled))
        {
            mTouchEventStreamIsTainted = false;
            mTouchEventStreamUnhandled = false;
            mTouchEventStreamPointers = 0;
        }
        if (mTouchEventStreamIsTainted)
            motionevent.setTainted(true);
        ensureMetaStateIsNormalized(motionevent.getMetaState());
        k = motionevent.getDeviceId();
        l = motionevent.getSource();
        if (flag)
            break MISSING_BLOCK_LABEL_199;
        if (mTouchEventStreamDeviceId != -1 && (mTouchEventStreamDeviceId != k || mTouchEventStreamSource != l))
            problem((new StringBuilder()).append("Touch event stream contains events from multiple sources: previous device id ").append(mTouchEventStreamDeviceId).append(", previous source ").append(Integer.toHexString(mTouchEventStreamSource)).append(", new device id ").append(k).append(", new source ").append(Integer.toHexString(l)).toString());
        mTouchEventStreamDeviceId = k;
        mTouchEventStreamSource = l;
        i1 = motionevent.getPointerCount();
        if ((l & 2) == 0) goto _L2; else goto _L1
_L1:
        j;
        JVM INSTR tableswitch 0 4: default 260
    //                   0 363
    //                   1 410
    //                   2 433
    //                   3 499
    //                   4 512;
           goto _L3 _L4 _L5 _L6 _L7 _L8
_L3:
        k1 = motionevent.getActionMasked();
        l1 = motionevent.getActionIndex();
        if (k1 != 5) goto _L10; else goto _L9
_L9:
        if (mTouchEventStreamPointers == 0)
        {
            problem("ACTION_POINTER_DOWN but no other pointers were down.");
            mTouchEventStreamIsTainted = true;
        }
          goto _L11
_L16:
        problem((new StringBuilder()).append("ACTION_POINTER_DOWN index is ").append(l1).append(" but the pointer count is ").append(i1).append(".").toString());
        mTouchEventStreamIsTainted = true;
_L14:
        ensureHistorySizeIsZeroForThisAction(motionevent);
_L12:
        finishEvent();
        return;
_L4:
        if (mTouchEventStreamPointers != 0)
            problem("ACTION_DOWN but pointers are already down.  Probably missing ACTION_UP from previous gesture.");
        ensureHistorySizeIsZeroForThisAction(motionevent);
        ensurePointerCountIsOneForThisAction(motionevent);
        mTouchEventStreamPointers = 1 << motionevent.getPointerId(0);
          goto _L12
        Exception exception;
        exception;
        finishEvent();
        throw exception;
_L5:
        ensureHistorySizeIsZeroForThisAction(motionevent);
        ensurePointerCountIsOneForThisAction(motionevent);
        mTouchEventStreamPointers = 0;
        mTouchEventStreamIsTainted = false;
          goto _L12
_L6:
        int j1 = Integer.bitCount(mTouchEventStreamPointers);
        if (i1 == j1) goto _L12; else goto _L13
_L13:
        problem((new StringBuilder()).append("ACTION_MOVE contained ").append(i1).append(" pointers but there are currently ").append(j1).append(" pointers down.").toString());
        mTouchEventStreamIsTainted = true;
          goto _L12
_L7:
        mTouchEventStreamPointers = 0;
        mTouchEventStreamIsTainted = false;
          goto _L12
_L8:
        if (mTouchEventStreamPointers != 0)
            problem("ACTION_OUTSIDE but pointers are still down.");
        ensureHistorySizeIsZeroForThisAction(motionevent);
        ensurePointerCountIsOneForThisAction(motionevent);
        mTouchEventStreamIsTainted = false;
          goto _L12
_L17:
        int i2 = motionevent.getPointerId(l1);
        int j2 = 1 << i2;
label0:
        {
            if ((j2 & mTouchEventStreamPointers) == 0)
                break label0;
            problem((new StringBuilder()).append("ACTION_POINTER_DOWN specified pointer id ").append(i2).append(" which is already down.").toString());
            mTouchEventStreamIsTainted = true;
        }
          goto _L14
        mTouchEventStreamPointers = j2 | mTouchEventStreamPointers;
          goto _L14
_L20:
        problem((new StringBuilder()).append("ACTION_POINTER_UP index is ").append(l1).append(" but the pointer count is ").append(i1).append(".").toString());
        mTouchEventStreamIsTainted = true;
_L15:
        ensureHistorySizeIsZeroForThisAction(motionevent);
          goto _L12
_L21:
        int k2 = motionevent.getPointerId(l1);
        int l2 = 1 << k2;
label1:
        {
            if ((l2 & mTouchEventStreamPointers) != 0)
                break label1;
            problem((new StringBuilder()).append("ACTION_POINTER_UP specified pointer id ").append(k2).append(" which is not currently down.").toString());
            mTouchEventStreamIsTainted = true;
        }
          goto _L15
        mTouchEventStreamPointers = mTouchEventStreamPointers & ~l2;
          goto _L15
_L19:
        problem((new StringBuilder()).append("Invalid action ").append(MotionEvent.actionToString(j)).append(" for touch event.").toString());
          goto _L12
_L2:
        problem("Source was not SOURCE_CLASS_POINTER.");
          goto _L12
_L11:
        if (l1 >= 0 && l1 < i1) goto _L17; else goto _L16
_L10:
        if (k1 != 6) goto _L19; else goto _L18
_L18:
        if (l1 >= 0 && l1 < i1) goto _L21; else goto _L20
    }

    public void onTrackballEvent(MotionEvent motionevent, int i)
    {
        if (!startEvent(motionevent, i, "TrackballEvent"))
            return;
        int j;
        ensureMetaStateIsNormalized(motionevent.getMetaState());
        j = motionevent.getAction();
        if ((4 & motionevent.getSource()) == 0) goto _L2; else goto _L1
_L1:
        j;
        JVM INSTR tableswitch 0 2: default 64
    //                   0 126
    //                   1 180
    //                   2 220;
           goto _L3 _L4 _L5 _L6
_L3:
        problem((new StringBuilder()).append("Invalid action ").append(MotionEvent.actionToString(j)).append(" for trackball event.").toString());
_L11:
        if (!mTrackballDown || motionevent.getPressure() > 0.0F) goto _L8; else goto _L7
_L7:
        problem("Trackball is down but pressure is not greater than 0.");
_L17:
        finishEvent();
        return;
_L4:
        if (!mTrackballDown || mTrackballUnhandled) goto _L10; else goto _L9
_L9:
        problem("ACTION_DOWN but trackball is already down.");
_L12:
        ensureHistorySizeIsZeroForThisAction(motionevent);
        ensurePointerCountIsOneForThisAction(motionevent);
          goto _L11
        Exception exception;
        exception;
        finishEvent();
        throw exception;
_L10:
        mTrackballDown = true;
        mTrackballUnhandled = false;
          goto _L12
_L5:
        if (mTrackballDown) goto _L14; else goto _L13
_L13:
        problem("ACTION_UP but trackball is not down.");
_L15:
        ensureHistorySizeIsZeroForThisAction(motionevent);
        ensurePointerCountIsOneForThisAction(motionevent);
          goto _L11
_L14:
        mTrackballDown = false;
        mTrackballUnhandled = false;
          goto _L15
_L6:
        ensurePointerCountIsOneForThisAction(motionevent);
          goto _L11
_L8:
        if (mTrackballDown || motionevent.getPressure() == 0.0F) goto _L17; else goto _L16
_L16:
        problem("Trackball is up but pressure is not equal to 0.");
          goto _L17
_L2:
        problem("Source was not SOURCE_CLASS_TRACKBALL.");
          goto _L17
    }

    public void onUnhandledEvent(InputEvent inputevent, int i)
    {
        if (i == mLastNestingLevel)
        {
            if (mRecentEventsUnhandled != null)
                mRecentEventsUnhandled[mMostRecentEventIndex] = true;
            if (inputevent instanceof KeyEvent)
            {
                KeyEvent keyevent = (KeyEvent)inputevent;
                KeyState keystate = findKeyState(keyevent.getDeviceId(), keyevent.getSource(), keyevent.getKeyCode(), false);
                if (keystate != null)
                {
                    keystate.unhandled = true;
                    return;
                }
            } else
            {
                MotionEvent motionevent = (MotionEvent)inputevent;
                if (motionevent.isTouchEvent())
                {
                    mTouchEventStreamUnhandled = true;
                    return;
                }
                if ((4 & motionevent.getSource()) != 0 && mTrackballDown)
                {
                    mTrackballUnhandled = true;
                    return;
                }
            }
        }
    }

    public void reset()
    {
        mLastEventSeq = -1;
        mLastNestingLevel = 0;
        mTrackballDown = false;
        mTrackballUnhandled = false;
        mTouchEventStreamPointers = 0;
        mTouchEventStreamIsTainted = false;
        mTouchEventStreamUnhandled = false;
        mHoverEntered = false;
        while (mKeyStateList != null) 
        {
            KeyState keystate = mKeyStateList;
            mKeyStateList = keystate.next;
            keystate.recycle();
        }
    }

    static 
    {
        IS_ENG_BUILD = "eng".equals(Build.TYPE);
    }
}
