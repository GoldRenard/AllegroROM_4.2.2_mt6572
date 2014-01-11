// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.*;
import android.view.View;

public class ActivityOptions
{
    public static interface OnAnimationStartedListener
    {

        public abstract void onAnimationStarted();
    }


    public static final int ANIM_CUSTOM = 1;
    public static final int ANIM_NONE = 0;
    public static final int ANIM_SCALE_UP = 2;
    public static final int ANIM_THUMBNAIL_SCALE_DOWN = 4;
    public static final int ANIM_THUMBNAIL_SCALE_UP = 3;
    public static final String KEY_ANIM_ENTER_RES_ID = "android:animEnterRes";
    public static final String KEY_ANIM_EXIT_RES_ID = "android:animExitRes";
    public static final String KEY_ANIM_START_HEIGHT = "android:animStartHeight";
    public static final String KEY_ANIM_START_LISTENER = "android:animStartListener";
    public static final String KEY_ANIM_START_WIDTH = "android:animStartWidth";
    public static final String KEY_ANIM_START_X = "android:animStartX";
    public static final String KEY_ANIM_START_Y = "android:animStartY";
    public static final String KEY_ANIM_THUMBNAIL = "android:animThumbnail";
    public static final String KEY_ANIM_TYPE = "android:animType";
    public static final String KEY_PACKAGE_NAME = "android:packageName";
    private IRemoteCallback mAnimationStartedListener;
    private int mAnimationType;
    private int mCustomEnterResId;
    private int mCustomExitResId;
    private String mPackageName;
    private int mStartHeight;
    private int mStartWidth;
    private int mStartX;
    private int mStartY;
    private Bitmap mThumbnail;

    private ActivityOptions()
    {
        mAnimationType = 0;
    }

    public ActivityOptions(Bundle bundle)
    {
        mAnimationType = 0;
        mPackageName = bundle.getString("android:packageName");
        mAnimationType = bundle.getInt("android:animType");
        if (mAnimationType == 1)
        {
            mCustomEnterResId = bundle.getInt("android:animEnterRes", 0);
            mCustomExitResId = bundle.getInt("android:animExitRes", 0);
            mAnimationStartedListener = android.os.IRemoteCallback.Stub.asInterface(bundle.getIBinder("android:animStartListener"));
        } else
        {
            if (mAnimationType == 2)
            {
                mStartX = bundle.getInt("android:animStartX", 0);
                mStartY = bundle.getInt("android:animStartY", 0);
                mStartWidth = bundle.getInt("android:animStartWidth", 0);
                mStartHeight = bundle.getInt("android:animStartHeight", 0);
                return;
            }
            if (mAnimationType == 3 || mAnimationType == 4)
            {
                mThumbnail = (Bitmap)bundle.getParcelable("android:animThumbnail");
                mStartX = bundle.getInt("android:animStartX", 0);
                mStartY = bundle.getInt("android:animStartY", 0);
                mAnimationStartedListener = android.os.IRemoteCallback.Stub.asInterface(bundle.getIBinder("android:animStartListener"));
                return;
            }
        }
    }

    public static void abort(Bundle bundle)
    {
        if (bundle != null)
            (new ActivityOptions(bundle)).abort();
    }

    public static ActivityOptions makeCustomAnimation(Context context, int i, int j)
    {
        return makeCustomAnimation(context, i, j, null, null);
    }

    public static ActivityOptions makeCustomAnimation(Context context, int i, int j, Handler handler, OnAnimationStartedListener onanimationstartedlistener)
    {
        ActivityOptions activityoptions = new ActivityOptions();
        activityoptions.mPackageName = context.getPackageName();
        activityoptions.mAnimationType = 1;
        activityoptions.mCustomEnterResId = i;
        activityoptions.mCustomExitResId = j;
        activityoptions.setListener(handler, onanimationstartedlistener);
        return activityoptions;
    }

    public static ActivityOptions makeScaleUpAnimation(View view, int i, int j, int k, int l)
    {
        ActivityOptions activityoptions = new ActivityOptions();
        activityoptions.mPackageName = view.getContext().getPackageName();
        activityoptions.mAnimationType = 2;
        int ai[] = new int[2];
        view.getLocationOnScreen(ai);
        activityoptions.mStartX = i + ai[0];
        activityoptions.mStartY = j + ai[1];
        activityoptions.mStartWidth = k;
        activityoptions.mStartHeight = l;
        return activityoptions;
    }

    private static ActivityOptions makeThumbnailAnimation(View view, Bitmap bitmap, int i, int j, OnAnimationStartedListener onanimationstartedlistener, boolean flag)
    {
        ActivityOptions activityoptions = new ActivityOptions();
        activityoptions.mPackageName = view.getContext().getPackageName();
        int k;
        if (flag)
            k = 3;
        else
            k = 4;
        activityoptions.mAnimationType = k;
        activityoptions.mThumbnail = bitmap;
        int ai[] = new int[2];
        view.getLocationOnScreen(ai);
        activityoptions.mStartX = i + ai[0];
        activityoptions.mStartY = j + ai[1];
        activityoptions.setListener(view.getHandler(), onanimationstartedlistener);
        return activityoptions;
    }

    public static ActivityOptions makeThumbnailScaleDownAnimation(View view, Bitmap bitmap, int i, int j, OnAnimationStartedListener onanimationstartedlistener)
    {
        return makeThumbnailAnimation(view, bitmap, i, j, onanimationstartedlistener, false);
    }

    public static ActivityOptions makeThumbnailScaleUpAnimation(View view, Bitmap bitmap, int i, int j)
    {
        return makeThumbnailScaleUpAnimation(view, bitmap, i, j, null);
    }

    public static ActivityOptions makeThumbnailScaleUpAnimation(View view, Bitmap bitmap, int i, int j, OnAnimationStartedListener onanimationstartedlistener)
    {
        return makeThumbnailAnimation(view, bitmap, i, j, onanimationstartedlistener, true);
    }

    private void setListener(final Handler h, final OnAnimationStartedListener finalListener)
    {
        if (finalListener != null)
            mAnimationStartedListener = new android.os.IRemoteCallback.Stub() {

                final ActivityOptions this$0;
                final OnAnimationStartedListener val$finalListener;
                final Handler val$h;

                public void sendResult(Bundle bundle)
                    throws RemoteException
                {
                    h.post(new Runnable() {

                        final _cls1 this$1;

                        public void run()
                        {
                            finalListener.onAnimationStarted();
                        }

            
            {
                this$1 = _cls1.this;
                super();
            }
                    }
);
                }

            
            {
                this$0 = ActivityOptions.this;
                h = handler;
                finalListener = onanimationstartedlistener;
                super();
            }
            }
;
    }

    public void abort()
    {
        if (mAnimationStartedListener == null)
            break MISSING_BLOCK_LABEL_17;
        mAnimationStartedListener.sendResult(null);
        return;
        RemoteException remoteexception;
        remoteexception;
    }

    public int getAnimationType()
    {
        return mAnimationType;
    }

    public int getCustomEnterResId()
    {
        return mCustomEnterResId;
    }

    public int getCustomExitResId()
    {
        return mCustomExitResId;
    }

    public IRemoteCallback getOnAnimationStartListener()
    {
        return mAnimationStartedListener;
    }

    public String getPackageName()
    {
        return mPackageName;
    }

    public int getStartHeight()
    {
        return mStartHeight;
    }

    public int getStartWidth()
    {
        return mStartWidth;
    }

    public int getStartX()
    {
        return mStartX;
    }

    public int getStartY()
    {
        return mStartY;
    }

    public Bitmap getThumbnail()
    {
        return mThumbnail;
    }

    public Bundle toBundle()
    {
        Bundle bundle = new Bundle();
        if (mPackageName != null)
            bundle.putString("android:packageName", mPackageName);
        switch (mAnimationType)
        {
        case 3: // '\003'
        case 4: // '\004'
            bundle.putInt("android:animType", mAnimationType);
            bundle.putParcelable("android:animThumbnail", mThumbnail);
            bundle.putInt("android:animStartX", mStartX);
            bundle.putInt("android:animStartY", mStartY);
            IRemoteCallback iremotecallback1 = mAnimationStartedListener;
            android.os.IBinder ibinder1 = null;
            if (iremotecallback1 != null)
                ibinder1 = mAnimationStartedListener.asBinder();
            bundle.putIBinder("android:animStartListener", ibinder1);
            return bundle;

        case 2: // '\002'
            bundle.putInt("android:animType", mAnimationType);
            bundle.putInt("android:animStartX", mStartX);
            bundle.putInt("android:animStartY", mStartY);
            bundle.putInt("android:animStartWidth", mStartWidth);
            bundle.putInt("android:animStartHeight", mStartHeight);
            return bundle;

        case 1: // '\001'
            bundle.putInt("android:animType", mAnimationType);
            bundle.putInt("android:animEnterRes", mCustomEnterResId);
            bundle.putInt("android:animExitRes", mCustomExitResId);
            IRemoteCallback iremotecallback = mAnimationStartedListener;
            android.os.IBinder ibinder = null;
            if (iremotecallback != null)
                ibinder = mAnimationStartedListener.asBinder();
            bundle.putIBinder("android:animStartListener", ibinder);
            return bundle;
        }
        return bundle;
    }

    public void update(ActivityOptions activityoptions)
    {
        if (activityoptions.mPackageName != null)
            mPackageName = activityoptions.mPackageName;
        switch (activityoptions.mAnimationType)
        {
        default:
            return;

        case 1: // '\001'
            mAnimationType = activityoptions.mAnimationType;
            mCustomEnterResId = activityoptions.mCustomEnterResId;
            mCustomExitResId = activityoptions.mCustomExitResId;
            mThumbnail = null;
            RemoteException remoteexception;
            RemoteException remoteexception1;
            if (activityoptions.mAnimationStartedListener != null)
                try
                {
                    activityoptions.mAnimationStartedListener.sendResult(null);
                }
                catch (RemoteException remoteexception2) { }
            mAnimationStartedListener = activityoptions.mAnimationStartedListener;
            return;

        case 2: // '\002'
            mAnimationType = activityoptions.mAnimationType;
            mStartX = activityoptions.mStartX;
            mStartY = activityoptions.mStartY;
            mStartWidth = activityoptions.mStartWidth;
            mStartHeight = activityoptions.mStartHeight;
            if (activityoptions.mAnimationStartedListener != null)
                try
                {
                    activityoptions.mAnimationStartedListener.sendResult(null);
                }
                // Misplaced declaration of an exception variable
                catch (RemoteException remoteexception1) { }
            mAnimationStartedListener = null;
            return;

        case 3: // '\003'
        case 4: // '\004'
            mAnimationType = activityoptions.mAnimationType;
            mThumbnail = activityoptions.mThumbnail;
            mStartX = activityoptions.mStartX;
            mStartY = activityoptions.mStartY;
            break;
        }
        if (activityoptions.mAnimationStartedListener != null)
            try
            {
                activityoptions.mAnimationStartedListener.sendResult(null);
            }
            // Misplaced declaration of an exception variable
            catch (RemoteException remoteexception) { }
        mAnimationStartedListener = activityoptions.mAnimationStartedListener;
    }
}
