// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.content.*;
import android.hardware.usb.UsbAccessory;
import android.net.Uri;
import android.os.Bundle;
import android.os.UserHandle;
import android.util.Log;
import com.android.internal.app.AlertActivity;

public class UsbAccessoryUriActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener
{

    private static final String TAG = "UsbAccessoryUriActivity";
    private UsbAccessory mAccessory;
    private Uri mUri;


    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            Intent intent = new Intent("android.intent.action.VIEW", mUri);
            intent.addCategory("android.intent.category.BROWSABLE");
            intent.addFlags(0x10000000);
            try
            {
                startActivityAsUser(intent, UserHandle.CURRENT);
            }
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                Log.e("UsbAccessoryUriActivity", (new StringBuilder()).append("startActivity failed for ").append(mUri).toString());
            }
        }
        finish();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        mAccessory = (UsbAccessory)intent.getParcelableExtra("accessory");
        String s = intent.getStringExtra("uri");
        Uri uri;
        if (s == null)
            uri = null;
        else
            uri = Uri.parse(s);
        mUri = uri;
        if (mUri == null)
        {
            Log.e("UsbAccessoryUriActivity", (new StringBuilder()).append("could not parse Uri ").append(s).toString());
            finish();
            return;
        }
        String s1 = mUri.getScheme();
        if (!"http".equals(s1) && !"https".equals(s1))
        {
            Log.e("UsbAccessoryUriActivity", (new StringBuilder()).append("Uri not http or https: ").append(mUri).toString());
            finish();
            return;
        }
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mTitle = mAccessory.getDescription();
        if (alertparams.mTitle == null || alertparams.mTitle.length() == 0)
            alertparams.mTitle = getString(0x7f0b0064);
        Object aobj[] = new Object[1];
        aobj[0] = mUri;
        alertparams.mMessage = getString(0x7f0b0063, aobj);
        alertparams.mPositiveButtonText = getString(0x7f0b0065);
        alertparams.mNegativeButtonText = getString(0x1040000);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonListener = this;
        setupAlert();
    }
}
