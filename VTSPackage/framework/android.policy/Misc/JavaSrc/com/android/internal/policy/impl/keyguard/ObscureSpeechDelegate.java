// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.ContentResolver;
import android.content.Context;
import android.media.AudioManager;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.List;

class ObscureSpeechDelegate extends android.view.View.AccessibilityDelegate
{

    static boolean sAnnouncedHeadset = false;
    private final AudioManager mAudioManager;
    private final ContentResolver mContentResolver;

    public ObscureSpeechDelegate(Context context)
    {
        mContentResolver = context.getContentResolver();
        mAudioManager = (AudioManager)context.getSystemService("audio");
    }

    private boolean shouldObscureSpeech()
    {
        return android.provider.Settings.Secure.getInt(mContentResolver, "speak_password", 0) == 0 && !mAudioManager.isWiredHeadsetOn() && !mAudioManager.isBluetoothA2dpOn();
    }

    public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(view, accessibilitynodeinfo);
        if (shouldObscureSpeech())
        {
            Context context = view.getContext();
            accessibilitynodeinfo.setText(null);
            accessibilitynodeinfo.setContentDescription(context.getString(0x10404e1));
        }
    }

    public void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        super.onPopulateAccessibilityEvent(view, accessibilityevent);
        if (accessibilityevent.getEventType() != 16384 && shouldObscureSpeech())
        {
            accessibilityevent.getText().clear();
            accessibilityevent.setContentDescription(view.getContext().getString(0x10404e1));
        }
    }

    public void sendAccessibilityEvent(View view, int i)
    {
        super.sendAccessibilityEvent(view, i);
        if (i == 32768 && !sAnnouncedHeadset && shouldObscureSpeech())
        {
            sAnnouncedHeadset = true;
            view.announceForAccessibility(view.getContext().getString(0x10404e0));
        }
    }

}
