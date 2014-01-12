// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.os.*;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.*;
import android.widget.Toast;
import java.io.*;
import java.util.zip.GZIPInputStream;

public class SettingsLicenseActivity extends Activity
{
    private class LicenseFileLoader
        implements Runnable
    {

        private static final String INNER_TAG = "SettingsLicenseActivity.LicenseFileLoader";
        public static final int STATUS_EMPTY_FILE = 3;
        public static final int STATUS_NOT_FOUND = 1;
        public static final int STATUS_OK = 0;
        public static final int STATUS_READ_ERROR = 2;
        private String mFileName;
        private Handler mHandler;
        final SettingsLicenseActivity this$0;

        public void run()
        {
            Object obj;
            StringBuilder stringbuilder;
            obj = null;
            stringbuilder = new StringBuilder(2048);
            char ac[];
            boolean flag;
            ac = new char[2048];
            flag = mFileName.endsWith(".gz");
            obj = null;
            if (!flag) goto _L2; else goto _L1
_L1:
            obj = new InputStreamReader(new GZIPInputStream(new FileInputStream(mFileName)));
_L5:
            int i = ((InputStreamReader) (obj)).read(ac);
            if (i < 0) goto _L4; else goto _L3
_L3:
            stringbuilder.append(ac, 0, i);
              goto _L5
            FileNotFoundException filenotfoundexception;
            filenotfoundexception;
            Log.e("SettingsLicenseActivity.LicenseFileLoader", (new StringBuilder()).append("License HTML file not found at ").append(mFileName).toString(), filenotfoundexception);
            byte byte0 = 1;
            Exception exception;
            IOException ioexception1;
            IOException ioexception2;
            Message message;
            IOException ioexception4;
            FileReader filereader;
            if (obj != null)
                try
                {
                    ((InputStreamReader) (obj)).close();
                }
                catch (IOException ioexception3) { }
            if (byte0 == 0 && TextUtils.isEmpty(stringbuilder))
            {
                Log.e("SettingsLicenseActivity.LicenseFileLoader", (new StringBuilder()).append("License HTML is empty (from ").append(mFileName).append(")").toString());
                byte0 = 3;
            }
            message = mHandler.obtainMessage(byte0, null);
            if (byte0 == 0)
                message.obj = stringbuilder.toString();
            mHandler.sendMessage(message);
            return;
_L2:
            filereader = new FileReader(mFileName);
            obj = filereader;
              goto _L5
_L4:
            byte0 = 0;
            if (obj == null)
                break MISSING_BLOCK_LABEL_133;
            try
            {
                ((InputStreamReader) (obj)).close();
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception4)
            {
                byte0 = 0;
                break MISSING_BLOCK_LABEL_133;
            }
            byte0 = 0;
            break MISSING_BLOCK_LABEL_133;
            ioexception1;
            Log.e("SettingsLicenseActivity.LicenseFileLoader", (new StringBuilder()).append("Error reading license HTML file at ").append(mFileName).toString(), ioexception1);
            byte0 = 2;
            if (obj != null)
                try
                {
                    ((InputStreamReader) (obj)).close();
                }
                // Misplaced declaration of an exception variable
                catch (IOException ioexception2) { }
            break MISSING_BLOCK_LABEL_133;
            exception;
            if (obj != null)
                try
                {
                    ((InputStreamReader) (obj)).close();
                }
                catch (IOException ioexception) { }
            throw exception;
              goto _L5
        }

        public LicenseFileLoader(String s, Handler handler)
        {
            this$0 = SettingsLicenseActivity.this;
            super();
            mFileName = s;
            mHandler = handler;
        }
    }

    class WebChrome extends WebChromeClient
    {

        final SettingsLicenseActivity this$0;

        public void onProgressChanged(WebView webview, int i)
        {
            Log.d("SettingsLicenseActivity", (new StringBuilder()).append("onProgressChanged ").append(i).toString());
            if (i == 100)
            {
                if (mSpinnerDlg != null)
                    mSpinnerDlg.dismiss();
                CookieSyncManager.getInstance().sync();
                setContentView(mWebView);
            }
        }

        public void onReceivedTitle(WebView webview, String s)
        {
            setTitle(s);
        }

        WebChrome()
        {
            this$0 = SettingsLicenseActivity.this;
            super();
        }
    }


    private static final String DEFAULT_LICENSE_PATH = "/system/etc/NOTICE.html.gz";
    private static final boolean LOGV = false;
    private static final String PROPERTY_LICENSE_PATH = "ro.config.license_path";
    private static final String TAG = "SettingsLicenseActivity";
    private Handler mHandler;
    private ProgressDialog mSpinnerDlg;
    private AlertDialog mTextDlg;
    private WebView mWebView;

    public SettingsLicenseActivity()
    {
        mHandler = null;
        mWebView = null;
        mSpinnerDlg = null;
        mTextDlg = null;
    }

    private void showErrorAndFinish()
    {
        mSpinnerDlg.dismiss();
        mSpinnerDlg = null;
        Toast.makeText(this, 0x7f0b05f9, 1).show();
        finish();
    }

    private void showPageOfText(String s)
    {
        mWebView.loadDataWithBaseURL(null, s, "text/html", "utf-8", null);
        mWebView.setWebChromeClient(new WebChrome());
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        String s = SystemProperties.get("ro.config.license_path", "/system/etc/NOTICE.html.gz");
        if (TextUtils.isEmpty(s))
        {
            Log.e("SettingsLicenseActivity", "The system property for the license file is empty.");
            showErrorAndFinish();
            return;
        } else
        {
            CookieSyncManager.createInstance(this);
            setVisible(false);
            mWebView = new WebView(this);
            mWebView.setOverScrollMode(2);
            WebSettings websettings = mWebView.getSettings();
            websettings.setLayoutAlgorithm(android.webkit.WebSettings.LayoutAlgorithm.NARROW_COLUMNS);
            websettings.setUseWideViewPort(true);
            websettings.setSavePassword(false);
            websettings.setSaveFormData(false);
            websettings.setBlockNetworkLoads(true);
            mHandler = new Handler() {

                final SettingsLicenseActivity this$0;

                public void handleMessage(Message message)
                {
                    super.handleMessage(message);
                    if (message.what == 0)
                    {
                        String s1 = (String)message.obj;
                        showPageOfText(s1);
                        return;
                    } else
                    {
                        showErrorAndFinish();
                        return;
                    }
                }

            
            {
                this$0 = SettingsLicenseActivity.this;
                super();
            }
            }
;
            ProgressDialog progressdialog = ProgressDialog.show(this, getText(0x7f0b05f8), getText(0x7f0b05fa), true, false);
            progressdialog.setProgressStyle(0);
            mSpinnerDlg = progressdialog;
            (new Thread(new LicenseFileLoader(s, mHandler))).start();
            return;
        }
    }

    protected void onDestroy()
    {
        if (mTextDlg != null && mTextDlg.isShowing())
            mTextDlg.dismiss();
        if (mSpinnerDlg != null && mSpinnerDlg.isShowing())
            mSpinnerDlg.dismiss();
        mWebView.freeMemory();
        mWebView.destroy();
        super.onDestroy();
    }

    protected void onResume()
    {
        super.onResume();
        CookieSyncManager.getInstance().startSync();
    }

    protected void onStop()
    {
        super.onStop();
        CookieSyncManager.getInstance().stopSync();
        mWebView.stopLoading();
    }




}
