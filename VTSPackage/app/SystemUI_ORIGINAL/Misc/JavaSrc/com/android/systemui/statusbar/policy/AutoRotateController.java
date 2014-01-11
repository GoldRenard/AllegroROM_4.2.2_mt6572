// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.widget.CompoundButton;
import com.android.internal.view.RotationPolicy;

public final class AutoRotateController
    implements android.widget.CompoundButton.OnCheckedChangeListener
{
    public static interface RotationLockCallbacks
    {

        public abstract void setRotationLockControlVisibility(boolean flag);
    }


    private boolean mAutoRotation;
    private final RotationLockCallbacks mCallbacks;
    private final CompoundButton mCheckbox;
    private final Context mContext;
    private final com.android.internal.view.RotationPolicy.RotationPolicyListener mRotationPolicyListener = new com.android.internal.view.RotationPolicy.RotationPolicyListener() {

        final AutoRotateController this$0;

        public void onChange()
        {
            updateState();
        }

            
            {
                this$0 = AutoRotateController.this;
                super();
            }
    }
;

    public AutoRotateController(Context context, CompoundButton compoundbutton, RotationLockCallbacks rotationlockcallbacks)
    {
        mContext = context;
        mCheckbox = compoundbutton;
        mCallbacks = rotationlockcallbacks;
        mCheckbox.setOnCheckedChangeListener(this);
        RotationPolicy.registerRotationPolicyListener(context, mRotationPolicyListener, -1);
        updateState();
    }

    private void updateState()
    {
        boolean flag;
        if (!RotationPolicy.isRotationLocked(mContext))
            flag = true;
        else
            flag = false;
        mAutoRotation = flag;
        mCheckbox.setChecked(mAutoRotation);
        boolean flag1 = RotationPolicy.isRotationLockToggleVisible(mContext);
        mCallbacks.setRotationLockControlVisibility(flag1);
        mCheckbox.setEnabled(flag1);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        if (flag != mAutoRotation)
        {
            mAutoRotation = flag;
            Context context = mContext;
            boolean flag1;
            if (!flag)
                flag1 = true;
            else
                flag1 = false;
            RotationPolicy.setRotationLock(context, flag1);
        }
    }

    public void release()
    {
        RotationPolicy.unregisterRotationPolicyListener(mContext, mRotationPolicyListener);
    }

}
