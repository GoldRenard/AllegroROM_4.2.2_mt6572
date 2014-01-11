// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            AbsSpinner, AdapterView, SpinnerAdapter, Adapter, 
//            ListAdapter, ListPopupWindow, ListView

public class Spinner extends AbsSpinner
    implements android.content.DialogInterface.OnClickListener
{
    private class DialogPopup
        implements SpinnerPopup, android.content.DialogInterface.OnClickListener
    {

        private ListAdapter mListAdapter;
        private AlertDialog mPopup;
        private CharSequence mPrompt;
        final Spinner this$0;

        public void dismiss()
        {
            mPopup.dismiss();
            mPopup = null;
        }

        public Drawable getBackground()
        {
            return null;
        }

        public CharSequence getHintText()
        {
            return mPrompt;
        }

        public int getHorizontalOffset()
        {
            return 0;
        }

        public int getVerticalOffset()
        {
            return 0;
        }

        public boolean isShowing()
        {
            if (mPopup != null)
                return mPopup.isShowing();
            else
                return false;
        }

        public void onClick(DialogInterface dialoginterface, int i)
        {
            setSelection(i);
            if (mOnItemClickListener != null)
                performItemClick(null, i, mListAdapter.getItemId(i));
            dismiss();
        }

        public void setAdapter(ListAdapter listadapter)
        {
            mListAdapter = listadapter;
        }

        public void setBackgroundDrawable(Drawable drawable)
        {
            Log.e("Spinner", "Cannot set popup background for MODE_DIALOG, ignoring");
        }

        public void setHorizontalOffset(int i)
        {
            Log.e("Spinner", "Cannot set horizontal offset for MODE_DIALOG, ignoring");
        }

        public void setPromptText(CharSequence charsequence)
        {
            mPrompt = charsequence;
        }

        public void setVerticalOffset(int i)
        {
            Log.e("Spinner", "Cannot set vertical offset for MODE_DIALOG, ignoring");
        }

        public void show()
        {
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getContext());
            if (mPrompt != null)
                builder.setTitle(mPrompt);
            mPopup = builder.setSingleChoiceItems(mListAdapter, getSelectedItemPosition(), this).show();
        }

        private DialogPopup()
        {
            this$0 = Spinner.this;
            super();
        }

    }

    private static class DropDownAdapter
        implements ListAdapter, SpinnerAdapter
    {

        private SpinnerAdapter mAdapter;
        private ListAdapter mListAdapter;

        public boolean areAllItemsEnabled()
        {
            ListAdapter listadapter = mListAdapter;
            if (listadapter != null)
                return listadapter.areAllItemsEnabled();
            else
                return true;
        }

        public int getCount()
        {
            if (mAdapter == null)
                return 0;
            else
                return mAdapter.getCount();
        }

        public View getDropDownView(int i, View view, ViewGroup viewgroup)
        {
            if (mAdapter == null)
                return null;
            else
                return mAdapter.getDropDownView(i, view, viewgroup);
        }

        public Object getItem(int i)
        {
            if (mAdapter == null)
                return null;
            else
                return mAdapter.getItem(i);
        }

        public long getItemId(int i)
        {
            if (mAdapter == null)
                return -1L;
            else
                return mAdapter.getItemId(i);
        }

        public int getItemViewType(int i)
        {
            return 0;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            return getDropDownView(i, view, viewgroup);
        }

        public int getViewTypeCount()
        {
            return 1;
        }

        public boolean hasStableIds()
        {
            return mAdapter != null && mAdapter.hasStableIds();
        }

        public boolean isEmpty()
        {
            return getCount() == 0;
        }

        public boolean isEnabled(int i)
        {
            ListAdapter listadapter = mListAdapter;
            if (listadapter != null)
                return listadapter.isEnabled(i);
            else
                return true;
        }

        public void registerDataSetObserver(DataSetObserver datasetobserver)
        {
            if (mAdapter != null)
                mAdapter.registerDataSetObserver(datasetobserver);
        }

        public void unregisterDataSetObserver(DataSetObserver datasetobserver)
        {
            if (mAdapter != null)
                mAdapter.unregisterDataSetObserver(datasetobserver);
        }

        public DropDownAdapter(SpinnerAdapter spinneradapter)
        {
            mAdapter = spinneradapter;
            if (spinneradapter instanceof ListAdapter)
                mListAdapter = (ListAdapter)spinneradapter;
        }
    }

    private class DropdownPopup extends ListPopupWindow
        implements SpinnerPopup
    {

        private ListAdapter mAdapter;
        private CharSequence mHintText;
        final Spinner this$0;

        public CharSequence getHintText()
        {
            return mHintText;
        }

        public void setAdapter(ListAdapter listadapter)
        {
            super.setAdapter(listadapter);
            mAdapter = listadapter;
        }

        public void setPromptText(CharSequence charsequence)
        {
            mHintText = charsequence;
        }

        public void show()
        {
            Drawable drawable = getBackground();
            int i;
            if (drawable != null)
            {
                drawable.getPadding(mTempRect);
                if (isLayoutRtl())
                    i = mTempRect.right;
                else
                    i = -mTempRect.left;
            } else
            {
                Rect rect = mTempRect;
                mTempRect.right = 0;
                rect.left = 0;
                i = 0;
            }
            int j = getPaddingLeft();
            int k = getPaddingRight();
            int l = getWidth();
            if (mDropDownWidth == -2)
            {
                int j1 = measureContentWidth((SpinnerAdapter)mAdapter, getBackground());
                int k1 = 
// JavaClassFileOutputException: get_constant: invalid tag


        public DropdownPopup(Context context, AttributeSet attributeset, int i)
        {
            this$0 = Spinner.this;
            super(context, attributeset, 0, i);
            setAnchorView(Spinner.this);
            setModal(true);
            setPromptPosition(0);
            setOnItemClickListener(new _cls1());
        }
    }

    private static interface SpinnerPopup
    {

        public abstract void dismiss();

        public abstract Drawable getBackground();

        public abstract CharSequence getHintText();

        public abstract int getHorizontalOffset();

        public abstract int getVerticalOffset();

        public abstract boolean isShowing();

        public abstract void setAdapter(ListAdapter listadapter);

        public abstract void setBackgroundDrawable(Drawable drawable);

        public abstract void setHorizontalOffset(int i);

        public abstract void setPromptText(CharSequence charsequence);

        public abstract void setVerticalOffset(int i);

        public abstract void show();
    }


    private static final int MAX_ITEMS_MEASURED = 15;
    public static final int MODE_DIALOG = 0;
    public static final int MODE_DROPDOWN = 1;
    private static final int MODE_THEME = -1;
    private static final String TAG = "Spinner";
    private boolean mDisableChildrenWhenDisabled;
    int mDropDownWidth;
    private int mGravity;
    private SpinnerPopup mPopup;
    private DropDownAdapter mTempAdapter;
    private Rect mTempRect;

    public Spinner(Context context)
    {
        Spinner(context, ((AttributeSet) (null)));
    }

    public Spinner(Context context, int i)
    {
        Spinner(context, null, 0x1010081, i);
    }

    public Spinner(Context context, AttributeSet attributeset)
    {
        Spinner(context, attributeset, 0x1010081);
    }

    public Spinner(Context context, AttributeSet attributeset, int i)
    {
        Spinner(context, attributeset, i, -1);
    }

    public Spinner(Context context, AttributeSet attributeset, int i, int j)
    {
        AbsSpinner(context, attributeset, i);
        mTempRect = new Rect();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.Spinner, i, 0);
        if (j == -1)
            j = typedarray.getInt(7, 0);
        switch (j)
        {
        case 1: // '\001'
            DropdownPopup dropdownpopup = new DropdownPopup(context, attributeset, i);
            mDropDownWidth = typedarray.getLayoutDimension(4, -2);
            dropdownpopup.setBackgroundDrawable(typedarray.getDrawable(2));
            int k = typedarray.getDimensionPixelOffset(6, 0);
            if (k != 0)
                dropdownpopup.setVerticalOffset(k);
            int l = typedarray.getDimensionPixelOffset(5, 0);
            if (l != 0)
                dropdownpopup.setHorizontalOffset(l);
            mPopup = dropdownpopup;
            break;

        case 0: // '\0'
            mPopup = new DialogPopup();
            break;
        }
        mGravity = typedarray.getInt(0, 17);
        mPopup.setPromptText(typedarray.getString(3));
        mDisableChildrenWhenDisabled = typedarray.getBoolean(9, false);
        typedarray.recycle();
        if (mTempAdapter != null)
        {
            mPopup.setAdapter(mTempAdapter);
            mTempAdapter = null;
        }
    }

    private View makeAndAddView(int i)
    {
        if (!super.mDataChanged)
        {
            View view1 = super.mRecycler.get(i);
            if (view1 != null)
            {
                setUpChild(view1);
                return view1;
            }
        }
        View view = super.mAdapter.getView(i, null, this);
        setUpChild(view);
        return view;
    }

    private void setUpChild(View view)
    {
        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
        if (layoutparams == null)
            layoutparams = generateDefaultLayoutParams();
        addViewInLayout(view, 0, layoutparams);
        view.setSelected(hasFocus());
        if (mDisableChildrenWhenDisabled)
            view.setEnabled(isEnabled());
        int i = ViewGroup.getChildMeasureSpec(super.mHeightMeasureSpec, super.mSpinnerPadding.top + super.mSpinnerPadding.bottom, layoutparams.height);
        view.measure(ViewGroup.getChildMeasureSpec(super.mWidthMeasureSpec, super.mSpinnerPadding.left + super.mSpinnerPadding.right, layoutparams.width), i);
        int j = super.mSpinnerPadding.top + (getMeasuredHeight() - super.mSpinnerPadding.bottom - super.mSpinnerPadding.top - view.getMeasuredHeight()) / 2;
        int k = j + view.getMeasuredHeight();
        view.layout(0, j, 0 + view.getMeasuredWidth(), k);
    }

    public void dismissPopup()
    {
        if (mPopup != null && mPopup.isShowing())
            mPopup.dismiss();
    }

    public int getBaseline()
    {
        int i = -1;
        View view;
        if (getChildCount() > 0)
        {
            view = getChildAt(0);
        } else
        {
            SpinnerAdapter spinneradapter = super.mAdapter;
            view = null;
            if (spinneradapter != null)
            {
                int k = super.mAdapter.getCount();
                view = null;
                if (k > 0)
                {
                    view = makeAndAddView(0);
                    super.mRecycler.put(0, view);
                    removeAllViewsInLayout();
                }
            }
        }
        if (view != null)
        {
            int j = view.getBaseline();
            if (j >= 0)
                i = j + view.getTop();
        }
        return i;
    }

    public int getDropDownHorizontalOffset()
    {
        return mPopup.getHorizontalOffset();
    }

    public int getDropDownVerticalOffset()
    {
        return mPopup.getVerticalOffset();
    }

    public int getDropDownWidth()
    {
        return mDropDownWidth;
    }

    public int getGravity()
    {
        return mGravity;
    }

    public Drawable getPopupBackground()
    {
        return mPopup.getBackground();
    }

    public CharSequence getPrompt()
    {
        return mPopup.getHintText();
    }

    public boolean isPopupShowing()
    {
        return mPopup != null && mPopup.isShowing();
    }

    void layout(int i, boolean flag)
    {
        int j = super.mSpinnerPadding.left;
        int k = super.mRight - super.mLeft - super.mSpinnerPadding.left - super.mSpinnerPadding.right;
        if (super.mDataChanged)
            handleDataChanged();
        if (super.mItemCount == 0)
        {
            resetList();
            return;
        }
        if (super.mNextSelectedPosition >= 0)
            setSelectedPositionInt(super.mNextSelectedPosition);
        recycleAllViews();
        removeAllViewsInLayout();
        super.mFirstPosition = super.mSelectedPosition;
        View view = makeAndAddView(super.mSelectedPosition);
        int l = view.getMeasuredWidth();
        int i1 = j;
        int j1 = getLayoutDirection();
        switch (7 & Gravity.getAbsoluteGravity(mGravity, j1))
        {
        case 5: // '\005'
            i1 = (j + k) - l;
            break;

        case 1: // '\001'
            i1 = (j + k / 2) - l / 2;
            break;
        }
        view.offsetLeftAndRight(i1);
        super.mRecycler.clear();
        invalidate();
        checkSelectionChanged();
        super.mDataChanged = false;
        super.mNeedSync = false;
        setNextSelectedPositionInt(super.mSelectedPosition);
    }

    int measureContentWidth(SpinnerAdapter spinneradapter, Drawable drawable)
    {
        int i;
        if (spinneradapter == null)
        {
            i = 0;
        } else
        {
            i = 0;
            View view = null;
            int j = 0;
            int k = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
            int l = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
            int i1 = Math.max(0, getSelectedItemPosition());
            int j1 = Math.min(spinneradapter.getCount(), i1 + 15);
            for (int k1 = Math.max(0, i1 - (15 - (j1 - i1))); k1 < j1; k1++)
            {
                int l1 = spinneradapter.getItemViewType(k1);
                if (l1 != j)
                {
                    j = l1;
                    view = null;
                }
                view = spinneradapter.getView(k1, view, this);
                if (view.getLayoutParams() == null)
                    view.setLayoutParams(new LayoutParams(-2, -2));
                view.measure(k, l);
                i = Math.max(i, view.getMeasuredWidth());
            }

            if (drawable != null)
            {
                drawable.getPadding(mTempRect);
                return i + (mTempRect.left + mTempRect.right);
            }
        }
        return i;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        setSelection(i);
        dialoginterface.dismiss();
    }

    protected void onDetachedFromWindow()
    {
        onDetachedFromWindow();
        if (mPopup != null && mPopup.isShowing())
            mPopup.dismiss();
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/Spinner.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/Spinner.getName());
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        onLayout(flag, i, j, k, l);
        super.mInLayout = true;
        layout(0, false);
        super.mInLayout = false;
    }

    protected void onMeasure(int i, int j)
    {
        onMeasure(i, j);
        if (mPopup != null && android.view.View.MeasureSpec.getMode(i) == 0x80000000)
            setMeasuredDimension(Math.min(Math.max(getMeasuredWidth(), measureContentWidth(getAdapter(), getBackground())), android.view.View.MeasureSpec.getSize(i)), getMeasuredHeight());
    }

    public boolean performClick()
    {
        boolean flag = performClick();
        if (!flag)
        {
            flag = true;
            if (!mPopup.isShowing())
                mPopup.show();
        }
        return flag;
    }

    public volatile void setAdapter(Adapter adapter)
    {
        setAdapter((SpinnerAdapter)adapter);
    }

    public void setAdapter(SpinnerAdapter spinneradapter)
    {
        setAdapter(spinneradapter);
        if (mPopup != null)
        {
            mPopup.setAdapter(new DropDownAdapter(spinneradapter));
            return;
        } else
        {
            mTempAdapter = new DropDownAdapter(spinneradapter);
            return;
        }
    }

    public void setDropDownHorizontalOffset(int i)
    {
        mPopup.setHorizontalOffset(i);
    }

    public void setDropDownVerticalOffset(int i)
    {
        mPopup.setVerticalOffset(i);
    }

    public void setDropDownWidth(int i)
    {
        if (!(mPopup instanceof DropdownPopup))
        {
            Log.e("Spinner", "Cannot set dropdown width for MODE_DIALOG, ignoring");
            return;
        } else
        {
            mDropDownWidth = i;
            return;
        }
    }

    public void setEnabled(boolean flag)
    {
        setEnabled(flag);
        if (mDisableChildrenWhenDisabled)
        {
            int i = getChildCount();
            for (int j = 0; j < i; j++)
                getChildAt(j).setEnabled(flag);

        }
    }

    public void setGravity(int i)
    {
        if (mGravity != i)
        {
            if ((i & 7) == 0)
                i |= 0x800003;
            mGravity = i;
            requestLayout();
        }
    }

    public void setOnItemClickListener(AdapterView.OnItemClickListener onitemclicklistener)
    {
        throw new RuntimeException("setOnItemClickListener cannot be used with a spinner.");
    }

    public void setOnItemClickListenerInt(AdapterView.OnItemClickListener onitemclicklistener)
    {
        setOnItemClickListener(onitemclicklistener);
    }

    public void setPopupBackgroundDrawable(Drawable drawable)
    {
        if (!(mPopup instanceof DropdownPopup))
        {
            Log.e("Spinner", "setPopupBackgroundDrawable: incompatible spinner mode; ignoring...");
            return;
        } else
        {
            ((DropdownPopup)mPopup).setBackgroundDrawable(drawable);
            return;
        }
    }

    public void setPopupBackgroundResource(int i)
    {
        setPopupBackgroundDrawable(getContext().getResources().getDrawable(i));
    }

    public void setPrompt(CharSequence charsequence)
    {
        mPopup.setPromptText(charsequence);
    }

    public void setPromptId(int i)
    {
        setPrompt(getContext().getText(i));
    }




    // Unreferenced inner class android/widget/Spinner$DropdownPopup$1

/* anonymous class */
    class DropdownPopup._cls1
        implements AdapterView.OnItemClickListener
    {

        final DropdownPopup this$1;
        final Spinner val$this$0;

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
            setSelection(i);
            if (mOnItemClickListener != null)
                performItemClick(view, i, mAdapter.getItemId(i));
            dismiss();
        }

            
            {
                this$1 = final_dropdownpopup;
                this$0 = Spinner.this;
                super();
            }
    }


    // Unreferenced inner class android/widget/Spinner$DropdownPopup$2

/* anonymous class */
    class DropdownPopup._cls2
        implements android.view.ViewTreeObserver.OnGlobalLayoutListener
    {

        final DropdownPopup this$1;

        public void onGlobalLayout()
        {
            if (!isVisibleToUser())
                dismiss();
        }

            
            {
                this$1 = DropdownPopup.this;
                super();
            }
    }


    // Unreferenced inner class android/widget/Spinner$DropdownPopup$3

/* anonymous class */
    class DropdownPopup._cls3
        implements PopupWindow.OnDismissListener
    {

        final DropdownPopup this$1;
        final android.view.ViewTreeObserver.OnGlobalLayoutListener val$layoutListener;

        public void onDismiss()
        {
            ViewTreeObserver viewtreeobserver = getViewTreeObserver();
            if (viewtreeobserver != null)
                viewtreeobserver.removeOnGlobalLayoutListener(layoutListener);
        }

            
            {
                this$1 = final_dropdownpopup;
                layoutListener = android.view.ViewTreeObserver.OnGlobalLayoutListener.this;
                super();
            }
    }

}
