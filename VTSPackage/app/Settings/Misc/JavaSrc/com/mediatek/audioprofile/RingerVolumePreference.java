// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.audioprofile;

import android.content.*;
import android.media.*;
import android.net.Uri;
import android.os.*;
import android.preference.SeekBarDialogPreference;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.SeekBar;
import com.android.settings.Utils;
import com.mediatek.common.audioprofile.AudioProfileListener;
import com.mediatek.settings.ext.IAudioProfileExt;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.audioprofile:
//            AudioProfileManager

public class RingerVolumePreference extends SeekBarDialogPreference
    implements android.view.View.OnKeyListener
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
        VolumeStore mVolumeStore[];

        VolumeStore[] getVolumeStore(int i)
        {
            if (mVolumeStore == null || mVolumeStore.length != i)
            {
                mVolumeStore = new VolumeStore[i];
                for (int j = 0; j < i; j++)
                    mVolumeStore[j] = new VolumeStore();

            }
            return mVolumeStore;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            for (int j = 0; j < RingerVolumePreference.SEEKBAR_ID.length; j++)
            {
                parcel.writeInt(mVolumeStore[j].mVolume);
                parcel.writeInt(mVolumeStore[j].mOriginalVolume);
                parcel.writeInt(mVolumeStore[j].mSystemVolume);
            }

        }


        public SavedState(Parcel parcel)
        {
            super(parcel);
            mVolumeStore = new VolumeStore[RingerVolumePreference.SEEKBAR_ID.length];
            for (int i = 0; i < RingerVolumePreference.SEEKBAR_ID.length; i++)
            {
                mVolumeStore[i] = new VolumeStore();
                mVolumeStore[i].mVolume = parcel.readInt();
                mVolumeStore[i].mOriginalVolume = parcel.readInt();
                mVolumeStore[i].mSystemVolume = parcel.readInt();
            }

        }

        public SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }

    public class SeekBarVolumizer
        implements android.widget.SeekBar.OnSeekBarChangeListener, Runnable
    {

        private Context mContext;
        private Uri mDefaultUri;
        private Handler mHandler;
        private boolean mIsVisible;
        private int mLastProgress;
        private int mOriginalVolume;
        public boolean mProfileIsActive;
        public Ringtone mRingtone;
        private final SeekBar mSeekBar;
        private final int mStreamType;
        public int mSystemVolume;
        final RingerVolumePreference this$0;

        private void initSeekBar(SeekBar seekbar)
        {
            seekbar.setMax(mProfileManager.getStreamMaxVolume(mStreamType));
            mSystemVolume = mAudioManager.getStreamVolume(mStreamType);
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" get Original SYSTEM Volume: ").append(mSystemVolume).toString());
            mOriginalVolume = mProfileManager.getStreamVolume(mKey, mStreamType);
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" get Original Volume: ").append(mOriginalVolume).toString());
            mProfileIsActive = mProfileManager.isActive(mKey);
            if (mProfileIsActive && mSystemVolume != mOriginalVolume)
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append(" sync ").append(mStreamType).append(" original Volume to").append(mSystemVolume).toString());
                mOriginalVolume = mSystemVolume;
            }
            mLastProgress = mOriginalVolume;
            seekbar.setProgress(mLastProgress);
            seekbar.setOnSeekBarChangeListener(this);
            if (mStreamType == 2)
                mDefaultUri = mProfileManager.getRingtoneUri(mKey, 1);
            else
            if (mStreamType == 5)
                mDefaultUri = mProfileManager.getRingtoneUri(mKey, 2);
            else
            if (mStreamType == 4)
                mDefaultUri = android.provider.Settings.System.DEFAULT_ALARM_ALERT_URI;
            mRingtone = RingtoneManager.getRingtone(mContext, mDefaultUri);
            if (mRingtone != null)
                mRingtone.setStreamType(mStreamType);
        }

        private boolean isSilentProfileActive()
        {
            return mAudioManager.getRingerMode() != 2;
        }

        private void sample()
        {
            onSampleStarting(this);
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("sample, set system Volume ").append(mLastProgress).toString());
            if (!isSilentProfileActive())
                setVolume(mStreamType, mLastProgress, true);
            if (mRingtone != null)
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append("stream type ").append(mStreamType).append(" play sample").toString());
                mRingtone.play();
            }
        }

        private void setVolume(int i, int j, boolean flag)
        {
            if (i == 2)
                if (flag)
                {
                    mAudioManager.setAudioProfileStreamVolume(mStreamType, j, 0);
                    mAudioManager.setAudioProfileStreamVolume(5, j, 0);
                    return;
                } else
                {
                    mExt.setRingerVolume(mAudioManager, j);
                    return;
                }
            if (flag)
            {
                mAudioManager.setAudioProfileStreamVolume(i, j, 0);
                return;
            } else
            {
                mExt.setVolume(mAudioManager, i, j);
                return;
            }
        }

        public void changeVolumeBy(int i)
        {
            mSeekBar.incrementProgressBy(i);
            postSetVolume(mSeekBar.getProgress());
        }

        public SeekBar getSeekBar()
        {
            return mSeekBar;
        }

        public boolean getVisible()
        {
            return mIsVisible;
        }

        public boolean isPlaying()
        {
            if (mRingtone != null)
                return mRingtone.isPlaying();
            else
                return false;
        }

        public void onProgressChanged(SeekBar seekbar, int i, boolean flag)
        {
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("onProgressChanged: progress").append(i).append(" : fromTouch").append(flag).toString());
            mLastProgress = i;
            if (!flag)
            {
                return;
            } else
            {
                postSetVolume(i);
                return;
            }
        }

        public void onRestoreInstanceState(VolumeStore volumestore)
        {
            if (volumestore.mVolume != -1)
            {
                mLastProgress = volumestore.mVolume;
                mOriginalVolume = volumestore.mOriginalVolume;
                mSystemVolume = volumestore.mSystemVolume;
                postSetVolume(mLastProgress);
            }
        }

        public void onSaveInstanceState(VolumeStore volumestore)
        {
            if (mLastProgress >= 0)
            {
                volumestore.mVolume = mLastProgress;
                volumestore.mOriginalVolume = mOriginalVolume;
                volumestore.mSystemVolume = mSystemVolume;
            }
        }

        public void onStartTrackingTouch(SeekBar seekbar)
        {
        }

        public void onStopTrackingTouch(SeekBar seekbar)
        {
            if (mRingtone != null && !mRingtone.isPlaying())
                sample();
        }

        void postSetVolume(int i)
        {
            mHandler.removeCallbacks(this);
            mHandler.post(this);
        }

        public void resume()
        {
            mSystemVolume = mAudioManager.getStreamVolume(mStreamType);
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" get Original SYSTEM Volume: ").append(mSystemVolume).toString());
            mOriginalVolume = mProfileManager.getStreamVolume(mKey, mStreamType);
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" get Original Volume: ").append(mOriginalVolume).toString());
            mProfileIsActive = mProfileManager.isActive(mKey);
            if (mProfileIsActive && mSystemVolume != mOriginalVolume)
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append(" sync ").append(mStreamType).append(" original Volume to").append(mSystemVolume).toString());
                mOriginalVolume = mSystemVolume;
            }
            mLastProgress = mOriginalVolume;
            if (mSeekBar != null)
                mSeekBar.setProgress(mLastProgress);
        }

        public void revertVolume()
        {
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" revert Last Volume ").append(mOriginalVolume).toString());
            mProfileManager.setStreamVolume(mKey, mStreamType, mOriginalVolume);
            if (mStreamType == 2)
                mProfileManager.setStreamVolume(mKey, 5, mOriginalVolume);
            if (mProfileManager.isActive(mKey))
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" Active, Revert system Volume ").append(mOriginalVolume).toString());
                setVolume(mStreamType, mOriginalVolume, false);
            } else
            if (!isSilentProfileActive())
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" not Active, Revert system Volume ").append(mSystemVolume).toString());
                setVolume(mStreamType, mSystemVolume, false);
                return;
            }
        }

        public void run()
        {
            sample();
        }

        public void saveVolume()
        {
            Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" Save Last Volume ").append(mLastProgress).toString());
            mProfileManager.setStreamVolume(mKey, mStreamType, mLastProgress);
            if (mStreamType == 2)
                mProfileManager.setStreamVolume(mKey, 5, mLastProgress);
            if (mProfileManager.isActive(mKey))
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" Active, save system Volume ").append(mLastProgress).toString());
                setVolume(mStreamType, mLastProgress, false);
            } else
            if (!isSilentProfileActive())
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append("").append(mStreamType).append(" not Active, Revert system Volume ").append(mSystemVolume).toString());
                setVolume(mStreamType, mSystemVolume, false);
                return;
            }
        }

        public void setVisible(boolean flag)
        {
            mIsVisible = flag;
        }

        public void stop()
        {
            mSeekBar.setOnSeekBarChangeListener(null);
            mContext = null;
            mHandler = null;
        }

        public void stopSample()
        {
            if (mRingtone != null)
            {
                Xlog.d("Settings/VolPref", (new StringBuilder()).append("stream type ").append(mStreamType).append(" stop sample").toString());
                mRingtone.stop();
            }
        }

        public SeekBarVolumizer(Context context, SeekBar seekbar, int i)
        {
            this$0 = RingerVolumePreference.this;
            super();
            mHandler = new Handler();
            mSystemVolume = -1;
            mOriginalVolume = -1;
            mLastProgress = -1;
            mDefaultUri = null;
            mProfileIsActive = false;
            mIsVisible = true;
            mContext = context;
            mStreamType = i;
            mSeekBar = seekbar;
            initSeekBar(seekbar);
        }
    }

    private class VolumeReceiver extends BroadcastReceiver
    {

        final RingerVolumePreference this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.media.VOLUME_CHANGED_ACTION"))
            {
                int i = intent.getIntExtra("android.media.EXTRA_VOLUME_STREAM_TYPE", -1);
                if (i == 2 && mSeekBarVolumizer[1] != null)
                {
                    SeekBar seekbar = mSeekBarVolumizer[1].getSeekBar();
                    if (seekbar != null)
                    {
                        int j = mAudioManager.getStreamVolume(i);
                        Xlog.d("Settings/VolPref", (new StringBuilder()).append("AudioManager Volume ").append(j).toString());
                        Xlog.d("Settings/VolPref", (new StringBuilder()).append("seekbar progress ").append(seekbar.getProgress()).toString());
                        if (seekbar.getProgress() != j && j >= 0)
                        {
                            mSeekBarVolumizer[1].mSystemVolume = j;
                            Xlog.d("Settings/VolPref", (new StringBuilder()).append("is SystemVolume Changed ").append(j).toString());
                            return;
                        }
                    }
                }
            }
        }

        private VolumeReceiver()
        {
            this$0 = RingerVolumePreference.this;
            super();
        }

    }

    public static class VolumeStore
    {

        public int mOriginalVolume;
        public int mSystemVolume;
        public int mVolume;

        public VolumeStore()
        {
            mVolume = -1;
            mOriginalVolume = -1;
            mSystemVolume = -1;
        }
    }


    private static final int CHECKBOX_VIEW_ID[] = {
        0x7f0800f9, 0x7f0800fd, 0x7f0800ff
    };
    private static final boolean LOGV = true;
    private static final int SEEKBAR_ID[] = {
        0x7f0800fe, 0x7f0800fa, 0x7f080100
    };
    private static final int SEEKBAR_TYPE[] = {
        5, 2, 4
    };
    private static final int SEEKBAR_UNMUTED_RES_ID[] = {
        0x108029f, 0x108029c, 0x1080298
    };
    private static final int STREAM_TYPE[] = {
        2, 1, 4
    };
    private static final String TAG = "Settings/VolPref";
    private final AudioManager mAudioManager;
    private IAudioProfileExt mExt;
    private boolean mIsDlgDismissed;
    private String mKey;
    private final AudioProfileListener mListener = new AudioProfileListener() {

        final RingerVolumePreference this$0;

        public void onRingerVolumeChanged(int i, int j, String s)
        {
            Xlog.d("Settings/VolPref", (new StringBuilder()).append(s).append(" :onRingerVolumeChanged from ").append(i).append(" to ").append(j).toString());
            if (mKey.equals(s) && mSeekBarVolumizer[1] != null)
            {
                SeekBar seekbar = mSeekBarVolumizer[1].getSeekBar();
                if (seekbar != null && seekbar.getProgress() != j && j >= 0)
                {
                    seekbar.setProgress(j);
                    Xlog.d("Settings/VolPref", (new StringBuilder()).append("Profile Ringer volume change: mSeekBar.setProgress++ ").append(j).toString());
                    return;
                }
            }
        }

            
            {
                this$0 = RingerVolumePreference.this;
                super();
            }
    }
;
    private final AudioProfileManager mProfileManager;
    private VolumeReceiver mReceiver;
    private SeekBarVolumizer mSeekBarVolumizer[];

    public RingerVolumePreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mIsDlgDismissed = true;
        setDialogLayoutResource(0x7f040063);
        setDialogIcon(0x7f02008f);
        mAudioManager = (AudioManager)context.getSystemService("audio");
        mProfileManager = (AudioProfileManager)context.getSystemService("audioprofile");
        mSeekBarVolumizer = new SeekBarVolumizer[SEEKBAR_ID.length];
        mExt = Utils.getAudioProfilePlgin(context);
    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
        Context context = getContext();
        mReceiver = new VolumeReceiver();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.media.VOLUME_CHANGED_ACTION");
        context.registerReceiver(mReceiver, intentfilter);
        mIsDlgDismissed = false;
        Xlog.d("Settings/VolPref", "set mIsDlgDismissed to false ");
        for (int i = 0; i < SEEKBAR_ID.length; i++)
        {
            ImageView imageview = (ImageView)view.findViewById(CHECKBOX_VIEW_ID[i]);
            if (imageview != null)
                imageview.setImageResource(SEEKBAR_UNMUTED_RES_ID[i]);
            SeekBar seekbar = (SeekBar)view.findViewById(SEEKBAR_ID[i]);
            if (seekbar == null)
                continue;
            if (i == 0)
                seekbar.requestFocus();
            mSeekBarVolumizer[i] = new SeekBarVolumizer(context, seekbar, SEEKBAR_TYPE[i]);
            seekbar.setOnKeyListener(this);
        }

        view.setFocusableInTouchMode(true);
        int j;
        if (Utils.isVoiceCapable(getContext()))
        {
            j = 0x7f0800fb;
            mSeekBarVolumizer[0].setVisible(false);
        } else
        {
            j = 0x7f0800f7;
            mSeekBarVolumizer[1].setVisible(false);
        }
        view.findViewById(j).setVisibility(8);
        mProfileManager.listenAudioProfie(mListener, 4);
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (mSeekBarVolumizer == null)
            return;
        SeekBarVolumizer aseekbarvolumizer[] = mSeekBarVolumizer;
        int i = aseekbarvolumizer.length;
        for (int j = 0; j < i; j++)
            aseekbarvolumizer[j].stopSample();

        if (flag)
        {
            SeekBarVolumizer aseekbarvolumizer2[] = mSeekBarVolumizer;
            int i1 = aseekbarvolumizer2.length;
            for (int j1 = 0; j1 < i1; j1++)
            {
                SeekBarVolumizer seekbarvolumizer1 = aseekbarvolumizer2[j1];
                if (seekbarvolumizer1 != null && seekbarvolumizer1.getVisible())
                {
                    seekbarvolumizer1.saveVolume();
                    seekbarvolumizer1.getSeekBar().setOnKeyListener(null);
                    seekbarvolumizer1.stop();
                }
            }

        } else
        {
            Xlog.d("Settings/VolPref", "Cacel: Original checked.");
            SeekBarVolumizer aseekbarvolumizer1[] = mSeekBarVolumizer;
            int k = aseekbarvolumizer1.length;
            for (int l = 0; l < k; l++)
            {
                SeekBarVolumizer seekbarvolumizer = aseekbarvolumizer1[l];
                if (seekbarvolumizer != null && seekbarvolumizer.getVisible())
                {
                    seekbarvolumizer.revertVolume();
                    seekbarvolumizer.getSeekBar().setOnKeyListener(null);
                    seekbarvolumizer.stop();
                }
            }

        }
        mIsDlgDismissed = true;
        Xlog.d("Settings/VolPref", "set mIsDlgDismissed to true");
        getContext().unregisterReceiver(mReceiver);
        mProfileManager.listenAudioProfie(mListener, 0);
    }

    public boolean onKey(View view, int i, KeyEvent keyevent)
    {
        if (mSeekBarVolumizer == null) goto _L2; else goto _L1
_L1:
        boolean flag;
        SeekBarVolumizer aseekbarvolumizer[];
        int j;
        int k;
        if (keyevent.getAction() == 0)
            flag = true;
        else
            flag = false;
        aseekbarvolumizer = mSeekBarVolumizer;
        j = aseekbarvolumizer.length;
        k = 0;
_L10:
        if (k >= j) goto _L2; else goto _L3
_L3:
        SeekBarVolumizer seekbarvolumizer = aseekbarvolumizer[k];
        if (seekbarvolumizer == null || seekbarvolumizer.getSeekBar() == null || !seekbarvolumizer.getSeekBar().isFocused()) goto _L5; else goto _L4
_L4:
        i;
        JVM INSTR tableswitch 24 25: default 128
    //                   24 100
    //                   25 113;
           goto _L6 _L7 _L8
_L7:
        if (flag)
        {
            seekbarvolumizer.changeVolumeBy(1);
            return true;
        }
        break; /* Loop/switch isn't completed */
_L8:
        if (flag)
        {
            seekbarvolumizer.changeVolumeBy(-1);
            return true;
        }
_L2:
        return true;
_L6:
        return false;
_L5:
        k++;
        if (true) goto _L10; else goto _L9
_L9:
    }

    protected void onRestoreInstanceState(Parcelable parcelable)
    {
        if (parcelable != null && parcelable.getClass().equals(com/mediatek/audioprofile/RingerVolumePreference$SavedState))
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            if (mSeekBarVolumizer != null)
            {
                VolumeStore avolumestore[] = savedstate.getVolumeStore(SEEKBAR_ID.length);
                for (int i = 0; i < SEEKBAR_ID.length; i++)
                {
                    SeekBarVolumizer seekbarvolumizer = mSeekBarVolumizer[i];
                    if (seekbarvolumizer != null)
                        seekbarvolumizer.onRestoreInstanceState(avolumestore[i]);
                }

            }
        } else
        {
            super.onRestoreInstanceState(parcelable);
        }
    }

    protected void onSampleStarting(SeekBarVolumizer seekbarvolumizer)
    {
        if (seekbarvolumizer != null)
        {
            SeekBarVolumizer aseekbarvolumizer[] = mSeekBarVolumizer;
            int i = aseekbarvolumizer.length;
            for (int j = 0; j < i; j++)
            {
                SeekBarVolumizer seekbarvolumizer1 = aseekbarvolumizer[j];
                if (seekbarvolumizer1 != null && seekbarvolumizer1 != seekbarvolumizer)
                    seekbarvolumizer1.stopSample();
            }

        }
    }

    protected Parcelable onSaveInstanceState()
    {
        Parcelable parcelable = super.onSaveInstanceState();
        if (isPersistent())
            return parcelable;
        SavedState savedstate = new SavedState(parcelable);
        if (mSeekBarVolumizer != null)
        {
            VolumeStore avolumestore[] = savedstate.getVolumeStore(SEEKBAR_ID.length);
            for (int i = 0; i < SEEKBAR_ID.length; i++)
            {
                SeekBarVolumizer seekbarvolumizer = mSeekBarVolumizer[i];
                if (seekbarvolumizer != null)
                    seekbarvolumizer.onSaveInstanceState(avolumestore[i]);
            }

        }
        return savedstate;
    }

    public void revertVolume()
    {
        Xlog.d("Settings/VolPref", (new StringBuilder()).append("mIsDlgDismissed").append(mIsDlgDismissed).toString());
        if (!mIsDlgDismissed && mSeekBarVolumizer != null)
        {
            SeekBarVolumizer aseekbarvolumizer[] = mSeekBarVolumizer;
            int i = aseekbarvolumizer.length;
            for (int j = 0; j < i; j++)
            {
                SeekBarVolumizer seekbarvolumizer = aseekbarvolumizer[j];
                if (seekbarvolumizer != null)
                {
                    seekbarvolumizer.revertVolume();
                    seekbarvolumizer.resume();
                }
            }

        }
    }

    public void setProfile(String s)
    {
        mKey = s;
    }

    public void stopPlaying()
    {
        if (mSeekBarVolumizer != null)
        {
            SeekBarVolumizer aseekbarvolumizer[] = mSeekBarVolumizer;
            int i = aseekbarvolumizer.length;
            for (int j = 0; j < i; j++)
            {
                SeekBarVolumizer seekbarvolumizer = aseekbarvolumizer[j];
                if (seekbarvolumizer != null && seekbarvolumizer.isPlaying())
                {
                    Xlog.d("Settings/VolPref", "IsPlaying");
                    seekbarvolumizer.stopSample();
                    Xlog.d("Settings/VolPref", "stopPlaying");
                }
            }

        }
    }







}
