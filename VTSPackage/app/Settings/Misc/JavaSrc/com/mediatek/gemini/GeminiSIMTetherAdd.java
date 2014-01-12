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
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.mediatek.gemini:
//            GeminiSIMTetherMamager, GeminiSIMTetherItem, GeminiSIMTetherAdapter

public class GeminiSIMTetherAdd extends Activity
    implements android.widget.AdapterView.OnItemClickListener
{
    class ContactDataAsyTask extends AsyncTask
    {

        private Context mContext;
        final GeminiSIMTetherAdd this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected transient Void doInBackground(Void avoid[])
        {
            mIsRefresh = true;
            do
            {
                mNeedRefresh = false;
                Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("before---mNeedRefresh=").append(mNeedRefresh).toString());
                mDataList = mManager.getAllContactData();
                mTotalConNum = mManager.getTotalContactNum();
                Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("after---mNeedRefresh=").append(mNeedRefresh).toString());
            } while (mNeedRefresh && !isCancelled());
            return null;
        }

        protected void onCancelled()
        {
            super.onCancelled();
            Xlog.d("GeminiSIMTetherAdd", "ContactDataAsyTask is cancelled");
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Void)obj);
        }

        protected void onPostExecute(Void void1)
        {
            Xlog.d("GeminiSIMTetherAdd", "onPostExecute");
            removeDialog(1002);
            super.onPostExecute(void1);
            ArrayList arraylist = mDataList;
            boolean flag = false;
            if (arraylist != null)
                if (mDataList.size() > 0)
                {
                    flag = true;
                } else
                {
                    showDialog(1003);
                    flag = false;
                }
            if (flag)
                mListView.setVisibility(0);
            else
                mListView.setVisibility(8);
            GeminiSIMTetherAdd.sAdapter = new GeminiSIMTetherAdapter(mContext, mDataList, true);
            GeminiSIMTetherAdd.sAdapter.setShowCheckBox(true);
            if (mListView != null)
            {
                mListView.setAdapter(GeminiSIMTetherAdd.sAdapter);
                mListView.setOnItemClickListener((android.widget.AdapterView.OnItemClickListener)mContext);
            }
            mIsRefresh = false;
        }

        protected void onPreExecute()
        {
            super.onPreExecute();
            Xlog.d("GeminiSIMTetherAdd", "onPreExecute");
            showDialog(1002);
        }

        public ContactDataAsyTask(Context context)
        {
            this$0 = GeminiSIMTetherAdd.this;
            super();
            Xlog.d("GeminiSIMTetherAdd", "ContactDataAsyTask constructor");
            mContext = context;
        }
    }


    private static final int DIALOG_LOADING = 1002;
    private static final int DIALOG_NO_CONTACT = 1003;
    private static final int DIALOG_WAITING = 1001;
    private static final int MESSAGE_SAVE_FINISHED = 1002;
    private static final String TAG = "GeminiSIMTetherAdd";
    private static GeminiSIMTetherAdapter sAdapter;
    private static boolean sIsNeedSave = false;
    private static boolean sIsSaving = false;
    private TextView mActionBarTextView;
    private ContactDataAsyTask mAsyncTask;
    private ContentObserver mContactObserver;
    private final Context mContext = this;
    private ArrayList mDataList;
    private volatile boolean mIsRefresh;
    private ListView mListView;
    private GeminiSIMTetherMamager mManager;
    private volatile boolean mNeedRefresh;
    private int mNumSelected;
    private Handler mSaveProgressHandler;
    private long mSimId;
    private BroadcastReceiver mSimReceiver;
    private int mTotalConNum;

    public GeminiSIMTetherAdd()
    {
        mDataList = new ArrayList();
        mIsRefresh = false;
        mNeedRefresh = false;
        mTotalConNum = 0;
        mContactObserver = new ContentObserver(new Handler()) {

            final GeminiSIMTetherAdd this$0;

            public void onChange(boolean flag)
            {
                super.onChange(flag);
                Xlog.d("GeminiSIMTetherAdd", "ContentObserver contact data changed");
                if (GeminiSIMTetherAdd.sIsSaving)
                {
                    Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("sIsSaving=").append(GeminiSIMTetherAdd.sIsSaving).toString());
                    return;
                }
                if (mIsRefresh)
                {
                    Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("mIsRefresh=").append(mIsRefresh).toString());
                    mNeedRefresh = true;
                    return;
                }
                Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("mIsRefresh=").append(mIsRefresh).toString());
                if (mAsyncTask != null)
                {
                    boolean flag1 = mAsyncTask.cancel(true);
                    Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("ContentObserver---isCanceld=").append(flag1).toString());
                }
                ContactDataAsyTask contactdataasytask = new ContactDataAsyTask(mContext);
                mAsyncTask = (ContactDataAsyTask)contactdataasytask.execute(new Void[0]);
            }

            
            {
                this$0 = GeminiSIMTetherAdd.this;
                super(handler);
            }
        }
;
        mSimReceiver = new BroadcastReceiver() {

            final GeminiSIMTetherAdd this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
                {
                    Xlog.d("GeminiSIMTetherAdd", "receive ACTION_SIM_INFO_UPDATE");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(GeminiSIMTetherAdd.this);
                    if (list != null)
                        if (list.size() == 0)
                        {
                            Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("Hot swap_simList.size()=").append(list.size()).toString());
                            goBackSettings();
                        } else
                        if (list.size() == 1 && ((android.provider.Telephony.SIMInfo)list.get(0)).mSimId != mSimId)
                        {
                            finish();
                            return;
                        }
                }
            }

            
            {
                this$0 = GeminiSIMTetherAdd.this;
                super();
            }
        }
;
        mSaveProgressHandler = new Handler() {

            final GeminiSIMTetherAdd this$0;

            public void handleMessage(Message message)
            {
                if (message.what == 1002)
                {
                    Xlog.d("GeminiSIMTetherAdd", "tether info save finished");
                    removeDialog(1001);
                    GeminiSIMTetherAdd.sIsSaving = false;
                    Xlog.d("GeminiSIMTetherAdd", "saveTetherConfigs(), end");
                    setResult(-1);
                    finish();
                }
            }

            
            {
                this$0 = GeminiSIMTetherAdd.this;
                super();
            }
        }
;
    }

    private void goBackSettings()
    {
        Intent intent = new Intent(this, com/android/settings/Settings);
        intent.addFlags(0x4000000);
        startActivity(intent);
        finish();
    }

    private void saveTetherConfigs()
    {
        Xlog.d("GeminiSIMTetherAdd", "saveTetherConfigs(), begin");
        if (sIsNeedSave && mListView != null)
        {
            showDialog(1001);
            sIsSaving = true;
            (new Thread() {

                final GeminiSIMTetherAdd this$0;

                public void run()
                {
                    ArrayList arraylist = new ArrayList();
                    int i = mDataList.size();
                    for (int j = 0; j < i; j++)
                    {
                        GeminiSIMTetherItem geminisimtetheritem = (GeminiSIMTetherItem)mDataList.get(j);
                        if (geminisimtetheritem.getCheckedStatus() == 1)
                            arraylist.add(new Integer(geminisimtetheritem.getContactId()));
                    }

                    mManager.setCurrTetheredNum(arraylist, false);
                    mSaveProgressHandler.sendEmptyMessage(1002);
                }

            
            {
                this$0 = GeminiSIMTetherAdd.this;
                super();
            }
            }
).start();
        }
    }

    private void showActionBar()
    {
        ActionBar actionbar = getActionBar();
        View view = ((LayoutInflater)getSystemService("layout_inflater")).inflate(0x7f040054, null);
        ImageButton imagebutton = (ImageButton)view.findViewById(0x7f0800e1);
        mActionBarTextView = (TextView)view.findViewById(0x7f0800e2);
        TextView textview = mActionBarTextView;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(mNumSelected);
        textview.setText(getString(0x7f0b0108, aobj));
        imagebutton.setOnClickListener(new android.view.View.OnClickListener() {

            final GeminiSIMTetherAdd this$0;

            public void onClick(View view1)
            {
                finish();
            }

            
            {
                this$0 = GeminiSIMTetherAdd.this;
                super();
            }
        }
);
        actionbar.setDisplayOptions(16, 26);
        actionbar.setCustomView(view);
    }

    private void updateTitle(int i)
    {
        TextView textview = mActionBarTextView;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        textview.setText(getString(0x7f0b0108, aobj));
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.d("GeminiSIMTetherAdd", "onCreate");
        setContentView(0x7f040039);
        mManager = GeminiSIMTetherMamager.getInstance(this);
        String s = "";
        mSimId = Integer.parseInt(mManager.getCurrSIMID());
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(this, mSimId);
        if (android.provider.Telephony.SIMInfo.getInsertedSIMCount(this) > 1 && siminfo != null)
            s = siminfo.mDisplayName;
        if (s != null && !s.equals(""))
            setTitle(s);
        showActionBar();
        mListView = (ListView)findViewById(0x102000a);
        sIsNeedSave = false;
        mAsyncTask = (ContactDataAsyTask)(new ContactDataAsyTask(this)).execute(new Void[0]);
        registerReceiver(mSimReceiver, new IntentFilter("android.intent.action.SIM_INFO_UPDATE"));
    }

    protected Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 1003: 
            int j;
            if (mTotalConNum == 0)
                j = 0x7f0b0105;
            else
                j = 0x7f0b0106;
            AlertDialog alertdialog = (new android.app.AlertDialog.Builder(this)).setMessage(getString(j)).setTitle(0x7f0b010e).setIcon(0x1080027).setPositiveButton(0x104000a, null).create();
            alertdialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

                final GeminiSIMTetherAdd this$0;

                public void onDismiss(DialogInterface dialoginterface)
                {
                    finish();
                }

            
            {
                this$0 = GeminiSIMTetherAdd.this;
                super();
            }
            }
);
            return alertdialog;

        case 1002: 
            ProgressDialog progressdialog1 = new ProgressDialog(this);
            progressdialog1.setMessage(getResources().getString(0x7f0b05fa));
            progressdialog1.setIndeterminate(true);
            progressdialog1.setCancelable(false);
            return progressdialog1;

        case 1001: 
            ProgressDialog progressdialog = new ProgressDialog(this);
            progressdialog.setMessage(getResources().getString(0x7f0b0110));
            progressdialog.setIndeterminate(true);
            progressdialog.setCancelable(false);
            return progressdialog;
        }
        return null;
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        getMenuInflater().inflate(0x7f100001, menu);
        menu.findItem(0x7f08026f).setVisible(false);
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        ContactDataAsyTask contactdataasytask = mAsyncTask;
        boolean flag = false;
        if (contactdataasytask != null)
            flag = mAsyncTask.cancel(true);
        unregisterReceiver(mSimReceiver);
        Xlog.d("GeminiSIMTetherAdd", (new StringBuilder()).append("onDestroy---isCanceled=").append(flag).toString());
    }

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        CheckBox checkbox = (CheckBox)view.findViewById(0x7f080084);
        if (checkbox != null)
        {
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
            ((GeminiSIMTetherItem)mDataList.get(i)).setCheckedStatus(j);
            sIsNeedSave = true;
            updateTitle(mNumSelected);
        }
    }

    public boolean onMenuItemSelected(int i, MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 2131231344: 
            saveTetherConfigs();
            break;

        case 2131231342: 
            setAllContactSelected(false);
            break;

        case 2131231341: 
            setAllContactSelected(true);
            break;
        }
        return super.onMenuItemSelected(i, menuitem);
    }

    protected void onPause()
    {
        super.onPause();
        Xlog.d("GeminiSIMTetherAdd", "onPause");
        getApplicationContext().getContentResolver().unregisterContentObserver(mContactObserver);
    }

    public void onResume()
    {
        super.onResume();
        Xlog.d("GeminiSIMTetherAdd", "onResume");
        mListView.invalidateViews();
        getApplicationContext().getContentResolver().registerContentObserver(GeminiSIMTetherMamager.GEMINI_TETHER_URI, true, mContactObserver);
    }

    public void setAllContactSelected(boolean flag)
    {
        sIsNeedSave = true;
        if (mListView != null)
        {
            mNumSelected = 0;
            int i = mDataList.size();
            for (int j = 0; j < i; j++)
            {
                GeminiSIMTetherItem geminisimtetheritem = (GeminiSIMTetherItem)mDataList.get(j);
                int k;
                if (flag)
                    k = 1;
                else
                    k = 0;
                geminisimtetheritem.setCheckedStatus(k);
                if (flag)
                    mNumSelected = 1 + mNumSelected;
            }

            mListView.invalidateViews();
        }
        updateTitle(mNumSelected);
    }




/*
    static boolean access$002(boolean flag)
    {
        sIsSaving = flag;
        return flag;
    }

*/




/*
    static boolean access$102(GeminiSIMTetherAdd geminisimtetheradd, boolean flag)
    {
        geminisimtetheradd.mIsRefresh = flag;
        return flag;
    }

*/


/*
    static int access$1102(GeminiSIMTetherAdd geminisimtetheradd, int i)
    {
        geminisimtetheradd.mTotalConNum = i;
        return i;
    }

*/




/*
    static boolean access$202(GeminiSIMTetherAdd geminisimtetheradd, boolean flag)
    {
        geminisimtetheradd.mNeedRefresh = flag;
        return flag;
    }

*/



/*
    static ContactDataAsyTask access$302(GeminiSIMTetherAdd geminisimtetheradd, ContactDataAsyTask contactdataasytask)
    {
        geminisimtetheradd.mAsyncTask = contactdataasytask;
        return contactdataasytask;
    }

*/






/*
    static ArrayList access$702(GeminiSIMTetherAdd geminisimtetheradd, ArrayList arraylist)
    {
        geminisimtetheradd.mDataList = arraylist;
        return arraylist;
    }

*/




/*
    static GeminiSIMTetherAdapter access$902(GeminiSIMTetherAdapter geminisimtetheradapter)
    {
        sAdapter = geminisimtetheradapter;
        return geminisimtetheradapter;
    }

*/
}
