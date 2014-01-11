// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.view.MenuItem;
import android.view.View;
import android.widget.*;
import java.util.ArrayList;

public class CdmaCallForwardOptions extends PreferenceActivity
{

    private static final String BUTTON_CFB_KEY = "button_cfb_key";
    private static final String BUTTON_CFC_KEY = "button_cfc_key";
    private static final String BUTTON_CFNRC_KEY = "button_cfnrc_key";
    private static final String BUTTON_CFNRY_KEY = "button_cfnry_key";
    private static final String BUTTON_CFU_KEY = "button_cfu_key";
    private static final String CF_HEADERS[];
    private static final int DIALOG_CFB = 1;
    private static final int DIALOG_CFC = 4;
    private static final int DIALOG_CFNRC = 3;
    private static final int DIALOG_CFNRY = 2;
    private static final int DIALOG_CFU = 0;
    private static final int GET_CONTACTS = 100;
    private static final String LOG_TAG = "Settings/CdmaCallForwardOptions";
    private static final String NUM_PROJECTION[] = {
        "data1"
    };
    private Preference mButtonCFB;
    private Preference mButtonCFC;
    private Preference mButtonCFNRc;
    private Preference mButtonCFNRy;
    private Preference mButtonCFU;
    private EditText mEditNumber;
    private ArrayList mPreferences;
    private int mSlot;

    public CdmaCallForwardOptions()
    {
        mPreferences = null;
        mEditNumber = null;
    }

    private void setCallForward(String s)
    {
        if (mSlot != -1 && s != null && !s.isEmpty())
        {
            Intent intent = new Intent("android.intent.action.CALL");
            intent.setData(Uri.parse((new StringBuilder()).append("tel:").append(s).toString()));
            intent.putExtra("com.android.phone.extra.slot", mSlot);
            startActivity(intent);
            return;
        } else
        {
            return;
        }
    }

    private void startContacts()
    {
        Intent intent = new Intent("android.intent.action.GET_CONTENT");
        intent.setType("vnd.android.cursor.item/phone_v2");
        startActivityForResult(intent, 100);
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        if (j == -1 && i == 100 && intent != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        Cursor cursor = null;
        cursor = getContentResolver().query(intent.getData(), NUM_PROJECTION, null, null, null);
        if (cursor == null)
            continue; /* Loop/switch isn't completed */
        if (cursor.moveToFirst() && mEditNumber != null)
            mEditNumber.setText(cursor.getString(0));
        if (cursor == null) goto _L1; else goto _L3
_L3:
        cursor.close();
        return;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060007);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mButtonCFU = preferencescreen.findPreference("button_cfu_key");
        mButtonCFB = preferencescreen.findPreference("button_cfb_key");
        mButtonCFNRy = preferencescreen.findPreference("button_cfnry_key");
        mButtonCFNRc = preferencescreen.findPreference("button_cfnrc_key");
        mButtonCFC = preferencescreen.findPreference("button_cfc_key");
        mPreferences = new ArrayList();
        mPreferences.add(mButtonCFU);
        mPreferences.add(mButtonCFB);
        mPreferences.add(mButtonCFNRy);
        mPreferences.add(mButtonCFNRc);
        mPreferences.add(mButtonCFC);
        mSlot = getIntent().getIntExtra("simId", -1);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected Dialog onCreateDialog(final int id)
    {
        final Dialog dialog = new Dialog(this);
        dialog.setContentView(0x7f04000c);
        dialog.setTitle(((Preference)mPreferences.get(id)).getTitle());
        final RadioGroup radioGroup = (RadioGroup)dialog.findViewById(0x1010001);
        mEditNumber = (EditText)dialog.findViewById(0x7f080011);
        ImageButton imagebutton = (ImageButton)dialog.findViewById(0x7f080012);
        if (imagebutton != null)
            imagebutton.setOnClickListener(new android.view.View.OnClickListener() {

                final CdmaCallForwardOptions this$0;

                public void onClick(View view)
                {
                    startContacts();
                }

            
            {
                this$0 = CdmaCallForwardOptions.this;
                super();
            }
            }
);
        Button button = (Button)dialog.findViewById(0x7f080027);
        if (button != null)
            button.setOnClickListener(new android.view.View.OnClickListener() {

                final CdmaCallForwardOptions this$0;
                final Dialog val$dialog;
                final int val$id;
                final RadioGroup val$radioGroup;

                public void onClick(View view)
                {
                    if (radioGroup.getCheckedRadioButtonId() == -1)
                        return;
                    String s;
                    if (radioGroup.getCheckedRadioButtonId() == 0x1010002)
                    {
                        int j = 2 * id;
                        s = (new StringBuilder()).append(CdmaCallForwardOptions.CF_HEADERS[j]).append(mEditNumber.getText()).toString();
                    } else
                    {
                        int i = 1 + 2 * id;
                        s = CdmaCallForwardOptions.CF_HEADERS[i];
                    }
                    dialog.dismiss();
                    setCallForward(s);
                }

            
            {
                this$0 = CdmaCallForwardOptions.this;
                radioGroup = radiogroup;
                id = i;
                dialog = dialog1;
                super();
            }
            }
);
        Button button1 = (Button)dialog.findViewById(0x7f080026);
        if (button1 != null)
            button1.setOnClickListener(new android.view.View.OnClickListener() {

                final CdmaCallForwardOptions this$0;
                final Dialog val$dialog;

                public void onClick(View view)
                {
                    dialog.dismiss();
                }

            
            {
                this$0 = CdmaCallForwardOptions.this;
                dialog = dialog1;
                super();
            }
            }
);
        return dialog;
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

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mButtonCFU)
        {
            showDialog(0);
        } else
        {
            if (preference == mButtonCFB)
            {
                showDialog(1);
                return true;
            }
            if (preference == mButtonCFNRy)
            {
                showDialog(2);
                return true;
            }
            if (preference == mButtonCFNRc)
            {
                showDialog(3);
                return true;
            }
            if (preference == mButtonCFC)
            {
                setCallForward(CF_HEADERS[8]);
                return true;
            }
        }
        return true;
    }

    static 
    {
        String as[] = new String[9];
        as[0] = SystemProperties.get("ro.cdma.cfu.enable");
        as[1] = SystemProperties.get("ro.cdma.cfu.disable");
        as[2] = SystemProperties.get("ro.cdma.cfb.enable");
        as[3] = SystemProperties.get("ro.cdma.cfb.disable");
        as[4] = SystemProperties.get("ro.cdma.cfnr.enable");
        as[5] = SystemProperties.get("ro.cdma.cfnr.disable");
        as[6] = SystemProperties.get("ro.cdma.cfdf.enable");
        as[7] = SystemProperties.get("ro.cdma.cfdf.disable");
        as[8] = SystemProperties.get("ro.cdma.cfall.disable");
        CF_HEADERS = as;
    }




}
