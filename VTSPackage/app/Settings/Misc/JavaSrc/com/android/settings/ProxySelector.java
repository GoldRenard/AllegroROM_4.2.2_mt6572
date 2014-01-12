// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.ProxyProperties;
import android.os.Bundle;
import android.text.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// Referenced classes of package com.android.settings:
//            DialogCreatable

public class ProxySelector extends Fragment
    implements DialogCreatable
{

    private static final int ERROR_DIALOG_ID = 0;
    private static final Pattern EXCLUSION_PATTERN = Pattern.compile("^$|^(\\*)*(\\.)*[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*(\\.)*(\\*)*$");
    private static final String EXCLUSION_REGEXP = "^$|^(\\*)*(\\.)*[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*(\\.)*(\\*)*$";
    private static final Pattern HOSTNAME_PATTERN = Pattern.compile("^$|^[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*$");
    private static final String HOSTNAME_REGEXP = "^$|^[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*(\\.[a-zA-Z0-9]+(\\-[a-zA-Z0-9]+)*)*$";
    private static final String TAG = "ProxySelector";
    Button mClearButton;
    android.view.View.OnClickListener mClearHandler;
    Button mDefaultButton;
    android.view.View.OnClickListener mDefaultHandler;
    private SettingsPreferenceFragment.SettingsDialogFragment mDialogFragment;
    EditText mExclusionListField;
    EditText mHostnameField;
    Button mOKButton;
    android.view.View.OnClickListener mOKHandler;
    android.view.View.OnFocusChangeListener mOnFocusChangeHandler;
    EditText mPortField;
    private View mView;

    public ProxySelector()
    {
        mOKHandler = new android.view.View.OnClickListener() {

            final ProxySelector this$0;

            public void onClick(View view)
            {
                if (saveToDb())
                    getActivity().onBackPressed();
            }

            
            {
                this$0 = ProxySelector.this;
                super();
            }
        }
;
        mClearHandler = new android.view.View.OnClickListener() {

            final ProxySelector this$0;

            public void onClick(View view)
            {
                mHostnameField.setText("");
                mPortField.setText("");
                mExclusionListField.setText("");
            }

            
            {
                this$0 = ProxySelector.this;
                super();
            }
        }
;
        mDefaultHandler = new android.view.View.OnClickListener() {

            final ProxySelector this$0;

            public void onClick(View view)
            {
                populateFields();
            }

            
            {
                this$0 = ProxySelector.this;
                super();
            }
        }
;
        mOnFocusChangeHandler = new android.view.View.OnFocusChangeListener() {

            final ProxySelector this$0;

            public void onFocusChange(View view, boolean flag)
            {
                if (flag)
                    Selection.selectAll((Spannable)((TextView)view).getText());
            }

            
            {
                this$0 = ProxySelector.this;
                super();
            }
        }
;
    }

    private void initView(View view)
    {
        mHostnameField = (EditText)view.findViewById(0x7f080131);
        mHostnameField.setOnFocusChangeListener(mOnFocusChangeHandler);
        mPortField = (EditText)view.findViewById(0x7f080132);
        mPortField.setOnClickListener(mOKHandler);
        mPortField.setOnFocusChangeListener(mOnFocusChangeHandler);
        mExclusionListField = (EditText)view.findViewById(0x7f080133);
        mExclusionListField.setOnFocusChangeListener(mOnFocusChangeHandler);
        mOKButton = (Button)view.findViewById(0x7f080134);
        mOKButton.setOnClickListener(mOKHandler);
        mClearButton = (Button)view.findViewById(0x7f080135);
        mClearButton.setOnClickListener(mClearHandler);
        mDefaultButton = (Button)view.findViewById(0x7f080136);
        mDefaultButton.setOnClickListener(mDefaultHandler);
    }

    private void showDialog(int i)
    {
        if (mDialogFragment != null)
            Log.e("ProxySelector", "Old dialog fragment not null!");
        mDialogFragment = new SettingsPreferenceFragment.SettingsDialogFragment(this, i);
        mDialogFragment.show(getActivity().getFragmentManager(), Integer.toString(i));
    }

    public static int validate(String s, String s1, String s2)
    {
        int i;
        Matcher matcher;
        String as[];
        i = 0x7f0b030e;
        matcher = HOSTNAME_PATTERN.matcher(s);
        as = s2.split(",");
        if (matcher.matches()) goto _L2; else goto _L1
_L1:
        i = 0x7f0b030a;
_L4:
        return i;
_L2:
        int j = as.length;
        for (int k = 0; k < j; k++)
        {
            String s3 = as[k];
            if (!EXCLUSION_PATTERN.matcher(s3).matches())
                return 0x7f0b030b;
        }

        if (s.length() > 0 && s1.length() == 0)
            return 0x7f0b030c;
        if (s1.length() <= 0)
            break; /* Loop/switch isn't completed */
        if (s.length() == 0)
            return 0x7f0b030d;
        int l;
        try
        {
            l = Integer.parseInt(s1);
        }
        catch (NumberFormatException numberformatexception)
        {
            return i;
        }
        if (l <= 0 || l > 65535) goto _L4; else goto _L3
_L3:
        return 0;
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        boolean flag;
        if (((DevicePolicyManager)getActivity().getSystemService("device_policy")).getGlobalProxyAdmin() == null)
            flag = true;
        else
            flag = false;
        mHostnameField.setEnabled(flag);
        mPortField.setEnabled(flag);
        mExclusionListField.setEnabled(flag);
        mOKButton.setEnabled(flag);
        mClearButton.setEnabled(flag);
        mDefaultButton.setEnabled(flag);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
    }

    public Dialog onCreateDialog(int i)
    {
        android.app.AlertDialog alertdialog = null;
        if (i == 0)
        {
            String s = mHostnameField.getText().toString().trim();
            String s1 = mPortField.getText().toString().trim();
            String s2 = mExclusionListField.getText().toString().trim();
            String s3 = getActivity().getString(validate(s, s1, s2));
            alertdialog = (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0308).setPositiveButton(0x7f0b0309, null).setMessage(s3).create();
        }
        return alertdialog;
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mView = layoutinflater.inflate(0x7f04007d, viewgroup, false);
        initView(mView);
        populateFields();
        return mView;
    }

    void populateFields()
    {
        Activity activity = getActivity();
        String s = "";
        int i = -1;
        String s1 = "";
        ProxyProperties proxyproperties = ((ConnectivityManager)getActivity().getSystemService("connectivity")).getGlobalProxy();
        if (proxyproperties != null)
        {
            s = proxyproperties.getHost();
            i = proxyproperties.getPort();
            s1 = proxyproperties.getExclusionList();
        }
        if (s == null)
            s = "";
        mHostnameField.setText(s);
        String s2;
        if (i == -1)
            s2 = "";
        else
            s2 = Integer.toString(i);
        mPortField.setText(s2);
        mExclusionListField.setText(s1);
        Intent intent = activity.getIntent();
        String s3 = intent.getStringExtra("button-label");
        if (!TextUtils.isEmpty(s3))
            mOKButton.setText(s3);
        String s4 = intent.getStringExtra("title");
        if (!TextUtils.isEmpty(s4))
            activity.setTitle(s4);
    }

    boolean saveToDb()
    {
        String s = mHostnameField.getText().toString().trim();
        String s1 = mPortField.getText().toString().trim();
        String s2 = mExclusionListField.getText().toString().trim();
        if (validate(s, s1, s2) > 0)
        {
            showDialog(0);
            return false;
        }
        int i = s1.length();
        int j = 0;
        if (i > 0)
        {
            ProxyProperties proxyproperties;
            int k;
            try
            {
                k = Integer.parseInt(s1);
            }
            catch (NumberFormatException numberformatexception)
            {
                return false;
            }
            j = k;
        }
        proxyproperties = new ProxyProperties(s, j, s2);
        ((ConnectivityManager)getActivity().getSystemService("connectivity")).setGlobalProxy(proxyproperties);
        return true;
    }

}
