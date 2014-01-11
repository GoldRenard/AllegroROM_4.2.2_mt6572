// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.Dialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.util.Log;
import android.view.View;
import android.widget.*;

public class CdmaCallWaitingOptions extends PreferenceActivity
{

    private static final String BUTTON_CW_KEY = "button_cw_key";
    private static final String CW_HEADERS[];
    private static final int DIALOG_CW = 0;
    private static final int GET_CONTACTS = 100;
    private static final String LOG_TAG = "Settings/CdmaCallForwardOptions";
    private static final String NUM_PROJECTION[] = {
        "data1"
    };
    private Preference mButtonCW;
    private int mSlot;


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

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060008);
        mButtonCW = getPreferenceScreen().findPreference("button_cw_key");
        mSlot = getIntent().getIntExtra("simId", -1);
    }

    protected Dialog onCreateDialog(final int id)
    {
        final Dialog dialog = new Dialog(this);
        dialog.setContentView(0x7f04000c);
        dialog.setTitle(mButtonCW.getTitle());
        final RadioGroup radioGroup = (RadioGroup)dialog.findViewById(0x1010001);
        TextView textview = (TextView)dialog.findViewById(0x1010000);
        if (textview != null)
            textview.setVisibility(8);
        else
            Log.d("Settings/CdmaCallForwardOptions", "--------------[text view is null]---------------");
        EditText edittext = (EditText)dialog.findViewById(0x7f080011);
        if (edittext != null)
            edittext.setVisibility(8);
        ImageButton imagebutton = (ImageButton)dialog.findViewById(0x7f080012);
        if (imagebutton != null)
            imagebutton.setVisibility(8);
        Button button = (Button)dialog.findViewById(0x7f080027);
        if (button != null)
            button.setOnClickListener(new android.view.View.OnClickListener() {

                final CdmaCallWaitingOptions this$0;
                final Dialog val$dialog;
                final int val$id;
                final RadioGroup val$radioGroup;

                public void onClick(View view)
                {
                    if (radioGroup.getCheckedRadioButtonId() == -1)
                    {
                        dialog.dismiss();
                        return;
                    }
                    int i;
                    if (radioGroup.getCheckedRadioButtonId() == 0x1010002)
                        i = 0;
                    else
                        i = 1;
                    int j = i + 2 * id;
                    String s = CdmaCallWaitingOptions.CW_HEADERS[j];
                    dialog.dismiss();
                    setCallForward(s);
                }

            
            {
                this$0 = CdmaCallWaitingOptions.this;
                radioGroup = radiogroup;
                dialog = dialog1;
                id = i;
                super();
            }
            }
);
        Button button1 = (Button)dialog.findViewById(0x7f080026);
        if (button1 != null)
            button1.setOnClickListener(new android.view.View.OnClickListener() {

                final CdmaCallWaitingOptions this$0;
                final Dialog val$dialog;

                public void onClick(View view)
                {
                    dialog.dismiss();
                }

            
            {
                this$0 = CdmaCallWaitingOptions.this;
                dialog = dialog1;
                super();
            }
            }
);
        return dialog;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mButtonCW)
            showDialog(0);
        return true;
    }

    static 
    {
        String as[] = new String[2];
        as[0] = SystemProperties.get("ro.cdma.cw.enable");
        as[1] = SystemProperties.get("ro.cdma.cw.disable");
        CW_HEADERS = as;
    }


}
