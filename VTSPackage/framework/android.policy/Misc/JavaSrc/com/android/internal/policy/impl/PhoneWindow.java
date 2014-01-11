// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.app.KeyguardManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.net.Uri;
import android.os.*;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.*;
import com.android.internal.view.RootViewSurfaceTaker;
import com.android.internal.view.StandaloneActionMode;
import com.android.internal.view.menu.*;
import com.android.internal.widget.*;
import com.mediatek.xlog.Xlog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl:
//            PhoneWindowManager

public class PhoneWindow extends Window
    implements com.android.internal.view.menu.MenuBuilder.Callback
{
    private final class ActionMenuPresenterCallback
        implements com.android.internal.view.menu.MenuPresenter.Callback
    {

        final PhoneWindow this$0;

        public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
        {
            checkCloseActionMenu(menubuilder);
        }

        public boolean onOpenSubMenu(MenuBuilder menubuilder)
        {
            android.view.Window.Callback callback = getCallback();
            if (callback != null)
            {
                callback.onMenuOpened(8, menubuilder);
                return true;
            } else
            {
                return false;
            }
        }

        private ActionMenuPresenterCallback()
        {
            this$0 = PhoneWindow.this;
            super();
        }

    }

    private final class DecorView extends FrameLayout
        implements RootViewSurfaceTaker
    {

        private ActionMode mActionMode;
        private PopupWindow mActionModePopup;
        private ActionBarContextView mActionModeView;
        private final Rect mBackgroundPadding = new Rect();
        private boolean mChanging;
        int mDefaultOpacity;
        private int mDownY;
        private final Rect mDrawingBounds = new Rect();
        private final int mFeatureId;
        private final Rect mFrameOffsets = new Rect();
        private final Rect mFramePadding = new Rect();
        private Drawable mMenuBackground;
        private Runnable mShowActionModePopup;
        private boolean mWatchingForMenu;
        final PhoneWindow this$0;

        private void drawableChanged()
        {
            if (!mChanging)
            {
                setPadding(mFramePadding.left + mBackgroundPadding.left, mFramePadding.top + mBackgroundPadding.top, mFramePadding.right + mBackgroundPadding.right, mFramePadding.bottom + mBackgroundPadding.bottom);
                requestLayout();
                invalidate();
                int i = -1;
                Drawable drawable = getBackground();
                Drawable drawable1 = getForeground();
                if (drawable != null)
                    if (drawable1 == null)
                        i = drawable.getOpacity();
                    else
                    if (mFramePadding.left <= 0 && mFramePadding.top <= 0 && mFramePadding.right <= 0 && mFramePadding.bottom <= 0)
                    {
                        int j = drawable1.getOpacity();
                        int k = drawable.getOpacity();
                        if (j != -1 && k != -1)
                        {
                            if (j == 0)
                                i = k;
                            else
                            if (k == 0)
                                i = j;
                            else
                                i = Drawable.resolveOpacity(j, k);
                        } else
                        {
                            i = -1;
                        }
                    } else
                    {
                        i = -3;
                    }
                mDefaultOpacity = i;
                if (mFeatureId < 0)
                {
                    setDefaultWindowFormat(i);
                    return;
                }
            }
        }

        private boolean isOutOfBounds(int i, int j)
        {
            return i < -5 || j < -5 || i > 5 + getWidth() || j > 5 + getHeight();
        }

        public boolean dispatchGenericMotionEvent(MotionEvent motionevent)
        {
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !isDestroyed() && mFeatureId < 0)
                return callback.dispatchGenericMotionEvent(motionevent);
            else
                return super.dispatchGenericMotionEvent(motionevent);
        }

        public boolean dispatchKeyEvent(KeyEvent keyevent)
        {
label0:
            {
                int i = keyevent.getKeyCode();
                boolean flag;
                if (keyevent.getAction() == 0)
                    flag = true;
                else
                    flag = false;
                if (flag && keyevent.getRepeatCount() == 0 && (mPanelChordingKey > 0 && mPanelChordingKey != i && dispatchKeyShortcutEvent(keyevent) || mPreparedPanel != null && mPreparedPanel.isOpen && performPanelShortcut(mPreparedPanel, i, keyevent, 0)))
                    break label0;
                if (!isDestroyed())
                {
                    android.view.Window.Callback callback = getCallback();
                    boolean flag1;
                    if (callback != null && mFeatureId < 0)
                        flag1 = callback.dispatchKeyEvent(keyevent);
                    else
                        flag1 = super.dispatchKeyEvent(keyevent);
                    if (flag1)
                        break label0;
                }
                if (flag)
                    return onKeyDown(mFeatureId, keyevent.getKeyCode(), keyevent);
                else
                    return onKeyUp(mFeatureId, keyevent.getKeyCode(), keyevent);
            }
            return true;
        }

        public boolean dispatchKeyShortcutEvent(KeyEvent keyevent)
        {
label0:
            {
                if (mPreparedPanel != null && performPanelShortcut(mPreparedPanel, keyevent.getKeyCode(), keyevent, 1))
                {
                    if (mPreparedPanel != null)
                        mPreparedPanel.isHandled = true;
                    break label0;
                }
                android.view.Window.Callback callback = getCallback();
                boolean flag;
                if (callback != null && !isDestroyed() && mFeatureId < 0)
                    flag = callback.dispatchKeyShortcutEvent(keyevent);
                else
                    flag = super.dispatchKeyShortcutEvent(keyevent);
                if (flag)
                    break label0;
                if (mPreparedPanel == null)
                {
                    PanelFeatureState panelfeaturestate = getPanelState(0, true);
                    preparePanel(panelfeaturestate, keyevent);
                    boolean flag1 = performPanelShortcut(panelfeaturestate, keyevent.getKeyCode(), keyevent, 1);
                    panelfeaturestate.isPrepared = false;
                    if (flag1)
                        break label0;
                }
                return false;
            }
            return true;
        }

        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
        {
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !isDestroyed() && callback.dispatchPopulateAccessibilityEvent(accessibilityevent))
                return true;
            else
                return super.dispatchPopulateAccessibilityEvent(accessibilityevent);
        }

        public boolean dispatchTouchEvent(MotionEvent motionevent)
        {
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !isDestroyed() && mFeatureId < 0)
                return callback.dispatchTouchEvent(motionevent);
            else
                return super.dispatchTouchEvent(motionevent);
        }

        public boolean dispatchTrackballEvent(MotionEvent motionevent)
        {
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !isDestroyed() && mFeatureId < 0)
                return callback.dispatchTrackballEvent(motionevent);
            else
                return super.dispatchTrackballEvent(motionevent);
        }

        public void draw(Canvas canvas)
        {
            super.draw(canvas);
            if (mMenuBackground != null)
                mMenuBackground.draw(canvas);
            if (PhoneWindow.DEBUG)
            {
                Paint paint = new Paint();
                paint.setColor(0xffff0000);
                paint.setTextSize(20F);
                canvas.drawText(getParent().toString(), 0.0F, 300F, paint);
            }
        }

        public void finishChanging()
        {
            mChanging = false;
            drawableChanged();
        }

        protected boolean fitSystemWindows(Rect rect)
        {
            mFrameOffsets.set(rect);
            if (getForeground() != null)
                drawableChanged();
            return super.fitSystemWindows(rect);
        }

        protected void onAttachedToWindow()
        {
            super.onAttachedToWindow();
            updateWindowResizeState();
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !isDestroyed() && mFeatureId < 0)
                callback.onAttachedToWindow();
            if (mFeatureId == -1)
                openPanelsAfterRestore();
        }

        public void onCloseSystemDialogs(String s)
        {
            if (mFeatureId >= 0)
                closeAllPanels();
        }

        protected void onDetachedFromWindow()
        {
            super.onDetachedFromWindow();
            android.view.Window.Callback callback = getCallback();
            if (callback != null && mFeatureId < 0)
                callback.onDetachedFromWindow();
            if (mActionBar != null)
                mActionBar.dismissPopupMenus();
            if (mActionModePopup != null)
            {
                removeCallbacks(mShowActionModePopup);
                if (mActionModePopup.isShowing())
                    mActionModePopup.dismiss();
                mActionModePopup = null;
            }
            PanelFeatureState panelfeaturestate = getPanelState(0, false);
            if (panelfeaturestate != null && panelfeaturestate.menu != null && mFeatureId < 0)
                panelfeaturestate.menu.close();
        }

        public boolean onInterceptTouchEvent(MotionEvent motionevent)
        {
            int i = motionevent.getAction();
            if (mFeatureId >= 0 && i == 0 && isOutOfBounds((int)motionevent.getX(), (int)motionevent.getY()))
            {
                closePanel(mFeatureId);
                return true;
            } else
            {
                return false;
            }
        }

        protected void onMeasure(int i, int j)
        {
            DisplayMetrics displaymetrics = getContext().getResources().getDisplayMetrics();
            boolean flag;
            if (displaymetrics.widthPixels < displaymetrics.heightPixels)
                flag = true;
            else
                flag = false;
            int k = android.view.View.MeasureSpec.getMode(i);
            int l = android.view.View.MeasureSpec.getMode(j);
            boolean flag1 = false;
            if (k == 0x80000000)
            {
                TypedValue typedvalue2;
                if (flag)
                    typedvalue2 = mFixedWidthMinor;
                else
                    typedvalue2 = mFixedWidthMajor;
                flag1 = false;
                if (typedvalue2 != null)
                {
                    int j2 = typedvalue2.type;
                    flag1 = false;
                    if (j2 != 0)
                    {
                        int k2;
                        if (typedvalue2.type == 5)
                            k2 = (int)typedvalue2.getDimension(displaymetrics);
                        else
                        if (typedvalue2.type == 6)
                            k2 = (int)typedvalue2.getFraction(displaymetrics.widthPixels, displaymetrics.widthPixels);
                        else
                            k2 = 0;
                        flag1 = false;
                        if (k2 > 0)
                        {
                            i = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(k2, android.view.View.MeasureSpec.getSize(i)), 0x40000000);
                            flag1 = true;
                        }
                    }
                }
            }
            if (l == 0x80000000)
            {
                TypedValue typedvalue1;
                if (flag)
                    typedvalue1 = mFixedHeightMajor;
                else
                    typedvalue1 = mFixedHeightMinor;
                if (typedvalue1 != null && typedvalue1.type != 0)
                {
                    int i2;
                    if (typedvalue1.type == 5)
                        i2 = (int)typedvalue1.getDimension(displaymetrics);
                    else
                    if (typedvalue1.type == 6)
                        i2 = (int)typedvalue1.getFraction(displaymetrics.heightPixels, displaymetrics.heightPixels);
                    else
                        i2 = 0;
                    if (i2 > 0)
                        j = android.view.View.MeasureSpec.makeMeasureSpec(Math.min(i2, android.view.View.MeasureSpec.getSize(j)), 0x40000000);
                }
            }
            super.onMeasure(i, j);
            int i1 = getMeasuredWidth();
            int j1 = android.view.View.MeasureSpec.makeMeasureSpec(i1, 0x40000000);
            boolean flag2 = false;
            if (!flag1)
            {
                flag2 = false;
                if (k == 0x80000000)
                {
                    TypedValue typedvalue;
                    if (flag)
                        typedvalue = mMinWidthMinor;
                    else
                        typedvalue = mMinWidthMajor;
                    int k1 = typedvalue.type;
                    flag2 = false;
                    if (k1 != 0)
                    {
                        int l1;
                        if (typedvalue.type == 5)
                            l1 = (int)typedvalue.getDimension(displaymetrics);
                        else
                        if (typedvalue.type == 6)
                            l1 = (int)typedvalue.getFraction(displaymetrics.widthPixels, displaymetrics.widthPixels);
                        else
                            l1 = 0;
                        flag2 = false;
                        if (i1 < l1)
                        {
                            j1 = android.view.View.MeasureSpec.makeMeasureSpec(l1, 0x40000000);
                            flag2 = true;
                        }
                    }
                }
            }
            if (flag2)
                super.onMeasure(j1, j);
        }

        public boolean onTouchEvent(MotionEvent motionevent)
        {
            return onInterceptTouchEvent(motionevent);
        }

        public void onWindowFocusChanged(boolean flag)
        {
            super.onWindowFocusChanged(flag);
            if (!flag && mPanelChordingKey != 0)
                closePanel(0);
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !isDestroyed() && mFeatureId < 0)
                callback.onWindowFocusChanged(flag);
        }

        public void sendAccessibilityEvent(int i)
        {
            if (!AccessibilityManager.getInstance(mContext).isEnabled())
                return;
            if ((mFeatureId == 0 || mFeatureId == 6 || mFeatureId == 2 || mFeatureId == 5) && getChildCount() == 1)
            {
                getChildAt(0).sendAccessibilityEvent(i);
                return;
            } else
            {
                super.sendAccessibilityEvent(i);
                return;
            }
        }

        public void setBackgroundDrawable(Drawable drawable)
        {
            super.setBackgroundDrawable(drawable);
            if (getWindowToken() != null)
                updateWindowResizeState();
        }

        protected boolean setFrame(int i, int j, int k, int l)
        {
            boolean flag = super.setFrame(i, j, k, l);
            if (flag)
            {
                Rect rect = mDrawingBounds;
                getDrawingRect(rect);
                Drawable drawable = getForeground();
                if (drawable != null)
                {
                    Rect rect1 = mFrameOffsets;
                    rect.left = rect.left + rect1.left;
                    rect.top = rect.top + rect1.top;
                    rect.right = rect.right - rect1.right;
                    rect.bottom = rect.bottom - rect1.bottom;
                    drawable.setBounds(rect);
                    Rect rect2 = mFramePadding;
                    rect.left = rect.left + (rect2.left - rect1.left);
                    rect.top = rect.top + (rect2.top - rect1.top);
                    rect.right = rect.right - (rect2.right - rect1.right);
                    rect.bottom = rect.bottom - (rect2.bottom - rect1.bottom);
                }
                Drawable drawable1 = getBackground();
                if (drawable1 != null)
                    drawable1.setBounds(rect);
            }
            return flag;
        }

        public void setSurfaceFormat(int i)
        {
            setFormat(i);
        }

        public void setSurfaceKeepScreenOn(boolean flag)
        {
            if (flag)
            {
                addFlags(128);
                return;
            } else
            {
                clearFlags(128);
                return;
            }
        }

        public void setSurfaceType(int i)
        {
            setType(i);
        }

        public void setVisibility(int i)
        {
            super.setVisibility(i);
            Xlog.v("PhoneWindow", (new StringBuilder()).append("DecorView setVisiblity: visibility = ").append(i).toString());
        }

        public void setWindowBackground(Drawable drawable)
        {
            if (getBackground() != drawable)
            {
                setBackgroundDrawable(drawable);
                if (drawable != null)
                    drawable.getPadding(mBackgroundPadding);
                else
                    mBackgroundPadding.setEmpty();
                drawableChanged();
            }
        }

        public void setWindowFrame(Drawable drawable)
        {
            if (getForeground() != drawable)
            {
                setForeground(drawable);
                if (drawable != null)
                    drawable.getPadding(mFramePadding);
                else
                    mFramePadding.setEmpty();
                drawableChanged();
            }
        }

        public boolean showContextMenuForChild(View view)
        {
            if (mContextMenu == null)
            {
                mContextMenu = new ContextMenuBuilder(getContext());
                mContextMenu.setCallback(mContextMenuCallback);
            } else
            {
                mContextMenu.clearAll();
            }
            MenuDialogHelper menudialoghelper = mContextMenu.show(view, view.getWindowToken());
            if (menudialoghelper != null)
                menudialoghelper.setPresenterCallback(mContextMenuCallback);
            mContextMenuHelper = menudialoghelper;
            return menudialoghelper != null;
        }

        public ActionMode startActionMode(android.view.ActionMode.Callback callback)
        {
            ActionModeCallbackWrapper actionmodecallbackwrapper;
            ActionMode actionmode;
            if (mActionMode != null)
                mActionMode.finish();
            actionmodecallbackwrapper = new ActionModeCallbackWrapper(callback);
            android.view.Window.Callback callback1 = getCallback();
            actionmode = null;
            if (callback1 == null)
                break MISSING_BLOCK_LABEL_75;
            boolean flag1 = isDestroyed();
            actionmode = null;
            if (flag1)
                break MISSING_BLOCK_LABEL_75;
            ActionMode actionmode1 = getCallback().onWindowStartingActionMode(actionmodecallbackwrapper);
            actionmode = actionmode1;
_L2:
            if (actionmode != null)
            {
                mActionMode = actionmode;
            } else
            {
                if (mActionModeView == null)
                    if (isFloating())
                    {
                        mActionModeView = new ActionBarContextView(mContext);
                        mActionModePopup = new PopupWindow(mContext, null, 0x10103e4);
                        mActionModePopup.setLayoutInScreenEnabled(true);
                        mActionModePopup.setLayoutInsetDecor(true);
                        mActionModePopup.setWindowLayoutType(2);
                        mActionModePopup.setContentView(mActionModeView);
                        mActionModePopup.setWidth(-1);
                        TypedValue typedvalue = new TypedValue();
                        mContext.getTheme().resolveAttribute(0x10102eb, typedvalue, true);
                        int i = TypedValue.complexToDimensionPixelSize(typedvalue.data, mContext.getResources().getDisplayMetrics());
                        mActionModeView.setContentHeight(i);
                        mActionModePopup.setHeight(-2);
                        mShowActionModePopup = new Runnable() {

                            final DecorView this$1;

                            public void run()
                            {
                                mActionModePopup.showAtLocation(mActionModeView.getApplicationWindowToken(), 55, 0, 0);
                            }

            
            {
                this$1 = DecorView.this;
                super();
            }
                        }
;
                    } else
                    {
                        ViewStub viewstub = (ViewStub)findViewById(0x102035f);
                        if (viewstub != null)
                            mActionModeView = (ActionBarContextView)viewstub.inflate();
                    }
                if (mActionModeView != null)
                {
                    mActionModeView.killMode();
                    Context context = getContext();
                    ActionBarContextView actionbarcontextview = mActionModeView;
                    boolean flag;
                    StandaloneActionMode standaloneactionmode;
                    if (mActionModePopup == null)
                        flag = true;
                    else
                        flag = false;
                    standaloneactionmode = new StandaloneActionMode(context, actionbarcontextview, actionmodecallbackwrapper, flag);
                    if (callback.onCreateActionMode(standaloneactionmode, standaloneactionmode.getMenu()))
                    {
                        standaloneactionmode.invalidate();
                        mActionModeView.initForMode(standaloneactionmode);
                        mActionModeView.setVisibility(0);
                        mActionMode = standaloneactionmode;
                        if (mActionModePopup != null)
                            post(mShowActionModePopup);
                        mActionModeView.sendAccessibilityEvent(32);
                    } else
                    {
                        mActionMode = null;
                    }
                }
            }
            if (mActionMode != null && getCallback() != null && !isDestroyed())
                try
                {
                    getCallback().onActionModeStarted(mActionMode);
                }
                catch (AbstractMethodError abstractmethoderror) { }
            return mActionMode;
            AbstractMethodError abstractmethoderror1;
            abstractmethoderror1;
            actionmode = null;
            if (true) goto _L2; else goto _L1
_L1:
        }

        public ActionMode startActionModeForChild(View view, android.view.ActionMode.Callback callback)
        {
            return startActionMode(callback);
        }

        public void startChanging()
        {
            mChanging = true;
        }

        public boolean superDispatchGenericMotionEvent(MotionEvent motionevent)
        {
            return super.dispatchGenericMotionEvent(motionevent);
        }

        public boolean superDispatchKeyEvent(KeyEvent keyevent)
        {
label0:
            {
                if (!super.dispatchKeyEvent(keyevent))
                {
                    if (keyevent.getKeyCode() != 4)
                        break label0;
                    int i = keyevent.getAction();
                    if (mActionMode != null)
                    {
                        if (i == 1)
                        {
                            mActionMode.finish();
                            return true;
                        }
                    } else
                    {
                        if (mActionBar == null || !mActionBar.hasExpandedActionView())
                            break label0;
                        if (i == 1)
                        {
                            mActionBar.collapseActionView();
                            return true;
                        }
                    }
                }
                return true;
            }
            return false;
        }

        public boolean superDispatchKeyShortcutEvent(KeyEvent keyevent)
        {
            return super.dispatchKeyShortcutEvent(keyevent);
        }

        public boolean superDispatchTouchEvent(MotionEvent motionevent)
        {
            return super.dispatchTouchEvent(motionevent);
        }

        public boolean superDispatchTrackballEvent(MotionEvent motionevent)
        {
            return super.dispatchTrackballEvent(motionevent);
        }

        void updateWindowResizeState()
        {
            Drawable drawable = getBackground();
            boolean flag;
            if (drawable != null && drawable.getOpacity() == -1)
                flag = false;
            else
                flag = true;
            hackTurnOffWindowResizeAnim(flag);
        }

        public android.view.InputQueue.Callback willYouTakeTheInputQueue()
        {
            if (mFeatureId < 0)
                return mTakeInputQueueCallback;
            else
                return null;
        }

        public android.view.SurfaceHolder.Callback2 willYouTakeTheSurface()
        {
            if (mFeatureId < 0)
                return mTakeSurfaceCallback;
            else
                return null;
        }






/*
        static ActionMode access$302(DecorView decorview, ActionMode actionmode)
        {
            decorview.mActionMode = actionmode;
            return actionmode;
        }

*/

        public DecorView(Context context, int i)
        {
            this$0 = PhoneWindow.this;
            super(context);
            mDefaultOpacity = -1;
            mFeatureId = i;
        }
    }

    private class DecorView.ActionModeCallbackWrapper
        implements android.view.ActionMode.Callback
    {

        private android.view.ActionMode.Callback mWrapped;
        final DecorView this$1;

        public boolean onActionItemClicked(ActionMode actionmode, MenuItem menuitem)
        {
            return mWrapped.onActionItemClicked(actionmode, menuitem);
        }

        public boolean onCreateActionMode(ActionMode actionmode, Menu menu)
        {
            return mWrapped.onCreateActionMode(actionmode, menu);
        }

        public void onDestroyActionMode(ActionMode actionmode)
        {
            mWrapped.onDestroyActionMode(actionmode);
            if (mActionModePopup != null)
            {
                removeCallbacks(mShowActionModePopup);
                mActionModePopup.dismiss();
            } else
            if (mActionModeView != null)
                mActionModeView.setVisibility(8);
            if (mActionModeView != null)
                mActionModeView.removeAllViews();
            if (getCallback() != null && !isDestroyed())
                try
                {
                    getCallback().onActionModeFinished(mActionMode);
                }
                catch (AbstractMethodError abstractmethoderror) { }
            mActionMode = null;
        }

        public boolean onPrepareActionMode(ActionMode actionmode, Menu menu)
        {
            return mWrapped.onPrepareActionMode(actionmode, menu);
        }

        public DecorView.ActionModeCallbackWrapper(android.view.ActionMode.Callback callback)
        {
            this$1 = DecorView.this;
            super();
            mWrapped = callback;
        }
    }

    private final class DialogMenuCallback
        implements com.android.internal.view.menu.MenuBuilder.Callback, com.android.internal.view.menu.MenuPresenter.Callback
    {

        private int mFeatureId;
        final PhoneWindow this$0;

        public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
        {
            if (menubuilder.getRootMenu() != menubuilder)
                onCloseSubMenu(menubuilder);
            if (flag)
            {
                android.view.Window.Callback callback = getCallback();
                if (callback != null && !isDestroyed())
                    callback.onPanelClosed(mFeatureId, menubuilder);
                if (menubuilder == mContextMenu)
                    dismissContextMenu();
            }
        }

        public void onCloseSubMenu(MenuBuilder menubuilder)
        {
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !isDestroyed())
                callback.onPanelClosed(mFeatureId, menubuilder.getRootMenu());
        }

        public boolean onMenuItemSelected(MenuBuilder menubuilder, MenuItem menuitem)
        {
            android.view.Window.Callback callback = getCallback();
            return callback != null && !isDestroyed() && callback.onMenuItemSelected(mFeatureId, menuitem);
        }

        public void onMenuModeChange(MenuBuilder menubuilder)
        {
        }

        public boolean onOpenSubMenu(MenuBuilder menubuilder)
        {
            if (menubuilder == null)
            {
                return false;
            } else
            {
                menubuilder.setCallback(this);
                return true;
            }
        }

        public DialogMenuCallback(int i)
        {
            this$0 = PhoneWindow.this;
            super();
            mFeatureId = i;
        }
    }

    private static final class DrawableFeatureState
    {

        int alpha;
        Drawable child;
        Drawable cur;
        int curAlpha;
        Drawable def;
        final int featureId;
        Drawable local;
        int resid;
        Uri uri;

        DrawableFeatureState(int i)
        {
            alpha = 255;
            curAlpha = 255;
            featureId = i;
        }
    }

    private static final class PanelFeatureState
    {

        int background;
        View createdPanelView;
        DecorView decorView;
        int featureId;
        Bundle frozenActionViewState;
        Bundle frozenMenuState;
        int fullBackground;
        int gravity;
        IconMenuPresenter iconMenuPresenter;
        boolean isCompact;
        boolean isHandled;
        boolean isInExpandedMode;
        boolean isOpen;
        boolean isPrepared;
        ListMenuPresenter listMenuPresenter;
        int listPresenterTheme;
        MenuBuilder menu;
        public boolean qwertyMode;
        boolean refreshDecorView;
        boolean refreshMenuContent;
        View shownPanelView;
        boolean wasLastExpanded;
        boolean wasLastOpen;
        int windowAnimations;
        int x;
        int y;

        void applyFrozenState()
        {
            if (menu != null && frozenMenuState != null)
            {
                menu.restorePresenterStates(frozenMenuState);
                frozenMenuState = null;
            }
        }

        public void clearMenuPresenters()
        {
            if (menu != null)
            {
                menu.removeMenuPresenter(iconMenuPresenter);
                menu.removeMenuPresenter(listMenuPresenter);
            }
            iconMenuPresenter = null;
            listMenuPresenter = null;
        }

        MenuView getIconMenuView(Context context, com.android.internal.view.menu.MenuPresenter.Callback callback)
        {
            if (menu == null)
                return null;
            if (iconMenuPresenter == null)
            {
                iconMenuPresenter = new IconMenuPresenter(context);
                iconMenuPresenter.setCallback(callback);
                iconMenuPresenter.setId(0x102024b);
                menu.addMenuPresenter(iconMenuPresenter);
            }
            return iconMenuPresenter.getMenuView(decorView);
        }

        MenuView getListMenuView(Context context, com.android.internal.view.menu.MenuPresenter.Callback callback)
        {
            if (menu == null)
                return null;
            if (!isCompact)
                getIconMenuView(context, callback);
            if (listMenuPresenter == null)
            {
                listMenuPresenter = new ListMenuPresenter(0x1090080, listPresenterTheme);
                listMenuPresenter.setCallback(callback);
                listMenuPresenter.setId(0x102024c);
                menu.addMenuPresenter(listMenuPresenter);
            }
            if (iconMenuPresenter != null)
                listMenuPresenter.setItemIndexOffset(iconMenuPresenter.getNumActualItemsShown());
            return listMenuPresenter.getMenuView(decorView);
        }

        public boolean hasPanelItems()
        {
            boolean flag;
label0:
            {
                flag = true;
                if (shownPanelView == null)
                    flag = false;
                else
                if (createdPanelView == null)
                {
                    if (isCompact || isInExpandedMode)
                        break label0;
                    if (((ViewGroup)shownPanelView).getChildCount() <= 0)
                        return false;
                }
                return flag;
            }
            boolean flag1;
            if (listMenuPresenter.getAdapter().getCount() > 0)
                flag1 = flag;
            else
                flag1 = false;
            return flag1;
        }

        public boolean isInListMode()
        {
            return isInExpandedMode || isCompact;
        }

        void onRestoreInstanceState(Parcelable parcelable)
        {
            SavedState savedstate = (SavedState)parcelable;
            featureId = savedstate.featureId;
            wasLastOpen = savedstate.isOpen;
            wasLastExpanded = savedstate.isInExpandedMode;
            frozenMenuState = savedstate.menuState;
            createdPanelView = null;
            shownPanelView = null;
            decorView = null;
        }

        Parcelable onSaveInstanceState()
        {
            SavedState savedstate = new SavedState();
            savedstate.featureId = featureId;
            savedstate.isOpen = isOpen;
            savedstate.isInExpandedMode = isInExpandedMode;
            if (menu != null)
            {
                savedstate.menuState = new Bundle();
                menu.savePresenterStates(savedstate.menuState);
            }
            return savedstate;
        }

        void setMenu(MenuBuilder menubuilder)
        {
            if (menubuilder != menu)
            {
                if (menu != null)
                {
                    menu.removeMenuPresenter(iconMenuPresenter);
                    menu.removeMenuPresenter(listMenuPresenter);
                }
                menu = menubuilder;
                if (menubuilder != null)
                {
                    if (iconMenuPresenter != null)
                        menubuilder.addMenuPresenter(iconMenuPresenter);
                    if (listMenuPresenter != null)
                    {
                        menubuilder.addMenuPresenter(listMenuPresenter);
                        return;
                    }
                }
            }
        }

        void setStyle(Context context)
        {
            TypedArray typedarray = context.obtainStyledAttributes(com.android.internal.R.styleable.Theme);
            background = typedarray.getResourceId(46, 0);
            fullBackground = typedarray.getResourceId(47, 0);
            windowAnimations = typedarray.getResourceId(93, 0);
            isCompact = typedarray.getBoolean(229, false);
            listPresenterTheme = typedarray.getResourceId(231, 0x1030304);
            typedarray.recycle();
        }

        PanelFeatureState(int i)
        {
            featureId = i;
            refreshDecorView = false;
        }
    }

    private static class PanelFeatureState.SavedState
        implements Parcelable
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public PanelFeatureState.SavedState createFromParcel(Parcel parcel)
            {
                return PanelFeatureState.SavedState.readFromParcel(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public PanelFeatureState.SavedState[] newArray(int i)
            {
                return new PanelFeatureState.SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        int featureId;
        boolean isInExpandedMode;
        boolean isOpen;
        Bundle menuState;

        private static PanelFeatureState.SavedState readFromParcel(Parcel parcel)
        {
            boolean flag = true;
            PanelFeatureState.SavedState savedstate = new PanelFeatureState.SavedState();
            savedstate.featureId = parcel.readInt();
            boolean flag1;
            if (parcel.readInt() == flag)
                flag1 = flag;
            else
                flag1 = false;
            savedstate.isOpen = flag1;
            if (parcel.readInt() != flag)
                flag = false;
            savedstate.isInExpandedMode = flag;
            if (savedstate.isOpen)
                savedstate.menuState = parcel.readBundle();
            return savedstate;
        }

        public int describeContents()
        {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            int j = 1;
            parcel.writeInt(featureId);
            int k;
            if (isOpen)
                k = j;
            else
                k = 0;
            parcel.writeInt(k);
            if (!isInExpandedMode)
                j = 0;
            parcel.writeInt(j);
            if (isOpen)
                parcel.writeBundle(menuState);
        }



        private PanelFeatureState.SavedState()
        {
        }

    }

    private class PanelMenuPresenterCallback
        implements com.android.internal.view.menu.MenuPresenter.Callback
    {

        final PhoneWindow this$0;

        public void onCloseMenu(MenuBuilder menubuilder, boolean flag)
        {
            PanelFeatureState panelfeaturestate;
label0:
            {
                MenuBuilder menubuilder1 = menubuilder.getRootMenu();
                boolean flag1;
                if (menubuilder1 != menubuilder)
                    flag1 = true;
                else
                    flag1 = false;
                PhoneWindow phonewindow = PhoneWindow.this;
                if (flag1)
                    menubuilder = menubuilder1;
                panelfeaturestate = phonewindow.findMenuPanel(menubuilder);
                if (panelfeaturestate != null)
                {
                    if (!flag1)
                        break label0;
                    callOnPanelClosed(panelfeaturestate.featureId, panelfeaturestate, menubuilder1);
                    closePanel(panelfeaturestate, true);
                }
                return;
            }
            closePanel(panelfeaturestate, flag);
        }

        public boolean onOpenSubMenu(MenuBuilder menubuilder)
        {
            if (menubuilder == null && hasFeature(8))
            {
                android.view.Window.Callback callback = getCallback();
                if (callback != null && !isDestroyed())
                    callback.onMenuOpened(8, menubuilder);
            }
            return true;
        }

        private PanelMenuPresenterCallback()
        {
            this$0 = PhoneWindow.this;
            super();
        }

    }

    static class RotationWatcher extends android.view.IRotationWatcher.Stub
    {

        private Handler mHandler;
        private boolean mIsWatching;
        private final Runnable mRotationChanged = new _cls1();
        private final ArrayList mWindows = new ArrayList();

        public void addWindow(PhoneWindow phonewindow)
        {
            ArrayList arraylist = mWindows;
            arraylist;
            JVM INSTR monitorenter ;
            boolean flag = mIsWatching;
            if (flag)
                break MISSING_BLOCK_LABEL_44;
            WindowManagerHolder.sWindowManager.watchRotation(this);
            mHandler = new Handler();
            mIsWatching = true;
_L1:
            mWindows.add(new WeakReference(phonewindow));
            arraylist;
            JVM INSTR monitorexit ;
            return;
            RemoteException remoteexception;
            remoteexception;
            Log.e("PhoneWindow", "Couldn't start watching for device rotation", remoteexception);
              goto _L1
            Exception exception;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
        }

        void dispatchRotationChanged()
        {
            ArrayList arraylist = mWindows;
            arraylist;
            JVM INSTR monitorenter ;
            int i = 0;
_L1:
            PhoneWindow phonewindow;
            if (i >= mWindows.size())
                break MISSING_BLOCK_LABEL_72;
            phonewindow = (PhoneWindow)((WeakReference)mWindows.get(i)).get();
            if (phonewindow == null)
                break MISSING_BLOCK_LABEL_55;
            phonewindow.onOptionsPanelRotationChanged();
            i++;
              goto _L1
            mWindows.remove(i);
              goto _L1
            Exception exception;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
            arraylist;
            JVM INSTR monitorexit ;
        }

        public void onRotationChanged(int i)
            throws RemoteException
        {
            mHandler.post(mRotationChanged);
        }

        public void removeWindow(PhoneWindow phonewindow)
        {
            ArrayList arraylist = mWindows;
            arraylist;
            JVM INSTR monitorenter ;
            int i = 0;
_L2:
            PhoneWindow phonewindow1;
            if (i >= mWindows.size())
                break; /* Loop/switch isn't completed */
            phonewindow1 = (PhoneWindow)((WeakReference)mWindows.get(i)).get();
            if (phonewindow1 != null && phonewindow1 != phonewindow)
                break MISSING_BLOCK_LABEL_69;
            mWindows.remove(i);
            continue; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            arraylist;
            JVM INSTR monitorexit ;
            throw exception;
            i++;
            if (true) goto _L2; else goto _L1
_L1:
            arraylist;
            JVM INSTR monitorexit ;
        }

    }

    static class WindowManagerHolder
    {

        static final IWindowManager sWindowManager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));


    }


    private static final String ACTION_BAR_TAG = "android:ActionBar";
    private static final boolean DEBUG = SystemProperties.getBoolean("debug.phonewindow.enable", false);
    private static final String FOCUSED_ID_TAG = "android:focusedViewId";
    private static final String PANELS_TAG = "android:Panels";
    private static final boolean SWEEP_OPEN_MENU = false;
    private static final String TAG = "PhoneWindow";
    private static final String VIEWS_TAG = "android:views";
    static final RotationWatcher sRotationWatcher = new RotationWatcher();
    private ActionBarView mActionBar;
    private ActionMenuPresenterCallback mActionMenuPresenterCallback;
    private boolean mAlwaysReadCloseOnTouchAttr;
    private AudioManager mAudioManager;
    private Drawable mBackgroundDrawable;
    private int mBackgroundResource;
    private ProgressBar mCircularProgressBar;
    private boolean mClosingActionMenu;
    private ViewGroup mContentParent;
    private ContextMenuBuilder mContextMenu;
    final DialogMenuCallback mContextMenuCallback = new DialogMenuCallback(6);
    private MenuDialogHelper mContextMenuHelper;
    private DecorView mDecor;
    private DrawableFeatureState mDrawables[];
    TypedValue mFixedHeightMajor;
    TypedValue mFixedHeightMinor;
    TypedValue mFixedWidthMajor;
    TypedValue mFixedWidthMinor;
    private int mFrameResource;
    private ProgressBar mHorizontalProgressBar;
    private int mInvalidatePanelMenuFeatures;
    private boolean mInvalidatePanelMenuPosted;
    private final Runnable mInvalidatePanelMenuRunnable = new Runnable() {

        final PhoneWindow this$0;

        public void run()
        {
            for (int i = 0; i <= 10; i++)
                if ((mInvalidatePanelMenuFeatures & 1 << i) != 0)
                    doInvalidatePanelMenu(i);

            mInvalidatePanelMenuPosted = false;
            mInvalidatePanelMenuFeatures = 0;
        }

            
            {
                this$0 = PhoneWindow.this;
                super();
            }
    }
;
    private boolean mIsFloating;
    private KeyguardManager mKeyguardManager;
    private LayoutInflater mLayoutInflater;
    private ImageView mLeftIconView;
    final TypedValue mMinWidthMajor = new TypedValue();
    final TypedValue mMinWidthMinor = new TypedValue();
    private int mPanelChordingKey;
    private PanelMenuPresenterCallback mPanelMenuPresenterCallback;
    private PanelFeatureState mPanels[];
    private PanelFeatureState mPreparedPanel;
    private ImageView mRightIconView;
    android.view.InputQueue.Callback mTakeInputQueueCallback;
    android.view.SurfaceHolder.Callback2 mTakeSurfaceCallback;
    private int mTextColor;
    private CharSequence mTitle;
    private int mTitleColor;
    private TextView mTitleView;
    private int mUiOptions;
    private int mVolumeControlStreamType;

    public PhoneWindow(Context context)
    {
        super(context);
        mBackgroundResource = 0;
        mFrameResource = 0;
        mTextColor = 0;
        mTitle = null;
        mTitleColor = 0;
        mAlwaysReadCloseOnTouchAttr = false;
        mVolumeControlStreamType = 0x80000000;
        mUiOptions = 0;
        mLayoutInflater = LayoutInflater.from(context);
    }

    private void callOnPanelClosed(int i, PanelFeatureState panelfeaturestate, Menu menu)
    {
        android.view.Window.Callback callback = getCallback();
        if (callback != null)
        {
            if (menu == null)
            {
                if (panelfeaturestate == null && i >= 0 && i < mPanels.length)
                    panelfeaturestate = mPanels[i];
                if (panelfeaturestate != null)
                    menu = panelfeaturestate.menu;
            }
            if ((panelfeaturestate == null || panelfeaturestate.isOpen) && !isDestroyed())
            {
                callback.onPanelClosed(i, menu);
                return;
            }
        }
    }

    private static void clearMenuViews(PanelFeatureState panelfeaturestate)
    {
        panelfeaturestate.createdPanelView = null;
        panelfeaturestate.refreshDecorView = true;
        panelfeaturestate.clearMenuPresenters();
    }

    private void closeContextMenu()
    {
        this;
        JVM INSTR monitorenter ;
        if (mContextMenu != null)
        {
            mContextMenu.close();
            dismissContextMenu();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void dismissContextMenu()
    {
        this;
        JVM INSTR monitorenter ;
        mContextMenu = null;
        if (mContextMenuHelper != null)
        {
            mContextMenuHelper.dismiss();
            mContextMenuHelper = null;
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private ProgressBar getCircularProgressBar(boolean flag)
    {
        if (mCircularProgressBar != null)
            return mCircularProgressBar;
        if (mContentParent == null && flag)
            installDecor();
        mCircularProgressBar = (ProgressBar)findViewById(0x1020362);
        if (mCircularProgressBar != null)
            mCircularProgressBar.setVisibility(4);
        return mCircularProgressBar;
    }

    private DrawableFeatureState getDrawableState(int i, boolean flag)
    {
        DrawableFeatureState drawablefeaturestate;
        if ((getFeatures() & 1 << i) == 0)
        {
            if (!flag)
                drawablefeaturestate = null;
            else
                throw new RuntimeException("The feature has not been requested");
        } else
        {
            DrawableFeatureState adrawablefeaturestate[] = mDrawables;
            if (adrawablefeaturestate == null || adrawablefeaturestate.length <= i)
            {
                DrawableFeatureState adrawablefeaturestate1[] = new DrawableFeatureState[i + 1];
                if (adrawablefeaturestate != null)
                    System.arraycopy(adrawablefeaturestate, 0, adrawablefeaturestate1, 0, adrawablefeaturestate.length);
                adrawablefeaturestate = adrawablefeaturestate1;
                mDrawables = adrawablefeaturestate1;
            }
            drawablefeaturestate = adrawablefeaturestate[i];
            if (drawablefeaturestate == null)
            {
                DrawableFeatureState drawablefeaturestate1 = new DrawableFeatureState(i);
                adrawablefeaturestate[i] = drawablefeaturestate1;
                return drawablefeaturestate1;
            }
        }
        return drawablefeaturestate;
    }

    private ProgressBar getHorizontalProgressBar(boolean flag)
    {
        if (mHorizontalProgressBar != null)
            return mHorizontalProgressBar;
        if (mContentParent == null && flag)
            installDecor();
        mHorizontalProgressBar = (ProgressBar)findViewById(0x1020363);
        if (mHorizontalProgressBar != null)
            mHorizontalProgressBar.setVisibility(4);
        return mHorizontalProgressBar;
    }

    private KeyguardManager getKeyguardManager()
    {
        if (mKeyguardManager == null)
            mKeyguardManager = (KeyguardManager)getContext().getSystemService("keyguard");
        return mKeyguardManager;
    }

    private ImageView getLeftIconView()
    {
        if (mLeftIconView != null)
            return mLeftIconView;
        if (mContentParent == null)
            installDecor();
        ImageView imageview = (ImageView)findViewById(0x1020240);
        mLeftIconView = imageview;
        return imageview;
    }

    private int getOptionsPanelGravity()
    {
        int i;
        try
        {
            i = WindowManagerHolder.sWindowManager.getPreferredOptionsPanelGravity();
        }
        catch (RemoteException remoteexception)
        {
            Log.e("PhoneWindow", "Couldn't getOptionsPanelGravity; using default", remoteexception);
            return 81;
        }
        return i;
    }

    private PanelFeatureState getPanelState(int i, boolean flag)
    {
        return getPanelState(i, flag, null);
    }

    private PanelFeatureState getPanelState(int i, boolean flag, PanelFeatureState panelfeaturestate)
    {
        PanelFeatureState panelfeaturestate1;
        if ((getFeatures() & 1 << i) == 0)
        {
            if (!flag)
                panelfeaturestate1 = null;
            else
                throw new RuntimeException("The feature has not been requested");
        } else
        {
            PanelFeatureState apanelfeaturestate[] = mPanels;
            if (apanelfeaturestate == null || apanelfeaturestate.length <= i)
            {
                PanelFeatureState apanelfeaturestate1[] = new PanelFeatureState[i + 1];
                if (apanelfeaturestate != null)
                    System.arraycopy(apanelfeaturestate, 0, apanelfeaturestate1, 0, apanelfeaturestate.length);
                apanelfeaturestate = apanelfeaturestate1;
                mPanels = apanelfeaturestate1;
            }
            panelfeaturestate1 = apanelfeaturestate[i];
            if (panelfeaturestate1 == null)
            {
                PanelFeatureState panelfeaturestate2;
                if (panelfeaturestate != null)
                    panelfeaturestate2 = panelfeaturestate;
                else
                    panelfeaturestate2 = new PanelFeatureState(i);
                apanelfeaturestate[i] = panelfeaturestate2;
                return panelfeaturestate2;
            }
        }
        return panelfeaturestate1;
    }

    private ImageView getRightIconView()
    {
        if (mRightIconView != null)
            return mRightIconView;
        if (mContentParent == null)
            installDecor();
        ImageView imageview = (ImageView)findViewById(0x1020242);
        mRightIconView = imageview;
        return imageview;
    }

    private void hideProgressBars(ProgressBar progressbar, ProgressBar progressbar1)
    {
        int i = getLocalFeatures();
        Animation animation = AnimationUtils.loadAnimation(getContext(), 0x10a0001);
        animation.setDuration(1000L);
        if ((i & 0x20) != 0 && progressbar1.getVisibility() == 0)
        {
            progressbar1.startAnimation(animation);
            progressbar1.setVisibility(4);
        }
        if ((i & 4) != 0 && progressbar.getVisibility() == 0)
        {
            progressbar.startAnimation(animation);
            progressbar.setVisibility(4);
        }
    }

    private void installDecor()
    {
        boolean flag = true;
        if (mDecor == null)
        {
            mDecor = generateDecor();
            mDecor.setDescendantFocusability(0x40000);
            mDecor.setIsRootNamespace(flag);
            if (!mInvalidatePanelMenuPosted && mInvalidatePanelMenuFeatures != 0)
                mDecor.postOnAnimation(mInvalidatePanelMenuRunnable);
        }
        if (mContentParent == null)
        {
            mContentParent = generateLayout(mDecor);
            mDecor.makeOptionalFitsSystemWindows();
            mTitleView = (TextView)findViewById(0x1020016);
            View view = findViewById(0x102025c);
            int i = getContext().getResources().getThemeMainColor();
            if (i != 0)
            {
                if (mTitleView != null)
                    mTitleView.setTextColor(i);
                if (view != null)
                    view.setBackgroundColor(i);
            }
            if (mTitleView != null)
            {
                mTitleView.setLayoutDirection(mDecor.getLayoutDirection());
                if ((2 & getLocalFeatures()) != 0)
                {
                    View view1 = findViewById(0x1020243);
                    if (view1 != null)
                        view1.setVisibility(8);
                    else
                        mTitleView.setVisibility(8);
                    if (mContentParent instanceof FrameLayout)
                        ((FrameLayout)mContentParent).setForeground(null);
                } else
                {
                    mTitleView.setText(mTitle);
                    return;
                }
            } else
            {
                mActionBar = (ActionBarView)findViewById(0x1020365);
                if (mActionBar != null)
                {
                    mActionBar.setWindowCallback(getCallback());
                    if (mActionBar.getTitle() == null)
                        mActionBar.setWindowTitle(mTitle);
                    int j = getLocalFeatures();
                    if ((j & 4) != 0)
                        mActionBar.initProgress();
                    if ((j & 0x20) != 0)
                        mActionBar.initIndeterminateProgress();
                    if ((1 & mUiOptions) == 0)
                        flag = false;
                    boolean flag1;
                    if (flag)
                        flag1 = getContext().getResources().getBoolean(0x1110006);
                    else
                        flag1 = getWindowStyle().getBoolean(22, false);
                    ActionBarContainer actionbarcontainer = (ActionBarContainer)findViewById(0x1020367);
                    if (actionbarcontainer != null)
                    {
                        mActionBar.setSplitView(actionbarcontainer);
                        mActionBar.setSplitActionBar(flag1);
                        mActionBar.setSplitWhenNarrow(flag);
                        ActionBarContextView actionbarcontextview = (ActionBarContextView)findViewById(0x1020366);
                        actionbarcontextview.setSplitView(actionbarcontainer);
                        actionbarcontextview.setSplitActionBar(flag1);
                        actionbarcontextview.setSplitWhenNarrow(flag);
                    } else
                    if (flag1)
                        Log.e("PhoneWindow", "Requested split action bar with incompatible window decor! Ignoring request.");
                    mDecor.post(new Runnable() {

                        final PhoneWindow this$0;

                        public void run()
                        {
                            PanelFeatureState panelfeaturestate = getPanelState(0, false);
                            if (!isDestroyed() && (panelfeaturestate == null || panelfeaturestate.menu == null))
                                invalidatePanelMenu(8);
                        }

            
            {
                this$0 = PhoneWindow.this;
                super();
            }
                    }
);
                    return;
                }
            }
        }
    }

    private boolean launchDefaultSearch()
    {
        android.view.Window.Callback callback = getCallback();
        if (callback != null && !isDestroyed())
        {
            sendCloseSystemWindows("search");
            return callback.onSearchRequested();
        } else
        {
            return false;
        }
    }

    private Drawable loadImageURI(Uri uri)
    {
        Drawable drawable;
        try
        {
            drawable = Drawable.createFromStream(getContext().getContentResolver().openInputStream(uri), null);
        }
        catch (Exception exception)
        {
            Log.w("PhoneWindow", (new StringBuilder()).append("Unable to open content: ").append(uri).toString());
            return null;
        }
        return drawable;
    }

    private void openPanel(PanelFeatureState panelfeaturestate, KeyEvent keyevent)
    {
label0:
        {
            if (panelfeaturestate.isOpen || isDestroyed())
                break label0;
            if (panelfeaturestate.featureId == 0)
            {
                Context context = getContext();
                boolean flag;
                if ((0xf & context.getResources().getConfiguration().screenLayout) == 4)
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if (context.getApplicationInfo().targetSdkVersion >= 11)
                    flag1 = true;
                else
                    flag1 = false;
                if (flag && flag1)
                    break label0;
            }
            android.view.Window.Callback callback = getCallback();
            if (callback != null && !callback.onMenuOpened(panelfeaturestate.featureId, panelfeaturestate.menu))
            {
                closePanel(panelfeaturestate, true);
                return;
            }
            WindowManager windowmanager = getWindowManager();
            if (windowmanager == null || !preparePanel(panelfeaturestate, keyevent))
                break label0;
            if (panelfeaturestate.menu != null && panelfeaturestate.menu.getNonActionItems().size() <= 0)
            {
                panelfeaturestate.isPrepared = false;
                return;
            }
            byte byte0 = -2;
            if (panelfeaturestate.decorView != null && !panelfeaturestate.refreshDecorView)
            {
                if (!panelfeaturestate.isInListMode())
                    byte0 = -1;
                else
                if (panelfeaturestate.createdPanelView != null)
                {
                    android.view.ViewGroup.LayoutParams layoutparams2 = panelfeaturestate.createdPanelView.getLayoutParams();
                    if (layoutparams2 != null && layoutparams2.width == -1)
                        byte0 = -1;
                }
            } else
            {
                if (panelfeaturestate.decorView == null)
                {
                    if (!initializePanelDecor(panelfeaturestate) || panelfeaturestate.decorView == null)
                        break label0;
                } else
                if (panelfeaturestate.refreshDecorView && panelfeaturestate.decorView.getChildCount() > 0)
                    panelfeaturestate.decorView.removeAllViews();
                if (!initializePanelContent(panelfeaturestate) || !panelfeaturestate.hasPanelItems())
                    break label0;
                android.view.ViewGroup.LayoutParams layoutparams = panelfeaturestate.shownPanelView.getLayoutParams();
                if (layoutparams == null)
                    layoutparams = new android.view.ViewGroup.LayoutParams(-2, -2);
                int i;
                if (layoutparams.width == -1)
                {
                    i = panelfeaturestate.fullBackground;
                    byte0 = -1;
                } else
                {
                    i = panelfeaturestate.background;
                }
                panelfeaturestate.decorView.setWindowBackground(getContext().getResources().getDrawable(i));
                android.view.ViewParent viewparent = panelfeaturestate.shownPanelView.getParent();
                if (viewparent != null && (viewparent instanceof ViewGroup))
                    ((ViewGroup)viewparent).removeView(panelfeaturestate.shownPanelView);
                panelfeaturestate.decorView.addView(panelfeaturestate.shownPanelView, layoutparams);
                if (!panelfeaturestate.shownPanelView.hasFocus())
                    panelfeaturestate.shownPanelView.requestFocus();
            }
            panelfeaturestate.isOpen = true;
            panelfeaturestate.isHandled = false;
            android.view.WindowManager.LayoutParams layoutparams1 = new android.view.WindowManager.LayoutParams(byte0, -2, panelfeaturestate.x, panelfeaturestate.y, 1003, 0x820000, panelfeaturestate.decorView.mDefaultOpacity);
            if (panelfeaturestate.isCompact)
            {
                layoutparams1.gravity = getOptionsPanelGravity();
                sRotationWatcher.addWindow(this);
            } else
            {
                layoutparams1.gravity = panelfeaturestate.gravity;
            }
            layoutparams1.windowAnimations = panelfeaturestate.windowAnimations;
            windowmanager.addView(panelfeaturestate.decorView, layoutparams1);
            return;
        }
    }

    private void openPanelsAfterRestore()
    {
        PanelFeatureState apanelfeaturestate[] = mPanels;
        if (apanelfeaturestate != null)
        {
            for (int i = -1 + apanelfeaturestate.length; i >= 0; i--)
            {
                PanelFeatureState panelfeaturestate = apanelfeaturestate[i];
                if (panelfeaturestate == null)
                    continue;
                panelfeaturestate.applyFrozenState();
                if (!panelfeaturestate.isOpen && panelfeaturestate.wasLastOpen)
                {
                    panelfeaturestate.isInExpandedMode = panelfeaturestate.wasLastExpanded;
                    openPanel(panelfeaturestate, null);
                }
            }

        }
    }

    private boolean performPanelShortcut(PanelFeatureState panelfeaturestate, int i, KeyEvent keyevent, int j)
    {
        boolean flag;
label0:
        {
label1:
            {
label2:
                {
                    if (keyevent.isSystem() || panelfeaturestate == null)
                        break label1;
                    if (!panelfeaturestate.isPrepared)
                    {
                        boolean flag1 = preparePanel(panelfeaturestate, keyevent);
                        flag = false;
                        if (!flag1)
                            break label2;
                    }
                    MenuBuilder menubuilder = panelfeaturestate.menu;
                    flag = false;
                    if (menubuilder != null)
                        flag = panelfeaturestate.menu.performShortcut(i, keyevent, j);
                }
                if (flag)
                {
                    panelfeaturestate.isHandled = true;
                    if ((j & 1) == 0 && mActionBar == null)
                    {
                        closePanel(panelfeaturestate, true);
                        return flag;
                    }
                }
                break label0;
            }
            flag = false;
        }
        return flag;
    }

    private void reopenMenu(boolean flag)
    {
        if (mActionBar != null && mActionBar.isOverflowReserved())
        {
            android.view.Window.Callback callback = getCallback();
            if (mActionBar.isOverflowMenuShowing() && flag)
            {
                mActionBar.hideOverflowMenu();
                if (callback != null && !isDestroyed())
                {
                    callback.onPanelClosed(8, getPanelState(0, true).menu);
                    return;
                }
            } else
            if (callback != null && !isDestroyed() && mActionBar.getVisibility() == 0)
            {
                PanelFeatureState panelfeaturestate1 = getPanelState(0, true);
                if (panelfeaturestate1.menu != null && !panelfeaturestate1.refreshMenuContent && callback.onPreparePanel(0, panelfeaturestate1.createdPanelView, panelfeaturestate1.menu))
                {
                    callback.onMenuOpened(8, panelfeaturestate1.menu);
                    mActionBar.showOverflowMenu();
                }
            }
            return;
        }
        PanelFeatureState panelfeaturestate = getPanelState(0, true);
        boolean flag1;
        if (flag)
        {
            if (!panelfeaturestate.isInExpandedMode)
                flag1 = true;
            else
                flag1 = false;
        } else
        {
            flag1 = panelfeaturestate.isInExpandedMode;
        }
        panelfeaturestate.refreshDecorView = true;
        closePanel(panelfeaturestate, false);
        panelfeaturestate.isInExpandedMode = flag1;
        openPanel(panelfeaturestate, null);
    }

    private void restorePanelState(SparseArray sparsearray)
    {
        for (int i = -1 + sparsearray.size(); i >= 0; i--)
        {
            int j = sparsearray.keyAt(i);
            PanelFeatureState panelfeaturestate = getPanelState(j, false);
            if (panelfeaturestate != null)
            {
                panelfeaturestate.onRestoreInstanceState((Parcelable)sparsearray.get(j));
                invalidatePanelMenu(j);
            }
        }

    }

    private void savePanelState(SparseArray sparsearray)
    {
        PanelFeatureState apanelfeaturestate[] = mPanels;
        if (apanelfeaturestate != null)
        {
            for (int i = -1 + apanelfeaturestate.length; i >= 0; i--)
                if (apanelfeaturestate[i] != null)
                    sparsearray.put(i, apanelfeaturestate[i].onSaveInstanceState());

        }
    }

    private void showProgressBars(ProgressBar progressbar, ProgressBar progressbar1)
    {
        int i = getLocalFeatures();
        if ((i & 0x20) != 0 && progressbar1.getVisibility() == 4)
            progressbar1.setVisibility(0);
        if ((i & 4) != 0 && progressbar.getProgress() < 10000)
            progressbar.setVisibility(0);
    }

    private void updateDrawable(int i, DrawableFeatureState drawablefeaturestate, boolean flag)
    {
        if (mContentParent != null)
        {
            int j = 1 << i;
            if ((j & getFeatures()) != 0 || flag)
            {
                Drawable drawable = null;
                if (drawablefeaturestate != null)
                {
                    drawable = drawablefeaturestate.child;
                    if (drawable == null)
                        drawable = drawablefeaturestate.local;
                    if (drawable == null)
                        drawable = drawablefeaturestate.def;
                }
                if ((j & getLocalFeatures()) == 0)
                {
                    if (getContainer() != null && (isActive() || flag))
                    {
                        getContainer().setChildDrawable(i, drawable);
                        return;
                    }
                } else
                if (drawablefeaturestate != null && (drawablefeaturestate.cur != drawable || drawablefeaturestate.curAlpha != drawablefeaturestate.alpha))
                {
                    drawablefeaturestate.cur = drawable;
                    drawablefeaturestate.curAlpha = drawablefeaturestate.alpha;
                    onDrawableChanged(i, drawable, drawablefeaturestate.alpha);
                    return;
                }
            }
        }
    }

    private void updateInt(int i, int j, boolean flag)
    {
label0:
        {
            if (mContentParent != null)
            {
                int k = 1 << i;
                if ((k & getFeatures()) != 0 || flag)
                {
                    if ((k & getLocalFeatures()) != 0)
                        break label0;
                    if (getContainer() != null)
                    {
                        getContainer().setChildInt(i, j);
                        return;
                    }
                }
            }
            return;
        }
        onIntChanged(i, j);
    }

    private void updateProgressBars(int i)
    {
        ProgressBar progressbar = getCircularProgressBar(true);
        ProgressBar progressbar1 = getHorizontalProgressBar(true);
        int j = getLocalFeatures();
        if (i == -1)
        {
            if ((j & 4) != 0)
            {
                int k = progressbar1.getProgress();
                byte byte0;
                if (!progressbar1.isIndeterminate() && k >= 10000)
                    byte0 = 4;
                else
                    byte0 = 0;
                progressbar1.setVisibility(byte0);
            }
            if ((j & 0x20) != 0)
                progressbar.setVisibility(0);
        } else
        if (i == -2)
        {
            if ((j & 4) != 0)
                progressbar1.setVisibility(8);
            if ((j & 0x20) != 0)
            {
                progressbar.setVisibility(8);
                return;
            }
        } else
        {
            if (i == -3)
            {
                progressbar1.setIndeterminate(true);
                return;
            }
            if (i == -4)
            {
                progressbar1.setIndeterminate(false);
                return;
            }
            if (i >= 0 && i <= 10000)
            {
                progressbar1.setProgress(i + 0);
                if (i < 10000)
                {
                    showProgressBars(progressbar1, progressbar);
                    return;
                } else
                {
                    hideProgressBars(progressbar1, progressbar);
                    return;
                }
            }
            if (20000 <= i && i <= 30000)
            {
                progressbar1.setSecondaryProgress(i - 20000);
                showProgressBars(progressbar1, progressbar);
                return;
            }
        }
    }

    public void addContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (mContentParent == null)
            installDecor();
        mContentParent.addView(view, layoutparams);
        android.view.Window.Callback callback = getCallback();
        if (callback != null && !isDestroyed())
            callback.onContentChanged();
    }

    public void alwaysReadCloseOnTouchAttr()
    {
        mAlwaysReadCloseOnTouchAttr = true;
    }

    void checkCloseActionMenu(Menu menu)
    {
        if (mClosingActionMenu)
            return;
        mClosingActionMenu = true;
        mActionBar.dismissPopupMenus();
        android.view.Window.Callback callback = getCallback();
        if (callback != null && !isDestroyed())
            callback.onPanelClosed(8, menu);
        mClosingActionMenu = false;
    }

    public final void closeAllPanels()
    {
        if (getWindowManager() == null)
            return;
        PanelFeatureState apanelfeaturestate[] = mPanels;
        int i;
        if (apanelfeaturestate != null)
            i = apanelfeaturestate.length;
        else
            i = 0;
        for (int j = 0; j < i; j++)
        {
            PanelFeatureState panelfeaturestate = apanelfeaturestate[j];
            if (panelfeaturestate != null)
                closePanel(panelfeaturestate, true);
        }

        closeContextMenu();
    }

    public final void closePanel(int i)
    {
        if (i == 0 && mActionBar != null && mActionBar.isOverflowReserved())
        {
            mActionBar.hideOverflowMenu();
            return;
        }
        if (i == 6)
        {
            closeContextMenu();
            return;
        } else
        {
            closePanel(getPanelState(i, true), true);
            return;
        }
    }

    public final void closePanel(PanelFeatureState panelfeaturestate, boolean flag)
    {
        if (flag && panelfeaturestate.featureId == 0 && mActionBar != null && mActionBar.isOverflowMenuShowing())
        {
            checkCloseActionMenu(panelfeaturestate.menu);
        } else
        {
            WindowManager windowmanager = getWindowManager();
            if (windowmanager != null && panelfeaturestate.isOpen)
            {
                if (panelfeaturestate.decorView != null)
                {
                    windowmanager.removeViewImmediate(panelfeaturestate.decorView);
                    if (panelfeaturestate.isCompact)
                        sRotationWatcher.removeWindow(this);
                }
                if (flag)
                    callOnPanelClosed(panelfeaturestate.featureId, panelfeaturestate, null);
            }
            panelfeaturestate.isPrepared = false;
            panelfeaturestate.isHandled = false;
            panelfeaturestate.isOpen = false;
            panelfeaturestate.shownPanelView = null;
            if (panelfeaturestate.isInExpandedMode)
            {
                panelfeaturestate.refreshDecorView = true;
                panelfeaturestate.isInExpandedMode = false;
            }
            if (mPreparedPanel == panelfeaturestate)
            {
                mPreparedPanel = null;
                mPanelChordingKey = 0;
                return;
            }
        }
    }

    void doInvalidatePanelMenu(int i)
    {
        PanelFeatureState panelfeaturestate = getPanelState(i, true);
        if (panelfeaturestate.menu != null)
        {
            Bundle bundle = new Bundle();
            panelfeaturestate.menu.saveActionViewStates(bundle);
            if (bundle.size() > 0)
                panelfeaturestate.frozenActionViewState = bundle;
            panelfeaturestate.menu.stopDispatchingItemsChanged();
            panelfeaturestate.menu.clear();
        }
        panelfeaturestate.refreshMenuContent = true;
        panelfeaturestate.refreshDecorView = true;
        if ((i == 8 || i == 0) && mActionBar != null)
        {
            PanelFeatureState panelfeaturestate1 = getPanelState(0, false);
            if (panelfeaturestate1 != null)
            {
                panelfeaturestate1.isPrepared = false;
                preparePanel(panelfeaturestate1, null);
            }
        }
    }

    public PanelFeatureState findMenuPanel(Menu menu)
    {
        PanelFeatureState apanelfeaturestate[] = mPanels;
        int i;
        if (apanelfeaturestate != null)
            i = apanelfeaturestate.length;
        else
            i = 0;
        for (int j = 0; j < i; j++)
        {
            PanelFeatureState panelfeaturestate = apanelfeaturestate[j];
            if (panelfeaturestate != null && panelfeaturestate.menu == menu)
                return panelfeaturestate;
        }

        return null;
    }

    protected DecorView generateDecor()
    {
        return new DecorView(getContext(), -1);
    }

    protected ViewGroup generateLayout(DecorView decorview)
    {
        TypedArray typedarray = getWindowStyle();
        mIsFloating = typedarray.getBoolean(4, false);
        int i = 0x10100 & (-1 ^ getForcedWindowFlags());
        if (mIsFloating)
        {
            setLayout(-2, -2);
            setFlags(0, i);
        } else
        {
            setFlags(0x10100, i);
        }
        if (typedarray.getBoolean(3, false))
            requestFeature(1);
        else
        if (typedarray.getBoolean(15, false))
            requestFeature(8);
        if (typedarray.getBoolean(17, false))
            requestFeature(9);
        if (typedarray.getBoolean(16, false))
            requestFeature(10);
        if (typedarray.getBoolean(9, false))
            setFlags(1024, 0x400 & (-1 ^ getForcedWindowFlags()));
        if (typedarray.getBoolean(14, false))
            setFlags(0x100000, 0x100000 & (-1 ^ getForcedWindowFlags()));
        boolean flag;
        if (getContext().getApplicationInfo().targetSdkVersion >= 11)
            flag = true;
        else
            flag = false;
        if (typedarray.getBoolean(18, flag))
            setFlags(0x800000, 0x800000 & (-1 ^ getForcedWindowFlags()));
        typedarray.getValue(19, mMinWidthMajor);
        typedarray.getValue(20, mMinWidthMinor);
        if (typedarray.hasValue(23))
        {
            if (mFixedWidthMajor == null)
                mFixedWidthMajor = new TypedValue();
            typedarray.getValue(23, mFixedWidthMajor);
        }
        if (typedarray.hasValue(25))
        {
            if (mFixedWidthMinor == null)
                mFixedWidthMinor = new TypedValue();
            typedarray.getValue(25, mFixedWidthMinor);
        }
        if (typedarray.hasValue(26))
        {
            if (mFixedHeightMajor == null)
                mFixedHeightMajor = new TypedValue();
            typedarray.getValue(26, mFixedHeightMajor);
        }
        if (typedarray.hasValue(24))
        {
            if (mFixedHeightMinor == null)
                mFixedHeightMinor = new TypedValue();
            typedarray.getValue(24, mFixedHeightMinor);
        }
        Context context = getContext();
        int j = context.getApplicationInfo().targetSdkVersion;
        boolean flag1;
        if (j < 11)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (j < 14)
            flag2 = true;
        else
            flag2 = false;
        boolean flag3 = context.getResources().getBoolean(0x111000a);
        boolean flag4;
        if (hasFeature(8) && !hasFeature(1))
            flag4 = false;
        else
            flag4 = true;
        if (!flag1 && (!flag2 || !flag3 || !flag4))
            clearFlags(0x8000000);
        else
            addFlags(0x8000000);
        if ((mAlwaysReadCloseOnTouchAttr || getContext().getApplicationInfo().targetSdkVersion >= 11) && typedarray.getBoolean(21, false))
            setCloseOnTouchOutsideIfNotSet(true);
        android.view.WindowManager.LayoutParams layoutparams = getAttributes();
        if (!hasSoftInputMode())
            layoutparams.softInputMode = typedarray.getInt(13, layoutparams.softInputMode);
        if (typedarray.getBoolean(11, mIsFloating))
        {
            if ((2 & getForcedWindowFlags()) == 0)
                layoutparams.flags = 2 | layoutparams.flags;
            if (!haveDimAmount())
                layoutparams.dimAmount = typedarray.getFloat(0, 0.5F);
        }
        if (layoutparams.windowAnimations == 0)
            layoutparams.windowAnimations = typedarray.getResourceId(8, 0);
        if (getContainer() == null)
        {
            if (mBackgroundDrawable == null)
            {
                if (mBackgroundResource == 0)
                    mBackgroundResource = typedarray.getResourceId(1, 0);
                if (mFrameResource == 0)
                    mFrameResource = typedarray.getResourceId(2, 0);
            }
            mTextColor = typedarray.getColor(7, 0xff000000);
        }
        int k = getLocalFeatures();
        int l;
        if ((k & 0x18) != 0)
        {
            if (mIsFloating)
            {
                TypedValue typedvalue2 = new TypedValue();
                getContext().getTheme().resolveAttribute(0x10103e7, typedvalue2, true);
                l = typedvalue2.resourceId;
            } else
            {
                l = 0x10900bd;
            }
            removeFeature(8);
        } else
        if ((k & 0x24) != 0 && (k & 0x100) == 0)
            l = 0x10900b9;
        else
        if ((k & 0x80) != 0)
        {
            if (mIsFloating)
            {
                TypedValue typedvalue1 = new TypedValue();
                getContext().getTheme().resolveAttribute(0x10103e8, typedvalue1, true);
                l = typedvalue1.resourceId;
            } else
            {
                l = 0x10900b8;
            }
            removeFeature(8);
        } else
        if ((k & 2) == 0)
        {
            if (mIsFloating)
            {
                TypedValue typedvalue = new TypedValue();
                getContext().getTheme().resolveAttribute(0x10103e9, typedvalue, true);
                l = typedvalue.resourceId;
            } else
            if ((k & 0x100) != 0)
            {
                if ((k & 0x200) != 0)
                    l = 0x10900b7;
                else
                    l = 0x10900b6;
            } else
            {
                l = 0x10900bc;
            }
        } else
        if ((k & 0x400) != 0)
            l = 0x10900bb;
        else
            l = 0x10900ba;
        mDecor.startChanging();
        Trace.traceBegin(8L, "DecorView-inflate");
        View view = mLayoutInflater.inflate(l, null);
        Trace.traceEnd(8L);
        decorview.addView(view, new android.view.ViewGroup.LayoutParams(-1, -1));
        ViewGroup viewgroup = (ViewGroup)findViewById(0x1020002);
        if (viewgroup == null)
            throw new RuntimeException("Window couldn't find content container view");
        if ((k & 0x20) != 0)
        {
            ProgressBar progressbar = getCircularProgressBar(false);
            if (progressbar != null)
                progressbar.setIndeterminate(true);
        }
        if (getContainer() == null)
        {
            Drawable drawable = mBackgroundDrawable;
            if (mBackgroundResource != 0)
                drawable = getContext().getResources().getDrawable(mBackgroundResource);
            mDecor.setWindowBackground(drawable);
            int i1 = mFrameResource;
            Drawable drawable1 = null;
            if (i1 != 0)
                drawable1 = getContext().getResources().getDrawable(mFrameResource);
            mDecor.setWindowFrame(drawable1);
            if (mTitleColor == 0)
                mTitleColor = mTextColor;
            if (mTitle != null)
                setTitle(mTitle);
            setTitleColor(mTitleColor);
        }
        mDecor.finishChanging();
        return viewgroup;
    }

    AudioManager getAudioManager()
    {
        if (mAudioManager == null)
            mAudioManager = (AudioManager)getContext().getSystemService("audio");
        return mAudioManager;
    }

    public View getCurrentFocus()
    {
        if (mDecor != null)
            return mDecor.findFocus();
        else
            return null;
    }

    public final View getDecorView()
    {
        Trace.traceBegin(8L, "getDecorView");
        if (mDecor == null)
            installDecor();
        Trace.traceEnd(8L);
        return mDecor;
    }

    public LayoutInflater getLayoutInflater()
    {
        return mLayoutInflater;
    }

    public int getVolumeControlStream()
    {
        return mVolumeControlStreamType;
    }

    protected boolean initializePanelContent(PanelFeatureState panelfeaturestate)
    {
        if (panelfeaturestate.createdPanelView != null)
        {
            panelfeaturestate.shownPanelView = panelfeaturestate.createdPanelView;
            return true;
        }
        if (panelfeaturestate.menu == null)
            return false;
        if (mPanelMenuPresenterCallback == null)
            mPanelMenuPresenterCallback = new PanelMenuPresenterCallback();
        MenuView menuview;
        if (panelfeaturestate.isInListMode())
            menuview = panelfeaturestate.getListMenuView(getContext(), mPanelMenuPresenterCallback);
        else
            menuview = panelfeaturestate.getIconMenuView(getContext(), mPanelMenuPresenterCallback);
        panelfeaturestate.shownPanelView = (View)menuview;
        if (panelfeaturestate.shownPanelView != null)
        {
            int i = menuview.getWindowAnimations();
            if (i != 0)
                panelfeaturestate.windowAnimations = i;
            return true;
        } else
        {
            return false;
        }
    }

    protected boolean initializePanelDecor(PanelFeatureState panelfeaturestate)
    {
        panelfeaturestate.decorView = new DecorView(getContext(), panelfeaturestate.featureId);
        panelfeaturestate.gravity = 81;
        panelfeaturestate.setStyle(getContext());
        return true;
    }

    protected boolean initializePanelMenu(PanelFeatureState panelfeaturestate)
    {
        Object obj = getContext();
        if ((panelfeaturestate.featureId == 0 || panelfeaturestate.featureId == 8) && mActionBar != null)
        {
            TypedValue typedvalue = new TypedValue();
            ((Context) (obj)).getTheme().resolveAttribute(0x1010397, typedvalue, true);
            int i = typedvalue.resourceId;
            if (i != 0 && ((Context) (obj)).getThemeResId() != i)
                obj = new ContextThemeWrapper(((Context) (obj)), i);
        }
        MenuBuilder menubuilder = new MenuBuilder(((Context) (obj)));
        menubuilder.setCallback(this);
        panelfeaturestate.setMenu(menubuilder);
        return true;
    }

    public void invalidatePanelMenu(int i)
    {
        mInvalidatePanelMenuFeatures = mInvalidatePanelMenuFeatures | 1 << i;
        if (!mInvalidatePanelMenuPosted && mDecor != null)
        {
            mDecor.postOnAnimation(mInvalidatePanelMenuRunnable);
            mInvalidatePanelMenuPosted = true;
        }
    }

    public boolean isFloating()
    {
        return mIsFloating;
    }

    public boolean isShortcutKey(int i, KeyEvent keyevent)
    {
        PanelFeatureState panelfeaturestate = getPanelState(0, true);
        return panelfeaturestate.menu != null && panelfeaturestate.menu.isShortcutKey(i, keyevent);
    }

    protected void onActive()
    {
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        PanelFeatureState panelfeaturestate;
label0:
        {
            if (mActionBar == null)
            {
                panelfeaturestate = getPanelState(0, false);
                if (panelfeaturestate != null && panelfeaturestate.menu != null)
                {
                    if (!panelfeaturestate.isOpen)
                        break label0;
                    Bundle bundle = new Bundle();
                    if (panelfeaturestate.iconMenuPresenter != null)
                        panelfeaturestate.iconMenuPresenter.saveHierarchyState(bundle);
                    if (panelfeaturestate.listMenuPresenter != null)
                        panelfeaturestate.listMenuPresenter.saveHierarchyState(bundle);
                    clearMenuViews(panelfeaturestate);
                    reopenMenu(false);
                    if (panelfeaturestate.iconMenuPresenter != null)
                        panelfeaturestate.iconMenuPresenter.restoreHierarchyState(bundle);
                    if (panelfeaturestate.listMenuPresenter != null)
                        panelfeaturestate.listMenuPresenter.restoreHierarchyState(bundle);
                }
            }
            return;
        }
        clearMenuViews(panelfeaturestate);
    }

    protected void onDrawableChanged(int i, Drawable drawable, int j)
    {
        ImageView imageview;
label0:
        {
label1:
            {
                if (i == 3)
                {
                    imageview = getLeftIconView();
                } else
                {
                    if (i != 4)
                        break label1;
                    imageview = getRightIconView();
                }
                if (drawable == null)
                    break label0;
                drawable.setAlpha(j);
                imageview.setImageDrawable(drawable);
                imageview.setVisibility(0);
            }
            return;
        }
        imageview.setVisibility(8);
    }

    protected void onIntChanged(int i, int j)
    {
        if (i != 2 && i != 5)
        {
            if (i == 7)
            {
                FrameLayout framelayout = (FrameLayout)findViewById(0x1020243);
                if (framelayout != null)
                {
                    mLayoutInflater.inflate(j, framelayout);
                    return;
                }
            }
        } else
        {
            updateProgressBars(j);
        }
    }

    protected boolean onKeyDown(int i, int j, KeyEvent keyevent)
    {
        android.view.KeyEvent.DispatcherState dispatcherstate;
        if (mDecor != null)
            dispatcherstate = mDecor.getKeyDispatcherState();
        else
            dispatcherstate = null;
        switch (j)
        {
        case 4: // '\004'
            if (keyevent.getRepeatCount() <= 0 && i >= 0)
            {
                if (dispatcherstate != null)
                    dispatcherstate.startTracking(keyevent, this);
                return true;
            }
            // fall through

        default:
            return false;

        case 82: // 'R'
            if (i < 0)
                i = 0;
            onKeyDownPanel(i, keyevent);
            return true;

        case 24: // '\030'
        case 25: // '\031'
        case 164: 
            getAudioManager().handleKeyDown(keyevent, mVolumeControlStreamType);
            return true;
        }
    }

    public final boolean onKeyDownPanel(int i, KeyEvent keyevent)
    {
        int j = keyevent.getKeyCode();
        if (keyevent.getRepeatCount() == 0)
        {
            mPanelChordingKey = j;
            PanelFeatureState panelfeaturestate = getPanelState(i, true);
            if (!panelfeaturestate.isOpen)
                return preparePanel(panelfeaturestate, keyevent);
        }
        return false;
    }

    protected boolean onKeyUp(int i, int j, KeyEvent keyevent)
    {
label0:
        {
label1:
            {
                android.view.KeyEvent.DispatcherState dispatcherstate;
                if (mDecor != null)
                    dispatcherstate = mDecor.getKeyDispatcherState();
                else
                    dispatcherstate = null;
                if (dispatcherstate != null)
                    dispatcherstate.handleUpEvent(keyevent);
                switch (j)
                {
                default:
                    break;

                case 24: // '\030'
                case 25: // '\031'
                case 164: 
                    break label0;

                case 82: // 'R'
                    break label1;

                case 84: // 'T'
                    if (!getKeyguardManager().inKeyguardRestrictedInputMode())
                    {
                        if (keyevent.isTracking() && !keyevent.isCanceled())
                            launchDefaultSearch();
                        return true;
                    }
                    break;

                case 4: // '\004'
                    if (i >= 0 && keyevent.isTracking() && !keyevent.isCanceled())
                    {
                        if (i == 0)
                        {
                            PanelFeatureState panelfeaturestate = getPanelState(i, false);
                            if (panelfeaturestate != null && panelfeaturestate.isInExpandedMode)
                            {
                                reopenMenu(true);
                                return true;
                            }
                        }
                        closePanel(i);
                        return true;
                    }
                    break;
                }
                return false;
            }
            if (i < 0)
                i = 0;
            onKeyUpPanel(i, keyevent);
            return true;
        }
        getAudioManager().handleKeyUp(keyevent, mVolumeControlStreamType);
        return true;
    }

    public final void onKeyUpPanel(int i, KeyEvent keyevent)
    {
        if (mPanelChordingKey != 0)
        {
            mPanelChordingKey = 0;
            if (!keyevent.isCanceled() && (mDecor == null || mDecor.mActionMode == null))
            {
                PanelFeatureState panelfeaturestate = getPanelState(i, true);
                boolean flag;
                if (i == 0 && mActionBar != null && mActionBar.isOverflowReserved())
                {
                    int j = mActionBar.getVisibility();
                    flag = false;
                    if (j == 0)
                        if (!mActionBar.isOverflowMenuShowing())
                        {
                            boolean flag3 = isDestroyed();
                            flag = false;
                            if (!flag3)
                            {
                                boolean flag4 = preparePanel(panelfeaturestate, keyevent);
                                flag = false;
                                if (flag4)
                                    flag = mActionBar.showOverflowMenu();
                            }
                        } else
                        {
                            flag = mActionBar.hideOverflowMenu();
                        }
                } else
                if (!panelfeaturestate.isOpen && !panelfeaturestate.isHandled)
                {
                    boolean flag1 = panelfeaturestate.isPrepared;
                    flag = false;
                    if (flag1)
                    {
                        boolean flag2 = true;
                        if (panelfeaturestate.refreshMenuContent)
                        {
                            panelfeaturestate.isPrepared = false;
                            flag2 = preparePanel(panelfeaturestate, keyevent);
                        }
                        flag = false;
                        if (flag2)
                        {
                            EventLog.writeEvent(50001, 0);
                            openPanel(panelfeaturestate, keyevent);
                            flag = true;
                        }
                    }
                } else
                {
                    flag = panelfeaturestate.isOpen;
                    closePanel(panelfeaturestate, true);
                }
                if (flag)
                {
                    AudioManager audiomanager = (AudioManager)getContext().getSystemService("audio");
                    if (audiomanager != null)
                    {
                        audiomanager.playSoundEffect(0);
                        return;
                    } else
                    {
                        Log.w("PhoneWindow", "Couldn't get audio manager");
                        return;
                    }
                }
            }
        }
    }

    public boolean onMenuItemSelected(MenuBuilder menubuilder, MenuItem menuitem)
    {
        android.view.Window.Callback callback = getCallback();
        if (callback != null && !isDestroyed())
        {
            PanelFeatureState panelfeaturestate = findMenuPanel(menubuilder.getRootMenu());
            if (panelfeaturestate != null)
                return callback.onMenuItemSelected(panelfeaturestate.featureId, menuitem);
        }
        return false;
    }

    public void onMenuModeChange(MenuBuilder menubuilder)
    {
        reopenMenu(true);
    }

    void onOptionsPanelRotationChanged()
    {
        PanelFeatureState panelfeaturestate = getPanelState(0, false);
        if (panelfeaturestate != null)
        {
            android.view.WindowManager.LayoutParams layoutparams;
            if (panelfeaturestate.decorView != null)
                layoutparams = (android.view.WindowManager.LayoutParams)panelfeaturestate.decorView.getLayoutParams();
            else
                layoutparams = null;
            if (layoutparams != null)
            {
                layoutparams.gravity = getOptionsPanelGravity();
                WindowManager windowmanager = getWindowManager();
                if (windowmanager != null)
                {
                    windowmanager.updateViewLayout(panelfeaturestate.decorView, layoutparams);
                    return;
                }
            }
        }
    }

    public final void openPanel(int i, KeyEvent keyevent)
    {
        if (i == 0 && mActionBar != null && mActionBar.isOverflowReserved())
        {
            if (mActionBar.getVisibility() == 0)
                mActionBar.showOverflowMenu();
            return;
        } else
        {
            openPanel(getPanelState(i, true), keyevent);
            return;
        }
    }

    public final View peekDecorView()
    {
        return mDecor;
    }

    public boolean performContextMenuIdentifierAction(int i, int j)
    {
        if (mContextMenu != null)
            return mContextMenu.performIdentifierAction(i, j);
        else
            return false;
    }

    public boolean performPanelIdentifierAction(int i, int j, int k)
    {
        PanelFeatureState panelfeaturestate = getPanelState(i, true);
        boolean flag = preparePanel(panelfeaturestate, new KeyEvent(0, 82));
        boolean flag1 = false;
        if (flag)
        {
            MenuBuilder menubuilder = panelfeaturestate.menu;
            flag1 = false;
            if (menubuilder != null)
            {
                flag1 = panelfeaturestate.menu.performIdentifierAction(j, k);
                if (mActionBar == null)
                {
                    closePanel(panelfeaturestate, true);
                    return flag1;
                }
            }
        }
        return flag1;
    }

    public boolean performPanelShortcut(int i, int j, KeyEvent keyevent, int k)
    {
        return performPanelShortcut(getPanelState(i, true), j, keyevent, k);
    }

    public final boolean preparePanel(PanelFeatureState panelfeaturestate, KeyEvent keyevent)
    {
label0:
        {
label1:
            {
                if (isDestroyed())
                    break label0;
                if (panelfeaturestate.isPrepared)
                    return true;
                if (mPreparedPanel != null && mPreparedPanel != panelfeaturestate)
                    closePanel(mPreparedPanel, false);
                android.view.Window.Callback callback = getCallback();
                if (callback != null)
                    panelfeaturestate.createdPanelView = callback.onCreatePanelView(panelfeaturestate.featureId);
                if (panelfeaturestate.createdPanelView == null)
                {
                    if (panelfeaturestate.menu == null || panelfeaturestate.refreshMenuContent)
                    {
                        if (panelfeaturestate.menu == null && (!initializePanelMenu(panelfeaturestate) || panelfeaturestate.menu == null))
                            break label0;
                        if (mActionBar != null)
                        {
                            if (mActionMenuPresenterCallback == null)
                                mActionMenuPresenterCallback = new ActionMenuPresenterCallback();
                            mActionBar.setMenu(panelfeaturestate.menu, mActionMenuPresenterCallback);
                        }
                        panelfeaturestate.menu.stopDispatchingItemsChanged();
                        if (callback == null || !callback.onCreatePanelMenu(panelfeaturestate.featureId, panelfeaturestate.menu))
                            break label1;
                        panelfeaturestate.refreshMenuContent = false;
                    }
                    panelfeaturestate.menu.stopDispatchingItemsChanged();
                    if (panelfeaturestate.frozenActionViewState != null)
                    {
                        panelfeaturestate.menu.restoreActionViewStates(panelfeaturestate.frozenActionViewState);
                        panelfeaturestate.frozenActionViewState = null;
                    }
                    if (!callback.onPreparePanel(panelfeaturestate.featureId, panelfeaturestate.createdPanelView, panelfeaturestate.menu))
                    {
                        if (mActionBar != null)
                            mActionBar.setMenu(null, mActionMenuPresenterCallback);
                        panelfeaturestate.menu.startDispatchingItemsChanged();
                        return false;
                    }
                    int i;
                    if (keyevent != null)
                        i = keyevent.getDeviceId();
                    else
                        i = -1;
                    boolean flag;
                    if (KeyCharacterMap.load(i).getKeyboardType() != 1)
                        flag = true;
                    else
                        flag = false;
                    panelfeaturestate.qwertyMode = flag;
                    panelfeaturestate.menu.setQwertyMode(panelfeaturestate.qwertyMode);
                    panelfeaturestate.menu.startDispatchingItemsChanged();
                }
                panelfeaturestate.isPrepared = true;
                panelfeaturestate.isHandled = false;
                mPreparedPanel = panelfeaturestate;
                return true;
            }
            panelfeaturestate.setMenu(null);
            if (mActionBar != null)
            {
                mActionBar.setMenu(null, mActionMenuPresenterCallback);
                return false;
            }
        }
        return false;
    }

    public boolean requestFeature(int i)
    {
        if (mContentParent != null)
            throw new AndroidRuntimeException("requestFeature() must be called before adding content");
        int j = getFeatures();
        if (j != 65 && i == 7)
            throw new AndroidRuntimeException("You cannot combine custom titles with other title features");
        if ((j & 0x80) != 0 && i != 7 && i != 10)
            throw new AndroidRuntimeException("You cannot combine custom titles with other title features");
        if ((j & 2) != 0 && i == 8)
            return false;
        if ((j & 0x100) != 0 && i == 1)
            removeFeature(8);
        return super.requestFeature(i);
    }

    public void restoreHierarchyState(Bundle bundle)
    {
        if (mContentParent != null)
        {
            SparseArray sparsearray = bundle.getSparseParcelableArray("android:views");
            if (sparsearray != null)
                mContentParent.restoreHierarchyState(sparsearray);
            int i = bundle.getInt("android:focusedViewId", -1);
            if (i != -1)
            {
                View view = mContentParent.findViewById(i);
                if (view != null)
                    view.requestFocus();
                else
                    Log.w("PhoneWindow", (new StringBuilder()).append("Previously focused view reported id ").append(i).append(" during save, but can't be found during restore.").toString());
            }
            SparseArray sparsearray1 = bundle.getSparseParcelableArray("android:Panels");
            if (sparsearray1 != null)
                restorePanelState(sparsearray1);
            if (mActionBar != null)
            {
                SparseArray sparsearray2 = bundle.getSparseParcelableArray("android:ActionBar");
                if (sparsearray2 != null)
                {
                    mActionBar.restoreHierarchyState(sparsearray2);
                    return;
                } else
                {
                    Log.w("PhoneWindow", "Missing saved instance states for action bar views! State will not be restored.");
                    return;
                }
            }
        }
    }

    public Bundle saveHierarchyState()
    {
        Bundle bundle = new Bundle();
        if (mContentParent != null)
        {
            SparseArray sparsearray = new SparseArray();
            mContentParent.saveHierarchyState(sparsearray);
            bundle.putSparseParcelableArray("android:views", sparsearray);
            View view = mContentParent.findFocus();
            if (view != null && view.getId() != -1)
                bundle.putInt("android:focusedViewId", view.getId());
            SparseArray sparsearray1 = new SparseArray();
            savePanelState(sparsearray1);
            if (sparsearray1.size() > 0)
                bundle.putSparseParcelableArray("android:Panels", sparsearray1);
            if (mActionBar != null)
            {
                SparseArray sparsearray2 = new SparseArray();
                mActionBar.saveHierarchyState(sparsearray2);
                bundle.putSparseParcelableArray("android:ActionBar", sparsearray2);
                return bundle;
            }
        }
        return bundle;
    }

    void sendCloseSystemWindows()
    {
        PhoneWindowManager.sendCloseSystemWindows(getContext(), null);
    }

    void sendCloseSystemWindows(String s)
    {
        PhoneWindowManager.sendCloseSystemWindows(getContext(), s);
    }

    public final void setBackgroundDrawable(Drawable drawable)
    {
        if (drawable != mBackgroundDrawable || mBackgroundResource != 0)
        {
            mBackgroundResource = 0;
            mBackgroundDrawable = drawable;
            if (mDecor != null)
                mDecor.setWindowBackground(drawable);
        }
    }

    public final void setChildDrawable(int i, Drawable drawable)
    {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        drawablefeaturestate.child = drawable;
        updateDrawable(i, drawablefeaturestate, false);
    }

    public final void setChildInt(int i, int j)
    {
        updateInt(i, j, false);
    }

    public final void setContainer(Window window)
    {
        super.setContainer(window);
    }

    public void setContentView(int i)
    {
        if (mContentParent == null)
            installDecor();
        else
            mContentParent.removeAllViews();
        mLayoutInflater.inflate(i, mContentParent);
        android.view.Window.Callback callback = getCallback();
        if (callback != null && !isDestroyed())
            callback.onContentChanged();
    }

    public void setContentView(View view)
    {
        setContentView(view, new android.view.ViewGroup.LayoutParams(-1, -1));
    }

    public void setContentView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (mContentParent == null)
            installDecor();
        else
            mContentParent.removeAllViews();
        mContentParent.addView(view, layoutparams);
        android.view.Window.Callback callback = getCallback();
        if (callback != null && !isDestroyed())
            callback.onContentChanged();
    }

    protected final void setFeatureDefaultDrawable(int i, Drawable drawable)
    {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        if (drawablefeaturestate.def != drawable)
        {
            drawablefeaturestate.def = drawable;
            updateDrawable(i, drawablefeaturestate, false);
        }
    }

    public final void setFeatureDrawable(int i, Drawable drawable)
    {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        drawablefeaturestate.resid = 0;
        drawablefeaturestate.uri = null;
        if (drawablefeaturestate.local != drawable)
        {
            drawablefeaturestate.local = drawable;
            updateDrawable(i, drawablefeaturestate, false);
        }
    }

    public void setFeatureDrawableAlpha(int i, int j)
    {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
        if (drawablefeaturestate.alpha != j)
        {
            drawablefeaturestate.alpha = j;
            updateDrawable(i, drawablefeaturestate, false);
        }
    }

    public final void setFeatureDrawableResource(int i, int j)
    {
        if (j != 0)
        {
            DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
            if (drawablefeaturestate.resid != j)
            {
                drawablefeaturestate.resid = j;
                drawablefeaturestate.uri = null;
                drawablefeaturestate.local = getContext().getResources().getDrawable(j);
                updateDrawable(i, drawablefeaturestate, false);
            }
            return;
        } else
        {
            setFeatureDrawable(i, null);
            return;
        }
    }

    public final void setFeatureDrawableUri(int i, Uri uri)
    {
        if (uri != null)
        {
            DrawableFeatureState drawablefeaturestate = getDrawableState(i, true);
            if (drawablefeaturestate.uri == null || !drawablefeaturestate.uri.equals(uri))
            {
                drawablefeaturestate.resid = 0;
                drawablefeaturestate.uri = uri;
                drawablefeaturestate.local = loadImageURI(uri);
                updateDrawable(i, drawablefeaturestate, false);
            }
            return;
        } else
        {
            setFeatureDrawable(i, null);
            return;
        }
    }

    protected void setFeatureFromAttrs(int i, TypedArray typedarray, int j, int k)
    {
        Drawable drawable = typedarray.getDrawable(j);
        if (drawable != null)
        {
            requestFeature(i);
            setFeatureDefaultDrawable(i, drawable);
        }
        if ((getFeatures() & 1 << i) != 0)
        {
            int l = typedarray.getInt(k, -1);
            if (l >= 0)
                setFeatureDrawableAlpha(i, l);
        }
    }

    public final void setFeatureInt(int i, int j)
    {
        updateInt(i, j, false);
    }

    public void setTitle(CharSequence charsequence)
    {
        if (mTitleView != null)
            mTitleView.setText(charsequence);
        else
        if (mActionBar != null)
            mActionBar.setWindowTitle(charsequence);
        mTitle = charsequence;
    }

    public void setTitleColor(int i)
    {
        if (mTitleView != null)
            mTitleView.setTextColor(i);
        mTitleColor = i;
    }

    public void setUiOptions(int i)
    {
        mUiOptions = i;
    }

    public void setUiOptions(int i, int j)
    {
        mUiOptions = mUiOptions & ~j | i & j;
    }

    public void setVolumeControlStream(int i)
    {
        mVolumeControlStreamType = i;
    }

    public boolean superDispatchGenericMotionEvent(MotionEvent motionevent)
    {
        return mDecor.superDispatchGenericMotionEvent(motionevent);
    }

    public boolean superDispatchKeyEvent(KeyEvent keyevent)
    {
        return mDecor.superDispatchKeyEvent(keyevent);
    }

    public boolean superDispatchKeyShortcutEvent(KeyEvent keyevent)
    {
        return mDecor.superDispatchKeyShortcutEvent(keyevent);
    }

    public boolean superDispatchTouchEvent(MotionEvent motionevent)
    {
        return mDecor.superDispatchTouchEvent(motionevent);
    }

    public boolean superDispatchTrackballEvent(MotionEvent motionevent)
    {
        return mDecor.superDispatchTrackballEvent(motionevent);
    }

    public void takeInputQueue(android.view.InputQueue.Callback callback)
    {
        mTakeInputQueueCallback = callback;
    }

    public void takeKeyEvents(boolean flag)
    {
        mDecor.setFocusable(flag);
    }

    public void takeSurface(android.view.SurfaceHolder.Callback2 callback2)
    {
        mTakeSurfaceCallback = callback2;
    }

    public final void togglePanel(int i, KeyEvent keyevent)
    {
        PanelFeatureState panelfeaturestate = getPanelState(i, true);
        if (panelfeaturestate.isOpen)
        {
            closePanel(panelfeaturestate, true);
            return;
        } else
        {
            openPanel(panelfeaturestate, keyevent);
            return;
        }
    }

    protected final void updateDrawable(int i, boolean flag)
    {
        DrawableFeatureState drawablefeaturestate = getDrawableState(i, false);
        if (drawablefeaturestate != null)
            updateDrawable(i, drawablefeaturestate, flag);
    }




/*
    static int access$002(PhoneWindow phonewindow, int i)
    {
        phonewindow.mInvalidatePanelMenuFeatures = i;
        return i;
    }

*/



/*
    static boolean access$102(PhoneWindow phonewindow, boolean flag)
    {
        phonewindow.mInvalidatePanelMenuPosted = flag;
        return flag;
    }

*/




/*
    static ContextMenuBuilder access$1202(PhoneWindow phonewindow, ContextMenuBuilder contextmenubuilder)
    {
        phonewindow.mContextMenu = contextmenubuilder;
        return contextmenubuilder;
    }

*/


/*
    static MenuDialogHelper access$1302(PhoneWindow phonewindow, MenuDialogHelper menudialoghelper)
    {
        phonewindow.mContextMenuHelper = menudialoghelper;
        return menudialoghelper;
    }

*/









    // Unreferenced inner class com/android/internal/policy/impl/PhoneWindow$RotationWatcher$1

/* anonymous class */
    class RotationWatcher._cls1
        implements Runnable
    {

        final RotationWatcher this$0;

        public void run()
        {
            dispatchRotationChanged();
        }

            
            {
                this$0 = RotationWatcher.this;
                super();
            }
    }

}
