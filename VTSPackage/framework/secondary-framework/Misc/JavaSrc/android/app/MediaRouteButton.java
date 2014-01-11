// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.MediaRouter;
import android.text.TextUtils;
import android.util.*;
import android.view.View;
import android.widget.Toast;
import com.android.internal.app.MediaRouteChooserDialogFragment;

// Referenced classes of package android.app:
//            Activity, FragmentManager

public class MediaRouteButton extends View
{
    private class MediaRouteCallback extends android.media.MediaRouter.SimpleCallback
    {

        final MediaRouteButton this$0;

        public void onRouteAdded(MediaRouter mediarouter, android.media.MediaRouter.RouteInfo routeinfo)
        {
            updateRouteCount();
        }

        public void onRouteChanged(MediaRouter mediarouter, android.media.MediaRouter.RouteInfo routeinfo)
        {
            updateRemoteIndicator();
        }

        public void onRouteGrouped(MediaRouter mediarouter, android.media.MediaRouter.RouteInfo routeinfo, android.media.MediaRouter.RouteGroup routegroup, int i)
        {
            updateRouteCount();
        }

        public void onRouteRemoved(MediaRouter mediarouter, android.media.MediaRouter.RouteInfo routeinfo)
        {
            updateRouteCount();
        }

        public void onRouteSelected(MediaRouter mediarouter, int i, android.media.MediaRouter.RouteInfo routeinfo)
        {
            updateRemoteIndicator();
        }

        public void onRouteUngrouped(MediaRouter mediarouter, android.media.MediaRouter.RouteInfo routeinfo, android.media.MediaRouter.RouteGroup routegroup)
        {
            updateRouteCount();
        }

        public void onRouteUnselected(MediaRouter mediarouter, int i, android.media.MediaRouter.RouteInfo routeinfo)
        {
            updateRemoteIndicator();
        }

        private MediaRouteCallback()
        {
            this$0 = MediaRouteButton.this;
            super();
        }

    }


    private static final int ACTIVATED_STATE_SET[] = {
        0x10102fe
    };
    private static final int CHECKED_STATE_SET[] = {
        0x10100a0
    };
    private static final String TAG = "MediaRouteButton";
    private boolean mAttachedToWindow;
    private boolean mCheatSheetEnabled;
    private MediaRouteChooserDialogFragment mDialogFragment;
    private android.view.View.OnClickListener mExtendedSettingsClickListener;
    private boolean mIsConnecting;
    private int mMinHeight;
    private int mMinWidth;
    private boolean mRemoteActive;
    private Drawable mRemoteIndicator;
    private int mRouteTypes;
    private MediaRouter mRouter;
    private final MediaRouteCallback mRouterCallback;
    private boolean mToggleMode;

    public MediaRouteButton(Context context)
    {
        this(context, null);
    }

    public MediaRouteButton(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x10103ad);
    }

    public MediaRouteButton(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mRouterCallback = new MediaRouteCallback();
        mRouter = (MediaRouter)context.getSystemService("media_router");
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.MediaRouteButton, i, 0);
        setRemoteIndicatorDrawable(typedarray.getDrawable(3));
        mMinWidth = typedarray.getDimensionPixelSize(0, 0);
        mMinHeight = typedarray.getDimensionPixelSize(1, 0);
        int j = typedarray.getInteger(2, 1);
        typedarray.recycle();
        setClickable(true);
        setLongClickable(true);
        setRouteTypes(j);
    }

    private Activity getActivity()
    {
        Context context;
        for (context = getContext(); (context instanceof ContextWrapper) && !(context instanceof Activity); context = ((ContextWrapper)context).getBaseContext());
        if (!(context instanceof Activity))
            throw new IllegalStateException("The MediaRouteButton's Context is not an Activity.");
        else
            return (Activity)context;
    }

    private void setRemoteIndicatorDrawable(Drawable drawable)
    {
        if (mRemoteIndicator != null)
        {
            mRemoteIndicator.setCallback(null);
            unscheduleDrawable(mRemoteIndicator);
        }
        mRemoteIndicator = drawable;
        if (drawable != null)
        {
            drawable.setCallback(this);
            drawable.setState(getDrawableState());
            boolean flag;
            if (getVisibility() == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
        }
        refreshDrawableState();
    }

    private void updateRouteInfo()
    {
        updateRemoteIndicator();
        updateRouteCount();
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if (mRemoteIndicator != null)
        {
            int ai[] = getDrawableState();
            mRemoteIndicator.setState(ai);
            invalidate();
        }
    }

    public int getRouteTypes()
    {
        return mRouteTypes;
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        if (mRemoteIndicator != null)
            mRemoteIndicator.jumpToCurrentState();
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mAttachedToWindow = true;
        if (mRouteTypes != 0)
        {
            mRouter.addCallback(mRouteTypes, mRouterCallback);
            updateRouteInfo();
        }
    }

    protected int[] onCreateDrawableState(int i)
    {
        int ai[] = super.onCreateDrawableState(i + 1);
        if (mIsConnecting)
            mergeDrawableStates(ai, CHECKED_STATE_SET);
        else
        if (mRemoteActive)
        {
            mergeDrawableStates(ai, ACTIVATED_STATE_SET);
            return ai;
        }
        return ai;
    }

    public void onDetachedFromWindow()
    {
        if (mRouteTypes != 0)
            mRouter.removeCallback(mRouterCallback);
        mAttachedToWindow = false;
        super.onDetachedFromWindow();
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        if (mRemoteIndicator == null)
        {
            return;
        } else
        {
            int i = getPaddingLeft();
            int j = getWidth() - getPaddingRight();
            int k = getPaddingTop();
            int l = getHeight() - getPaddingBottom();
            int i1 = mRemoteIndicator.getIntrinsicWidth();
            int j1 = mRemoteIndicator.getIntrinsicHeight();
            int k1 = i + (j - i - i1) / 2;
            int l1 = k + (l - k - j1) / 2;
            mRemoteIndicator.setBounds(k1, l1, k1 + i1, l1 + j1);
            mRemoteIndicator.draw(canvas);
            return;
        }
    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getSize(i);
        int l = android.view.View.MeasureSpec.getSize(j);
        int i1 = android.view.View.MeasureSpec.getMode(i);
        int j1 = android.view.View.MeasureSpec.getMode(j);
        int k1 = mMinWidth;
        int l1;
        if (mRemoteIndicator != null)
            l1 = mRemoteIndicator.getIntrinsicWidth();
        else
            l1 = 0;
        int i2 = Math.max(k1, l1);
        int j2 = mMinHeight;
        Drawable drawable = mRemoteIndicator;
        int k2 = 0;
        if (drawable != null)
            k2 = mRemoteIndicator.getIntrinsicHeight();
        int l2 = Math.max(j2, k2);
        int i3;
        switch (i1)
        {
        case -2147483648: 
            i3 = Math.min(k, i2 + getPaddingLeft() + getPaddingRight());
            break;

        case 1073741824: 
            i3 = k;
            break;

        default:
            i3 = i2 + getPaddingLeft() + getPaddingRight();
            break;
        }
        int j3;
        switch (j1)
        {
        case -2147483648: 
            j3 = Math.min(l, l2 + getPaddingTop() + getPaddingBottom());
            break;

        case 1073741824: 
            j3 = l;
            break;

        default:
            j3 = l2 + getPaddingTop() + getPaddingBottom();
            break;
        }
        setMeasuredDimension(i3, j3);
    }

    public boolean performClick()
    {
        boolean flag = super.performClick();
        if (!flag)
            playSoundEffect(0);
        if (mToggleMode)
        {
            if (mRemoteActive)
            {
                mRouter.selectRouteInt(mRouteTypes, mRouter.getSystemAudioRoute());
            } else
            {
                int i = mRouter.getRouteCount();
                for (int j = 0; j < i; j++)
                {
                    android.media.MediaRouter.RouteInfo routeinfo = mRouter.getRouteAt(j);
                    if ((routeinfo.getSupportedTypes() & mRouteTypes) != 0 && routeinfo != mRouter.getSystemAudioRoute())
                        mRouter.selectRouteInt(mRouteTypes, routeinfo);
                }

            }
            return flag;
        } else
        {
            showDialog();
            return flag;
        }
    }

    public boolean performLongClick()
    {
        if (super.performLongClick())
            return true;
        if (!mCheatSheetEnabled)
            return false;
        CharSequence charsequence = getContentDescription();
        if (TextUtils.isEmpty(charsequence))
            return false;
        int ai[] = new int[2];
        Rect rect = new Rect();
        getLocationOnScreen(ai);
        getWindowVisibleDisplayFrame(rect);
        Context context = getContext();
        int i = getWidth();
        int j = getHeight();
        int k = ai[1] + j / 2;
        int l = context.getResources().getDisplayMetrics().widthPixels;
        Toast toast = Toast.makeText(context, charsequence, 0);
        if (k < rect.height())
            toast.setGravity(0x800035, l - ai[0] - i / 2, j);
        else
            toast.setGravity(81, 0, j);
        toast.show();
        performHapticFeedback(0);
        return true;
    }

    void setCheatSheetEnabled(boolean flag)
    {
        mCheatSheetEnabled = flag;
    }

    public void setExtendedSettingsClickListener(android.view.View.OnClickListener onclicklistener)
    {
        mExtendedSettingsClickListener = onclicklistener;
        if (mDialogFragment != null)
            mDialogFragment.setExtendedSettingsClickListener(onclicklistener);
    }

    public void setRouteTypes(int i)
    {
        if (i != mRouteTypes)
        {
            if (mAttachedToWindow && mRouteTypes != 0)
                mRouter.removeCallback(mRouterCallback);
            mRouteTypes = i;
            if (mAttachedToWindow)
            {
                updateRouteInfo();
                mRouter.addCallback(i, mRouterCallback);
                return;
            }
        }
    }

    public void setVisibility(int i)
    {
        super.setVisibility(i);
        if (mRemoteIndicator != null)
        {
            Drawable drawable = mRemoteIndicator;
            boolean flag;
            if (getVisibility() == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
        }
    }

    public void showDialog()
    {
        FragmentManager fragmentmanager = getActivity().getFragmentManager();
        if (mDialogFragment == null)
            mDialogFragment = (MediaRouteChooserDialogFragment)fragmentmanager.findFragmentByTag("android:MediaRouteChooserDialogFragment");
        if (mDialogFragment != null)
        {
            Log.w("MediaRouteButton", "showDialog(): Already showing!");
            return;
        } else
        {
            mDialogFragment = new MediaRouteChooserDialogFragment();
            mDialogFragment.setExtendedSettingsClickListener(mExtendedSettingsClickListener);
            mDialogFragment.setLauncherListener(new com.android.internal.app.MediaRouteChooserDialogFragment.LauncherListener() {

                final MediaRouteButton this$0;

                public void onDetached(MediaRouteChooserDialogFragment mediaroutechooserdialogfragment)
                {
                    mDialogFragment = null;
                }

            
            {
                this$0 = MediaRouteButton.this;
                super();
            }
            }
);
            mDialogFragment.setRouteTypes(mRouteTypes);
            mDialogFragment.show(fragmentmanager, "android:MediaRouteChooserDialogFragment");
            return;
        }
    }

    void updateRemoteIndicator()
    {
        boolean flag = true;
        android.media.MediaRouter.RouteInfo routeinfo = mRouter.getSelectedRoute(mRouteTypes);
        boolean flag1;
        if (routeinfo != mRouter.getSystemAudioRoute())
            flag1 = flag;
        else
            flag1 = false;
        if (routeinfo == null || routeinfo.getStatusCode() != 2)
            flag = false;
        boolean flag2 = mRemoteActive;
        boolean flag3 = false;
        if (flag2 != flag1)
        {
            mRemoteActive = flag1;
            flag3 = true;
        }
        if (mIsConnecting != flag)
        {
            mIsConnecting = flag;
            flag3 = true;
        }
        if (flag3)
            refreshDrawableState();
    }

    void updateRouteCount()
    {
        boolean flag = true;
        int i = mRouter.getRouteCount();
        int j = 0;
        boolean flag1 = false;
        for (int k = 0; k < i; k++)
        {
            android.media.MediaRouter.RouteInfo routeinfo = mRouter.getRouteAt(k);
            int l = routeinfo.getSupportedTypes();
            if ((l & mRouteTypes) == 0)
                continue;
            if (routeinfo instanceof android.media.MediaRouter.RouteGroup)
                j += ((android.media.MediaRouter.RouteGroup)routeinfo).getRouteCount();
            else
                j++;
            if ((l & 2) != 0)
                flag1 = true;
        }

        boolean flag2;
        if (j != 0)
            flag2 = flag;
        else
            flag2 = false;
        setEnabled(flag2);
        if (j != 2 || (1 & mRouteTypes) == 0 || flag1)
            flag = false;
        mToggleMode = flag;
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return super.verifyDrawable(drawable) || drawable == mRemoteIndicator;
    }



/*
    static MediaRouteChooserDialogFragment access$102(MediaRouteButton mediaroutebutton, MediaRouteChooserDialogFragment mediaroutechooserdialogfragment)
    {
        mediaroutebutton.mDialogFragment = mediaroutechooserdialogfragment;
        return mediaroutechooserdialogfragment;
    }

*/
}
