// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.DialogInterface;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.view.Window;
import com.android.internal.telephony.CommandException;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.android.phone:
//            GsmUmtsCallForwardOptions

public class TimeConsumingPreferenceActivity extends PreferenceActivity
    implements TimeConsumingPreferenceListener, android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnCancelListener
{
    private class DismissAndFinishOnClickListener
        implements android.content.DialogInterface.OnClickListener
    {

        final TimeConsumingPreferenceActivity this$0;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            dialoginterface.dismiss();
            finish();
        }

        private DismissAndFinishOnClickListener()
        {
            this$0 = TimeConsumingPreferenceActivity.this;
            super();
        }

    }

    private class DismissOnClickListener
        implements android.content.DialogInterface.OnClickListener
    {

        final TimeConsumingPreferenceActivity this$0;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            dialoginterface.dismiss();
        }

        private DismissOnClickListener()
        {
            this$0 = TimeConsumingPreferenceActivity.this;
            super();
        }

    }


    private static final int BUSY_READING_DIALOG = 100;
    private static final int BUSY_SAVING_DIALOG = 200;
    private static final boolean DBG = true;
    public static final int EXCEPTION_ERROR = 300;
    public static final int FDN_CHECK_FAILURE = 600;
    public static final int FDN_FAIL = 800;
    private static final String LOG_TAG = "Settings/TimeConsumingPreferenceActivity";
    public static final int PASSWORD_ERROR = 700;
    public static final int RADIO_OFF_ERROR = 500;
    public static final int RESPONSE_ERROR = 400;
    private final android.content.DialogInterface.OnClickListener mDismiss = new DismissOnClickListener();
    private final android.content.DialogInterface.OnClickListener mDismissAndFinish = new DismissAndFinishOnClickListener();
    protected boolean mIsForeground;
    protected boolean mIsUpdate;
    private final ArrayList mReadBusyList = new ArrayList();
    private final ArrayList mSaveBusyList = new ArrayList();
    private TimeConsumingPreferenceListener mTCPL;
    private CharSequence mTitle;

    public TimeConsumingPreferenceActivity()
    {
        mTitle = null;
        mIsForeground = false;
        mTCPL = null;
        mIsUpdate = false;
    }

    private CharSequence getDialogTitle()
    {
        if (TextUtils.isEmpty(mTitle))
            mTitle = getText(0x7f0d01dc);
        return mTitle;
    }

    void dumpState()
    {
        String s1;
        for (Iterator iterator = mReadBusyList.iterator(); iterator.hasNext(); Xlog.d("Settings/TimeConsumingPreferenceActivity", (new StringBuilder()).append("mReadBusyList: key=").append(s1).toString()))
            s1 = (String)iterator.next();

        String s;
        for (Iterator iterator1 = mSaveBusyList.iterator(); iterator1.hasNext(); Xlog.d("Settings/TimeConsumingPreferenceActivity", (new StringBuilder()).append("mSaveBusyList: key=").append(s).toString()))
            s = (String)iterator1.next();

    }

    public void onCancel(DialogInterface dialoginterface)
    {
        dumpState();
        finish();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        Xlog.d("Settings/TimeConsumingPreferenceActivity", "onClick");
        dialoginterface.dismiss();
        if (mIsUpdate && (mTCPL instanceof GsmUmtsCallForwardOptions))
        {
            Xlog.d("Settings/TimeConsumingPreferenceActivity", "update call forward settings");
            mIsUpdate = false;
            ((GsmUmtsCallForwardOptions)mTCPL).refreshSettings(true);
        }
    }

    protected Dialog onCreateDialog(int i)
    {
        mIsUpdate = false;
        if (i != 100 && i != 200)
        {
            if (i != 400 && i != 500 && i != 300 && i != 700 && i != 800 && i != 600)
                return null;
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
            int j;
            switch (i)
            {
            case 600: 
                j = 0x7f0d0161;
                builder.setNegativeButton(0x7f0d01e5, this);
                break;

            case 800: 
                j = 0x2050007;
                builder.setNeutralButton(0x7f0d01e5, this);
                break;

            case 700: 
                j = 0x104007c;
                builder.setNeutralButton(0x7f0d01e5, this);
                break;

            case 500: 
                j = 0x7f0d01e4;
                builder.setNeutralButton(0x7f0d01e5, this);
                break;

            case 400: 
                j = 0x7f0d01e1;
                builder.setNegativeButton(0x7f0d01e5, this);
                break;

            default:
                j = 0x7f0d01e2;
                builder.setNeutralButton(0x7f0d01e5, this);
                break;
            }
            builder.setTitle(getText(0x7f0d01dd));
            builder.setMessage(getText(j));
            builder.setCancelable(false);
            AlertDialog alertdialog = builder.create();
            alertdialog.getWindow().addFlags(4);
            return alertdialog;
        }
        ProgressDialog progressdialog = new ProgressDialog(this);
        progressdialog.setTitle(getDialogTitle());
        progressdialog.setIndeterminate(true);
        progressdialog.setCanceledOnTouchOutside(false);
        switch (i)
        {
        case 200: 
            progressdialog.setCancelable(false);
            progressdialog.setMessage(getText(0x7f0d01df));
            return progressdialog;

        case 100: // 'd'
            progressdialog.setCancelable(true);
            progressdialog.setOnCancelListener(this);
            progressdialog.setMessage(getText(0x7f0d01de));
            return progressdialog;
        }
        return null;
    }

    public void onError(Preference preference, int i)
    {
        dumpState();
        Xlog.d("Settings/TimeConsumingPreferenceActivity", (new StringBuilder()).append("onError, preference=").append(preference.getKey()).append(", error=").append(i).toString());
        if (mIsForeground)
            showDialog(i);
    }

    public void onException(Preference preference, CommandException commandexception)
    {
        Xlog.d("Settings/TimeConsumingPreferenceActivity", "onException");
        if (commandexception.getCommandError() == com.android.internal.telephony.CommandException.Error.FDN_CHECK_FAILURE)
        {
            onError(preference, 600);
            return;
        } else
        {
            preference.setEnabled(false);
            onError(preference, 300);
            return;
        }
    }

    public void onFinished(Preference preference, boolean flag)
    {
        dumpState();
        Xlog.d("Settings/TimeConsumingPreferenceActivity", (new StringBuilder()).append("onFinished, preference=").append(preference.getKey()).append(", reading=").append(flag).toString());
        if (flag)
        {
            mReadBusyList.remove(preference.getKey());
            if (mReadBusyList.isEmpty())
            {
                removeDialog(100);
                Xlog.d("Settings/TimeConsumingPreferenceActivity", "removeDialog(BUSY_READING_DIALOG)");
            }
        } else
        {
            mSaveBusyList.remove(preference.getKey());
            if (mSaveBusyList.isEmpty())
            {
                removeDialog(200);
                Xlog.d("Settings/TimeConsumingPreferenceActivity", "removeDialog(BUSY_SAVING_DIALOG)");
            }
        }
        preference.setEnabled(true);
    }

    public void onPause()
    {
        super.onPause();
        mIsForeground = false;
        Xlog.d("Settings/TimeConsumingPreferenceActivity", "onPause");
    }

    public void onResume()
    {
        Xlog.d("Settings/TimeConsumingPreferenceActivity", "onResume");
        super.onResume();
        mIsForeground = true;
        if (mReadBusyList.size() == 1)
        {
            showDialog(100);
            Xlog.d("Settings/TimeConsumingPreferenceActivity", "showDialog(BUSY_READING_DIALOG)");
        }
        if (mSaveBusyList.size() == 1)
        {
            showDialog(200);
            Xlog.d("Settings/TimeConsumingPreferenceActivity", "showDialog(BUSY_SAVING_DIALOG)");
        }
    }

    public void onStarted(Preference preference, boolean flag)
    {
        dumpState();
        Xlog.d("Settings/TimeConsumingPreferenceActivity", (new StringBuilder()).append("onStarted, preference=").append(preference.getKey()).append(", reading=").append(flag).toString());
        if (flag)
        {
            mReadBusyList.add(preference.getKey());
            if (mReadBusyList.size() == 1 && mIsForeground)
            {
                showDialog(100);
                Xlog.d("Settings/TimeConsumingPreferenceActivity", "showDialog(BUSY_READING_DIALOG)");
            }
        } else
        {
            mSaveBusyList.add(preference.getKey());
            if (mSaveBusyList.size() == 1 && mIsForeground)
            {
                showDialog(200);
                Xlog.d("Settings/TimeConsumingPreferenceActivity", "showDialog(BUSY_SAVING_DIALOG)");
                return;
            }
        }
    }

    public void onUpdate(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag)
    {
        mIsUpdate = flag;
        mTCPL = timeconsumingpreferencelistener;
    }

    public void removeDialog()
    {
        if (mSaveBusyList.isEmpty())
            removeDialog(200);
    }

    public void setDialogTitle(CharSequence charsequence)
    {
        mTitle = charsequence;
    }
}
