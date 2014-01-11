// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.TextUtils;
import android.util.*;
import android.view.*;

// Referenced classes of package android.widget:
//            PopupWindow, LinearLayout, ListAdapter, ListView, 
//            TextView, AbsListView, AdapterView

public class ListPopupWindow
{
    private static class DropDownListView extends ListView
    {

        private static final String TAG = "ListPopupWindow.DropDownListView";
        private boolean mHijackFocus;
        private boolean mListSelectionHidden;

        public boolean hasFocus()
        {
            return mHijackFocus || super.hasFocus();
        }

        public boolean hasWindowFocus()
        {
            return mHijackFocus || super.hasWindowFocus();
        }

        public boolean isFocused()
        {
            return mHijackFocus || super.isFocused();
        }

        public boolean isInTouchMode()
        {
            return mHijackFocus && mListSelectionHidden || super.isInTouchMode();
        }

        View obtainView(int i, boolean aflag[])
        {
            View view = super.obtainView(i, aflag);
            if (view instanceof TextView)
                ((TextView)view).setHorizontallyScrolling(true);
            return view;
        }


/*
        static boolean access$502(DropDownListView dropdownlistview, boolean flag)
        {
            dropdownlistview.mListSelectionHidden = flag;
            return flag;
        }

*/

        public DropDownListView(Context context, boolean flag)
        {
            super(context, null, 0x101006d);
            mHijackFocus = flag;
            setCacheColorHint(0);
        }
    }

    private class ListSelectorHider
        implements Runnable
    {

        final ListPopupWindow this$0;

        public void run()
        {
            clearListSelection();
        }

        private ListSelectorHider()
        {
            this$0 = ListPopupWindow.this;
            super();
        }

    }

    private class PopupDataSetObserver extends DataSetObserver
    {

        final ListPopupWindow this$0;

        public void onChanged()
        {
            if (isShowing())
                show();
        }

        public void onInvalidated()
        {
            dismiss();
        }

        private PopupDataSetObserver()
        {
            this$0 = ListPopupWindow.this;
            super();
        }

    }

    private class PopupScrollListener
        implements AbsListView.OnScrollListener
    {

        final ListPopupWindow this$0;

        public void onScroll(AbsListView abslistview, int i, int j, int k)
        {
        }

        public void onScrollStateChanged(AbsListView abslistview, int i)
        {
            if (i == 1 && !isInputMethodNotNeeded() && mPopup.getContentView() != null)
            {
                mHandler.removeCallbacks(mResizePopupRunnable);
                mResizePopupRunnable.run();
            }
        }

        private PopupScrollListener()
        {
            this$0 = ListPopupWindow.this;
            super();
        }

    }

    private class PopupTouchInterceptor
        implements android.view.View.OnTouchListener
    {

        final ListPopupWindow this$0;

        public boolean onTouch(View view, MotionEvent motionevent)
        {
            int i = motionevent.getAction();
            int j = (int)motionevent.getX();
            int k = (int)motionevent.getY();
            if (i == 0 && mPopup != null && mPopup.isShowing() && j >= 0 && j < mPopup.getWidth() && k >= 0 && k < mPopup.getHeight())
                mHandler.postDelayed(mResizePopupRunnable, 250L);
            else
            if (i == 1)
                mHandler.removeCallbacks(mResizePopupRunnable);
            return false;
        }

        private PopupTouchInterceptor()
        {
            this$0 = ListPopupWindow.this;
            super();
        }

    }

    private class ResizePopupRunnable
        implements Runnable
    {

        final ListPopupWindow this$0;

        public void run()
        {
            if (mDropDownList != null && mDropDownList.getCount() > mDropDownList.getChildCount() && mDropDownList.getChildCount() <= mListItemExpandMaximum)
            {
                mPopup.setInputMethodMode(2);
                show();
            }
        }

        private ResizePopupRunnable()
        {
            this$0 = ListPopupWindow.this;
            super();
        }

    }


    private static final boolean DEBUG = false;
    private static final int EXPAND_LIST_TIMEOUT = 250;
    public static final int INPUT_METHOD_FROM_FOCUSABLE = 0;
    public static final int INPUT_METHOD_NEEDED = 1;
    public static final int INPUT_METHOD_NOT_NEEDED = 2;
    public static final int MATCH_PARENT = -1;
    public static final int POSITION_PROMPT_ABOVE = 0;
    public static final int POSITION_PROMPT_BELOW = 1;
    private static final String TAG = "ListPopupWindow";
    public static final int WRAP_CONTENT = -2;
    private static boolean mTextScrollHorizontally = true;
    private ListAdapter mAdapter;
    private Context mContext;
    private boolean mDropDownAlwaysVisible;
    private View mDropDownAnchorView;
    private int mDropDownHeight;
    private int mDropDownHorizontalOffset;
    private DropDownListView mDropDownList;
    private Drawable mDropDownListHighlight;
    private int mDropDownVerticalOffset;
    private boolean mDropDownVerticalOffsetSet;
    private int mDropDownWidth;
    private boolean mForceIgnoreOutsideTouch;
    private Handler mHandler;
    private final ListSelectorHider mHideSelector;
    private AdapterView.OnItemClickListener mItemClickListener;
    private AdapterView.OnItemSelectedListener mItemSelectedListener;
    private int mLayoutDirection;
    int mListItemExpandMaximum;
    private boolean mModal;
    private DataSetObserver mObserver;
    private PopupWindow mPopup;
    private int mPromptPosition;
    private View mPromptView;
    private final ResizePopupRunnable mResizePopupRunnable;
    private final PopupScrollListener mScrollListener;
    private Runnable mShowDropDownRunnable;
    private Rect mTempRect;
    private final PopupTouchInterceptor mTouchInterceptor;

    public ListPopupWindow(Context context)
    {
        this(context, null, 0x10102ff, 0);
    }

    public ListPopupWindow(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x10102ff, 0);
    }

    public ListPopupWindow(Context context, AttributeSet attributeset, int i)
    {
        this(context, attributeset, i, 0);
    }

    public ListPopupWindow(Context context, AttributeSet attributeset, int i, int j)
    {
        mDropDownHeight = -2;
        mDropDownWidth = -2;
        mDropDownAlwaysVisible = false;
        mForceIgnoreOutsideTouch = false;
        mListItemExpandMaximum = 0x7fffffff;
        mPromptPosition = 0;
        mResizePopupRunnable = new ResizePopupRunnable();
        mTouchInterceptor = new PopupTouchInterceptor();
        mScrollListener = new PopupScrollListener();
        mHideSelector = new ListSelectorHider();
        mHandler = new Handler();
        mTempRect = new Rect();
        mContext = context;
        mPopup = new PopupWindow(context, attributeset, i, j);
        mPopup.setInputMethodMode(1);
        mLayoutDirection = TextUtils.getLayoutDirectionFromLocale(mContext.getResources().getConfiguration().locale);
    }

    private int buildDropDown()
    {
        int i;
        if (mDropDownList == null)
        {
            Context context = mContext;
            mShowDropDownRunnable = new Runnable() {

                final ListPopupWindow this$0;

                public void run()
                {
                    View view2 = getAnchorView();
                    if (view2 != null && view2.getWindowToken() != null)
                        show();
                }

            
            {
                this$0 = ListPopupWindow.this;
                super();
            }
            }
;
            boolean flag1;
            if (!mModal)
                flag1 = true;
            else
                flag1 = false;
            mDropDownList = new DropDownListView(context, flag1);
            if (mDropDownListHighlight != null)
                mDropDownList.setSelector(mDropDownListHighlight);
            mDropDownList.setAdapter(mAdapter);
            mDropDownList.setOnItemClickListener(mItemClickListener);
            mDropDownList.setFocusable(true);
            mDropDownList.setFocusableInTouchMode(true);
            mDropDownList.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

                final ListPopupWindow this$0;

                public void onItemSelected(AdapterView adapterview, View view2, int j1, long l1)
                {
                    if (j1 != -1)
                    {
                        DropDownListView dropdownlistview = mDropDownList;
                        if (dropdownlistview != null)
                            dropdownlistview.mListSelectionHidden = false;
                    }
                }

                public void onNothingSelected(AdapterView adapterview)
                {
                }

            
            {
                this$0 = ListPopupWindow.this;
                super();
            }
            }
);
            mDropDownList.setOnScrollListener(mScrollListener);
            if (mItemSelectedListener != null)
                mDropDownList.setOnItemSelectedListener(mItemSelectedListener);
            Object obj = mDropDownList;
            View view1 = mPromptView;
            i = 0;
            if (view1 != null)
            {
                LinearLayout linearlayout = new LinearLayout(context);
                linearlayout.setOrientation(1);
                LinearLayout.LayoutParams layoutparams1 = new LinearLayout.LayoutParams(-1, 0, 1.0F);
                switch (mPromptPosition)
                {
                case 0: // '\0'
                    linearlayout.addView(view1);
                    linearlayout.addView(((View) (obj)), layoutparams1);
                    break;

                case 1: // '\001'
                    linearlayout.addView(((View) (obj)), layoutparams1);
                    linearlayout.addView(view1);
                    break;

                default:
                    Log.e("ListPopupWindow", (new StringBuilder()).append("Invalid hint position ").append(mPromptPosition).toString());
                    break;
                }
                view1.measure(android.view.View.MeasureSpec.makeMeasureSpec(mDropDownWidth, 0x80000000), 0);
                LinearLayout.LayoutParams layoutparams2 = (LinearLayout.LayoutParams)view1.getLayoutParams();
                i = view1.getMeasuredHeight() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).bottomMargin;
                obj = linearlayout;
            }
            mPopup.setContentView(((View) (obj)));
        } else
        {
            ViewGroup _tmp = (ViewGroup)mPopup.getContentView();
            View view = mPromptView;
            i = 0;
            if (view != null)
            {
                LinearLayout.LayoutParams layoutparams = (LinearLayout.LayoutParams)view.getLayoutParams();
                i = view.getMeasuredHeight() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
            }
        }
        Drawable drawable = mPopup.getBackground();
        int j;
        if (drawable != null)
        {
            drawable.getPadding(mTempRect);
            j = mTempRect.top + mTempRect.bottom;
            if (!mDropDownVerticalOffsetSet)
                mDropDownVerticalOffset = -mTempRect.top;
        } else
        {
            mTempRect.setEmpty();
            j = 0;
        }
        boolean flag;
        if (mPopup.getInputMethodMode() == 2)
            flag = true;
        else
            flag = false;
        int k = mPopup.getMaxAvailableHeight(getAnchorView(), mDropDownVerticalOffset, flag);
        if (!mDropDownAlwaysVisible && mDropDownHeight != -1)
        {
            int l;
            switch (mDropDownWidth)
            {
            case -1: 
                l = android.view.View.MeasureSpec.makeMeasureSpec(mContext.getResources().getDisplayMetrics().widthPixels - (mTempRect.left + mTempRect.right), 0x40000000);
                break;

            case -2: 
                l = android.view.View.MeasureSpec.makeMeasureSpec(mContext.getResources().getDisplayMetrics().widthPixels - (mTempRect.left + mTempRect.right), 0x80000000);
                break;

            default:
                l = android.view.View.MeasureSpec.makeMeasureSpec(mDropDownWidth, 0x40000000);
                break;
            }
            int i1 = mDropDownList.measureHeightOfChildren(l, 0, -1, k - i, -1);
            if (i1 > 0)
                i += j;
            return i1 + i;
        } else
        {
            return k + j;
        }
    }

    private void removePromptView()
    {
        if (mPromptView != null)
        {
            android.view.ViewParent viewparent = mPromptView.getParent();
            if (viewparent instanceof ViewGroup)
                ((ViewGroup)viewparent).removeView(mPromptView);
        }
    }

    public void clearListSelection()
    {
        DropDownListView dropdownlistview = mDropDownList;
        if (dropdownlistview != null)
        {
            dropdownlistview.mListSelectionHidden = true;
            dropdownlistview.hideSelector();
            dropdownlistview.requestLayout();
        }
    }

    public void dismiss()
    {
        mPopup.dismiss();
        removePromptView();
        mPopup.setContentView(null);
        mDropDownList = null;
        mHandler.removeCallbacks(mResizePopupRunnable);
    }

    public View getAnchorView()
    {
        return mDropDownAnchorView;
    }

    public int getAnimationStyle()
    {
        return mPopup.getAnimationStyle();
    }

    public Drawable getBackground()
    {
        return mPopup.getBackground();
    }

    public int getHeight()
    {
        return mDropDownHeight;
    }

    public int getHorizontalOffset()
    {
        return mDropDownHorizontalOffset;
    }

    public int getInputMethodMode()
    {
        return mPopup.getInputMethodMode();
    }

    public ListView getListView()
    {
        return mDropDownList;
    }

    PopupWindow getPopupWindow()
    {
        return mPopup;
    }

    public int getPromptPosition()
    {
        return mPromptPosition;
    }

    public Object getSelectedItem()
    {
        if (!isShowing())
            return null;
        else
            return mDropDownList.getSelectedItem();
    }

    public long getSelectedItemId()
    {
        if (!isShowing())
            return 0x8000000000000000L;
        else
            return mDropDownList.getSelectedItemId();
    }

    public int getSelectedItemPosition()
    {
        if (!isShowing())
            return -1;
        else
            return mDropDownList.getSelectedItemPosition();
    }

    public View getSelectedView()
    {
        if (!isShowing())
            return null;
        else
            return mDropDownList.getSelectedView();
    }

    public int getSoftInputMode()
    {
        return mPopup.getSoftInputMode();
    }

    public int getVerticalOffset()
    {
        if (!mDropDownVerticalOffsetSet)
            return 0;
        else
            return mDropDownVerticalOffset;
    }

    public int getWidth()
    {
        return mDropDownWidth;
    }

    public boolean isDropDownAlwaysVisible()
    {
        return mDropDownAlwaysVisible;
    }

    public boolean isInputMethodNotNeeded()
    {
        return mPopup.getInputMethodMode() == 2;
    }

    public boolean isModal()
    {
        return mModal;
    }

    public boolean isShowing()
    {
        return mPopup.isShowing();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (!isShowing() || i == 62 || mDropDownList.getSelectedItemPosition() < 0 && (i == 66 || i == 23)) goto _L2; else goto _L1
_L1:
        int j;
        boolean flag;
        int k;
        int l;
        j = mDropDownList.getSelectedItemPosition();
        if (!mPopup.isAboveAnchor())
            flag = true;
        else
            flag = false;
        ListAdapter listadapter = mAdapter;
        k = 0x7fffffff;
        l = 0x80000000;
        if (listadapter != null)
        {
            boolean flag1 = listadapter.areAllItemsEnabled();
            if (flag1)
                k = 0;
            else
                k = mDropDownList.lookForSelectablePosition(0, true);
            if (flag1)
                l = -1 + listadapter.getCount();
            else
                l = mDropDownList.lookForSelectablePosition(-1 + listadapter.getCount(), false);
        }
        if (flag && i == 19 && j <= k || !flag && i == 20 && j >= l) goto _L4; else goto _L3
_L3:
        mDropDownList.mListSelectionHidden = false;
        if (!mDropDownList.onKeyDown(i, keyevent)) goto _L6; else goto _L5
_L5:
        mPopup.setInputMethodMode(2);
        mDropDownList.requestFocusFromTouch();
        show();
        i;
        JVM INSTR lookupswitch 4: default 306
    //                   19: 324
    //                   20: 324
    //                   23: 324
    //                   66: 324;
           goto _L2 _L7 _L7 _L7 _L7
_L6:
        if (flag && i == 20)
        {
            if (j == l)
                return true;
        } else
        if (!flag && i == 19 && j == k)
            return true;
_L2:
        return false;
_L4:
        clearListSelection();
        mPopup.setInputMethodMode(1);
        show();
_L7:
        return true;
    }

    public boolean onKeyPreIme(int i, KeyEvent keyevent)
    {
        if (i == 4 && isShowing())
        {
            View view = mDropDownAnchorView;
            if (keyevent.getAction() == 0 && keyevent.getRepeatCount() == 0)
            {
                android.view.KeyEvent.DispatcherState dispatcherstate1 = view.getKeyDispatcherState();
                if (dispatcherstate1 != null)
                    dispatcherstate1.startTracking(keyevent, this);
                return true;
            }
            if (keyevent.getAction() == 1)
            {
                android.view.KeyEvent.DispatcherState dispatcherstate = view.getKeyDispatcherState();
                if (dispatcherstate != null)
                    dispatcherstate.handleUpEvent(keyevent);
                if (keyevent.isTracking() && !keyevent.isCanceled())
                {
                    dismiss();
                    return true;
                }
            }
        }
        return false;
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        if (isShowing() && mDropDownList.getSelectedItemPosition() >= 0)
        {
            boolean flag = mDropDownList.onKeyUp(i, keyevent);
            if (flag)
                switch (i)
                {
                case 23: // '\027'
                case 66: // 'B'
                    dismiss();
                    return flag;
                }
            return flag;
        } else
        {
            return false;
        }
    }

    public boolean performItemClick(int i)
    {
        if (isShowing())
        {
            if (mItemClickListener != null)
            {
                DropDownListView dropdownlistview = mDropDownList;
                View view = dropdownlistview.getChildAt(i - dropdownlistview.getFirstVisiblePosition());
                ListAdapter listadapter = dropdownlistview.getAdapter();
                mItemClickListener.onItemClick(dropdownlistview, view, i, listadapter.getItemId(i));
            }
            return true;
        } else
        {
            return false;
        }
    }

    public void postShow()
    {
        mHandler.post(mShowDropDownRunnable);
    }

    public void setAdapter(ListAdapter listadapter)
    {
        if (mObserver == null)
            mObserver = new PopupDataSetObserver();
        else
        if (mAdapter != null)
            mAdapter.unregisterDataSetObserver(mObserver);
        mAdapter = listadapter;
        if (mAdapter != null)
            listadapter.registerDataSetObserver(mObserver);
        if (mDropDownList != null)
            mDropDownList.setAdapter(mAdapter);
    }

    public void setAnchorView(View view)
    {
        mDropDownAnchorView = view;
    }

    public void setAnimationStyle(int i)
    {
        mPopup.setAnimationStyle(i);
    }

    public void setBackgroundDrawable(Drawable drawable)
    {
        mPopup.setBackgroundDrawable(drawable);
    }

    public void setContentWidth(int i)
    {
        Drawable drawable = mPopup.getBackground();
        if (drawable != null)
        {
            drawable.getPadding(mTempRect);
            mDropDownWidth = i + (mTempRect.left + mTempRect.right);
            return;
        } else
        {
            setWidth(i);
            return;
        }
    }

    public void setDropDownAlwaysVisible(boolean flag)
    {
        mDropDownAlwaysVisible = flag;
    }

    public void setForceIgnoreOutsideTouch(boolean flag)
    {
        mForceIgnoreOutsideTouch = flag;
    }

    public void setHeight(int i)
    {
        mDropDownHeight = i;
    }

    public void setHorizontalOffset(int i)
    {
        mDropDownHorizontalOffset = i;
    }

    public void setInputMethodMode(int i)
    {
        mPopup.setInputMethodMode(i);
    }

    void setListItemExpandMax(int i)
    {
        mListItemExpandMaximum = i;
    }

    public void setListSelector(Drawable drawable)
    {
        mDropDownListHighlight = drawable;
    }

    public void setModal(boolean flag)
    {
        mModal = true;
        mPopup.setFocusable(flag);
    }

    public void setOnDismissListener(PopupWindow.OnDismissListener ondismisslistener)
    {
        mPopup.setOnDismissListener(ondismisslistener);
    }

    public void setOnItemClickListener(AdapterView.OnItemClickListener onitemclicklistener)
    {
        mItemClickListener = onitemclicklistener;
    }

    public void setOnItemSelectedListener(AdapterView.OnItemSelectedListener onitemselectedlistener)
    {
        mItemSelectedListener = onitemselectedlistener;
    }

    public void setPromptPosition(int i)
    {
        mPromptPosition = i;
    }

    public void setPromptView(View view)
    {
        boolean flag = isShowing();
        if (flag)
            removePromptView();
        mPromptView = view;
        if (flag)
            show();
    }

    public void setSelection(int i)
    {
        DropDownListView dropdownlistview = mDropDownList;
        if (isShowing() && dropdownlistview != null)
        {
            dropdownlistview.mListSelectionHidden = false;
            dropdownlistview.setSelection(i);
            if (dropdownlistview.getChoiceMode() != 0)
                dropdownlistview.setItemChecked(i, true);
        }
    }

    public void setSoftInputMode(int i)
    {
        mPopup.setSoftInputMode(i);
    }

    public void setVerticalOffset(int i)
    {
        mDropDownVerticalOffset = i;
        mDropDownVerticalOffsetSet = true;
    }

    public void setWidth(int i)
    {
        mDropDownWidth = i;
    }

    public void show()
    {
        boolean flag = true;
        int i = buildDropDown();
        boolean flag1 = isInputMethodNotNeeded();
        PopupWindow popupwindow = mPopup;
        boolean flag2;
        if (!flag1)
            flag2 = flag;
        else
            flag2 = false;
        popupwindow.setAllowScrollingAnchorParent(flag2);
        if (mPopup.isShowing())
        {
            int j;
            if (mDropDownWidth == -1)
                j = -1;
            else
            if (mDropDownWidth == -2)
                j = getAnchorView().getWidth();
            else
                j = mDropDownWidth;
            int k;
            if (mDropDownHeight == -1)
            {
                if (flag1)
                    k = i;
                else
                    k = -1;
                if (flag1)
                {
                    PopupWindow popupwindow4 = mPopup;
                    byte byte3;
                    if (mDropDownWidth == -1)
                        byte3 = -1;
                    else
                        byte3 = 0;
                    popupwindow4.setWindowLayoutMode(byte3, 0);
                } else
                {
                    PopupWindow popupwindow3 = mPopup;
                    byte byte2;
                    if (mDropDownWidth == -1)
                        byte2 = -1;
                    else
                        byte2 = 0;
                    popupwindow3.setWindowLayoutMode(byte2, -1);
                }
            } else
            if (mDropDownHeight == -2)
                k = i;
            else
                k = mDropDownHeight;
            PopupWindow popupwindow2 = mPopup;
            if (mForceIgnoreOutsideTouch || mDropDownAlwaysVisible)
                flag = false;
            popupwindow2.setOutsideTouchable(flag);
            mPopup.update(getAnchorView(), mDropDownHorizontalOffset, mDropDownVerticalOffset, j, k);
        } else
        {
            byte byte0;
            if (mDropDownWidth == -1)
                byte0 = -1;
            else
            if (mDropDownWidth == -2)
            {
                mPopup.setWidth(getAnchorView().getWidth());
                byte0 = 0;
            } else
            {
                mPopup.setWidth(mDropDownWidth);
                byte0 = 0;
            }
            byte byte1;
            if (mDropDownHeight == -1)
                byte1 = -1;
            else
            if (mDropDownHeight == -2)
            {
                mPopup.setHeight(i);
                byte1 = 0;
            } else
            {
                mPopup.setHeight(mDropDownHeight);
                byte1 = 0;
            }
            mPopup.setWindowLayoutMode(byte0, byte1);
            mPopup.setClipToScreenEnabled(flag);
            PopupWindow popupwindow1 = mPopup;
            if (mForceIgnoreOutsideTouch || mDropDownAlwaysVisible)
                flag = false;
            popupwindow1.setOutsideTouchable(flag);
            mPopup.setTouchInterceptor(mTouchInterceptor);
            mPopup.showAsDropDown(getAnchorView(), mDropDownHorizontalOffset, mDropDownVerticalOffset);
            mDropDownList.setSelection(-1);
            if (!mModal || mDropDownList.isInTouchMode())
                clearListSelection();
            if (!mModal)
            {
                mHandler.post(mHideSelector);
                return;
            }
        }
    }





}
