// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;


public interface IInCallControlState
{

    public abstract boolean canAddCall();

    public abstract boolean canEndCall();

    public abstract boolean canHold();

    public abstract boolean canMerge();

    public abstract boolean canMute();

    public abstract boolean canShowSwap();

    public abstract boolean canSwap();

    public abstract boolean isBluetoothEnabled();

    public abstract boolean isBluetoothIndicatorOn();

    public abstract boolean isContactsEnabled();

    public abstract boolean isDialpadEnabled();

    public abstract boolean isDialpadVisible();

    public abstract boolean isManageConferenceEnabled();

    public abstract boolean isManageConferenceVisible();

    public abstract boolean isMuteIndicatorOn();

    public abstract boolean isSpeakerEnabled();

    public abstract boolean isSpeakerOn();

    public abstract boolean onHold();

    public abstract boolean supportsHold();
}
