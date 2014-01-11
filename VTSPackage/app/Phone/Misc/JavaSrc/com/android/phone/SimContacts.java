// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.accounts.Account;
import android.app.ActionBar;
import android.app.ProgressDialog;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;

// Referenced classes of package com.android.phone:
//            ADNList

public class SimContacts extends ADNList
{
    private class ImportAllSimContactsThread extends Thread
        implements android.content.DialogInterface.OnCancelListener, android.content.DialogInterface.OnClickListener
    {

        boolean mCanceled;
        final SimContacts this$0;

        public void onCancel(DialogInterface dialoginterface)
        {
            mCanceled = true;
        }

        public void onClick(DialogInterface dialoginterface, int i)
        {
            if (i == -2)
            {
                mCanceled = true;
                mProgressDialog.dismiss();
                return;
            } else
            {
                Log.e("SimContacts", (new StringBuilder()).append("Unknown button event has come: ").append(dialoginterface.toString()).toString());
                return;
            }
        }

        public void run()
        {
            new ContentValues();
            ContentResolver contentresolver = getContentResolver();
            mCursor.moveToPosition(-1);
            do
            {
                if (mCanceled || !mCursor.moveToNext())
                    break;
                SimContacts.actuallyImportOneSimContact(mCursor, contentresolver, mAccount);
                if (mProgressDialog != null)
                    mProgressDialog.incrementProgressBy(1);
            } while (true);
            if (mProgressDialog != null && mProgressDialog.isShowing())
            {
                Log.d("SimContacts", "Dismiss progressDialog after import all simContacts");
                mProgressDialog.dismiss();
                mProgressDialog = null;
            }
            finish();
        }

        public ImportAllSimContactsThread()
        {
            this$0 = SimContacts.this;
            super("ImportAllSimContactsThread");
            mCanceled = false;
        }
    }

    private static class NamePhoneTypePair
    {

        final String name;
        final int phoneType;

        public NamePhoneTypePair(String s)
        {
            int i = s.length();
            if (i - 2 >= 0 && s.charAt(i - 2) == '/')
            {
                char c = Character.toUpperCase(s.charAt(i - 1));
                if (c == 'W')
                    phoneType = 3;
                else
                if (c != 'M' && c != 'O')
                {
                    if (c == 'H')
                        phoneType = 1;
                    else
                        phoneType = 7;
                } else
                {
                    phoneType = 2;
                }
                name = s.substring(0, i - 2);
                return;
            } else
            {
                phoneType = 7;
                name = s;
                return;
            }
        }
    }


    private static final String LOG_TAG = "SimContacts";
    private static final int MENU_IMPORT_ALL = 2;
    private static final int MENU_IMPORT_ONE = 1;
    private static final String UP_ACTIVITY_CLASS = "com.android.contacts.activities.PeopleActivity";
    private static final String UP_ACTIVITY_PACKAGE = "com.android.contacts";
    static final ContentValues sEmptyContentValues = new ContentValues();
    private Account mAccount;
    private ProgressDialog mProgressDialog;


    private static void actuallyImportOneSimContact(Cursor cursor, ContentResolver contentresolver, Account account)
    {
        NamePhoneTypePair namephonetypepair = new NamePhoneTypePair(cursor.getString(1));
        String s = namephonetypepair.name;
        int i = namephonetypepair.phoneType;
        String s1 = cursor.getString(2);
        String s2 = cursor.getString(3);
        String as[];
        ArrayList arraylist;
        android.content.ContentProviderOperation.Builder builder;
        android.content.ContentProviderOperation.Builder builder1;
        android.content.ContentProviderOperation.Builder builder2;
        if (!TextUtils.isEmpty(s2))
            as = s2.split(",");
        else
            as = null;
        arraylist = new ArrayList();
        builder = ContentProviderOperation.newInsert(android.provider.ContactsContract.RawContacts.CONTENT_URI);
        if (account != null)
        {
            builder.withValue("account_name", account.name);
            builder.withValue("account_type", account.type);
        } else
        {
            builder.withValues(sEmptyContentValues);
        }
        arraylist.add(builder.build());
        builder1 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
        builder1.withValueBackReference("raw_contact_id", 0);
        builder1.withValue("mimetype", "vnd.android.cursor.item/name");
        builder1.withValue("data1", s);
        arraylist.add(builder1.build());
        builder2 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
        builder2.withValueBackReference("raw_contact_id", 0);
        builder2.withValue("mimetype", "vnd.android.cursor.item/phone_v2");
        builder2.withValue("data2", Integer.valueOf(i));
        builder2.withValue("data1", s1);
        builder2.withValue("is_primary", Integer.valueOf(1));
        arraylist.add(builder2.build());
        if (s2 != null)
        {
            String as1[] = as;
            int j = as1.length;
            for (int k = 0; k < j; k++)
            {
                String s3 = as1[k];
                android.content.ContentProviderOperation.Builder builder4 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
                builder4.withValueBackReference("raw_contact_id", 0);
                builder4.withValue("mimetype", "vnd.android.cursor.item/email_v2");
                builder4.withValue("data2", Integer.valueOf(4));
                builder4.withValue("data1", s3);
                arraylist.add(builder4.build());
            }

        }
        if (false)
        {
            android.content.ContentProviderOperation.Builder builder3 = ContentProviderOperation.newInsert(android.provider.ContactsContract.Data.CONTENT_URI);
            builder3.withValueBackReference("raw_contact_id", 0);
            builder3.withValue("mimetype", "vnd.android.cursor.item/group_membership");
            builder3.withValue("group_sourceid", null);
            arraylist.add(builder3.build());
        }
        try
        {
            contentresolver.applyBatch("com.android.contacts", arraylist);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Object aobj1[] = new Object[2];
            aobj1[0] = remoteexception.toString();
            aobj1[1] = remoteexception.getMessage();
            Log.e("SimContacts", String.format("%s: %s", aobj1));
            return;
        }
        catch (OperationApplicationException operationapplicationexception)
        {
            Object aobj[] = new Object[2];
            aobj[0] = operationapplicationexception.toString();
            aobj[1] = operationapplicationexception.getMessage();
            Log.e("SimContacts", String.format("%s: %s", aobj));
            return;
        }
    }

    private void importOneSimContact(int i)
    {
        ContentResolver contentresolver = getContentResolver();
        if (super.mCursor.moveToPosition(i))
        {
            actuallyImportOneSimContact(super.mCursor, contentresolver, mAccount);
            return;
        } else
        {
            Log.e("SimContacts", (new StringBuilder()).append("Failed to move the cursor to the position \"").append(i).append("\"").toString());
            return;
        }
    }

    protected CursorAdapter newAdapter()
    {
        return new SimpleCursorAdapter(this, 0x7f040038, super.mCursor, new String[] {
            "name"
        }, new int[] {
            0x1020014
        });
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 1: // '\001'
            android.view.ContextMenu.ContextMenuInfo contextmenuinfo = menuitem.getMenuInfo();
            if (contextmenuinfo instanceof android.widget.AdapterView.AdapterContextMenuInfo)
            {
                importOneSimContact(((android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo).position);
                return true;
            }
            break;
        }
        return super.onContextItemSelected(menuitem);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent != null)
        {
            String s = intent.getStringExtra("account_name");
            String s1 = intent.getStringExtra("account_type");
            if (!TextUtils.isEmpty(s) && !TextUtils.isEmpty(s1))
                mAccount = new Account(s, s1);
        }
        registerForContextMenu(getListView());
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        if (contextmenuinfo instanceof android.widget.AdapterView.AdapterContextMenuInfo)
        {
            TextView textview = (TextView)((android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo).targetView.findViewById(0x1020014);
            if (textview != null)
                contextmenu.setHeaderTitle(textview.getText());
            contextmenu.add(0, 1, 0, 0x7f0d02f2);
        }
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        menu.add(0, 2, 0, 0x7f0d02f3);
        return true;
    }

    protected void onDestroy()
    {
        if (mProgressDialog != null && mProgressDialog.isShowing())
        {
            Log.d("SimContacts", "onDestroy - dismiss progressDialog");
            mProgressDialog.dismiss();
            mProgressDialog = null;
        }
        super.onDestroy();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        boolean flag = true;
        switch (i)
        {
        case 5: // '\005'
            if (super.mCursor != null && super.mCursor.moveToPosition(getSelectedItemPosition()))
            {
                String s = super.mCursor.getString(2);
                if (s != null && TextUtils.isGraphic(s))
                {
                    Intent intent = new Intent("android.intent.action.CALL_PRIVILEGED", Uri.fromParts("tel", s, null));
                    intent.setFlags(0x10800000);
                    startActivity(intent);
                    finish();
                    return flag;
                }
                break;
            }
            // fall through

        default:
            flag = super.onKeyDown(i, keyevent);
            break;
        }
        return flag;
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        importOneSimContact(i);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        menuitem.getItemId();
        JVM INSTR lookupswitch 2: default 76
    //                   2: 32
    //                   16908332: 176;
           goto _L1 _L2 _L3
_L2:
        String s;
        String s1;
        ImportAllSimContactsThread importallsimcontactsthread;
        s = getString(0x7f0d02f3);
        s1 = getString(0x7f0d02f4);
        importallsimcontactsthread = new ImportAllSimContactsThread();
        if (super.mCursor != null) goto _L5; else goto _L4
_L4:
        Log.e("SimContacts", "cursor is null. Ignore silently.");
_L1:
        return super.onOptionsItemSelected(menuitem);
_L5:
        mProgressDialog = new ProgressDialog(this);
        mProgressDialog.setTitle(s);
        mProgressDialog.setMessage(s1);
        mProgressDialog.setProgressStyle(1);
        mProgressDialog.setButton(-2, getString(0x7f0d0196), importallsimcontactsthread);
        mProgressDialog.setProgress(0);
        mProgressDialog.setMax(super.mCursor.getCount());
        mProgressDialog.show();
        importallsimcontactsthread.start();
        return true;
_L3:
        Intent intent = new Intent();
        intent.setClassName("com.android.contacts", "com.android.contacts.activities.PeopleActivity");
        intent.addFlags(0x4000000);
        startActivity(intent);
        finish();
        return true;
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        MenuItem menuitem = menu.findItem(2);
        if (menuitem != null)
        {
            boolean flag;
            if (super.mCursor != null && super.mCursor.getCount() > 0)
                flag = true;
            else
                flag = false;
            menuitem.setVisible(flag);
        }
        return super.onPrepareOptionsMenu(menu);
    }

    protected Uri resolveIntent()
    {
        Intent intent = getIntent();
        intent.setData(Uri.parse("content://icc/adn"));
        if ("android.intent.action.PICK".equals(intent.getAction()))
            super.mInitialSelection = -1 + intent.getIntExtra("index", 0);
        return intent.getData();
    }






/*
    static ProgressDialog access$202(SimContacts simcontacts, ProgressDialog progressdialog)
    {
        simcontacts.mProgressDialog = progressdialog;
        return progressdialog;
    }

*/
}
