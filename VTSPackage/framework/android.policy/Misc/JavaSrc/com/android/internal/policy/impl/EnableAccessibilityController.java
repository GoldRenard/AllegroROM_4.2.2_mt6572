// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.content.res.Resources;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.os.*;
import android.speech.tts.TextToSpeech;
import android.util.MathUtils;
import android.view.IWindowManager;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.IAccessibilityManager;
import java.util.*;

public class EnableAccessibilityController
{

    private static final int ENABLE_ACCESSIBILITY_DELAY_MILLIS = 6000;
    public static final int MESSAGE_ENABLE_ACCESSIBILITY = 3;
    public static final int MESSAGE_SPEAK_ENABLE_CANCELED = 2;
    public static final int MESSAGE_SPEAK_WARNING = 1;
    private static final int SPEAK_WARNING_DELAY_MILLIS = 2000;
    private final IAccessibilityManager mAccessibilityManager = android.view.accessibility.IAccessibilityManager.Stub.asInterface(ServiceManager.getService("accessibility"));
    private boolean mCanceled;
    private final Context mContext;
    private boolean mDestroyed;
    private float mFirstPointerDownX;
    private float mFirstPointerDownY;
    private final Handler mHandler = new Handler() {

        final EnableAccessibilityController this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 3: // '\003'
                enableAccessibility();
                mTone.play();
                mTts.speak(mContext.getString(0x1040547), 0, null);
                return;

            case 2: // '\002'
                String s1 = mContext.getString(0x1040548);
                mTts.speak(s1, 0, null);
                return;

            case 1: // '\001'
                String s = mContext.getString(0x1040546);
                mTts.speak(s, 0, null);
                return;
            }
        }

            
            {
                this$0 = EnableAccessibilityController.this;
                super();
            }
    }
;
    private float mSecondPointerDownX;
    private float mSecondPointerDownY;
    private final Ringtone mTone;
    private final float mTouchSlop;
    private final TextToSpeech mTts;
    private final UserManager mUserManager;
    private final IWindowManager mWindowManager = android.view.IWindowManager.Stub.asInterface(ServiceManager.getService("window"));

    public EnableAccessibilityController(Context context)
    {
        mContext = context;
        mUserManager = (UserManager)mContext.getSystemService("user");
        mTts = new TextToSpeech(context, new android.speech.tts.TextToSpeech.OnInitListener() {

            final EnableAccessibilityController this$0;

            public void onInit(int i)
            {
                if (mDestroyed)
                    mTts.shutdown();
            }

            
            {
                this$0 = EnableAccessibilityController.this;
                super();
            }
        }
);
        mTone = RingtoneManager.getRingtone(context, android.provider.Settings.System.DEFAULT_NOTIFICATION_URI);
        mTone.setStreamType(3);
        mTouchSlop = context.getResources().getDimensionPixelSize(0x105006b);
    }

    public static boolean canEnableAccessibilityViaGesture(Context context)
    {
        boolean flag = true;
        AccessibilityManager accessibilitymanager = AccessibilityManager.getInstance(context);
        if (accessibilitymanager.isEnabled() && !accessibilitymanager.getEnabledAccessibilityServiceList(flag).isEmpty())
            return false;
        if (android.provider.Settings.Global.getInt(context.getContentResolver(), "enable_accessibility_global_gesture_enabled", 0) != flag || getInstalledSpeakingAccessibilityServices(context).isEmpty())
            flag = false;
        return flag;
    }

    private void cancel()
    {
        mCanceled = true;
        if (mHandler.hasMessages(1))
            mHandler.removeMessages(1);
        else
        if (mHandler.hasMessages(3))
            mHandler.sendEmptyMessage(2);
        mHandler.removeMessages(3);
    }

    private void enableAccessibility()
    {
        List list = getInstalledSpeakingAccessibilityServices(mContext);
        if (!list.isEmpty()) goto _L2; else goto _L1
_L1:
        return;
_L2:
        boolean flag3 = mWindowManager.isKeyguardLocked();
        boolean flag = flag3;
_L11:
        boolean flag2;
        ComponentName componentname;
        int k;
        boolean flag1;
        AccessibilityServiceInfo accessibilityserviceinfo;
        ServiceInfo serviceinfo;
        int i;
        String s;
        android.content.ContentResolver contentresolver;
        int j;
        AccessibilityServiceInfo accessibilityserviceinfo1;
        if (mUserManager.getUsers().size() > 1)
            flag1 = true;
        else
            flag1 = false;
        accessibilityserviceinfo = (AccessibilityServiceInfo)list.get(0);
        if ((4 & accessibilityserviceinfo.flags) != 0)
            flag2 = true;
        else
            flag2 = false;
        if (flag2) goto _L4; else goto _L3
_L3:
        j = list.size();
        k = 1;
_L9:
        if (k >= j) goto _L4; else goto _L5
_L5:
        accessibilityserviceinfo1 = (AccessibilityServiceInfo)list.get(k);
        if ((4 & accessibilityserviceinfo1.flags) == 0) goto _L7; else goto _L6
_L6:
        flag2 = true;
        accessibilityserviceinfo = accessibilityserviceinfo1;
_L4:
        serviceinfo = accessibilityserviceinfo.getResolveInfo().serviceInfo;
        componentname = new ComponentName(serviceinfo.packageName, serviceinfo.name);
        if (!flag || !flag1)
        {
            i = ActivityManager.getCurrentUser();
            s = componentname.flattenToString();
            contentresolver = mContext.getContentResolver();
            android.provider.Settings.Secure.putStringForUser(contentresolver, "enabled_accessibility_services", s, i);
            android.provider.Settings.Secure.putStringForUser(contentresolver, "touch_exploration_granted_accessibility_services", s, i);
            if (flag2)
                android.provider.Settings.Secure.putIntForUser(contentresolver, "touch_exploration_enabled", 1, i);
            android.provider.Settings.Secure.putIntForUser(contentresolver, "accessibility_script_injection", 1, i);
            android.provider.Settings.Secure.putIntForUser(contentresolver, "accessibility_enabled", 1, i);
            return;
        }
        break; /* Loop/switch isn't completed */
_L7:
        k++;
        if (true) goto _L9; else goto _L8
_L8:
        if (!flag) goto _L1; else goto _L10
_L10:
        try
        {
            mAccessibilityManager.temporaryEnableAccessibilityStateUntilKeyguardRemoved(componentname, flag2);
            return;
        }
        catch (RemoteException remoteexception1)
        {
            return;
        }
        RemoteException remoteexception;
        remoteexception;
        flag = false;
          goto _L11
    }

    private static List getInstalledSpeakingAccessibilityServices(Context context)
    {
        ArrayList arraylist = new ArrayList();
        arraylist.addAll(AccessibilityManager.getInstance(context).getInstalledAccessibilityServiceList());
        Iterator iterator = arraylist.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if ((1 & ((AccessibilityServiceInfo)iterator.next()).feedbackType) == 0)
                iterator.remove();
        } while (true);
        return arraylist;
    }

    public void onDestroy()
    {
        mDestroyed = true;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (motionevent.getActionMasked() == 5 && motionevent.getPointerCount() == 2)
        {
            mFirstPointerDownX = motionevent.getX(0);
            mFirstPointerDownY = motionevent.getY(0);
            mSecondPointerDownX = motionevent.getX(1);
            mSecondPointerDownY = motionevent.getY(1);
            mHandler.sendEmptyMessageDelayed(1, 2000L);
            mHandler.sendEmptyMessageDelayed(3, 6000L);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
label0:
        {
            int i = motionevent.getPointerCount();
            int j = motionevent.getActionMasked();
            if (mCanceled)
            {
                if (j == 1)
                    mCanceled = false;
            } else
            {
                switch (j)
                {
                case 4: // '\004'
                default:
                    break label0;

                case 3: // '\003'
                case 6: // '\006'
                    cancel();
                    return true;

                case 5: // '\005'
                    if (i > 2)
                    {
                        cancel();
                        return true;
                    }
                    break;

                case 2: // '\002'
                    if (Math.abs(MathUtils.dist(motionevent.getX(0), motionevent.getY(0), mFirstPointerDownX, mFirstPointerDownY)) > mTouchSlop)
                        cancel();
                    if (Math.abs(MathUtils.dist(motionevent.getX(1), motionevent.getY(1), mSecondPointerDownX, mSecondPointerDownY)) > mTouchSlop)
                    {
                        cancel();
                        return true;
                    }
                    break;
                }
            }
            return true;
        }
        return true;
    }





}
