// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.mmi;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import com.mediatek.activity.CancelableActivity;
import com.mediatek.bluetooth.opp.adp.OppManager;
import com.mediatek.bluetooth.util.BtLog;

// Referenced classes of package com.mediatek.bluetooth.opp.mmi:
//            OppLog

public class OppCancelActivity extends CancelableActivity
{


    private void onTaskCancel()
    {
        Uri uri = getIntent().getData();
        OppLog.d((new StringBuilder()).append("cancel task - uri[").append(uri).append("]").toString());
        OppManager.getInstance(this).oppAbortTask(uri);
    }

    protected void onActivityCancel(int i)
    {
        if (i != 0xfff6563d) goto _L2; else goto _L1
_L1:
        BtLog.d("cancel OppCancelActivity by NullCancelId broadcast.");
_L4:
        finish();
        return;
_L2:
        int j = Integer.parseInt(getIntent().getData().getLastPathSegment());
        if (j != i)
            return;
        continue; /* Loop/switch isn't completed */
        NumberFormatException numberformatexception;
        numberformatexception;
        OppLog.e((new StringBuilder()).append("OppCancelActivity.onActivityCancel() error: intent[").append(getIntent()).append("], exception[").append(numberformatexception.getMessage()).append("]").toString());
        if (true) goto _L4; else goto _L3
_L3:
    }

    protected Dialog onCreateDialog(int i)
    {
        return (new android.app.AlertDialog.Builder(this)).setTitle(0x7f05002d).setMessage(0x7f05002e).setPositiveButton(0x7f05002f, new android.content.DialogInterface.OnClickListener() {

            final OppCancelActivity this$0;

            public void onClick(DialogInterface dialoginterface, int j)
            {
                onTaskCancel();
                finish();
            }

            
            {
                this$0 = OppCancelActivity.this;
                super();
            }
        }
).setNegativeButton(0x7f050030, new android.content.DialogInterface.OnClickListener() {

            final OppCancelActivity this$0;

            public void onClick(DialogInterface dialoginterface, int j)
            {
                finish();
            }

            
            {
                this$0 = OppCancelActivity.this;
                super();
            }
        }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

            final OppCancelActivity this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
                finish();
            }

            
            {
                this$0 = OppCancelActivity.this;
                super();
            }
        }
).create();
    }

    protected void onResume()
    {
        super.onResume();
        setVisible(false);
        showDialog(0);
    }

}
