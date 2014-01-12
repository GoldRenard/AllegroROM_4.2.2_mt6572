// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.activity;

import android.app.Activity;
import android.app.Dialog;
import android.content.*;
import com.mediatek.bluetooth.util.BtLog;

public class MessageActivity extends Activity
{

    private static final String MESSAGE = "message";
    private static final String NEGATIVE_BUTTON = "negativeButton";
    private static final String POSITIVE_BUTTON = "positiveButton";
    private static final String POSITIVE_INTENT = "positiveIntent";
    public static final int RESULT_ACTION_CANCEL = 2;
    public static final int RESULT_ACTION_CLEAR = 0;
    public static final int RESULT_ACTION_RETRY = 1;
    private static final String TITLE = "title";


    public static Intent createIntent(Context context, String s, String s1, String s2)
    {
        return createIntent(context, s, s1, null, null, s2);
    }

    public static Intent createIntent(Context context, String s, String s1, String s2, Intent intent, String s3)
    {
        Intent intent1 = new Intent(context, com/mediatek/activity/MessageActivity);
        intent1.putExtra("title", s);
        intent1.putExtra("message", s1);
        intent1.putExtra("positiveButton", s2);
        intent1.putExtra("positiveIntent", intent);
        intent1.putExtra("negativeButton", s3);
        return intent1;
    }

    protected Dialog onCreateDialog(int i)
    {
        BtLog.d((new StringBuilder()).append("MessageActivity.onCreateDialog()[+]: task").append(getTaskId()).toString());
        Intent intent = getIntent();
        String s = intent.getStringExtra("title");
        String s1 = intent.getStringExtra("message");
        String s2 = intent.getStringExtra("positiveButton");
        String s3 = intent.getStringExtra("negativeButton");
        android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(this)).setTitle(s).setMessage(s1).setNegativeButton(s3, new android.content.DialogInterface.OnClickListener() {

            final MessageActivity this$0;

            public void onClick(DialogInterface dialoginterface, int j)
            {
                setResult(0);
                finish();
            }

            
            {
                this$0 = MessageActivity.this;
                super();
            }
        }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

            final MessageActivity this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
                setResult(2);
                finish();
            }

            
            {
                this$0 = MessageActivity.this;
                super();
            }
        }
);
        if (s2 != null)
            builder.setPositiveButton(s2, new android.content.DialogInterface.OnClickListener() {

                final MessageActivity this$0;
                final Intent val$positiveIntent;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    setResult(1);
                    startActivity(positiveIntent);
                    finish();
                }

            
            {
                this$0 = MessageActivity.this;
                positiveIntent = intent;
                super();
            }
            }
);
        return builder.create();
    }

    protected void onResume()
    {
        super.onResume();
        setVisible(false);
        showDialog(0);
    }
}
