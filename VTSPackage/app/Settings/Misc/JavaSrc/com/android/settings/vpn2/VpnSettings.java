// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.vpn2;

import android.app.*;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.IConnectivityManager;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.security.Credentials;
import android.security.KeyStore;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.net.LegacyVpnInfo;
import com.android.internal.net.VpnProfile;
import com.android.settings.SettingsPreferenceFragment;
import com.google.android.collect.Lists;
import java.util.*;

// Referenced classes of package com.android.settings.vpn2:
//            VpnDialog

public class VpnSettings extends SettingsPreferenceFragment
    implements android.os.Handler.Callback, android.preference.Preference.OnPreferenceClickListener, android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener
{
    public static class LockdownConfigFragment extends DialogFragment
    {

        private int mCurrentIndex;
        private List mProfiles;
        private List mTitles;

        private static String getStringOrNull(KeyStore keystore, String s)
        {
            byte abyte0[] = keystore.get("LOCKDOWN_VPN");
            if (abyte0 == null)
                return null;
            else
                return new String(abyte0);
        }

        private void initProfiles(KeyStore keystore, Resources resources)
        {
            String s = getStringOrNull(keystore, "LOCKDOWN_VPN");
            mProfiles = VpnSettings.loadVpnProfiles(keystore, new int[] {
                0
            });
            mTitles = Lists.newArrayList();
            mTitles.add(resources.getText(0x7f0b08f3));
            mCurrentIndex = 0;
            VpnProfile vpnprofile;
            for (Iterator iterator = mProfiles.iterator(); iterator.hasNext(); mTitles.add(vpnprofile.name))
            {
                vpnprofile = (VpnProfile)iterator.next();
                if (TextUtils.equals(vpnprofile.key, s))
                    mCurrentIndex = mTitles.size();
            }

        }

        public static void show(VpnSettings vpnsettings)
        {
            if (!vpnsettings.isAdded())
            {
                return;
            } else
            {
                (new LockdownConfigFragment()).show(vpnsettings.getFragmentManager(), "lockdown");
                return;
            }
        }

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            final KeyStore keyStore = KeyStore.getInstance();
            initProfiles(keyStore, activity.getResources());
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            LayoutInflater layoutinflater = LayoutInflater.from(builder.getContext());
            builder.setTitle(0x7f0b08f1);
            View view = layoutinflater.inflate(0x7f04009d, null, false);
            final ListView listView = (ListView)view.findViewById(0x102000a);
            listView.setChoiceMode(1);
            listView.setAdapter(new TitleAdapter(activity, mTitles));
            listView.setItemChecked(mCurrentIndex, true);
            builder.setView(view);
            builder.setPositiveButton(0x104000a, activity. new android.content.DialogInterface.OnClickListener() {

                final LockdownConfigFragment this$0;
                final Context val$context;
                final KeyStore val$keyStore;
                final ListView val$listView;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    int j = listView.getCheckedItemPosition();
                    if (mCurrentIndex == j)
                        return;
                    if (j == 0)
                    {
                        keyStore.delete("LOCKDOWN_VPN");
                    } else
                    {
                        VpnProfile vpnprofile = (VpnProfile)mProfiles.get(j - 1);
                        if (!vpnprofile.isValidLockdownProfile())
                        {
                            Toast.makeText(context, 0x7f0b08f4, 1).show();
                            return;
                        }
                        keyStore.put("LOCKDOWN_VPN", vpnprofile.key.getBytes());
                    }
                    ConnectivityManager.from(getActivity()).updateLockdownVpn();
                }

            
            {
                this$0 = final_lockdownconfigfragment;
                listView = listview;
                keyStore = keystore;
                context = Context.this;
                super();
            }
            }
);
            return builder.create();
        }




    }

    private static class LockdownConfigFragment.TitleAdapter extends ArrayAdapter
    {

        public LockdownConfigFragment.TitleAdapter(Context context, List list)
        {
            super(context, 0x10900c7, 0x1020014, list);
        }
    }

    private static class VpnPreference extends Preference
    {

        private VpnProfile mProfile;
        private int mState;

        public int compareTo(Preference preference)
        {
            int i = -1;
            if (preference instanceof VpnPreference)
            {
                VpnPreference vpnpreference = (VpnPreference)preference;
                i = vpnpreference.mState - mState;
                if (i == 0)
                {
                    i = mProfile.name.compareTo(vpnpreference.mProfile.name);
                    if (i == 0)
                    {
                        i = mProfile.type - vpnpreference.mProfile.type;
                        if (i == 0)
                            i = mProfile.key.compareTo(vpnpreference.mProfile.key);
                    }
                }
            }
            return i;
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((Preference)obj);
        }

        VpnProfile getProfile()
        {
            return mProfile;
        }

        void update()
        {
            if (mState < 0)
                setSummary(getContext().getResources().getStringArray(0x7f070042)[mProfile.type]);
            else
                setSummary(getContext().getResources().getStringArray(0x7f070043)[mState]);
            setTitle(mProfile.name);
            notifyHierarchyChanged();
        }

        void update(int i)
        {
            mState = i;
            update();
        }

        void update(VpnProfile vpnprofile)
        {
            mProfile = vpnprofile;
            update();
        }

        VpnPreference(Context context, VpnProfile vpnprofile)
        {
            super(context);
            mState = -1;
            setPersistent(false);
            setOrder(0);
            mProfile = vpnprofile;
            update();
        }
    }


    private static final String TAG = "VpnSettings";
    private static final String TAG_LOCKDOWN = "lockdown";
    private VpnDialog mDialog;
    private LegacyVpnInfo mInfo;
    private final KeyStore mKeyStore = KeyStore.getInstance();
    private HashMap mPreferences;
    private String mSelectedKey;
    private final IConnectivityManager mService = android.net.IConnectivityManager.Stub.asInterface(ServiceManager.getService("connectivity"));
    private boolean mUnlocking;
    private Handler mUpdater;

    public VpnSettings()
    {
        mUnlocking = false;
        mPreferences = new HashMap();
    }

    private void connect(VpnProfile vpnprofile)
        throws Exception
    {
        try
        {
            mService.startLegacyVpn(vpnprofile);
            return;
        }
        catch (IllegalStateException illegalstateexception)
        {
            Toast.makeText(getActivity(), 0x7f0b08f5, 1).show();
        }
    }

    private void disconnect(String s)
    {
        if (mInfo == null || !s.equals(mInfo.key))
            break MISSING_BLOCK_LABEL_35;
        mService.prepareVpn("[Legacy VPN]", "[Legacy VPN]");
        return;
        Exception exception;
        exception;
    }

    private static transient List loadVpnProfiles(KeyStore keystore, int ai[])
    {
        ArrayList arraylist = Lists.newArrayList();
        String as[] = keystore.saw("VPN_");
        if (as != null)
        {
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                String s = as[j];
                VpnProfile vpnprofile = VpnProfile.decode(s, keystore.get((new StringBuilder()).append("VPN_").append(s).toString()));
                if (vpnprofile != null)
                    arraylist.add(vpnprofile);
            }

        }
        return arraylist;
    }

    public boolean handleMessage(Message message)
    {
        mUpdater.removeMessages(0);
        if (!isResumed())
            break MISSING_BLOCK_LABEL_123;
        LegacyVpnInfo legacyvpninfo;
        VpnPreference vpnpreference1;
        legacyvpninfo = mService.getLegacyVpnInfo();
        if (mInfo == null)
            break MISSING_BLOCK_LABEL_68;
        vpnpreference1 = (VpnPreference)mPreferences.get(mInfo.key);
        if (vpnpreference1 == null)
            break MISSING_BLOCK_LABEL_63;
        vpnpreference1.update(-1);
        mInfo = null;
        if (legacyvpninfo == null)
            break MISSING_BLOCK_LABEL_111;
        VpnPreference vpnpreference = (VpnPreference)mPreferences.get(legacyvpninfo.key);
        if (vpnpreference != null)
            try
            {
                vpnpreference.update(legacyvpninfo.state);
                mInfo = legacyvpninfo;
            }
            catch (Exception exception) { }
        mUpdater.sendEmptyMessageDelayed(0, 1000L);
        return true;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        VpnProfile vpnprofile;
label0:
        {
            if (i == -1)
            {
                vpnprofile = mDialog.getProfile();
                mKeyStore.put((new StringBuilder()).append("VPN_").append(vpnprofile.key).toString(), vpnprofile.encode());
                String s = LockdownConfigFragment.getStringOrNull(KeyStore.getInstance(), "LOCKDOWN_VPN");
                VpnPreference vpnpreference = (VpnPreference)mPreferences.get(vpnprofile.key);
                if (vpnpreference != null)
                    if (s == null)
                        disconnect(vpnprofile.key);
                    else
                        Log.d("VpnSettings", "lockdown vpn is enable for connect, do not disconnect.");
                if (!mDialog.isEditing())
                    if (s == null)
                    {
                        try
                        {
                            connect(vpnprofile);
                        }
                        catch (Exception exception)
                        {
                            Log.e("VpnSettings", "connect", exception);
                        }
                    } else
                    {
                        Log.d("VpnSettings", "lockdown vpn is enable for connect, do not connect to other profile.");
                        Toast.makeText(getActivity(), 0x7f0b01c8, 1).show();
                    }
                if (vpnpreference == null)
                    break label0;
                if (!vpnprofile.saveLogin)
                {
                    vpnprofile.username = "";
                    vpnprofile.password = "";
                }
                vpnpreference.update(vpnprofile);
            }
            return;
        }
        VpnPreference vpnpreference1 = new VpnPreference(getActivity(), vpnprofile);
        vpnpreference1.setOnPreferenceClickListener(this);
        mPreferences.put(vpnprofile.key, vpnpreference1);
        getPreferenceScreen().addPreference(vpnpreference1);
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
        if (mDialog != null)
        {
            Log.v("VpnSettings", "onContextItemSelected() is called when mDialog != null");
            return false;
        }
        VpnPreference vpnpreference = (VpnPreference)mPreferences.get(mSelectedKey);
        if (vpnpreference == null)
        {
            Log.v("VpnSettings", "onContextItemSelected() is called but no preference is found");
            return false;
        }
        switch (menuitem.getItemId())
        {
        case 2131429616: 
            disconnect(mSelectedKey);
            getPreferenceScreen().removePreference(vpnpreference);
            mPreferences.remove(mSelectedKey);
            mKeyStore.delete((new StringBuilder()).append("VPN_").append(mSelectedKey).toString());
            String s = LockdownConfigFragment.getStringOrNull(KeyStore.getInstance(), "LOCKDOWN_VPN");
            Log.v("VpnSettings", (new StringBuilder()).append("lockdownKey = ").append(s).append(",mSelectedKey").append(mSelectedKey).toString());
            if (TextUtils.equals(mSelectedKey, s))
            {
                Log.v("VpnSettings", "delete lockdown vpn profile");
                mKeyStore.delete("LOCKDOWN_VPN");
                ConnectivityManager.from(getActivity()).updateLockdownVpn();
            }
            return true;

        case 2131429615: 
            mDialog = new VpnDialog(getActivity(), this, vpnpreference.getProfile(), true);
            mDialog.setOnDismissListener(this);
            mDialog.show();
            return true;
        }
        return false;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
        addPreferencesFromResource(0x7f050047);
        if (bundle != null)
        {
            VpnProfile vpnprofile = VpnProfile.decode(bundle.getString("VpnKey"), bundle.getByteArray("VpnProfile"));
            if (vpnprofile != null)
                mDialog = new VpnDialog(getActivity(), this, vpnprofile, bundle.getBoolean("VpnEditing"));
        }
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        if (mDialog != null)
            Log.v("VpnSettings", "onCreateContextMenu() is called when mDialog != null");
        else
        if (contextmenuinfo instanceof android.widget.AdapterView.AdapterContextMenuInfo)
        {
            Preference preference = (Preference)getListView().getItemAtPosition(((android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo).position);
            if (preference instanceof VpnPreference)
            {
                VpnProfile vpnprofile = ((VpnPreference)preference).getProfile();
                mSelectedKey = vpnprofile.key;
                contextmenu.setHeaderTitle(vpnprofile.name);
                contextmenu.add(0, 0x7f0b08ef, 0, 0x7f0b08ef);
                contextmenu.add(0, 0x7f0b08f0, 0, 0x7f0b08f0);
                return;
            }
        }
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        super.onCreateOptionsMenu(menu, menuinflater);
        menuinflater.inflate(0x7f100004, menu);
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        mDialog = null;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2131231348: 
            LockdownConfigFragment.show(this);
            return true;

        case 2131231347: 
            long l;
            for (l = System.currentTimeMillis(); mPreferences.containsKey(Long.toHexString(l)); l++);
            mDialog = new VpnDialog(getActivity(), this, new VpnProfile(Long.toHexString(l)), true);
            mDialog.setOnDismissListener(this);
            mDialog.show();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onPause()
    {
        super.onPause();
        if (mDialog != null)
        {
            mDialog.setOnDismissListener(null);
            mDialog.dismiss();
        }
        if (getView() != null)
            unregisterForContextMenu(getListView());
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (mDialog != null)
        {
            Log.v("VpnSettings", "onPreferenceClick() is called when mDialog != null");
            return true;
        }
        if (!(preference instanceof VpnPreference)) goto _L2; else goto _L1
_L1:
        VpnProfile vpnprofile = ((VpnPreference)preference).getProfile();
        if (mInfo == null || !vpnprofile.key.equals(mInfo.key) || mInfo.state != 3) goto _L4; else goto _L3
_L3:
        if (mInfo.intent != null) goto _L6; else goto _L5
_L5:
        Log.v("VpnSettings", "mInfo.intent == null");
        Toast.makeText(getActivity(), 0x7f0b01c8, 1).show();
        return true;
        Exception exception;
        exception;
_L4:
        mDialog = new VpnDialog(getActivity(), this, vpnprofile, false);
_L8:
        mDialog.setOnDismissListener(this);
        mDialog.show();
        return true;
_L6:
        Log.v("VpnSettings", (new StringBuilder()).append("mInfo.intent = ").append(mInfo.intent).toString());
        mInfo.intent.send();
        return true;
_L2:
        long l;
        for (l = System.currentTimeMillis(); mPreferences.containsKey(Long.toHexString(l)); l++);
        mDialog = new VpnDialog(getActivity(), this, new VpnProfile(Long.toHexString(l)), true);
        if (true) goto _L8; else goto _L7
_L7:
    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        super.onPrepareOptionsMenu(menu);
        if (SystemProperties.getBoolean("persist.radio.imsregrequired", false))
            menu.findItem(0x7f080274).setVisible(false);
    }

    public void onResume()
    {
        super.onResume();
        if (mKeyStore.state() != android.security.KeyStore.State.UNLOCKED)
        {
            if (!mUnlocking)
                Credentials.getInstance().unlock(getActivity());
            else
                finishFragment();
            boolean flag = mUnlocking;
            boolean flag1 = false;
            if (!flag)
                flag1 = true;
            mUnlocking = flag1;
            return;
        }
        mUnlocking = false;
        if (mPreferences.size() == 0)
        {
            PreferenceScreen preferencescreen = getPreferenceScreen();
            Activity activity = getActivity();
            VpnPreference vpnpreference;
            for (Iterator iterator = loadVpnProfiles(mKeyStore, new int[0]).iterator(); iterator.hasNext(); preferencescreen.addPreference(vpnpreference))
            {
                VpnProfile vpnprofile = (VpnProfile)iterator.next();
                vpnpreference = new VpnPreference(activity, vpnprofile);
                vpnpreference.setOnPreferenceClickListener(this);
                mPreferences.put(vpnprofile.key, vpnpreference);
            }

        }
        if (mDialog != null)
        {
            mDialog.setOnDismissListener(this);
            mDialog.show();
        }
        if (mUpdater == null)
            mUpdater = new Handler(this);
        mUpdater.sendEmptyMessage(0);
        registerForContextMenu(getListView());
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        if (mDialog != null)
        {
            VpnProfile vpnprofile = mDialog.getProfile();
            bundle.putString("VpnKey", vpnprofile.key);
            bundle.putByteArray("VpnProfile", vpnprofile.encode());
            bundle.putBoolean("VpnEditing", mDialog.isEditing());
        }
    }

}
