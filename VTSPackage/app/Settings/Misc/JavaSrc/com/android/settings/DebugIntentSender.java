// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.Selection;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class DebugIntentSender extends Activity
{

    private EditText mAccountField;
    private android.view.View.OnClickListener mClicked;
    private EditText mDataField;
    private EditText mIntentField;
    private EditText mResourceField;
    private Button mSendBroadcastButton;
    private Button mStartActivityButton;

    public DebugIntentSender()
    {
        mClicked = new android.view.View.OnClickListener() {

            final DebugIntentSender this$0;

            public void onClick(View view)
            {
                if (view == mSendBroadcastButton || view == mStartActivityButton)
                {
                    String s = mIntentField.getText().toString();
                    String s1 = mDataField.getText().toString();
                    String s2 = mAccountField.getText().toString();
                    String s3 = mResourceField.getText().toString();
                    Intent intent = new Intent(s);
                    if (!TextUtils.isEmpty(s1))
                        intent.setData(Uri.parse(s1));
                    intent.putExtra("account", s2);
                    intent.putExtra("resource", s3);
                    if (view == mSendBroadcastButton)
                        sendBroadcast(intent);
                    else
                        startActivity(intent);
                    setResult(-1);
                    finish();
                }
            }

            
            {
                this$0 = DebugIntentSender.this;
                super();
            }
        }
;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f04003c);
        mIntentField = (EditText)findViewById(0x7f0800b1);
        mIntentField.setText("android.intent.action.SYNC");
        Selection.selectAll(mIntentField.getText());
        mDataField = (EditText)findViewById(0x7f0800b2);
        mDataField.setBackgroundResource(0x1080018);
        mAccountField = (EditText)findViewById(0x7f0800b3);
        mResourceField = (EditText)findViewById(0x7f0800b4);
        mSendBroadcastButton = (Button)findViewById(0x7f0800b5);
        mSendBroadcastButton.setOnClickListener(mClicked);
        mStartActivityButton = (Button)findViewById(0x7f0800b6);
        mStartActivityButton.setOnClickListener(mClicked);
    }






}
