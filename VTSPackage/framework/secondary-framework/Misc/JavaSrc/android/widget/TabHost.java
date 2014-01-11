// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.app.LocalActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package android.widget:
//            FrameLayout, TabWidget, TextView, ImageView

public class TabHost extends FrameLayout
    implements android.view.ViewTreeObserver.OnTouchModeChangeListener
{
    private static interface ContentStrategy
    {

        public abstract View getContentView();

        public abstract void tabClosed();
    }

    private class FactoryContentStrategy
        implements ContentStrategy
    {

        private TabContentFactory mFactory;
        private View mTabContent;
        private final CharSequence mTag;
        final TabHost this$0;

        public View getContentView()
        {
            if (mTabContent == null)
                mTabContent = mFactory.createTabContent(mTag.toString());
            mTabContent.setVisibility(0);
            return mTabContent;
        }

        public void tabClosed()
        {
            mTabContent.setVisibility(8);
        }

        public FactoryContentStrategy(CharSequence charsequence, TabContentFactory tabcontentfactory)
        {
            this$0 = TabHost.this;
            super();
            mTag = charsequence;
            mFactory = tabcontentfactory;
        }
    }

    private static interface IndicatorStrategy
    {

        public abstract View createIndicatorView();
    }

    private class IntentContentStrategy
        implements ContentStrategy
    {

        private final Intent mIntent;
        private View mLaunchedView;
        private final String mTag;
        final TabHost this$0;

        public View getContentView()
        {
            if (mLocalActivityManager == null)
                throw new IllegalStateException("Did you forget to call 'public void setup(LocalActivityManager activityGroup)'?");
            Window window = mLocalActivityManager.startActivity(mTag, mIntent);
            View view;
            if (window != null)
                view = window.getDecorView();
            else
                view = null;
            if (mLaunchedView != view && mLaunchedView != null && mLaunchedView.getParent() != null)
                mTabContent.removeView(mLaunchedView);
            mLaunchedView = view;
            if (mLaunchedView != null)
            {
                mLaunchedView.setVisibility(0);
                mLaunchedView.setFocusableInTouchMode(true);
                ((ViewGroup)mLaunchedView).setDescendantFocusability(0x40000);
            }
            return mLaunchedView;
        }

        public void tabClosed()
        {
            if (mLaunchedView != null)
                mLaunchedView.setVisibility(8);
        }

        private IntentContentStrategy(String s, Intent intent)
        {
            this$0 = TabHost.this;
            super();
            mTag = s;
            mIntent = intent;
        }

    }

    private class LabelAndIconIndicatorStrategy
        implements IndicatorStrategy
    {

        private final Drawable mIcon;
        private final CharSequence mLabel;
        final TabHost this$0;

        public View createIndicatorView()
        {
            boolean flag = true;
            Context context = getContext();
            View view = ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(mTabLayoutId, mTabWidget, false);
            TextView textview = (TextView)view.findViewById(0x1020016);
            ImageView imageview = (ImageView)view.findViewById(0x1020006);
            boolean flag1;
            if (imageview.getVisibility() == 8)
                flag1 = flag;
            else
                flag1 = false;
            if (flag1 && !TextUtils.isEmpty(mLabel))
                flag = false;
            textview.setText(mLabel);
            if (flag && mIcon != null)
            {
                imageview.setImageDrawable(mIcon);
                imageview.setVisibility(0);
            }
            if (context.getApplicationInfo().targetSdkVersion <= 4)
            {
                view.setBackgroundResource(0x10805b2);
                textview.setTextColor(context.getResources().getColorStateList(0x1060082));
            }
            return view;
        }

        private LabelAndIconIndicatorStrategy(CharSequence charsequence, Drawable drawable)
        {
            this$0 = TabHost.this;
            super();
            mLabel = charsequence;
            mIcon = drawable;
        }

    }

    private class LabelIndicatorStrategy
        implements IndicatorStrategy
    {

        private final CharSequence mLabel;
        final TabHost this$0;

        public View createIndicatorView()
        {
            Context context = getContext();
            View view = ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(mTabLayoutId, mTabWidget, false);
            TextView textview = (TextView)view.findViewById(0x1020016);
            textview.setText(mLabel);
            if (context.getApplicationInfo().targetSdkVersion <= 4)
            {
                view.setBackgroundResource(0x10805b2);
                textview.setTextColor(context.getResources().getColorStateList(0x1060082));
            }
            return view;
        }

        private LabelIndicatorStrategy(CharSequence charsequence)
        {
            this$0 = TabHost.this;
            super();
            mLabel = charsequence;
        }

    }

    public static interface OnTabChangeListener
    {

        public abstract void onTabChanged(String s);
    }

    public static interface TabContentFactory
    {

        public abstract View createTabContent(String s);
    }

    public class TabSpec
    {

        private ContentStrategy mContentStrategy;
        private IndicatorStrategy mIndicatorStrategy;
        private String mTag;
        final TabHost this$0;

        public String getTag()
        {
            return mTag;
        }

        public TabSpec setContent(int i)
        {
            mContentStrategy = new ViewIdContentStrategy(i);
            return this;
        }

        public TabSpec setContent(Intent intent)
        {
            mContentStrategy = new IntentContentStrategy(mTag, intent);
            return this;
        }

        public TabSpec setContent(TabContentFactory tabcontentfactory)
        {
            mContentStrategy = new FactoryContentStrategy(mTag, tabcontentfactory);
            return this;
        }

        public TabSpec setIndicator(View view)
        {
            mIndicatorStrategy = new ViewIndicatorStrategy(view);
            return this;
        }

        public TabSpec setIndicator(CharSequence charsequence)
        {
            mIndicatorStrategy = new LabelIndicatorStrategy(charsequence);
            return this;
        }

        public TabSpec setIndicator(CharSequence charsequence, Drawable drawable)
        {
            mIndicatorStrategy = new LabelAndIconIndicatorStrategy(charsequence, drawable);
            return this;
        }



        private TabSpec(String s)
        {
            this$0 = TabHost.this;
            super();
            mTag = s;
        }

    }

    private class ViewIdContentStrategy
        implements ContentStrategy
    {

        private final View mView;
        final TabHost this$0;

        public View getContentView()
        {
            mView.setVisibility(0);
            return mView;
        }

        public void tabClosed()
        {
            mView.setVisibility(8);
        }

        private ViewIdContentStrategy(int i)
        {
            this$0 = TabHost.this;
            super();
            mView = mTabContent.findViewById(i);
            if (mView != null)
            {
                mView.setVisibility(8);
                return;
            } else
            {
                throw new RuntimeException((new StringBuilder()).append("Could not create tab content because could not find view with id ").append(i).toString());
            }
        }

    }

    private class ViewIndicatorStrategy
        implements IndicatorStrategy
    {

        private final View mView;
        final TabHost this$0;

        public View createIndicatorView()
        {
            return mView;
        }

        private ViewIndicatorStrategy(View view)
        {
            this$0 = TabHost.this;
            super();
            mView = view;
        }

    }


    private static final int TABWIDGET_LOCATION_BOTTOM = 3;
    private static final int TABWIDGET_LOCATION_LEFT = 0;
    private static final int TABWIDGET_LOCATION_RIGHT = 2;
    private static final int TABWIDGET_LOCATION_TOP = 1;
    protected int mCurrentTab;
    private View mCurrentView;
    protected LocalActivityManager mLocalActivityManager;
    private OnTabChangeListener mOnTabChangeListener;
    private FrameLayout mTabContent;
    private android.view.View.OnKeyListener mTabKeyListener;
    private int mTabLayoutId;
    private List mTabSpecs;
    private TabWidget mTabWidget;

    public TabHost(Context context)
    {
        super(context);
        mTabSpecs = new ArrayList(2);
        mCurrentTab = -1;
        mCurrentView = null;
        mLocalActivityManager = null;
        initTabHost();
    }

    public TabHost(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTabSpecs = new ArrayList(2);
        mCurrentTab = -1;
        mCurrentView = null;
        mLocalActivityManager = null;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.TabWidget, 0x1010083, 0);
        mTabLayoutId = typedarray.getResourceId(4, 0);
        typedarray.recycle();
        if (mTabLayoutId == 0)
            mTabLayoutId = 0x10900d2;
        initTabHost();
    }

    private int getTabWidgetLocation()
    {
        switch (mTabWidget.getOrientation())
        {
        case 1: // '\001'
            return mTabContent.getLeft() >= mTabWidget.getLeft() ? 0 : 2;
        }
        return mTabContent.getTop() >= mTabWidget.getTop() ? 1 : 3;
    }

    private void initTabHost()
    {
        setFocusableInTouchMode(true);
        setDescendantFocusability(0x40000);
        mCurrentTab = -1;
        mCurrentView = null;
    }

    private void invokeOnTabChangeListener()
    {
        if (mOnTabChangeListener != null)
            mOnTabChangeListener.onTabChanged(getCurrentTabTag());
    }

    public void addTab(TabSpec tabspec)
    {
        if (tabspec.mIndicatorStrategy == null)
            throw new IllegalArgumentException("you must specify a way to create the tab indicator.");
        if (tabspec.mContentStrategy == null)
            throw new IllegalArgumentException("you must specify a way to create the tab content");
        View view = tabspec.mIndicatorStrategy.createIndicatorView();
        view.setOnKeyListener(mTabKeyListener);
        if (tabspec.mIndicatorStrategy instanceof ViewIndicatorStrategy)
            mTabWidget.setStripEnabled(false);
        mTabWidget.addView(view);
        mTabSpecs.add(tabspec);
        if (mCurrentTab == -1)
            setCurrentTab(0);
    }

    public void clearAllTabs()
    {
        mTabWidget.removeAllViews();
        initTabHost();
        mTabContent.removeAllViews();
        mTabSpecs.clear();
        requestLayout();
        invalidate();
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        boolean flag = super.dispatchKeyEvent(keyevent);
        if (!flag && keyevent.getAction() == 0 && mCurrentView != null && mCurrentView.isRootNamespace() && mCurrentView.hasFocus())
        {
            byte byte0;
            char c;
            byte byte1;
            switch (getTabWidgetLocation())
            {
            case 3: // '\003'
                byte0 = 20;
                c = '\202';
                byte1 = 4;
                break;

            case 2: // '\002'
                byte0 = 22;
                c = 'B';
                byte1 = 3;
                break;

            case 0: // '\0'
                byte0 = 21;
                c = '\021';
                byte1 = 1;
                break;

            case 1: // '\001'
            default:
                byte0 = 19;
                c = '!';
                byte1 = 2;
                break;
            }
            if (keyevent.getKeyCode() == byte0 && mCurrentView.findFocus().focusSearch(c) == null)
            {
                mTabWidget.getChildTabViewAt(mCurrentTab).requestFocus();
                playSoundEffect(byte1);
                flag = true;
            }
        }
        return flag;
    }

    public void dispatchWindowFocusChanged(boolean flag)
    {
        if (mCurrentView != null)
            mCurrentView.dispatchWindowFocusChanged(flag);
    }

    public int getCurrentTab()
    {
        return mCurrentTab;
    }

    public String getCurrentTabTag()
    {
        if (mCurrentTab >= 0 && mCurrentTab < mTabSpecs.size())
            return ((TabSpec)mTabSpecs.get(mCurrentTab)).getTag();
        else
            return null;
    }

    public View getCurrentTabView()
    {
        if (mCurrentTab >= 0 && mCurrentTab < mTabSpecs.size())
            return mTabWidget.getChildTabViewAt(mCurrentTab);
        else
            return null;
    }

    public View getCurrentView()
    {
        return mCurrentView;
    }

    public FrameLayout getTabContentView()
    {
        return mTabContent;
    }

    public TabWidget getTabWidget()
    {
        return mTabWidget;
    }

    public TabSpec newTabSpec(String s)
    {
        return new TabSpec(s);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnTouchModeChangeListener(this);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        getViewTreeObserver().removeOnTouchModeChangeListener(this);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/TabHost.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/TabHost.getName());
    }

    public void onTouchModeChanged(boolean flag)
    {
        if (!flag && mCurrentView != null && (!mCurrentView.hasFocus() || mCurrentView.isFocused()))
            mTabWidget.getChildTabViewAt(mCurrentTab).requestFocus();
    }

    public void sendAccessibilityEvent(int i)
    {
    }

    public void setCurrentTab(int i)
    {
        if (i >= 0 && i < mTabSpecs.size() && i != mCurrentTab)
        {
            if (mCurrentTab != -1)
                ((TabSpec)mTabSpecs.get(mCurrentTab)).mContentStrategy.tabClosed();
            mCurrentTab = i;
            TabSpec tabspec = (TabSpec)mTabSpecs.get(i);
            mTabWidget.focusCurrentTab(mCurrentTab);
            mCurrentView = tabspec.mContentStrategy.getContentView();
            if (mCurrentView.getParent() == null)
                mTabContent.addView(mCurrentView, new android.view.ViewGroup.LayoutParams(-1, -1));
            if (!mTabWidget.hasFocus())
                mCurrentView.requestFocus();
            invokeOnTabChangeListener();
            return;
        } else
        {
            return;
        }
    }

    public void setCurrentTabByTag(String s)
    {
        int i = 0;
        do
        {
label0:
            {
                if (i < mTabSpecs.size())
                {
                    if (!((TabSpec)mTabSpecs.get(i)).getTag().equals(s))
                        break label0;
                    setCurrentTab(i);
                }
                return;
            }
            i++;
        } while (true);
    }

    public void setOnTabChangedListener(OnTabChangeListener ontabchangelistener)
    {
        mOnTabChangeListener = ontabchangelistener;
    }

    public void setup()
    {
        mTabWidget = (TabWidget)findViewById(0x1020013);
        if (mTabWidget == null)
            throw new RuntimeException("Your TabHost must have a TabWidget whose id attribute is 'android.R.id.tabs'");
        mTabKeyListener = new android.view.View.OnKeyListener() {

            final TabHost this$0;

            public boolean onKey(View view, int i, KeyEvent keyevent)
            {
                switch (i)
                {
                case 19: // '\023'
                case 20: // '\024'
                case 21: // '\025'
                case 22: // '\026'
                case 23: // '\027'
                case 66: // 'B'
                    return false;
                }
                mTabContent.requestFocus(2);
                return mTabContent.dispatchKeyEvent(keyevent);
            }

            
            {
                this$0 = TabHost.this;
                super();
            }
        }
;
        mTabWidget.setTabSelectionListener(new TabWidget.OnTabSelectionChanged() {

            final TabHost this$0;

            public void onTabSelectionChanged(int i, boolean flag)
            {
                setCurrentTab(i);
                if (flag)
                    mTabContent.requestFocus(2);
            }

            
            {
                this$0 = TabHost.this;
                super();
            }
        }
);
        mTabContent = (FrameLayout)findViewById(0x1020011);
        if (mTabContent == null)
            throw new RuntimeException("Your TabHost must have a FrameLayout whose id attribute is 'android.R.id.tabcontent'");
        else
            return;
    }

    public void setup(LocalActivityManager localactivitymanager)
    {
        setup();
        mLocalActivityManager = localactivitymanager;
    }



}
