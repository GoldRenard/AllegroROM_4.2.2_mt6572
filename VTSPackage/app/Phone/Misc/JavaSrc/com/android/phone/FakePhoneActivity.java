// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Activity;
import android.app.NotificationManager;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.*;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.test.SimulatedRadioControl;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class FakePhoneActivity extends Activity
{
    private class ButtonListener
        implements android.view.View.OnClickListener
    {

        final FakePhoneActivity this$0;

        public void onClick(View view)
        {
            if (mRadioControl == null)
            {
                Log.e("Phone", "SimulatedRadioControl not available, abort!");
                NotificationManager _tmp = (NotificationManager)getSystemService("notification");
                Toast.makeText(FakePhoneActivity.this, "null mRadioControl!", 0).show();
                return;
            } else
            {
                mRadioControl.triggerRing(mPhoneNumber.getText().toString());
                return;
            }
        }

        private ButtonListener()
        {
            this$0 = FakePhoneActivity.this;
            super();
        }

    }


    private static final String TAG = "FakePhoneActivity";
    private EditText mPhoneNumber;
    private Button mPlaceCall;
    SimulatedRadioControl mRadioControl;


    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f04001a);
        mPlaceCall = (Button)findViewById(0x7f080069);
        mPlaceCall.setOnClickListener(new ButtonListener());
        mPhoneNumber = (EditText)findViewById(0x7f08001c);
        mPhoneNumber.setOnClickListener(new android.view.View.OnClickListener() {

            final FakePhoneActivity this$0;

            public void onClick(View view)
            {
                mPlaceCall.requestFocus();
            }

            
            {
                this$0 = FakePhoneActivity.this;
                super();
            }
        }
);
        mRadioControl = PhoneGlobals.getPhone().getSimulatedRadioControl();
        Log.i("FakePhoneActivity", (new StringBuilder()).append("- PhoneGlobals.getInstance(): ").append(PhoneGlobals.getInstance()).toString());
        Log.i("FakePhoneActivity", (new StringBuilder()).append("- PhoneGlobals.getPhone(): ").append(PhoneGlobals.getPhone()).toString());
        Log.i("FakePhoneActivity", (new StringBuilder()).append("- mRadioControl: ").append(mRadioControl).toString());
    }


}
