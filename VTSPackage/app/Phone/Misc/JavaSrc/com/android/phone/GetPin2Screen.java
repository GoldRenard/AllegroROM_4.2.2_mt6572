// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemProperties;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.DigitsKeyListener;
import android.view.*;
import android.widget.*;
import com.mediatek.xlog.Xlog;

public class GetPin2Screen extends Activity
    implements android.widget.TextView.OnEditorActionListener
{
    private class GetPin2ScreenBroadcastReceiver extends BroadcastReceiver
    {

        final GetPin2Screen this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.AIRPLANE_MODE"))
                finish();
        }

        private GetPin2ScreenBroadcastReceiver()
        {
            this$0 = GetPin2Screen.this;
            super();
        }

    }


    private static final int GET_PIN_RETRY_EMPTY = -1;
    private static final String LOG_TAG = "Settings/PhoneGlobals";
    private static final int MAX_PIN_LENGTH = 8;
    private static final int MIN_PIN_LENGTH = 4;
    private android.view.View.OnClickListener mClicked;
    private Button mOkButton;
    private EditText mPin2Field;
    private TextView mPin2InvalidInfoLabel;
    private TextView mPin2RetryLabel;
    private TextView mPin2Title;
    private final BroadcastReceiver mReceiver = new GetPin2ScreenBroadcastReceiver();
    private int mSimId;

    public GetPin2Screen()
    {
        mClicked = new android.view.View.OnClickListener() {

            final GetPin2Screen this$0;

            public void onClick(View view)
            {
                if (invalidatePin(mPin2Field.getText().toString()))
                {
                    if (mPin2InvalidInfoLabel != null)
                        mPin2InvalidInfoLabel.setVisibility(0);
                    mPin2Field.setText("");
                    return;
                } else
                {
                    returnResult();
                    return;
                }
            }

            
            {
                this$0 = GetPin2Screen.this;
                super();
            }
        }
;
    }

    private String getPin2()
    {
        return mPin2Field.getText().toString();
    }

    private int getPin2RetryNumber()
    {
        String s;
        switch (mSimId)
        {
        case 3: // '\003'
            s = "gsm.sim.retry.pin2.4";
            break;

        case 2: // '\002'
            s = "gsm.sim.retry.pin2.3";
            break;

        case 1: // '\001'
            s = "gsm.sim.retry.pin2.2";
            break;

        case 0: // '\0'
            s = "gsm.sim.retry.pin2";
            break;

        default:
            Xlog.d("Settings/PhoneGlobals", (new StringBuilder()).append("Error happened mSimId=").append(mSimId).toString());
            s = "gsm.sim.retry.puk2";
            break;
        }
        return SystemProperties.getInt(s, -1);
    }

    private String getRetryPin2()
    {
        int i = getPin2RetryNumber();
        Object aobj[];
        switch (i)
        {
        case 1: // '\001'
            return getString(0x7f0d0141);

        case -1: 
            return " ";

        case 0: // '\0'
        default:
            aobj = new Object[1];
            break;
        }
        aobj[0] = Integer.valueOf(i);
        return getString(0x7f0d0142, aobj);
    }

    private boolean invalidatePin(String s)
    {
        return s == null || s.length() < 4 || s.length() > 8;
    }

    private void log(String s)
    {
        Xlog.d("Settings/PhoneGlobals", (new StringBuilder()).append("[GetPin2] ").append(s).toString());
    }

    private void returnResult()
    {
        Bundle bundle = new Bundle();
        bundle.putString("pin2", getPin2());
        Uri uri = getIntent().getData();
        Intent intent = new Intent();
        if (uri != null)
            intent.setAction(uri.toString());
        setResult(-1, intent.putExtras(bundle));
        finish();
    }

    private void setupView()
    {
        mPin2Field = (EditText)findViewById(0x7f080060);
        if (mPin2Field != null)
            mPin2Field.setKeyListener(DigitsKeyListener.getInstance());
        mPin2Field.setInputType(18);
        mPin2Title = (TextView)findViewById(0x7f08006a);
        if (mPin2Title != null)
            mPin2Title.append(getString(0x7f0d0146));
        mPin2RetryLabel = (TextView)findViewById(0x7f08006b);
        if (mPin2RetryLabel != null)
            mPin2RetryLabel.setText(getRetryPin2());
        mPin2InvalidInfoLabel = (TextView)findViewById(0x7f08006c);
        mOkButton = (Button)findViewById(0x7f08006d);
        mOkButton.setOnClickListener(mClicked);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mSimId = getIntent().getIntExtra("simId", -1);
        setContentView(0x7f04001b);
        setupView();
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        registerReceiver(mReceiver, intentfilter);
        if (mPin2Field != null)
            mPin2Field.addTextChangedListener(new TextWatcher() {

                int mEndPos;
                int mStartPos;
                CharSequence mTempStr;
                final GetPin2Screen this$0;

                public void afterTextChanged(Editable editable)
                {
                    mStartPos = mPin2Field.getSelectionStart();
                    mEndPos = mPin2Field.getSelectionEnd();
                    if (mTempStr.length() > 8)
                    {
                        editable.delete(-1 + mStartPos, mEndPos);
                        mPin2Field.setText(editable);
                        mPin2Field.setSelection(editable.length());
                    } else
                    if (mTempStr.length() >= 4)
                    {
                        mPin2InvalidInfoLabel.setVisibility(8);
                        return;
                    }
                }

                public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                    mTempStr = charsequence;
                }

                public void onTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                }

            
            {
                this$0 = GetPin2Screen.this;
                super();
            }
            }
);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    public boolean onEditorAction(TextView textview, int i, KeyEvent keyevent)
    {
        if (i == 6)
        {
            mOkButton.performClick();
            return true;
        } else
        {
            return false;
        }
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

    protected void onResume()
    {
        super.onResume();
        mPin2Field.requestFocus();
        if (getPin2RetryNumber() == 0)
        {
            finish();
            return;
        } else
        {
            mPin2RetryLabel.setText(getRetryPin2());
            return;
        }
    }




}
