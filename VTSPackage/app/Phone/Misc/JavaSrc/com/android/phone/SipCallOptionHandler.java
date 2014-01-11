// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.net.*;
import android.net.sip.*;
import android.os.Bundle;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.CallManager;
import com.android.internal.telephony.PhoneFactory;
import com.android.phone.sip.SipProfileDb;
import com.android.phone.sip.SipSettings;
import com.android.phone.sip.SipSharedPreferences;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, PhoneUtils, PhoneInterfaceManager, CallController

public class SipCallOptionHandler extends Activity
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnCancelListener, android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final boolean DBG = true;
    static final int DIALOG_NO_INTERNET_ERROR = 3;
    static final int DIALOG_NO_VOIP = 4;
    static final int DIALOG_SELECT_OUTGOING_SIP_PHONE = 1;
    static final int DIALOG_SELECT_PHONE_TYPE = 0;
    static final int DIALOG_SIZE = 5;
    static final int DIALOG_START_SIP_SETTINGS = 2;
    static final String TAG = "SipCallOptionHandler";
    private String mCallOption;
    private Dialog mDialogs[];
    private Intent mIntent;
    private boolean mMakePrimary;
    private String mNumber;
    private SipProfile mOutgoingSipProfile;
    private List mProfileList;
    private SipProfileDb mSipProfileDb;
    private SipSharedPreferences mSipSharedPreferences;
    private TextView mUnsetPriamryHint;
    private boolean mUseSipPhone;

    public SipCallOptionHandler()
    {
        mDialogs = new Dialog[5];
        mUseSipPhone = false;
        mMakePrimary = false;
    }

    private void addActualNumberForSipCall()
    {
        if ("sip".equals(mIntent.getData().getScheme()) && !PhoneNumberUtils.isUriNumber(mNumber))
        {
            mNumber = PhoneNumberUtils.stripSeparators(mNumber);
            if (!TextUtils.isEmpty(mNumber))
                mIntent.putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", mNumber);
        }
    }

    private void addMakeDefaultCheckBox(Dialog dialog)
    {
        View view = ((LayoutInflater)getSystemService("layout_inflater")).inflate(0x1090028, null);
        CheckBox checkbox = (CheckBox)view.findViewById(0x1020266);
        checkbox.setText(0x7f0d032a);
        checkbox.setOnCheckedChangeListener(this);
        mUnsetPriamryHint = (TextView)view.findViewById(0x1020267);
        mUnsetPriamryHint.setText(0x7f0d032b);
        mUnsetPriamryHint.setVisibility(8);
        ((AlertDialog)dialog).setView(view);
    }

    private void createSipPhoneIfNeeded(SipProfile sipprofile)
    {
        CallManager callmanager;
        callmanager = PhoneGlobals.getInstance().mCM;
        if (PhoneUtils.getSipPhoneFromUri(callmanager, sipprofile.getUriString()) != null)
            return;
        com.android.internal.telephony.sip.SipPhone sipphone;
        SipManager.newInstance(this).open(sipprofile);
        sipphone = PhoneFactory.makeSipPhone(sipprofile.getUriString());
        if (sipphone != null)
        {
            try
            {
                callmanager.registerPhone(sipphone);
                return;
            }
            catch (SipException sipexception)
            {
                Log.e("SipCallOptionHandler", (new StringBuilder()).append("cannot open sip profile").append(sipprofile).toString(), sipexception);
            }
            return;
        }
        Log.e("SipCallOptionHandler", (new StringBuilder()).append("cannot make sipphone profile").append(sipprofile).toString());
        return;
    }

    private SipProfile getPrimaryFromExistingProfiles(String s)
    {
        mProfileList = mSipProfileDb.retrieveSipProfileList();
        if (mProfileList == null)
            return null;
        for (Iterator iterator = mProfileList.iterator(); iterator.hasNext();)
        {
            SipProfile sipprofile = (SipProfile)iterator.next();
            if (sipprofile.getUriString().equals(s))
                return sipprofile;
        }

        return null;
    }

    private void getPrimarySipPhone()
    {
        mOutgoingSipProfile = getPrimaryFromExistingProfiles(mSipSharedPreferences.getPrimaryAccount());
        if (mOutgoingSipProfile == null && mProfileList != null && mProfileList.size() > 0)
        {
            runOnUiThread(new Runnable() {

                final SipCallOptionHandler this$0;

                public void run()
                {
                    showDialog(1);
                }

            
            {
                this$0 = SipCallOptionHandler.this;
                super();
            }
            }
);
            return;
        } else
        {
            setResultAndFinish();
            return;
        }
    }

    private CharSequence[] getProfileNameArray()
    {
        CharSequence acharsequence[] = new CharSequence[mProfileList.size()];
        int i = 0;
        for (Iterator iterator = mProfileList.iterator(); iterator.hasNext();)
        {
            SipProfile sipprofile = (SipProfile)iterator.next();
            int j = i + 1;
            acharsequence[i] = sipprofile.getProfileName();
            i = j;
        }

        return acharsequence;
    }

    private boolean isNetworkConnected()
    {
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        if (connectivitymanager != null)
        {
            NetworkInfo networkinfo = connectivitymanager.getActiveNetworkInfo();
            if (networkinfo != null && networkinfo.isConnected() && (networkinfo.getType() == 1 || !SipManager.isSipWifiOnly(this)))
                return true;
        }
        return false;
    }

    private void setResultAndFinish()
    {
        runOnUiThread(new Runnable() {

            final SipCallOptionHandler this$0;

            public void run()
            {
                if (mOutgoingSipProfile != null)
                {
                    if (!isNetworkConnected())
                    {
                        showDialog(3);
                        return;
                    }
                    Log.v("SipCallOptionHandler", (new StringBuilder()).append("primary SIP URI is ").append(mOutgoingSipProfile.getUriString()).toString());
                    createSipPhoneIfNeeded(mOutgoingSipProfile);
                    mIntent.putExtra("android.phone.extra.SIP_PHONE_URI", mOutgoingSipProfile.getUriString());
                    if (mMakePrimary)
                        mSipSharedPreferences.setPrimaryAccount(mOutgoingSipProfile.getUriString());
                }
                if (mUseSipPhone && mOutgoingSipProfile == null)
                {
                    showDialog(2);
                    return;
                } else
                {
                    PhoneGlobals.getInstance().callController.placeCall(mIntent);
                    finish();
                    return;
                }
            }

            
            {
                this$0 = SipCallOptionHandler.this;
                super();
            }
        }
);
    }

    private void startGetPrimarySipPhoneThread()
    {
        (new Thread(new Runnable() {

            final SipCallOptionHandler this$0;

            public void run()
            {
                getPrimarySipPhone();
            }

            
            {
                this$0 = SipCallOptionHandler.this;
                super();
            }
        }
)).start();
    }

    void log(String s)
    {
        Log.i("SipCallOptionHandler", s);
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        finish();
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        mMakePrimary = flag;
        if (flag)
        {
            mUnsetPriamryHint.setVisibility(0);
            return;
        } else
        {
            mUnsetPriamryHint.setVisibility(4);
            return;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
label0:
        {
            if (i == -2)
            {
                finish();
                return;
            }
            if (dialoginterface == mDialogs[0])
            {
                String s = getResources().getStringArray(0x7f070004)[i];
                Log.v("SipCallOptionHandler", (new StringBuilder()).append("User pick phone ").append(s).toString());
                if (s.equals(getString(0x7f0d032d)))
                {
                    mUseSipPhone = true;
                    startGetPrimarySipPhoneThread();
                    return;
                }
            } else
            {
                if (dialoginterface != mDialogs[1])
                    break label0;
                mOutgoingSipProfile = (SipProfile)mProfileList.get(i);
            }
            setResultAndFinish();
            return;
        }
        if (dialoginterface != mDialogs[3] && dialoginterface != mDialogs[4])
        {
            if (i == -1)
            {
                Intent intent = new Intent(this, com/android/phone/sip/SipSettings);
                intent.addFlags(0x10000000);
                startActivity(intent);
            }
            finish();
            return;
        } else
        {
            finish();
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
label0:
        {
            super.onCreate(bundle);
            Intent intent = getIntent();
            String s = intent.getAction();
            if (!"com.android.phone.SIP_SELECT_PHONE".equals(s))
            {
                Log.wtf("SipCallOptionHandler", (new StringBuilder()).append("onCreate: got intent action '").append(s).append("', expected ").append("com.android.phone.SIP_SELECT_PHONE").toString());
                finish();
                return;
            }
            mIntent = (Intent)intent.getParcelableExtra("android.phone.extra.NEW_CALL_INTENT");
            if (mIntent == null)
            {
                finish();
                return;
            }
            getWindow().addFlags(0x80000);
            boolean flag = PhoneUtils.isVoipSupported();
            Log.v("SipCallOptionHandler", (new StringBuilder()).append("voipSupported: ").append(flag).toString());
            mSipProfileDb = new SipProfileDb(this);
            mSipSharedPreferences = new SipSharedPreferences(this);
            mCallOption = mSipSharedPreferences.getSipCallOption();
            Log.v("SipCallOptionHandler", (new StringBuilder()).append("Call option: ").append(mCallOption).toString());
            String s1 = mIntent.getData().getScheme();
            mNumber = PhoneNumberUtils.getNumberFromIntent(mIntent, this);
            PhoneGlobals.getInstance().phoneMgr.isRadioOn();
            boolean flag1;
            if (!"tel".equals(s1) && !"sip".equals(s1))
                flag1 = false;
            else
                flag1 = true;
            boolean flag2;
            if ("tel".equals(s1) && !PhoneNumberUtils.isUriNumber(mNumber))
                flag2 = true;
            else
                flag2 = false;
            addActualNumberForSipCall();
            if (!flag1)
            {
                setResultAndFinish();
                return;
            }
            if (!flag)
                if (!flag2)
                {
                    showDialog(4);
                    return;
                } else
                {
                    setResultAndFinish();
                    return;
                }
            if (!PhoneUtils.hasPhoneProviderExtras(mIntent))
                if (!isNetworkConnected())
                {
                    if (!flag2)
                    {
                        showDialog(3);
                        return;
                    }
                } else
                {
                    mUseSipPhone = true;
                }
            if (mUseSipPhone)
            {
                if (mSipProfileDb.getProfilesCount() > 0 || !flag2)
                    break label0;
                mUseSipPhone = false;
            }
            setResultAndFinish();
            return;
        }
        startGetPrimarySipPhoneThread();
    }

    protected Dialog onCreateDialog(int i)
    {
        AlertDialog alertdialog;
        switch (i)
        {
        case 4: // '\004'
            alertdialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0d0364).setIconAttribute(0x1010355).setPositiveButton(0x104000a, this).setOnCancelListener(this).create();
            break;

        case 3: // '\003'
            boolean flag = SipManager.isSipWifiOnly(this);
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
            int j;
            if (flag)
                j = 0x7f0d0361;
            else
                j = 0x7f0d0360;
            android.app.AlertDialog.Builder builder1 = builder.setTitle(j);
            int k;
            if (flag)
                k = 0x7f0d0363;
            else
                k = 0x7f0d0362;
            alertdialog = builder1.setMessage(k).setIconAttribute(0x1010355).setPositiveButton(0x104000a, this).setOnCancelListener(this).create();
            break;

        case 2: // '\002'
            alertdialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0d032e).setMessage(0x7f0d032f).setIconAttribute(0x1010355).setPositiveButton(0x7f0d0330, this).setNegativeButton(0x1040000, this).setOnCancelListener(this).create();
            break;

        case 1: // '\001'
            alertdialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0d0329).setIconAttribute(0x1010355).setSingleChoiceItems(getProfileNameArray(), -1, this).setNegativeButton(0x1040000, this).setOnCancelListener(this).create();
            addMakeDefaultCheckBox(alertdialog);
            break;

        case 0: // '\0'
            alertdialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0d0328).setIconAttribute(0x1010355).setSingleChoiceItems(0x7f070004, -1, this).setNegativeButton(0x1040000, this).setOnCancelListener(this).create();
            break;

        default:
            alertdialog = null;
            break;
        }
        if (alertdialog != null)
            mDialogs[i] = alertdialog;
        return alertdialog;
    }

    public void onPause()
    {
        super.onPause();
        if (isFinishing())
            return;
        Dialog adialog[] = mDialogs;
        int i = adialog.length;
        for (int j = 0; j < i; j++)
        {
            Dialog dialog = adialog[j];
            if (dialog != null)
                dialog.dismiss();
        }

        finish();
    }








}
