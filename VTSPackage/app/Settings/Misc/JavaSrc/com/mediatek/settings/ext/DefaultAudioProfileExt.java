// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.app.Fragment;
import android.content.*;
import android.media.AudioManager;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;

// Referenced classes of package com.mediatek.settings.ext:
//            IAudioProfileExt

public class DefaultAudioProfileExt extends ContextWrapper
    implements IAudioProfileExt
{

    private RadioButton mCheckboxButton;
    private Fragment mContext;
    private boolean mHasMoreRingtone;
    private ImageView mImageView;
    private LayoutInflater mInflater;
    private View mLayout;
    private TextView mSummary;
    private TextView mTextView;

    public DefaultAudioProfileExt(Context context)
    {
        super(context);
        mTextView = null;
        mCheckboxButton = null;
        mSummary = null;
        mImageView = null;
        mHasMoreRingtone = false;
        mInflater = (LayoutInflater)getBaseContext().getSystemService("layout_inflater");
    }

    public View createView(int i)
    {
        mLayout = mInflater.inflate(i, null);
        return mLayout;
    }

    public View getPrefImageView(int i)
    {
        mImageView = (ImageView)mLayout.findViewById(i);
        return mImageView;
    }

    public View getPrefRadioButton(int i)
    {
        mCheckboxButton = (RadioButton)mLayout.findViewById(i);
        return mCheckboxButton;
    }

    public View getPreferenceSummary(int i)
    {
        mSummary = (TextView)mLayout.findViewById(i);
        return mSummary;
    }

    public View getPreferenceTitle(int i)
    {
        mTextView = (TextView)mLayout.findViewById(i);
        return mTextView;
    }

    public boolean isPrefEditable()
    {
        return false;
    }

    public void setRingerVolume(AudioManager audiomanager, int i)
    {
        audiomanager.setStreamVolume(2, i, 0);
        audiomanager.setStreamVolume(5, i, 0);
    }

    public void setRingtonePickerParams(Intent intent)
    {
        intent.putExtra("android.intent.extra.ringtone.SHOW_MORE_RINGTONES", false);
        mHasMoreRingtone = true;
    }

    public void setVolume(AudioManager audiomanager, int i, int j)
    {
        audiomanager.setStreamVolume(i, j, 0);
    }
}
