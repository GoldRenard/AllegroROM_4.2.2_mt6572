// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.mmi;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.format.Formatter;
import android.widget.Toast;
import com.mediatek.activity.CancelableActivity;
import com.mediatek.bluetooth.opp.adp.OppManager;
import com.mediatek.bluetooth.util.BtLog;

// Referenced classes of package com.mediatek.bluetooth.opp.mmi:
//            OppLog

public class OppServerActivity extends CancelableActivity
{

    private static final int DIALOG_PUSH_CONFIRMATION = 0;
    private static final String IS_ACTIVE = "is_active";
    private boolean mIsActive;

    public OppServerActivity()
    {
        mIsActive = false;
    }

    private void finishPushActivity(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        OppLog.d((new StringBuilder()).append("OppServerActivity.finishPushActivity()[+]: ").append(flag).toString());
        mIsActive = false;
        int i;
        if (flag)
            i = 1;
        else
            i = 2;
        OppManager.getInstance(this).oppsSubmitTask(i);
        finish();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    protected void onActivityCancel(int i)
    {
        if (i == 0xfff6563d)
            BtLog.d("cancel OppServerActivity by NullCancelId broadcast.");
        else
        if (getIntent().getIntExtra("com.mediatek.bluetooth.opp.extra.TASK_ID", -1) != i)
            return;
        mIsActive = false;
        finish();
    }

    protected void onCreate(Bundle bundle)
    {
        String s;
label0:
        {
            OppLog.i("OppServerActivity.onCreate()[+]");
            super.onCreate(bundle);
            Intent intent = getIntent();
            s = intent.getAction();
            if (bundle != null)
                mIsActive = bundle.getBoolean("is_active", false);
            if ((0x100000 & intent.getFlags()) != 0 && !mIsActive)
            {
                finish();
            } else
            {
                if (!"com.mediatek.bluetooth.opp.action.PUSH_REQUEST".equals(s))
                    break label0;
                OppLog.d("opps puah request start...");
                mIsActive = true;
                String s1 = OppManager.getInstance(this).oppsCheckCurrentTask();
                if (s1 != null)
                {
                    Toast.makeText(this, s1, 1).show();
                    finishPushActivity(false);
                    return;
                }
            }
            return;
        }
        if ("com.mediatek.activity.CancelableActivity.action.CANCEL_ACTIVITY".equals(s))
        {
            finish();
            return;
        } else
        {
            OppLog.w((new StringBuilder()).append("unsupported OppsAccessRequest action: ").append(s).toString());
            finish();
            return;
        }
    }

    protected Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 0: // '\0'
            Intent intent = getIntent();
            String s = intent.getStringExtra("com.mediatek.bluetooth.opp.extra.PEER_NAME");
            String s1 = intent.getStringExtra("com.mediatek.bluetooth.opp.extra.OBJECT_NAME");
            long l = intent.getLongExtra("com.mediatek.bluetooth.opp.extra.TOTAL_BYTES", 0L);
            android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f050032);
            Object aobj[] = new Object[3];
            aobj[0] = s1;
            aobj[1] = Formatter.formatFileSize(this, l);
            aobj[2] = s;
            return builder.setMessage(getString(0x7f050033, aobj)).setPositiveButton(0x7f050034, new android.content.DialogInterface.OnClickListener() {

                final OppServerActivity this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    finishPushActivity(true);
                }

            
            {
                this$0 = OppServerActivity.this;
                super();
            }
            }
).setNegativeButton(0x7f050035, new android.content.DialogInterface.OnClickListener() {

                final OppServerActivity this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    finishPushActivity(false);
                }

            
            {
                this$0 = OppServerActivity.this;
                super();
            }
            }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                final OppServerActivity this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    finishPushActivity(false);
                }

            
            {
                this$0 = OppServerActivity.this;
                super();
            }
            }
).create();
        }
        return null;
    }

    protected void onResume()
    {
        super.onResume();
        setVisible(false);
        showDialog(0);
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        if (mIsActive)
            bundle.putBoolean("is_active", mIsActive);
    }

    protected void onStop()
    {
        super.onStop();
        if (mIsActive)
            OppManager.getInstance(this).oppsSendCurrentIncomingNotification();
    }

}
