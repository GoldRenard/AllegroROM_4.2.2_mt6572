// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gsm.NetworkInfoWithAcT;
import com.android.phone.TimeConsumingPreferenceActivity;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.settings:
//            NetworkEditor, CallSettings

public class PLMNListPreference extends TimeConsumingPreferenceActivity
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_PLMN_CAPIBILITY = 2;
        private static final int MESSAGE_GET_PLMN_LIST = 0;
        private static final int MESSAGE_SET_PLMN_LIST = 1;
        final PLMNListPreference this$0;

        public void handleGetPLMNCapibilityResponse(Message message)
        {
            Xlog.d("Settings/PLMNListPreference", "handleGetPLMNCapibilityResponse: done");
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
            {
                Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("handleGetPLMNCapibilityResponse with exception = ").append(asyncresult.exception).toString());
                return;
            } else
            {
                mCapability.setCapability((int[])(int[])asyncresult.result);
                return;
            }
        }

        public void handleGetPLMNResponse(Message message)
        {
            Xlog.d("Settings/PLMNListPreference", "handleGetPLMNResponse: done");
            if (message.arg2 == 0)
                onFinished(mPLMNListContainer, true);
            else
                onFinished(mPLMNListContainer, false);
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
            {
                Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("handleGetPLMNResponse with exception = ").append(asyncresult.exception).toString());
                if (mPLMNList == null)
                    mPLMNList = new ArrayList();
                return;
            } else
            {
                refreshPreference((ArrayList)asyncresult.result);
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 2: // '\002'
                handleGetPLMNCapibilityResponse(message);
                return;

            case 1: // '\001'
                handleSetPLMNResponse(message);
                return;

            case 0: // '\0'
                handleGetPLMNResponse(message);
                return;
            }
        }

        public void handleSetPLMNResponse(Message message)
        {
label0:
            {
                Xlog.d("Settings/PLMNListPreference", "handleSetPLMNResponse: done");
                int i = ((append) (this)).append;
                AsyncResult asyncresult = (AsyncResult)message.obj;
                if (asyncresult.exception != null)
                    Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("handleSetPLMNResponse with exception = ").append(asyncresult.exception).toString());
                else
                    Xlog.d("Settings/PLMNListPreference", "handleSetPLMNResponse: with OK result!");
                if (mNumbers == 0)
                {
                    if (!CallSettings.isMultipleSim())
                        break label0;
                    ((GeminiPhone)mPhone).getPreferedOperatorListGemini(mSlotId, mHandler.obtainMessage(0, mSlotId, 1));
                }
                return;
            }
            mPhone.getPreferedOperatorList(mHandler.obtainMessage(0, mSlotId, 1));
        }

        private MyHandler()
        {
            this$0 = PLMNListPreference.this;
            super();
        }

    }

    class NetworkCompare
        implements Comparator
    {

        final PLMNListPreference this$0;

        public int compare(NetworkInfoWithAcT networkinfowithact, NetworkInfoWithAcT networkinfowithact1)
        {
            return networkinfowithact.getPriority() - networkinfowithact1.getPriority();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((NetworkInfoWithAcT)obj, (NetworkInfoWithAcT)obj1);
        }

        NetworkCompare()
        {
            this$0 = PLMNListPreference.this;
            super();
        }
    }

    private class SIMCapability
    {

        int mFirstFormat;
        int mFirstIndex;
        int mLastFormat;
        int mLastIndex;
        final PLMNListPreference this$0;

        public void setCapability(int ai[])
        {
            if (ai.length < 4)
            {
                return;
            } else
            {
                mFirstIndex = ai[0];
                mLastIndex = ai[1];
                mFirstFormat = ai[2];
                mLastFormat = ai[3];
                return;
            }
        }

        public SIMCapability(int i, int j, int k, int l)
        {
            this$0 = PLMNListPreference.this;
            super();
            mFirstIndex = i;
            mLastIndex = j;
            mFirstFormat = k;
            mLastFormat = l;
        }
    }


    private static final String BUTTON_PLMN_LIST_KEY = "button_plmn_list_key";
    private static final boolean DBG = true;
    private static final String LOG_TAG = "Settings/PLMNListPreference";
    private static final int MENU_ADD = 1;
    private static final int REQUEST_ADD = 100;
    private static final int REQUEST_EDIT = 200;
    private boolean mAirplaneModeEnabled;
    private SIMCapability mCapability;
    private int mDualSimMode;
    private MyHandler mHandler;
    private IntentFilter mIntentFilter;
    ArrayList mListPriority;
    ArrayList mListService;
    private int mNumbers;
    private NetworkInfoWithAcT mOldInfo;
    private List mPLMNList;
    private PreferenceScreen mPLMNListContainer;
    private Phone mPhone;
    private PhoneStateListener mPhoneStateListener;
    private Map mPreferenceMap;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final PLMNListPreference this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                setScreenEnabled();
            } else
            {
                if (s.equals("android.intent.action.DUAL_SIM_MODE"))
                {
                    mDualSimMode = intent.getIntExtra("mode", -1);
                    setScreenEnabled();
                    return;
                }
                if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("Settings/PLMNListPreference", "ACTION_SIM_INFO_UPDATE received");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(PLMNListPreference.this);
                    if (list.size() == 0 || list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot != mSlotId)
                    {
                        Xlog.d("Settings/PLMNListPreference", "Activity finished");
                        CallSettings.goToMobileNetworkSettings(PLMNListPreference.this);
                        return;
                    }
                } else
                if (s.equals("android.intent.action.SIM_STATE_CHANGED"))
                {
                    Xlog.d("Settings/PLMNListPreference", "ACTION_SIM_STATE_CHANGED received");
                    if (!isSimStateReady(mSlotId))
                    {
                        Xlog.d("Settings/PLMNListPreference", "Activity finished");
                        CallSettings.goToMobileNetworkSettings(PLMNListPreference.this);
                        return;
                    }
                }
            }
        }

            
            {
                this$0 = PLMNListPreference.this;
                super();
            }
    }
;
    private int mSlotId;
    private TelephonyManager mTelephonyManager;

    public PLMNListPreference()
    {
        mNumbers = 0;
        mSlotId = 0;
        mPhone = null;
        mCapability = new SIMCapability(0, 0, 0, 0);
        mPreferenceMap = new LinkedHashMap();
        mHandler = new MyHandler();
        mListPriority = new ArrayList();
        mListService = new ArrayList();
        mAirplaneModeEnabled = false;
        mDualSimMode = -1;
        mPhoneStateListener = new PhoneStateListener() {

            final PLMNListPreference this$0;

            public void onCallStateChanged(int i, String s)
            {
                super.onCallStateChanged(i, s);
                Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("onCallStateChanged ans state is ").append(i).toString());
                switch (i)
                {
                case 0: // '\0'
                    setScreenEnabled();
                    return;
                }
            }

            
            {
                this$0 = PLMNListPreference.this;
                super();
            }
        }
;
    }

    private void addPLMNPreference(NetworkInfoWithAcT networkinfowithact)
    {
        Preference preference = new Preference(this);
        String s = networkinfowithact.getOperatorAlphaName();
        String s1 = getNWString(networkinfowithact.getAccessTechnology());
        preference.setTitle((new StringBuilder()).append(s).append("(").append(s1).append(")").toString());
        mPLMNListContainer.addPreference(preference);
        mPreferenceMap.put(preference, networkinfowithact);
    }

    private void adjustPriority(ArrayList arraylist)
    {
        int i = 0;
        for (Iterator iterator = arraylist.iterator(); iterator.hasNext();)
        {
            NetworkInfoWithAcT networkinfowithact = (NetworkInfoWithAcT)iterator.next();
            int j = i + 1;
            networkinfowithact.setPriority(i);
            i = j;
        }

    }

    private NetworkInfoWithAcT createNetworkInfo(Intent intent)
    {
        String s = intent.getStringExtra("plmn_code");
        String s1 = intent.getStringExtra("plmn_name");
        int i = intent.getIntExtra("plmn_priority", 0);
        return new NetworkInfoWithAcT(s1, s, intent.getIntExtra("plmn_service", 0), i);
    }

    private void dumpNetworkInfo(List list)
    {
        Xlog.d("Settings/PLMNListPreference", "dumpNetworkInfo : **********start*******");
        for (int i = 0; i < list.size(); i++)
            Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("dumpNetworkInfo : ").append(((NetworkInfoWithAcT)list.get(i)).toString()).toString());

        Xlog.d("Settings/PLMNListPreference", "dumpNetworkInfo : ***********stop*******");
    }

    private void extractInfoFromNetworkInfo(Intent intent, NetworkInfoWithAcT networkinfowithact)
    {
        intent.putExtra("plmn_code", networkinfowithact.getOperatorNumeric());
        intent.putExtra("plmn_name", networkinfowithact.getOperatorAlphaName());
        intent.putExtra("plmn_priority", networkinfowithact.getPriority());
        intent.putExtra("plmn_service", networkinfowithact.getAccessTechnology());
        intent.putExtra("plmn_add", false);
        intent.putExtra("plmn_size", mPLMNList.size());
        intent.putExtra("plmn_slot", mSlotId);
    }

    private ArrayList genDelete(NetworkInfoWithAcT networkinfowithact)
    {
        Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("genDelete : ").append(networkinfowithact.toString()).toString());
        dumpNetworkInfo(mPLMNList);
        ArrayList arraylist = new ArrayList();
        NetworkCompare networkcompare = new NetworkCompare();
        int i = Collections.binarySearch(mPLMNList, networkinfowithact, networkcompare);
        for (int j = 0; j < mPLMNList.size(); j++)
            arraylist.add(mPLMNList.get(j));

        arraylist.remove(i);
        networkinfowithact.setOperatorNumeric(null);
        arraylist.add(networkinfowithact);
        for (int k = arraylist.size(); k < 1 + mCapability.mLastIndex; k++)
            arraylist.add(new NetworkInfoWithAcT("", null, 1, k));

        adjustPriority(arraylist);
        dumpNetworkInfo(arraylist);
        return arraylist;
    }

    private ArrayList genModifyEx(NetworkInfoWithAcT networkinfowithact, NetworkInfoWithAcT networkinfowithact1)
    {
        Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("genModifyEx: change : ").append(networkinfowithact1.toString()).append("----> ").append(networkinfowithact.toString()).toString());
        dumpNetworkInfo(mPLMNList);
        NetworkCompare networkcompare = new NetworkCompare();
        int i = Collections.binarySearch(mPLMNList, networkinfowithact1, networkcompare);
        int j = Collections.binarySearch(mPLMNList, networkinfowithact, networkcompare);
        ArrayList arraylist = new ArrayList();
        if (networkinfowithact.getPriority() == networkinfowithact1.getPriority())
        {
            arraylist.add(networkinfowithact);
            dumpNetworkInfo(arraylist);
            return arraylist;
        }
        for (int k = 0; k < mPLMNList.size(); k++)
            arraylist.add(mPLMNList.get(k));

        if (j < 0)
        {
            arraylist.add(getPosition(mPLMNList, networkinfowithact), networkinfowithact);
            dumpNetworkInfo(arraylist);
            return arraylist;
        }
        if (i > j)
        {
            arraylist.remove(i);
            arraylist.add(j, networkinfowithact);
        } else
        if (i < j)
        {
            arraylist.add(j + 1, networkinfowithact);
            arraylist.remove(i);
            int _tmp = j - 1;
        } else
        {
            arraylist.remove(i);
            arraylist.add(i, networkinfowithact);
        }
        adjustPriority(arraylist);
        dumpNetworkInfo(arraylist);
        return arraylist;
    }

    private String getNWString(int i)
    {
        int j = NetworkEditor.covertRilNW2Ap(i);
        if ((8 & NetworkEditor.getBaseBand()) == 0)
            return getResources().getStringArray(0x7f07001b)[j];
        else
            return getResources().getStringArray(0x7f07001c)[j];
    }

    private int getPosition(List list, NetworkInfoWithAcT networkinfowithact)
    {
        int i = -1;
        if (list != null && list.size() != 0)
        {
            if (list.size() == 1)
                return ((NetworkInfoWithAcT)list.get(0)).getPriority() <= networkinfowithact.getPriority() ? 1 : 0;
            if (list.size() < 0 && ((NetworkInfoWithAcT)list.get(0)).getPriority() > networkinfowithact.getPriority())
                if (true)
                    i = 0;
                else
                    i = 0 - 1;
            if (i == -1)
                i = list.size();
            return i;
        } else
        {
            return 0;
        }
    }

    private void getSIMCapability()
    {
        if (CallSettings.isMultipleSim())
        {
            ((GeminiPhone)mPhone).getPOLCapabilityGemini(mSlotId, mHandler.obtainMessage(2, mSlotId, 2));
            return;
        } else
        {
            mPhone.getPOLCapability(mHandler.obtainMessage(2, mSlotId, 2));
            return;
        }
    }

    private void handlePLMNListAdd(NetworkInfoWithAcT networkinfowithact)
    {
        Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("handlePLMNListAdd: add new network: ").append(networkinfowithact).toString());
        dumpNetworkInfo(mPLMNList);
        ArrayList arraylist = new ArrayList();
        for (int i = 0; i < mPLMNList.size(); i++)
            arraylist.add(mPLMNList.get(i));

        NetworkCompare networkcompare = new NetworkCompare();
        int j = Collections.binarySearch(mPLMNList, networkinfowithact, networkcompare);
        int k = -1;
        if (j < 0)
            k = getPosition(mPLMNList, networkinfowithact);
        if (k == -1)
            arraylist.add(j, networkinfowithact);
        else
            arraylist.add(k, networkinfowithact);
        adjustPriority(arraylist);
        dumpNetworkInfo(arraylist);
        handleSetPLMN(arraylist);
    }

    private void handleSetPLMN(ArrayList arraylist)
    {
        mNumbers = arraylist.size();
        setDialogTitle(getTitle());
        onStarted(mPLMNListContainer, false);
        for (int i = 0; i < arraylist.size(); i++)
        {
            NetworkInfoWithAcT networkinfowithact = (NetworkInfoWithAcT)arraylist.get(i);
            if (CallSettings.isMultipleSim())
            {
                ((GeminiPhone)mPhone).setPOLEntryGemini(mSlotId, networkinfowithact, mHandler.obtainMessage(1, mSlotId, 1));
            } else
            {
                mPhone.setPOLEntry(networkinfowithact, mHandler.obtainMessage(1, mSlotId, 1));
                Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("handleSetPLMN: ").append(networkinfowithact.toString()).toString());
            }
        }

    }

    private void init(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag, int i)
    {
        Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("init with simSlot = ").append(i).toString());
        if (CallSettings.isMultipleSim())
        {
            mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
            Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("Settings.onResume(), mDualSimMode=").append(mDualSimMode).toString());
        }
        if (!flag)
        {
            if (CallSettings.isMultipleSim())
                ((GeminiPhone)mPhone).getPreferedOperatorListGemini(i, mHandler.obtainMessage(0, i, 0));
            else
                mPhone.getPreferedOperatorList(mHandler.obtainMessage(0, i, 0));
            if (timeconsumingpreferencelistener != null)
            {
                setDialogTitle(getTitle());
                timeconsumingpreferencelistener.onStarted(mPLMNListContainer, true);
            }
        }
    }

    private boolean isSimStateReady(int i)
    {
        boolean flag;
        if (CallSettings.isMultipleSim())
        {
            if (5 == TelephonyManagerEx.getDefault().getSimState(i))
                flag = true;
            else
                flag = false;
        } else
        if (5 == TelephonyManager.getDefault().getSimState())
            flag = true;
        else
            flag = false;
        Log.d("Settings/PLMNListPreference", (new StringBuilder()).append("isSimStateReady isSimStateReady: ").append(flag).toString());
        return flag;
    }

    private void refreshPreference(ArrayList arraylist)
    {
        if (mPLMNListContainer.getPreferenceCount() != 0)
            mPLMNListContainer.removeAll();
        if (mPreferenceMap != null)
            mPreferenceMap.clear();
        if (mPLMNList != null)
            mPLMNList.clear();
        mPLMNList = arraylist;
        if (arraylist != null && arraylist.size() != 0)
        {
            Collections.sort(arraylist, new NetworkCompare());
            NetworkInfoWithAcT networkinfowithact;
            for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); Xlog.d("Settings/PLMNListPreference", networkinfowithact.toString()))
            {
                networkinfowithact = (NetworkInfoWithAcT)iterator.next();
                addPLMNPreference(networkinfowithact);
            }

        } else
        {
            Xlog.d("Settings/PLMNListPreference", "refreshPreference : NULL PLMN list!");
            if (arraylist == null)
                mPLMNList = new ArrayList();
        }
    }

    private void setScreenEnabled()
    {
        boolean flag;
        if (mTelephonyManager.getCallState() == 0)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (flag && !mAirplaneModeEnabled && mDualSimMode != 0)
            flag1 = true;
        else
            flag1 = false;
        getPreferenceScreen().setEnabled(flag1);
        invalidateOptionsMenu();
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("resultCode = ").append(j).toString());
        Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("requestCode = ").append(i).toString());
        if (intent != null && isSimStateReady(mSlotId))
        {
            NetworkInfoWithAcT networkinfowithact = createNetworkInfo(intent);
            if (j == 200)
                handleSetPLMN(genDelete(mOldInfo));
            else
            if (j == 100)
            {
                if (i == 100)
                {
                    handlePLMNListAdd(networkinfowithact);
                    return;
                }
                if (i == 200)
                {
                    handleSetPLMN(genModifyEx(networkinfowithact, mOldInfo));
                    return;
                }
            }
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060019);
        mPLMNListContainer = (PreferenceScreen)findPreference("button_plmn_list_key");
        mPhone = PhoneFactory.getDefaultPhone();
        mSlotId = getIntent().getIntExtra("simId", 0);
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManager.listen(mPhoneStateListener, 32);
        mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        if (CallSettings.isMultipleSim())
            mIntentFilter.addAction("android.intent.action.DUAL_SIM_MODE");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        mIntentFilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        registerReceiver(mReceiver, mIntentFilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        menu.add(0, 1, 0, 0x7f0d0123).setShowAsAction(1);
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
        if (mTelephonyManager != null)
            mTelephonyManager.listen(mPhoneStateListener, 0);
    }

    public void onFinished(Preference preference, boolean flag)
    {
        super.onFinished(preference, flag);
        setScreenEnabled();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;

        case 1: // '\001'
            Intent intent = new Intent(this, com/mediatek/settings/NetworkEditor);
            intent.putExtra("plmn_name", "");
            intent.putExtra("plmn_code", "");
            intent.putExtra("plmn_priority", 0);
            intent.putExtra("plmn_service", 0);
            intent.putExtra("plmn_add", true);
            intent.putExtra("plmn_size", mPLMNList.size());
            intent.putExtra("plmn_slot", mSlotId);
            startActivityForResult(intent, 100);
            break;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        Intent intent = new Intent(this, com/mediatek/settings/NetworkEditor);
        NetworkInfoWithAcT networkinfowithact = (NetworkInfoWithAcT)mPreferenceMap.get(preference);
        if (networkinfowithact == null)
        {
            return false;
        } else
        {
            mOldInfo = networkinfowithact;
            extractInfoFromNetworkInfo(intent, networkinfowithact);
            startActivityForResult(intent, 200);
            return true;
        }
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        boolean flag;
        if (mTelephonyManager.getCallState() == 0)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (flag && !mAirplaneModeEnabled && mDualSimMode != 0)
            flag1 = true;
        else
            flag1 = false;
        if (menu != null)
            menu.setGroupEnabled(0, flag1);
        return super.onPrepareOptionsMenu(menu);
    }

    public void onResume()
    {
        boolean flag = true;
        super.onResume();
        getSIMCapability();
        init(this, false, mSlotId);
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) != flag)
            flag = false;
        mAirplaneModeEnabled = flag;
        if (CallSettings.isMultipleSim())
        {
            mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
            Xlog.d("Settings/PLMNListPreference", (new StringBuilder()).append("Settings.onResume(), mDualSimMode=").append(mDualSimMode).toString());
        }
    }






/*
    static boolean access$202(PLMNListPreference plmnlistpreference, boolean flag)
    {
        plmnlistpreference.mAirplaneModeEnabled = flag;
        return flag;
    }

*/


/*
    static int access$302(PLMNListPreference plmnlistpreference, int i)
    {
        plmnlistpreference.mDualSimMode = i;
        return i;
    }

*/






/*
    static List access$702(PLMNListPreference plmnlistpreference, List list)
    {
        plmnlistpreference.mPLMNList = list;
        return list;
    }

*/




/*
    static int access$910(PLMNListPreference plmnlistpreference)
    {
        int i = plmnlistpreference.mNumbers;
        plmnlistpreference.mNumbers = i - 1;
        return i;
    }

*/
}
