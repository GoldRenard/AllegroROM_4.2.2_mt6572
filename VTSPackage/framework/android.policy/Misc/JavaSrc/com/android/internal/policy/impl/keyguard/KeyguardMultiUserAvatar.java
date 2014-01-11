// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.content.Context;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.widget.*;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardHostView, KeyguardCircleFramedDrawable, KeyguardLinearLayout, KeyguardMultiUserSelectorView

class KeyguardMultiUserAvatar extends FrameLayout
{

    private static final float ACTIVE_ALPHA = 1F;
    private static final float ACTIVE_SCALE = 1.5F;
    private static final float ACTIVE_TEXT_ALPHA = 0F;
    private static final boolean DEBUG = false;
    private static final float INACTIVE_ALPHA = 1F;
    private static final float INACTIVE_TEXT_ALPHA = 0.5F;
    private static final int SWITCH_ANIMATION_DURATION = 150;
    private static final String TAG = com/android/internal/policy/impl/keyguard/KeyguardMultiUserAvatar.getSimpleName();
    private boolean mActive;
    private final float mActiveAlpha;
    private final float mActiveScale;
    private final float mActiveTextAlpha;
    private final int mFrameColor;
    private final int mFrameShadowColor;
    private KeyguardCircleFramedDrawable mFramed;
    private final int mHighlightColor;
    private final float mIconSize;
    private final float mInactiveAlpha;
    private final float mInactiveTextAlpha;
    private boolean mInit;
    private final float mShadowRadius;
    private final float mStroke;
    private final int mTextColor;
    private boolean mTouched;
    private ImageView mUserImage;
    private UserInfo mUserInfo;
    private TextView mUserName;
    private KeyguardMultiUserSelectorView mUserSelector;

    public KeyguardMultiUserAvatar(Context context)
    {
        this(context, null, 0);
    }

    public KeyguardMultiUserAvatar(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardMultiUserAvatar(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mInit = true;
        Resources resources = mContext.getResources();
        mTextColor = resources.getColor(0x1060069);
        mIconSize = resources.getDimension(0x1050072);
        mStroke = resources.getDimension(0x1050070);
        mShadowRadius = resources.getDimension(0x1050071);
        mFrameColor = resources.getColor(0x1060067);
        mFrameShadowColor = resources.getColor(0x1060068);
        mHighlightColor = resources.getColor(0x106006a);
        mActiveTextAlpha = 0.0F;
        mInactiveTextAlpha = 0.5F;
        mActiveScale = 1.5F;
        mActiveAlpha = 1.0F;
        mInactiveAlpha = 1.0F;
        mTouched = false;
        setLayerType(1, null);
    }

    public static KeyguardMultiUserAvatar fromXml(int i, Context context, KeyguardMultiUserSelectorView keyguardmultiuserselectorview, UserInfo userinfo)
    {
        KeyguardMultiUserAvatar keyguardmultiuseravatar = (KeyguardMultiUserAvatar)LayoutInflater.from(context).inflate(i, keyguardmultiuserselectorview, false);
        keyguardmultiuseravatar.init(userinfo, keyguardmultiuserselectorview);
        return keyguardmultiuseravatar;
    }

    public UserInfo getUserInfo()
    {
        return mUserInfo;
    }

    public void init(UserInfo userinfo, KeyguardMultiUserSelectorView keyguardmultiuserselectorview)
    {
        mUserInfo = userinfo;
        mUserSelector = keyguardmultiuserselectorview;
        mUserImage = (ImageView)findViewById(0x10202bb);
        mUserName = (TextView)findViewById(0x10202bc);
        android.graphics.Bitmap bitmap1 = BitmapFactory.decodeFile(rewriteIconPath(userinfo.iconPath));
        android.graphics.Bitmap bitmap = bitmap1;
_L2:
        if (bitmap == null)
            bitmap = BitmapFactory.decodeResource(mContext.getResources(), 0x10802bf);
        mFramed = new KeyguardCircleFramedDrawable(bitmap, (int)mIconSize, mFrameColor, mStroke, mFrameShadowColor, mShadowRadius, mHighlightColor);
        mUserImage.setImageDrawable(mFramed);
        mUserName.setText(mUserInfo.name);
        setOnClickListener(mUserSelector);
        mInit = false;
        return;
        Exception exception;
        exception;
        boolean flag = DEBUG;
        bitmap = null;
        if (flag)
        {
            Log.d(TAG, (new StringBuilder()).append("failed to open profile icon ").append(userinfo.iconPath).toString(), exception);
            bitmap = null;
        }
        if (true) goto _L2; else goto _L1
_L1:
    }

    protected String rewriteIconPath(String s)
    {
        if (!getClass().getName().contains("internal"))
            s = s.replace("system", "data");
        return s;
    }

    public void setActive(boolean flag, boolean flag1, Runnable runnable)
    {
        if (mActive != flag || mInit)
        {
            mActive = flag;
            if (flag)
            {
                ((KeyguardLinearLayout)getParent()).setTopChild(this);
                setContentDescription((new StringBuilder()).append(mUserName.getText()).append(". ").append(mContext.getString(0x1040549, new Object[] {
                    ""
                })).toString());
            } else
            {
                setContentDescription(mUserName.getText());
            }
        }
        updateVisualsForActive(mActive, flag1, 150, runnable);
    }

    public void setPressed(boolean flag)
    {
        if (!flag || isClickable())
        {
            super.setPressed(flag);
            mFramed.setPressed(flag);
            mUserImage.invalidate();
        }
    }

    void updateVisualsForActive(boolean flag, boolean flag1, int i, final Runnable onComplete)
    {
        final float finalScale = 1.0F;
        final float finalAlpha;
        if (flag)
            finalAlpha = mActiveAlpha;
        else
            finalAlpha = mInactiveAlpha;
        final float initAlpha;
        if (flag)
            initAlpha = mInactiveAlpha;
        else
            initAlpha = mActiveAlpha;
        if (!flag)
            finalScale /= mActiveScale;
        final float initScale = mFramed.getScale();
        final int finalTextAlpha;
        if (flag)
            finalTextAlpha = (int)(255F * mActiveTextAlpha);
        else
            finalTextAlpha = (int)(255F * mInactiveTextAlpha);
        final int initTextAlpha;
        if (flag)
            initTextAlpha = (int)(255F * mInactiveTextAlpha);
        else
            initTextAlpha = (int)(255F * mActiveTextAlpha);
        int j = mTextColor;
        mUserName.setTextColor(j);
        if (flag1 && mTouched)
        {
            ValueAnimator valueanimator = ValueAnimator.ofFloat(new float[] {
                0.0F, 1.0F
            });
            valueanimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {

                final KeyguardMultiUserAvatar this$0;
                final float val$finalAlpha;
                final float val$finalScale;
                final int val$finalTextAlpha;
                final float val$initAlpha;
                final float val$initScale;
                final int val$initTextAlpha;

                public void onAnimationUpdate(ValueAnimator valueanimator1)
                {
                    float f = valueanimator1.getAnimatedFraction();
                    float f1 = (1.0F - f) * initScale + f * finalScale;
                    float f2 = (1.0F - f) * initAlpha + f * finalAlpha;
                    int k = (int)((1.0F - f) * (float)initTextAlpha + f * (float)finalTextAlpha);
                    mFramed.setScale(f1);
                    mUserImage.setAlpha(f2);
                    mUserName.setTextColor(Color.argb(k, 255, 255, 255));
                    mUserImage.invalidate();
                }

            
            {
                this$0 = KeyguardMultiUserAvatar.this;
                initScale = f;
                finalScale = f1;
                initAlpha = f2;
                finalAlpha = f3;
                initTextAlpha = i;
                finalTextAlpha = j;
                super();
            }
            }
);
            valueanimator.addListener(new AnimatorListenerAdapter() {

                final KeyguardMultiUserAvatar this$0;
                final Runnable val$onComplete;

                public void onAnimationEnd(Animator animator)
                {
                    if (onComplete != null)
                        onComplete.run();
                }

            
            {
                this$0 = KeyguardMultiUserAvatar.this;
                onComplete = runnable;
                super();
            }
            }
);
            valueanimator.setDuration(i);
            valueanimator.start();
        } else
        {
            mFramed.setScale(finalScale);
            mUserImage.setAlpha(finalAlpha);
            mUserName.setTextColor(Color.argb(finalTextAlpha, 255, 255, 255));
            if (onComplete != null)
                post(onComplete);
        }
        mTouched = true;
    }

    static 
    {
        DEBUG = KeyguardHostView.DEBUG;
    }



}
