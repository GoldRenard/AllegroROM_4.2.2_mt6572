// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Rect;
import android.graphics.Region;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

// Referenced classes of package android.view:
//            View

public final class ViewTreeObserver
{
    static class CopyOnWriteArray
    {

        private final Access mAccess = new Access();
        private ArrayList mData;
        private ArrayList mDataCopy;
        private boolean mStart;

        private ArrayList getArray()
        {
            if (mStart)
            {
                if (mDataCopy == null)
                    mDataCopy = new ArrayList(mData);
                return mDataCopy;
            } else
            {
                return mData;
            }
        }

        void add(Object obj)
        {
            getArray().add(obj);
        }

        void addAll(CopyOnWriteArray copyonwritearray)
        {
            getArray().addAll(copyonwritearray.mData);
        }

        void clear()
        {
            getArray().clear();
        }

        void end()
        {
            if (!mStart)
                throw new IllegalStateException("Iteration not started");
            mStart = false;
            if (mDataCopy != null)
                mData = mDataCopy;
            mDataCopy = null;
        }

        void remove(Object obj)
        {
            getArray().remove(obj);
        }

        int size()
        {
            return getArray().size();
        }

        Access start()
        {
            if (mStart)
            {
                throw new IllegalStateException("Iteration already started");
            } else
            {
                mStart = true;
                mDataCopy = null;
                mAccess.mData = mData;
                mAccess.mSize = mData.size();
                return mAccess;
            }
        }

        CopyOnWriteArray()
        {
            mData = new ArrayList();
        }
    }

    static class CopyOnWriteArray.Access
    {

        private ArrayList mData;
        private int mSize;

        Object get(int i)
        {
            return mData.get(i);
        }

        int size()
        {
            return mSize;
        }


/*
        static ArrayList access$002(CopyOnWriteArray.Access access, ArrayList arraylist)
        {
            access.mData = arraylist;
            return arraylist;
        }

*/


/*
        static int access$102(CopyOnWriteArray.Access access, int i)
        {
            access.mSize = i;
            return i;
        }

*/

    }

    public static final class InternalInsetsInfo
    {

        public static final int TOUCHABLE_INSETS_CONTENT = 1;
        public static final int TOUCHABLE_INSETS_FRAME = 0;
        public static final int TOUCHABLE_INSETS_REGION = 3;
        public static final int TOUCHABLE_INSETS_VISIBLE = 2;
        public final Rect contentInsets = new Rect();
        int mTouchableInsets;
        public final Region touchableRegion = new Region();
        public final Rect visibleInsets = new Rect();

        public boolean equals(Object obj)
        {
label0:
            {
                if (this != obj)
                {
                    if (obj == null || getClass() != obj.getClass())
                        break label0;
                    InternalInsetsInfo internalinsetsinfo = (InternalInsetsInfo)obj;
                    if (mTouchableInsets != internalinsetsinfo.mTouchableInsets || !contentInsets.equals(internalinsetsinfo.contentInsets) || !visibleInsets.equals(internalinsetsinfo.visibleInsets) || !touchableRegion.equals(internalinsetsinfo.touchableRegion))
                        return false;
                }
                return true;
            }
            return false;
        }

        public int hashCode()
        {
            int i;
            if (contentInsets != null)
                i = contentInsets.hashCode();
            else
                i = 0;
            int j = i * 31;
            int k;
            if (visibleInsets != null)
                k = visibleInsets.hashCode();
            else
                k = 0;
            int l = 31 * (j + k);
            Region region = touchableRegion;
            int i1 = 0;
            if (region != null)
                i1 = touchableRegion.hashCode();
            return 31 * (l + i1) + mTouchableInsets;
        }

        void reset()
        {
            contentInsets.setEmpty();
            visibleInsets.setEmpty();
            touchableRegion.setEmpty();
            mTouchableInsets = 0;
        }

        void set(InternalInsetsInfo internalinsetsinfo)
        {
            contentInsets.set(internalinsetsinfo.contentInsets);
            visibleInsets.set(internalinsetsinfo.visibleInsets);
            touchableRegion.set(internalinsetsinfo.touchableRegion);
            mTouchableInsets = internalinsetsinfo.mTouchableInsets;
        }

        public void setTouchableInsets(int i)
        {
            mTouchableInsets = i;
        }

    }

    public static interface OnComputeInternalInsetsListener
    {

        public abstract void onComputeInternalInsets(InternalInsetsInfo internalinsetsinfo);
    }

    public static interface OnDrawListener
    {

        public abstract void onDraw();
    }

    public static interface OnGlobalFocusChangeListener
    {

        public abstract void onGlobalFocusChanged(View view, View view1);
    }

    public static interface OnGlobalLayoutListener
    {

        public abstract void onGlobalLayout();
    }

    public static interface OnPostDrawListener
    {

        public abstract boolean onPostDraw();
    }

    public static interface OnPreDrawListener
    {

        public abstract boolean onPreDraw();
    }

    public static interface OnScrollChangedListener
    {

        public abstract void onScrollChanged();
    }

    public static interface OnTouchModeChangeListener
    {

        public abstract void onTouchModeChanged(boolean flag);
    }


    private boolean mAlive;
    private CopyOnWriteArray mOnComputeInternalInsetsListeners;
    private ArrayList mOnDrawListeners;
    private CopyOnWriteArrayList mOnGlobalFocusListeners;
    private CopyOnWriteArray mOnGlobalLayoutListeners;
    private ArrayList mOnPostDrawListeners;
    private CopyOnWriteArray mOnPreDrawListeners;
    private CopyOnWriteArray mOnScrollChangedListeners;
    private CopyOnWriteArrayList mOnTouchModeChangeListeners;

    ViewTreeObserver()
    {
        mAlive = true;
    }

    private void checkIsAlive()
    {
        if (!mAlive)
            throw new IllegalStateException("This ViewTreeObserver is not alive, call getViewTreeObserver() again");
        else
            return;
    }

    private void kill()
    {
        mAlive = false;
    }

    public void addOnComputeInternalInsetsListener(OnComputeInternalInsetsListener oncomputeinternalinsetslistener)
    {
        checkIsAlive();
        if (mOnComputeInternalInsetsListeners == null)
            mOnComputeInternalInsetsListeners = new CopyOnWriteArray();
        mOnComputeInternalInsetsListeners.add(oncomputeinternalinsetslistener);
    }

    public void addOnDrawListener(OnDrawListener ondrawlistener)
    {
        checkIsAlive();
        if (mOnDrawListeners == null)
            mOnDrawListeners = new ArrayList();
        mOnDrawListeners.add(ondrawlistener);
    }

    public void addOnGlobalFocusChangeListener(OnGlobalFocusChangeListener onglobalfocuschangelistener)
    {
        checkIsAlive();
        if (mOnGlobalFocusListeners == null)
            mOnGlobalFocusListeners = new CopyOnWriteArrayList();
        mOnGlobalFocusListeners.add(onglobalfocuschangelistener);
    }

    public void addOnGlobalLayoutListener(OnGlobalLayoutListener ongloballayoutlistener)
    {
        checkIsAlive();
        if (mOnGlobalLayoutListeners == null)
            mOnGlobalLayoutListeners = new CopyOnWriteArray();
        mOnGlobalLayoutListeners.add(ongloballayoutlistener);
    }

    public void addOnPostDrawListener(OnPostDrawListener onpostdrawlistener)
    {
        checkIsAlive();
        if (mOnPostDrawListeners == null)
            mOnPostDrawListeners = new ArrayList();
        mOnPostDrawListeners.add(onpostdrawlistener);
    }

    public void addOnPreDrawListener(OnPreDrawListener onpredrawlistener)
    {
        checkIsAlive();
        if (mOnPreDrawListeners == null)
            mOnPreDrawListeners = new CopyOnWriteArray();
        mOnPreDrawListeners.add(onpredrawlistener);
    }

    public void addOnScrollChangedListener(OnScrollChangedListener onscrollchangedlistener)
    {
        checkIsAlive();
        if (mOnScrollChangedListeners == null)
            mOnScrollChangedListeners = new CopyOnWriteArray();
        mOnScrollChangedListeners.add(onscrollchangedlistener);
    }

    public void addOnTouchModeChangeListener(OnTouchModeChangeListener ontouchmodechangelistener)
    {
        checkIsAlive();
        if (mOnTouchModeChangeListeners == null)
            mOnTouchModeChangeListeners = new CopyOnWriteArrayList();
        mOnTouchModeChangeListeners.add(ontouchmodechangelistener);
    }

    final void dispatchOnComputeInternalInsets(InternalInsetsInfo internalinsetsinfo)
    {
        CopyOnWriteArray copyonwritearray;
        CopyOnWriteArray.Access access;
        copyonwritearray = mOnComputeInternalInsetsListeners;
        if (copyonwritearray == null || copyonwritearray.size() <= 0)
            break MISSING_BLOCK_LABEL_62;
        access = copyonwritearray.start();
        int i = access.size();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ((OnComputeInternalInsetsListener)access.get(j)).onComputeInternalInsets(internalinsetsinfo);
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        copyonwritearray.end();
        return;
        Exception exception;
        exception;
        copyonwritearray.end();
        throw exception;
    }

    public final void dispatchOnDraw()
    {
        if (mOnDrawListeners != null)
        {
            ArrayList arraylist = mOnDrawListeners;
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
                ((OnDrawListener)arraylist.get(j)).onDraw();

        }
    }

    final void dispatchOnGlobalFocusChange(View view, View view1)
    {
        CopyOnWriteArrayList copyonwritearraylist = mOnGlobalFocusListeners;
        if (copyonwritearraylist != null && copyonwritearraylist.size() > 0)
        {
            for (Iterator iterator = copyonwritearraylist.iterator(); iterator.hasNext(); ((OnGlobalFocusChangeListener)iterator.next()).onGlobalFocusChanged(view, view1));
        }
    }

    public final void dispatchOnGlobalLayout()
    {
        CopyOnWriteArray copyonwritearray;
        CopyOnWriteArray.Access access;
        copyonwritearray = mOnGlobalLayoutListeners;
        if (copyonwritearray == null || copyonwritearray.size() <= 0)
            break MISSING_BLOCK_LABEL_61;
        access = copyonwritearray.start();
        int i = access.size();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ((OnGlobalLayoutListener)access.get(j)).onGlobalLayout();
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        copyonwritearray.end();
        return;
        Exception exception;
        exception;
        copyonwritearray.end();
        throw exception;
    }

    public final boolean dispatchOnPostDraw()
    {
        ArrayList arraylist = mOnPostDrawListeners;
        boolean flag = false;
        if (arraylist != null)
        {
            for (Iterator iterator = arraylist.iterator(); iterator.hasNext();)
            {
                boolean flag1;
                if (!((OnPostDrawListener)iterator.next()).onPostDraw())
                    flag1 = true;
                else
                    flag1 = false;
                flag |= flag1;
            }

        }
        return flag;
    }

    public final boolean dispatchOnPreDraw()
    {
        CopyOnWriteArray copyonwritearray;
        boolean flag;
        CopyOnWriteArray.Access access;
        copyonwritearray = mOnPreDrawListeners;
        flag = false;
        if (copyonwritearray == null)
            break MISSING_BLOCK_LABEL_91;
        int i = copyonwritearray.size();
        flag = false;
        if (i <= 0)
            break MISSING_BLOCK_LABEL_91;
        access = copyonwritearray.start();
        int j = access.size();
        int k = 0;
_L2:
        if (k >= j)
            break; /* Loop/switch isn't completed */
        boolean flag1 = ((OnPreDrawListener)access.get(k)).onPreDraw();
        boolean flag2;
        if (!flag1)
            flag2 = true;
        else
            flag2 = false;
        flag |= flag2;
        k++;
        if (true) goto _L2; else goto _L1
_L1:
        copyonwritearray.end();
        return flag;
        Exception exception;
        exception;
        copyonwritearray.end();
        throw exception;
    }

    final void dispatchOnScrollChanged()
    {
        CopyOnWriteArray copyonwritearray;
        CopyOnWriteArray.Access access;
        copyonwritearray = mOnScrollChangedListeners;
        if (copyonwritearray == null || copyonwritearray.size() <= 0)
            break MISSING_BLOCK_LABEL_61;
        access = copyonwritearray.start();
        int i = access.size();
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ((OnScrollChangedListener)access.get(j)).onScrollChanged();
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        copyonwritearray.end();
        return;
        Exception exception;
        exception;
        copyonwritearray.end();
        throw exception;
    }

    final void dispatchOnTouchModeChanged(boolean flag)
    {
        CopyOnWriteArrayList copyonwritearraylist = mOnTouchModeChangeListeners;
        if (copyonwritearraylist != null && copyonwritearraylist.size() > 0)
        {
            for (Iterator iterator = copyonwritearraylist.iterator(); iterator.hasNext(); ((OnTouchModeChangeListener)iterator.next()).onTouchModeChanged(flag));
        }
    }

    final boolean hasComputeInternalInsetsListeners()
    {
        CopyOnWriteArray copyonwritearray = mOnComputeInternalInsetsListeners;
        return copyonwritearray != null && copyonwritearray.size() > 0;
    }

    public boolean isAlive()
    {
        return mAlive;
    }

    void merge(ViewTreeObserver viewtreeobserver)
    {
        if (viewtreeobserver.mOnGlobalFocusListeners != null)
            if (mOnGlobalFocusListeners != null)
                mOnGlobalFocusListeners.addAll(viewtreeobserver.mOnGlobalFocusListeners);
            else
                mOnGlobalFocusListeners = viewtreeobserver.mOnGlobalFocusListeners;
        if (viewtreeobserver.mOnGlobalLayoutListeners != null)
            if (mOnGlobalLayoutListeners != null)
                mOnGlobalLayoutListeners.addAll(viewtreeobserver.mOnGlobalLayoutListeners);
            else
                mOnGlobalLayoutListeners = viewtreeobserver.mOnGlobalLayoutListeners;
        if (viewtreeobserver.mOnPreDrawListeners != null)
            if (mOnPreDrawListeners != null)
                mOnPreDrawListeners.addAll(viewtreeobserver.mOnPreDrawListeners);
            else
                mOnPreDrawListeners = viewtreeobserver.mOnPreDrawListeners;
        if (viewtreeobserver.mOnPostDrawListeners != null)
            if (mOnPostDrawListeners != null)
                mOnPostDrawListeners.addAll(viewtreeobserver.mOnPostDrawListeners);
            else
                mOnPostDrawListeners = viewtreeobserver.mOnPostDrawListeners;
        if (viewtreeobserver.mOnTouchModeChangeListeners != null)
            if (mOnTouchModeChangeListeners != null)
                mOnTouchModeChangeListeners.addAll(viewtreeobserver.mOnTouchModeChangeListeners);
            else
                mOnTouchModeChangeListeners = viewtreeobserver.mOnTouchModeChangeListeners;
        if (viewtreeobserver.mOnComputeInternalInsetsListeners != null)
            if (mOnComputeInternalInsetsListeners != null)
                mOnComputeInternalInsetsListeners.addAll(viewtreeobserver.mOnComputeInternalInsetsListeners);
            else
                mOnComputeInternalInsetsListeners = viewtreeobserver.mOnComputeInternalInsetsListeners;
        if (viewtreeobserver.mOnScrollChangedListeners != null)
            if (mOnScrollChangedListeners != null)
                mOnScrollChangedListeners.addAll(viewtreeobserver.mOnScrollChangedListeners);
            else
                mOnScrollChangedListeners = viewtreeobserver.mOnScrollChangedListeners;
        viewtreeobserver.kill();
    }

    public void removeGlobalOnLayoutListener(OnGlobalLayoutListener ongloballayoutlistener)
    {
        removeOnGlobalLayoutListener(ongloballayoutlistener);
    }

    public void removeOnComputeInternalInsetsListener(OnComputeInternalInsetsListener oncomputeinternalinsetslistener)
    {
        checkIsAlive();
        if (mOnComputeInternalInsetsListeners == null)
        {
            return;
        } else
        {
            mOnComputeInternalInsetsListeners.remove(oncomputeinternalinsetslistener);
            return;
        }
    }

    public void removeOnDrawListener(OnDrawListener ondrawlistener)
    {
        checkIsAlive();
        if (mOnDrawListeners == null)
        {
            return;
        } else
        {
            mOnDrawListeners.remove(ondrawlistener);
            return;
        }
    }

    public void removeOnGlobalFocusChangeListener(OnGlobalFocusChangeListener onglobalfocuschangelistener)
    {
        checkIsAlive();
        if (mOnGlobalFocusListeners == null)
        {
            return;
        } else
        {
            mOnGlobalFocusListeners.remove(onglobalfocuschangelistener);
            return;
        }
    }

    public void removeOnGlobalLayoutListener(OnGlobalLayoutListener ongloballayoutlistener)
    {
        checkIsAlive();
        if (mOnGlobalLayoutListeners == null)
        {
            return;
        } else
        {
            mOnGlobalLayoutListeners.remove(ongloballayoutlistener);
            return;
        }
    }

    public void removeOnPostDrawListener(OnPostDrawListener onpostdrawlistener)
    {
        checkIsAlive();
        if (mOnPostDrawListeners == null)
        {
            return;
        } else
        {
            mOnPostDrawListeners.remove(onpostdrawlistener);
            return;
        }
    }

    public void removeOnPreDrawListener(OnPreDrawListener onpredrawlistener)
    {
        checkIsAlive();
        if (mOnPreDrawListeners == null)
        {
            return;
        } else
        {
            mOnPreDrawListeners.remove(onpredrawlistener);
            return;
        }
    }

    public void removeOnScrollChangedListener(OnScrollChangedListener onscrollchangedlistener)
    {
        checkIsAlive();
        if (mOnScrollChangedListeners == null)
        {
            return;
        } else
        {
            mOnScrollChangedListeners.remove(onscrollchangedlistener);
            return;
        }
    }

    public void removeOnTouchModeChangeListener(OnTouchModeChangeListener ontouchmodechangelistener)
    {
        checkIsAlive();
        if (mOnTouchModeChangeListeners == null)
        {
            return;
        } else
        {
            mOnTouchModeChangeListeners.remove(ontouchmodechangelistener);
            return;
        }
    }
}
