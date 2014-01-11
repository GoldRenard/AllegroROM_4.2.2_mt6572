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
import android.text.method.DialerKeyListener;
import android.view.*;
import android.widget.*;
import com.mediatek.settings.CallSettings;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.phone:
//            GetPin2Screen, DeleteFdnContactScreen

public class EditFdnContactScreen extends Activity
{
    private class EditFdnContactScreenBroadcastReceiver extends BroadcastReceiver
    {

        final EditFdnContactScreen this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.AIRPLANE_MODE"))
                finish();
        }

        private EditFdnContactScreenBroadcastReceiver()
        {
            this$0 = EditFdnContactScreen.this;
            super();
        }

    }

    private static class FdnKeyListener extends DialerKeyListener
    {

        public static final char CHARACTERS[] = {
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
            '#', '*', '+', ',', 'N'
        };
        private static FdnKeyListener sKeyListener;

        public static FdnKeyListener getInstance()
        {
            if (sKeyListener == null)
                sKeyListener = new FdnKeyListener();
            return sKeyListener;
        }

        protected char[] getAcceptedChars()
        {
            return CHARACTERS;
        }


        private FdnKeyListener()
        {
        }
    }

    public static final class Operate extends Enum
    {

        private static final Operate $VALUES[];
        public static final Operate DELETE;
        public static final Operate INSERT;
        public static final Operate UPDATE;

        public static Operate valueOf(String s)
        {
            return (Operate)Enum.valueOf(com/android/phone/EditFdnContactScreen$Operate, s);
        }

        public static Operate[] values()
        {
            return (Operate[])$VALUES.clone();
        }

        static 
        {
            INSERT = new Operate("INSERT", 0);
            UPDATE = new Operate("UPDATE", 1);
            DELETE = new Operate("DELETE", 2);
            Operate aoperate[] = new Operate[3];
            aoperate[0] = INSERT;
            aoperate[1] = UPDATE;
            aoperate[2] = DELETE;
            $VALUES = aoperate;
        }

        private Operate(String s, int i)
        {
            super(s, i);
        }
    }

    private class QueryHandler extends AsyncQueryHandler
    {

        final EditFdnContactScreen this$0;

        protected void onDeleteComplete(int i, Object obj, int j)
        {
        }

        protected void onInsertComplete(int i, Object obj, Uri uri)
        {
            log("onInsertComplete");
            displayProgress(false);
            log((new StringBuilder()).append("== loyee ==  uri.toString() = ").append(uri.toString()).toString());
            String s = uri.toString();
            int j;
            if (s.indexOf("error") == -1)
                j = 1;
            else
                j = Integer.valueOf(s.replace("content://icc/error/", "")).intValue();
            log((new StringBuilder()).append("== loyee ==  result=").append(j).toString());
            handleResult(Operate.INSERT, j);
        }

        protected void onQueryComplete(int i, Object obj, Cursor cursor)
        {
        }

        protected void onUpdateComplete(int i, Object obj, int j)
        {
            log("onUpdateComplete");
            displayProgress(false);
            handleResult(Operate.UPDATE, j);
        }

        public QueryHandler(ContentResolver contentresolver)
        {
            this$0 = EditFdnContactScreen.this;
            super(contentresolver);
        }
    }


    private static final int CONTACTS_PICKER_CODE = 200;
    private static final Intent CONTACT_IMPORT_INTENT;
    private static final boolean DBG = true;
    private static final int GET_PIN_RETRY_EMPTY = -1;
    private static final String INTENT_EXTRA_ADD = "addcontact";
    private static final String INTENT_EXTRA_INDEX = "index";
    private static final String INTENT_EXTRA_NAME = "name";
    private static final String INTENT_EXTRA_NUMBER = "number";
    private static final String LOG_TAG = "Settings/PhoneGlobals";
    private static final int MENU_DELETE = 2;
    private static final int MENU_IMPORT = 1;
    private static final String NUM_PROJECTION[] = {
        "display_name", "data1"
    };
    private static final int PIN2_MAX = 3;
    private static final int PIN2_REQUEST_CODE = 100;
    private boolean mAddContact;
    private Button mButton;
    private android.view.View.OnClickListener mClicked;
    private boolean mDataBusy;
    private Handler mHandler;
    private String mIndex;
    private String mName;
    private EditText mNameField;
    private String mNumber;
    private EditText mNumberField;
    private String mPin2;
    private LinearLayout mPinFieldContainer;
    private QueryHandler mQueryHandler;
    private final BroadcastReceiver mReceiver = new EditFdnContactScreenBroadcastReceiver();
    private int mSimId;

    public EditFdnContactScreen()
    {
        mHandler = new Handler();
        mClicked = new android.view.View.OnClickListener() {

            final EditFdnContactScreen this$0;

            public void onClick(View view)
            {
                if (mPinFieldContainer.getVisibility() == 0 && view == mButton && !mDataBusy && isValidate(getNameFromTextField(), getNumberFromTextField()))
                {
                    authenticatePin2();
                    return;
                } else
                {
                    return;
                }
            }

            
            {
                this$0 = EditFdnContactScreen.this;
                super();
            }
        }
;
    }

    private void addContact()
    {
        log("addContact");
        Uri uri = getContentURI();
        ContentValues contentvalues = new ContentValues(3);
        contentvalues.put("tag", getNameFromTextField());
        contentvalues.put("number", getNumberFromTextField());
        contentvalues.put("pin2", mPin2);
        log((new StringBuilder()).append("[name = ").append(getNameFromTextField()).append("]").toString());
        log((new StringBuilder()).append("[number = ").append(getNumberFromTextField()).append("]").toString());
        mQueryHandler = new QueryHandler(getContentResolver());
        mQueryHandler.startInsert(0, null, uri, contentvalues);
        displayProgress(true);
        showStatus(getResources().getText(0x7f0d0288));
    }

    private void authenticatePin2()
    {
        Intent intent = new Intent();
        intent.setClass(this, com/android/phone/GetPin2Screen);
        intent.putExtra("simId", mSimId);
        startActivityForResult(intent, 100);
    }

    private void deleteSelected()
    {
        if (!mAddContact)
        {
            Intent intent = new Intent();
            intent.setClass(this, com/android/phone/DeleteFdnContactScreen);
            intent.putExtra("index", mIndex);
            intent.putExtra("name", mName);
            intent.putExtra("number", mNumber);
            intent.putExtra("simId", mSimId);
            startActivity(intent);
        }
        finish();
    }

    private void displayProgress(boolean flag)
    {
        mDataBusy = flag;
        Window window = getWindow();
        byte byte0;
        if (mDataBusy)
            byte0 = -1;
        else
            byte0 = -2;
        window.setFeatureInt(5, byte0);
        Button button = mButton;
        boolean flag1;
        if (!mDataBusy)
            flag1 = true;
        else
            flag1 = false;
        button.setClickable(flag1);
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

    private String getNameFromTextField()
    {
        return mNameField.getText().toString();
    }

    private String getNumberFromTextField()
    {
        return mNumberField.getText().toString();
    }

    private int getPin2RetryNumber()
    {
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

                final EditFdnContactScreen this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    finish();
                }

            
            {
                this$0 = EditFdnContactScreen.this;
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

    private void handleResult(Operate operate, int i)
    {
        switch (i)
        {
        case -5: 
            log("handleResult: Error,invalid pin2 !");
            handlePin2Error();
            mButton.setEnabled(true);
            return;

        case -4: 
            log("handleResult: Error,Phone book is not ready !");
            showStatus(getString(0x7f0d00e3));
            mButton.setEnabled(true);
            return;

        case -3: 
            log("handleResult: Error,storage is full !");
            showStatus(getString(0x7f0d00e2));
            mButton.setEnabled(true);
            return;

        case -2: 
            log("handleResult: Error,Contact name's length is too long !");
            showStatus(getString(0x7f0d00e1));
            mButton.setEnabled(true);
            return;

        case -1: 
            log("handleResult: Error,Contact number's length is too long !");
            showStatus(getString(0x7f0d00e0));
            mButton.setEnabled(true);
            return;

        case 0: // '\0'
            log("handleResult: Error,unknown error code!");
            showStatus(getString(0x7f0d00df));
            mButton.setEnabled(true);
            return;

        case 1: // '\001'
            if (operate != Operate.DELETE)
            {
                log("handleResult: success!");
                Resources resources = getResources();
                int j;
                if (mAddContact)
                    j = 0x7f0d0289;
                else
                    j = 0x7f0d028c;
                showStatus(resources.getText(j));
                mHandler.postDelayed(new Runnable() {

                    final EditFdnContactScreen this$0;

                    public void run()
                    {
                        finish();
                    }

            
            {
                this$0 = EditFdnContactScreen.this;
                super();
            }
                }
, 2000L);
                return;
            }
            break;

        default:
            log("handleResult: Error,system return unknown error code!");
            mButton.setEnabled(true);
            break;
        }
    }

    private boolean isValidChar(char c)
    {
        return c >= '0' && c <= '9' || c == '*' || c == '#' || c == '+' || c == 'N' || c == 'n' || c == ',';
    }

    private boolean isValidNumber(String s)
    {
        return s.length() <= 40;
    }

    private boolean isValidate(String s, String s1)
    {
        boolean flag = TextUtils.isEmpty(s);
        boolean flag1 = TextUtils.isEmpty(s1);
        if (flag && flag1)
        {
            showStatus(getResources().getText(0x7f0d0084));
            return false;
        }
        s.toUpperCase();
        String s2 = s1.toUpperCase();
        int i = s2.indexOf('+');
        if (i < 0 || s2.length() != 1 && s2.indexOf('+', i + 1) < 0)
        {
            int j = s2.indexOf(',');
            if (j != 0 && (j != 1 || i != 0))
            {
                int k = s2.length();
                do
                {
                    int l = k - 1;
                    if (k > 0)
                    {
                        if (!isValidChar(s2.charAt(l)))
                        {
                            showStatus(getResources().getText(0x7f0d0085));
                            return false;
                        }
                        k = l;
                    } else
                    {
                        return true;
                    }
                } while (true);
            } else
            {
                showStatus(getResources().getText(0x7f0d0085));
                return false;
            }
        } else
        {
            showStatus(getResources().getText(0x7f0d0085));
            return false;
        }
    }

    private void log(String s)
    {
        Xlog.d("Settings/PhoneGlobals", (new StringBuilder()).append("[EditFdnContact] ").append(s).toString());
    }

    private void resolveIntent()
    {
        Intent intent = getIntent();
        mIndex = intent.getStringExtra("index");
        Xlog.i("Settings/PhoneGlobals", (new StringBuilder()).append("mIndex is ").append(mIndex).toString());
        mName = intent.getStringExtra("name");
        mNumber = intent.getStringExtra("number");
        mAddContact = intent.getBooleanExtra("addcontact", false);
        mSimId = intent.getIntExtra("simId", -1);
    }

    private void setupView()
    {
        mNameField = (EditText)findViewById(0x7f080056);
        mNumberField = (EditText)findViewById(0x7f080057);
        if (mNumberField != null)
            mNumberField.setKeyListener(FdnKeyListener.getInstance());
        if (!mAddContact)
        {
            if (mNameField != null)
                mNameField.setText(mName);
            if (mNumberField != null)
                mNumberField.setText(mNumber);
        }
        mButton = (Button)findViewById(0x7f080038);
        if (mButton != null)
            mButton.setOnClickListener(mClicked);
        mPinFieldContainer = (LinearLayout)findViewById(0x7f080055);
    }

    private void showStatus(CharSequence charsequence)
    {
        if (charsequence != null)
            Toast.makeText(this, charsequence, 0).show();
    }

    private void updateContact()
    {
        log("updateContact");
        Uri uri = getContentURI();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("index", mIndex);
        contentvalues.put("tag", mName);
        contentvalues.put("number", mNumber);
        contentvalues.put("newTag", getNameFromTextField());
        contentvalues.put("newNumber", getNumberFromTextField());
        contentvalues.put("pin2", mPin2);
        log((new StringBuilder()).append("[new name = ").append(getNameFromTextField()).append("]").toString());
        log((new StringBuilder()).append("[new number = ").append(getNumberFromTextField()).append("]").toString());
        mQueryHandler = new QueryHandler(getContentResolver());
        mQueryHandler.startUpdate(0, null, uri, contentvalues, null, null);
        displayProgress(true);
        showStatus(getResources().getText(0x7f0d028b));
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        log((new StringBuilder()).append("onActivityResult request:").append(i).append(" result:").append(j).toString());
        if (j == -1) goto _L2; else goto _L1
_L1:
        return;
_L2:
        i;
        JVM INSTR lookupswitch 2: default 68
    //                   100: 69
    //                   200: 140;
           goto _L3 _L4 _L5
_L3:
        return;
_L4:
        mButton.setEnabled(false);
        Bundle bundle = null;
        if (intent != null)
            bundle = intent.getExtras();
        if (bundle != null)
        {
            mPin2 = bundle.getString("pin2");
            if (mAddContact)
            {
                addContact();
                return;
            } else
            {
                updateContact();
                return;
            }
        }
        if (j != -1)
        {
            log("onActivityResult: cancelled.");
            finish();
            return;
        }
          goto _L1
_L5:
        Cursor cursor;
        if (j != -1)
        {
            log("onActivityResult: cancelled.");
            return;
        }
        cursor = null;
        cursor = getContentResolver().query(intent.getData(), NUM_PROJECTION, null, null, null);
        if (cursor == null)
            continue; /* Loop/switch isn't completed */
        if (cursor.moveToFirst())
        {
            mNameField.setText(cursor.getString(0));
            mNumberField.setText(cursor.getString(1).replaceAll("-", "").replaceAll(" ", ""));
        }
        if (cursor == null) goto _L1; else goto _L6
_L6:
        cursor.close();
        return;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        resolveIntent();
        getWindow().requestFeature(5);
        setContentView(0x7f040014);
        setupView();
        int i;
        if (mAddContact)
            i = 0x7f0d0287;
        else
            i = 0x7f0d028a;
        setTitle(i);
        mDataBusy = false;
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        registerReceiver(mReceiver, intentfilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        Resources resources = getResources();
        menu.add(0, 1, 0, resources.getString(0x7f0d02f5)).setIcon(0x7f020076);
        menu.add(0, 2, 0, resources.getString(0x7f0d0282)).setIcon(0x108003c);
        return true;
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
        default:
            return super.onOptionsItemSelected(menuitem);

        case 1: // '\001'
            try
            {
                startActivityForResult(CONTACT_IMPORT_INTENT, 200);
            }
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                Xlog.d("Settings/PhoneGlobals", activitynotfoundexception.toString());
                return true;
            }
            return true;

        case 2: // '\002'
            deleteSelected();
            return true;

        case 16908332: 
            finish();
            return true;
        }
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        boolean flag = super.onPrepareOptionsMenu(menu);
        if (mDataBusy)
            flag = false;
        return flag;
    }

    protected void onResume()
    {
        super.onResume();
        mNameField.requestFocus();
        if (getPin2RetryNumber() == 0)
            finish();
    }

    static 
    {
        CONTACT_IMPORT_INTENT = new Intent("android.intent.action.GET_CONTENT");
        CONTACT_IMPORT_INTENT.setType("vnd.android.cursor.item/phone_v2");
    }










}
