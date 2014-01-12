// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.SystemProperties;
import android.view.KeyEvent;
import android.webkit.*;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController;
import java.util.Locale;

public class SettingsSafetyLegalActivity extends AlertActivity
    implements android.content.DialogInterface.OnCancelListener, android.content.DialogInterface.OnClickListener
{

    private static final String PROPERTY_LSAFETYLEGAL_URL = "ro.url.safetylegal";
    private AlertDialog mErrorDialog;
    private WebView mWebView;

    public SettingsSafetyLegalActivity()
    {
        mErrorDialog = null;
    }

    private void showErrorAndFinish(String s)
    {
        if (mErrorDialog == null)
            mErrorDialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0b05fc).setPositiveButton(0x104000a, this).setOnCancelListener(this).setCancelable(true).create();
        else
        if (mErrorDialog.isShowing())
            mErrorDialog.dismiss();
        mErrorDialog.setMessage(getResources().getString(0x7f0b05fd, new Object[] {
            s
        }));
        mErrorDialog.show();
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        if (keyevent.getKeyCode() == 4 && keyevent.getAction() == 0 && mWebView.canGoBack())
        {
            mWebView.goBack();
            return true;
        } else
        {
            return super.dispatchKeyEvent(keyevent);
        }
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        finish();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        finish();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        String s = SystemProperties.get("ro.url.safetylegal");
        Configuration configuration = getResources().getConfiguration();
        String s1 = String.format("%s&%s", new Object[] {
            s, String.format("locale=%s-%s", new Object[] {
                configuration.locale.getLanguage(), configuration.locale.getCountry()
            })
        });
        mWebView = new WebView(this);
        mWebView.getSettings().setJavaScriptEnabled(true);
        if (bundle == null)
            mWebView.loadUrl(s1);
        else
            mWebView.restoreState(bundle);
        mWebView.setWebViewClient(new WebViewClient() {

            final SettingsSafetyLegalActivity this$0;

            public void onPageFinished(WebView webview, String s2)
            {
                getString.setTitle(getString(0x7f0b05fc));
            }

            public void onReceivedError(WebView webview, int i, String s2, String s3)
            {
                showErrorAndFinish(s3);
            }

            
            {
                this$0 = SettingsSafetyLegalActivity.this;
                super();
            }
        }
);
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mTitle = getString(0x7f0b05fe);
        alertparams.mView = mWebView;
        alertparams.mForceInverseBackground = true;
        setupAlert();
    }

    protected void onDestroy()
    {
        super.onDestroy();
        if (mErrorDialog != null)
        {
            mErrorDialog.dismiss();
            mErrorDialog = null;
        }
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        mWebView.saveState(bundle);
        super.onSaveInstanceState(bundle);
    }


}
