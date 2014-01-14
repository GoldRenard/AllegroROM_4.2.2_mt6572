// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.recent;

import android.animation.Animator;
import android.animation.LayoutTransition;
import android.app.*;
import android.content.Context;
import android.content.Intent;
import android.content.res.*;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.*;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.widget.*;
import com.android.systemui.statusbar.tablet.StatusBarPanel;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.android.systemui.recent:
//            RecentsCallback, RecentTasksLoader, RecentsActivity, TaskDescription, 
//            StatusBarTouchProxy

public class RecentsPanelView extends FrameLayout
    implements android.widget.AdapterView.OnItemClickListener, RecentsCallback, StatusBarPanel, android.animation.Animator.AnimatorListener
{
    private final class OnLongClickDelegate
        implements android.view.View.OnLongClickListener
    {

        View mOtherView;
        final RecentsPanelView this$0;

        public boolean onLongClick(View view)
        {
            return mOtherView.performLongClick();
        }

        OnLongClickDelegate(View view)
        {
            this$0 = RecentsPanelView.this;
            super();
            mOtherView = view;
        }
    }

    public static interface RecentsScrollView
    {

        public abstract View findViewForTask(int i);

        public abstract int numItemsInOneScreenful();

        public abstract void setAdapter(TaskDescriptionAdapter taskdescriptionadapter);

        public abstract void setCallback(RecentsCallback recentscallback);

        public abstract void setMinSwipeAlpha(float f);
    }

    final class TaskDescriptionAdapter extends BaseAdapter
    {

        private LayoutInflater mInflater;
        final RecentsPanelView this$0;

        public View createView(ViewGroup viewgroup)
        {
            View view = mInflater.inflate(mRecentItemLayoutId, viewgroup, false);
            ViewHolder viewholder = new ViewHolder();
            viewholder.thumbnailView = view.findViewById(0x7f0800bb);
            viewholder.thumbnailViewImage = (ImageView)view.findViewById(0x7f0800bc);
            updateThumbnail(viewholder, mRecentTasksLoader.getDefaultThumbnail(), false, false);
            viewholder.iconView = (ImageView)view.findViewById(0x7f0800ba);
            viewholder.iconView.setImageBitmap(mRecentTasksLoader.getDefaultIcon());
            viewholder.labelView = (TextView)view.findViewById(0x7f0800b9);
            viewholder.calloutLine = view.findViewById(0x7f0800bd);
            viewholder.descriptionView = (TextView)view.findViewById(0x7f0800be);
            view.setTag(viewholder);
            return view;
        }

        public int getCount()
        {
            if (mRecentTaskDescriptions != null)
                return mRecentTaskDescriptions.size();
            else
                return 0;
        }

        public Object getItem(int i)
        {
            return Integer.valueOf(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            if (view == null)
                view = createView(viewgroup);
            ViewHolder viewholder = (ViewHolder)view.getTag();
            int j = -1 + (mRecentTaskDescriptions.size() - i);
            TaskDescription taskdescription = (TaskDescription)mRecentTaskDescriptions.get(j);
            viewholder.labelView.setText(taskdescription.getLabel());
            viewholder.thumbnailView.setContentDescription(taskdescription.getLabel());
            viewholder.loadedThumbnailAndIcon = taskdescription.isLoaded();
            if (taskdescription.isLoaded())
            {
                updateThumbnail(viewholder, taskdescription.getThumbnail(), true, false);
                updateIcon(viewholder, taskdescription.getIcon(), true, false);
            }
            if (j == 0 && mAnimateIconOfFirstTask)
            {
                if (mItemToAnimateInWhenWindowAnimationIsFinished != null)
                {
                    viewholder.iconView.setAlpha(1.0F);
                    viewholder.iconView.setTranslationX(0.0F);
                    viewholder.iconView.setTranslationY(0.0F);
                    viewholder.labelView.setAlpha(1.0F);
                    viewholder.labelView.setTranslationX(0.0F);
                    viewholder.labelView.setTranslationY(0.0F);
                    if (viewholder.calloutLine != null)
                    {
                        viewholder.calloutLine.setAlpha(1.0F);
                        viewholder.calloutLine.setTranslationX(0.0F);
                        viewholder.calloutLine.setTranslationY(0.0F);
                    }
                }
                mItemToAnimateInWhenWindowAnimationIsFinished = viewholder;
                int k = -getResources().getDimensionPixelSize(0x7f0d0010);
                if (getResources().getConfiguration().orientation == 1)
                {
                    viewholder.iconView.setAlpha(0.0F);
                    viewholder.iconView.setTranslationX(k);
                    viewholder.labelView.setAlpha(0.0F);
                    viewholder.labelView.setTranslationX(k);
                    viewholder.calloutLine.setAlpha(0.0F);
                    viewholder.calloutLine.setTranslationX(k);
                } else
                {
                    viewholder.iconView.setAlpha(0.0F);
                    viewholder.iconView.setTranslationY(k);
                }
                if (!mWaitingForWindowAnimation)
                    animateInIconOfFirstTask();
            }
            viewholder.thumbnailView.setTag(taskdescription);
            viewholder.thumbnailView.setOnLongClickListener(new OnLongClickDelegate(view));
            viewholder.taskDescription = taskdescription;
            return view;
        }

        public void recycleView(View view)
        {
            ViewHolder viewholder = (ViewHolder)view.getTag();
            updateThumbnail(viewholder, mRecentTasksLoader.getDefaultThumbnail(), false, false);
            viewholder.iconView.setImageBitmap(mRecentTasksLoader.getDefaultIcon());
            viewholder.iconView.setVisibility(4);
            viewholder.iconView.animate().cancel();
            viewholder.labelView.setText(null);
            viewholder.labelView.animate().cancel();
            viewholder.thumbnailView.setContentDescription(null);
            viewholder.thumbnailView.setTag(null);
            viewholder.thumbnailView.setOnLongClickListener(null);
            viewholder.thumbnailView.setVisibility(4);
            viewholder.iconView.setAlpha(1.0F);
            viewholder.iconView.setTranslationX(0.0F);
            viewholder.iconView.setTranslationY(0.0F);
            viewholder.labelView.setAlpha(1.0F);
            viewholder.labelView.setTranslationX(0.0F);
            viewholder.labelView.setTranslationY(0.0F);
            if (viewholder.calloutLine != null)
            {
                viewholder.calloutLine.setAlpha(1.0F);
                viewholder.calloutLine.setTranslationX(0.0F);
                viewholder.calloutLine.setTranslationY(0.0F);
                viewholder.calloutLine.animate().cancel();
            }
            viewholder.taskDescription = null;
            viewholder.loadedThumbnailAndIcon = false;
        }

        public TaskDescriptionAdapter(Context context)
        {
            this$0 = RecentsPanelView.this;
            super();
            mInflater = LayoutInflater.from(context);
        }
    }

    static final class ViewHolder
    {

        View calloutLine;
        TextView descriptionView;
        ImageView iconView;
        TextView labelView;
        boolean loadedThumbnailAndIcon;
        TaskDescription taskDescription;
        View thumbnailView;
        ImageView thumbnailViewImage;
        Bitmap thumbnailViewImageBitmap;

    }


    static final boolean DEBUG = false;
    static final String TAG = "RecentsPanelView";
    private boolean mAnimateIconOfFirstTask;
    private boolean mFitThumbnailToXY;
    private boolean mHighEndGfx;
    private ViewHolder mItemToAnimateInWhenWindowAnimationIsFinished;
    private TaskDescriptionAdapter mListAdapter;
    private PopupMenu mPopup;
    private int mRecentItemLayoutId;
    private ArrayList mRecentTaskDescriptions;
    private RecentTasksLoader mRecentTasksLoader;
    private ViewGroup mRecentsContainer;
    private View mRecentsNoApps;
    private View mRecentsScrim;
    private boolean mShowing;
    private StatusBarTouchProxy mStatusBarTouchProxy;
    private int mThumbnailWidth;
    private boolean mWaitingForWindowAnimation;
    private boolean mWaitingToShow;
    private long mWindowAnimationStartTime;

    public RecentsPanelView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public RecentsPanelView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        updateValuesFromResources();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.systemui.R.styleable.RecentsPanelView, i, 0);
        mRecentItemLayoutId = typedarray.getResourceId(0, 0);
        mRecentTasksLoader = RecentTasksLoader.getInstance(context);
        typedarray.recycle();
    }

    private void animateInIconOfFirstTask()
    {
        if (mItemToAnimateInWhenWindowAnimationIsFinished != null && !mRecentTasksLoader.isFirstScreenful())
        {
            int i = Math.max(0, Math.min(150 - (int)(System.currentTimeMillis() - mWindowAnimationStartTime), 150));
            ViewHolder viewholder = mItemToAnimateInWhenWindowAnimationIsFinished;
            DecelerateInterpolator decelerateinterpolator = new DecelerateInterpolator(1.5F);
            View aview[] = new View[3];
            aview[0] = viewholder.iconView;
            aview[1] = viewholder.labelView;
            aview[2] = viewholder.calloutLine;
            int j = aview.length;
            for (int k = 0; k < j; k++)
            {
                View view = aview[k];
                if (view != null)
                    view.animate().translationX(0.0F).translationY(0.0F).alpha(1.0F).setStartDelay(i).setDuration(250L).setInterpolator(decelerateinterpolator);
            }

            mItemToAnimateInWhenWindowAnimationIsFinished = null;
            mAnimateIconOfFirstTask = false;
        }
    }

    private void createCustomAnimations(LayoutTransition layouttransition)
    {
        layouttransition.setDuration(200L);
        layouttransition.setStartDelay(1, 0L);
        layouttransition.setAnimator(3, null);
    }

    private boolean pointInside(int i, int j, View view)
    {
        int k = view.getLeft();
        int l = view.getRight();
        int i1 = view.getTop();
        int j1 = view.getBottom();
        return i >= k && i < l && j >= i1 && j < j1;
    }

    private void refreshRecentTasksList(ArrayList arraylist, boolean flag)
    {
        if (mRecentTaskDescriptions == null && arraylist != null)
        {
            onTasksLoaded(arraylist, flag);
            return;
        } else
        {
            mRecentTasksLoader.loadTasksInBackground();
            return;
        }
    }

    static void sendCloseSystemWindows(Context context, String s)
    {
        if (!ActivityManagerNative.isSystemReady()) goto _L2; else goto _L1
_L1:
        IWindowManager iwindowmanager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));
        boolean flag;
        flag = false;
        if (iwindowmanager == null)
            break MISSING_BLOCK_LABEL_36;
        boolean flag1 = iwindowmanager.isKeyguardLocked();
        flag = flag1;
_L5:
        if (flag) goto _L2; else goto _L3
_L3:
        ActivityManagerNative.getDefault().closeSystemDialogs(s);
_L2:
        return;
        RemoteException remoteexception1;
        remoteexception1;
        return;
        RemoteException remoteexception;
        remoteexception;
        flag = false;
        if (true) goto _L5; else goto _L4
_L4:
    }

    private void showIfReady()
    {
        if (mWaitingToShow && mRecentTaskDescriptions != null)
            showImpl(true);
    }

    private void showImpl(boolean flag)
    {
        sendCloseSystemWindows(mContext, "recentapps");
        mShowing = flag;
        if (flag)
        {
            boolean flag1;
            if (mRecentTaskDescriptions != null && mRecentTaskDescriptions.size() == 0)
                flag1 = true;
            else
                flag1 = false;
            TextView textview = (TextView)mRecentsNoApps.findViewById(0x7f0800b1);
            Xlog.d("RecentsPanelView", (new StringBuilder()).append("show: mRecentsNoApps = ").append(mRecentsNoApps).append(",noRecentTextView = ").append(textview).toString());
            int i = mContext.getResources().getThemeMainColor();
            if (i != 0)
                textview.setTextColor(i);
            mRecentsNoApps.setAlpha(1.0F);
            View view = mRecentsNoApps;
            byte byte0 = 0;
            if (!flag1)
                byte0 = 4;
            view.setVisibility(byte0);
            onAnimationEnd(null);
            setFocusable(true);
            setFocusableInTouchMode(true);
            requestFocus();
        } else
        {
            mWaitingToShow = false;
            if (mPopup != null)
            {
                mPopup.dismiss();
                return;
            }
        }
    }

    private void startApplicationDetailsActivity(String s)
    {
        Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.fromParts("package", s, null));
        intent.setComponent(intent.resolveActivity(mContext.getPackageManager()));
        TaskStackBuilder.create(getContext()).addNextIntentWithParentStack(intent).startActivities();
    }

    private void updateIcon(ViewHolder viewholder, Drawable drawable, boolean flag, boolean flag1)
    {
        if (drawable != null)
        {
            viewholder.iconView.setImageDrawable(drawable);
            if (flag && viewholder.iconView.getVisibility() != 0)
            {
                if (flag1)
                    viewholder.iconView.setAnimation(AnimationUtils.loadAnimation(mContext, 0x7f05000b));
                viewholder.iconView.setVisibility(0);
            }
        }
    }

    private void updateThumbnail(ViewHolder viewholder, Bitmap bitmap, boolean flag, boolean flag1)
    {
        if (bitmap != null)
        {
            viewholder.thumbnailViewImage.setImageBitmap(bitmap);
            if (viewholder.thumbnailViewImageBitmap == null || viewholder.thumbnailViewImageBitmap.getWidth() != bitmap.getWidth() || viewholder.thumbnailViewImageBitmap.getHeight() != bitmap.getHeight())
                if (mFitThumbnailToXY)
                {
                    viewholder.thumbnailViewImage.setScaleType(android.widget.ImageView.ScaleType.FIT_XY);
                } else
                {
                    Matrix matrix = new Matrix();
                    float f = (float)mThumbnailWidth / (float)bitmap.getWidth();
                    matrix.setScale(f, f);
                    viewholder.thumbnailViewImage.setScaleType(android.widget.ImageView.ScaleType.MATRIX);
                    viewholder.thumbnailViewImage.setImageMatrix(matrix);
                }
            if (flag && viewholder.thumbnailView.getVisibility() != 0)
            {
                if (flag1)
                    viewholder.thumbnailView.setAnimation(AnimationUtils.loadAnimation(mContext, 0x7f05000b));
                viewholder.thumbnailView.setVisibility(0);
            }
            viewholder.thumbnailViewImageBitmap = bitmap;
        }
    }

    private void updateUiElements()
    {
        int i;
        if (mRecentTaskDescriptions != null)
            i = mRecentTaskDescriptions.size();
        else
            i = 0;
        ViewGroup viewgroup = mRecentsContainer;
        byte byte0;
        if (i > 0)
            byte0 = 0;
        else
            byte0 = 8;
        viewgroup.setVisibility(byte0);
        int j;
        if (mRecentTaskDescriptions != null)
            j = mRecentTaskDescriptions.size();
        else
            j = 0;
        String s;
        if (j == 0)
        {
            s = getResources().getString(0x7f0b0042);
        } else
        {
            Resources resources = getResources();
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(j);
            s = resources.getQuantityString(0x7f0e0000, j, aobj);
        }
        setContentDescription(s);
    }

    public void clearRecentTasksList()
    {
        if (mRecentTaskDescriptions != null)
        {
            mRecentTasksLoader.cancelLoadingThumbnailsAndIcons(this);
            onTaskLoadingCancelled();
        }
    }

    public void dismiss()
    {
        ((RecentsActivity)mContext).dismissAndGoHome();
    }

    public void dismissAndGoBack()
    {
        ((RecentsActivity)mContext).dismissAndGoBack();
    }

    public boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        if (i >= 0 && i < getWidth() && j >= 0 && j < getHeight())
            return super.dispatchHoverEvent(motionevent);
        else
            return true;
    }

    public void handleLongPress(final View selectedView, View view, final View thumbnailView)
    {
        thumbnailView.setSelected(true);
        Context context = mContext;
        if (view == null)
            view = selectedView;
        PopupMenu popupmenu = new PopupMenu(context, view);
        mPopup = popupmenu;
        popupmenu.getMenuInflater().inflate(0x7f100001, popupmenu.getMenu());
        popupmenu.setOnMenuItemClickListener(new android.widget.PopupMenu.OnMenuItemClickListener() {

            final RecentsPanelView this$0;
            final View val$selectedView;

            public boolean onMenuItemClick(MenuItem menuitem)
            {
label0:
                {
                    boolean flag;
label1:
                    {
                        if (menuitem.getItemId() == 0x7f080128)
                        {
                            mRecentsContainer.removeViewInLayout(selectedView);
                        } else
                        {
                            int i = menuitem.getItemId();
                            flag = false;
                            if (i != 0x7f080129)
                                break label1;
                            ViewHolder viewholder = (ViewHolder)selectedView.getTag();
                            if (viewholder == null)
                                break label0;
                            TaskDescription taskdescription = viewholder.taskDescription;
                            startApplicationDetailsActivity(taskdescription.packageName);
                            show(false);
                        }
                        flag = true;
                    }
                    return flag;
                }
                throw new IllegalStateException((new StringBuilder()).append("Oops, no tag on view ").append(selectedView).toString());
            }

            
            {
                this$0 = RecentsPanelView.this;
                selectedView = view;
                super();
            }
        }
);
        popupmenu.setOnDismissListener(new android.widget.PopupMenu.OnDismissListener() {

            final RecentsPanelView this$0;
            final View val$thumbnailView;

            public void onDismiss(PopupMenu popupmenu1)
            {
                thumbnailView.setSelected(false);
                mPopup = null;
            }

            
            {
                this$0 = RecentsPanelView.this;
                thumbnailView = view;
                super();
            }
        }
);
        popupmenu.show();
    }

    public void handleOnClick(View view)
    {
        ViewHolder viewholder = (ViewHolder)view.getTag();
        TaskDescription taskdescription = viewholder.taskDescription;
        Context context = view.getContext();
        ActivityManager activitymanager = (ActivityManager)context.getSystemService("activity");
        Bitmap bitmap = viewholder.thumbnailViewImageBitmap;
        boolean flag;
        if (bitmap.getWidth() == viewholder.thumbnailViewImage.getWidth() && bitmap.getHeight() == viewholder.thumbnailViewImage.getHeight())
        {
            flag = false;
        } else
        {
            viewholder.thumbnailViewImage.setDrawingCacheEnabled(true);
            bitmap = viewholder.thumbnailViewImage.getDrawingCache();
            flag = true;
        }
        android.os.Bundle bundle = null;
        if (bitmap != null)
            bundle = ActivityOptions.makeThumbnailScaleUpAnimation(viewholder.thumbnailViewImage, bitmap, 0, 0, null).toBundle();
        show(false);
        if (taskdescription.taskId >= 0)
        {
            activitymanager.moveTaskToFront(taskdescription.taskId, 1, bundle);
        } else
        {
            Intent intent = taskdescription.intent;
            intent.addFlags(0x10104000);
            context.startActivityAsUser(intent, bundle, new UserHandle(-2));
        }
        if (flag)
            viewholder.thumbnailViewImage.setDrawingCacheEnabled(false);
    }

    public void handleSwipe(View view)
    {
        TaskDescription taskdescription = ((ViewHolder)view.getTag()).taskDescription;
        if (taskdescription == null)
        {
            Log.v("RecentsPanelView", (new StringBuilder()).append("Not able to find activity description for swiped task; view=").append(view).append(" tag=").append(view.getTag()).toString());
        } else
        {
            mRecentTaskDescriptions.remove(taskdescription);
            mRecentTasksLoader.remove(taskdescription);
            if (mRecentTaskDescriptions.size() == 0)
                dismissAndGoBack();
            ActivityManager activitymanager = (ActivityManager)mContext.getSystemService("activity");
            if (activitymanager != null)
            {
                activitymanager.removeTask(taskdescription.persistentTaskId, 1);
                Context context = mContext;
                Object aobj[] = new Object[1];
                aobj[0] = taskdescription.getLabel();
                setContentDescription(context.getString(0x7f0b00a6, aobj));
                sendAccessibilityEvent(4);
                setContentDescription(null);
                return;
            }
        }
    }

    public boolean isInContentArea(int i, int j)
    {
        return pointInside(i, j, mRecentsContainer) || mStatusBarTouchProxy != null && pointInside(i, j, mStatusBarTouchProxy);
    }

    public boolean isShowing()
    {
        return mShowing;
    }

    public int numItemsInOneScreenful()
    {
        if (mRecentsContainer instanceof RecentsScrollView)
            return ((RecentsScrollView)mRecentsContainer).numItemsInOneScreenful();
        else
            throw new IllegalArgumentException("missing Recents[Horizontal]ScrollView");
    }

    public void onAnimationCancel(Animator animator)
    {
    }

    public void onAnimationEnd(Animator animator)
    {
        if (mShowing)
        {
            LayoutTransition layouttransition = new LayoutTransition();
            mRecentsContainer.setLayoutTransition(layouttransition);
            createCustomAnimations(layouttransition);
            return;
        } else
        {
            mRecentsContainer.setLayoutTransition(null);
            return;
        }
    }

    public void onAnimationRepeat(Animator animator)
    {
    }

    public void onAnimationStart(Animator animator)
    {
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mRecentsContainer = (ViewGroup)findViewById(0x7f0800c1);
        mStatusBarTouchProxy = (StatusBarTouchProxy)findViewById(0x7f0800fe);
        mListAdapter = new TaskDescriptionAdapter(mContext);
        if (mRecentsContainer instanceof RecentsScrollView)
        {
            RecentsScrollView recentsscrollview = (RecentsScrollView)mRecentsContainer;
            recentsscrollview.setAdapter(mListAdapter);
            recentsscrollview.setCallback(this);
            mRecentsScrim = findViewById(0x7f0800c0);
            mRecentsNoApps = findViewById(0x7f0800c3);
            if (mRecentsScrim != null)
            {
                mHighEndGfx = ActivityManager.isHighEndGfx();
                if (!mHighEndGfx)
                    mRecentsScrim.setBackground(null);
                else
                if (mRecentsScrim.getBackground() instanceof BitmapDrawable)
                {
                    ((BitmapDrawable)mRecentsScrim.getBackground()).setTileModeY(android.graphics.Shader.TileMode.REPEAT);
                    return;
                }
            }
            return;
        } else
        {
            throw new IllegalArgumentException("missing Recents[Horizontal]ScrollView");
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (mPopup != null)
            return true;
        else
            return super.onInterceptTouchEvent(motionevent);
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        handleOnClick(view);
    }

    public void onTaskLoadingCancelled()
    {
        if (mRecentTaskDescriptions != null)
        {
            mRecentTaskDescriptions = null;
            mListAdapter.notifyDataSetInvalidated();
        }
    }

    void onTaskThumbnailLoaded(TaskDescription taskdescription)
    {
        taskdescription;
        JVM INSTR monitorenter ;
        if (mRecentsContainer == null) goto _L2; else goto _L1
_L1:
        ViewGroup viewgroup;
        viewgroup = mRecentsContainer;
        if (viewgroup instanceof RecentsScrollView)
            viewgroup = (ViewGroup)viewgroup.findViewById(0x7f0800c2);
          goto _L3
_L7:
        int i;
        if (i >= viewgroup.getChildCount()) goto _L2; else goto _L4
_L4:
        View view = viewgroup.getChildAt(i);
        if (view.getTag() instanceof ViewHolder)
        {
            ViewHolder viewholder = (ViewHolder)view.getTag();
            if (!viewholder.loadedThumbnailAndIcon && viewholder.taskDescription == taskdescription)
            {
                updateIcon(viewholder, taskdescription.getIcon(), true, false);
                updateThumbnail(viewholder, taskdescription.getThumbnail(), true, false);
                viewholder.loadedThumbnailAndIcon = true;
            }
        }
          goto _L5
_L2:
        taskdescription;
        JVM INSTR monitorexit ;
        showIfReady();
        return;
        Exception exception;
        exception;
        taskdescription;
        JVM INSTR monitorexit ;
        throw exception;
_L3:
        i = 0;
        continue; /* Loop/switch isn't completed */
_L5:
        i++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void onTasksLoaded(ArrayList arraylist, boolean flag)
    {
        if (mRecentTaskDescriptions == null)
            mRecentTaskDescriptions = new ArrayList(arraylist);
        else
            mRecentTaskDescriptions.addAll(arraylist);
        if (((RecentsActivity)mContext).isActivityShowing())
            refreshViews();
    }

    public void onUiHidden()
    {
        if (!mShowing && mRecentTaskDescriptions != null)
        {
            onAnimationEnd(null);
            clearRecentTasksList();
        }
        if (mPopup != null)
            mPopup.dismiss();
    }

    public void onWindowAnimationStart()
    {
        mWaitingForWindowAnimation = false;
        mWindowAnimationStartTime = System.currentTimeMillis();
        animateInIconOfFirstTask();
    }

    public void refreshRecentTasks()
    {
        if (mRecentTaskDescriptions == null)
        {
            Log.d("RecentsActivity", "refreshRecentTasks()");
            refreshRecentTasksList();
        }
    }

    public void refreshRecentTasksList()
    {
        refreshRecentTasksList(null, false);
    }

    public void refreshViews()
    {
        mListAdapter.notifyDataSetInvalidated();
        updateUiElements();
        showIfReady();
    }

    public void setMinSwipeAlpha(float f)
    {
        if (mRecentsContainer instanceof RecentsScrollView)
            ((RecentsScrollView)mRecentsContainer).setMinSwipeAlpha(f);
    }

    public void setRecentTasksLoader(RecentTasksLoader recenttasksloader)
    {
        mRecentTasksLoader = recenttasksloader;
    }

    public void setStatusBarView(View view)
    {
        if (mStatusBarTouchProxy != null)
            mStatusBarTouchProxy.setStatusBar(view);
    }

    public void show(boolean flag)
    {
        show(flag, null, false, false);
    }

    public void show(boolean flag, ArrayList arraylist, boolean flag1, boolean flag2)
    {
        mAnimateIconOfFirstTask = flag2;
        mWaitingForWindowAnimation = flag2;
        if (flag)
        {
            mWaitingToShow = true;
            refreshRecentTasksList(arraylist, flag1);
            showIfReady();
            return;
        } else
        {
            showImpl(false);
            return;
        }
    }

    public boolean simulateClick(int i)
    {
        if (mRecentsContainer instanceof RecentsScrollView)
        {
            View view = ((RecentsScrollView)mRecentsContainer).findViewForTask(i);
            if (view != null)
            {
                handleOnClick(view);
                return true;
            }
        }
        return false;
    }

    public void updateValuesFromResources()
    {
        Resources resources = mContext.getResources();
        mThumbnailWidth = Math.round(resources.getDimension(0x7f0d0003));
        mFitThumbnailToXY = resources.getBoolean(0x7f0a0001);
    }





/*
    static PopupMenu access$1102(RecentsPanelView recentspanelview, PopupMenu popupmenu)
    {
        recentspanelview.mPopup = popupmenu;
        return popupmenu;
    }

*/







/*
    static ViewHolder access$602(RecentsPanelView recentspanelview, ViewHolder viewholder)
    {
        recentspanelview.mItemToAnimateInWhenWindowAnimationIsFinished = viewholder;
        return viewholder;
    }

*/



}
