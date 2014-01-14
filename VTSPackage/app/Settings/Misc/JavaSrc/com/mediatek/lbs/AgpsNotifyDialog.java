// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lbs;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import com.mediatek.common.agps.MtkAgpsConfig;
import com.mediatek.common.agps.MtkAgpsManager;
import com.mediatek.xlog.Xlog;
import java.util.*;

public class AgpsNotifyDialog extends Activity
{

    private static final int NOTIFY_STRING_LIST[] = {
        0x7f0b0024, 0x7f0b0036, 0x7f0b0037, 0x7f0b0038, 0x7f0b0039
    };
    private MtkAgpsManager mAgpsMgr;
    private String mCliecntName;
    private Dialog mDialog;
    private boolean mGetOtherNotify;
    private boolean mIsUserResponse;
    private String mMessage;
    private String mRequestId;
    private int mSessionId;
    private Timer mTimer;
    private String mTitle;
    private int mType;

    public AgpsNotifyDialog()
    {
        mTimer = new Timer();
        mIsUserResponse = false;
        mGetOtherNotify = false;
        mDialog = null;
        mTitle = new String();
        mSessionId = -1;
        mType = 0;
    }

    private void log(String s)
    {
        Xlog.d("Settings", (new StringBuilder()).append("[AgpsNotify] ").append(s).append(" ").toString());
    }

    private void setTimerIfNeed(int i)
    {
        boolean flag = true;
        mTimer = new Timer();
        TimerTask timertask = new TimerTask() {

            final AgpsNotifyDialog this$0;

            public void run()
            {
                log("timeout occurred");
                if (mType == 2 || mType == 3)
                    mAgpsMgr.niUserResponse(mSessionId, 0);
                finishActivity(true);
            }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
        }
;
        MtkAgpsConfig mtkagpsconfig = mAgpsMgr.getConfig();
        int j = mtkagpsconfig.notifyTimeout;
        int k = mtkagpsconfig.verifyTimeout;
        if (mtkagpsconfig.niTimer != flag)
            flag = false;
        log((new StringBuilder()).append("notifyTimeout=").append(j).append(" verifyTimeout=").append(k).append(" timerEnabled=").append(flag).toString());
        if (flag)
        {
            int l;
            if (i == 0)
                l = j * 1000;
            else
                l = k * 1000;
            mTimer.schedule(timertask, l);
        }
    }

    private void setup(Intent intent)
    {
        if (mAgpsMgr == null)
            mAgpsMgr = (MtkAgpsManager)getSystemService("mtk-agps");
        Bundle bundle = intent.getExtras();
        if (bundle != null)
        {
            int i = bundle.getInt("type", 1);
            int j = bundle.getInt("session_id", 0);
            mRequestId = bundle.getString("request_id");
            mCliecntName = bundle.getString("client_name");
            boolean flag = bundle.getBoolean("cancel", false);
            int k = bundle.getInt("resp", 0);
            log((new StringBuilder()).append("type=[").append(i).append("] sessionId=[").append(j).append("] pre-essionId=[").append(mSessionId).append("] mRequestId=[").append(mRequestId).append("] mCliecntName=[").append(mCliecntName).append("] cancel=[").append(flag).append("] mockUserResp=[").append(k).append("]").toString());
            if (flag)
            {
                mGetOtherNotify = false;
                finishActivity(true);
                if (mType == 2 || mType == 3)
                    mAgpsMgr.niUserResponse(mSessionId, 0);
                return;
            }
            if (k > 0)
            {
                mGetOtherNotify = false;
                finishActivity(true);
                if (k == 1)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 1);
                    return;
                }
                if (k == 2)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 2);
                    return;
                } else
                {
                    log((new StringBuilder()).append("ERR: unknown mock user response=").append(k).toString());
                    return;
                }
            }
            if (mGetOtherNotify)
            {
                finishActivity(true);
                if (mType == 2 || mType == 3)
                    mAgpsMgr.niUserResponse(mSessionId, 0);
            }
            mSessionId = j;
            mType = i;
            mMessage = getString(NOTIFY_STRING_LIST[i]);
            if (mRequestId != null && mCliecntName != null)
                mMessage = (new StringBuilder()).append(mMessage).append("\n").append(getString(0x7f0b001b)).append(": ").append(mRequestId).append("\n").append(getString(0x7f0b001c)).append(": ").append(mCliecntName).append("\n").toString();
            else
            if (mRequestId != null)
                mMessage = (new StringBuilder()).append(mMessage).append("\n").append(getString(0x7f0b001b)).append(": ").append(mRequestId).toString();
            else
            if (mCliecntName != null)
                mMessage = (new StringBuilder()).append(mMessage).append("\n").append(getString(0x7f0b001c)).append(": ").append(mCliecntName).toString();
            if (mType == 1)
            {
                mTitle = getString(0x7f0b001e);
                setTimerIfNeed(0);
            } else
            if (mType == 2)
            {
                mTitle = getString(0x7f0b001d);
                setTimerIfNeed(1);
            } else
            if (mType == 3)
            {
                mTitle = getString(0x7f0b001d);
                setTimerIfNeed(1);
            } else
            {
                log((new StringBuilder()).append("ERR: unknown type recv type=").append(mType).toString());
            }
            showDialog(mType);
            return;
        } else
        {
            log("Error: Bundle is null");
            finishActivity(false);
            return;
        }
    }

    public void finishActivity(boolean flag)
    {
        mTimer.cancel();
        if (flag)
            sendNotification(this, 0x7f02005d, mTitle, mTitle, mMessage, (new Random()).nextInt(10000));
        if (mDialog != null)
            mDialog.dismiss();
        if (!mGetOtherNotify)
        {
            finish();
            return;
        } else
        {
            mGetOtherNotify = false;
            return;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        log("onCreate v2");
        mIsUserResponse = false;
        setup(getIntent());
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 3: // '\003'
            mDialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0b001d).setMessage(mMessage).setCancelable(false).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                final AgpsNotifyDialog this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 0);
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).setPositiveButton(0x7f0b0021, new android.content.DialogInterface.OnClickListener() {

                final AgpsNotifyDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 1);
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).setNegativeButton(0x7f0b0022, new android.content.DialogInterface.OnClickListener() {

                final AgpsNotifyDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 2);
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).create();
            break;

        case 2: // '\002'
            mDialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0b001d).setMessage(mMessage).setCancelable(false).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                final AgpsNotifyDialog this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 0);
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).setPositiveButton(0x7f0b0021, new android.content.DialogInterface.OnClickListener() {

                final AgpsNotifyDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 1);
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).setNegativeButton(0x7f0b0022, new android.content.DialogInterface.OnClickListener() {

                final AgpsNotifyDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mAgpsMgr.niUserResponse(mSessionId, 2);
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).create();
            break;

        case 1: // '\001'
            mDialog = (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0b001e).setMessage(mMessage).setCancelable(false).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                final AgpsNotifyDialog this$0;

                public void onCancel(DialogInterface dialoginterface)
                {
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).setPositiveButton(0x7f0b0020, new android.content.DialogInterface.OnClickListener() {

                final AgpsNotifyDialog this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    finishActivity(false);
                }

            
            {
                this$0 = AgpsNotifyDialog.this;
                super();
            }
            }
).create();
            break;

        default:
            log("WARNING: No such dialog");
            break;
        }
        return mDialog;
    }

    public void onNewIntent(Intent intent)
    {
        log("onNewIntent");
        mGetOtherNotify = true;
        setup(intent);
    }

    public void sendNotification(Context context, int i, String s, String s1, String s2, int j)
    {
        PendingIntent pendingintent = PendingIntent.getBroadcast(context, 0, new Intent(""), 0);
        Notification notification = new Notification();
        notification.icon = i;
        notification.tickerText = s;
        notification.defaults = 0;
        notification.flags = 16;
        notification.setLatestEventInfo(context, s1, s2, pendingintent);
        ((NotificationManager)getSystemService("notification")).notify(j, notification);
    }





}
