// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.content.DialogInterface;
import android.net.http.SslCertificate;
import android.os.*;
import android.security.IKeyChainService;
import android.security.KeyChain;
import android.view.*;
import android.widget.*;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;
import java.util.*;
import org.apache.harmony.xnet.provider.jsse.TrustedCertificateStore;

public class TrustedCredentialsSettings extends Fragment
{
    private class AliasOperation extends AsyncTask
    {

        private final CertHolder mCertHolder;
        final TrustedCredentialsSettings this$0;

        protected transient Boolean doInBackground(Void avoid[])
        {
            android.security.KeyChain.KeyChainConnection keychainconnection;
            IKeyChainService ikeychainservice;
            keychainconnection = KeyChain.bind(getActivity());
            ikeychainservice = keychainconnection.getService();
            Boolean boolean2;
            if (!mCertHolder.mDeleted)
                break MISSING_BLOCK_LABEL_60;
            ikeychainservice.installCaCertificate(mCertHolder.mX509Cert.getEncoded());
            boolean2 = Boolean.valueOf(true);
            keychainconnection.close();
            return boolean2;
            Boolean boolean1 = Boolean.valueOf(ikeychainservice.deleteCaCertificate(mCertHolder.mAlias));
            keychainconnection.close();
            CertificateEncodingException certificateencodingexception;
            return boolean1;
            Exception exception;
            exception;
            try
            {
                keychainconnection.close();
                throw exception;
            }
            // Misplaced declaration of an exception variable
            catch (CertificateEncodingException certificateencodingexception)
            {
                return Boolean.valueOf(false);
            }
            catch (IllegalStateException illegalstateexception)
            {
                return Boolean.valueOf(false);
            }
            catch (RemoteException remoteexception)
            {
                return Boolean.valueOf(false);
            }
            catch (InterruptedException interruptedexception)
            {
                Thread.currentThread().interrupt();
            }
            return Boolean.valueOf(false);
        }

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected void onPostExecute(Boolean boolean1)
        {
            mCertHolder.mTab.postOperationUpdate(boolean1.booleanValue(), mCertHolder);
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Boolean)obj);
        }

        private AliasOperation(CertHolder certholder)
        {
            this$0 = TrustedCredentialsSettings.this;
            super();
            mCertHolder = certholder;
        }

    }

    private static class CertHolder
        implements Comparable
    {

        private final TrustedCertificateAdapter mAdapter;
        private final String mAlias;
        private boolean mDeleted;
        private final SslCertificate mSslCert;
        private final TrustedCertificateStore mStore;
        private final String mSubjectPrimary;
        private final String mSubjectSecondary;
        private final Tab mTab;
        private final X509Certificate mX509Cert;

        public int compareTo(CertHolder certholder)
        {
            int i = mSubjectPrimary.compareToIgnoreCase(certholder.mSubjectPrimary);
            if (i != 0)
                return i;
            else
                return mSubjectSecondary.compareToIgnoreCase(certholder.mSubjectSecondary);
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((CertHolder)obj);
        }

        public boolean equals(Object obj)
        {
            if (!(obj instanceof CertHolder))
            {
                return false;
            } else
            {
                CertHolder certholder = (CertHolder)obj;
                return mAlias.equals(certholder.mAlias);
            }
        }

        public int hashCode()
        {
            return mAlias.hashCode();
        }



/*
        static boolean access$002(CertHolder certholder, boolean flag)
        {
            certholder.mDeleted = flag;
            return flag;
        }

*/








        private CertHolder(TrustedCertificateStore trustedcertificatestore, TrustedCertificateAdapter trustedcertificateadapter, Tab tab, String s, X509Certificate x509certificate)
        {
            mStore = trustedcertificatestore;
            mAdapter = trustedcertificateadapter;
            mTab = tab;
            mAlias = s;
            mX509Cert = x509certificate;
            mSslCert = new SslCertificate(x509certificate);
            String s1 = mSslCert.getIssuedTo().getCName();
            String s2 = mSslCert.getIssuedTo().getOName();
            String s3 = mSslCert.getIssuedTo().getUName();
            if (!s2.isEmpty())
            {
                if (!s1.isEmpty())
                {
                    mSubjectPrimary = s2;
                    mSubjectSecondary = s1;
                } else
                {
                    mSubjectPrimary = s2;
                    mSubjectSecondary = s3;
                }
            } else
            if (!s1.isEmpty())
            {
                mSubjectPrimary = s1;
                mSubjectSecondary = "";
            } else
            {
                mSubjectPrimary = mSslCert.getIssuedTo().getDName();
                mSubjectSecondary = "";
            }
            mDeleted = mTab.deleted(mStore, mAlias);
        }

    }

    private static final class Tab extends Enum
    {

        private static final Tab $VALUES[];
        public static final Tab SYSTEM;
        public static final Tab USER;
        private final boolean mCheckbox;
        private final int mLabel;
        private final int mList;
        private final int mProgress;
        private final String mTag;
        private final int mView;

        private boolean deleted(TrustedCertificateStore trustedcertificatestore, String s)
        {
            static class _cls4
            {

                static final int $SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab[];

                static 
                {
                    $SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab = new int[Tab.values().length];
                    try
                    {
                        $SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab[Tab.SYSTEM.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$android$settings$TrustedCredentialsSettings$Tab[Tab.USER.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1)
                    {
                        return;
                    }
                }
            }

            int i = _cls4..SwitchMap.com.android.settings.TrustedCredentialsSettings.Tab[ordinal()];
            boolean flag = false;
            switch (i)
            {
            case 1: // '\001'
                boolean flag1 = trustedcertificatestore.containsAlias(s);
                flag = false;
                if (!flag1)
                    flag = true;
                // fall through

            case 2: // '\002'
                return flag;

            default:
                throw new AssertionError();
            }
        }

        private Set getAliases(TrustedCertificateStore trustedcertificatestore)
        {
            switch (_cls4..SwitchMap.com.android.settings.TrustedCredentialsSettings.Tab[ordinal()])
            {
            case 2: // '\002'
                return trustedcertificatestore.userAliases();

            case 1: // '\001'
                return trustedcertificatestore.allSystemAliases();
            }
            throw new AssertionError();
        }

        private int getButtonConfirmation(CertHolder certholder)
        {
            switch (_cls4..SwitchMap.com.android.settings.TrustedCredentialsSettings.Tab[ordinal()])
            {
            case 2: // '\002'
                return 0x7f0b08fe;

            case 1: // '\001'
                return !certholder.mDeleted ? 0x7f0b08fd : 0x7f0b08fc;
            }
            throw new AssertionError();
        }

        private int getButtonLabel(CertHolder certholder)
        {
            switch (_cls4..SwitchMap.com.android.settings.TrustedCredentialsSettings.Tab[ordinal()])
            {
            case 2: // '\002'
                return 0x7f0b08fb;

            case 1: // '\001'
                return !certholder.mDeleted ? 0x7f0b08f9 : 0x7f0b08fa;
            }
            throw new AssertionError();
        }

        private void postOperationUpdate(boolean flag, CertHolder certholder)
        {
            if (flag)
            {
                if (certholder.mTab.mCheckbox)
                {
                    boolean flag1;
                    if (!certholder.mDeleted)
                        flag1 = true;
                    else
                        flag1 = false;
                    certholder.mDeleted = flag1;
                } else
                {
                    certholder.mAdapter.mCertHolders.remove(certholder);
                }
                certholder.mAdapter.notifyDataSetChanged();
                return;
            } else
            {
                certholder.mAdapter.load();
                return;
            }
        }

        public static Tab valueOf(String s)
        {
            return (Tab)Enum.valueOf(com/android/settings/TrustedCredentialsSettings$Tab, s);
        }

        public static Tab[] values()
        {
            return (Tab[])$VALUES.clone();
        }

        static 
        {
            SYSTEM = new Tab("SYSTEM", 0, "system", 0x7f0b08f7, 0x7f080186, 0x7f080187, 0x7f080188, true);
            USER = new Tab("USER", 1, "user", 0x7f0b08f8, 0x7f080189, 0x7f08018a, 0x7f08018b, false);
            Tab atab[] = new Tab[2];
            atab[0] = SYSTEM;
            atab[1] = USER;
            $VALUES = atab;
        }












        private Tab(String s, int i, String s1, int j, int k, int l, int i1, 
                boolean flag)
        {
            super(s, i);
            mTag = s1;
            mLabel = j;
            mView = k;
            mProgress = l;
            mList = i1;
            mCheckbox = flag;
        }
    }

    private class TrustedCertificateAdapter extends BaseAdapter
    {

        private final List mCertHolders;
        private final Tab mTab;
        final TrustedCredentialsSettings this$0;

        private void load()
        {
            (new AliasLoader()).execute(new Void[0]);
        }

        public int getCount()
        {
            return mCertHolders.size();
        }

        public CertHolder getItem(int i)
        {
            return (CertHolder)mCertHolders.get(i);
        }

        public volatile Object getItem(int i)
        {
            return getItem(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            ViewHolder viewholder;
            if (view == null)
            {
                view = LayoutInflater.from(getActivity()).inflate(0x7f040090, viewgroup, false);
                viewholder = new ViewHolder();
                viewholder.mSubjectPrimaryView = (TextView)view.findViewById(0x7f080182);
                viewholder.mSubjectSecondaryView = (TextView)view.findViewById(0x7f080183);
                viewholder.mCheckBox = (CheckBox)view.findViewById(0x7f080184);
                view.setTag(viewholder);
            } else
            {
                viewholder = (ViewHolder)view.getTag();
            }
            CertHolder certholder = (CertHolder)mCertHolders.get(i);
            viewholder.mSubjectPrimaryView.setText(certholder.mSubjectPrimary);
            viewholder.mSubjectSecondaryView.setText(certholder.mSubjectSecondary);
            if (mTab.mCheckbox)
            {
                CheckBox checkbox = viewholder.mCheckBox;
                boolean flag;
                if (!certholder.mDeleted)
                    flag = true;
                else
                    flag = false;
                checkbox.setChecked(flag);
                viewholder.mCheckBox.setVisibility(0);
            }
            return view;
        }




        private TrustedCertificateAdapter(Tab tab)
        {
            this$0 = TrustedCredentialsSettings.this;
            super();
            mCertHolders = new ArrayList();
            mTab = tab;
            load();
        }

    }

    private class TrustedCertificateAdapter.AliasLoader extends AsyncTask
    {

        View mList;
        ProgressBar mProgressBar;
        final TrustedCertificateAdapter this$1;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((Void[])aobj);
        }

        protected transient List doInBackground(Void avoid[])
        {
            Set set = mTab.getAliases(mStore);
            int i = set.size();
            int j = 0;
            ArrayList arraylist = new ArrayList(i);
            Integer ainteger[];
            for (Iterator iterator = set.iterator(); iterator.hasNext(); publishProgress(ainteger))
            {
                String s = (String)iterator.next();
                X509Certificate x509certificate = (X509Certificate)mStore.getCertificate(s, true);
                arraylist.add(new CertHolder(mStore, TrustedCertificateAdapter.this, mTab, s, x509certificate));
                ainteger = new Integer[2];
                j++;
                ainteger[0] = Integer.valueOf(j);
                ainteger[1] = Integer.valueOf(i);
            }

            Collections.sort(arraylist);
            return arraylist;
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((List)obj);
        }

        protected void onPostExecute(List list)
        {
            mCertHolders.clear();
            mCertHolders.addAll(list);
            notifyDataSetChanged();
            mTabHost.getTabContentView();
            mProgressBar.setVisibility(8);
            mList.setVisibility(0);
            mProgressBar.setProgress(0);
        }

        protected void onPreExecute()
        {
            android.widget.FrameLayout framelayout = mTabHost.getTabContentView();
            mProgressBar = (ProgressBar)framelayout.findViewById(mTab.mProgress);
            mList = framelayout.findViewById(mTab.mList);
            mProgressBar.setVisibility(0);
            mList.setVisibility(8);
        }

        protected transient void onProgressUpdate(Integer ainteger[])
        {
            int i = ainteger[0].intValue();
            int j = ainteger[1].intValue();
            if (j != mProgressBar.getMax())
                mProgressBar.setMax(j);
            mProgressBar.setProgress(i);
        }

        protected volatile void onProgressUpdate(Object aobj[])
        {
            onProgressUpdate((Integer[])aobj);
        }

        private TrustedCertificateAdapter.AliasLoader()
        {
            this$1 = TrustedCertificateAdapter.this;
            super();
        }

    }

    private static class ViewHolder
    {

        private CheckBox mCheckBox;
        private TextView mSubjectPrimaryView;
        private TextView mSubjectSecondaryView;



/*
        static TextView access$1302(ViewHolder viewholder, TextView textview)
        {
            viewholder.mSubjectPrimaryView = textview;
            return textview;
        }

*/



/*
        static TextView access$1402(ViewHolder viewholder, TextView textview)
        {
            viewholder.mSubjectSecondaryView = textview;
            return textview;
        }

*/



/*
        static CheckBox access$1502(ViewHolder viewholder, CheckBox checkbox)
        {
            viewholder.mCheckBox = checkbox;
            return checkbox;
        }

*/

        private ViewHolder()
        {
        }

    }


    private static final String TAG = "TrustedCredentialsSettings";
    private final TrustedCertificateStore mStore = new TrustedCertificateStore();
    private TabHost mTabHost;


    private void addTab(Tab tab)
    {
        android.widget.TabHost.TabSpec tabspec = mTabHost.newTabSpec(tab.mTag).setIndicator(getActivity().getString(tab.mLabel)).setContent(tab.mView);
        mTabHost.addTab(tabspec);
        ListView listview = (ListView)mTabHost.findViewById(tab.mList);
        final TrustedCertificateAdapter adapter = new TrustedCertificateAdapter(tab);
        listview.setAdapter(adapter);
        listview.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {

            final TrustedCredentialsSettings this$0;
            final TrustedCertificateAdapter val$adapter;

            public void onItemClick(AdapterView adapterview, View view, int i, long l)
            {
                showCertDialog(adapter.getItem(i));
            }

            
            {
                this$0 = TrustedCredentialsSettings.this;
                adapter = trustedcertificateadapter;
                super();
            }
        }
);
    }

    private void showCertDialog(final CertHolder certHolder)
    {
        View view = certHolder.mSslCert.inflateCertificateView(getActivity());
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getActivity());
        builder.setTitle(0x10404f7);
        builder.setView(view);
        builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final TrustedCredentialsSettings this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                dialoginterface.dismiss();
            }

            
            {
                this$0 = TrustedCredentialsSettings.this;
                super();
            }
        }
);
        final AlertDialog certDialog = builder.create();
        ViewGroup viewgroup = (ViewGroup)view.findViewById(0x1020354);
        Button button = (Button)LayoutInflater.from(getActivity()).inflate(0x7f040091, viewgroup, false);
        viewgroup.addView(button);
        button.setText(certHolder.mTab.getButtonLabel(certHolder));
        button.setOnClickListener(new android.view.View.OnClickListener() {

            final TrustedCredentialsSettings this$0;
            final Dialog val$certDialog;
            final CertHolder val$certHolder;

            public void onClick(View view1)
            {
                android.app.AlertDialog.Builder builder1 = new android.app.AlertDialog.Builder(getActivity());
                builder1.setMessage(certHolder.mTab.getButtonConfirmation(certHolder));
                builder1.setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                    final _cls3 this$1;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        (new AliasOperation(certHolder)).execute(new Void[0]);
                        dialoginterface.dismiss();
                        certDialog.dismiss();
                    }

            
            {
                this$1 = _cls3.this;
                super();
            }
                }
);
                builder1.setNegativeButton(0x1040009, new android.content.DialogInterface.OnClickListener() {

                    final _cls3 this$1;

                    public void onClick(DialogInterface dialoginterface, int i)
                    {
                        dialoginterface.cancel();
                    }

            
            {
                this$1 = _cls3.this;
                super();
            }
                }
);
                builder1.create().show();
            }

            
            {
                this$0 = TrustedCredentialsSettings.this;
                certHolder = certholder;
                certDialog = dialog;
                super();
            }
        }
);
        certDialog.show();
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mTabHost = (TabHost)layoutinflater.inflate(0x7f040092, viewgroup, false);
        mTabHost.setup();
        addTab(Tab.SYSTEM);
        addTab(Tab.USER);
        return mTabHost;
    }



}
