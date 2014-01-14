// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.util;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.view.View;
import android.widget.ImageView;
import com.mediatek.xlog.Xlog;

public abstract class StateTracker
{

    private static final boolean DBG = true;
    public static final int STATE_DISABLED = 0;
    public static final int STATE_ENABLED = 1;
    public static final int STATE_INTERMEDIATE = -1;
    public static final int STATE_TURNING_OFF = 3;
    public static final int STATE_TURNING_ON = 2;
    public static final int STATE_UNKNOWN = -2;
    private static final String TAG = "StateTracker";
    private Boolean mActualState;
    private boolean mDeferredStateChangeRequestNeeded;
    protected boolean mInTransition;
    private Boolean mIntendedState;
    protected boolean mIsUserSwitching;

    public StateTracker()
    {
        mInTransition = false;
        mActualState = null;
        mIntendedState = null;
        mDeferredStateChangeRequestNeeded = false;
        mIsUserSwitching = false;
    }

    public abstract int getActualState(Context context);

    public abstract int getDisabledResource();

    public abstract int getEnabledResource();

    public abstract ImageView getImageButtonView();

    public abstract ImageView getIndicatorView();

    public int getInterMedateResource()
    {
        return -1;
    }

    public boolean getIsUserSwitching()
    {
        return mIsUserSwitching;
    }

    public ImageView getSwitchingGifView()
    {
        return null;
    }

    public abstract View getTileView();

    public final int getTriState(Context context)
    {
        if (mInTransition)
            return -1;
        switch (getActualState(context))
        {
        case 1: // '\001'
            return 1;

        case 0: // '\0'
            return 0;
        }
        return -1;
    }

    public boolean isClickable()
    {
        Xlog.i("StateTracker", (new StringBuilder()).append(this).append(" mIsUserSwitching is ").append(mIsUserSwitching).toString());
        return !mIsUserSwitching;
    }

    public final boolean isTurningOn()
    {
        return mIntendedState != null && mIntendedState.booleanValue();
    }

    public abstract void onActualStateChange(Context context, Intent intent);

    protected abstract void requestStateChange(Context context, boolean flag);

    public final void setCurrentState(Context context, int i)
    {
        Xlog.v("StateTracker", (new StringBuilder()).append("setCurrentState: newState is ").append(i).toString());
        boolean flag = mInTransition;
        switch (i)
        {
        case 3: // '\003'
            mInTransition = true;
            mActualState = Boolean.valueOf(true);
            break;

        case 2: // '\002'
            mInTransition = true;
            mActualState = Boolean.valueOf(false);
            break;

        case 1: // '\001'
            mInTransition = false;
            mActualState = Boolean.valueOf(true);
            break;

        case 0: // '\0'
            mInTransition = false;
            mActualState = Boolean.valueOf(false);
            break;
        }
        if (flag && !mInTransition && mDeferredStateChangeRequestNeeded)
        {
            Xlog.v("StateTracker", "processing deferred state change");
            if (mActualState != null && mIntendedState != null && mIntendedState.equals(mActualState))
                Xlog.v("StateTracker", "... but intended state matches, so no changes.");
            else
            if (mIntendedState != null)
            {
                mInTransition = true;
                requestStateChange(context, mIntendedState.booleanValue());
            }
            mDeferredStateChangeRequestNeeded = false;
        }
    }

    public void setImageViewResources(Context context)
    {
        Xlog.i("StateTracker", (new StringBuilder()).append(this).append("setImageViewResources state is ").append(getTriState(context)).toString());
        ImageView imageview = getIndicatorView();
        switch (getTriState(context))
        {
        default:
            break;

        case -1: 
            getTileView().setEnabled(false);
            ImageView imageview3 = getSwitchingGifView();
            if (getInterMedateResource() != -1 && imageview3 != null)
            {
                getImageButtonView().setVisibility(8);
                if (imageview != null)
                    imageview.setVisibility(8);
                if (imageview3 != null)
                {
                    imageview3.setVisibility(0);
                    imageview3.setImageResource(getInterMedateResource());
                    AnimationDrawable animationdrawable2 = (AnimationDrawable)imageview3.getDrawable();
                    if (animationdrawable2 != null && !animationdrawable2.isRunning())
                    {
                        animationdrawable2.start();
                        return;
                    }
                }
            }
            break;

        case 1: // '\001'
            mIsUserSwitching = false;
            getTileView().setEnabled(isClickable());
            getImageButtonView().setVisibility(0);
            getImageButtonView().setImageResource(getEnabledResource());
            if (imageview != null)
                imageview.setVisibility(0);
            ImageView imageview2 = getSwitchingGifView();
            if (imageview2 == null)
                break;
            imageview2.setVisibility(8);
            AnimationDrawable animationdrawable1 = (AnimationDrawable)imageview2.getDrawable();
            if (animationdrawable1 != null && animationdrawable1.isRunning())
            {
                animationdrawable1.stop();
                return;
            }
            break;

        case 0: // '\0'
            mIsUserSwitching = false;
            getTileView().setEnabled(isClickable());
            getImageButtonView().setVisibility(0);
            getImageButtonView().setImageResource(getDisabledResource());
            if (imageview != null)
                imageview.setVisibility(8);
            ImageView imageview1 = getSwitchingGifView();
            if (imageview1 == null)
                break;
            imageview1.setVisibility(8);
            AnimationDrawable animationdrawable = (AnimationDrawable)imageview1.getDrawable();
            if (animationdrawable != null && animationdrawable.isRunning())
            {
                animationdrawable.stop();
                return;
            }
            break;
        }
    }

    public void setIsUserSwitching(boolean flag)
    {
        mIsUserSwitching = flag;
    }

    public void toggleState(Context context)
    {
        Xlog.i("ClickEvent", "toggleState");
        mIsUserSwitching = true;
        getTileView().setEnabled(isClickable());
        int i = getTriState(context);
        boolean flag = false;
        switch (i)
        {
        default:
            break;

        case -1: 
            Boolean boolean1 = mIntendedState;
            flag = false;
            if (boolean1 == null)
                break;
            if (!mIntendedState.booleanValue())
                flag = true;
            else
                flag = false;
            break;

        case 0: // '\0'
            flag = true;
            break;

        case 1: // '\001'
            flag = false;
            break;
        }
        mIntendedState = Boolean.valueOf(flag);
        if (mInTransition)
        {
            mDeferredStateChangeRequestNeeded = true;
            return;
        } else
        {
            mInTransition = true;
            requestStateChange(context, flag);
            return;
        }
    }
}
