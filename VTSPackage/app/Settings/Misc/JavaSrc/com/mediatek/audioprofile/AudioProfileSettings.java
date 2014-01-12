// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.audioprofile;

import android.app.*;
import android.content.DialogInterface;
import android.media.AudioManager;
import android.os.*;
import android.preference.*;
import android.view.*;
import android.widget.EditText;
import android.widget.ListAdapter;
import com.android.settings.SettingsPreferenceFragment;
import com.android.settings.Utils;
import com.mediatek.common.audioprofile.AudioProfileListener;
import com.mediatek.settings.ext.IAudioProfileExt;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.audioprofile:
//            AudioProfileManager, AudioProfilePreference, Editprofile

public class AudioProfileSettings extends SettingsPreferenceFragment
    implements android.content.DialogInterface.OnClickListener
{
    private class ResetTask extends AsyncTask
    {

        private static final int RESET_ONGOING = 1;
        private static final int RESET_SUCCESS;
        final AudioProfileSettings this$0;

        protected transient Integer doInBackground(String as[])
        {
            mProfileManager.reset();
            return Integer.valueOf(0);
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((String[])aobj);
        }

        protected void onPostExecute(Integer integer)
        {
            if (integer.intValue() == 0)
                mHandler.sendEmptyMessage(11);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Integer)obj);
        }

        private ResetTask()
        {
            this$0 = AudioProfileSettings.this;
            super();
        }

    }


    private static final String CUSTOMCATEGORY = "custom";
    private static final int DIALOG_DELETE = 3;
    private static final int DIALOG_ERROR = 1;
    private static final int DIALOG_NAME = 0;
    private static final int DIALOG_RESET = 2;
    private static final int ERROR_COUNT_OVERFLOW = 2;
    private static final int ERROR_NAME_EXIST = 0;
    private static final int ERROR_NAME_LENGTH = 1;
    private static final String GENERAL_PREF_KEY = "mtk_audioprofile_general";
    private static final String GET_MUSIC_PLUS_STATUS = "GetMusicPlusStatus";
    private static final String GET_MUSIC_PLUS_STATUS_ENABLED = "GetMusicPlusStatus=1";
    private static final int H_RESET_SUCCESS = 11;
    private static final String KEY_MUSIC_PLUS = "music_plus";
    private static final String KEY_SOUND_ENAHCNE = "sound_enhance";
    private static final String MEETING_PREF_KEY = "mtk_audioprofile_meeting";
    private static final int MENUID_ADD = 1;
    private static final int MENUID_DELETE = 4;
    private static final int MENUID_ENABLE = 2;
    private static final int MENUID_RENAME = 3;
    private static final int MENUID_RESET = 2;
    private static final String OUTDOOR_PREF_KEY = "mtk_audioprofile_outdoor";
    private static final String PREDEFINEDCATEGORY = "predefine";
    private static final String SET_MUSIC_PLUS_DISABLED = "SetMusicPlusStatus=0";
    private static final String SET_MUSIC_PLUS_ENABLED = "SetMusicPlusStatus=1";
    private static final String SILENT_PREF_KEY = "mtk_audioprofile_silent";
    private static final int SOUND_PREFERENCE_NULL_COUNT = 0;
    private static final String TAG = "AudioProfileSettings:";
    private static final String XLOGTAG = "Settings/AudioP";
    private PreferenceCategory mAudioEnhParent;
    private AudioManager mAudioManager;
    public int mCurrentDialogId;
    private PreferenceCategory mCustomParent;
    private boolean mCustomerExist;
    private List mCustomerProfilePrefList;
    private String mDefaultKey;
    private EditText mEditText;
    private int mErrorType;
    private IAudioProfileExt mExt;
    private AudioProfilePreference mGeneralPref;
    private Handler mHandler;
    private final AudioProfileListener mListener = new AudioProfileListener() {

        final AudioProfileSettings this$0;

        public void onAudioProfileChanged(String s)
        {
            super.onAudioProfileChanged(s);
            Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:onAudioPerfileChanged:key ").append(s).toString());
            AudioProfileSettings audioprofilesettings = AudioProfileSettings.this;
            if (s == null)
                s = mDefaultKey;
            AudioProfilePreference audioprofilepreference = (AudioProfilePreference)audioprofilesettings.findPreference(s);
            if (audioprofilepreference != null)
                audioprofilepreference.setChecked();
        }

            
            {
                this$0 = AudioProfileSettings.this;
                super();
            }
    }
;
    private int mMenuId;
    private CheckBoxPreference mMusicPlusPrf;
    private PreferenceCategory mPredefineParent;
    private AudioProfilePreference mPref;
    private AudioProfileManager mProfileManager;
    private final android.view.View.OnClickListener mProfileSettingListener = new android.view.View.OnClickListener() {

        final AudioProfileSettings this$0;

        public void onClick(View view)
        {
            String s = (String)(String)view.getTag();
            Xlog.d("Settings/AudioP", (new StringBuilder()).append("on Click ImageView: ").append(s).toString());
            Bundle bundle = new Bundle();
            bundle.putString("profileKey", s);
            ((PreferenceActivity)getActivity()).startPreferencePanel(com/mediatek/audioprofile/Editprofile.getName(), bundle, 0, null, null, 0);
        }

            
            {
                this$0 = AudioProfileSettings.this;
                super();
            }
    }
;
    private String mProfileTitle[];
    private String mRenameDialogtext;

    public AudioProfileSettings()
    {
        mCurrentDialogId = -1;
        mHandler = null;
        mAudioManager = null;
        mCustomerExist = true;
        mEditText = null;
    }

    private AudioProfilePreference addPreference(PreferenceScreen preferencescreen, String s)
    {
        AudioProfileManager.Scenario scenario = AudioProfileManager.getScenario(s);
        boolean flag = AudioProfileManager.Scenario.CUSTOM.equals(scenario);
        AudioProfilePreference audioprofilepreference = null;
        if (flag)
        {
            audioprofilepreference = new AudioProfilePreference(getActivity());
            audioprofilepreference.setOnSettingsClickListener(mProfileSettingListener);
            audioprofilepreference.setProfileKey(s);
            mCustomerProfilePrefList.add(audioprofilepreference);
            Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:Add into profile list").append(audioprofilepreference.getKey()).toString());
            if (!mCustomerExist)
            {
                preferencescreen.addPreference(mCustomParent);
                mCustomerExist = true;
            }
            if (mPref != null && s.equals(mPref.getKey()))
                mPref = audioprofilepreference;
            mCustomParent.addPreference(audioprofilepreference);
            String s1 = mProfileManager.getProfileName(s);
            if (s1 != null)
            {
                audioprofilepreference.setTitle(s1, false);
                Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:").append(String.valueOf(audioprofilepreference.getTitle())).toString());
            }
        }
        return audioprofilepreference;
    }

    private void dynamicshowSummary()
    {
        mGeneralPref.dynamicShowSummary();
        for (Iterator iterator = mCustomerProfilePrefList.iterator(); iterator.hasNext(); ((AudioProfilePreference)iterator.next()).dynamicShowSummary());
    }

    private void updateActivePreference()
    {
        String s = mProfileManager.getActiveProfileKey();
        Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:key ").append(s).toString());
        if (s == null)
            s = mDefaultKey;
        AudioProfilePreference audioprofilepreference = (AudioProfilePreference)findPreference(s);
        if (audioprofilepreference != null)
            audioprofilepreference.setChecked();
    }

    private void updatePreferenceHierarchy()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        List list = mProfileManager.getAllProfileKeys();
        if (list == null)
        {
            Xlog.d("Settings/AudioP", "AudioProfileSettings:profileKey size is 0");
        } else
        {
            Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:profileKey size").append(list.size()).toString());
            if (list.size() == 4)
            {
                mCustomParent.removeAll();
                preferencescreen.removePreference(mCustomParent);
                mCustomerExist = false;
                return;
            }
            mCustomParent.removeAll();
            mCustomerProfilePrefList.clear();
            for (Iterator iterator = list.iterator(); iterator.hasNext(); addPreference(preferencescreen, (String)iterator.next()));
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
label0:
        {
label1:
            {
                Xlog.d("Settings/AudioP", "onClick");
                Xlog.d("Settings/AudioP", (new StringBuilder()).append("").append(i).toString());
                if (i != -1)
                    Xlog.d("Settings/AudioP", "return");
                else
                    switch (mCurrentDialogId)
                    {
                    default:
                        break label0;

                    case 0: // '\0'
                        break label1;

                    case 2: // '\002'
                        if (mCustomParent != null)
                        {
                            mCustomParent.removeAll();
                            getPreferenceScreen().removePreference(mCustomParent);
                            mCustomerProfilePrefList.clear();
                            mCustomerExist = false;
                        }
                        findPreference("predefine").setEnabled(false);
                        (new ResetTask()).execute(new String[0]);
                        return;

                    case 3: // '\003'
                        if (mPref.isChecked())
                        {
                            mProfileManager.setActiveProfile(mDefaultKey);
                            mGeneralPref.setChecked();
                        }
                        mProfileManager.deleteProfile(mPref.getKey());
                        mCustomParent.removePreference(mPref);
                        mCustomerProfilePrefList.remove(mPref);
                        if (mCustomParent.getPreferenceCount() == 0)
                        {
                            getPreferenceScreen().removePreference(mCustomParent);
                            mCustomerExist = false;
                            return;
                        }
                        break;

                    case 1: // '\001'
                        if (mErrorType != 2)
                        {
                            showDialog(0);
                            return;
                        }
                        break;
                    }
                return;
            }
            String s;
            if (mEditText == null)
                s = "";
            else
                s = String.valueOf(mEditText.getText());
            if (s.length() == 0)
            {
                mErrorType = 1;
                showDialog(1);
                return;
            }
            if (mProfileManager.isNameExist(s))
            {
                mErrorType = 0;
                showDialog(1);
                return;
            }
            if (mMenuId == 1)
            {
                String s1 = mProfileManager.addProfile();
                Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:add profile Key").append(s1).toString());
                mProfileManager.setProfileName(s1, s);
                AudioProfilePreference audioprofilepreference = addPreference(getPreferenceScreen(), s1);
                if (audioprofilepreference == null)
                {
                    mProfileManager.setActiveProfile(mDefaultKey);
                    mGeneralPref.setChecked();
                    return;
                } else
                {
                    mProfileManager.setActiveProfile(s1);
                    audioprofilepreference.setChecked();
                    audioprofilepreference.dynamicShowSummary();
                    return;
                }
            } else
            {
                mPref.setTitle(s, true);
                return;
            }
        }
        Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:unrecongnized dialog id is").append(mCurrentDialogId).toString());
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
        android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)menuitem.getMenuInfo();
        Preference preference = (Preference)getPreferenceScreen().getRootAdapter().getItem(adaptercontextmenuinfo.position);
        if (preference instanceof AudioProfilePreference)
        {
            mPref = (AudioProfilePreference)preference;
            switch (menuitem.getItemId())
            {
            case 2: // '\002'
                mProfileManager.setActiveProfile(mPref.getKey());
                mPref.setChecked();
                return true;

            case 3: // '\003'
                mMenuId = 3;
                showDialog(0);
                return true;

            case 4: // '\004'
                showDialog(3);
                return true;
            }
            return false;
        } else
        {
            return false;
        }
    }

    public void onCreate(Bundle bundle)
    {
        Xlog.d("Settings/AudioP", "onCreate");
        super.onCreate(bundle);
        mExt = Utils.getAudioProfilePlgin(getActivity());
        mCustomerProfilePrefList = new ArrayList();
        mProfileManager = (AudioProfileManager)getSystemService("audioprofile");
        mAudioManager = (AudioManager)getSystemService("audio");
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen != null)
            preferencescreen.removeAll();
        addPreferencesFromResource(0x7f050009);
        mCustomParent = (PreferenceCategory)findPreference("custom");
        ((AudioProfilePreference)findPreference("mtk_audioprofile_general")).setOnSettingsClickListener(mProfileSettingListener);
        ((AudioProfilePreference)findPreference("mtk_audioprofile_silent")).setOnSettingsClickListener(mProfileSettingListener);
        ((AudioProfilePreference)findPreference("mtk_audioprofile_meeting")).setOnSettingsClickListener(mProfileSettingListener);
        ((AudioProfilePreference)findPreference("mtk_audioprofile_outdoor")).setOnSettingsClickListener(mProfileSettingListener);
        mDefaultKey = (new StringBuilder()).append("mtk_audioprofile_").append(AudioProfileManager.Scenario.GENERAL.toString().toLowerCase()).toString();
        mGeneralPref = (AudioProfilePreference)findPreference(mDefaultKey);
        mHandler = new Handler() {

            final AudioProfileSettings this$0;

            public void handleMessage(Message message)
            {
                if (message.what == 11)
                {
                    findPreference("predefine").setEnabled(true);
                    mGeneralPref.dynamicShowSummary();
                }
            }

            
            {
                this$0 = AudioProfileSettings.this;
                super();
            }
        }
;
        mMusicPlusPrf = (CheckBoxPreference)findPreference("music_plus");
        mAudioEnhParent = (PreferenceCategory)findPreference("sound_enhance");
        Xlog.d("Settings/AudioP", (new StringBuilder()).append("AudioProfileSettings:remove audio enhance preference ").append(mMusicPlusPrf).toString());
        mAudioEnhParent.removePreference(mMusicPlusPrf);
        if (mAudioEnhParent.getPreferenceCount() == 0)
            getPreferenceScreen().removePreference(mAudioEnhParent);
        setHasOptionsMenu(true);
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        super.onCreateContextMenu(contextmenu, view, contextmenuinfo);
        android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
        Preference preference = (Preference)getPreferenceScreen().getRootAdapter().getItem(adaptercontextmenuinfo.position);
        if (preference instanceof AudioProfilePreference)
        {
            String s = preference.getKey();
            mRenameDialogtext = ((AudioProfilePreference)preference).getTitle();
            contextmenu.setHeaderTitle(mRenameDialogtext);
            contextmenu.add(0, 2, 0, 0x7f0b0081);
            AudioProfileManager _tmp = mProfileManager;
            AudioProfileManager.Scenario scenario = AudioProfileManager.getScenario(s);
            if (AudioProfileManager.Scenario.CUSTOM.equals(scenario))
            {
                contextmenu.add(0, 3, 0, 0x7f0b0082);
                contextmenu.add(0, 4, 0, 0x7f0b0083);
            }
        }
    }

    public Dialog onCreateDialog(int i)
    {
        mCurrentDialogId = i;
        AlertDialog alertdialog;
        if (i == 0)
        {
            View view = getActivity().getLayoutInflater().inflate(0x7f040034, null);
            mEditText = (EditText)view.findViewById(0x7f08007d);
            if (mEditText != null)
            {
                mEditText.setInputType(0x10001);
                EditText edittext = mEditText;
                String s;
                if (mMenuId == 1)
                    s = "";
                else
                    s = mRenameDialogtext;
                edittext.setText(s);
            }
            android.app.AlertDialog.Builder builder1 = new android.app.AlertDialog.Builder(getActivity());
            int l;
            if (mMenuId == 1)
                l = 0x7f0b0080;
            else
                l = 0x7f0b0082;
            alertdialog = builder1.setTitle(l).setMessage(0x7f0b0085).setView(view).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, null).create();
            alertdialog.getWindow().setSoftInputMode(36);
        } else
        {
            if (i == 1)
            {
                int j = mErrorType;
                int k = 0;
                switch (j)
                {
                case 1: // '\001'
                    k = 0x7f0b0087;
                    break;

                case 0: // '\0'
                    k = 0x7f0b0086;
                    break;

                case 2: // '\002'
                    k = 0x7f0b0089;
                    break;
                }
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b014b).setIcon(0x1080027).setMessage(k).setPositiveButton(0x104000a, this).create();
            }
            if (i == 2)
                return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b007f).setIcon(0x1080027).setMessage(0x7f0b0084).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, null).create();
            alertdialog = null;
            if (i == 3)
            {
                android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0083).setIcon(0x1080027);
                Object aobj[] = new Object[1];
                aobj[0] = mPref.getTitle();
                return builder.setMessage(getString(0x7f0b0088, aobj)).setPositiveButton(0x104000a, this).setNegativeButton(0x1040000, null).create();
            }
        }
        return alertdialog;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 1, 0, 0x7f0b0080).setIcon(0x7f020067).setShowAsAction(5);
        menu.add(0, 2, 0, 0x7f0b007f).setIcon(0x7f02006e).setShowAsAction(5);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 1)
            if (mProfileManager.getProfileCount() >= 10)
            {
                mErrorType = 2;
                showDialog(1);
                return true;
            } else
            {
                mMenuId = 1;
                showDialog(0);
                return true;
            }
        if (menuitem.getItemId() == 2)
        {
            showDialog(2);
            return true;
        } else
        {
            return false;
        }
    }

    public void onPause()
    {
        super.onPause();
        mProfileManager.listenAudioProfie(mListener, 0);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference instanceof AudioProfilePreference)
        {
            AudioProfilePreference audioprofilepreference = (AudioProfilePreference)preference;
            String s = audioprofilepreference.getKey();
            if (mExt.isPrefEditable())
            {
                Bundle bundle = new Bundle();
                bundle.putString("profileKey", s);
                ((PreferenceActivity)getActivity()).startPreferencePanel(com/mediatek/audioprofile/Editprofile.getName(), bundle, 0, null, null, 0);
            } else
            {
                mProfileManager.setActiveProfile(s);
                audioprofilepreference.setChecked();
            }
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        Xlog.d("Settings/AudioP", "AudioProfileSettings:onResume");
        super.onResume();
        updatePreferenceHierarchy();
        dynamicshowSummary();
        updateActivePreference();
        registerForContextMenu(getListView());
        mProfileManager.listenAudioProfie(mListener, 1);
    }




}
