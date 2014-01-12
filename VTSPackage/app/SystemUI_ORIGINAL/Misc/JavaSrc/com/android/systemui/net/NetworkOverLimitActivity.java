// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.net;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.INetworkPolicyManager;
import android.net.NetworkTemplate;
import android.os.*;
import android.util.Slog;
import android.view.Window;

public class NetworkOverLimitActivity extends Activity
{

    private static final String TAG = "NetworkOverLimitActivity";
    private boolean isReenabled;

    public NetworkOverLimitActivity()
    {
        isReenabled = false;
    }

    private static int getLimitedDialogTitleForTemplate(NetworkTemplate networktemplate)
    {
        switch (networktemplate.getMatchRule())
        {
        case 1: // '\001'
            return 0x7f0b003b;

        case 3: // '\003'
            return 0x7f0b003a;

        case 2: // '\002'
            return 0x7f0b0039;
        }
        return 0x7f0b003c;
    }

    private void sendBroadcast()
    {
        Slog.v("NetworkOverLimitActivity", "sendBroadcast ACTION_DATA_USAGE_DISABLED_DIALOG_OK");
        Intent intent = new Intent("com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK");
        intent.addFlags(0x20000000);
        sendBroadcast(intent);
    }

    private void snoozePolicy(NetworkTemplate networktemplate)
    {
        INetworkPolicyManager inetworkpolicymanager = android.net.INetworkPolicyManager.Stub.asInterface(ServiceManager.getService("netpolicy"));
        try
        {
            inetworkpolicymanager.snoozeLimit(networktemplate);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Slog.w("NetworkOverLimitActivity", "problem snoozing network policy", remoteexception);
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        final NetworkTemplate template = (NetworkTemplate)getIntent().getParcelableExtra("android.net.NETWORK_TEMPLATE");
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setTitle(getLimitedDialogTitleForTemplate(template));
        builder.setMessage(0x7f0b003d);
        builder.setPositiveButton(0x104000a, null);
        builder.setNegativeButton(0x7f0b003e, new android.content.DialogInterface.OnClickListener() {

            final NetworkOverLimitActivity this$0;
            final NetworkTemplate val$template;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                isReenabled = true;
                snoozePolicy(template);
            }

            
            {
                this$0 = NetworkOverLimitActivity.this;
                template = networktemplate;
                super();
            }
        }
);
        AlertDialog alertdialog = builder.create();
        alertdialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

            final NetworkOverLimitActivity this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                if (!isReenabled)
                    sendBroadcast();
                finish();
            }

            
            {
                this$0 = NetworkOverLimitActivity.this;
                super();
            }
        }
);
        alertdialog.getWindow().setType(2003);
        alertdialog.show();
    }



/*
    static boolean access$002(NetworkOverLimitActivity networkoverlimitactivity, boolean flag)
    {
        networkoverlimitactivity.isReenabled = flag;
        return flag;
    }

*/


}
