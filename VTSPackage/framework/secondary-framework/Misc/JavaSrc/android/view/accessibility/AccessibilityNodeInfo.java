// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.accessibility;

import android.graphics.Rect;
import android.os.*;
import android.util.SparseLongArray;
import android.view.View;
import java.util.Collections;
import java.util.List;

// Referenced classes of package android.view.accessibility:
//            AccessibilityInteractionClient

public class AccessibilityNodeInfo
    implements Parcelable
{

    public static final int ACTION_ACCESSIBILITY_FOCUS = 64;
    public static final String ACTION_ARGUMENT_HTML_ELEMENT_STRING = "ACTION_ARGUMENT_HTML_ELEMENT_STRING";
    public static final String ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT = "ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT";
    public static final int ACTION_CLEAR_ACCESSIBILITY_FOCUS = 128;
    public static final int ACTION_CLEAR_FOCUS = 2;
    public static final int ACTION_CLEAR_SELECTION = 8;
    public static final int ACTION_CLICK = 16;
    public static final int ACTION_FOCUS = 1;
    public static final int ACTION_LONG_CLICK = 32;
    public static final int ACTION_NEXT_AT_MOVEMENT_GRANULARITY = 256;
    public static final int ACTION_NEXT_HTML_ELEMENT = 1024;
    public static final int ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY = 512;
    public static final int ACTION_PREVIOUS_HTML_ELEMENT = 2048;
    public static final int ACTION_SCROLL_BACKWARD = 8192;
    public static final int ACTION_SCROLL_FORWARD = 4096;
    public static final int ACTION_SELECT = 4;
    public static final int ACTIVE_WINDOW_ID = -1;
    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public AccessibilityNodeInfo createFromParcel(Parcel parcel)
        {
            AccessibilityNodeInfo accessibilitynodeinfo = AccessibilityNodeInfo.obtain();
            accessibilitynodeinfo.initFromParcel(parcel);
            return accessibilitynodeinfo;
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public AccessibilityNodeInfo[] newArray(int i)
        {
            return new AccessibilityNodeInfo[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final boolean DEBUG = false;
    public static final int FLAG_PREFETCH_DESCENDANTS = 4;
    public static final int FLAG_PREFETCH_PREDECESSORS = 1;
    public static final int FLAG_PREFETCH_SIBLINGS = 2;
    public static final int FOCUS_ACCESSIBILITY = 2;
    public static final int FOCUS_INPUT = 1;
    public static final int INCLUDE_NOT_IMPORTANT_VIEWS = 8;
    private static final int MAX_POOL_SIZE = 50;
    public static final int MOVEMENT_GRANULARITY_CHARACTER = 1;
    public static final int MOVEMENT_GRANULARITY_LINE = 4;
    public static final int MOVEMENT_GRANULARITY_PAGE = 16;
    public static final int MOVEMENT_GRANULARITY_PARAGRAPH = 8;
    public static final int MOVEMENT_GRANULARITY_WORD = 2;
    private static final int PROPERTY_ACCESSIBILITY_FOCUSED = 1024;
    private static final int PROPERTY_CHECKABLE = 1;
    private static final int PROPERTY_CHECKED = 2;
    private static final int PROPERTY_CLICKABLE = 32;
    private static final int PROPERTY_ENABLED = 128;
    private static final int PROPERTY_FOCUSABLE = 4;
    private static final int PROPERTY_FOCUSED = 8;
    private static final int PROPERTY_LONG_CLICKABLE = 64;
    private static final int PROPERTY_PASSWORD = 256;
    private static final int PROPERTY_SCROLLABLE = 512;
    private static final int PROPERTY_SELECTED = 16;
    private static final int PROPERTY_VISIBLE_TO_USER = 2048;
    public static final long ROOT_NODE_ID = makeNodeId(-1, -1);
    public static final int UNDEFINED = -1;
    private static final long VIRTUAL_DESCENDANT_ID_MASK = 0xffffffff00000000L;
    private static final int VIRTUAL_DESCENDANT_ID_SHIFT = 32;
    private static AccessibilityNodeInfo sPool;
    private static final Object sPoolLock = new Object();
    private static int sPoolSize;
    private int mActions;
    private int mBooleanProperties;
    private final Rect mBoundsInParent = new Rect();
    private final Rect mBoundsInScreen = new Rect();
    private final SparseLongArray mChildNodeIds = new SparseLongArray();
    private CharSequence mClassName;
    private int mConnectionId;
    private CharSequence mContentDescription;
    private boolean mIsInPool;
    private long mLabelForId;
    private long mLabeledById;
    private int mMovementGranularities;
    private AccessibilityNodeInfo mNext;
    private CharSequence mPackageName;
    private long mParentNodeId;
    private boolean mSealed;
    private long mSourceNodeId;
    private CharSequence mText;
    private int mWindowId;

    private AccessibilityNodeInfo()
    {
        mWindowId = -1;
        mSourceNodeId = ROOT_NODE_ID;
        mParentNodeId = ROOT_NODE_ID;
        mLabelForId = ROOT_NODE_ID;
        mLabeledById = ROOT_NODE_ID;
        mConnectionId = -1;
    }

    private boolean canPerformRequestOverConnection(long l)
    {
        return mWindowId != -1 && getAccessibilityViewId(l) != -1 && mConnectionId != -1;
    }

    private void clear()
    {
        mSealed = false;
        mSourceNodeId = ROOT_NODE_ID;
        mParentNodeId = ROOT_NODE_ID;
        mLabelForId = ROOT_NODE_ID;
        mLabeledById = ROOT_NODE_ID;
        mWindowId = -1;
        mConnectionId = -1;
        mMovementGranularities = 0;
        mChildNodeIds.clear();
        mBoundsInParent.set(0, 0, 0, 0);
        mBoundsInScreen.set(0, 0, 0, 0);
        mBooleanProperties = 0;
        mPackageName = null;
        mClassName = null;
        mText = null;
        mContentDescription = null;
        mActions = 0;
    }

    private void enforceValidFocusDirection(int i)
    {
        switch (i)
        {
        case 1: // '\001'
        case 2: // '\002'
        case 17: // '\021'
        case 33: // '!'
        case 66: // 'B'
        case 130: 
            return;
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown direction: ").append(i).toString());
    }

    private void enforceValidFocusType(int i)
    {
        switch (i)
        {
        case 1: // '\001'
        case 2: // '\002'
            return;
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown focus type: ").append(i).toString());
    }

    public static int getAccessibilityViewId(long l)
    {
        return (int)l;
    }

    private static String getActionSymbolicName(int i)
    {
        switch (i)
        {
        case 8192: 
            return "ACTION_SCROLL_BACKWARD";

        case 4096: 
            return "ACTION_SCROLL_FORWARD";

        case 2048: 
            return "ACTION_PREVIOUS_HTML_ELEMENT";

        case 1024: 
            return "ACTION_NEXT_HTML_ELEMENT";

        case 512: 
            return "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY";

        case 256: 
            return "ACTION_NEXT_AT_MOVEMENT_GRANULARITY";

        case 128: 
            return "ACTION_CLEAR_ACCESSIBILITY_FOCUS";

        case 64: // '@'
            return "ACTION_ACCESSIBILITY_FOCUS";

        case 32: // ' '
            return "ACTION_LONG_CLICK";

        case 16: // '\020'
            return "ACTION_CLICK";

        case 8: // '\b'
            return "ACTION_CLEAR_SELECTION";

        case 4: // '\004'
            return "ACTION_SELECT";

        case 2: // '\002'
            return "ACTION_CLEAR_FOCUS";

        case 1: // '\001'
            return "ACTION_FOCUS";
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown action: ").append(i).toString());
    }

    private boolean getBooleanProperty(int i)
    {
        return (i & mBooleanProperties) != 0;
    }

    private static String getMovementGranularitySymbolicName(int i)
    {
        switch (i)
        {
        case 16: // '\020'
            return "MOVEMENT_GRANULARITY_PAGE";

        case 8: // '\b'
            return "MOVEMENT_GRANULARITY_PARAGRAPH";

        case 4: // '\004'
            return "MOVEMENT_GRANULARITY_LINE";

        case 2: // '\002'
            return "MOVEMENT_GRANULARITY_WORD";

        case 1: // '\001'
            return "MOVEMENT_GRANULARITY_CHARACTER";
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown movement granularity: ").append(i).toString());
    }

    public static int getVirtualDescendantId(long l)
    {
        return (int)((0xffffffff00000000L & l) >> 32);
    }

    private void init(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        mSealed = accessibilitynodeinfo.mSealed;
        mSourceNodeId = accessibilitynodeinfo.mSourceNodeId;
        mParentNodeId = accessibilitynodeinfo.mParentNodeId;
        mLabelForId = accessibilitynodeinfo.mLabelForId;
        mLabeledById = accessibilitynodeinfo.mLabeledById;
        mWindowId = accessibilitynodeinfo.mWindowId;
        mConnectionId = accessibilitynodeinfo.mConnectionId;
        mBoundsInParent.set(accessibilitynodeinfo.mBoundsInParent);
        mBoundsInScreen.set(accessibilitynodeinfo.mBoundsInScreen);
        mPackageName = accessibilitynodeinfo.mPackageName;
        mClassName = accessibilitynodeinfo.mClassName;
        mText = accessibilitynodeinfo.mText;
        mContentDescription = accessibilitynodeinfo.mContentDescription;
        mActions = accessibilitynodeinfo.mActions;
        mBooleanProperties = accessibilitynodeinfo.mBooleanProperties;
        mMovementGranularities = accessibilitynodeinfo.mMovementGranularities;
        int i = accessibilitynodeinfo.mChildNodeIds.size();
        for (int j = 0; j < i; j++)
            mChildNodeIds.put(j, accessibilitynodeinfo.mChildNodeIds.valueAt(j));

    }

    private void initFromParcel(Parcel parcel)
    {
        boolean flag = true;
        if (parcel.readInt() != flag)
            flag = false;
        mSealed = flag;
        mSourceNodeId = parcel.readLong();
        mWindowId = parcel.readInt();
        mParentNodeId = parcel.readLong();
        mLabelForId = parcel.readLong();
        mLabeledById = parcel.readLong();
        mConnectionId = parcel.readInt();
        SparseLongArray sparselongarray = mChildNodeIds;
        int i = parcel.readInt();
        for (int j = 0; j < i; j++)
            sparselongarray.put(j, parcel.readLong());

        mBoundsInParent.top = parcel.readInt();
        mBoundsInParent.bottom = parcel.readInt();
        mBoundsInParent.left = parcel.readInt();
        mBoundsInParent.right = parcel.readInt();
        mBoundsInScreen.top = parcel.readInt();
        mBoundsInScreen.bottom = parcel.readInt();
        mBoundsInScreen.left = parcel.readInt();
        mBoundsInScreen.right = parcel.readInt();
        mActions = parcel.readInt();
        mMovementGranularities = parcel.readInt();
        mBooleanProperties = parcel.readInt();
        mPackageName = parcel.readCharSequence();
        mClassName = parcel.readCharSequence();
        mText = parcel.readCharSequence();
        mContentDescription = parcel.readCharSequence();
    }

    public static long makeNodeId(int i, int j)
    {
        return (long)j << 32 | (long)i;
    }

    public static AccessibilityNodeInfo obtain()
    {
label0:
        {
            AccessibilityNodeInfo accessibilitynodeinfo1;
            synchronized (sPoolLock)
            {
                if (sPool == null)
                    break label0;
                accessibilitynodeinfo1 = sPool;
                sPool = sPool.mNext;
                sPoolSize = -1 + sPoolSize;
                accessibilitynodeinfo1.mNext = null;
                accessibilitynodeinfo1.mIsInPool = false;
            }
            return accessibilitynodeinfo1;
        }
        AccessibilityNodeInfo accessibilitynodeinfo = new AccessibilityNodeInfo();
        obj;
        JVM INSTR monitorexit ;
        return accessibilitynodeinfo;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static AccessibilityNodeInfo obtain(View view)
    {
        AccessibilityNodeInfo accessibilitynodeinfo = obtain();
        accessibilitynodeinfo.setSource(view);
        return accessibilitynodeinfo;
    }

    public static AccessibilityNodeInfo obtain(View view, int i)
    {
        AccessibilityNodeInfo accessibilitynodeinfo = obtain();
        accessibilitynodeinfo.setSource(view, i);
        return accessibilitynodeinfo;
    }

    public static AccessibilityNodeInfo obtain(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        AccessibilityNodeInfo accessibilitynodeinfo1 = obtain();
        accessibilitynodeinfo1.init(accessibilitynodeinfo);
        return accessibilitynodeinfo1;
    }

    private void setBooleanProperty(int i, boolean flag)
    {
        enforceNotSealed();
        if (flag)
        {
            mBooleanProperties = i | mBooleanProperties;
            return;
        } else
        {
            mBooleanProperties = mBooleanProperties & ~i;
            return;
        }
    }

    public void addAction(int i)
    {
        enforceNotSealed();
        mActions = i | mActions;
    }

    public void addChild(View view)
    {
        addChild(view, -1);
    }

    public void addChild(View view, int i)
    {
        enforceNotSealed();
        int j = mChildNodeIds.size();
        int k;
        if (view != null)
            k = view.getAccessibilityViewId();
        else
            k = -1;
        long l = makeNodeId(k, i);
        mChildNodeIds.put(j, l);
    }

    public int describeContents()
    {
        return 0;
    }

    protected void enforceNotSealed()
    {
        if (isSealed())
            throw new IllegalStateException("Cannot perform this action on a sealed instance.");
        else
            return;
    }

    protected void enforceSealed()
    {
        if (!isSealed())
            throw new IllegalStateException("Cannot perform this action on a not sealed instance.");
        else
            return;
    }

    public boolean equals(Object obj)
    {
        if (this != obj)
        {
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            AccessibilityNodeInfo accessibilitynodeinfo = (AccessibilityNodeInfo)obj;
            if (mSourceNodeId != accessibilitynodeinfo.mSourceNodeId)
                return false;
            if (mWindowId != accessibilitynodeinfo.mWindowId)
                return false;
        }
        return true;
    }

    public List findAccessibilityNodeInfosByText(String s)
    {
        enforceSealed();
        if (!canPerformRequestOverConnection(mSourceNodeId))
            return Collections.emptyList();
        else
            return AccessibilityInteractionClient.getInstance().findAccessibilityNodeInfosByText(mConnectionId, mWindowId, mSourceNodeId, s);
    }

    public AccessibilityNodeInfo findFocus(int i)
    {
        enforceSealed();
        enforceValidFocusType(i);
        if (!canPerformRequestOverConnection(mSourceNodeId))
            return null;
        else
            return AccessibilityInteractionClient.getInstance().findFocus(mConnectionId, mWindowId, mSourceNodeId, i);
    }

    public AccessibilityNodeInfo focusSearch(int i)
    {
        enforceSealed();
        enforceValidFocusDirection(i);
        if (!canPerformRequestOverConnection(mSourceNodeId))
            return null;
        else
            return AccessibilityInteractionClient.getInstance().focusSearch(mConnectionId, mWindowId, mSourceNodeId, i);
    }

    public int getActions()
    {
        return mActions;
    }

    public void getBoundsInParent(Rect rect)
    {
        rect.set(mBoundsInParent.left, mBoundsInParent.top, mBoundsInParent.right, mBoundsInParent.bottom);
    }

    public void getBoundsInScreen(Rect rect)
    {
        rect.set(mBoundsInScreen.left, mBoundsInScreen.top, mBoundsInScreen.right, mBoundsInScreen.bottom);
    }

    public AccessibilityNodeInfo getChild(int i)
    {
        enforceSealed();
        if (!canPerformRequestOverConnection(mSourceNodeId))
        {
            return null;
        } else
        {
            long l = mChildNodeIds.get(i);
            return AccessibilityInteractionClient.getInstance().findAccessibilityNodeInfoByAccessibilityId(mConnectionId, mWindowId, l, 4);
        }
    }

    public int getChildCount()
    {
        return mChildNodeIds.size();
    }

    public SparseLongArray getChildNodeIds()
    {
        return mChildNodeIds;
    }

    public CharSequence getClassName()
    {
        return mClassName;
    }

    public CharSequence getContentDescription()
    {
        return mContentDescription;
    }

    public AccessibilityNodeInfo getLabelFor()
    {
        enforceSealed();
        if (!canPerformRequestOverConnection(mLabelForId))
            return null;
        else
            return AccessibilityInteractionClient.getInstance().findAccessibilityNodeInfoByAccessibilityId(mConnectionId, mWindowId, mLabelForId, 6);
    }

    public AccessibilityNodeInfo getLabeledBy()
    {
        enforceSealed();
        if (!canPerformRequestOverConnection(mLabeledById))
            return null;
        else
            return AccessibilityInteractionClient.getInstance().findAccessibilityNodeInfoByAccessibilityId(mConnectionId, mWindowId, mLabeledById, 6);
    }

    public int getMovementGranularities()
    {
        return mMovementGranularities;
    }

    public CharSequence getPackageName()
    {
        return mPackageName;
    }

    public AccessibilityNodeInfo getParent()
    {
        enforceSealed();
        if (!canPerformRequestOverConnection(mParentNodeId))
            return null;
        else
            return AccessibilityInteractionClient.getInstance().findAccessibilityNodeInfoByAccessibilityId(mConnectionId, mWindowId, mParentNodeId, 6);
    }

    public long getParentNodeId()
    {
        return mParentNodeId;
    }

    public long getSourceNodeId()
    {
        return mSourceNodeId;
    }

    public CharSequence getText()
    {
        return mText;
    }

    public int getWindowId()
    {
        return mWindowId;
    }

    public int hashCode()
    {
        return 31 * (31 * (31 + getAccessibilityViewId(mSourceNodeId)) + getVirtualDescendantId(mSourceNodeId)) + mWindowId;
    }

    public boolean isAccessibilityFocused()
    {
        return getBooleanProperty(1024);
    }

    public boolean isCheckable()
    {
        return getBooleanProperty(1);
    }

    public boolean isChecked()
    {
        return getBooleanProperty(2);
    }

    public boolean isClickable()
    {
        return getBooleanProperty(32);
    }

    public boolean isEnabled()
    {
        return getBooleanProperty(128);
    }

    public boolean isFocusable()
    {
        return getBooleanProperty(4);
    }

    public boolean isFocused()
    {
        return getBooleanProperty(8);
    }

    public boolean isLongClickable()
    {
        return getBooleanProperty(64);
    }

    public boolean isPassword()
    {
        return getBooleanProperty(256);
    }

    public boolean isScrollable()
    {
        return getBooleanProperty(512);
    }

    public boolean isSealed()
    {
        return mSealed;
    }

    public boolean isSelected()
    {
        return getBooleanProperty(16);
    }

    public boolean isVisibleToUser()
    {
        return getBooleanProperty(2048);
    }

    public boolean performAction(int i)
    {
        enforceSealed();
        if (!canPerformRequestOverConnection(mSourceNodeId))
            return false;
        else
            return AccessibilityInteractionClient.getInstance().performAccessibilityAction(mConnectionId, mWindowId, mSourceNodeId, i, null);
    }

    public boolean performAction(int i, Bundle bundle)
    {
        enforceSealed();
        if (!canPerformRequestOverConnection(mSourceNodeId))
            return false;
        else
            return AccessibilityInteractionClient.getInstance().performAccessibilityAction(mConnectionId, mWindowId, mSourceNodeId, i, bundle);
    }

    public void recycle()
    {
        if (mIsInPool)
            throw new IllegalStateException("Info already recycled!");
        clear();
        synchronized (sPoolLock)
        {
            if (sPoolSize <= 50)
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

    public void setAccessibilityFocused(boolean flag)
    {
        setBooleanProperty(1024, flag);
    }

    public void setBoundsInParent(Rect rect)
    {
        enforceNotSealed();
        mBoundsInParent.set(rect.left, rect.top, rect.right, rect.bottom);
    }

    public void setBoundsInScreen(Rect rect)
    {
        enforceNotSealed();
        mBoundsInScreen.set(rect.left, rect.top, rect.right, rect.bottom);
    }

    public void setCheckable(boolean flag)
    {
        setBooleanProperty(1, flag);
    }

    public void setChecked(boolean flag)
    {
        setBooleanProperty(2, flag);
    }

    public void setClassName(CharSequence charsequence)
    {
        enforceNotSealed();
        mClassName = charsequence;
    }

    public void setClickable(boolean flag)
    {
        setBooleanProperty(32, flag);
    }

    public void setConnectionId(int i)
    {
        enforceNotSealed();
        mConnectionId = i;
    }

    public void setContentDescription(CharSequence charsequence)
    {
        enforceNotSealed();
        mContentDescription = charsequence;
    }

    public void setEnabled(boolean flag)
    {
        setBooleanProperty(128, flag);
    }

    public void setFocusable(boolean flag)
    {
        setBooleanProperty(4, flag);
    }

    public void setFocused(boolean flag)
    {
        setBooleanProperty(8, flag);
    }

    public void setLabelFor(View view)
    {
        setLabelFor(view, -1);
    }

    public void setLabelFor(View view, int i)
    {
        enforceNotSealed();
        int j;
        if (view != null)
            j = view.getAccessibilityViewId();
        else
            j = -1;
        mLabelForId = makeNodeId(j, i);
    }

    public void setLabeledBy(View view)
    {
        setLabeledBy(view, -1);
    }

    public void setLabeledBy(View view, int i)
    {
        enforceNotSealed();
        int j;
        if (view != null)
            j = view.getAccessibilityViewId();
        else
            j = -1;
        mLabeledById = makeNodeId(j, i);
    }

    public void setLongClickable(boolean flag)
    {
        setBooleanProperty(64, flag);
    }

    public void setMovementGranularities(int i)
    {
        enforceNotSealed();
        mMovementGranularities = i;
    }

    public void setPackageName(CharSequence charsequence)
    {
        enforceNotSealed();
        mPackageName = charsequence;
    }

    public void setParent(View view)
    {
        setParent(view, -1);
    }

    public void setParent(View view, int i)
    {
        enforceNotSealed();
        int j;
        if (view != null)
            j = view.getAccessibilityViewId();
        else
            j = -1;
        mParentNodeId = makeNodeId(j, i);
    }

    public void setPassword(boolean flag)
    {
        setBooleanProperty(256, flag);
    }

    public void setScrollable(boolean flag)
    {
        enforceNotSealed();
        setBooleanProperty(512, flag);
    }

    public void setSealed(boolean flag)
    {
        mSealed = flag;
    }

    public void setSelected(boolean flag)
    {
        setBooleanProperty(16, flag);
    }

    public void setSource(View view)
    {
        setSource(view, -1);
    }

    public void setSource(View view, int i)
    {
        enforceNotSealed();
        int j;
        if (view != null)
            j = view.getAccessibilityWindowId();
        else
            j = -1;
        mWindowId = j;
        int k;
        if (view != null)
            k = view.getAccessibilityViewId();
        else
            k = -1;
        mSourceNodeId = makeNodeId(k, i);
    }

    public void setText(CharSequence charsequence)
    {
        enforceNotSealed();
        mText = charsequence;
    }

    public void setVisibleToUser(boolean flag)
    {
        setBooleanProperty(2048, flag);
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(super.toString());
        stringbuilder.append((new StringBuilder()).append("; boundsInParent: ").append(mBoundsInParent).toString());
        stringbuilder.append((new StringBuilder()).append("; boundsInScreen: ").append(mBoundsInScreen).toString());
        stringbuilder.append("; packageName: ").append(mPackageName);
        stringbuilder.append("; className: ").append(mClassName);
        stringbuilder.append("; text: ").append(mText);
        stringbuilder.append("; contentDescription: ").append(mContentDescription);
        stringbuilder.append("; checkable: ").append(isCheckable());
        stringbuilder.append("; checked: ").append(isChecked());
        stringbuilder.append("; focusable: ").append(isFocusable());
        stringbuilder.append("; focused: ").append(isFocused());
        stringbuilder.append("; selected: ").append(isSelected());
        stringbuilder.append("; clickable: ").append(isClickable());
        stringbuilder.append("; longClickable: ").append(isLongClickable());
        stringbuilder.append("; enabled: ").append(isEnabled());
        stringbuilder.append("; password: ").append(isPassword());
        stringbuilder.append((new StringBuilder()).append("; scrollable: ").append(isScrollable()).toString());
        stringbuilder.append("; [");
        int i = mActions;
        do
        {
            if (i == 0)
                break;
            int j = 1 << Integer.numberOfTrailingZeros(i);
            i &= ~j;
            stringbuilder.append(getActionSymbolicName(j));
            if (i != 0)
                stringbuilder.append(", ");
        } while (true);
        stringbuilder.append("]");
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
        parcel.writeLong(mSourceNodeId);
        parcel.writeInt(mWindowId);
        parcel.writeLong(mParentNodeId);
        parcel.writeLong(mLabelForId);
        parcel.writeLong(mLabeledById);
        parcel.writeInt(mConnectionId);
        SparseLongArray sparselongarray = mChildNodeIds;
        int k = sparselongarray.size();
        parcel.writeInt(k);
        for (int l = 0; l < k; l++)
            parcel.writeLong(sparselongarray.valueAt(l));

        parcel.writeInt(mBoundsInParent.top);
        parcel.writeInt(mBoundsInParent.bottom);
        parcel.writeInt(mBoundsInParent.left);
        parcel.writeInt(mBoundsInParent.right);
        parcel.writeInt(mBoundsInScreen.top);
        parcel.writeInt(mBoundsInScreen.bottom);
        parcel.writeInt(mBoundsInScreen.left);
        parcel.writeInt(mBoundsInScreen.right);
        parcel.writeInt(mActions);
        parcel.writeInt(mMovementGranularities);
        parcel.writeInt(mBooleanProperties);
        parcel.writeCharSequence(mPackageName);
        parcel.writeCharSequence(mClassName);
        parcel.writeCharSequence(mText);
        parcel.writeCharSequence(mContentDescription);
        recycle();
    }


}
