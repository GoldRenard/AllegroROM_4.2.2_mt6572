// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.preference.*;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.view.MenuItem;
import android.widget.*;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.PhoneGlobals;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.SettingsExtension;
import com.mediatek.phone.vt.VTCallUtils;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.io.IOException;
import java.util.*;

// Referenced classes of package com.mediatek.settings:
//            PreCheckForRunning, CallSettings, CheckSimPreference, ListSimPreference, 
//            SimPreference, VTAdvancedSetting

public class MultipleSimActivity extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{
    private class MultipleSimReceiver extends BroadcastReceiver
    {

        final MultipleSimActivity this$0;

        public void onReceive(Context context, Intent intent)
        {
label0:
            {
                String s = intent.getAction();
                if ("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE".equals(s))
                {
                    removeDialog(100);
                    int i = intent.getIntExtra("simId", 0);
                    log((new StringBuilder()).append("BroadcastReceiver  slotId = ").append(i).toString());
                    if (!intent.getBooleanExtra("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE", true))
                    {
                        log("BroadcastReceiver: network mode change failed! restore the old value.");
                        int j = intent.getIntExtra("com.android.phone.OLD_NETWORK_MODE", 0);
                        android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), getNetworkModeName(i), j);
                        log((new StringBuilder()).append("BroadcastReceiver, oldMode = ").append(j).toString());
                        if ("NETWORK_MODE".equals(mFeatureName))
                        {
                            log("setValue  to oldMode ");
                            int k = 0;
                            do
                            {
                                if (k >= getPreferenceScreen().getPreferenceCount())
                                    break;
                                Preference preference = getPreferenceScreen().getPreference(k);
                                if (i == ((Integer)mPref2CardSlot.get(preference)).intValue())
                                {
                                    ((ListPreference)preference).setValue(Integer.toString(j));
                                    break;
                                }
                                k++;
                            } while (true);
                        }
                    } else
                    {
                        log("BroadcastReceiver: network mode change success! set to the new value.");
                        log((new StringBuilder()).append("BroadcastReceiver  = ").append(intent.getIntExtra("NEW_NETWORK_MODE", 0)).toString());
                        return;
                    }
                } else
                {
                    if ("android.intent.action.AIRPLANE_MODE".equals(s) || "android.intent.action.DUAL_SIM_MODE".equals(s))
                        break label0;
                    if ("android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY".equals(s))
                    {
                        if ("NETWORK_SEARCH".equals(mFeatureName))
                        {
                            mExtension.removeNMOpForMultiSim(mPhone, mSimList, mTargetClass);
                            Collections.sort(mSimList, new CallSettings.SIMInfoComparable());
                            createSubItems();
                            return;
                        }
                    } else
                    {
                        if ("android.intent.action.SIM_INDICATOR_STATE_CHANGED".equals(s))
                        {
                            updatePreferenceList();
                            return;
                        }
                        if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                        {
                            Xlog.d("MultipleSimActivity", "ACTION_SIM_INFO_UPDATE received");
                            setSimList();
                            getPreferenceScreen().removeAll();
                            addPreferencesFromResource(0x7f060015);
                            createSubItems();
                            updatePreferenceList();
                            updatePreferenceEnableState();
                            return;
                        }
                    }
                }
                return;
            }
            updatePreferenceEnableState();
        }

        private MultipleSimReceiver()
        {
            this$0 = MultipleSimActivity.this;
            super();
        }

    }


    private static final int ALERT_DIALOG = 200;
    private static final int ALERT_DIALOG_DEFAULT = 300;
    private static final boolean DBG = true;
    public static final String INIT_ARRAY = "INIT_ARRAY";
    public static final String INIT_ARRAY_VALUE = "INIT_ARRAY_VALUE";
    public static final String INIT_BASE_KEY = "INIT_BASE_KEY";
    public static final String INIT_FEATURE_NAME = "INIT_FEATURE_NAME";
    public static final String INIT_SIM_ID = "INIT_SIM_ID";
    public static final String INIT_SIM_NUMBER = "INIT_SIM_NUMBER";
    public static final String INIT_TITLE_NAME = "INIT_TITLE_NAME";
    public static final String INTENT_KEY = "ITEM_TYPE";
    public static final String LIST_TITLE = "LIST_TITLE_NAME";
    private static final int MODEM_MASK_TDSCDMA = 8;
    public static final String NETWORK_MODE_NAME = "NETWORK_MODE";
    private static final int PROGRESS_DIALOG = 100;
    private static final String SELECT_DEFAULT_PICTURE = "0";
    private static final String SELECT_DEFAULT_PICTURE2 = "0";
    private static final String SELECT_MY_PICTURE = "2";
    private static final String SELECT_MY_PICTURE2 = "1";
    public static final String SUB_TITLE_NAME = "sub_title_name";
    private static final String TAG = "MultipleSimActivity";
    public static final String TARGET_CALSS = "TARGET_CLASS";
    public static final String VT_FEATURE_NAME = "VT";
    private String mBaseKey;
    private Bitmap mBitmap;
    private SettingsExtension mExtension;
    private String mFeatureName;
    private ImageView mImage;
    private IntentFilter mIntentFilter;
    private String mItemType;
    private int mListEntries;
    private int mListTitle;
    private int mListValues;
    private Phone mPhone;
    private PhoneStateListener mPhoneStateListener;
    private PreCheckForRunning mPreCheckForRunning;
    private HashMap mPref2CardSlot;
    private final MultipleSimReceiver mReceiver = new MultipleSimReceiver();
    private long mSimIds[];
    private List mSimList;
    private int mSimNumbers;
    private String mTargetClass;
    private TelephonyManager mTelephonyManager;
    private TelephonyManagerEx mTelephonyManagerEx;
    private int mTitleName;
    private int mVTSimId;
    private int mVTWhichToSave;

    public MultipleSimActivity()
    {
        mItemType = "PreferenceScreen";
        mVTWhichToSave = 0;
        mVTSimId = 0;
        mSimNumbers = 0;
        mTargetClass = null;
        mPhone = null;
        mSimIds = null;
        mPref2CardSlot = new HashMap();
        mPhoneStateListener = new PhoneStateListener() {

            final MultipleSimActivity this$0;

            public void onCallStateChanged(int i, String s)
            {
                super.onCallStateChanged(i, s);
                log((new StringBuilder()).append("onCallStateChanged ans state is ").append(i).toString());
                switch (i)
                {
                case 0: // '\0'
                    updatePreferenceEnableState();
                    return;
                }
            }

            
            {
                this$0 = MultipleSimActivity.this;
                super();
            }
        }
;
    }

    private void checkToStart(int i, Intent intent)
    {
        if (isNeededToCheckLock())
        {
            if (mPreCheckForRunning == null)
                mPreCheckForRunning = new PreCheckForRunning(this);
            mPreCheckForRunning.checkToRun(intent, i, 302);
            return;
        } else
        {
            startActivity(intent);
            return;
        }
    }

    private void createSubItems()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        ArrayList arraylist = new ArrayList();
        for (int i = 0; i < preferencescreen.getPreferenceCount(); i++)
            if (!preferencescreen.getPreference(i).getKey().startsWith(mItemType))
                arraylist.add(preferencescreen.getPreference(i).getKey());

        for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); preferencescreen.removePreference(preferencescreen.findPreference((String)iterator.next())));
        for (int j = -1 + preferencescreen.getPreferenceCount(); j > -1 + mSimNumbers; j--)
            preferencescreen.removePreference(preferencescreen.getPreference(j));

        if (mItemType.equals("PreferenceScreen"))
        {
            initPreferenceScreen();
        } else
        {
            if (mItemType.equals("CheckBoxPreference"))
            {
                initCheckBoxPreference();
                return;
            }
            if (mItemType.equals("ListPreference"))
            {
                initListPreference();
                return;
            }
        }
    }

    private void customizeForEVDO(Intent intent, int i, String s, String s1)
    {
        if (i == 0)
        {
            intent.setClassName(s, mTargetClass);
            checkToStart(i, intent);
            return;
        }
        if ("com.android.phone.GsmUmtsCallForwardOptions".equals(s1))
        {
            intent.setClassName(s, "com.mediatek.settings.CdmaCallForwardOptions");
            checkToStart(i, intent);
            return;
        }
        if ("com.android.phone.GsmUmtsAdditionalCallOptions".equals(s1))
        {
            intent.setClassName(s, "com.mediatek.settings.CdmaCallWaitingOptions");
            checkToStart(i, intent);
            return;
        }
        if (!"com.mediatek.settings.FdnSetting2".equals(s1) && !"com.mediatek.settings.CallBarring".equals(s1) && !"com.android.phone.NetworkSetting".equals(mTargetClass) && !"com.mediatek.settings.PLMNListPreference".equals(mTargetClass))
        {
            intent.setClassName(s, mTargetClass);
            checkToStart(i, intent);
            return;
        } else
        {
            Toast.makeText(this, getResources().getString(0x7f0d0087), 1).show();
            return;
        }
    }

    private int getNetworkModeEntry(int i)
    {
        return (8 & CallSettings.getBaseband(i)) == 0 ? 0x7f07001e : 0x7f070020;
    }

    private int getNetworkModeEntryValues(int i)
    {
        return (8 & CallSettings.getBaseband(i)) == 0 ? 0x7f07001f : 0x7f070021;
    }

    private String getNetworkModeName(int i)
    {
        switch (i)
        {
        case 1: // '\001'
            return "preferred_network_mode_2";

        case 0: // '\0'
        default:
            return "preferred_network_mode";
        }
    }

    private String getProperOperatorNumber(android.provider.Telephony.SIMInfo siminfo)
    {
        if (siminfo == null)
            return null;
        String s = siminfo.mNumber;
        switch (siminfo.mDispalyNumberFormat)
        {
        case 2: // '\002'
            if (s != null && s.length() > 4)
                s = s.substring(s.length() - 4, s.length());
            break;

        case 1: // '\001'
            if (s != null && s.length() > 4)
                s = s.substring(0, 4);
            break;

        case 0: // '\0'
            s = "";
            break;

        default:
            s = "";
            break;
        }
        return s;
    }

    private void initCheckBoxPreference()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        for (int i = 0; i < mSimNumbers; i++)
        {
            CheckSimPreference checksimpreference = (CheckSimPreference)preferencescreen.getPreference(i);
            checksimpreference.setTitle(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mDisplayName);
            checksimpreference.setSimColor(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mColor);
            checksimpreference.setSimSlot(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot);
            checksimpreference.setSimName(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mDisplayName);
            checksimpreference.setSimNumber(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mNumber);
            checksimpreference.setSimIconNumber(getProperOperatorNumber((android.provider.Telephony.SIMInfo)mSimList.get(i)));
            String s = mBaseKey;
            String s1 = null;
            if (s != null)
            {
                boolean flag1 = mBaseKey.endsWith("@");
                s1 = null;
                if (flag1)
                {
                    String s2 = mBaseKey.substring(0, -1 + mBaseKey.length());
                    s1 = (new StringBuilder()).append(s2).append("_").append(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot).toString();
                    checksimpreference.setKey(s1);
                }
            }
            mPref2CardSlot.put(preferencescreen.getPreference(i), Integer.valueOf(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot));
            SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
            boolean flag;
            if (!s1.startsWith("button_vt_auto_dropback_key"))
                flag = true;
            else
                flag = false;
            checksimpreference.setChecked(sharedpreferences.getBoolean(s1, flag));
            checksimpreference.setOnPreferenceChangeListener(this);
        }

    }

    private void initListPreference()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        for (int i = 0; i < mSimNumbers; i++)
        {
            ListSimPreference listsimpreference = (ListSimPreference)preferencescreen.getPreference(i);
            listsimpreference.setTitle(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mDisplayName);
            listsimpreference.setSimColor(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mColor);
            listsimpreference.setSimSlot(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot);
            listsimpreference.setSimName(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mDisplayName);
            listsimpreference.setSimNumber(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mNumber);
            listsimpreference.setSimIconNumber(getProperOperatorNumber((android.provider.Telephony.SIMInfo)mSimList.get(i)));
            String s = mBaseKey;
            String s1 = null;
            if (s != null)
            {
                boolean flag = mBaseKey.endsWith("@");
                s1 = null;
                if (flag)
                {
                    String s2 = mBaseKey.substring(0, -1 + mBaseKey.length());
                    s1 = (new StringBuilder()).append(s2).append("_").append(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot).toString();
                    listsimpreference.setKey(s1);
                }
            }
            mPref2CardSlot.put(preferencescreen.getPreference(i), Integer.valueOf(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot));
            if (mListTitle > 0)
                listsimpreference.setDialogTitle(mListTitle);
            if (mListEntries > 0)
            {
                int l = getNetworkModeEntry(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot);
                if ("NETWORK_MODE".equals(mFeatureName))
                    listsimpreference.setEntries(l);
                else
                    listsimpreference.setEntries(mListEntries);
            }
            if (mListValues > 0)
            {
                int k = getNetworkModeEntryValues(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot);
                if ("NETWORK_MODE".equals(mFeatureName))
                    listsimpreference.setEntryValues(k);
                else
                    listsimpreference.setEntryValues(mListValues);
            }
            listsimpreference.setValue(PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).getString(s1, "0"));
            listsimpreference.setOnPreferenceChangeListener(this);
            if (!"NETWORK_MODE".equals(mFeatureName))
                continue;
            int j = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), getNetworkModeName(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot), 0);
            log((new StringBuilder()).append("settingsNetworkMode in provider = ").append(j).toString());
            if (j == 3)
                j = 0;
            log((new StringBuilder()).append("settingsNetworkMode init value = ").append(j).toString());
            listsimpreference.setValue(Integer.toString(j));
        }

    }

    private void initPreferenceScreen()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        for (int i = 0; i < mSimNumbers; i++)
        {
            SimPreference simpreference = (SimPreference)preferencescreen.getPreference(i);
            simpreference.setTitle(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mDisplayName);
            simpreference.setSimColor(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mColor);
            simpreference.setSimSlot(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot);
            simpreference.setSimName(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mDisplayName);
            simpreference.setSimNumber(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mNumber);
            simpreference.setSimIconNumber(getProperOperatorNumber((android.provider.Telephony.SIMInfo)mSimList.get(i)));
            mPref2CardSlot.put(preferencescreen.getPreference(i), Integer.valueOf(((android.provider.Telephony.SIMInfo)mSimList.get(i)).mSlot));
        }

    }

    private boolean isNeededToCheckLock()
    {
        return !"com.mediatek.settings.IpPrefixPreference".equals(mTargetClass);
    }

    private boolean isSimInserted(long l)
    {
        boolean flag = false;
        Iterator iterator = android.provider.Telephony.SIMInfo.getInsertedSIMList(this).iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((android.provider.Telephony.SIMInfo)iterator.next()).mSimId == l)
                flag = true;
        } while (true);
        return flag;
    }

    private void log(String s)
    {
        Xlog.d("MultipleSimActivity", s);
    }

    private void setSimList()
    {
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[simlist = ").append(mSimList).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[mSimIds = ").append(mSimIds).append("]").toString());
        if (mSimList == null)
            mSimList = new ArrayList();
        if (mSimIds != null)
        {
            mSimList.clear();
            for (int i = 0; i < mSimIds.length; i++)
                if (isSimInserted(mSimIds[i]))
                    mSimList.add(android.provider.Telephony.SIMInfo.getSIMInfoById(this, mSimIds[i]));

        } else
        {
            mSimList = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        }
        mSimNumbers = mSimList.size();
        Collections.sort(mSimList, new CallSettings.SIMInfoComparable());
        if (mSimNumbers == 0)
        {
            Xlog.d("MultipleSimActivity", "Activity finished");
            finish();
        }
    }

    private void showDialogPic(String s, int i)
    {
        mImage = new ImageView(this);
        mBitmap = BitmapFactory.decodeFile(s);
        mImage.setImageBitmap(mBitmap);
        showDialog(i);
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[showDialogPic][filename = ").append(s).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[showDialogPic][mBitmap = ").append(mBitmap).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[showDialogPic][mImage = ").append(mImage).append("]").toString());
    }

    private void skipUsIfNeeded()
    {
        if (!"VT".equals(mFeatureName) && !"NETWORK_MODE".equals(mFeatureName) && mSimNumbers == 1 && mTargetClass != null)
        {
            Intent intent = new Intent();
            int i = mTargetClass.lastIndexOf('.');
            String s = mTargetClass.substring(0, i).replace("com.mediatek.settings", "com.android.phone");
            intent.setAction("android.intent.action.MAIN");
            int j = ((android.provider.Telephony.SIMInfo)mSimList.get(0)).mSlot;
            intent.putExtra("simId", j);
            intent.setClassName(s, mTargetClass);
            checkToStart(j, intent);
            finish();
            return;
        } else
        {
            return;
        }
    }

    private void updatePreferenceEnableState()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        boolean flag = mPhone instanceof GeminiPhone;
        GeminiPhone geminiphone = null;
        if (flag)
            geminiphone = (GeminiPhone)mPhone;
        boolean flag1;
        if (mTelephonyManager.getCallState() == 0)
            flag1 = true;
        else
            flag1 = false;
        for (int i = 0; i < preferencescreen.getPreferenceCount(); i++)
        {
            Preference preference = preferencescreen.getPreference(i);
            if (geminiphone == null)
                continue;
            if ("NETWORK_MODE".equals(mFeatureName))
            {
                boolean flag2;
                if (geminiphone.isRadioOnGemini(((Integer)mPref2CardSlot.get(preference)).intValue()) && flag1)
                    flag2 = true;
                else
                    flag2 = false;
                preference.setEnabled(flag2);
            } else
            {
                preference.setEnabled(geminiphone.isRadioOnGemini(((Integer)mPref2CardSlot.get(preference)).intValue()));
            }
            if (preference.isEnabled() || !(preference instanceof ListPreference))
                continue;
            Dialog dialog = ((ListPreference)preference).getDialog();
            if (dialog != null && dialog.isShowing())
                dialog.dismiss();
        }

    }

    private void updatePreferenceList()
    {
        log("---------[update mutiple list views]---------");
        ((ListView)findViewById(0x102000a)).invalidateViews();
    }

    public void checkAllowedRun(Intent intent, Preference preference)
    {
        intent.getIntExtra("simId", 0);
        if (mPhone instanceof GeminiPhone)
        {
            GeminiPhone _tmp = (GeminiPhone)mPhone;
        }
    }

    public int getNetworkMode(int i, int j)
    {
        int k = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), getNetworkModeName(j), 0);
        int l = k;
        if (i != k)
            switch (i)
            {
            case 0: // '\0'
                l = 0;
                break;

            case 1: // '\001'
                l = 1;
                break;

            case 2: // '\002'
                l = 2;
                break;

            case 3: // '\003'
                l = 3;
                break;

            case 4: // '\004'
                l = 4;
                break;

            case 5: // '\005'
                l = 5;
                break;

            case 6: // '\006'
                l = 6;
                break;

            case 7: // '\007'
                l = 7;
                break;

            default:
                l = 0;
                break;
            }
        android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), getNetworkModeName(j), l);
        return l;
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        log((new StringBuilder()).append("onActivityResult: requestCode = ").append(i).append(", resultCode = ").append(j).toString());
        if (j != -1)
            return;
        switch (i)
        {
        default:
            return;

        case 3021: 
            break;
        }
        Bitmap bitmap = (Bitmap)intent.getParcelableExtra("data");
        if (bitmap == null) goto _L2; else goto _L1
_L1:
        if (mVTWhichToSave != 0) goto _L4; else goto _L3
_L3:
        VTCallUtils.saveMyBitmap(VTAdvancedSetting.getPicPathUserselect(mVTSimId), bitmap);
_L5:
        if (!bitmap.isRecycled())
            bitmap.recycle();
_L2:
        IOException ioexception;
        if (mVTWhichToSave == 0)
        {
            showDialogPic(VTAdvancedSetting.getPicPathUserselect(mVTSimId), 200);
            return;
        } else
        {
            showDialogPic(VTAdvancedSetting.getPicPathUserselect2(mVTSimId), 200);
            return;
        }
_L4:
        VTCallUtils.saveMyBitmap(VTAdvancedSetting.getPicPathUserselect2(mVTSimId), bitmap);
          goto _L5
        ioexception;
        ioexception.printStackTrace();
          goto _L2
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mSimIds = getIntent().getLongArrayExtra("INIT_SIM_ID");
        mTargetClass = getIntent().getStringExtra("TARGET_CLASS");
        mFeatureName = getIntent().getStringExtra("INIT_FEATURE_NAME");
        mBaseKey = getIntent().getStringExtra("INIT_BASE_KEY");
        mTitleName = getIntent().getIntExtra("INIT_TITLE_NAME", -1);
        mListTitle = getIntent().getIntExtra("LIST_TITLE_NAME", -1);
        mListEntries = getIntent().getIntExtra("INIT_ARRAY", -1);
        mListValues = getIntent().getIntExtra("INIT_ARRAY_VALUE", -1);
        String s = getIntent().getStringExtra("ITEM_TYPE");
        if (s != null)
            mItemType = s;
        mPhone = PhoneGlobals.getPhone();
        mTelephonyManagerEx = new TelephonyManagerEx(this);
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManager.listen(mPhoneStateListener, 32);
        setSimList();
        skipUsIfNeeded();
        addPreferencesFromResource(0x7f060015);
        createSubItems();
        mExtension = ExtensionManager.getInstance().getSettingsExtension();
        mExtension.removeNMOpForMultiSim(mPhone, mSimList, mTargetClass);
        mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        mIntentFilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        mIntentFilter.addAction("android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        mIntentFilter.addAction("android.intent.action.DUAL_SIM_MODE");
        if ("NETWORK_MODE".equals(mFeatureName))
            mIntentFilter.addAction("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE");
        registerReceiver(mReceiver, mIntentFilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public Dialog onCreateDialog(int i)
    {
        log((new StringBuilder()).append("[onCreateDialog][").append(i).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[mBitmap = ").append(mBitmap).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[mImage = ").append(mImage).append("]").toString());
        if (mBitmap != null && mImage != null)
        {
            Object obj = null;
            switch (i)
            {
            case 300: 
                obj = (new android.app.AlertDialog.Builder(this)).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                    final MultipleSimActivity this$0;

                    public void onClick(DialogInterface dialoginterface, int j)
                    {
                    }

            
            {
                this$0 = MultipleSimActivity.this;
                super();
            }
                }
).create();
                ((AlertDialog)obj).setView(mImage);
                ((Dialog) (obj)).setTitle(getResources().getString(0x7f0d002f));
                ((AlertDialog) (obj)).setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

                    final MultipleSimActivity this$0;

                    public void onDismiss(DialogInterface dialoginterface)
                    {
                        mImage.setImageBitmap(null);
                        if (!mBitmap.isRecycled())
                            mBitmap.recycle();
                        removeDialog(300);
                    }

            
            {
                this$0 = MultipleSimActivity.this;
                super();
            }
                }
);
                break;

            case 200: 
                obj = (new android.app.AlertDialog.Builder(this)).setPositiveButton(0x7f0d003a, new android.content.DialogInterface.OnClickListener() {

                    final MultipleSimActivity this$0;

                    public void onClick(DialogInterface dialoginterface, int j)
                    {
                        try
                        {
                            Intent intent = new Intent("android.intent.action.GET_CONTENT", null);
                            intent.setType("image/*");
                            intent.putExtra("crop", "true");
                            intent.putExtra("aspectX", 1);
                            intent.putExtra("aspectY", 1);
                            intent.putExtra("outputX", getResources().getInteger(0x7f0b0004));
                            intent.putExtra("outputY", getResources().getInteger(0x7f0b0005));
                            intent.putExtra("return-data", true);
                            intent.putExtra("scaleUpIfNeeded", true);
                            startActivityForResult(intent, 3021);
                            return;
                        }
                        catch (ActivityNotFoundException activitynotfoundexception)
                        {
                            log("Pictrue not found , Gallery ActivityNotFoundException !");
                        }
                    }

            
            {
                this$0 = MultipleSimActivity.this;
                super();
            }
                }
).setNegativeButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                    final MultipleSimActivity this$0;

                    public void onClick(DialogInterface dialoginterface, int j)
                    {
                    }

            
            {
                this$0 = MultipleSimActivity.this;
                super();
            }
                }
).create();
                ((AlertDialog)obj).setView(mImage);
                ((Dialog) (obj)).setTitle(getResources().getString(0x7f0d0031));
                ((AlertDialog) (obj)).setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

                    final MultipleSimActivity this$0;

                    public void onDismiss(DialogInterface dialoginterface)
                    {
                        mImage.setImageBitmap(null);
                        if (!mBitmap.isRecycled())
                            mBitmap.recycle();
                        removeDialog(200);
                    }

            
            {
                this$0 = MultipleSimActivity.this;
                super();
            }
                }
);
                break;

            case 100: // 'd'
                obj = new ProgressDialog(this);
                ((ProgressDialog)obj).setMessage(getText(0x7f0d01df));
                ((ProgressDialog)obj).setCancelable(false);
                ((ProgressDialog)obj).setIndeterminate(true);
                break;
            }
            ((AlertDialog) (obj)).show();
            return ((Dialog) (obj));
        } else
        {
            return null;
        }
    }

    protected void onDestroy()
    {
        super.onDestroy();
        if (mPreCheckForRunning != null)
            mPreCheckForRunning.deRegister();
        unregisterReceiver(mReceiver);
        if (mTelephonyManager != null)
            mTelephonyManager.listen(mPhoneStateListener, 0);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        int i = ((Integer)mPref2CardSlot.get(preference)).intValue();
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[slotId = ").append(i).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[newValue = ").append(obj).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[key = ").append(preference.getKey()).append("]").toString());
        Xlog.d("MultipleSimActivity", (new StringBuilder()).append("[mFeatureName = ").append(mFeatureName).append("]").toString());
        if ("VT".equals(mFeatureName))
        {
            VTCallUtils.checkVTFile(i);
            if (String.valueOf((new StringBuilder()).append("button_vt_replace_expand_key_").append(i).toString()).equals(preference.getKey()))
            {
                mVTWhichToSave = 0;
                mVTSimId = i;
                if (obj.toString().equals("0"))
                    showDialogPic(VTAdvancedSetting.getPicPathDefault(), 300);
                else
                if (obj.toString().equals("2"))
                {
                    showDialogPic(VTAdvancedSetting.getPicPathUserselect(i), 200);
                    return true;
                }
            } else
            if (String.valueOf((new StringBuilder()).append("button_vt_replace_peer_expand_key_").append(i).toString()).equals(preference.getKey()))
            {
                mVTSimId = i;
                mVTWhichToSave = 1;
                if (obj.toString().equals("0"))
                {
                    showDialogPic(VTAdvancedSetting.getPicPathDefault2(), 300);
                    return true;
                }
                if (obj.toString().equals("1"))
                {
                    showDialogPic(VTAdvancedSetting.getPicPathUserselect2(i), 200);
                    return true;
                }
            }
        } else
        if ("NETWORK_MODE".equals(mFeatureName))
        {
            int j = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), getNetworkModeName(i), 0);
            log((new StringBuilder()).append("Current network mode = ").append(j).toString());
            int k = getNetworkMode(Integer.valueOf((String)obj).intValue(), i);
            log((new StringBuilder()).append("new network mode = ").append(k).toString());
            if (j != k)
            {
                Intent intent = new Intent("com.android.phone.NETWORK_MODE_CHANGE", null);
                intent.putExtra("com.android.phone.OLD_NETWORK_MODE", j);
                intent.putExtra("com.android.phone.NETWORK_MODE_CHANGE", k);
                intent.putExtra("simId", i);
                showDialog(100);
                sendBroadcast(intent);
                return true;
            }
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        PreferenceScreen preferencescreen1 = getPreferenceScreen();
        boolean flag = mPhone instanceof GeminiPhone;
        GeminiPhone geminiphone = null;
        if (flag)
            geminiphone = (GeminiPhone)mPhone;
        for (int i = 0; i < preferencescreen1.getPreferenceCount(); i++)
        {
            if (preference != preferencescreen1.getPreference(i) || mTargetClass == null || geminiphone == null)
                continue;
            int j = ((Integer)mPref2CardSlot.get(preference)).intValue();
            if (!geminiphone.isRadioOnGemini(j))
                continue;
            Intent intent = new Intent();
            int k = mTargetClass.lastIndexOf('.');
            String s = mTargetClass.substring(0, k).replace("com.mediatek.settings", "com.android.phone");
            intent.setClassName(s, mTargetClass);
            intent.setAction("android.intent.action.MAIN");
            intent.putExtra("simId", j);
            intent.putExtra("sub_title_name", android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, j).mDisplayName);
            if (mFeatureName != null && mFeatureName.equals("VT"))
                intent.putExtra("ISVT", true);
            intent.setClassName(s, mTargetClass);
            checkToStart(j, intent);
        }

        return false;
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        log("-----------[onRestoreInstanceState]-----------");
        super.onRestoreInstanceState(bundle);
        mTitleName = bundle.getInt("INIT_TITLE_NAME", -1);
        mListTitle = bundle.getInt("LIST_TITLE_NAME", -1);
        mListEntries = bundle.getInt("INIT_ARRAY", -1);
        mListValues = bundle.getInt("INIT_ARRAY_VALUE", -1);
    }

    public void onResume()
    {
        super.onResume();
        updatePreferenceList();
        updatePreferenceEnableState();
        if (mTitleName > 0)
            setTitle(mTitleName);
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        log("-----------[onSaveInstanceState]-----------");
        super.onSaveInstanceState(bundle);
        bundle.putInt("INIT_TITLE_NAME", mTitleName);
        bundle.putInt("LIST_TITLE_NAME", mListTitle);
        bundle.putInt("INIT_ARRAY", mListEntries);
        bundle.putInt("INIT_ARRAY_VALUE", mListValues);
    }














}
