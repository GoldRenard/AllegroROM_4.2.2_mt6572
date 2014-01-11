// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone.sip;

import android.app.ActionBar;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.sip.*;
import android.os.Bundle;
import android.os.Process;
import android.preference.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import com.android.internal.telephony.CallManager;
import com.android.phone.SipUtil;
import java.io.IOException;
import java.util.*;

// Referenced classes of package com.android.phone.sip:
//            SipSharedPreferences, SipProfileDb, SipEditor

public class SipSettings extends PreferenceActivity
{
    private class SipPreference extends Preference
    {

        SipProfile mProfile;
        final SipSettings this$0;

        void setProfile(SipProfile sipprofile)
        {
            mProfile = sipprofile;
            setTitle(getProfileName(sipprofile));
            String s;
            if (mSipSharedPreferences.isReceivingCallsEnabled())
                s = getString(0x7f0d033c);
            else
                s = getString(0x7f0d033f);
            updateSummary(s);
        }

        void updateSummary(String s)
        {
            int i = mProfile.getCallingUid();
            boolean flag = mProfile.getUriString().equals(mSipSharedPreferences.getPrimaryAccount());
            Log.v("SipSettings", (new StringBuilder()).append("profile uid is ").append(i).append(" isPrimary:").append(flag).append(" registration:").append(s).append(" Primary:").append(mSipSharedPreferences.getPrimaryAccount()).append(" status:").append(s).toString());
            String s1;
            if (i > 0 && i != mUid)
            {
                SipSettings sipsettings = SipSettings.this;
                Object aobj[] = new Object[1];
                aobj[0] = getPackageNameFromUid(i);
                s1 = sipsettings.getString(0x7f0d0347, aobj);
            } else
            if (flag)
                s1 = getString(0x7f0d033b, new Object[] {
                    s
                });
            else
                s1 = s;
            setSummary(s1);
        }

        SipPreference(Context context, SipProfile sipprofile)
        {
            this$0 = SipSettings.this;
            super(context);
            setProfile(sipprofile);
        }
    }


    private static final String BUTTON_SIP_RECEIVE_CALLS = "sip_receive_calls_key";
    static final String KEY_SIP_PROFILE = "sip_profile";
    private static final int MENU_ADD_ACCOUNT = 1;
    private static final String PREF_SIP_LIST = "sip_account_list";
    private static final int REQUEST_ADD_OR_EDIT_SIP_PROFILE = 1;
    public static final String SIP_SHARED_PREFERENCES = "SIP_PREFERENCES";
    private static final String TAG = "SipSettings";
    private CheckBoxPreference mButtonSipReceiveCalls;
    private CallManager mCallManager;
    private PackageManager mPackageManager;
    private SipProfile mProfile;
    private SipProfileDb mProfileDb;
    private PreferenceCategory mSipListContainer;
    private SipManager mSipManager;
    private Map mSipPreferenceMap;
    private List mSipProfileList;
    private SipSharedPreferences mSipSharedPreferences;
    private int mUid;

    public SipSettings()
    {
        mUid = Process.myUid();
    }

    private void addPreferenceFor(SipProfile sipprofile)
    {
        Log.v("SipSettings", (new StringBuilder()).append("addPreferenceFor profile uri").append(sipprofile.getUri()).toString());
        SipPreference sippreference = new SipPreference(this, sipprofile);
        mSipPreferenceMap.put(sipprofile.getUriString(), sippreference);
        mSipListContainer.addPreference(sippreference);
        sippreference.setOnPreferenceClickListener(new android.preference.Preference.OnPreferenceClickListener() {

            final SipSettings this$0;

            public boolean onPreferenceClick(Preference preference)
            {
                handleProfileClick(((SipPreference)preference).mProfile);
                return true;
            }

            
            {
                this$0 = SipSettings.this;
                super();
            }
        }
);
    }

    private void addProfile(SipProfile sipprofile)
        throws IOException
    {
        try
        {
            mSipManager.setRegistrationListener(sipprofile.getUriString(), createRegistrationListener());
        }
        catch (Exception exception)
        {
            Log.e("SipSettings", "cannot set registration listener", exception);
        }
        mSipProfileList.add(sipprofile);
        addPreferenceFor(sipprofile);
    }

    private SipRegistrationListener createRegistrationListener()
    {
        return new SipRegistrationListener() {

            final SipSettings this$0;

            public void onRegistering(String s)
            {
                showRegistrationMessage(s, getString(0x7f0d033d));
            }

            public void onRegistrationDone(String s, long l)
            {
                showRegistrationMessage(s, getString(0x7f0d0343));
            }

            public void onRegistrationFailed(String s, int i, String s1)
            {
                switch (i)
                {
                case -4: 
                    showRegistrationMessage(s, getString(0x7f0d0342));
                    return;

                case -10: 
                    if (SipManager.isSipWifiOnly(getApplicationContext()))
                    {
                        showRegistrationMessage(s, getString(0x7f0d0341));
                        return;
                    } else
                    {
                        showRegistrationMessage(s, getString(0x7f0d0340));
                        return;
                    }

                case -12: 
                    showRegistrationMessage(s, getString(0x7f0d0346));
                    return;

                case -8: 
                    showRegistrationMessage(s, getString(0x7f0d0345));
                    return;

                case -9: 
                    showRegistrationMessage(s, getString(0x7f0d033e));
                    return;

                case -11: 
                case -7: 
                case -6: 
                case -5: 
                default:
                    showRegistrationMessage(s, getString(0x7f0d0344, new Object[] {
                        s1
                    }));
                    return;
                }
            }

            
            {
                this$0 = SipSettings.this;
                super();
            }
        }
;
    }

    private String getPackageNameFromUid(int i)
    {
        String s;
        try
        {
            String as[] = mPackageManager.getPackagesForUid(i);
            s = mPackageManager.getApplicationInfo(as[0], 0).loadLabel(mPackageManager).toString();
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.e("SipSettings", (new StringBuilder()).append("cannot find name of uid ").append(i).toString(), namenotfoundexception);
            return (new StringBuilder()).append("uid:").append(i).toString();
        }
        return s;
    }

    private SipProfile getProfileFromList(SipProfile sipprofile)
    {
        for (Iterator iterator = mSipProfileList.iterator(); iterator.hasNext();)
        {
            SipProfile sipprofile1 = (SipProfile)iterator.next();
            if (sipprofile1.getUriString().equals(sipprofile.getUriString()))
                return sipprofile1;
        }

        return null;
    }

    private String getProfileName(SipProfile sipprofile)
    {
        String s = sipprofile.getProfileName();
        if (TextUtils.isEmpty(s))
            s = (new StringBuilder()).append(sipprofile.getUserName()).append("@").append(sipprofile.getSipDomain()).toString();
        return s;
    }

    private void handleProfileClick(final SipProfile profile)
    {
        int i = profile.getCallingUid();
        if (i != mUid && i != 0)
        {
            (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0d0338).setIconAttribute(0x1010355).setPositiveButton(0x7f0d033a, new android.content.DialogInterface.OnClickListener() {

                final SipSettings this$0;
                final SipProfile val$profile;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    deleteProfile(profile);
                    unregisterProfile(profile);
                }

            
            {
                this$0 = SipSettings.this;
                profile = sipprofile;
                super();
            }
            }
).setNegativeButton(0x1040000, null).show();
            return;
        } else
        {
            startSipEditor(profile);
            return;
        }
    }

    private void handleSipReceiveCallsOption(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        Iterator iterator;
        mSipSharedPreferences.setReceivingCallsEnabled(flag);
        iterator = mProfileDb.retrieveSipProfileList().iterator();
_L1:
        String s;
        SipProfile sipprofile1;
        if (!iterator.hasNext())
            break MISSING_BLOCK_LABEL_133;
        SipProfile sipprofile = (SipProfile)iterator.next();
        s = sipprofile.getUriString();
        sipprofile1 = updateAutoRegistrationFlag(sipprofile, flag);
        if (!flag)
            break MISSING_BLOCK_LABEL_100;
        mSipManager.open(sipprofile1, SipUtil.createIncomingCallPendingIntent(), null);
          goto _L1
        Exception exception1;
        exception1;
        Log.e("SipSettings", "register failed", exception1);
          goto _L1
        Exception exception;
        exception;
        throw exception;
        mSipManager.close(s);
        if (mSipSharedPreferences.isPrimaryAccount(s))
            mSipManager.open(sipprofile1);
          goto _L1
        updateProfilesStatus();
        this;
        JVM INSTR monitorexit ;
    }

    private void processActiveProfilesFromSipService()
    {
        SipProfile asipprofile[] = mSipManager.getListOfProfiles();
        int i = asipprofile.length;
        for (int j = 0; j < i; j++)
        {
            SipProfile sipprofile = asipprofile[j];
            SipProfile sipprofile1 = getProfileFromList(sipprofile);
            if (sipprofile1 == null)
                mSipProfileList.add(sipprofile);
            else
                sipprofile1.setCallingUid(sipprofile.getCallingUid());
        }

    }

    private void registerForReceiveCallsCheckBox()
    {
        mButtonSipReceiveCalls = (CheckBoxPreference)findPreference("sip_receive_calls_key");
        mButtonSipReceiveCalls.setChecked(mSipSharedPreferences.isReceivingCallsEnabled());
        mButtonSipReceiveCalls.setOnPreferenceClickListener(new android.preference.Preference.OnPreferenceClickListener() {

            final SipSettings this$0;

            public boolean onPreferenceClick(Preference preference)
            {
                (new Thread(((CheckBoxPreference)preference).isChecked(). new Runnable() {

                    final _cls2 this$1;
                    final boolean val$enabled;

                    public void run()
                    {
                        handleSipReceiveCallsOption(enabled);
                    }

            
            {
                this$1 = final__pcls2;
                enabled = Z.this;
                super();
            }
                }
)).start();
                return true;
            }

            
            {
                this$0 = SipSettings.this;
                super();
            }
        }
);
    }

    private void retrieveSipLists()
    {
        mSipPreferenceMap = new LinkedHashMap();
        mSipProfileList = mProfileDb.retrieveSipProfileList();
        processActiveProfilesFromSipService();
        Collections.sort(mSipProfileList, new Comparator() {

            final SipSettings this$0;

            public int compare(SipProfile sipprofile1, SipProfile sipprofile2)
            {
                return getProfileName(sipprofile1).compareTo(getProfileName(sipprofile2));
            }

            public volatile int compare(Object obj, Object obj1)
            {
                return compare((SipProfile)obj, (SipProfile)obj1);
            }

            public boolean equals(SipProfile sipprofile1)
            {
                return false;
            }

            
            {
                this$0 = SipSettings.this;
                super();
            }
        }
);
        mSipListContainer.removeAll();
        for (Iterator iterator = mSipProfileList.iterator(); iterator.hasNext(); addPreferenceFor((SipProfile)iterator.next()));
        if (mSipSharedPreferences.isReceivingCallsEnabled())
        {
            Iterator iterator1 = mSipProfileList.iterator();
            while (iterator1.hasNext()) 
            {
                SipProfile sipprofile = (SipProfile)iterator1.next();
                if (mUid == sipprofile.getCallingUid())
                    try
                    {
                        mSipManager.setRegistrationListener(sipprofile.getUriString(), createRegistrationListener());
                    }
                    catch (SipException sipexception)
                    {
                        Log.e("SipSettings", "cannot set registration listener", sipexception);
                    }
            }
        }
    }

    private void showRegistrationMessage(final String profileUri, final String message)
    {
        runOnUiThread(new Runnable() {

            final SipSettings this$0;
            final String val$message;
            final String val$profileUri;

            public void run()
            {
                SipPreference sippreference = (SipPreference)mSipPreferenceMap.get(profileUri);
                if (sippreference != null)
                    sippreference.updateSummary(message);
            }

            
            {
                this$0 = SipSettings.this;
                profileUri = s;
                message = s1;
                super();
            }
        }
);
    }

    private void startSipEditor(SipProfile sipprofile)
    {
        mProfile = sipprofile;
        Intent intent = new Intent(this, com/android/phone/sip/SipEditor);
        intent.putExtra("sip_profile", sipprofile);
        startActivityForResult(intent, 1);
    }

    private void unregisterProfile(final SipProfile p)
    {
        (new Thread(new Runnable() {

            final SipSettings this$0;
            final SipProfile val$p;

            public void run()
            {
                try
                {
                    mSipManager.close(p.getUriString());
                    return;
                }
                catch (Exception exception)
                {
                    Log.e("SipSettings", "unregister failed, SipService died?", exception);
                }
            }

            
            {
                this$0 = SipSettings.this;
                p = sipprofile;
                super();
            }
        }
, "unregisterProfile")).start();
    }

    private SipProfile updateAutoRegistrationFlag(SipProfile sipprofile, boolean flag)
    {
        SipProfile sipprofile1 = (new android.net.sip.SipProfile.Builder(sipprofile)).setAutoRegistration(flag).build();
        try
        {
            mProfileDb.deleteProfile(sipprofile);
            mProfileDb.saveProfile(sipprofile1);
        }
        catch (Exception exception)
        {
            Log.e("SipSettings", "updateAutoRegistrationFlag error", exception);
            return sipprofile1;
        }
        return sipprofile1;
    }

    private void updateProfilesStatus()
    {
        (new Thread(new Runnable() {

            final SipSettings this$0;

            public void run()
            {
                com/android/phone/sip/SipSettings;
                JVM INSTR monitorenter ;
                retrieveSipLists();
                com/android/phone/sip/SipSettings;
                JVM INSTR monitorexit ;
                return;
                Exception exception1;
                exception1;
                com/android/phone/sip/SipSettings;
                JVM INSTR monitorexit ;
                try
                {
                    throw exception1;
                }
                catch (Exception exception)
                {
                    Log.e("SipSettings", "isRegistered", exception);
                }
                return;
            }

            
            {
                this$0 = SipSettings.this;
                super();
            }
        }
)).start();
    }

    void deleteProfile(SipProfile sipprofile)
    {
        mSipProfileList.remove(sipprofile);
        SipPreference sippreference = (SipPreference)mSipPreferenceMap.remove(sipprofile.getUriString());
        if (sippreference != null && mSipListContainer != null)
            mSipListContainer.removePreference(sippreference);
    }

    protected void onActivityResult(int i, final int resultCode, final Intent intent)
    {
        Log.v("SipSettings", (new StringBuilder()).append("onActivity Result:[requestCode=").append(i).append("]").append("[mProfile=").append(mProfile).append("]").toString());
        if (resultCode != -1 && resultCode != 1)
        {
            return;
        } else
        {
            (new Thread() {

                final SipSettings this$0;
                final Intent val$intent;
                final int val$resultCode;

                public void run()
                {
                    try
                    {
                        if (mProfile != null)
                        {
                            Log.v("SipSettings", (new StringBuilder()).append("Removed Profile:").append(mProfile.getProfileName()).toString());
                            deleteProfile(mProfile);
                        }
                        SipProfile sipprofile = (SipProfile)intent.getParcelableExtra("sip_profile");
                        if (resultCode == -1)
                        {
                            Log.v("SipSettings", (new StringBuilder()).append("New Profile Name:").append(sipprofile.getProfileName()).toString());
                            addProfile(sipprofile);
                        }
                        updateProfilesStatus();
                        return;
                    }
                    catch (IOException ioexception)
                    {
                        Log.v("SipSettings", (new StringBuilder()).append("Can not handle the profile : ").append(ioexception.getMessage()).toString());
                    }
                }

            
            {
                this$0 = SipSettings.this;
                intent = intent1;
                resultCode = i;
                super();
            }
            }
).start();
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mSipManager = SipManager.newInstance(this);
        mSipSharedPreferences = new SipSharedPreferences(this);
        mProfileDb = new SipProfileDb(this);
        mPackageManager = getPackageManager();
        setContentView(0x7f04003d);
        addPreferencesFromResource(0x7f06001e);
        mSipListContainer = (PreferenceCategory)findPreference("sip_account_list");
        registerForReceiveCallsCheckBox();
        mCallManager = CallManager.getInstance();
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        menu.add(0, 1, 0, 0x7f0d0331).setShowAsAction(1);
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterForContextMenu(getListView());
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 1: // '\001'
            startSipEditor(null);
            return true;

        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        boolean flag = true;
        Log.d("SipSettings", (new StringBuilder()).append("onPrepareOptionsMenu, callManager Idle = ").append(mCallManager.getState()).toString());
        MenuItem menuitem = menu.findItem(flag);
        if (mCallManager.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            flag = false;
        menuitem.setEnabled(flag);
        return super.onPrepareOptionsMenu(menu);
    }

    public void onResume()
    {
        super.onResume();
        Log.d("SipSettings", "onResume: start update the list");
        updateProfilesStatus();
        Log.d("SipSettings", (new StringBuilder()).append("onResume: finish update the list, callManager Idle = ").append(mCallManager.getState()).toString());
        if (mCallManager.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
            mButtonSipReceiveCalls.setEnabled(false);
        else
            mButtonSipReceiveCalls.setEnabled(true);
        invalidateOptionsMenu();
    }














}
