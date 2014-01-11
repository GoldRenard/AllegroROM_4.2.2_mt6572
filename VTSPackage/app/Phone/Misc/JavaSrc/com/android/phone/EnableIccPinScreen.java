// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.app.Activity;
import android.content.res.Resources;
import android.os.*;
import android.text.TextUtils;
import android.text.method.DigitsKeyListener;
import android.view.MenuItem;
import android.view.View;
import android.widget.*;
import com.android.internal.telephony.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class EnableIccPinScreen extends Activity
{

    private static final boolean DBG = false;
    private static final int ENABLE_ICC_PIN_COMPLETE = 100;
    private static final String LOG_TAG = "Settings/PhoneGlobals";
    private android.view.View.OnClickListener mClicked;
    private boolean mEnable;
    private Handler mHandler;
    private Phone mPhone;
    private EditText mPinField;
    private LinearLayout mPinFieldContainer;
    private TextView mStatusField;

    public EnableIccPinScreen()
    {
        mHandler = new Handler() {

            final EnableIccPinScreen this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 100: // 'd'
                    AsyncResult asyncresult = (AsyncResult)message.obj;
                    handleResult(asyncresult);
                    return;
                }
            }

            
            {
                this$0 = EnableIccPinScreen.this;
                super();
            }
        }
;
        mClicked = new android.view.View.OnClickListener() {

            final EnableIccPinScreen this$0;

            public void onClick(View view)
            {
                if (TextUtils.isEmpty(mPinField.getText()))
                {
                    return;
                } else
                {
                    showStatus(getResources().getText(0x7f0d02a2));
                    enableIccPin();
                    return;
                }
            }

            
            {
                this$0 = EnableIccPinScreen.this;
                super();
            }
        }
;
    }

    private void enableIccPin()
    {
        Message message = Message.obtain(mHandler, 100);
        mPhone.getIccCard().setIccLockEnabled(mEnable, getPin(), message);
    }

    private String getPin()
    {
        return mPinField.getText().toString();
    }

    private void handleResult(AsyncResult asyncresult)
    {
        if (asyncresult.exception == null)
        {
            Resources resources = getResources();
            int i;
            if (mEnable)
                i = 0x7f0d02a3;
            else
                i = 0x7f0d02a4;
            showStatus(resources.getText(i));
        } else
        if (asyncresult.exception instanceof CommandException)
            showStatus(getResources().getText(0x7f0d02a5));
        mHandler.postDelayed(new Runnable() {

            final EnableIccPinScreen this$0;

            public void run()
            {
                finish();
            }

            
            {
                this$0 = EnableIccPinScreen.this;
                super();
            }
        }
, 3000L);
    }

    private void log(String s)
    {
        Xlog.d("Settings/PhoneGlobals", (new StringBuilder()).append("[EnableIccPin] ").append(s).toString());
    }

    private void setupView()
    {
        mPinField = (EditText)findViewById(0x7f080060);
        mPinField.setKeyListener(DigitsKeyListener.getInstance());
        mPinField.setMovementMethod(null);
        mPinField.setOnClickListener(mClicked);
        mPinFieldContainer = (LinearLayout)findViewById(0x7f080055);
        mStatusField = (TextView)findViewById(0x7f080061);
    }

    private void showStatus(CharSequence charsequence)
    {
        if (charsequence != null)
        {
            mStatusField.setText(charsequence);
            mStatusField.setVisibility(0);
            mPinFieldContainer.setVisibility(8);
            return;
        } else
        {
            mPinFieldContainer.setVisibility(0);
            mStatusField.setVisibility(8);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040018);
        setupView();
        mPhone = PhoneGlobals.getPhone();
        boolean flag;
        if (!mPhone.getIccCard().getIccLockEnabled())
            flag = true;
        else
            flag = false;
        mEnable = flag;
        int i;
        if (mEnable)
            i = 0x7f0d02a1;
        else
            i = 0x7f0d02a0;
        setTitle(getResources().getText(i));
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
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




}
