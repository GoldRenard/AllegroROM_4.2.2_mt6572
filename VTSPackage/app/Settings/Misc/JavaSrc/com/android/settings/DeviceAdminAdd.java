// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.app.admin.DeviceAdminInfo;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.pm.*;
import android.os.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlPullParserException;

public class DeviceAdminAdd extends Activity
{

    static final int DIALOG_WARNING = 1;
    private static final int MAX_ADD_MSG_LINES = 15;
    private static final int MAX_ADD_MSG_LINES_LANDSCAPE = 2;
    private static final int MAX_ADD_MSG_LINES_PORTRAIT = 5;
    static final String TAG = "DeviceAdminAdd";
    Button mActionButton;
    final ArrayList mActivePolicies = new ArrayList();
    TextView mAddMsg;
    boolean mAddMsgEllipsized;
    ImageView mAddMsgExpander;
    CharSequence mAddMsgText;
    boolean mAdding;
    final ArrayList mAddingPolicies = new ArrayList();
    TextView mAdminDescription;
    ImageView mAdminIcon;
    TextView mAdminName;
    ViewGroup mAdminPolicies;
    TextView mAdminWarning;
    Button mCancelButton;
    DevicePolicyManager mDPM;
    DeviceAdminInfo mDeviceAdmin;
    Handler mHandler;
    boolean mRefreshing;

    public DeviceAdminAdd()
    {
        mAddMsgEllipsized = true;
    }

    static void setViewVisibility(ArrayList arraylist, int i)
    {
        int j = arraylist.size();
        for (int k = 0; k < j; k++)
            ((View)arraylist.get(k)).setVisibility(i);

    }

    int getEllipsizedLines()
    {
        Display display = ((WindowManager)getSystemService("window")).getDefaultDisplay();
        return display.getHeight() <= display.getWidth() ? 2 : 5;
    }

    protected void onCreate(Bundle bundle)
    {
        ComponentName componentname;
        ActivityInfo activityinfo;
        int k;
        boolean flag;
        ResolveInfo resolveinfo1;
        super.onCreate(bundle);
        mHandler = new Handler(getMainLooper());
        mDPM = (DevicePolicyManager)getSystemService("device_policy");
        if ((0x10000000 & getIntent().getFlags()) != 0)
        {
            Log.w("DeviceAdminAdd", "Cannot start ADD_DEVICE_ADMIN as a new task");
            finish();
            return;
        }
        componentname = (ComponentName)getIntent().getParcelableExtra("android.app.extra.DEVICE_ADMIN");
        if (componentname == null)
        {
            Log.w("DeviceAdminAdd", (new StringBuilder()).append("No component specified in ").append(getIntent().getAction()).toString());
            finish();
            return;
        }
        try
        {
            activityinfo = getPackageManager().getReceiverInfo(componentname, 128);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.w("DeviceAdminAdd", (new StringBuilder()).append("Unable to retrieve device policy ").append(componentname).toString(), namenotfoundexception);
            finish();
            return;
        }
        if (mDPM.isAdminActive(componentname)) goto _L2; else goto _L1
_L1:
        List list = getPackageManager().queryBroadcastReceivers(new Intent("android.app.action.DEVICE_ADMIN_ENABLED"), 0);
        int j;
        if (list == null)
            j = 0;
        else
            j = list.size();
        k = 0;
_L5:
        flag = false;
        if (k >= j)
            break MISSING_BLOCK_LABEL_249;
        resolveinfo1 = (ResolveInfo)list.get(k);
        if (!((PackageItemInfo) (activityinfo)).packageName.equals(((PackageItemInfo) (resolveinfo1.activityInfo)).packageName) || !activityinfo.name.equals(resolveinfo1.activityInfo.name))
            break MISSING_BLOCK_LABEL_406;
        resolveinfo1.activityInfo = activityinfo;
        new DeviceAdminInfo(this, resolveinfo1);
        flag = true;
_L4:
        if (!flag)
        {
            Log.w("DeviceAdminAdd", (new StringBuilder()).append("Request to add invalid device admin: ").append(componentname).toString());
            finish();
            return;
        }
        break; /* Loop/switch isn't completed */
        XmlPullParserException xmlpullparserexception1;
        xmlpullparserexception1;
        Log.w("DeviceAdminAdd", (new StringBuilder()).append("Bad ").append(resolveinfo1.activityInfo).toString(), xmlpullparserexception1);
        flag = false;
        continue; /* Loop/switch isn't completed */
        IOException ioexception1;
        ioexception1;
        Log.w("DeviceAdminAdd", (new StringBuilder()).append("Bad ").append(resolveinfo1.activityInfo).toString(), ioexception1);
        flag = false;
        if (true) goto _L4; else goto _L3
_L3:
        break; /* Loop/switch isn't completed */
        k++;
        if (true) goto _L5; else goto _L2
_L2:
        ResolveInfo resolveinfo = new ResolveInfo();
        resolveinfo.activityInfo = activityinfo;
        try
        {
            mDeviceAdmin = new DeviceAdminInfo(this, resolveinfo);
        }
        catch (XmlPullParserException xmlpullparserexception)
        {
            Log.w("DeviceAdminAdd", (new StringBuilder()).append("Unable to retrieve device policy ").append(componentname).toString(), xmlpullparserexception);
            finish();
            return;
        }
        catch (IOException ioexception)
        {
            Log.w("DeviceAdminAdd", (new StringBuilder()).append("Unable to retrieve device policy ").append(componentname).toString(), ioexception);
            finish();
            return;
        }
        if ("android.app.action.ADD_DEVICE_ADMIN".equals(getIntent().getAction()))
        {
            mRefreshing = false;
            if (mDPM.isAdminActive(componentname))
            {
                ArrayList arraylist = mDeviceAdmin.getUsedPolicies();
                int i = 0;
label0:
                do
                {
label1:
                    {
                        if (i < arraylist.size())
                        {
                            android.app.admin.DeviceAdminInfo.PolicyInfo policyinfo = (android.app.admin.DeviceAdminInfo.PolicyInfo)arraylist.get(i);
                            if (mDPM.hasGrantedPolicy(componentname, policyinfo.ident))
                                break label1;
                            mRefreshing = true;
                        }
                        if (!mRefreshing)
                        {
                            setResult(-1);
                            finish();
                            return;
                        }
                        break label0;
                    }
                    i++;
                } while (true);
            }
        }
        mAddMsgText = getIntent().getCharSequenceExtra("android.app.extra.ADD_EXPLANATION");
        setContentView(0x7f040031);
        mAdminIcon = (ImageView)findViewById(0x7f08006f);
        mAdminName = (TextView)findViewById(0x7f080070);
        mAdminDescription = (TextView)findViewById(0x7f080071);
        mAddMsg = (TextView)findViewById(0x7f080073);
        mAddMsgExpander = (ImageView)findViewById(0x7f080072);
        mAddMsg.setOnClickListener(new android.view.View.OnClickListener() {

            final DeviceAdminAdd this$0;

            public void onClick(View view)
            {
                toggleMessageEllipsis(view);
            }

            
            {
                this$0 = DeviceAdminAdd.this;
                super();
            }
        }
);
        toggleMessageEllipsis(mAddMsg);
        mAdminWarning = (TextView)findViewById(0x7f080074);
        mAdminPolicies = (ViewGroup)findViewById(0x7f080075);
        mCancelButton = (Button)findViewById(0x7f080028);
        mCancelButton.setOnClickListener(new android.view.View.OnClickListener() {

            final DeviceAdminAdd this$0;

            public void onClick(View view)
            {
                finish();
            }

            
            {
                this$0 = DeviceAdminAdd.this;
                super();
            }
        }
);
        mActionButton = (Button)findViewById(0x7f080078);
        mActionButton.setOnClickListener(new android.view.View.OnClickListener() {

            final DeviceAdminAdd this$0;

            public void onClick(View view)
            {
                if (!mAdding) goto _L2; else goto _L1
_L1:
                mDPM.setActiveAdmin(mDeviceAdmin.getComponent(), mRefreshing);
                setResult(-1);
_L3:
                finish();
                return;
                RuntimeException runtimeexception;
                runtimeexception;
                Log.w("DeviceAdminAdd", (new StringBuilder()).append("Exception trying to activate admin ").append(mDeviceAdmin.getComponent()).toString(), runtimeexception);
                if (mDPM.isAdminActive(mDeviceAdmin.getComponent()))
                    setResult(-1);
                if (true) goto _L3; else goto _L2
_L2:
                try
                {
                    ActivityManagerNative.getDefault().stopAppSwitches();
                }
                catch (RemoteException remoteexception) { }
                mDPM.getRemoveWarning(mDeviceAdmin.getComponent(), new RemoteCallback(mHandler) {

                    final _cls3 this$1;

                    protected void onResult(Bundle bundle)
                    {
                        CharSequence charsequence;
                        if (bundle != null)
                            charsequence = bundle.getCharSequence("android.app.extra.DISABLE_WARNING");
                        else
                            charsequence = null;
                        if (charsequence == null)
                        {
                            Bundle bundle1;
                            try
                            {
                                ActivityManagerNative.getDefault().resumeAppSwitches();
                            }
                            catch (RemoteException remoteexception) { }
                            mDPM.removeActiveAdmin(mDeviceAdmin.getComponent());
                            finish();
                            return;
                        } else
                        {
                            bundle1 = new Bundle();
                            bundle1.putCharSequence("android.app.extra.DISABLE_WARNING", charsequence);
                            showDialog(1, bundle1);
                            return;
                        }
                    }

            
            {
                this$1 = _cls3.this;
                super(handler);
            }
                }
);
                return;
            }

            
            {
                this$0 = DeviceAdminAdd.this;
                super();
            }
        }
);
        return;
    }

    protected Dialog onCreateDialog(int i, Bundle bundle)
    {
        switch (i)
        {
        case 1: // '\001'
            CharSequence charsequence = bundle.getCharSequence("android.app.extra.DISABLE_WARNING");
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
            builder.setMessage(charsequence);
            builder.setPositiveButton(0x7f0b066b, new android.content.DialogInterface.OnClickListener() {

                final DeviceAdminAdd this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mDPM.removeActiveAdmin(mDeviceAdmin.getComponent());
                    finish();
                }

            
            {
                this$0 = DeviceAdminAdd.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x7f0b066c, null);
            return builder.create();
        }
        return super.onCreateDialog(i, bundle);
    }

    protected void onResume()
    {
        super.onResume();
        updateInterface();
    }

    void toggleMessageEllipsis(View view)
    {
        TextView textview = (TextView)view;
        boolean flag;
        if (!mAddMsgEllipsized)
            flag = true;
        else
            flag = false;
        mAddMsgEllipsized = flag;
        android.text.TextUtils.TruncateAt truncateat;
        if (mAddMsgEllipsized)
            truncateat = android.text.TextUtils.TruncateAt.END;
        else
            truncateat = null;
        textview.setEllipsize(truncateat);
        int i;
        if (mAddMsgEllipsized)
            i = getEllipsizedLines();
        else
            i = 15;
        textview.setMaxLines(i);
        ImageView imageview = mAddMsgExpander;
        int j;
        if (mAddMsgEllipsized)
            j = 0x1080271;
        else
            j = 0x1080270;
        imageview.setImageResource(j);
    }

    void updateInterface()
    {
        mAdminIcon.setImageDrawable(mDeviceAdmin.loadIcon(getPackageManager()));
        mAdminName.setText(mDeviceAdmin.loadLabel(getPackageManager()));
        try
        {
            mAdminDescription.setText(mDeviceAdmin.loadDescription(getPackageManager()));
            mAdminDescription.setVisibility(0);
        }
        catch (android.content.res.Resources.NotFoundException notfoundexception)
        {
            mAdminDescription.setVisibility(8);
        }
        if (mAddMsgText != null)
        {
            mAddMsg.setText(mAddMsgText);
            mAddMsg.setVisibility(0);
        } else
        {
            mAddMsg.setVisibility(8);
            mAddMsgExpander.setVisibility(8);
        }
        if (!mRefreshing && mDPM.isAdminActive(mDeviceAdmin.getComponent()))
        {
            if (mActivePolicies.size() == 0)
            {
                ArrayList arraylist1 = mDeviceAdmin.getUsedPolicies();
                for (int j = 0; j < arraylist1.size(); j++)
                {
                    View view1 = AppSecurityPermissions.getPermissionItemView(this, getText(((android.app.admin.DeviceAdminInfo.PolicyInfo)arraylist1.get(j)).label), "", true);
                    mActivePolicies.add(view1);
                    mAdminPolicies.addView(view1);
                }

            }
            setViewVisibility(mActivePolicies, 0);
            setViewVisibility(mAddingPolicies, 8);
            TextView textview1 = mAdminWarning;
            Object aobj1[] = new Object[1];
            aobj1[0] = mDeviceAdmin.getActivityInfo().applicationInfo.loadLabel(getPackageManager());
            textview1.setText(getString(0x7f0b0806, aobj1));
            setTitle(getText(0x7f0b07fe));
            mActionButton.setText(getText(0x7f0b07ff));
            mAdding = false;
            return;
        }
        if (mAddingPolicies.size() == 0)
        {
            ArrayList arraylist = mDeviceAdmin.getUsedPolicies();
            for (int i = 0; i < arraylist.size(); i++)
            {
                android.app.admin.DeviceAdminInfo.PolicyInfo policyinfo = (android.app.admin.DeviceAdminInfo.PolicyInfo)arraylist.get(i);
                View view = AppSecurityPermissions.getPermissionItemView(this, getText(policyinfo.label), getText(policyinfo.description), true);
                mAddingPolicies.add(view);
                mAdminPolicies.addView(view);
            }

        }
        setViewVisibility(mAddingPolicies, 0);
        setViewVisibility(mActivePolicies, 8);
        TextView textview = mAdminWarning;
        Object aobj[] = new Object[1];
        aobj[0] = mDeviceAdmin.getActivityInfo().applicationInfo.loadLabel(getPackageManager());
        textview.setText(getString(0x7f0b0805, aobj));
        setTitle(getText(0x7f0b0802));
        mActionButton.setText(getText(0x7f0b0803));
        mAdding = true;
    }
}
