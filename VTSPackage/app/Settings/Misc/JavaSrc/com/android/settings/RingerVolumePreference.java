// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Dialog;
import android.content.*;
import android.media.AudioManager;
import android.net.Uri;
import android.os.*;
import android.preference.VolumePreference;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.SeekBar;

// Referenced classes of package com.android.settings:
//            Utils

public class RingerVolumePreference extends VolumePreference
{
    private static class SavedState extends android.preference.Preference.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        android.preference.VolumePreference.VolumeStore mVolumeStore[];

        android.preference.VolumePreference.VolumeStore[] getVolumeStore(int i)
        {
            if (mVolumeStore == null || mVolumeStore.length != i)
            {
                mVolumeStore = new android.preference.VolumePreference.VolumeStore[i];
                for (int j = 0; j < i; j++)
                    mVolumeStore[j] = new android.preference.VolumePreference.VolumeStore();

            }
            return mVolumeStore;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            for (int j = 0; j < RingerVolumePreference.SEEKBAR_ID.length; j++)
            {
                parcel.writeInt(mVolumeStore[j].volume);
                parcel.writeInt(mVolumeStore[j].originalVolume);
            }

        }


        public SavedState(Parcel parcel)
        {
            super(parcel);
            mVolumeStore = new android.preference.VolumePreference.VolumeStore[RingerVolumePreference.SEEKBAR_ID.length];
            for (int i = 0; i < RingerVolumePreference.SEEKBAR_ID.length; i++)
            {
                mVolumeStore[i] = new android.preference.VolumePreference.VolumeStore();
                mVolumeStore[i].volume = parcel.readInt();
                mVolumeStore[i].originalVolume = parcel.readInt();
            }

        }

        public SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    private static final int CHECKBOX_VIEW_ID[] = {
        0x7f0800f5, 0x7f0800f9, 0x7f0800fd, 0x7f0800ff
    };
    private static final int MSG_RINGER_MODE_CHANGED = 101;
    private static final int SEEKBAR_ID[] = {
        0x7f0800f6, 0x7f0800fa, 0x7f0800fe, 0x7f080100
    };
    private static final int SEEKBAR_MUTED_RES_ID[] = {
        0x10802a3, 0x10802a0, 0x108029d, 0x1080299
    };
    private static final int SEEKBAR_TYPE[] = {
        3, 2, 5, 4
    };
    private static final int SEEKBAR_UNMUTED_RES_ID[] = {
        0x10802a2, 0x108029f, 0x108029c, 0x1080298
    };
    private static final String TAG = "RingerVolumePreference";
    private AudioManager mAudioManager;
    private ImageView mCheckBoxes[];
    private Handler mHandler;
    private BroadcastReceiver mRingModeChangedReceiver;
    private android.preference.VolumePreference.SeekBarVolumizer mSeekBarVolumizer[];
    private SeekBar mSeekBars[];

    public RingerVolumePreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mCheckBoxes = new ImageView[SEEKBAR_MUTED_RES_ID.length];
        mSeekBars = new SeekBar[SEEKBAR_ID.length];
        mHandler = new Handler() {

            final RingerVolumePreference this$0;

            public void handleMessage(Message message)
            {
                updateSlidersAndMutedStates();
            }

            
            {
                this$0 = RingerVolumePreference.this;
                super();
            }
        }
;
        setStreamType(2);
        setDialogLayoutResource(0x7f040062);
        mSeekBarVolumizer = new android.preference.VolumePreference.SeekBarVolumizer[SEEKBAR_ID.length];
        mAudioManager = (AudioManager)context.getSystemService("audio");
    }

    private void cleanup()
    {
        for (int i = 0; i < SEEKBAR_ID.length; i++)
        {
            if (mSeekBarVolumizer[i] == null)
                continue;
            Dialog dialog = getDialog();
            if (dialog != null && dialog.isShowing())
                mSeekBarVolumizer[i].revertVolume();
            mSeekBarVolumizer[i].stop();
            mSeekBarVolumizer[i] = null;
        }

        if (mRingModeChangedReceiver != null)
        {
            getContext().unregisterReceiver(mRingModeChangedReceiver);
            mRingModeChangedReceiver = null;
        }
    }

    private Uri getMediaVolumeUri(Context context)
    {
        return Uri.parse((new StringBuilder()).append("android.resource://").append(context.getPackageName()).append("/").append(0x7f060000).toString());
    }

    private void updateSlidersAndMutedStates()
    {
        for (int i = 0; i < SEEKBAR_TYPE.length; i++)
        {
            int j = SEEKBAR_TYPE[i];
            boolean flag = mAudioManager.isStreamMute(j);
            if (mCheckBoxes[i] != null)
                if (j == 2 && mAudioManager.getRingerMode() == 1)
                {
                    mCheckBoxes[i].setImageResource(0x10802a1);
                } else
                {
                    ImageView imageview = mCheckBoxes[i];
                    int l;
                    if (flag)
                        l = SEEKBAR_MUTED_RES_ID[i];
                    else
                        l = SEEKBAR_UNMUTED_RES_ID[i];
                    imageview.setImageResource(l);
                }
            if (mSeekBars[i] == null)
                continue;
            int k = mAudioManager.getStreamVolume(j);
            mSeekBars[i].setProgress(k);
            if (j != mAudioManager.getMasterStreamType() && flag)
                mSeekBars[i].setEnabled(false);
            else
                mSeekBars[i].setEnabled(true);
        }

    }

    public void createActionButtons()
    {
        setPositiveButtonText(0x104000a);
        setNegativeButtonText(null);
    }

    public void onActivityStop()
    {
        super.onActivityStop();
        android.preference.VolumePreference.SeekBarVolumizer aseekbarvolumizer[] = mSeekBarVolumizer;
        int i = aseekbarvolumizer.length;
        for (int j = 0; j < i; j++)
        {
            android.preference.VolumePreference.SeekBarVolumizer seekbarvolumizer = aseekbarvolumizer[j];
            if (seekbarvolumizer != null)
                seekbarvolumizer.stopSample();
        }

    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
        for (int i = 0; i < SEEKBAR_ID.length; i++)
        {
            SeekBar seekbar = (SeekBar)view.findViewById(SEEKBAR_ID[i]);
            mSeekBars[i] = seekbar;
            if (SEEKBAR_TYPE[i] == 3)
                mSeekBarVolumizer[i] = new android.preference.VolumePreference.SeekBarVolumizer(this, getContext(), seekbar, SEEKBAR_TYPE[i], getMediaVolumeUri(getContext()));
            else
                mSeekBarVolumizer[i] = new android.preference.VolumePreference.SeekBarVolumizer(this, getContext(), seekbar, SEEKBAR_TYPE[i]);
        }

        for (int j = 0; j < mCheckBoxes.length; j++)
        {
            ImageView imageview = (ImageView)view.findViewById(CHECKBOX_VIEW_ID[j]);
            mCheckBoxes[j] = imageview;
        }

        updateSlidersAndMutedStates();
        if (mRingModeChangedReceiver == null)
        {
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.media.RINGER_MODE_CHANGED");
            mRingModeChangedReceiver = new BroadcastReceiver() {

                final RingerVolumePreference this$0;

                public void onReceive(Context context, Intent intent)
                {
                    if ("android.media.RINGER_MODE_CHANGED".equals(intent.getAction()))
                        mHandler.sendMessage(mHandler.obtainMessage(101, intent.getIntExtra("android.media.EXTRA_RINGER_MODE", -1), 0));
                }

            
            {
                this$0 = RingerVolumePreference.this;
                super();
            }
            }
;
            getContext().registerReceiver(mRingModeChangedReceiver, intentfilter);
        }
        int k;
        if (!Utils.isVoiceCapable(getContext()))
            k = 0x7f0800f7;
        else
            k = 0x7f0800fb;
        view.findViewById(k).setVisibility(8);
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (!flag)
        {
            android.preference.VolumePreference.SeekBarVolumizer aseekbarvolumizer[] = mSeekBarVolumizer;
            int i = aseekbarvolumizer.length;
            for (int j = 0; j < i; j++)
            {
                android.preference.VolumePreference.SeekBarVolumizer seekbarvolumizer = aseekbarvolumizer[j];
                if (seekbarvolumizer != null)
                    seekbarvolumizer.revertVolume();
            }

        }
        cleanup();
    }

    public boolean onKey(View view, int i, KeyEvent keyevent)
    {
        boolean flag = true;
        if (keyevent.getAction() == 0)
        {
            boolean _tmp = flag;
        }
        switch (i)
        {
        default:
            flag = false;
            // fall through

        case 24: // '\030'
        case 25: // '\031'
        case 164: 
            return flag;
        }
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        if (parcelable != null && parcelable.getClass().equals(com/android/settings/RingerVolumePreference$SavedState))
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            android.preference.VolumePreference.VolumeStore avolumestore[] = savedstate.getVolumeStore(SEEKBAR_ID.length);
            for (int i = 0; i < SEEKBAR_ID.length; i++)
            {
                android.preference.VolumePreference.SeekBarVolumizer seekbarvolumizer = mSeekBarVolumizer[i];
                if (seekbarvolumizer != null)
                    seekbarvolumizer.onRestoreInstanceState(avolumestore[i]);
            }

        } else
        {
            super.onRestoreInstanceState(parcelable);
        }
    }

    protected void onSampleStarting(android.preference.VolumePreference.SeekBarVolumizer seekbarvolumizer)
    {
        super.onSampleStarting(seekbarvolumizer);
        android.preference.VolumePreference.SeekBarVolumizer aseekbarvolumizer[] = mSeekBarVolumizer;
        int i = aseekbarvolumizer.length;
        for (int j = 0; j < i; j++)
        {
            android.preference.VolumePreference.SeekBarVolumizer seekbarvolumizer1 = aseekbarvolumizer[j];
            if (seekbarvolumizer1 != null && seekbarvolumizer1 != seekbarvolumizer)
                seekbarvolumizer1.stopSample();
        }

    }

    protected Parcelable onSaveInstanceState()
    {
        Parcelable parcelable = super.onSaveInstanceState();
        if (isPersistent())
            return parcelable;
        SavedState savedstate = new SavedState(parcelable);
        android.preference.VolumePreference.VolumeStore avolumestore[] = savedstate.getVolumeStore(SEEKBAR_ID.length);
        for (int i = 0; i < SEEKBAR_ID.length; i++)
        {
            android.preference.VolumePreference.SeekBarVolumizer seekbarvolumizer = mSeekBarVolumizer[i];
            if (seekbarvolumizer != null)
                seekbarvolumizer.onSaveInstanceState(avolumestore[i]);
        }

        return savedstate;
    }




}
