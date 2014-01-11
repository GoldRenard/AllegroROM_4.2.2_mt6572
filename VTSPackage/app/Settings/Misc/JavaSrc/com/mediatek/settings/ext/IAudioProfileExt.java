// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.Intent;
import android.media.AudioManager;
import android.view.View;

public interface IAudioProfileExt
{

    public abstract View createView(int i);

    public abstract View getPrefImageView(int i);

    public abstract View getPrefRadioButton(int i);

    public abstract View getPreferenceSummary(int i);

    public abstract View getPreferenceTitle(int i);

    public abstract boolean isPrefEditable();

    public abstract void setRingerVolume(AudioManager audiomanager, int i);

    public abstract void setRingtonePickerParams(Intent intent);

    public abstract void setVolume(AudioManager audiomanager, int i, int j);
}
