// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package android.view.accessibility:
//            AccessibilityRecord

public final class AccessibilityEvent extends AccessibilityRecord
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public AccessibilityEvent createFromParcel(Parcel parcel)
        {
            AccessibilityEvent accessibilityevent = AccessibilityEvent.obtain();
            accessibilityevent.initFromParcel(parcel);
            return accessibilityevent;
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public AccessibilityEvent[] newArray(int i)
        {
            return new AccessibilityEvent[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final boolean DEBUG = false;
    public static final int INVALID_POSITION = -1;
    private static final int MAX_POOL_SIZE = 10;
    public static final int MAX_TEXT_LENGTH = 500;
    public static final int TYPES_ALL_MASK = -1;
    public static final int TYPE_ANNOUNCEMENT = 16384;
    public static final int TYPE_GESTURE_DETECTION_END = 0x80000;
    public static final int TYPE_GESTURE_DETECTION_START = 0x40000;
    public static final int TYPE_NOTIFICATION_STATE_CHANGED = 64;
    public static final int TYPE_TOUCH_EXPLORATION_GESTURE_END = 1024;
    public static final int TYPE_TOUCH_EXPLORATION_GESTURE_START = 512;
    public static final int TYPE_TOUCH_INTERACTION_END = 0x200000;
    public static final int TYPE_TOUCH_INTERACTION_START = 0x100000;
    public static final int TYPE_VIEW_ACCESSIBILITY_FOCUSED = 32768;
    public static final int TYPE_VIEW_ACCESSIBILITY_FOCUS_CLEARED = 0x10000;
    public static final int TYPE_VIEW_CLICKED = 1;
    public static final int TYPE_VIEW_FOCUSED = 8;
    public static final int TYPE_VIEW_HOVER_ENTER = 128;
    public static final int TYPE_VIEW_HOVER_EXIT = 256;
    public static final int TYPE_VIEW_LONG_CLICKED = 2;
    public static final int TYPE_VIEW_SCROLLED = 4096;
    public static final int TYPE_VIEW_SELECTED = 4;
    public static final int TYPE_VIEW_TEXT_CHANGED = 16;
    public static final int TYPE_VIEW_TEXT_SELECTION_CHANGED = 8192;
    public static final int TYPE_VIEW_TEXT_TRAVERSED_AT_MOVEMENT_GRANULARITY = 0x20000;
    public static final int TYPE_WINDOW_CONTENT_CHANGED = 2048;
    public static final int TYPE_WINDOW_STATE_CHANGED = 32;
    private static AccessibilityEvent sPool;
    private static final Object sPoolLock = new Object();
    private static int sPoolSize;
    int mAction;
    private long mEventTime;
    private int mEventType;
    private boolean mIsInPool;
    int mMovementGranularity;
    private AccessibilityEvent mNext;
    private CharSequence mPackageName;
    private final ArrayList mRecords = new ArrayList();

    private AccessibilityEvent()
    {
    }

    public static String eventTypeToString(int i)
    {
        switch (i)
        {
        case 2097152: 
            return "TYPE_TOUCH_INTERACTION_END";

        case 1048576: 
            return "TYPE_TOUCH_INTERACTION_START";

        case 524288: 
            return "TYPE_GESTURE_DETECTION_END";

        case 262144: 
            return "TYPE_GESTURE_DETECTION_START";

        case 131072: 
            return "TYPE_CURRENT_AT_GRANULARITY_MOVEMENT_CHANGED";

        case 65536: 
            return "TYPE_VIEW_ACCESSIBILITY_FOCUS_CLEARED";

        case 32768: 
            return "TYPE_VIEW_ACCESSIBILITY_FOCUSED";

        case 16384: 
            return "TYPE_ANNOUNCEMENT";

        case 4096: 
            return "TYPE_VIEW_SCROLLED";

        case 8192: 
            return "TYPE_VIEW_TEXT_SELECTION_CHANGED";

        case 2048: 
            return "TYPE_WINDOW_CONTENT_CHANGED";

        case 1024: 
            return "TYPE_TOUCH_EXPLORATION_GESTURE_END";

        case 512: 
            return "TYPE_TOUCH_EXPLORATION_GESTURE_START";

        case 64: // '@'
            return "TYPE_NOTIFICATION_STATE_CHANGED";

        case 256: 
            return "TYPE_VIEW_HOVER_EXIT";

        case 128: 
            return "TYPE_VIEW_HOVER_ENTER";

        case 32: // ' '
            return "TYPE_WINDOW_STATE_CHANGED";

        case 16: // '\020'
            return "TYPE_VIEW_TEXT_CHANGED";

        case 8: // '\b'
            return "TYPE_VIEW_FOCUSED";

        case 4: // '\004'
            return "TYPE_VIEW_SELECTED";

        case 2: // '\002'
            return "TYPE_VIEW_LONG_CLICKED";

        case 1: // '\001'
            return "TYPE_VIEW_CLICKED";
        }
        return null;
    }

    public static AccessibilityEvent obtain()
    {
label0:
        {
            AccessibilityEvent accessibilityevent1;
            synchronized (sPoolLock)
            {
                if (sPool == null)
                    break label0;
                accessibilityevent1 = sPool;
                sPool = sPool.mNext;
                sPoolSize = -1 + sPoolSize;
                accessibilityevent1.mNext = null;
                accessibilityevent1.mIsInPool = false;
            }
            return accessibilityevent1;
        }
        AccessibilityEvent accessibilityevent = new AccessibilityEvent();
        obj;
        JVM INSTR monitorexit ;
        return accessibilityevent;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static AccessibilityEvent obtain(int i)
    {
        AccessibilityEvent accessibilityevent = obtain();
        accessibilityevent.setEventType(i);
        return accessibilityevent;
    }

    public static AccessibilityEvent obtain(AccessibilityEvent accessibilityevent)
    {
        AccessibilityEvent accessibilityevent1 = obtain();
        accessibilityevent1.init(accessibilityevent);
        int i = accessibilityevent.mRecords.size();
        for (int j = 0; j < i; j++)
        {
            AccessibilityRecord accessibilityrecord = AccessibilityRecord.obtain((AccessibilityRecord)accessibilityevent.mRecords.get(j));
            accessibilityevent1.mRecords.add(accessibilityrecord);
        }

        return accessibilityevent1;
    }

    private void readAccessibilityRecordFromParcel(AccessibilityRecord accessibilityrecord, Parcel parcel)
    {
        accessibilityrecord.mBooleanProperties = parcel.readInt();
        accessibilityrecord.mCurrentItemIndex = parcel.readInt();
        accessibilityrecord.mItemCount = parcel.readInt();
        accessibilityrecord.mFromIndex = parcel.readInt();
        accessibilityrecord.mToIndex = parcel.readInt();
        accessibilityrecord.mScrollX = parcel.readInt();
        accessibilityrecord.mScrollY = parcel.readInt();
        accessibilityrecord.mMaxScrollX = parcel.readInt();
        accessibilityrecord.mMaxScrollY = parcel.readInt();
        accessibilityrecord.mAddedCount = parcel.readInt();
        accessibilityrecord.mRemovedCount = parcel.readInt();
        accessibilityrecord.mClassName = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        accessibilityrecord.mContentDescription = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        accessibilityrecord.mBeforeText = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        accessibilityrecord.mParcelableData = parcel.readParcelable(null);
        parcel.readList(accessibilityrecord.mText, null);
        accessibilityrecord.mSourceWindowId = parcel.readInt();
        accessibilityrecord.mSourceNodeId = parcel.readLong();
        boolean flag;
        if (parcel.readInt() == 1)
            flag = true;
        else
            flag = false;
        accessibilityrecord.mSealed = flag;
    }

    private void writeAccessibilityRecordToParcel(AccessibilityRecord accessibilityrecord, Parcel parcel, int i)
    {
        parcel.writeInt(accessibilityrecord.mBooleanProperties);
        parcel.writeInt(accessibilityrecord.mCurrentItemIndex);
        parcel.writeInt(accessibilityrecord.mItemCount);
        parcel.writeInt(accessibilityrecord.mFromIndex);
        parcel.writeInt(accessibilityrecord.mToIndex);
        parcel.writeInt(accessibilityrecord.mScrollX);
        parcel.writeInt(accessibilityrecord.mScrollY);
        parcel.writeInt(accessibilityrecord.mMaxScrollX);
        parcel.writeInt(accessibilityrecord.mMaxScrollY);
        parcel.writeInt(accessibilityrecord.mAddedCount);
        parcel.writeInt(accessibilityrecord.mRemovedCount);
        TextUtils.writeToParcel(accessibilityrecord.mClassName, parcel, i);
        TextUtils.writeToParcel(accessibilityrecord.mContentDescription, parcel, i);
        TextUtils.writeToParcel(accessibilityrecord.mBeforeText, parcel, i);
        parcel.writeParcelable(accessibilityrecord.mParcelableData, i);
        parcel.writeList(accessibilityrecord.mText);
        parcel.writeInt(accessibilityrecord.mSourceWindowId);
        parcel.writeLong(accessibilityrecord.mSourceNodeId);
        int j;
        if (accessibilityrecord.mSealed)
            j = 1;
        else
            j = 0;
        parcel.writeInt(j);
    }

    public void appendRecord(AccessibilityRecord accessibilityrecord)
    {
        enforceNotSealed();
        mRecords.add(accessibilityrecord);
    }

    protected void clear()
    {
        super.clear();
        mEventType = 0;
        mMovementGranularity = 0;
        mAction = 0;
        mPackageName = null;
        mEventTime = 0L;
        for (; !mRecords.isEmpty(); ((AccessibilityRecord)mRecords.remove(0)).recycle());
    }

    public int describeContents()
    {
        return 0;
    }

    public int getAction()
    {
        return mAction;
    }

    public long getEventTime()
    {
        return mEventTime;
    }

    public int getEventType()
    {
        return mEventType;
    }

    public int getMovementGranularity()
    {
        return mMovementGranularity;
    }

    public CharSequence getPackageName()
    {
        return mPackageName;
    }

    public AccessibilityRecord getRecord(int i)
    {
        return (AccessibilityRecord)mRecords.get(i);
    }

    public int getRecordCount()
    {
        return mRecords.size();
    }

    void init(AccessibilityEvent accessibilityevent)
    {
        super.init(accessibilityevent);
        mEventType = accessibilityevent.mEventType;
        mMovementGranularity = accessibilityevent.mMovementGranularity;
        mAction = accessibilityevent.mAction;
        mEventTime = accessibilityevent.mEventTime;
        mPackageName = accessibilityevent.mPackageName;
    }

    public void initFromParcel(Parcel parcel)
    {
        boolean flag = true;
        if (parcel.readInt() != flag)
            flag = false;
        super.mSealed = flag;
        mEventType = parcel.readInt();
        mMovementGranularity = parcel.readInt();
        mAction = parcel.readInt();
        mPackageName = (CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
        mEventTime = parcel.readLong();
        super.mConnectionId = parcel.readInt();
        readAccessibilityRecordFromParcel(this, parcel);
        int i = parcel.readInt();
        for (int j = 0; j < i; j++)
        {
            AccessibilityRecord accessibilityrecord = AccessibilityRecord.obtain();
            readAccessibilityRecordFromParcel(accessibilityrecord, parcel);
            accessibilityrecord.mConnectionId = super.mConnectionId;
            mRecords.add(accessibilityrecord);
        }

    }

    public void recycle()
    {
        if (mIsInPool)
            throw new IllegalStateException("Event already recycled!");
        clear();
        synchronized (sPoolLock)
        {
            if (sPoolSize <= 10)
            {
                mNext = sPool;
                sPool = this;
                mIsInPool = true;
                sPoolSize = 1 + sPoolSize;
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setAction(int i)
    {
        enforceNotSealed();
        mAction = i;
    }

    public void setEventTime(long l)
    {
        enforceNotSealed();
        mEventTime = l;
    }

    public void setEventType(int i)
    {
        enforceNotSealed();
        mEventType = i;
    }

    public void setMovementGranularity(int i)
    {
        enforceNotSealed();
        mMovementGranularity = i;
    }

    public void setPackageName(CharSequence charsequence)
    {
        enforceNotSealed();
        mPackageName = charsequence;
    }

    public void setSealed(boolean flag)
    {
        super.setSealed(flag);
        ArrayList arraylist = mRecords;
        int i = arraylist.size();
        for (int j = 0; j < i; j++)
            ((AccessibilityRecord)arraylist.get(j)).setSealed(flag);

    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("EventType: ").append(eventTypeToString(mEventType));
        stringbuilder.append("; EventTime: ").append(mEventTime);
        stringbuilder.append("; PackageName: ").append(mPackageName);
        stringbuilder.append("; MovementGranularity: ").append(mMovementGranularity);
        stringbuilder.append("; Action: ").append(mAction);
        stringbuilder.append(super.toString());
        stringbuilder.append("; recordCount: ").append(getRecordCount());
        return stringbuilder.toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        int j;
        if (isSealed())
            j = 1;
        else
            j = 0;
        parcel.writeInt(j);
        parcel.writeInt(mEventType);
        parcel.writeInt(mMovementGranularity);
        parcel.writeInt(mAction);
        TextUtils.writeToParcel(mPackageName, parcel, 0);
        parcel.writeLong(mEventTime);
        parcel.writeInt(super.mConnectionId);
        writeAccessibilityRecordToParcel(this, parcel, i);
        int k = getRecordCount();
        parcel.writeInt(k);
        for (int l = 0; l < k; l++)
            writeAccessibilityRecordToParcel((AccessibilityRecord)mRecords.get(l), parcel, i);

    }

}
