// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.ActivityManagerNative;
import android.app.IActivityManager;
import android.content.Context;
import android.content.pm.UserInfo;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.FrameLayout;
import java.util.*;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardMultiUserAvatar, KeyguardUpdateMonitor

public class KeyguardMultiUserSelectorView extends FrameLayout
    implements android.view.View.OnClickListener
{

    private static final int FADE_OUT_ANIMATION_DURATION = 100;
    private static final String TAG = "KeyguardMultiUserSelectorView";
    private KeyguardMultiUserAvatar mActiveUserAvatar;
    private KeyguardHostView.UserSwitcherCallback mCallback;
    Comparator mOrderAddedComparator = new Comparator() {

        final KeyguardMultiUserSelectorView this$0;

        public int compare(UserInfo userinfo, UserInfo userinfo1)
        {
            return userinfo.serialNumber - userinfo1.serialNumber;
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((UserInfo)obj, (UserInfo)obj1);
        }

            
            {
                this$0 = KeyguardMultiUserSelectorView.this;
                super();
            }
    }
;
    private ViewGroup mUsersGrid;

    public KeyguardMultiUserSelectorView(Context context)
    {
        this(context, null, 0);
    }

    public KeyguardMultiUserSelectorView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardMultiUserSelectorView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    private KeyguardMultiUserAvatar createAndAddUser(UserInfo userinfo)
    {
        KeyguardMultiUserAvatar keyguardmultiuseravatar = KeyguardMultiUserAvatar.fromXml(0x109005b, mContext, this, userinfo);
        mUsersGrid.addView(keyguardmultiuseravatar);
        return keyguardmultiuseravatar;
    }

    private void setAllClickable(boolean flag)
    {
        for (int i = 0; i < mUsersGrid.getChildCount(); i++)
        {
            View view = mUsersGrid.getChildAt(i);
            view.setClickable(flag);
            view.setPressed(false);
        }

    }

    public void addUsers(Collection collection)
    {
        UserInfo userinfo2 = ActivityManagerNative.getDefault().getCurrentUser();
        UserInfo userinfo = userinfo2;
_L1:
        ArrayList arraylist = new ArrayList(collection);
        Collections.sort(arraylist, mOrderAddedComparator);
        for (Iterator iterator = arraylist.iterator(); iterator.hasNext();)
        {
            UserInfo userinfo1 = (UserInfo)iterator.next();
            KeyguardMultiUserAvatar keyguardmultiuseravatar = createAndAddUser(userinfo1);
            RemoteException remoteexception;
            if (userinfo1.id == userinfo.id)
            {
                mActiveUserAvatar = keyguardmultiuseravatar;
                mActiveUserAvatar.setActive(true, false, null);
            } else
            {
                keyguardmultiuseravatar.setActive(false, false, null);
            }
        }

        break MISSING_BLOCK_LABEL_117;
        remoteexception;
        userinfo = null;
          goto _L1
    }

    public void onClick(View view)
    {
        if (view instanceof KeyguardMultiUserAvatar)
        {
            final KeyguardMultiUserAvatar avatar = (KeyguardMultiUserAvatar)view;
            if (avatar.isClickable())
                if (mActiveUserAvatar == avatar)
                {
                    mCallback.showUnlockHint();
                    return;
                } else
                {
                    mCallback.hideSecurityView(100);
                    setAllClickable(false);
                    mActiveUserAvatar.setActive(false, true, new Runnable() {

                        final KeyguardMultiUserSelectorView this$0;
                        final KeyguardMultiUserAvatar val$avatar;

                        public void run()
                        {
                            mActiveUserAvatar = avatar;
                            mActiveUserAvatar.setActive(true, true, new Runnable() {

                                final _cls2 this$1;

                                public void run()
                                {
                                    if (getClass().getName().contains("internal"))
                                    {
                                        try
                                        {
                                            ActivityManagerNative.getDefault().switchUser(avatar.getUserInfo().id);
                                            return;
                                        }
                                        catch (RemoteException remoteexception)
                                        {
                                            Log.e("KeyguardMultiUserSelectorView", (new StringBuilder()).append("Couldn't switch user ").append(remoteexception).toString());
                                        }
                                        return;
                                    } else
                                    {
                                        setAllClickable(true);
                                        return;
                                    }
                                }

            
            {
                this$1 = _cls2.this;
                super();
            }
                            }
);
                        }

            
            {
                this$0 = KeyguardMultiUserSelectorView.this;
                avatar = keyguardmultiuseravatar;
                super();
            }
                    }
);
                    return;
                }
        }
    }

    protected void onFinishInflate()
    {
        int i = 0x10202be;
        if (KeyguardUpdateMonitor.isAlarmBoot())
            i = 0x2100026;
        mUsersGrid = (ViewGroup)findViewById(i);
        mUsersGrid.removeAllViews();
        setClipChildren(false);
        setClipToPadding(false);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (motionevent.getActionMasked() != 3 && mCallback != null)
            mCallback.userActivity();
        return false;
    }

    public void setCallback(KeyguardHostView.UserSwitcherCallback userswitchercallback)
    {
        mCallback = userswitchercallback;
    }



/*
    static KeyguardMultiUserAvatar access$002(KeyguardMultiUserSelectorView keyguardmultiuserselectorview, KeyguardMultiUserAvatar keyguardmultiuseravatar)
    {
        keyguardmultiuserselectorview.mActiveUserAvatar = keyguardmultiuseravatar;
        return keyguardmultiuseravatar;
    }

*/

}
