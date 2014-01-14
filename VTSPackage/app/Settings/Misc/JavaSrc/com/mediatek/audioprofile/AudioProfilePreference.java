// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.audioprofile;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
import com.android.settings.Utils;
import com.mediatek.settings.ext.IAudioProfileExt;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.audioprofile:
//            AudioProfileManager

public class AudioProfilePreference extends Preference
    implements android.widget.CompoundButton.OnCheckedChangeListener, android.view.View.OnClickListener
{

    private static final String TAG = "AudioProfilePreference:";
    private static final String XLOGTAG = "Settings/AudioP";
    private static String sActiveKey = null;
    private static CompoundButton sCurrentChecked = null;
    private RadioButton mCheckboxButton;
    private Context mContext;
    private IAudioProfileExt mExt;
    private LayoutInflater mInflater;
    private String mKey;
    private android.view.View.OnClickListener mOnSettingsClickListener;
    private String mPreferenceSummary;
    private String mPreferenceTitle;
    private AudioProfileManager mProfileManager;
    private AudioProfileManager.Scenario mScenario;
    private TextView mSummary;
    private TextView mTextView;

    public AudioProfilePreference(Context context)
    {
        this(context, null);
    }

    public AudioProfilePreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public AudioProfilePreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mPreferenceTitle = null;
        mPreferenceSummary = null;
        mTextView = null;
        mSummary = null;
        mCheckboxButton = null;
        mContext = context;
        mInflater = (LayoutInflater)mContext.getSystemService("layout_inflater");
        if (super.getTitle() != null)
            mPreferenceTitle = super.getTitle().toString();
        if (super.getSummary() != null)
            mPreferenceSummary = super.getSummary().toString();
        mProfileManager = (AudioProfileManager)context.getSystemService("audioprofile");
        mKey = getKey();
        mExt = Utils.getAudioProfilePlgin(context);
    }

    public void dynamicShowSummary()
    {
label0:
        {
            Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfilePreference:").append(mKey).append(" dynamicShowSummary").toString());
            if (mSummary != null)
            {
                AudioProfileManager.Scenario scenario = AudioProfileManager.getScenario(mKey);
                if (!AudioProfileManager.Scenario.GENERAL.equals(scenario) && !AudioProfileManager.Scenario.CUSTOM.equals(scenario))
                {
                    if (mPreferenceSummary != null)
                    {
                        mSummary.setText(mPreferenceSummary);
                        return;
                    }
                } else
                {
                    boolean flag = mProfileManager.getVibrationEnabled(mKey);
                    Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfilePreference:vibrationEnabled").append(flag).toString());
                    if (!flag)
                        break label0;
                    mSummary.setText(mContext.getString(0x7f0b007b));
                }
            }
            return;
        }
        mSummary.setText(mContext.getString(0x7f0b007a));
    }

    public volatile CharSequence getTitle()
    {
        return getTitle();
    }

    public String getTitle()
    {
        return mPreferenceTitle;
    }

    public boolean isChecked()
    {
        if (sActiveKey != null)
            return getKey().equals(sActiveKey);
        else
            return false;
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfilePreference:onCheckedChanged ").append(flag).append(getKey()).toString());
        if (flag)
        {
            if (sCurrentChecked != null)
                sCurrentChecked.setChecked(false);
            sCurrentChecked = compoundbutton;
            mProfileManager.setActiveProfile(mKey);
        }
    }

    public void onClick(View view)
    {
        if (mOnSettingsClickListener != null)
            mOnSettingsClickListener.onClick(view);
    }

    public View onCreateView(ViewGroup viewgroup)
    {
        Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfilePreference:onCreateView ").append(getKey()).toString());
        View view = mExt.createView(0x7f04000a);
        mCheckboxButton = (RadioButton)mExt.getPrefRadioButton(0x7f080008);
        mTextView = (TextView)mExt.getPreferenceTitle(0x7f080009);
        mSummary = (TextView)mExt.getPreferenceSummary(0x7f08000a);
        if (mCheckboxButton != null)
        {
            mCheckboxButton.setOnClickListener(new android.view.View.OnClickListener() {

                final AudioProfilePreference this$0;

                public void onClick(View view1)
                {
                    Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfilePreference:onClick ").append(getKey()).toString());
                    if (!mCheckboxButton.equals(AudioProfilePreference.sCurrentChecked))
                    {
                        if (AudioProfilePreference.sCurrentChecked != null)
                        {
                            AudioProfilePreference.sCurrentChecked.setChecked(false);
                            mCheckboxButton.setChecked(true);
                            AudioProfilePreference.sCurrentChecked = mCheckboxButton;
                            mProfileManager.setActiveProfile(mKey);
                        }
                        return;
                    } else
                    {
                        Xlog.d("Settings/AudioP", "AudioProfilePreference:Click the active profile, do nothing return");
                        return;
                    }
                }

            
            {
                this$0 = AudioProfilePreference.this;
                super();
            }
            }
);
            mCheckboxButton.setChecked(isChecked());
            if (isChecked())
                setChecked();
        }
        if (mPreferenceTitle != null && mTextView != null)
            mTextView.setText(mPreferenceTitle);
        else
            Xlog.d("Settings/AudioP", "AudioProfilePreference:PreferenceTitle is null");
        dynamicShowSummary();
        ImageView imageview = (ImageView)mExt.getPrefImageView(0x7f08000c);
        ImageView imageview1 = (ImageView)mExt.getPrefImageView(0x7f08000b);
        if (imageview != null)
        {
            imageview.setTag(mKey);
            AudioProfileManager.Scenario scenario = AudioProfileManager.getScenario(mKey);
            if (!AudioProfileManager.Scenario.CUSTOM.equals(scenario) && !AudioProfileManager.Scenario.GENERAL.equals(scenario))
            {
                imageview.setVisibility(8);
                imageview1.setVisibility(8);
                imageview.setOnClickListener(null);
                return view;
            }
            imageview.setOnClickListener(this);
        }
        return view;
    }

    public void setChecked()
    {
        sActiveKey = getKey();
        if (mCheckboxButton != null)
        {
            if (!mCheckboxButton.equals(sCurrentChecked))
            {
                if (sCurrentChecked != null)
                    sCurrentChecked.setChecked(false);
                Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfilePreference:setChecked").append(getKey()).toString());
                mCheckboxButton.setChecked(true);
                sCurrentChecked = mCheckboxButton;
            }
            return;
        } else
        {
            Xlog.d("Settings/AudioP", "AudioProfilePreference:mCheckboxButton is null");
            return;
        }
    }

    public void setOnSettingsClickListener(android.view.View.OnClickListener onclicklistener)
    {
        mOnSettingsClickListener = onclicklistener;
    }

    public void setProfileKey(String s)
    {
        setKey(s);
        mKey = s;
    }

    public void setTitle(String s, boolean flag)
    {
        mPreferenceTitle = s;
        if (flag)
            mProfileManager.setProfileName(mKey, s);
        if (mTextView != null)
            mTextView.setText(s);
    }




/*
    static CompoundButton access$002(CompoundButton compoundbutton)
    {
        sCurrentChecked = compoundbutton;
        return compoundbutton;
    }

*/



}
