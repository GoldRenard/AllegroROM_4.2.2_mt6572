// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.gemini;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.os.*;
import android.view.*;
import android.widget.*;
import com.android.settings.Settings;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.gemini:
//            GeminiSIMTetherItem, GeminiSIMTetherAdapter, GeminiSIMTetherAdd, GeminiSIMTetherMamager

public class GeminiSIMTetherInfo extends Activity
    implements android.widget.AdapterView.OnItemLongClickListener, android.widget.AdapterView.OnItemClickListener
{
    class ContactAsyTask extends AsyncTask
    {

        private Context mContext;
        final GeminiSIMTetherInfo this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected transient Void doInBackground(Void avoid[])
        {
            Xlog.d("GeminiSIMTetherInfo", "doInBackground()");
            mIsRefresh = true;
            do
            {
                mNeedRefresh = false;
                Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("before---mNeedRefresh=").append(mNeedRefresh).toString());
                mAdpaterData = mManager.getCurrSimData();
                Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("after---mNeedRefresh=").append(mNeedRefresh).toString());
            } while (mNeedRefresh);
            return null;
        }

        public void onCancelled()
        {
            Xlog.i("GeminiSIMTetherInfo", "ContactAsyTask cancelled");
            removeDialog(1001);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Void)obj);
        }

        protected void onPostExecute(Void void1)
        {
            super.onPostExecute(void1);
            Xlog.i("GeminiSIMTetherInfo", "onPostExecute");
            removeDialog(1001);
            GeminiSIMTetherInfo.sAdapter = new GeminiSIMTetherAdapter(mContext, mAdpaterData, false);
            mListView.setAdapter(GeminiSIMTetherInfo.sAdapter);
            GeminiSIMTetherInfo geminisimtetherinfo = GeminiSIMTetherInfo.this;
            boolean flag;
            if (mAdpaterData.size() > 0)
                flag = true;
            else
                flag = false;
            geminisimtetherinfo.mHasRecord = flag;
            updateView(mHasRecord);
            mIsRefresh = false;
            Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("onPostExecute()+ mHasRecord=").append(mHasRecord).toString());
        }

        protected void onPreExecute()
        {
            super.onPreExecute();
            Xlog.d("GeminiSIMTetherInfo", "onPreExecute");
            showDialog(1001);
        }

        public ContactAsyTask(Context context)
        {
            this$0 = GeminiSIMTetherInfo.this;
            super();
            Xlog.i("GeminiSIMTetherInfo", "ContactAsyTask constructor");
            mContext = context;
        }
    }

    class DisContactAsyTask extends AsyncTask
    {

        private Context mContext;
        final GeminiSIMTetherInfo this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected transient Void doInBackground(Void avoid[])
        {
            ArrayList arraylist = new ArrayList();
            int i = mAdpaterData.size();
            for (int j = 0; j < i; j++)
            {
                GeminiSIMTetherItem geminisimtetheritem = (GeminiSIMTetherItem)mAdpaterData.get(j);
                if (geminisimtetheritem.getCheckedStatus() == 0)
                    arraylist.add(new Integer(geminisimtetheritem.getContactId()));
            }

            mManager.setCurrTetheredNum(arraylist, true);
            mAdpaterData = mManager.getCurrSimData();
            return null;
        }

        public void onCancelled()
        {
            Xlog.i("GeminiSIMTetherInfo", "DisContactAsyTask cancelled");
            removeDialog(1001);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Void)obj);
        }

        protected void onPostExecute(Void void1)
        {
            super.onPostExecute(void1);
            removeDialog(1001);
            GeminiSIMTetherInfo.sAdapter = new GeminiSIMTetherAdapter(mContext, mAdpaterData, false);
            mListView.setAdapter(GeminiSIMTetherInfo.sAdapter);
            GeminiSIMTetherInfo geminisimtetherinfo = GeminiSIMTetherInfo.this;
            boolean flag;
            if (mAdpaterData.size() > 0)
                flag = true;
            else
                flag = false;
            geminisimtetherinfo.mHasRecord = flag;
            updateView(mHasRecord);
            mIsRefresh = false;
        }

        protected void onPreExecute()
        {
            super.onPreExecute();
            Xlog.d("GeminiSIMTetherInfo", "onPreExecute DisContactAsyTask");
            showDialog(1001);
        }

        public DisContactAsyTask(Context context)
        {
            this$0 = GeminiSIMTetherInfo.this;
            super();
            Xlog.i("GeminiSIMTetherInfo", "ContactAsyTask constructor");
            mContext = context;
        }
    }


    private static final int DIALOG_WAITING = 1001;
    private static final String TAG = "GeminiSIMTetherInfo";
    private static GeminiSIMTetherAdapter sAdapter;
    private TextView mActionBarTextView;
    private ArrayList mAdpaterData;
    private AsyncTask mAsyncTask;
    private ContentObserver mContactObserver;
    private final Context mContext = this;
    private String mCurrSimId;
    private long mCurrentSimId;
    private boolean mHasRecord;
    private IntentFilter mIntentFilter;
    private volatile boolean mIsRefresh;
    private boolean mIsShowCheckBox;
    private ListView mListView;
    private GeminiSIMTetherMamager mManager;
    private volatile boolean mNeedRefresh;
    private int mNumSelected;
    private BroadcastReceiver mSimReceiver;
    private TextView mTextView;

    public GeminiSIMTetherInfo()
    {
        mAdpaterData = new ArrayList();
        mIsRefresh = false;
        mNeedRefresh = false;
        mIsShowCheckBox = false;
        mContactObserver = new ContentObserver(new Handler()) {

            final GeminiSIMTetherInfo this$0;

            public void onChange(boolean flag)
            {
                super.onChange(flag);
                if (mIsRefresh)
                {
                    Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("mIsRefresh=").append(mIsRefresh).toString());
                    mNeedRefresh = true;
                } else
                {
                    Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("mIsRefresh=").append(mIsRefresh).toString());
                    if (mAsyncTask != null)
                        mAsyncTask.cancel(true);
                    ContactAsyTask contactasytask = new ContactAsyTask(mContext);
                    mAsyncTask = (ContactAsyTask)contactasytask.execute(new Void[0]);
                }
                Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("onChange selfChange=").append(flag).toString());
            }

            
            {
                this$0 = GeminiSIMTetherInfo.this;
                super(handler);
            }
        }
;
        mSimReceiver = new BroadcastReceiver() {

            final GeminiSIMTetherInfo this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("GeminiSIMTetherInfo", "receive ACTION_SIM_INFO_UPDATE");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(GeminiSIMTetherInfo.this);
                    if (list != null)
                        if (list.size() == 0)
                        {
                            Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("Hot swap_simList.size()=").append(list.size()).toString());
                            goBackSettings();
                        } else
                        if (list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSimId != mCurrentSimId)
                        {
                            finish();
                            return;
                        }
                }
            }

            
            {
                this$0 = GeminiSIMTetherInfo.this;
                super();
            }
        }
;
    }

    private int dealWith3AppLaunch()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        int i;
        if (list.size() == 0)
            i = -1;
        else
        if (list.size() == 1)
        {
            i = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
        } else
        {
            i = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                if (i > siminfo.mSlot)
                    i = siminfo.mSlot;
            } while (true);
        }
        Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("dealWith3AppLaunch() slotID=").append(i).toString());
        return i;
    }

    private void disAssContact()
    {
        restoreState();
        mAsyncTask = (new DisContactAsyTask(this)).execute(new Void[0]);
    }

    private void goBackSettings()
    {
        Intent intent = new Intent(this, com/android/settings/Settings);
        intent.addFlags(0x4000000);
        startActivity(intent);
        finish();
    }

    private void hideInformation()
    {
        mTextView.setVisibility(8);
        mListView.setVisibility(8);
    }

    private void restoreCheckState()
    {
        int i = mAdpaterData.size();
        for (int j = 0; j < i; j++)
            ((GeminiSIMTetherItem)mAdpaterData.get(j)).setCheckedStatus(0);

    }

    private void restoreState()
    {
        mNumSelected = 0;
        mIsShowCheckBox = false;
        showActionBar(false);
        sAdapter.setShowCheckBox(mIsShowCheckBox);
        invalidateOptionsMenu();
    }

    private void setAllCheckBoxState(boolean flag)
    {
        int i = mAdpaterData.size();
        mNumSelected = 0;
        for (int j = 0; j < i; j++)
        {
            GeminiSIMTetherItem geminisimtetheritem = (GeminiSIMTetherItem)mAdpaterData.get(j);
            int k;
            if (flag)
                k = 1;
            else
                k = 0;
            geminisimtetheritem.setCheckedStatus(k);
            if (flag)
                mNumSelected = 1 + mNumSelected;
        }

        updateTitle(mNumSelected);
        mListView.invalidateViews();
    }

    private void showActionBar(boolean flag)
    {
        ActionBar actionbar = getActionBar();
        if (flag)
        {
            View view = ((LayoutInflater)getSystemService("layout_inflater")).inflate(0x7f040054, null);
            ImageButton imagebutton = (ImageButton)view.findViewById(0x7f0800e1);
            mActionBarTextView = (TextView)view.findViewById(0x7f0800e2);
            TextView textview = mActionBarTextView;
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(mNumSelected);
            textview.setText(getString(0x7f0b0108, aobj));
            imagebutton.setOnClickListener(new android.view.View.OnClickListener() {

                final GeminiSIMTetherInfo this$0;

                public void onClick(View view1)
                {
                    restoreState();
                    restoreCheckState();
                }

            
            {
                this$0 = GeminiSIMTetherInfo.this;
                super();
            }
            }
);
            actionbar.setDisplayOptions(16, 26);
            actionbar.setCustomView(view);
            return;
        } else
        {
            actionbar.setDisplayOptions(10);
            return;
        }
    }

    private void updateTitle(int i)
    {
        TextView textview = mActionBarTextView;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        textview.setText(getString(0x7f0b0108, aobj));
    }

    private void updateView(boolean flag)
    {
        Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("isRecord=").append(flag).toString());
        if (flag)
        {
            mTextView.setVisibility(8);
            mListView.setVisibility(0);
            return;
        } else
        {
            mTextView.setVisibility(0);
            mListView.setVisibility(8);
            return;
        }
    }

    public void addContacts()
    {
        Xlog.i("GeminiSIMTetherInfo", "Begin to add contacts now");
        boolean flag = mAsyncTask.cancel(true);
        Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("addContacts()---isCanceled=").append(flag).toString());
        Intent intent = new Intent();
        intent.setClass(this, com/mediatek/gemini/GeminiSIMTetherAdd);
        startActivityForResult(intent, 0);
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("onActivityResult() requestCode=").append(i).append(" resultCode=").append(j).toString());
        hideInformation();
        if (j == -1)
        {
            mAsyncTask = (ContactAsyTask)(new ContactAsyTask(this)).execute(new Void[0]);
        } else
        {
            if (j == 0)
            {
                updateView(mHasRecord);
                return;
            }
            if (j == 1)
            {
                updateView(false);
                return;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040038);
        mManager = GeminiSIMTetherMamager.getInstance(this);
        mListView = (ListView)findViewById(0x102000a);
        mTextView = (TextView)findViewById(0x7f080083);
        long l = getIntent().getLongExtra("simid", -1L);
        mCurrentSimId = l;
        Xlog.i("GeminiSIMTetherInfo", (new StringBuilder()).append("onCreate(), simid=").append(l).toString());
        if (l == -1L)
        {
            l = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, dealWith3AppLaunch()).mSimId;
            Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("simId == -1 and reget the sim id=").append(l).toString());
        }
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(this, l);
        int i = android.provider.Telephony.SIMInfo.getInsertedSIMCount(this);
        String s = "";
        if (i > 1 && siminfo != null)
            s = siminfo.mDisplayName;
        if (s != null && !s.equals(""))
            setTitle(s);
        mCurrSimId = String.valueOf(l);
        mManager.setCurrSIMID(mCurrSimId);
        hideInformation();
        mAsyncTask = (ContactAsyTask)(new ContactAsyTask(this)).execute(new Void[0]);
        mListView.setOnItemLongClickListener(this);
        mListView.setOnItemClickListener(this);
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mSimReceiver, mIntentFilter);
    }

    protected Dialog onCreateDialog(int i, Bundle bundle)
    {
        switch (i)
        {
        case 1001: 
            ProgressDialog progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(getResources().getString(0x7f0b05fa));
            progressdialog.setIndeterminate(true);
            progressdialog.setCancelable(false);
            return progressdialog;
        }
        return null;
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        getMenuInflater().inflate(0x7f100001, menu);
        if (!mIsShowCheckBox)
        {
            menu.findItem(0x7f08026d).setVisible(false);
            menu.findItem(0x7f08026e).setVisible(false);
            menu.findItem(0x7f08026f).setVisible(false);
        } else
        {
            menu.findItem(0x7f080270).setVisible(false);
        }
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        AsyncTask asynctask = mAsyncTask;
        boolean flag = false;
        if (asynctask != null)
            flag = mAsyncTask.cancel(true);
        unregisterReceiver(mSimReceiver);
        Xlog.d("GeminiSIMTetherInfo", (new StringBuilder()).append("onDestroy---isCanceled=").append(flag).toString());
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        if (mIsShowCheckBox)
        {
            CheckBox checkbox = (CheckBox)view.findViewById(0x7f080084);
            boolean flag;
            if (!checkbox.isChecked())
                flag = true;
            else
                flag = false;
            checkbox.setChecked(flag);
            int j;
            if (checkbox.isChecked())
            {
                mNumSelected = 1 + mNumSelected;
                j = 1;
            } else
            {
                mNumSelected = -1 + mNumSelected;
                j = 0;
            }
            ((GeminiSIMTetherItem)mAdpaterData.get(i)).setCheckedStatus(j);
            updateTitle(mNumSelected);
        }
    }

    public boolean onItemLongClick(AdapterView adapterview, View view, int i, long l)
    {
        mIsShowCheckBox = true;
        showActionBar(mIsShowCheckBox);
        sAdapter.setShowCheckBox(mIsShowCheckBox);
        invalidateOptionsMenu();
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (keyevent.getKeyCode() == 4 && mIsShowCheckBox)
        {
            restoreState();
            restoreCheckState();
            return true;
        } else
        {
            return super.onKeyDown(i, keyevent);
        }
    }

    public boolean onMenuItemSelected(int i, MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2131231344: 
            addContacts();
            break;

        case 2131231343: 
            disAssContact();
            break;

        case 2131231342: 
            setAllCheckBoxState(false);
            break;

        case 2131231341: 
            setAllCheckBoxState(true);
            break;
        }
        return super.onMenuItemSelected(i, menuitem);
    }

    protected void onPause()
    {
        super.onPause();
        Xlog.d("GeminiSIMTetherInfo", "onPause");
        getApplicationContext().getContentResolver().unregisterContentObserver(mContactObserver);
    }

    protected void onResume()
    {
        super.onResume();
        Xlog.d("GeminiSIMTetherInfo", "onResume");
        getApplicationContext().getContentResolver().registerContentObserver(GeminiSIMTetherMamager.GEMINI_TETHER_URI, true, mContactObserver);
    }



/*
    static boolean access$002(GeminiSIMTetherInfo geminisimtetherinfo, boolean flag)
    {
        geminisimtetherinfo.mIsRefresh = flag;
        return flag;
    }

*/




/*
    static GeminiSIMTetherAdapter access$1002(GeminiSIMTetherAdapter geminisimtetheradapter)
    {
        sAdapter = geminisimtetheradapter;
        return geminisimtetheradapter;
    }

*/


/*
    static boolean access$102(GeminiSIMTetherInfo geminisimtetherinfo, boolean flag)
    {
        geminisimtetherinfo.mNeedRefresh = flag;
        return flag;
    }

*/




/*
    static boolean access$1202(GeminiSIMTetherInfo geminisimtetherinfo, boolean flag)
    {
        geminisimtetherinfo.mHasRecord = flag;
        return flag;
    }

*/




/*
    static AsyncTask access$202(GeminiSIMTetherInfo geminisimtetherinfo, AsyncTask asynctask)
    {
        geminisimtetherinfo.mAsyncTask = asynctask;
        return asynctask;
    }

*/








/*
    static ArrayList access$802(GeminiSIMTetherInfo geminisimtetherinfo, ArrayList arraylist)
    {
        geminisimtetherinfo.mAdpaterData = arraylist;
        return arraylist;
    }

*/

}
