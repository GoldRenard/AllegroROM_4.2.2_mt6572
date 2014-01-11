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
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.mediatek.settings:
//            CallRejectListItem, CallRejectListAdapter

public class CallRejectListModify extends Activity
    implements CallRejectListAdapter.CheckSelectCallBack
{
    class AddContactsTask extends AsyncTask
    {

        final CallRejectListModify this$0;

        protected transient Integer doInBackground(Integer ainteger[])
        {
            int i = ainteger[0].intValue();
            int j;
            for (j = ainteger[1].intValue(); i < j && !isCancelled();)
            {
                CallRejectListItem callrejectlistitem = (CallRejectListItem)mCRLItemArray.get(i);
                if (callrejectlistitem.getIsChecked())
                {
                    String s = callrejectlistitem.getId();
                    mCRLItemArray.remove(i);
                    if (isCurTypeVtAndVoice(s))
                        updateRowById(s);
                    else
                        deleteRowById(s);
                    j--;
                } else
                {
                    i++;
                }
            }

            return Integer.valueOf(j);
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Integer[])aobj);
        }

        protected void onPostExecute(Integer integer)
        {
            if (!isCancelled())
            {
                dismissDialog(2);
                mListView.invalidateViews();
                if (integer.intValue() == 0)
                    finish();
                CallRejectListModify callrejectlistmodify = CallRejectListModify.this;
                CallRejectListModify callrejectlistmodify1 = CallRejectListModify.this;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(0);
                callrejectlistmodify.updateSelectedItemsView(callrejectlistmodify1.getString(0x7f0d00b6, aobj));
            }
            super.onPostExecute(integer);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Integer)obj);
        }

        protected void onPreExecute()
        {
            super.onPreExecute();
        }

        protected volatile void onProgressUpdate(Object aobj[])
        {
            onProgressUpdate((String[])aobj);
        }

        protected transient void onProgressUpdate(String as[])
        {
            super.onProgressUpdate(as);
        }

        AddContactsTask()
        {
            this$0 = CallRejectListModify.this;
            super();
        }
    }


    private static final int CALL_LIST_DIALOG_WAIT = 2;
    private static final int ID_INDEX = 0;
    private static final int MENU_ID_SELECT_ALL = 1;
    private static final int MENU_ID_TRUSH = 3;
    private static final int MENU_ID_UNSELECT_ALL = 2;
    private static final int NAME_INDEX = 3;
    private static final int NUMBER_INDEX = 1;
    private static final String TAG = "CallRejectListModify";
    private static final int TYPE_INDEX = 2;
    private static final Uri URI = Uri.parse("content://reject/list");
    private AddContactsTask mAddContactsTask;
    private ArrayList mCRLItemArray;
    private CallRejectListAdapter mCallRejectListAdapter;
    private ListView mListView;
    private String mType;

    public CallRejectListModify()
    {
        mCRLItemArray = new ArrayList();
        mAddContactsTask = null;
    }

    private void configureActionBar()
    {
        Log.v("CallRejectListModify", "configureActionBar()");
        View view = ((LayoutInflater)getSystemService("layout_inflater")).inflate(0x7f040008, null);
        ((ImageButton)view.findViewById(0x7f080018)).setOnClickListener(new android.view.View.OnClickListener() {

            final CallRejectListModify this$0;

            public void onClick(View view1)
            {
                finish();
            }

            
            {
                this$0 = CallRejectListModify.this;
                super();
            }
        }
);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
        {
            actionbar.setDisplayOptions(16, 26);
            actionbar.setCustomView(view);
            actionbar.setDisplayHomeAsUpEnabled(true);
        }
    }

    private void deleteRowById(String s)
    {
        try
        {
            Uri uri = ContentUris.withAppendedId(URI, Integer.parseInt(s));
            Log.i("CallRejectListModify", (new StringBuilder()).append("existNumberURI is ").append(uri).toString());
            int i = getContentResolver().delete(uri, null, null);
            Log.i("CallRejectListModify", (new StringBuilder()).append("result is ").append(i).toString());
            return;
        }
        catch (NumberFormatException numberformatexception)
        {
            Log.e("CallRejectListModify", (new StringBuilder()).append("parseInt failed, the index is ").append(s).toString());
        }
    }

    private void deleteSelection()
    {
        Log.i("CallRejectListModify", "Enter deleteSecection Function");
        boolean flag = false;
        for (Iterator iterator = mCRLItemArray.iterator(); iterator.hasNext();)
            flag |= ((CallRejectListItem)iterator.next()).getIsChecked();

        if (flag)
        {
            showDialog(2);
            mAddContactsTask = new AddContactsTask();
            AddContactsTask addcontactstask = mAddContactsTask;
            Integer ainteger[] = new Integer[2];
            ainteger[0] = Integer.valueOf(0);
            ainteger[1] = Integer.valueOf(mCRLItemArray.size());
            addcontactstask.execute(ainteger);
        }
    }

    private void getCallRejectListItems()
    {
        Cursor cursor = null;
        Cursor cursor1 = getContentResolver().query(URI, new String[] {
            "_id", "Number", "type", "Name"
        }, null, null, null);
        cursor = cursor1;
        if (cursor == null)
        {
            cursor.close();
            return;
        }
        cursor.moveToFirst();
        for (; !cursor.isAfterLast(); cursor.moveToNext())
        {
            String s = cursor.getString(0);
            String s1 = cursor.getString(1);
            String s2 = cursor.getString(2);
            String s3 = cursor.getString(3);
            Log.d("CallRejectListModify", (new StringBuilder()).append("id=").append(s).toString());
            Log.d("CallRejectListModify", (new StringBuilder()).append("numberDB=").append(s1).toString());
            Log.d("CallRejectListModify", (new StringBuilder()).append("type=").append(s2).toString());
            Log.d("CallRejectListModify", (new StringBuilder()).append("name=").append(s3).toString());
            if ("3".equals(s2) || "2".equals(s2) && "video".equals(mType) || "1".equals(s2) && "voice".equals(mType))
            {
                CallRejectListItem callrejectlistitem = new CallRejectListItem(s3, s1, s, false);
                mCRLItemArray.add(callrejectlistitem);
            }
        }

        break MISSING_BLOCK_LABEL_317;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
        cursor.close();
        return;
    }

    private boolean isCurTypeVtAndVoice(String s)
    {
        Uri uri1 = ContentUris.withAppendedId(URI, Integer.parseInt(s));
        Uri uri = uri1;
_L2:
        Cursor cursor;
        cursor = getContentResolver().query(uri, new String[] {
            "_id", "Number", "Type", "Name"
        }, null, null, null);
        if (cursor == null)
            return false;
        break; /* Loop/switch isn't completed */
        NumberFormatException numberformatexception;
        numberformatexception;
        Log.e("CallRejectListModify", (new StringBuilder()).append("parseInt failed, the index is ").append(s).toString());
        uri = null;
        if (true) goto _L2; else goto _L1
_L1:
        cursor.moveToFirst();
        for (; !cursor.isAfterLast(); cursor.moveToNext())
            if ("3".equals(cursor.getString(2)))
            {
                cursor.close();
                return true;
            }

        cursor.close();
        return false;
    }

    private void selectAll()
    {
        for (Iterator iterator = mCRLItemArray.iterator(); iterator.hasNext(); ((CallRejectListItem)iterator.next()).setIsChecked(true));
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(mCRLItemArray.size());
        updateSelectedItemsView(getString(0x7f0d00b6, aobj));
        mListView.invalidateViews();
    }

    private void unSelectAll()
    {
        for (Iterator iterator = mCRLItemArray.iterator(); iterator.hasNext(); ((CallRejectListItem)iterator.next()).setIsChecked(false));
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(0);
        updateSelectedItemsView(getString(0x7f0d00b6, aobj));
        mListView.invalidateViews();
    }

    private void updateRowById(String s)
    {
        ContentValues contentvalues = new ContentValues();
        if ("video".equals(mType))
            contentvalues.put("Type", "1");
        else
            contentvalues.put("Type", "2");
        try
        {
            Uri uri = ContentUris.withAppendedId(URI, Integer.parseInt(s));
            int i = getContentResolver().update(uri, contentvalues, null, null);
            Log.i("CallRejectListModify", (new StringBuilder()).append("result is ").append(i).toString());
            return;
        }
        catch (NumberFormatException numberformatexception)
        {
            Log.e("CallRejectListModify", (new StringBuilder()).append("parseInt failed, the index is ").append(s).toString());
        }
    }

    private void updateSelectedItemsView(String s)
    {
        TextView textview = (TextView)getActionBar().getCustomView().findViewById(0x7f080019);
        if (textview == null)
        {
            return;
        } else
        {
            textview.setText(s);
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040007);
        mType = getIntent().getStringExtra("type");
        getCallRejectListItems();
        mListView = (ListView)findViewById(0x102000a);
        mCallRejectListAdapter = new CallRejectListAdapter(this, mCRLItemArray);
        if (mListView != null)
        {
            mListView.setAdapter(mCallRejectListAdapter);
            mListView.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {

                final CallRejectListModify this$0;

                public void onItemClick(AdapterView adapterview, View view, int i, long l)
                {
                    CheckBox checkbox = (CheckBox)view.findViewById(0x7f080015);
                    if (checkbox != null)
                    {
                        boolean flag;
                        if (!checkbox.isChecked())
                            flag = true;
                        else
                            flag = false;
                        checkbox.setChecked(flag);
                    }
                }

            
            {
                this$0 = CallRejectListModify.this;
                super();
            }
            }
);
        }
        mCallRejectListAdapter.setCheckSelectCallBack(this);
        mType = getIntent().getStringExtra("type");
        configureActionBar();
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(0);
        updateSelectedItemsView(getString(0x7f0d00b6, aobj));
    }

    protected Dialog onCreateDialog(int i)
    {
        if (i == 2)
        {
            ProgressDialog progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(getResources().getString(0x7f0d00b7));
            progressdialog.setCancelable(false);
            progressdialog.setIndeterminate(true);
            return progressdialog;
        } else
        {
            return null;
        }
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        menu.add(0, 1, 0, 0x7f0d00b3).setIcon(0x7f020078).setShowAsAction(1);
        menu.add(0, 2, 0, 0x7f0d00b4).setIcon(0x7f020077).setShowAsAction(1);
        menu.add(0, 3, 0, 0x7f0d00b5).setIcon(0x7f020079).setShowAsAction(1);
        return super.onCreateOptionsMenu(menu);
    }

    public void onDestroy()
    {
        super.onDestroy();
        if (mAddContactsTask != null)
            mAddContactsTask.cancel(true);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            break;

        case 3: // '\003'
            deleteSelection();
            break;

        case 2: // '\002'
            unSelectAll();
            break;

        case 1: // '\001'
            selectAll();
            break;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public void onResume()
    {
        super.onResume();
    }

    public void setChecked(boolean flag)
    {
        int i = 0;
        Iterator iterator = mCRLItemArray.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((CallRejectListItem)iterator.next()).getIsChecked())
                i++;
        } while (true);
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        updateSelectedItemsView(getString(0x7f0d00b6, aobj));
    }







}
