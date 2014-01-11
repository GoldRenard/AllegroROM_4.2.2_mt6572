// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ListActivity;
import android.content.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.Window;
import android.widget.*;
import com.mediatek.settings.CallSettings;

public class ADNList extends ListActivity
{
    private class ADNListBroadcastReceiver extends BroadcastReceiver
    {

        final ADNList this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.intent.action.AIRPLANE_MODE"))
                finish();
        }

        private ADNListBroadcastReceiver()
        {
            this$0 = ADNList.this;
            super();
        }

    }

    private class QueryHandler extends AsyncQueryHandler
    {

        final ADNList this$0;

        protected void onDeleteComplete(int i, Object obj, int j)
        {
            reQuery();
        }

        protected void onInsertComplete(int i, Object obj, Uri uri)
        {
            reQuery();
        }

        protected void onQueryComplete(int i, Object obj, Cursor cursor)
        {
            mCursor = cursor;
            if (mAirplaneMode)
                mCursor = null;
            setAdapter();
            displayProgress(false);
            invalidateOptionsMenu();
        }

        protected void onUpdateComplete(int i, Object obj, int j)
        {
            reQuery();
        }

        public QueryHandler(ContentResolver contentresolver)
        {
            this$0 = ADNList.this;
            super(contentresolver);
        }
    }


    protected static final int ADDITIONAL_NUMBER_COLUMN = 4;
    private static final String COLUMN_NAMES[] = {
        "index", "name", "number", "emails", "additionalNumber", "groupIds"
    };
    protected static final boolean DBG = false;
    protected static final int DELETE_TOKEN = 3;
    protected static final int EMAIL_COLUMN = 3;
    protected static final int GROUP_COLUMN = 5;
    protected static final int INDEX_COLUMN = 0;
    protected static final int INSERT_TOKEN = 1;
    protected static final int NAME_COLUMN = 1;
    protected static final int NUMBER_COLUMN = 2;
    protected static final int QUERY_TOKEN = 0;
    protected static final String TAG = "ADNList";
    protected static final int UPDATE_TOKEN = 2;
    private static final int VIEW_NAMES[] = {
        0x1020014, 0x1020015
    };
    protected boolean mAirplaneMode;
    protected Cursor mCursor;
    protected CursorAdapter mCursorAdapter;
    private TextView mEmptyText;
    protected int mIndicate;
    protected int mInitialSelection;
    protected QueryHandler mQueryHandler;
    private final BroadcastReceiver mReceiver = new ADNListBroadcastReceiver();
    protected int mSimId;

    public ADNList()
    {
        mCursor = null;
        mInitialSelection = -1;
        mAirplaneMode = false;
    }

    private void displayProgress(boolean flag)
    {
        int i = 0x7f0d0294;
        if (CallSettings.isMultipleSim())
        {
            android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSimId);
            if (siminfo != null && flag)
            {
                Resources resources = getResources();
                Object aobj[] = new Object[1];
                aobj[0] = siminfo.mDisplayName;
                String s = resources.getString(0x7f0d0140, aobj);
                mEmptyText.setText(s);
            } else
            {
                mEmptyText.setText(i);
            }
        } else
        {
            TextView textview = mEmptyText;
            if (flag)
                i = 0x7f0d0293;
            else
            if (isAirplaneModeOn(this))
                i = 0x7f0d0296;
            textview.setText(i);
        }
        Window window = getWindow();
        byte byte0;
        if (flag)
            byte0 = -1;
        else
            byte0 = -2;
        window.setFeatureInt(5, byte0);
    }

    private static boolean isAirplaneModeOn(Context context)
    {
        int i = android.provider.Settings.System.getInt(context.getContentResolver(), "airplane_mode_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    private void query()
    {
        Uri uri = resolveIntent();
        mQueryHandler.startQuery(0, null, uri, COLUMN_NAMES, null, null, null);
        displayProgress(true);
    }

    private void reQuery()
    {
        query();
    }

    private void setAdapter()
    {
        if (mCursorAdapter == null)
        {
            mCursorAdapter = newAdapter();
            setListAdapter(mCursorAdapter);
        } else
        {
            mCursorAdapter.changeCursor(mCursor);
        }
        if (mInitialSelection >= 0 && mInitialSelection < mCursorAdapter.getCount())
        {
            setSelection(mInitialSelection);
            getListView().setFocusableInTouchMode(true);
            getListView().requestFocus();
        }
    }

    protected void log(String s)
    {
        Log.d("ADNList", (new StringBuilder()).append("[ADNList] ").append(s).toString());
    }

    protected CursorAdapter newAdapter()
    {
        Cursor cursor = mCursor;
        String as[] = new String[2];
        as[0] = COLUMN_NAMES[1];
        as[1] = COLUMN_NAMES[2];
        return new SimpleCursorAdapter(this, 0x7f040001, cursor, as, VIEW_NAMES);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        getWindow().requestFeature(5);
        setContentView(0x7f040000);
        mEmptyText = (TextView)findViewById(0x1020004);
        mQueryHandler = new QueryHandler(getContentResolver());
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        registerReceiver(mReceiver, intentfilter);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    protected void onResume()
    {
        super.onResume();
        query();
    }

    protected void onStop()
    {
        super.onStop();
        if (mCursor != null)
            mCursor.deactivate();
    }

    protected Uri resolveIntent()
    {
        Intent intent = getIntent();
        if (intent.getData() == null)
            intent.setData(Uri.parse("content://icc/adn"));
        return intent.getData();
    }




}
