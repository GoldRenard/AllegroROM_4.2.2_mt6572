// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.users;

import android.app.*;
import android.content.*;
import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.util.Log;
import android.util.SparseArray;
import android.view.*;
import android.widget.EditText;
import com.android.settings.*;
import java.util.*;

// Referenced classes of package com.android.settings.users:
//            UserPreference

public class UserSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceClickListener, android.view.View.OnClickListener, android.content.DialogInterface.OnDismissListener, android.preference.Preference.OnPreferenceChangeListener
{

    private static final int DIALOG_ADD_USER = 2;
    private static final int DIALOG_CONFIRM_REMOVE = 1;
    private static final int DIALOG_SETUP_USER = 3;
    private static final int DIALOG_USER_CANNOT_MANAGE = 4;
    private static final String KEY_ADD_USER_LONG_MESSAGE_DISPLAYED = "key_add_user_long_message_displayed";
    private static final String KEY_USER_LIST = "user_list";
    private static final String KEY_USER_ME = "user_me";
    private static final String KEY_USER_NICKNAME = "user_nickname";
    private static final int MENU_ADD_USER = 1;
    private static final int MENU_REMOVE_USER = 2;
    private static final int MESSAGE_SETUP_USER = 2;
    private static final int MESSAGE_UPDATE_LIST = 1;
    private static final String SAVE_ADDING_USER = "adding_user";
    private static final String SAVE_REMOVING_USER = "removing_user";
    private static final String TAG = "UserSettings";
    private static final int USER_DRAWABLES[] = {
        0x7f020017, 0x7f020018, 0x7f020019, 0x7f02001a, 0x7f02001b, 0x7f02001c, 0x7f02001d, 0x7f02001e
    };
    private int mAddedUserId;
    private boolean mAddingUser;
    private Handler mHandler;
    private boolean mIsOwner;
    private Preference mMePreference;
    private SelectableEditTextPreference mNicknamePreference;
    private boolean mProfileExists;
    private int mRemovingUserId;
    private BroadcastReceiver mUserChangeReceiver;
    private SparseArray mUserIcons;
    private PreferenceGroup mUserListCategory;
    private final Object mUserLock = new Object();
    private UserManager mUserManager;

    public UserSettings()
    {
        mRemovingUserId = -1;
        mAddedUserId = 0;
        mUserIcons = new SparseArray();
        int i = UserHandle.myUserId();
        boolean flag = false;
        if (i == 0)
            flag = true;
        mIsOwner = flag;
        mHandler = new Handler() {

            final UserSettings this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 2: // '\002'
                    onUserCreated(message.arg1);
                    return;

                case 1: // '\001'
                    updateUserList();
                    return;
                }
            }

            
            {
                this$0 = UserSettings.this;
                super();
            }
        }
;
        mUserChangeReceiver = new BroadcastReceiver() {

            final UserSettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.USER_REMOVED"))
                    mRemovingUserId = -1;
                else
                if (intent.getAction().equals("android.intent.action.USER_INFO_CHANGED"))
                {
                    int j = intent.getIntExtra("android.intent.extra.user_handle", -1);
                    if (j != -1)
                        mUserIcons.remove(j);
                }
                mHandler.sendEmptyMessage(1);
            }

            
            {
                this$0 = UserSettings.this;
                super();
            }
        }
;
    }

    private void addUserNow()
    {
        synchronized (mUserLock)
        {
            mAddingUser = true;
            updateUserList();
            (new Thread() {

                final UserSettings this$0;

                public void run()
                {
                    UserInfo userinfo = mUserManager.createUser(getActivity().getResources().getString(0x7f0b091c), 0);
                    if (userinfo != null)
                        assignDefaultPhoto(userinfo);
                    synchronized (mUserLock)
                    {
                        mAddingUser = false;
                        mHandler.sendEmptyMessage(1);
                        mHandler.sendMessage(mHandler.obtainMessage(2, userinfo.id, userinfo.serialNumber));
                    }
                    return;
                    exception1;
                    obj1;
                    JVM INSTR monitorexit ;
                    throw exception1;
                }

            
            {
                this$0 = UserSettings.this;
                super();
            }
            }
).start();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void assignDefaultPhoto(UserInfo userinfo)
    {
        android.graphics.Bitmap bitmap = BitmapFactory.decodeResource(getResources(), USER_DRAWABLES[userinfo.id % USER_DRAWABLES.length]);
        mUserManager.setUserIcon(userinfo.id, bitmap);
    }

    private void assignProfilePhoto(UserInfo userinfo)
    {
        if (!Utils.copyMeProfilePhoto(getActivity(), userinfo))
            assignDefaultPhoto(userinfo);
    }

    private void finishLoadProfile(String s)
    {
        mMePreference.setTitle(s);
        int i = UserHandle.myUserId();
        android.graphics.Bitmap bitmap = mUserManager.getUserIcon(i);
        if (bitmap != null)
        {
            BitmapDrawable bitmapdrawable = new BitmapDrawable(bitmap);
            mMePreference.setIcon(bitmapdrawable);
            mUserIcons.put(i, bitmapdrawable);
        }
    }

    private String getProfileName()
    {
        String s = Utils.getMeProfileName(getActivity(), true);
        if (s != null)
            mProfileExists = true;
        return s;
    }

    private boolean isInitialized(UserInfo userinfo)
    {
        return (0x10 & userinfo.flags) != 0;
    }

    private void loadIconsAsync(List list)
    {
        (new AsyncTask() {

            final UserSettings this$0;
            final Resources val$resources;

            protected volatile Object doInBackground(Object aobj[])
            {
                return doInBackground((List[])aobj);
            }

            protected transient Void doInBackground(List alist[])
            {
                int i;
                BitmapDrawable bitmapdrawable;
                for (Iterator iterator = alist[0].iterator(); iterator.hasNext(); mUserIcons.append(i, bitmapdrawable))
                {
                    i = ((Integer)iterator.next()).intValue();
                    android.graphics.Bitmap bitmap = mUserManager.getUserIcon(i);
                    bitmapdrawable = new BitmapDrawable(resources, bitmap);
                }

                return null;
            }

            protected volatile void onPostExecute(Object obj)
            {
                onPostExecute((Void)obj);
            }

            protected void onPostExecute(Void void1)
            {
                updateUserList();
            }

            
            {
                this$0 = UserSettings.this;
                resources = resources1;
                super();
            }
        }
).execute(new List[] {
            list
        });
    }

    private void loadProfile()
    {
        mProfileExists = false;
        (new AsyncTask() {

            final UserSettings this$0;

            protected volatile Object doInBackground(Object aobj[])
            {
                return doInBackground((Void[])aobj);
            }

            protected transient String doInBackground(Void avoid[])
            {
                UserInfo userinfo = mUserManager.getUserInfo(UserHandle.myUserId());
                if (userinfo.iconPath == null || userinfo.iconPath.equals(""))
                    assignProfilePhoto(userinfo);
                return getProfileName();
            }

            protected volatile void onPostExecute(Object obj)
            {
                onPostExecute((String)obj);
            }

            protected void onPostExecute(String s)
            {
                finishLoadProfile(s);
            }

            
            {
                this$0 = UserSettings.this;
                super();
            }
        }
).execute(new Void[0]);
    }

    private void onAddUserClicked()
    {
        synchronized (mUserLock)
        {
            if (mRemovingUserId == -1 && !mAddingUser)
                showDialog(2);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void onRemoveUserClicked(int i)
    {
        synchronized (mUserLock)
        {
            if (mRemovingUserId == -1 && !mAddingUser)
            {
                mRemovingUserId = i;
                showDialog(1);
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void onUserCreated(int i)
    {
        mAddedUserId = i;
        showDialog(3);
    }

    private void removeThisUser()
    {
        try
        {
            ActivityManagerNative.getDefault().switchUser(0);
            ((UserManager)getActivity().getSystemService("user")).removeUser(UserHandle.myUserId());
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("UserSettings", "Unable to remove self user");
        }
    }

    private void removeUserNow()
    {
        if (mRemovingUserId == UserHandle.myUserId())
        {
            removeThisUser();
            return;
        } else
        {
            (new Thread() {

                final UserSettings this$0;

                public void run()
                {
                    synchronized (mUserLock)
                    {
                        mUserManager.removeUser(mRemovingUserId);
                        mHandler.sendEmptyMessage(1);
                    }
                    return;
                    exception;
                    obj;
                    JVM INSTR monitorexit ;
                    throw exception;
                }

            
            {
                this$0 = UserSettings.this;
                super();
            }
            }
).start();
            return;
        }
    }

    private void setPhotoId(Preference preference, UserInfo userinfo)
    {
        Drawable drawable = (Drawable)mUserIcons.get(userinfo.id);
        if (drawable != null)
            preference.setIcon(drawable);
    }

    private void setUserName(String s)
    {
        mUserManager.setUserName(UserHandle.myUserId(), s);
        mNicknamePreference.setSummary(s);
        getActivity().invalidateOptionsMenu();
    }

    private void switchUserNow(int i)
    {
        try
        {
            ActivityManagerNative.getDefault().switchUser(i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void updateUserList()
    {
        if (getActivity() != null)
        {
            List list = mUserManager.getUsers(true);
            mUserListCategory.removeAll();
            mUserListCategory.setOrderingAsAdded(false);
            ArrayList arraylist = new ArrayList();
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                UserInfo userinfo = (UserInfo)iterator.next();
                Object obj;
                if (userinfo.id == UserHandle.myUserId())
                {
                    obj = mMePreference;
                    mNicknamePreference.setText(userinfo.name);
                    mNicknamePreference.setSummary(userinfo.name);
                } else
                {
                    Activity activity = getActivity();
                    int i = userinfo.id;
                    boolean flag;
                    if (UserHandle.myUserId() == 0)
                        flag = true;
                    else
                        flag = false;
                    obj = new UserPreference(activity, null, i, flag, this);
                    ((Preference) (obj)).setOnPreferenceClickListener(this);
                    ((Preference) (obj)).setKey((new StringBuilder()).append("id=").append(userinfo.id).toString());
                    mUserListCategory.addPreference(((Preference) (obj)));
                    if (userinfo.id == 0)
                        ((Preference) (obj)).setSummary(0x7f0b0911);
                    ((Preference) (obj)).setTitle(userinfo.name);
                    if (!isInitialized(userinfo))
                        ((Preference) (obj)).setSummary(0x7f0b0910);
                }
                if (userinfo.iconPath != null)
                    if (mUserIcons.get(userinfo.id) == null)
                    {
                        arraylist.add(Integer.valueOf(userinfo.id));
                        ((Preference) (obj)).setIcon(0x7f020017);
                    } else
                    {
                        setPhotoId(((Preference) (obj)), userinfo);
                    }
            } while (true);
            if (mAddingUser)
            {
                UserPreference userpreference = new UserPreference(getActivity(), null, -10, false, null);
                userpreference.setEnabled(false);
                userpreference.setTitle(0x7f0b091c);
                userpreference.setSummary(0x7f0b0921);
                userpreference.setIcon(0x7f020017);
                mUserListCategory.addPreference(userpreference);
            }
            getActivity().invalidateOptionsMenu();
            if (arraylist.size() > 0)
            {
                loadIconsAsync(arraylist);
                return;
            }
        }
    }

    public void onClick(View view)
    {
        if (view.getTag() instanceof UserPreference)
            onRemoveUserClicked(((UserPreference)view.getTag()).getUserId());
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (bundle != null)
        {
            if (bundle.containsKey("adding_user"))
                mAddedUserId = bundle.getInt("adding_user");
            if (bundle.containsKey("removing_user"))
                mRemovingUserId = bundle.getInt("removing_user");
        }
        mUserManager = (UserManager)getActivity().getSystemService("user");
        addPreferencesFromResource(0x7f050044);
        mUserListCategory = (PreferenceGroup)findPreference("user_list");
        mMePreference = findPreference("user_me");
        mMePreference.setOnPreferenceClickListener(this);
        if (!mIsOwner)
            mMePreference.setSummary(null);
        Preference preference = findPreference("user_owner_info");
        if (preference != null && !mIsOwner)
            preference.setTitle(0x7f0b0379);
        mNicknamePreference = (SelectableEditTextPreference)findPreference("user_nickname");
        mNicknamePreference.setOnPreferenceChangeListener(this);
        mNicknamePreference.getEditText().setInputType(8192);
        mNicknamePreference.setInitialSelectionMode(2);
        loadProfile();
        setHasOptionsMenu(true);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.USER_REMOVED");
        intentfilter.addAction("android.intent.action.USER_INFO_CHANGED");
        getActivity().registerReceiverAsUser(mUserChangeReceiver, UserHandle.ALL, intentfilter, null, mHandler);
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0916).setMessage(0x7f0b0917).setPositiveButton(0x7f0b0918, new android.content.DialogInterface.OnClickListener() {

                final UserSettings this$0;

                public void onClick(DialogInterface dialoginterface, int i1)
                {
                    switchUserNow(mAddedUserId);
                }

            
            {
                this$0 = UserSettings.this;
                super();
            }
            }
).setNegativeButton(0x7f0b0919, null).create();

        case 2: // '\002'
            final SharedPreferences preferences = getActivity().getPreferences(0);
            final boolean longMessageDisplayed = preferences.getBoolean("key_add_user_long_message_displayed", false);
            int l;
            if (longMessageDisplayed)
                l = 0x7f0b0915;
            else
                l = 0x7f0b0914;
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0913).setMessage(l).setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

                final UserSettings this$0;
                final boolean val$longMessageDisplayed;
                final SharedPreferences val$preferences;

                public void onClick(DialogInterface dialoginterface, int i1)
                {
                    addUserNow();
                    if (!longMessageDisplayed)
                        preferences.edit().putBoolean("key_add_user_long_message_displayed", true).commit();
                }

            
            {
                this$0 = UserSettings.this;
                longMessageDisplayed = flag;
                preferences = sharedpreferences;
                super();
            }
            }
).setNegativeButton(0x1040000, null).create();

        case 4: // '\004'
            return (new android.app.AlertDialog.Builder(getActivity())).setMessage(0x7f0b091a).setPositiveButton(0x104000a, null).create();

        case 1: // '\001'
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
            int j;
            if (UserHandle.myUserId() == mRemovingUserId)
                j = 0x7f0b091d;
            else
                j = 0x7f0b091e;
            android.app.AlertDialog.Builder builder1 = builder.setTitle(j);
            int k;
            if (UserHandle.myUserId() == mRemovingUserId)
                k = 0x7f0b091f;
            else
                k = 0x7f0b0920;
            return builder1.setMessage(k).setPositiveButton(0x7f0b0923, new android.content.DialogInterface.OnClickListener() {

                final UserSettings this$0;

                public void onClick(DialogInterface dialoginterface, int i1)
                {
                    removeUserNow();
                }

            
            {
                this$0 = UserSettings.this;
                super();
            }
            }
).setNegativeButton(0x1040000, null).create();
        }
        return null;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        if (mIsOwner)
        {
            if (UserManager.getMaxSupportedUsers() > mUserManager.getUsers(false).size())
                menu.add(0, 1, 0, 0x7f0b090d).setShowAsAction(5);
        } else
        {
            String s = mUserManager.getUserName();
            menu.add(0, 2, 0, getResources().getString(0x7f0b091b, new Object[] {
                s
            })).setShowAsAction(0);
        }
        super.onCreateOptionsMenu(menu, menuinflater);
    }

    public void onDestroy()
    {
        super.onDestroy();
        getActivity().unregisterReceiver(mUserChangeReceiver);
    }

    public void onDialogShowing()
    {
        super.onDialogShowing();
        setOnDismissListener(this);
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        synchronized (mUserLock)
        {
            mAddingUser = false;
            mRemovingUserId = -1;
            updateUserList();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        int i = menuitem.getItemId();
        if (i == 1)
        {
            onAddUserClicked();
            return true;
        }
        if (i == 2)
        {
            onRemoveUserClicked(UserHandle.myUserId());
            return true;
        } else
        {
            return super.onOptionsItemSelected(menuitem);
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mNicknamePreference)
        {
            String s = (String)obj;
            if (preference == mNicknamePreference && s != null && s.length() > 0)
                setUserName(s);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (preference == mMePreference)
        {
            Intent intent;
            if (!mProfileExists)
            {
                intent = new Intent("android.intent.action.INSERT", android.provider.ContactsContract.Contacts.CONTENT_URI);
                intent.putExtra("newLocalProfile", true);
            } else
            {
                intent = new Intent("android.intent.action.EDIT", android.provider.ContactsContract.Profile.CONTENT_URI);
            }
            intent.putExtra("finishActivityOnSaveCompleted", true);
            startActivity(intent);
        } else
        if (preference instanceof UserPreference)
        {
            int i = ((UserPreference)preference).getUserId();
            UserInfo userinfo = mUserManager.getUserInfo(i);
            if (UserHandle.myUserId() != 0)
                showDialog(4);
            else
            if (!isInitialized(userinfo))
                mHandler.sendMessage(mHandler.obtainMessage(2, userinfo.id, userinfo.serialNumber));
        }
        return false;
    }

    public void onResume()
    {
        super.onResume();
        loadProfile();
        updateUserList();
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putInt("adding_user", mAddedUserId);
        bundle.putInt("removing_user", mRemovingUserId);
    }










/*
    static boolean access$1502(UserSettings usersettings, boolean flag)
    {
        usersettings.mAddingUser = flag;
        return flag;
    }

*/



/*
    static int access$202(UserSettings usersettings, int i)
    {
        usersettings.mRemovingUserId = i;
        return i;
    }

*/







}
