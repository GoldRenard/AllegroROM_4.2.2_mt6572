// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.*;

// Referenced classes of package android.widget:
//            LinearLayout, FrameLayout, ImageView, ListPopupWindow, 
//            ListView, ActivityChooserModel, BaseAdapter, TextView, 
//            AdapterView

public class ActivityChooserView extends ViewGroup
    implements ActivityChooserModel.ActivityChooserModelClient
{
    private class ActivityChooserViewAdapter extends BaseAdapter
    {

        private static final int ITEM_VIEW_TYPE_ACTIVITY = 0;
        private static final int ITEM_VIEW_TYPE_COUNT = 3;
        private static final int ITEM_VIEW_TYPE_FOOTER = 1;
        public static final int MAX_ACTIVITY_COUNT_DEFAULT = 4;
        public static final int MAX_ACTIVITY_COUNT_UNLIMITED = 0x7fffffff;
        private ActivityChooserModel mDataModel;
        private boolean mHighlightDefaultActivity;
        private int mMaxActivityCount;
        private boolean mShowDefaultActivity;
        private boolean mShowFooterView;
        final ActivityChooserView this$0;

        public int getActivityCount()
        {
            return mDataModel.getActivityCount();
        }

        public int getCount()
        {
            int i = mDataModel.getActivityCount();
            if (!mShowDefaultActivity && mDataModel.getDefaultActivity() != null)
                i--;
            int j = Math.min(i, mMaxActivityCount);
            if (mShowFooterView)
                j++;
            return j;
        }

        public ActivityChooserModel getDataModel()
        {
            return mDataModel;
        }

        public ResolveInfo getDefaultActivity()
        {
            return mDataModel.getDefaultActivity();
        }

        public int getHistorySize()
        {
            return mDataModel.getHistorySize();
        }

        public Object getItem(int i)
        {
            switch (getItemViewType(i))
            {
            case 0: // '\0'
                if (!mShowDefaultActivity && mDataModel.getDefaultActivity() != null)
                    i++;
                return mDataModel.getActivity(i);

            case 1: // '\001'
                return null;
            }
            throw new IllegalArgumentException();
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public int getItemViewType(int i)
        {
            return !mShowFooterView || i != -1 + getCount() ? 0 : 1;
        }

        public int getMaxActivityCount()
        {
            return mMaxActivityCount;
        }

        public boolean getShowDefaultActivity()
        {
            return mShowDefaultActivity;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            switch (getItemViewType(i))
            {
            case 0: // '\0'
                if (view == null || view.getId() != 0x1020257)
                    view = LayoutInflater.from(getContext()).inflate(0x1090020, viewgroup, false);
                android.content.pm.PackageManager packagemanager = 
// JavaClassFileOutputException: get_constant: invalid tag

        public int getViewTypeCount()
        {
            return 3;
        }

        public int measureContentWidth()
        {
            int i = mMaxActivityCount;
            mMaxActivityCount = 0x7fffffff;
            int j = 0;
            View view = null;
            int k = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
            int l = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
            int i1 = getCount();
            for (int j1 = 0; j1 < i1; j1++)
            {
                view = getView(j1, view, null);
                view.measure(k, l);
                j = Math.max(j, view.getMeasuredWidth());
            }

            mMaxActivityCount = i;
            return j;
        }

        public void setDataModel(ActivityChooserModel activitychoosermodel)
        {
            ActivityChooserModel activitychoosermodel1 = mAdapter.getDataModel();
            if (activitychoosermodel1 != null && isShown())
                activitychoosermodel1.unregisterObserver(mModelDataSetOberver);
            mDataModel = activitychoosermodel;
            if (activitychoosermodel != null && isShown())
                activitychoosermodel.registerObserver(mModelDataSetOberver);
            notifyDataSetChanged();
        }

        public void setMaxActivityCount(int i)
        {
            if (mMaxActivityCount != i)
            {
                mMaxActivityCount = i;
                notifyDataSetChanged();
            }
        }

        public void setShowDefaultActivity(boolean flag, boolean flag1)
        {
            if (mShowDefaultActivity != flag || mHighlightDefaultActivity != flag1)
            {
                mShowDefaultActivity = flag;
                mHighlightDefaultActivity = flag1;
                notifyDataSetChanged();
            }
        }

        public void setShowFooterView(boolean flag)
        {
            if (mShowFooterView != flag)
            {
                mShowFooterView = flag;
                notifyDataSetChanged();
            }
        }

        private ActivityChooserViewAdapter()
        {
            this$0 = ActivityChooserView.this;
            super();
            mMaxActivityCount = 4;
        }

    }

    private class Callbacks
        implements AdapterView.OnItemClickListener, android.view.View.OnClickListener, android.view.View.OnLongClickListener, PopupWindow.OnDismissListener
    {

        final ActivityChooserView this$0;

        private void notifyOnDismissListener()
        {
            if (mOnDismissListener != null)
                mOnDismissListener.onDismiss();
        }

        public void onClick(View view)
        {
            if (view == mDefaultActivityButton)
            {
                dismissPopup();
                ResolveInfo resolveinfo = mAdapter.getDefaultActivity();
                int i = mAdapter.getDataModel().getActivityIndex(resolveinfo);
                Intent intent = mAdapter.getDataModel().chooseActivity(i);
                if (intent != null)
                {
                    intent.addFlags(0x80000);
                    
// JavaClassFileOutputException: get_constant: invalid tag

        public void onDismiss()
        {
            notifyOnDismissListener();
            if (mProvider != null)
                mProvider.subUiVisibilityChanged(false);
        }

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
label0:
            {
                switch (((ActivityChooserViewAdapter)adapterview.getAdapter()).getItemViewType(i))
                {
                default:
                    break label0;

                case 0: // '\0'
                    dismissPopup();
                    if (mIsSelectingDefaultActivity)
                    {
                        if (i > 0)
                        {
                            mAdapter.getDataModel().setDefaultActivity(i);
                            return;
                        }
                    } else
                    {
                        if (!mAdapter.getShowDefaultActivity())
                            i++;
                        Intent intent = mAdapter.getDataModel().chooseActivity(i);
                        if (intent != null)
                        {
                            intent.addFlags(0x80000);
                            
// JavaClassFileOutputException: get_constant: invalid tag

        public boolean onLongClick(View view)
        {
            if (view == mDefaultActivityButton)
            {
                if (mAdapter.getCount() > 0)
                {
                    mIsSelectingDefaultActivity = true;
                    showPopupUnchecked(mInitialActivityCount);
                }
                return true;
            } else
            {
                throw new IllegalArgumentException();
            }
        }

        private Callbacks()
        {
            this$0 = ActivityChooserView.this;
            super();
        }

    }


    private final LinearLayout mActivityChooserContent;
    private final Drawable mActivityChooserContentBackground;
    private final ActivityChooserViewAdapter mAdapter;
    private final Callbacks mCallbacks;
    private int mDefaultActionButtonContentDescription;
    private final FrameLayout mDefaultActivityButton;
    private final ImageView mDefaultActivityButtonImage;
    private final FrameLayout mExpandActivityOverflowButton;
    private final ImageView mExpandActivityOverflowButtonImage;
    private int mInitialActivityCount;
    private boolean mIsAttachedToWindow;
    private boolean mIsSelectingDefaultActivity;
    private final int mListPopupMaxWidth;
    private ListPopupWindow mListPopupWindow;
    private final DataSetObserver mModelDataSetOberver;
    private PopupWindow.OnDismissListener mOnDismissListener;
    private final android.view.ViewTreeObserver.OnGlobalLayoutListener mOnGlobalLayoutListener;
    ActionProvider mProvider;

    public ActivityChooserView(Context context)
    {
        this(context, null);
    }

    public ActivityChooserView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ActivityChooserView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mModelDataSetOberver = new DataSetObserver() {

            final ActivityChooserView this$0;

            public void onChanged()
            {
                super.onChanged();
                mAdapter.notifyDataSetChanged();
            }

            public void onInvalidated()
            {
                super.onInvalidated();
                mAdapter.notifyDataSetInvalidated();
            }

            
            {
                this$0 = ActivityChooserView.this;
                super();
            }
        }
;
        mOnGlobalLayoutListener = new android.view.ViewTreeObserver.OnGlobalLayoutListener() {

            final ActivityChooserView this$0;

            public void onGlobalLayout()
            {
                if (isShowingPopup())
                    if (!isShown())
                    {
                        getListPopupWindow().dismiss();
                    } else
                    {
                        getListPopupWindow().show();
                        if (mProvider != null)
                        {
                            mProvider.subUiVisibilityChanged(true);
                            return;
                        }
                    }
            }

            
            {
                this$0 = ActivityChooserView.this;
                super();
            }
        }
;
        mInitialActivityCount = 4;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ActivityChooserView, i, 0);
        mInitialActivityCount = typedarray.getInt(0, 4);
        Drawable drawable = typedarray.getDrawable(1);
        typedarray.recycle();
        LayoutInflater.from(super.mContext).inflate(0x109001f, this, true);
        mCallbacks = new Callbacks();
        mActivityChooserContent = (LinearLayout)findViewById(0x1020253);
        mActivityChooserContentBackground = mActivityChooserContent.getBackground();
        mDefaultActivityButton = (FrameLayout)findViewById(0x1020256);
        mDefaultActivityButton.setOnClickListener(mCallbacks);
        mDefaultActivityButton.setOnLongClickListener(mCallbacks);
        mDefaultActivityButtonImage = (ImageView)mDefaultActivityButton.findViewById(0x1020255);
        mExpandActivityOverflowButton = (FrameLayout)findViewById(0x1020254);
        mExpandActivityOverflowButton.setOnClickListener(mCallbacks);
        mExpandActivityOverflowButtonImage = (ImageView)mExpandActivityOverflowButton.findViewById(0x1020255);
        mExpandActivityOverflowButtonImage.setImageDrawable(drawable);
        mAdapter = new ActivityChooserViewAdapter();
        mAdapter.registerDataSetObserver(new DataSetObserver() {

            final ActivityChooserView this$0;

            public void onChanged()
            {
                super.onChanged();
                updateAppearance();
            }

            
            {
                this$0 = ActivityChooserView.this;
                super();
            }
        }
);
        Resources resources = context.getResources();
        mListPopupMaxWidth = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(0x1050007));
    }

    private ListPopupWindow getListPopupWindow()
    {
        if (mListPopupWindow == null)
        {
            mListPopupWindow = new ListPopupWindow(getContext());
            mListPopupWindow.setAdapter(mAdapter);
            mListPopupWindow.setAnchorView(this);
            mListPopupWindow.setModal(true);
            mListPopupWindow.setOnItemClickListener(mCallbacks);
            mListPopupWindow.setOnDismissListener(mCallbacks);
        }
        return mListPopupWindow;
    }

    private void showPopupUnchecked(int i)
    {
        if (mAdapter.getDataModel() == null)
            throw new IllegalStateException("No data model. Did you call #setDataModel?");
        getViewTreeObserver().addOnGlobalLayoutListener(mOnGlobalLayoutListener);
        boolean flag;
        if (mDefaultActivityButton.getVisibility() == 0)
            flag = true;
        else
            flag = false;
        int j = mAdapter.getActivityCount();
        int k;
        if (flag)
            k = 1;
        else
            k = 0;
        if (i != 0x7fffffff && j > i + k)
        {
            mAdapter.setShowFooterView(true);
            mAdapter.setMaxActivityCount(i - 1);
        } else
        {
            mAdapter.setShowFooterView(false);
            mAdapter.setMaxActivityCount(i);
        }
        ListPopupWindow listpopupwindow = getListPopupWindow();
        if (!listpopupwindow.isShowing())
        {
            if (!mIsSelectingDefaultActivity && flag)
                mAdapter.setShowDefaultActivity(false, false);
            else
                mAdapter.setShowDefaultActivity(true, flag);
            listpopupwindow.setContentWidth(Math.min(mAdapter.measureContentWidth(), mListPopupMaxWidth));
            listpopupwindow.show();
            if (mProvider != null)
                mProvider.subUiVisibilityChanged(true);
            listpopupwindow.getListView().setContentDescription(super.mContext.getString(0x10404d2));
        }
    }

    private void updateAppearance()
    {
        if (mAdapter.getCount() > 0)
            mExpandActivityOverflowButton.setEnabled(true);
        else
            mExpandActivityOverflowButton.setEnabled(false);
        int i = mAdapter.getActivityCount();
        int j = mAdapter.getHistorySize();
        if (i != 1 && (i <= 1 || j <= 0))
        {
            mDefaultActivityButton.setVisibility(8);
        } else
        {
            mDefaultActivityButton.setVisibility(0);
            ResolveInfo resolveinfo = mAdapter.getDefaultActivity();
            android.content.pm.PackageManager packagemanager = super.mContext.getPackageManager();
            mDefaultActivityButtonImage.setImageDrawable(resolveinfo.loadIcon(packagemanager));
            if (mDefaultActionButtonContentDescription != 0)
            {
                CharSequence charsequence = resolveinfo.loadLabel(packagemanager);
                String s = super.mContext.getString(mDefaultActionButtonContentDescription, new Object[] {
                    charsequence
                });
                mDefaultActivityButton.setContentDescription(s);
            }
        }
        if (mDefaultActivityButton.getVisibility() == 0)
        {
            mActivityChooserContent.setBackgroundDrawable(mActivityChooserContentBackground);
            return;
        } else
        {
            mActivityChooserContent.setBackgroundDrawable(null);
            return;
        }
    }

    public boolean dismissPopup()
    {
        if (isShowingPopup())
        {
            getListPopupWindow().dismiss();
            ViewTreeObserver viewtreeobserver = getViewTreeObserver();
            if (viewtreeobserver.isAlive())
                viewtreeobserver.removeOnGlobalLayoutListener(mOnGlobalLayoutListener);
        }
        return true;
    }

    public ActivityChooserModel getDataModel()
    {
        return mAdapter.getDataModel();
    }

    public boolean isShowingPopup()
    {
        return getListPopupWindow().isShowing();
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        ActivityChooserModel activitychoosermodel = mAdapter.getDataModel();
        if (activitychoosermodel != null)
            activitychoosermodel.registerObserver(mModelDataSetOberver);
        mIsAttachedToWindow = true;
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        ActivityChooserModel activitychoosermodel = mAdapter.getDataModel();
        if (activitychoosermodel != null)
            activitychoosermodel.unregisterObserver(mModelDataSetOberver);
        ViewTreeObserver viewtreeobserver = getViewTreeObserver();
        if (viewtreeobserver.isAlive())
            viewtreeobserver.removeOnGlobalLayoutListener(mOnGlobalLayoutListener);
        if (isShowingPopup())
            dismissPopup();
        mIsAttachedToWindow = false;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        mActivityChooserContent.layout(0, 0, k - i, l - j);
        if (!isShowingPopup())
            dismissPopup();
    }

    protected void onMeasure(int i, int j)
    {
        LinearLayout linearlayout = mActivityChooserContent;
        if (mDefaultActivityButton.getVisibility() != 0)
            j = android.view.View.MeasureSpec.makeMeasureSpec(android.view.View.MeasureSpec.getSize(j), 0x40000000);
        measureChild(linearlayout, i, j);
        setMeasuredDimension(linearlayout.getMeasuredWidth(), linearlayout.getMeasuredHeight());
    }

    public void setActivityChooserModel(ActivityChooserModel activitychoosermodel)
    {
        mAdapter.setDataModel(activitychoosermodel);
        if (isShowingPopup())
        {
            dismissPopup();
            showPopup();
        }
    }

    public void setDefaultActionButtonContentDescription(int i)
    {
        mDefaultActionButtonContentDescription = i;
    }

    public void setExpandActivityOverflowButtonContentDescription(int i)
    {
        String s = super.mContext.getString(i);
        mExpandActivityOverflowButtonImage.setContentDescription(s);
    }

    public void setExpandActivityOverflowButtonDrawable(Drawable drawable)
    {
        mExpandActivityOverflowButtonImage.setImageDrawable(drawable);
    }

    public void setInitialActivityCount(int i)
    {
        mInitialActivityCount = i;
    }

    public void setOnDismissListener(PopupWindow.OnDismissListener ondismisslistener)
    {
        mOnDismissListener = ondismisslistener;
    }

    public void setProvider(ActionProvider actionprovider)
    {
        mProvider = actionprovider;
    }

    public boolean showPopup()
    {
        if (!isShowingPopup() && mIsAttachedToWindow)
        {
            mIsSelectingDefaultActivity = false;
            showPopupUnchecked(mInitialActivityCount);
            return true;
        } else
        {
            return false;
        }
    }













/*
    static boolean access$602(ActivityChooserView activitychooserview, boolean flag)
    {
        activitychooserview.mIsSelectingDefaultActivity = flag;
        return flag;
    }

*/



}
