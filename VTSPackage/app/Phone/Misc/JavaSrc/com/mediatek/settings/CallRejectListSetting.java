// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.*;
import android.util.Log;
import android.view.*;
import android.widget.*;

// Referenced classes of package com.mediatek.settings:
//            CallRejectListModify

public class CallRejectListSetting extends PreferenceActivity
    implements android.view.View.OnClickListener, android.widget.AdapterView.OnItemClickListener
{
    class AddContactsTask extends AsyncTask
    {

        final CallRejectListSetting this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Integer[])aobj);
        }

        protected transient String doInBackground(Integer ainteger[])
        {
            updataCallback(ainteger[0].intValue(), ainteger[1].intValue(), mResultIntent);
            return "";
        }

        protected volatile void onCancelled(Object obj)
        {
            onCancelled((String)obj);
        }

        protected void onCancelled(String s)
        {
            super.onCancelled(s);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((String)obj);
        }

        protected void onPostExecute(String s)
        {
            if (!isCancelled())
            {
                dismissDialog(2);
                showNumbers();
            }
            super.onPostExecute(s);
        }

        protected void onPreExecute()
        {
            showDialog(2);
            invalidateOptionsMenu();
            super.onPreExecute();
        }

        protected transient void onProgressUpdate(Integer ainteger[])
        {
            super.onProgressUpdate(ainteger);
        }

        protected volatile void onProgressUpdate(Object aobj[])
        {
            onProgressUpdate((Integer[])aobj);
        }

        AddContactsTask()
        {
            this$0 = CallRejectListSetting.this;
            super();
        }
    }

    class UpdateUIContactsTask extends AsyncTask
    {

        final CallRejectListSetting this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Integer[])aobj);
        }

        protected transient String doInBackground(Integer ainteger[])
        {
            updateUICallback(ainteger[0].intValue(), ainteger[1].intValue());
            return "";
        }

        protected volatile void onCancelled(Object obj)
        {
            onCancelled((String)obj);
        }

        protected void onCancelled(String s)
        {
            super.onCancelled(s);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((String)obj);
        }

        protected void onPostExecute(String s)
        {
            if (!isCancelled())
            {
                dismissDialog(2);
                showNumbers();
            }
            super.onPostExecute(s);
        }

        protected void onPreExecute()
        {
            showDialog(2);
            super.onPreExecute();
        }

        protected transient void onProgressUpdate(Integer ainteger[])
        {
            super.onProgressUpdate(ainteger);
        }

        protected volatile void onProgressUpdate(Object aobj[])
        {
            onProgressUpdate((Integer[])aobj);
        }

        UpdateUIContactsTask()
        {
            this$0 = CallRejectListSetting.this;
            super();
        }
    }


    public static final int CACHED_FORMATTED_NUMBER = 15;
    public static final int CACHED_LOOKUP_URI = 11;
    public static final int CACHED_MATCHED_NUMBER = 12;
    public static final int CACHED_NAME = 8;
    public static final int CACHED_NORMALIZED_NUMBER = 13;
    public static final int CACHED_NUMBER_LABEL = 10;
    public static final int CACHED_NUMBER_TYPE = 9;
    public static final int CACHED_PHOTO_ID = 14;
    private static final String CALLER_DATA_ID_PROJECTION[] = {
        "_id", "data1", "data2", "raw_contact_id"
    };
    private static final String CALLER_ID_PROJECTION[] = {
        "_id", "data1", "data3", "display_name"
    };
    private static final Uri CALLLOG_URI = Uri.parse("content://call_log/calls");
    private static final int CALLSVIEW_DATA_ID_COLUMN = 2;
    private static final int CALLSVIEW_ID_COLUMN = 0;
    private static final int CALLSVIEW_NUMBER_COLUMN = 1;
    private static final int CALL_LIST_DIALOG_EDIT = 0;
    private static final int CALL_LIST_DIALOG_SELECT = 1;
    private static final int CALL_LIST_DIALOG_WAIT = 2;
    public static final String CALL_LOG_PROJECTION[] = {
        "_id", "number", "date", "duration", "type", "countryiso", "voicemail_uri", "geocoded_location", "name", "numbertype", 
        "numberlabel", "lookup_uri", "matched_number", "normalized_number", "photo_id", "formatted_number", "is_read"
    };
    private static final String CALL_LOG_SEARCH = "android.intent.action.SEARCH";
    public static final String CALL_PROJECTION_CALLS_JOIN_DATAVIEW[] = {
        "_id", "number", "data_id"
    };
    private static final int CALL_REJECT_CONTACTS_REQUEST = 125;
    private static final int CALL_REJECT_LOG_REQUEST = 126;
    public static final int CALL_TYPE = 4;
    private static final String CONTACTS_ADD_ACTION = "android.intent.action.contacts.list.PICKMULTIPHONES";
    private static final String CONTACTS_ADD_ACTION_RESULT = "com.mediatek.contacts.list.pickdataresult";
    private static final int CONTACT_NAME_COLUMN = 3;
    private static final Uri CONTACT_URI;
    public static final int COUNTRY_ISO = 5;
    private static final int DATA_DATA1_COLUMN = 1;
    private static final int DATA_DATA2_COLUMN = 2;
    private static final int DATA_ID_COLUMN = 0;
    private static final int DATA_RAW_CONTACT_ID_COLUMN = 3;
    public static final int DATE = 2;
    public static final int DURATION = 3;
    private static final int EVENT_HANDLER_MESSAGE_WAIT = 0;
    public static final int GEOCODED_LOCATION = 7;
    public static final int ID = 0;
    private static final int ID_INDEX = 0;
    public static final int IS_READ = 16;
    private static final int MENU_ID_ADD = 3;
    private static final int MENU_ID_DELETE = 1;
    private static final int NAME_INDEX = 3;
    public static final int NUMBER = 1;
    private static final int NUMBER_INDEX = 1;
    private static final int PHONE_ID_COLUMN = 0;
    private static final int PHONE_LABEL_COLUMN = 2;
    private static final int PHONE_NUMBER_COLUMN = 1;
    private static final String TAG = "CallRejectListSetting";
    private static final int TYPE_INDEX = 2;
    private static final Uri URI = Uri.parse("content://reject/list");
    public static final int VOICEMAIL_URI = 6;
    private static final Uri mCallRejectViewCallLogUri = Uri.parse("content://call_log/callsjoindataview");
    private boolean addFlag;
    private Button mAddBtn;
    private ImageButton mAddContactsBtn;
    private AddContactsTask mAddContactsTask;
    private Button mDeleteBtn;
    private Button mDialogCancelBtn;
    private Button mDialogSaveBtn;
    private ListView mListView;
    private EditText mNumberEditText;
    private String mPhoneNumberFromContacts;
    private Intent mResultIntent;
    private String mType;
    private UpdateUIContactsTask mUpdatUIContactsTask;

    public CallRejectListSetting()
    {
        mAddContactsTask = null;
        mUpdatUIContactsTask = null;
        addFlag = false;
    }

    private String allWhite(String s)
    {
        if (s != null)
            s = s.replaceAll(" ", "");
        return s;
    }

    private boolean equalsNumber(String s, String s1)
    {
        if (s != null && s1 != null)
            return s.equals(s1);
        else
            return false;
    }

    private void insert(String s, String s1)
    {
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("Number", s);
        if (mType.equals("video"))
            contentvalues.put("Type", "2");
        else
            contentvalues.put("Type", "1");
        contentvalues.put("Name", s1);
        getContentResolver().insert(URI, contentvalues);
    }

    private void insertNumbers(String s, String s1)
    {
        Cursor cursor = getContentResolver().query(URI, new String[] {
            "_id", "Number", "type", "Name"
        }, null, null, null);
        if (cursor == null)
            return;
        cursor.moveToFirst();
        for (; !cursor.isAfterLast(); cursor.moveToNext())
        {
            String s2 = cursor.getString(0);
            String s3 = cursor.getString(1);
            String s4 = cursor.getString(2);
            if (equalsNumber(s, s3))
            {
                cursor.close();
                update(s2, s, s1, s4);
                return;
            }
        }

        cursor.close();
        insert(s, s1);
    }

    private void showNumbers()
    {
        PreferenceScreen preferencescreen = getPreferenceScreen();
        preferencescreen.removeAll();
        Cursor cursor = getContentResolver().query(URI, new String[] {
            "_id", "Number", "type", "Name"
        }, null, null, null);
        if (cursor == null)
            return;
        cursor.moveToFirst();
        for (; !cursor.isAfterLast(); cursor.moveToNext())
        {
            cursor.getString(0);
            String s = cursor.getString(1);
            String s1 = cursor.getString(2);
            String s2 = cursor.getString(3);
            if ("3".equals(s1) || "2".equals(s1) && "video".equals(mType) || "1".equals(s1) && "voice".equals(mType))
            {
                Preference preference = new Preference(this);
                preference.setTitle(s2);
                preference.setSummary(s);
                preferencescreen.addPreference(preference);
            }
        }

        cursor.close();
        invalidateOptionsMenu();
    }

    private void updataCallback(int i, int j, Intent intent)
    {
        switch (j)
        {
        default:
            break;

        case -1: 
            if (i == 125)
            {
                long al[] = intent.getLongArrayExtra("com.mediatek.contacts.list.pickdataresult");
                if (al != null && al.length >= 0)
                {
                    for (int k = 0; k < al.length && !mAddContactsTask.isCancelled(); k++)
                        updateContactsNumbers((int)al[k]);

                }
                break;
            }
            if (i == 126)
            {
                updateCallLogNumbers(intent.getStringExtra("calllogids"));
                return;
            }
            break;
        }
    }

    private void update(String s, String s1, String s2, String s3)
    {
        ContentValues contentvalues;
        if (s == null)
            return;
        contentvalues = new ContentValues();
        contentvalues.put("Number", s1);
        int k = Integer.parseInt(s3);
        int i = k;
_L1:
        NumberFormatException numberformatexception;
        if (mType.equals("video"))
            contentvalues.put("Type", String.valueOf(i | 2));
        else
            contentvalues.put("Type", String.valueOf(i | 1));
        if (!getResources().getString(0x7f0d00b8).equals(s2))
            contentvalues.put("Name", s2);
        try
        {
            Uri uri = ContentUris.withAppendedId(URI, Integer.parseInt(s));
            int j = getContentResolver().update(uri, contentvalues, null, null);
            Log.i("CallRejectListSetting", (new StringBuilder()).append("result is ").append(j).toString());
            return;
        }
        catch (NumberFormatException numberformatexception1)
        {
            Log.e("CallRejectListSetting", (new StringBuilder()).append("parseInt failed, the index is ").append(s).toString());
        }
        return;
        numberformatexception;
        Log.e("CallRejectListSetting", (new StringBuilder()).append("parseInt failed, the typeInt is ").append(0).toString());
        i = 0;
          goto _L1
    }

    private void updateCallLogNumbers(int i)
    {
        Cursor cursor;
        String s;
        Uri uri = ContentUris.withAppendedId(CALLLOG_URI, i);
        cursor = getContentResolver().query(uri, CALL_LOG_PROJECTION, null, null, null);
        cursor.moveToFirst();
        Log.v("CallRejectListSetting", (new StringBuilder()).append("----updateCallLogNumbers---[calllogid").append(i).append("]-------").toString());
        s = "";
        if (cursor.isAfterLast()) goto _L2; else goto _L1
_L1:
        String s1;
        String s2;
        s1 = allWhite(cursor.getString(1));
        s2 = cursor.getString(8);
        if (s2 == null)
            break MISSING_BLOCK_LABEL_112;
        if (!s2.isEmpty())
            break MISSING_BLOCK_LABEL_124;
        s2 = getResources().getString(0x7f0d00b8);
        Cursor cursor1;
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateCallLogNumbers----[number:").append(s1).append("]---[name").append(s2).append("]-[calllogid").append(i).append("]-----").toString());
        Uri uri1 = ContentUris.withAppendedId(mCallRejectViewCallLogUri, i);
        cursor1 = getContentResolver().query(uri1, CALL_PROJECTION_CALLS_JOIN_DATAVIEW, null, null, null);
        cursor1.moveToFirst();
        if (!cursor1.isAfterLast())
        {
            s1 = allWhite(cursor1.getString(1));
            s = allWhite(cursor1.getString(2));
            Log.v("CallRejectListSetting", (new StringBuilder()).append("updateCallLogNumbers1----[number:").append(s1).append("]----[data_id").append(s).append("]----").toString());
        }
        cursor1.close();
        String s3 = "";
        if (s == null) goto _L4; else goto _L3
_L3:
        if (!s.isEmpty()) goto _L5; else goto _L4
_L4:
        s2 = getResources().getString(0x7f0d00b8);
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateCallLogNumbers:-------[data_id").append(s).append("]--------").toString());
_L9:
        if (s3 == null) goto _L7; else goto _L6
_L6:
        if (!s3.isEmpty()) goto _L8; else goto _L7
_L7:
        s2 = getResources().getString(0x7f0d00b8);
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateCallLogNumbers::-------[raw_id").append(s3).append("]--------").toString());
_L10:
        insertNumbers(s1, s2);
        cursor.moveToNext();
_L2:
        cursor.close();
        return;
        Exception exception1;
        exception1;
        cursor1.close();
        throw exception1;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
_L5:
        Cursor cursor3;
        cursor3 = getContentResolver().query(CONTACT_URI, CALLER_DATA_ID_PROJECTION, "_id=?", new String[] {
            s
        }, null);
        cursor3.moveToFirst();
        if (!cursor3.isAfterLast())
        {
            s3 = allWhite(cursor3.getString(3));
            String s5 = cursor3.getString(1);
            String s6 = cursor3.getString(2);
            Log.v("CallRejectListSetting", (new StringBuilder()).append("updateCallLogNumbers2:data_id:").append(s).append("raw_id:").append(s3).append("data1:").append(s5).append("data2:").append(s6).toString());
        }
        cursor3.close();
          goto _L9
        Exception exception3;
        exception3;
        cursor3.close();
        throw exception3;
_L8:
        Cursor cursor2;
        cursor2 = getContentResolver().query(android.provider.ContactsContract.Data.CONTENT_URI, new String[] {
            "_id", "data1", "raw_contact_id"
        }, "raw_contact_id=? AND mimetype='vnd.android.cursor.item/name'", new String[] {
            s3
        }, null);
        cursor2.moveToFirst();
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateCallLogNumbers3..raw_id:").append(s3).append("--MIMETYPE:").append("vnd.android.cursor.item/name").toString());
        for (; !cursor2.isAfterLast(); cursor2.moveToNext())
        {
            String s4 = cursor2.getString(0);
            s2 = allWhite(cursor2.getString(1));
            Log.v("CallRejectListSetting", (new StringBuilder()).append("TestModify3..name:name:").append(s2).append("data_idt:").append(s4).toString());
        }

        break MISSING_BLOCK_LABEL_815;
        Exception exception2;
        exception2;
        cursor2.close();
        throw exception2;
        cursor2.close();
          goto _L10
    }

    private void updateCallLogNumbers(String s)
    {
        Log.v("CallRejectListSetting", (new StringBuilder()).append("---------[").append(s).append("]----------").toString());
        break MISSING_BLOCK_LABEL_32;
        if (s != null && !s.isEmpty() && s.startsWith("_id"))
        {
            String as[] = s.substring(8, -1 + s.length()).split(",");
            int i = 0;
            while (i < as.length && !mAddContactsTask.isCancelled()) 
            {
                try
                {
                    int j = Integer.parseInt(as[i].substring(1, -1 + as[i].length()));
                    updateCallLogNumbers(j);
                    Log.i("CallRejectListSetting", (new StringBuilder()).append("id is ").append(j).toString());
                }
                catch (NumberFormatException numberformatexception)
                {
                    Log.e("CallRejectListSetting", (new StringBuilder()).append("parseInt failed, the id is ").append(numberformatexception).toString());
                }
                i++;
            }
        }
        return;
    }

    private void updateContactsNumbers(int i)
    {
        Cursor cursor;
        Uri uri = ContentUris.withAppendedId(CONTACT_URI, i);
        cursor = getContentResolver().query(uri, CALLER_ID_PROJECTION, null, null, null);
        cursor.moveToFirst();
        for (; !cursor.isAfterLast(); cursor.moveToNext())
            insertNumbers(allWhite(cursor.getString(1)), cursor.getString(3));

        break MISSING_BLOCK_LABEL_83;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
        cursor.close();
        return;
    }

    private void updateShowNumbers()
    {
        mUpdatUIContactsTask = new UpdateUIContactsTask();
        UpdateUIContactsTask updateuicontactstask = mUpdatUIContactsTask;
        Integer ainteger[] = new Integer[2];
        ainteger[0] = Integer.valueOf(-1);
        ainteger[1] = Integer.valueOf(-1);
        updateuicontactstask.execute(ainteger);
    }

    private void updateUICallback(int i, int j)
    {
        Cursor cursor;
        cursor = getContentResolver().query(URI, new String[] {
            "_id", "Number", "type", "Name"
        }, null, null, null);
        if (cursor == null)
            return;
        cursor.moveToFirst();
_L6:
        String s;
        String s1;
        String s2;
        if (cursor.isAfterLast())
            break MISSING_BLOCK_LABEL_508;
        s = cursor.getString(1);
        s1 = cursor.getString(3);
        s2 = cursor.getString(2);
        if (!"3".equals(s2) && (!"2".equals(s2) || !"video".equals(mType)) && (!"1".equals(s2) || !"voice".equals(mType))) goto _L2; else goto _L1
_L1:
        if (s == null) goto _L4; else goto _L3
_L3:
        if (!s.isEmpty()) goto _L5; else goto _L4
_L4:
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateUICallback0-------[number:").append(s).append("]--------").toString());
_L2:
        cursor.moveToNext();
          goto _L6
        Exception exception;
        exception;
        cursor.close();
        throw exception;
_L5:
        Cursor cursor1 = getContentResolver().query(android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[] {
            "display_name", "data1"
        }, null, null, null);
        String s3;
        boolean flag;
        boolean flag1;
        s3 = s1;
        flag = false;
        flag1 = false;
        cursor1.moveToFirst();
_L7:
        String s5;
        String s6;
        if (cursor1.isAfterLast())
            break MISSING_BLOCK_LABEL_379;
        s5 = cursor1.getString(0);
        s6 = allWhite(cursor1.getString(1));
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateUICallback1..tempName:").append(s5).append(" tempNumber:").append(s6).toString());
        if (s.equals(s6))
        {
            Exception exception1;
            String s4;
            if (!s1.equals(s5))
            {
                s3 = s5;
                flag = true;
            }
            break MISSING_BLOCK_LABEL_515;
        }
        cursor1.moveToNext();
          goto _L7
        exception1;
        cursor1.close();
        throw exception1;
        cursor1.close();
        if (!flag1 || !flag) goto _L9; else goto _L8
_L8:
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateUICallback2..newName1:").append(s3).append(" number:").append(s).toString());
        insertNumbers(s, s3);
_L9:
        if (flag1) goto _L2; else goto _L10
_L10:
        s4 = getResources().getString(0x7f0d00b8);
        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateUICallback2..newName2:").append(s4).append(" number:").append(s).toString());
        insertNumbers(s, s4);
          goto _L2
        cursor.close();
        return;
        flag1 = true;
        break MISSING_BLOCK_LABEL_356;
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        if (j != -1)
        {
            return;
        } else
        {
            mAddContactsTask = new AddContactsTask();
            mResultIntent = intent;
            AddContactsTask addcontactstask = mAddContactsTask;
            Integer ainteger[] = new Integer[2];
            ainteger[0] = Integer.valueOf(i);
            ainteger[1] = Integer.valueOf(j);
            addcontactstask.execute(ainteger);
            return;
        }
    }

    public void onClick(View view)
    {
        if (view == mDeleteBtn)
        {
            Intent intent = getIntent();
            intent.setClass(this, com/mediatek/settings/CallRejectListModify);
            intent.putExtra("type", mType);
            startActivity(intent);
        } else
        {
            if (view == mAddBtn)
            {
                addFlag = true;
                showDialog(0);
                return;
            }
            if (view == mAddContactsBtn)
            {
                dismissDialog(0);
                showDialog(1);
                return;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040005);
        setPreferenceScreen(getPreferenceManager().createPreferenceScreen(this));
        mListView = (ListView)findViewById(0x7f080014);
        mType = getIntent().getStringExtra("type");
        if ("voice".equals(mType))
            setTitle(getResources().getString(0x7f0d00aa));
        else
            setTitle(getResources().getString(0x7f0d00ad));
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected Dialog onCreateDialog(int i)
    {
        if (i == 0)
        {
            if (addFlag)
            {
                addFlag = false;
                LayoutInflater layoutinflater = (LayoutInflater)getSystemService("layout_inflater");
                AlertDialog alertdialog = (new android.app.AlertDialog.Builder(this)).setPositiveButton(0x7f0d0286, new android.content.DialogInterface.OnClickListener() {

                    final CallRejectListSetting this$0;

                    public void onClick(DialogInterface dialoginterface, int j)
                    {
                        String s;
                        Cursor cursor;
                        String s1;
                        dismissDialog(0);
                        if (mNumberEditText == null || mNumberEditText.getText().toString().isEmpty() || mType == null)
                            return;
                        s = allWhite(mNumberEditText.getText().toString());
                        showDialog(2);
                        cursor = getContentResolver().query(android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[] {
                            "display_name", "data1"
                        }, null, null, null);
                        s1 = getResources().getString(0x7f0d00b8);
                        cursor.moveToFirst();
_L1:
                        String s2;
                        String s3;
                        if (cursor.isAfterLast())
                            break MISSING_BLOCK_LABEL_240;
                        s2 = cursor.getString(0);
                        s3 = allWhite(cursor.getString(1));
                        Log.v("CallRejectListSetting", (new StringBuilder()).append("updateUICallback1..tempName:").append(s1).append(" tempNumber:").append(s3).toString());
                        if (s.equals(s3))
                            s1 = s2;
                        cursor.moveToNext();
                          goto _L1
                        Exception exception;
                        exception;
                        cursor.close();
                        throw exception;
                        cursor.close();
                        dismissDialog(2);
                        insertNumbers(s, s1);
                        showNumbers();
                        return;
                    }

            
            {
                this$0 = CallRejectListSetting.this;
                super();
            }
                }
).setNegativeButton(0x7f0d0196, null).setTitle(0x7f0d00b1).setView(layoutinflater.inflate(0x7f040003, null)).create();
                alertdialog.show();
                mAddContactsBtn = (ImageButton)alertdialog.findViewById(0x7f080012);
                if (mAddContactsBtn != null)
                    mAddContactsBtn.setOnClickListener(this);
                mNumberEditText = (EditText)alertdialog.findViewById(0x7f080011);
                return alertdialog;
            }
        } else
        {
            if (i == 1)
            {
                Dialog dialog = new Dialog(this);
                dialog.setContentView(0x7f040004);
                dialog.setTitle(getResources().getString(0x7f0d00b2));
                ((ListView)dialog.findViewById(0x7f080014)).setOnItemClickListener(this);
                return dialog;
            }
            if (i == 2)
            {
                ProgressDialog progressdialog = new ProgressDialog(this);
                progressdialog.setMessage(getResources().getString(0x7f0d00b7));
                progressdialog.setCancelable(false);
                progressdialog.setIndeterminate(true);
                return progressdialog;
            }
        }
        return null;
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        menu.add(0, 1, 0, 0x7f0d00af).setShowAsAction(1);
        menu.add(0, 3, 1, 0x7f0d00b0).setShowAsAction(1);
        return super.onCreateOptionsMenu(menu);
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mAddContactsTask != null)
            mAddContactsTask.cancel(true);
        if (mUpdatUIContactsTask != null)
            mUpdatUIContactsTask.cancel(true);
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        Intent intent;
        if (i != 0)
            break MISSING_BLOCK_LABEL_52;
        intent = new Intent("android.intent.action.contacts.list.PICKMULTIPHONES");
        intent.setType("vnd.android.cursor.dir/phone_v2");
        startActivityForResult(intent, 125);
        dismissDialog(1);
_L1:
        return;
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Log.d("CallRejectListSetting", activitynotfoundexception.toString());
        return;
        if (i == 1)
        {
            Intent intent1 = new Intent("android.intent.action.SEARCH");
            intent1.setClassName("com.android.contacts", "com.mediatek.contacts.activities.CallLogMultipleChoiceActivity");
            try
            {
                startActivityForResult(intent1, 126);
                dismissDialog(1);
                return;
            }
            catch (ActivityNotFoundException activitynotfoundexception1)
            {
                Log.d("CallRejectListSetting", activitynotfoundexception1.toString());
            }
            return;
        }
          goto _L1
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;

        case 1: // '\001'
            Intent intent = new Intent(this, com/mediatek/settings/CallRejectListModify);
            intent.putExtra("type", mType);
            startActivity(intent);
            break;

        case 3: // '\003'
            addFlag = true;
            showDialog(0);
            break;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    protected void onPrepareDialog(int i, Dialog dialog, Bundle bundle)
    {
        switch (i)
        {
        case 0: // '\0'
            if (addFlag && mNumberEditText != null)
            {
                mNumberEditText.setText("");
                return;
            }
            break;
        }
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        Log.v("CallRejectListSetting", (new StringBuilder()).append("[preference count=").append(getPreferenceScreen().getPreferenceCount()).append("]").toString());
        MenuItem menuitem = menu.getItem(0);
        int i = getPreferenceScreen().getPreferenceCount();
        boolean flag = false;
        if (i != 0)
            flag = true;
        menuitem.setEnabled(flag);
        menu.getItem(1).setEnabled(true);
        return super.onPrepareOptionsMenu(menu);
    }

    public void onResume()
    {
        super.onResume();
        if (mAddContactsTask != null && mAddContactsTask.getStatus() == android.os.AsyncTask.Status.RUNNING)
        {
            Log.v("CallRejectListSetting", "onResume-------no update again--------");
            return;
        } else
        {
            updateShowNumbers();
            Log.v("CallRejectListSetting", "onResume---------------");
            return;
        }
    }

    static 
    {
        CONTACT_URI = android.provider.ContactsContract.Data.CONTENT_URI;
    }








}
