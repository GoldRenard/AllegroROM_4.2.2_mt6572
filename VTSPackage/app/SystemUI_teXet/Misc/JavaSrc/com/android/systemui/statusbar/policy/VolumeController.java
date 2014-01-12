// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.media.AudioManager;
import android.os.Vibrator;

// Referenced classes of package com.android.systemui.statusbar.policy:
//            ToggleSlider

public class VolumeController
    implements ToggleSlider.Listener
{

    private static final int STREAM = 5;
    private static final String TAG = "StatusBar.VolumeController";
    private AudioManager mAudioManager;
    private Context mContext;
    private ToggleSlider mControl;
    private final boolean mHasVibrator;
    private boolean mMute;
    private int mVolume;

    public VolumeController(Context context, ToggleSlider toggleslider)
    {
        mContext = context;
        mControl = toggleslider;
        Vibrator vibrator = (Vibrator)context.getSystemService("vibrator");
        boolean flag;
        if (vibrator == null)
            flag = false;
        else
            flag = vibrator.hasVibrator();
        mHasVibrator = flag;
        mAudioManager = (AudioManager)context.getSystemService("audio");
        int i = mAudioManager.getRingerMode();
        boolean flag1 = false;
        if (i != 2)
            flag1 = true;
        mMute = flag1;
        mVolume = mAudioManager.getStreamVolume(5);
        toggleslider.setOnChangedListener(this);
    }

    public void onChanged(ToggleSlider toggleslider, boolean flag, boolean flag1, int i)
    {
label0:
        {
            if (!flag)
            {
                if (!flag1)
                    break label0;
                AudioManager audiomanager = mAudioManager;
                int j;
                if (mHasVibrator)
                    j = 1;
                else
                    j = 0;
                audiomanager.setRingerMode(j);
            }
            return;
        }
        mAudioManager.setRingerMode(2);
        mAudioManager.setStreamVolume(5, i, 4);
    }

    public void onInit(ToggleSlider toggleslider)
    {
        toggleslider.setMax(mAudioManager.getStreamMaxVolume(5));
        toggleslider.setValue(mVolume);
        toggleslider.setChecked(mMute);
    }
}
