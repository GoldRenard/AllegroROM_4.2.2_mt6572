// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.vpn2;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.security.KeyStore;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.*;
import android.widget.*;
import com.android.internal.net.VpnProfile;
import java.net.InetAddress;

class VpnDialog extends AlertDialog
    implements TextWatcher, android.view.View.OnClickListener, android.widget.AdapterView.OnItemSelectedListener
{

    private TextView mDnsServers;
    private boolean mEditing;
    private Spinner mIpsecCaCert;
    private TextView mIpsecIdentifier;
    private TextView mIpsecSecret;
    private Spinner mIpsecServerCert;
    private Spinner mIpsecUserCert;
    private final KeyStore mKeyStore = KeyStore.getInstance();
    private TextView mL2tpSecret;
    private final android.content.DialogInterface.OnClickListener mListener;
    private CheckBox mMppe;
    private TextView mName;
    private TextView mPassword;
    private final VpnProfile mProfile;
    private TextView mRoutes;
    private CheckBox mSaveLogin;
    private TextView mSearchDomains;
    private TextView mServer;
    private Spinner mType;
    private TextView mUsername;
    private View mView;

    VpnDialog(Context context, android.content.DialogInterface.OnClickListener onclicklistener, VpnProfile vpnprofile, boolean flag)
    {
        super(context);
        mListener = onclicklistener;
        mProfile = vpnprofile;
        mEditing = flag;
    }

    private void changeType(int i)
    {
        mMppe.setVisibility(8);
        mView.findViewById(0x7f0801aa).setVisibility(8);
        mView.findViewById(0x7f0801ac).setVisibility(8);
        mView.findViewById(0x7f0801af).setVisibility(8);
        mView.findViewById(0x7f0801b1).setVisibility(8);
        switch (i)
        {
        case 2: // '\002'
            mView.findViewById(0x7f0801aa).setVisibility(0);
            // fall through

        case 4: // '\004'
            mView.findViewById(0x7f0801af).setVisibility(0);
            // fall through

        case 5: // '\005'
            mView.findViewById(0x7f0801b1).setVisibility(0);
            return;

        case 1: // '\001'
            mView.findViewById(0x7f0801aa).setVisibility(0);
            // fall through

        case 3: // '\003'
            mView.findViewById(0x7f0801ac).setVisibility(0);
            return;

        case 0: // '\0'
            mMppe.setVisibility(0);
            return;

        default:
            return;
        }
    }

    private void loadCertificates(Spinner spinner, String s, int i, String s1)
    {
        Context context = getContext();
        String s2;
        if (i == 0)
            s2 = "";
        else
            s2 = context.getString(i);
        String as[] = mKeyStore.saw(s);
        String as1[];
        if (as != null && as.length != 0)
        {
            String as2[] = new String[1 + as.length];
            as2[0] = s2;
            System.arraycopy(as, 0, as2, 1, as.length);
            as1 = as2;
        } else
        {
            as1 = (new String[] {
                s2
            });
        }
        ArrayAdapter arrayadapter = new ArrayAdapter(context, 0x1090008, as1);
        arrayadapter.setDropDownViewResource(0x1090009);
        spinner.setAdapter(arrayadapter);
        int j = 1;
        do
        {
label0:
            {
                if (j < as1.length)
                {
                    if (!as1[j].equals(s1))
                        break label0;
                    spinner.setSelection(j);
                }
                return;
            }
            j++;
        } while (true);
    }

    private boolean validate(boolean flag)
    {
label0:
        {
label1:
            {
                if (!flag)
                {
                    if (mUsername.getText().length() == 0 || mPassword.getText().length() == 0)
                        return false;
                } else
                {
                    if (mName.getText().length() == 0 || mServer.getText().length() == 0 || !validateAddresses(mDnsServers.getText().toString(), false) || !validateAddresses(mRoutes.getText().toString(), true))
                        break label0;
                    switch (mType.getSelectedItemPosition())
                    {
                    default:
                        break label1;

                    case 0: // '\0'
                    case 5: // '\005'
                        break;

                    case 2: // '\002'
                    case 4: // '\004'
                        if (mIpsecUserCert.getSelectedItemPosition() == 0)
                            return false;
                        break;

                    case 1: // '\001'
                    case 3: // '\003'
                        if (mIpsecSecret.getText().length() == 0)
                            return false;
                        break;
                    }
                }
                return true;
            }
            return false;
        }
        return false;
    }

    private boolean validateAddresses(String s, boolean flag)
    {
        int j;
        String as[];
        int i;
        String s1;
        int k;
        String as1[];
        byte abyte0[];
        int l;
        int i1;
        try
        {
            as = s.split(" ");
            i = as.length;
        }
        catch (Exception exception)
        {
            return false;
        }
        j = 0;
_L2:
        if (j >= i)
            break MISSING_BLOCK_LABEL_173;
        s1 = as[j];
        if (s1.isEmpty())
            break MISSING_BLOCK_LABEL_175;
        k = 32;
        if (!flag)
            break MISSING_BLOCK_LABEL_74;
        as1 = s1.split("/", 2);
        s1 = as1[0];
        k = Integer.parseInt(as1[1]);
        abyte0 = InetAddress.parseNumericAddress(s1).getAddress();
        l = 0xff & abyte0[3] | (0xff & abyte0[2]) << 8 | (0xff & abyte0[1]) << 16 | (0xff & abyte0[0]) << 24;
        i1 = abyte0.length;
        if (i1 != 4 || k < 0 || k > 32 || k < 32 && l << k != 0)
            return false;
        break MISSING_BLOCK_LABEL_175;
        return true;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void afterTextChanged(Editable editable)
    {
        getButton(-1).setEnabled(validate(mEditing));
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    VpnProfile getProfile()
    {
        VpnProfile vpnprofile = new VpnProfile(mProfile.key);
        vpnprofile.name = mName.getText().toString();
        vpnprofile.type = mType.getSelectedItemPosition();
        vpnprofile.server = mServer.getText().toString().trim();
        vpnprofile.username = mUsername.getText().toString();
        vpnprofile.password = mPassword.getText().toString();
        vpnprofile.searchDomains = mSearchDomains.getText().toString().trim();
        vpnprofile.dnsServers = mDnsServers.getText().toString().trim();
        vpnprofile.routes = mRoutes.getText().toString().trim();
        switch (vpnprofile.type)
        {
        default:
            break;

        case 2: // '\002'
            vpnprofile.l2tpSecret = mL2tpSecret.getText().toString();
            // fall through

        case 4: // '\004'
            if (mIpsecUserCert.getSelectedItemPosition() != 0)
                vpnprofile.ipsecUserCert = (String)mIpsecUserCert.getSelectedItem();
            // fall through

        case 5: // '\005'
            if (mIpsecCaCert.getSelectedItemPosition() != 0)
                vpnprofile.ipsecCaCert = (String)mIpsecCaCert.getSelectedItem();
            if (mIpsecServerCert.getSelectedItemPosition() != 0)
                vpnprofile.ipsecServerCert = (String)mIpsecServerCert.getSelectedItem();
            break;

        case 1: // '\001'
            vpnprofile.l2tpSecret = mL2tpSecret.getText().toString();
            // fall through

        case 3: // '\003'
            vpnprofile.ipsecIdentifier = mIpsecIdentifier.getText().toString();
            vpnprofile.ipsecSecret = mIpsecSecret.getText().toString();
            break;

        case 0: // '\0'
            vpnprofile.mppe = mMppe.isChecked();
            break;
        }
        vpnprofile.saveLogin = mSaveLogin.isChecked();
        return vpnprofile;
    }

    boolean isEditing()
    {
        return mEditing;
    }

    public void onClick(View view)
    {
        view.setVisibility(8);
        mView.findViewById(0x7f0801b5).setVisibility(0);
    }

    protected void onCreate(Bundle bundle)
    {
        mView = getLayoutInflater().inflate(0x7f04009c, null);
        setView(mView);
        setInverseBackgroundForced(true);
        Context context = getContext();
        mName = (TextView)mView.findViewById(0x7f08007a);
        mType = (Spinner)mView.findViewById(0x7f0801a7);
        mServer = (TextView)mView.findViewById(0x7f0801a8);
        mUsername = (TextView)mView.findViewById(0x7f0801ba);
        mPassword = (TextView)mView.findViewById(0x7f0801bb);
        mSearchDomains = (TextView)mView.findViewById(0x7f0801b6);
        mDnsServers = (TextView)mView.findViewById(0x7f0801b7);
        mRoutes = (TextView)mView.findViewById(0x7f0801b8);
        mMppe = (CheckBox)mView.findViewById(0x7f0801a9);
        mL2tpSecret = (TextView)mView.findViewById(0x7f0801ab);
        mIpsecIdentifier = (TextView)mView.findViewById(0x7f0801ad);
        mIpsecSecret = (TextView)mView.findViewById(0x7f0801ae);
        mIpsecUserCert = (Spinner)mView.findViewById(0x7f0801b0);
        mIpsecCaCert = (Spinner)mView.findViewById(0x7f0801b2);
        mIpsecServerCert = (Spinner)mView.findViewById(0x7f0801b3);
        mSaveLogin = (CheckBox)mView.findViewById(0x7f0801bc);
        mName.setText(mProfile.name);
        mType.setSelection(mProfile.type);
        mServer.setText(mProfile.server);
        if (mProfile.saveLogin)
        {
            mUsername.setText(mProfile.username);
            mPassword.setText(mProfile.password);
        }
        mSearchDomains.setText(mProfile.searchDomains);
        mDnsServers.setText(mProfile.dnsServers);
        mRoutes.setText(mProfile.routes);
        mMppe.setChecked(mProfile.mppe);
        mL2tpSecret.setText(mProfile.l2tpSecret);
        mIpsecIdentifier.setText(mProfile.ipsecIdentifier);
        mIpsecSecret.setText(mProfile.ipsecSecret);
        loadCertificates(mIpsecUserCert, "USRPKEY_", 0, mProfile.ipsecUserCert);
        loadCertificates(mIpsecCaCert, "CACERT_", 0x7f0b08e6, mProfile.ipsecCaCert);
        loadCertificates(mIpsecServerCert, "USRCERT_", 0x7f0b08e7, mProfile.ipsecServerCert);
        mSaveLogin.setChecked(mProfile.saveLogin);
        mName.addTextChangedListener(this);
        mType.setOnItemSelectedListener(this);
        mServer.addTextChangedListener(this);
        mUsername.addTextChangedListener(this);
        mPassword.addTextChangedListener(this);
        mDnsServers.addTextChangedListener(this);
        mRoutes.addTextChangedListener(this);
        mIpsecSecret.addTextChangedListener(this);
        mIpsecUserCert.setOnItemSelectedListener(this);
        boolean flag = validate(true);
        boolean flag1;
        if (!mEditing && flag)
            flag1 = false;
        else
            flag1 = true;
        mEditing = flag1;
        if (mEditing)
        {
            setTitle(0x7f0b08eb);
            mView.findViewById(0x7f0801a6).setVisibility(0);
            changeType(mProfile.type);
            View view = mView.findViewById(0x7f0801b4);
            if (mProfile.searchDomains.isEmpty() && mProfile.dnsServers.isEmpty() && mProfile.routes.isEmpty())
                view.setOnClickListener(this);
            else
                onClick(view);
            setButton(-1, context.getString(0x7f0b08e9), mListener);
        } else
        {
            Object aobj[] = new Object[1];
            aobj[0] = mProfile.name;
            setTitle(context.getString(0x7f0b08ec, aobj));
            mView.findViewById(0x7f0801b9).setVisibility(0);
            setButton(-1, context.getString(0x7f0b08ea), mListener);
        }
        setButton(-2, context.getString(0x7f0b08e8), mListener);
        super.onCreate(null);
        Button button = getButton(-1);
        if (!mEditing)
            flag = validate(false);
        button.setEnabled(flag);
        getWindow().setSoftInputMode(20);
    }

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        if (adapterview == mType)
            changeType(i);
        getButton(-1).setEnabled(validate(mEditing));
    }

    public void onNothingSelected(AdapterView adapterview)
    {
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }
}
