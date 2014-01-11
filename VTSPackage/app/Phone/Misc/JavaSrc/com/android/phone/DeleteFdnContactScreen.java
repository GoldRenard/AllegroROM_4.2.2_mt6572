// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.Window;
import android.widget.Toast;
import com.mediatek.settings.CallSettings;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.phone:
//            GetPin2Screen

public class DeleteFdnContactScreen extends Activity
{
    private class DeleteFdnContactScreenBroadcastReceiver extends BroadcastReceiver
    {

        final DeleteFdnContactScreen this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.AIRPLANE_MODE"))
                finish();
        }

        private DeleteFdnContactScreenBroadcastReceiver()
        {
            this$0 = DeleteFdnContactScreen.this;
            super();
        }

    }

    private class QueryHandler extends AsyncQueryHandler
    {

        final DeleteFdnContactScreen this$0;

        protected void onDeleteComplete(int i, Object obj, int j)
        {
            log("onDeleteComplete");
            displayProgress(false);
            handleResult(EditFdnContactScreen.Operate.DELETE, j);
        }

        protected void onInsertComplete(int i, Object obj, Uri uri)
        {
        }

        protected void onQueryComplete(int i, Object obj, Cursor cursor)
        {
        }

        protected void onUpdateComplete(int i, Object obj, int j)
        {
        }

        public QueryHandler(ContentResolver contentresolver)
        {
            this$0 = DeleteFdnContactScreen.this;
            super(contentresolver);
        }
    }


    private static final boolean DBG = true;
    private static final int GET_PIN_RETRY_EMPTY = -1;
    private static final String INTENT_EXTRA_INDEX = "index";
    private static final String INTENT_EXTRA_NAME = "name";
    private static final String INTENT_EXTRA_NUMBER = "number";
    private static final String LOG_TAG = "PhoneGlobals";
    private static final int PIN2_REQUEST_CODE = 100;
    private Handler mHandler;
    private String mIndex;
    private String mName;
    private String mNumber;
    private String mPin2;
    protected QueryHandler mQueryHandler;
    private final BroadcastReceiver mReceiver = new DeleteFdnContactScreenBroadcastReceiver();
    private int mSimId;

    public DeleteFdnContactScreen()
    {
        mHandler = new Handler();
    }

    private void authenticatePin2()
    {
        Intent intent = new Intent();
        intent.putExtra("simId", mSimId);
        intent.setClass(this, com/android/phone/GetPin2Screen);
        startActivityForResult(intent, 100);
    }

    private void deleteContact()
    {
        StringBuilder stringbuilder = new StringBuilder();
        if (TextUtils.isEmpty(mName))
        {
            stringbuilder.append("number='");
        } else
        {
            stringbuilder.append("tag='");
            stringbuilder.append(mName);
            stringbuilder.append("' AND number='");
        }
        stringbuilder.append(mNumber);
        stringbuilder.append("' AND pin2='");
        stringbuilder.append(mPin2);
        stringbuilder.append("'");
        Uri uri = getContentURI();
        mQueryHandler = new QueryHandler(getContentResolver());
        mQueryHandler.startDelete(0, null, uri, stringbuilder.toString(), null);
        displayProgress(true);
    }

    private void displayProgress(boolean flag)
    {
        Window window = getWindow();
        byte byte0;
        if (flag)
            byte0 = -1;
        else
            byte0 = -2;
        window.setFeatureInt(5, byte0);
    }

    private void finishThisActivity()
    {
        mHandler.postDelayed(new Runnable() {

            final DeleteFdnContactScreen this$0;

            public void run()
            {
                finish();
            }

            
            {
                this$0 = DeleteFdnContactScreen.this;
                super();
            }
        }
, 2000L);
    }

    private Uri getContentURI()
    {
        String s = "content://icc/fdn";
        if (CallSettings.isMultipleSim())
            switch (mSimId)
            {
            case 3: // '\003'
                s = "content://icc/fdn4";
                break;

            case 2: // '\002'
                s = "content://icc/fdn3";
                break;

            case 1: // '\001'
                s = "content://icc/fdn2";
                break;

            case 0: // '\0'
                s = "content://icc/fdn1";
                break;

            default:
                log((new StringBuilder()).append("error as mSimId = ").append(mSimId).toString());
                break;
            }
        return Uri.parse(s);
    }

    private int getPin2RetryNumber()
    {
        if (CallSettings.isMultipleSim())
            switch (mSimId)
            {
            default:
                log("error without correct ");
                break;

            case 0: // '\0'
            case 1: // '\001'
            case 2: // '\002'
            case 3: // '\003'
                break;
            }
        if (mSimId == 1)
            return SystemProperties.getInt("gsm.sim.retry.pin2.2", -1);
        else
            return SystemProperties.getInt("gsm.sim.retry.pin2", -1);
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

    private void handlePin2Error()
    {
        int i = getPin2RetryNumber();
        log((new StringBuilder()).append("handleResult: retryNumber=").append(i).toString());
        if (i == 0)
        {
            log("handleResult: pin2 retry= 0 ,pin2 is locked!");
            AlertDialog alertdialog = (new android.app.AlertDialog.Builder(this)).setPositiveButton(0x7f0d0192, new android.content.DialogInterface.OnClickListener() {

                final DeleteFdnContactScreen this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    finish();
                }

            
            {
                this$0 = DeleteFdnContactScreen.this;
                super();
            }
            }
).setMessage(0x7f0d02b4).create();
            alertdialog.getWindow().addFlags(2);
            alertdialog.show();
            return;
        } else
        {
            showStatus((new StringBuilder()).append(getString(0x7f0d00e4)).append("\n").append(getRetryPin2()).toString());
            return;
        }
    }

    private void handleResult(EditFdnContactScreen.Operate operate, int i)
    {
        log((new StringBuilder()).append("handleResult: [errorcode=").append(i).append("]").toString());
        switch (i)
        {
        case -5: 
            log("handleResult: Error,invalid pin2 !");
            handlePin2Error();
            break;

        case -4: 
            log("handleResult: Error,Phone book is not ready !");
            showStatus(getString(0x7f0d00e3));
            break;

        case -3: 
            log("handleResult: Error,storage is full !");
            showStatus(getString(0x7f0d00e2));
            break;

        case -2: 
            log("handleResult: Error,Contact name's length is too long !");
            showStatus(getString(0x7f0d00e1));
            break;

        case -1: 
            log("handleResult: Error,Contact number's length is too long !");
            showStatus(getString(0x7f0d00e0));
            break;

        case 0: // '\0'
            log("handleResult: Error,unknown error code!");
            showStatus(getString(0x7f0d00df));
            break;

        default:
            log("handleResult: Error,system return unknown error code!");
            break;
        }
        if (i >= 1)
            showStatus(getResources().getText(0x7f0d028f));
        if (getPin2RetryNumber() != 0)
            finishThisActivity();
    }

    private void log(String s)
    {
        Xlog.d("PhoneGlobals", (new StringBuilder()).append("[DeleteFdnContact] ").append(s).toString());
    }

    private void resolveIntent()
    {
        Intent intent = getIntent();
        mIndex = intent.getStringExtra("index");
        mName = intent.getStringExtra("name");
        mNumber = intent.getStringExtra("number");
        mSimId = intent.getIntExtra("simId", -1);
    }

    private void showStatus(CharSequence charsequence)
    {
        if (charsequence != null)
            Toast.makeText(this, charsequence, 0).show();
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        log("onActivityResult");
        switch (i)
        {
        case 100: // 'd'
            Bundle bundle;
            if (intent != null)
                bundle = intent.getExtras();
            else
                bundle = null;
            if (bundle != null)
            {
                mPin2 = bundle.getString("pin2");
                showStatus(getResources().getText(0x7f0d028e));
                deleteContact();
                return;
            } else
            {
                log("onActivityResult: CANCELLED");
                displayProgress(false);
                finish();
                return;
            }
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        resolveIntent();
        authenticatePin2();
        getWindow().requestFeature(5);
        setContentView(0x7f04000e);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        registerReceiver(mReceiver, intentfilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
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
        if (getPin2RetryNumber() == 0)
            finish();
    }



}
