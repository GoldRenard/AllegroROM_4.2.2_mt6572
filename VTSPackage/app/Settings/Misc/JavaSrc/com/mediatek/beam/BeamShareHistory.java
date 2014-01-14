// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.beam;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.database.*;
import android.net.Uri;
import android.os.*;
import android.preference.PreferenceActivity;
import android.view.*;
import android.widget.*;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.xlog.Xlog;
import java.io.File;
import java.util.*;

// Referenced classes of package com.mediatek.beam:
//            BeamShareTabAdapter, BeamShareTask

public class BeamShareHistory extends SettingsPreferenceFragment
    implements android.content.DialogInterface.OnClickListener, android.os.Handler.Callback
{
    private class ClearTask extends AsyncTask
    {

        private static final int CLEAR_ONGOING = 1;
        private static final int CLEAR_SUCCESS;
        final BeamShareHistory this$0;

        private void clearAllTasks()
        {
            int i = mCursor.getColumnIndexOrThrow("_id");
            ArrayList arraylist = new ArrayList();
            mCursor.moveToFirst();
            for (; !mCursor.isAfterLast(); mCursor.moveToNext())
            {
                int j = mCursor.getInt(i);
                arraylist.add(Uri.withAppendedPath(BeamShareTask.BeamShareTaskMetaData.CONTENT_URI, Integer.toString(j)));
                Xlog.d("BeamShareHistory", (new StringBuilder()).append("clearAllTasks-----mCursor.getCount(): ").append(mCursor.getCount()).toString());
            }

            Uri uri;
            for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); mContentReslover.delete(uri, null, null))
                uri = (Uri)iterator.next();

        }

        protected transient Integer doInBackground(String as[])
        {
            clearAllTasks();
            return Integer.valueOf(0);
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((String[])aobj);
        }

        protected void onPostExecute(Integer integer)
        {
            if (integer.intValue() == 0)
                mHandler.sendEmptyMessage(1);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Integer)obj);
        }

        private ClearTask()
        {
            this$0 = BeamShareHistory.this;
            super();
        }

    }

    public class TabInfo
        implements android.widget.AdapterView.OnItemClickListener, android.widget.AdapterView.OnItemLongClickListener
    {

        private android.widget.TabHost.TabContentFactory mEmptyTabContent;
        private boolean mIsIncoming;
        public final CharSequence mLabel;
        private ListView mListView;
        public final BeamShareHistory mOwner;
        public View mRootView;
        private Cursor mTabCursor;
        final BeamShareHistory this$0;

        private View buildTabSpec()
        {
            if (mRootView != null)
                return mRootView;
            mRootView = mInflater.inflate(0x7f04000f, null);
            mListView = (ListView)mRootView.findViewById(0x7f08001b);
            ContentResolver contentresolver;
            Uri uri;
            contentresolver = mOwner.mActivity.getContentResolver();
            uri = BeamShareTask.BeamShareTaskMetaData.CONTENT_URI;
            String s;
            if (mIsIncoming)
                s = "type in (0,2)";
            else
                s = "type in (1,3)";
            try
            {
                mTabCursor = contentresolver.query(uri, null, s, null, "_id DESC");
            }
            catch (CursorIndexOutOfBoundsException cursorindexoutofboundsexception)
            {
                Xlog.e("BeamShareHistory", "check empty share list error:", cursorindexoutofboundsexception);
            }
            if (mTabCursor != null)
            {
                Xlog.d("BeamShareHistory", (new StringBuilder()).append("tab ").append(mLabel).append(": cursor.getCount() ").append(mTabCursor.getCount()).toString());
                mAdapter = new BeamShareTabAdapter(mOwner.mActivity, 0x7f04000e, mTabCursor);
                mListView.setAdapter(mAdapter);
                mListView.setScrollBarStyle(0x1000000);
                mListView.setOnItemClickListener(this);
                mListView.setOnItemLongClickListener(this);
            }
            return mRootView;
        }

        private boolean isSupportedDataType(Uri uri, String s)
        {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setDataAndType(uri, s);
            if (mOwner.mActivity.getPackageManager().queryIntentActivities(intent, 0x10000).size() == 0)
            {
                Xlog.d("BeamShareHistory", (new StringBuilder()).append("cannot find proper Activity to handle Intent: mime[").append(s).append("], data[").append(uri).append("]").toString());
                return false;
            } else
            {
                return true;
            }
        }

        private void openTransferSuccessFile(String s, String s1)
        {
            Xlog.d("BeamShareHistory", (new StringBuilder()).append("openTransferSuccessFile(): filename=").append(s).append(" mimetype=").append(s1).toString());
            if (s == null)
            {
                Xlog.d("BeamShareHistory", "the file name is null");
                return;
            }
            File file = new File(s);
            String s2 = file.getName();
            Xlog.d("BeamShareHistory", (new StringBuilder()).append("file name is ").append(s2).toString());
            Uri uri = Uri.parse(s);
            if (uri.getScheme() == null)
                uri = Uri.fromFile(file);
            if (!isSupportedDataType(uri, s1))
            {
                mOwner.showDialog(1);
                return;
            } else
            {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setDataAndType(uri, s1);
                intent.setFlags(0x10000000);
                mOwner.mActivity.startActivity(intent);
                return;
            }
        }

        public void build(LayoutInflater layoutinflater, TabHost tabhost)
        {
            Xlog.d("BeamShareHistory", "build");
            mInflater = layoutinflater;
            String s;
            if (mIsIncoming)
                s = "Incoming";
            else
                s = "Outgoing";
            tabhost.addTab(tabhost.newTabSpec(s).setIndicator(mLabel).setContent(mEmptyTabContent));
        }

        public Cursor getCursor()
        {
            return mTabCursor;
        }

        public BeamShareHistory getOwner()
        {
            return mOwner;
        }

        public void onItemClick(AdapterView adapterview, View view, int i, long l)
        {
            mTabCursor.moveToPosition(i);
            BeamShareTask beamsharetask = new BeamShareTask(mTabCursor);
            String s = beamsharetask.getData();
            if (s == null)
            {
                Xlog.d("BeamShareHistory", "the file name is null");
                mCilckedFileName = s;
            } else
            {
                File file = new File(s);
                mCilckedFileName = file.getName();
            }
            if (beamsharetask.getState() == 1)
            {
                openTransferSuccessFile(beamsharetask.getData(), beamsharetask.getMimeType());
                return;
            }
            if (beamsharetask.getDirection() == BeamShareTask.Direction.out)
            {
                mOwner.showDialog(2);
                return;
            } else
            {
                mOwner.showDialog(4);
                return;
            }
        }

        public boolean onItemLongClick(AdapterView adapterview, View view, int i, long l)
        {
            Xlog.d("BeamShareHistory", "onItemLongClick");
            mTabCursor.moveToPosition(i);
            BeamShareTask beamsharetask = new BeamShareTask(mTabCursor);
            mLongClickUri = beamsharetask.getTaskUri();
            Xlog.d("BeamShareHistory", (new StringBuilder()).append("Click uri: ").append(mLongClickUri).toString());
            showDialog(5);
            return false;
        }


        public TabInfo(BeamShareHistory beamsharehistory1, CharSequence charsequence, boolean flag)
        {
            this$0 = BeamShareHistory.this;
            super();
            mTabCursor = null;
            mEmptyTabContent = new _cls1();
            mOwner = beamsharehistory1;
            mLabel = charsequence;
            mIsIncoming = flag;
        }
    }


    private static final int CLEAR_ALL_CONFIRM_DIALOG_ID = 3;
    private static final int CLEAR_ITEM_CONFIRM_DIALOG_ID = 5;
    private static final int FILE_NOT_SUPPORTED_DIALOG_ID = 1;
    private static final int FILE_RECEIVE_FAIL_DIALOG_ID = 4;
    private static final int FILE_RESEND_DIALOG_ID = 2;
    private static final String INCOMING_TAB_TAG = "Incoming";
    private static final int MENU_ID_CLEAR = 0;
    private static final String OUTGOING_TAB_TAG = "Outgoing";
    private static final String TAG = "BeamShareHistory";
    private static final int UPDATE_MENU_MSG = 1;
    private Activity mActivity;
    private BeamShareTabAdapter mAdapter;
    private String mCilckedFileName;
    private ContentResolver mContentReslover;
    private int mCurrentDialogId;
    private int mCurrentTabIndex;
    private Cursor mCursor;
    private Handler mHandler;
    private LayoutInflater mInflater;
    private Uri mLongClickUri;
    private final ContentObserver mSettingsObserver = new ContentObserver(new Handler()) {

        final BeamShareHistory this$0;

        public void onChange(boolean flag, Uri uri)
        {
            Xlog.d("BeamShareHistory", "ContentObserver, onChange()");
            mActivity.invalidateOptionsMenu();
        }

            
            {
                this$0 = BeamShareHistory.this;
                super(handler);
            }
    }
;
    private android.widget.TabHost.OnTabChangeListener mTabListener;
    private final ArrayList mTabs = new ArrayList();

    public BeamShareHistory()
    {
        mCursor = null;
        mCurrentDialogId = -1;
        mCurrentTabIndex = 0;
        mTabListener = new android.widget.TabHost.OnTabChangeListener() {

            final BeamShareHistory this$0;

            public void onTabChanged(String s)
            {
                Xlog.d("BeamShareHistory", "OnTabChanged");
                if (s.equals("Incoming"))
                    mCurrentTabIndex = 0;
                else
                if (s.equals("Outgoing"))
                    mCurrentTabIndex = 1;
                Xlog.d("BeamShareHistory", (new StringBuilder()).append("mCurrentTabIndex").append(mCurrentTabIndex).toString());
                mCursor = ((TabInfo)mTabs.get(mCurrentTabIndex)).getCursor();
                mActivity.invalidateOptionsMenu();
            }

            
            {
                this$0 = BeamShareHistory.this;
                super();
            }
        }
;
    }

    public boolean handleMessage(Message message)
    {
        Xlog.d("BeamShareHistory", (new StringBuilder()).append("handleMessage: ").append(message.what).toString());
        if (message.what == 1)
        {
            mActivity.invalidateOptionsMenu();
            return true;
        } else
        {
            return false;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i != -1)
        {
            Xlog.d("BeamShareHistory", "DialogInterface onClick return");
        } else
        {
            if (mCurrentDialogId == 3)
            {
                (new ClearTask()).execute(new String[0]);
                return;
            }
            if (mCurrentDialogId == 5)
            {
                Xlog.d("BeamShareHistory", (new StringBuilder()).append("Long click uri: ").append(mLongClickUri).toString());
                mContentReslover.delete(mLongClickUri, null, null);
                mHandler.sendEmptyMessage(1);
                return;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.d("BeamShareHistory", "onCreate()");
        mActivity = getActivity();
        if (mActivity instanceof PreferenceActivity)
            mActivity.getActionBar().setTitle(0x7f0b01a2);
        mContentReslover = mActivity.getContentResolver();
        TabInfo tabinfo = new TabInfo(this, mActivity.getString(0x7f0b0195), true);
        mTabs.add(tabinfo);
        TabInfo tabinfo1 = new TabInfo(this, mActivity.getString(0x7f0b0196), false);
        mTabs.add(tabinfo1);
        if (mHandler == null)
            mHandler = new Handler(this);
        setHasOptionsMenu(true);
    }

    public Dialog onCreateDialog(int i)
    {
        mCurrentDialogId = i;
        switch (i)
        {
        case 5: // '\005'
            return (new android.app.AlertDialog.Builder(mActivity)).setTitle(0x7f0b01a6).setIcon(0x1080027).setMessage(getString(0x7f0b01a7)).setPositiveButton(0x7f0b01a6, this).setNegativeButton(0x1040009, null).create();

        case 4: // '\004'
            android.app.AlertDialog.Builder builder1 = (new android.app.AlertDialog.Builder(mActivity)).setTitle(0x7f0b019e);
            Object aobj1[] = new Object[1];
            aobj1[0] = mCilckedFileName;
            return builder1.setMessage(getString(0x7f0b01a5, aobj1)).setPositiveButton(0x104000a, null).create();

        case 3: // '\003'
            return (new android.app.AlertDialog.Builder(mActivity)).setTitle(0x7f0b01a3).setMessage(getString(0x7f0b01a4)).setPositiveButton(0x104000a, this).setNegativeButton(0x1040009, null).create();

        case 2: // '\002'
            android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(mActivity)).setTitle(0x7f0b019e);
            Object aobj[] = new Object[1];
            aobj[0] = mCilckedFileName;
            return builder.setMessage(getString(0x7f0b019f, aobj)).setPositiveButton(0x1040013, null).create();

        case 1: // '\001'
            return (new android.app.AlertDialog.Builder(mActivity)).setTitle(0x7f0b019b).setMessage(getString(0x7f0b019c)).setPositiveButton(0x1040013, null).create();
        }
        return null;
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 0, 0, 0x7f0b019a).setShowAsAction(5);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        Xlog.d("BeamShareHistory", "onCreateView");
        mInflater = layoutinflater;
        View view = mInflater.inflate(0x7f04000d, viewgroup, false);
        TabHost tabhost = (TabHost)(TabHost)view.findViewById(0x1020012);
        tabhost.setup();
        tabhost.setOnTabChangedListener(mTabListener);
        int i = mTabs.size();
        for (int j = 0; j < i; j++)
            ((TabInfo)mTabs.get(j)).build(mInflater, tabhost);

        mCursor = ((TabInfo)mTabs.get(mCurrentTabIndex)).getCursor();
        getActivity().invalidateOptionsMenu();
        return view;
    }

    public void onDestroy()
    {
        int i = mTabs.size();
        for (int j = 0; j < i; j++)
        {
            Cursor cursor = ((TabInfo)mTabs.get(j)).getCursor();
            if (cursor != null)
                cursor.close();
        }

        super.onDestroy();
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 0)
        {
            showDialog(3);
            return true;
        } else
        {
            return false;
        }
    }

    public void onPause()
    {
        super.onPause();
        Xlog.d("BeamShareHistory", "onPause");
        getContentResolver().unregisterContentObserver(mSettingsObserver);
        Xlog.d("BeamShareHistory", "unregister content obsever");
    }

    public void onPrepareOptionsMenu(Menu menu)
    {
        Xlog.d("BeamShareHistory", "onPrepareOptionsMenu");
        if (mCursor != null)
        {
            boolean flag;
            if (mCursor.getCount() > 0)
                flag = true;
            else
                flag = false;
            Xlog.d("BeamShareHistory", (new StringBuilder()).append("Menu enabled status is ").append(mCursor.getCount()).toString());
            menu.findItem(0).setEnabled(flag);
        }
    }

    public void onResume()
    {
        super.onResume();
        mActivity.invalidateOptionsMenu();
        getContentResolver().registerContentObserver(BeamShareTask.BeamShareTaskMetaData.CONTENT_URI, false, mSettingsObserver);
    }





/*
    static int access$102(BeamShareHistory beamsharehistory, int i)
    {
        beamsharehistory.mCurrentTabIndex = i;
        return i;
    }

*/



/*
    static Uri access$1102(BeamShareHistory beamsharehistory, Uri uri)
    {
        beamsharehistory.mLongClickUri = uri;
        return uri;
    }

*/







/*
    static Cursor access$202(BeamShareHistory beamsharehistory, Cursor cursor)
    {
        beamsharehistory.mCursor = cursor;
        return cursor;
    }

*/




/*
    static LayoutInflater access$502(BeamShareHistory beamsharehistory, LayoutInflater layoutinflater)
    {
        beamsharehistory.mInflater = layoutinflater;
        return layoutinflater;
    }

*/



/*
    static BeamShareTabAdapter access$702(BeamShareHistory beamsharehistory, BeamShareTabAdapter beamsharetabadapter)
    {
        beamsharehistory.mAdapter = beamsharetabadapter;
        return beamsharetabadapter;
    }

*/


/*
    static String access$802(BeamShareHistory beamsharehistory, String s)
    {
        beamsharehistory.mCilckedFileName = s;
        return s;
    }

*/


    // Unreferenced inner class com/mediatek/beam/BeamShareHistory$TabInfo$1

/* anonymous class */
    class TabInfo._cls1
        implements android.widget.TabHost.TabContentFactory
    {

        final TabInfo this$1;

        public View createTabContent(String s)
        {
            return buildTabSpec();
        }

            
            {
                this$1 = TabInfo.this;
                super();
            }
    }

}
