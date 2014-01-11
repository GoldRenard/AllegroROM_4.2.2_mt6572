// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.preference.Preference;
import com.android.internal.telephony.CommandException;

public interface TimeConsumingPreferenceListener
{

    public abstract void onError(Preference preference, int i);

    public abstract void onException(Preference preference, CommandException commandexception);

    public abstract void onFinished(Preference preference, boolean flag);

    public abstract void onStarted(Preference preference, boolean flag);

    public abstract void onUpdate(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag);
}
