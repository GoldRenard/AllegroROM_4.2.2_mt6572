// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gsm.SmsBroadcastConfigInfo;
import com.android.phone.PhoneGlobals;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.settings:
//            CallSettings, CellBroadcastChannel

class RecoverChannelSettings extends Handler
{

    private static final Uri CHANNEL_URI = Uri.parse("content://cb/channel");
    private static final Uri CHANNEL_URI1 = Uri.parse("content://cb/channel1");
    private static final Uri CHANNEL_URI2 = Uri.parse("content://cb/channel2");
    private static final Uri CHANNEL_URI3 = Uri.parse("content://cb/channel3");
    private static final String ENABLE = "enable";
    private static final String KEYID = "_id";
    private static final String LOG_TAG = "RecoverChannelSettings";
    private static final int MESSAGE_SET_CONFIG = 101;
    private static final String NAME = "name";
    private static final String NUMBER = "number";
    private ArrayList mChannelArray;
    Phone mPhone;
    private ContentResolver mResolver;
    private int mSimId;
    private Uri mUri;

    public RecoverChannelSettings(int i, ContentResolver contentresolver)
    {
        mUri = CHANNEL_URI;
        mPhone = null;
        mResolver = null;
        mChannelArray = new ArrayList();
        mSimId = i;
        mPhone = PhoneGlobals.getPhone();
        mResolver = contentresolver;
        if (CallSettings.isMultipleSim())
            switch (mSimId)
            {
            case 3: // '\003'
                mUri = CHANNEL_URI3;
                return;

            case 2: // '\002'
                mUri = CHANNEL_URI2;
                return;

            case 1: // '\001'
                mUri = CHANNEL_URI1;
                return;

            case 0: // '\0'
                mUri = CHANNEL_URI;
                return;

            default:
                Xlog.d("RecoverChannelSettings", (new StringBuilder()).append("error with simid = ").append(mSimId).toString());
                break;
            }
    }

    private void handleSetCellBroadcastConfigResponse(Message message)
    {
        AsyncResult asyncresult;
        asyncresult = (AsyncResult)message.obj;
        if (asyncresult == null)
            Xlog.i("RecoverChannelSettings", "handleSetCellBroadcastConfigResponse,ar is null");
        if (asyncresult.exception == null) goto _L2; else goto _L1
_L1:
        int i;
        int j;
        int k;
        i = -1;
        j = mChannelArray.size();
        k = 0;
_L8:
        if (k >= j) goto _L4; else goto _L3
_L3:
        if (((CellBroadcastChannel)mChannelArray.get(k)).getChannelId() != message.arg2) goto _L6; else goto _L5
_L5:
        i = k;
_L4:
        Xlog.d("RecoverChannelSettings", (new StringBuilder()).append("handleSetCellBroadcastConfigResponse: ar.exception = ").append(asyncresult.exception).toString());
        for (int l = i; l >= 0 && ((CellBroadcastChannel)mChannelArray.get(l)).getChannelState(); l--)
            updateChannelToDatabase(l);

_L2:
        return;
_L6:
        k++;
        if (true) goto _L8; else goto _L7
_L7:
    }

    private void setCellBroadcastConfig(SmsBroadcastConfigInfo asmsbroadcastconfiginfo[], int i)
    {
        Message message = obtainMessage(101, 0, i, null);
        if (CallSettings.isMultipleSim())
        {
            ((GeminiPhone)mPhone).setCellBroadcastSmsConfigGemini(asmsbroadcastconfiginfo, asmsbroadcastconfiginfo, message, mSimId);
            return;
        } else
        {
            mPhone.setCellBroadcastSmsConfig(asmsbroadcastconfiginfo, asmsbroadcastconfiginfo, message);
            return;
        }
    }

    private boolean updateChannelToDatabase(int i)
    {
        CellBroadcastChannel cellbroadcastchannel = (CellBroadcastChannel)mChannelArray.get(i);
        int j = cellbroadcastchannel.getKeyId();
        String s = cellbroadcastchannel.getChannelName();
        int k = cellbroadcastchannel.getChannelId();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("_id", Integer.valueOf(j));
        contentvalues.put("name", s);
        contentvalues.put("number", Integer.valueOf(k));
        contentvalues.put("enable", Integer.valueOf(0));
        String s1 = (new StringBuilder()).append("_id=").append(cellbroadcastchannel.getKeyId()).toString();
        int l = mResolver.update(mUri, contentvalues, s1, null);
        boolean flag = false;
        if (l > 0)
            flag = true;
        return flag;
    }

    public void handleMessage(Message message)
    {
        switch (message.what)
        {
        case 101: // 'e'
            handleSetCellBroadcastConfigResponse(message);
            return;
        }
    }

    boolean queryChannelFromDatabase()
    {
        String as[];
        Cursor cursor;
        as = (new String[] {
            "_id", "name", "number", "enable"
        });
        cursor = null;
        cursor = mResolver.query(mUri, as, null, null, null);
        if (cursor == null)
            break MISSING_BLOCK_LABEL_154;
_L1:
        CellBroadcastChannel cellbroadcastchannel;
        if (!cursor.moveToNext())
            break MISSING_BLOCK_LABEL_154;
        cellbroadcastchannel = new CellBroadcastChannel();
        cellbroadcastchannel.setChannelId(cursor.getInt(2));
        cellbroadcastchannel.setKeyId(cursor.getInt(0));
        cellbroadcastchannel.setChannelName(cursor.getString(1));
        Exception exception;
        boolean flag;
        if (cursor.getInt(3) == 1)
            flag = true;
        else
            flag = false;
        cellbroadcastchannel.setChannelState(flag);
        mChannelArray.add(cellbroadcastchannel);
          goto _L1
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        if (cursor != null)
            cursor.close();
        return true;
    }

    public void updateChannelStatus()
    {
        if (!queryChannelFromDatabase())
        {
            Xlog.d("RecoverChannelSettings", "queryChannelFromDatabase failure!");
        } else
        {
            int i = mChannelArray.size();
            Xlog.d("RecoverChannelSettings", (new StringBuilder()).append("updateChannelStatus length: ").append(i).toString());
            SmsBroadcastConfigInfo smsbroadcastconfiginfo = null;
            for (int j = 0; j < i; j++)
            {
                int k = ((CellBroadcastChannel)mChannelArray.get(j)).getChannelId();
                if (!((CellBroadcastChannel)mChannelArray.get(j)).getChannelState())
                    continue;
                if (smsbroadcastconfiginfo == null)
                {
                    smsbroadcastconfiginfo = new SmsBroadcastConfigInfo(k, k, -1, -1, true);
                    continue;
                }
                if (smsbroadcastconfiginfo.getToServiceId() != k - 1)
                {
                    setCellBroadcastConfig(new SmsBroadcastConfigInfo[] {
                        smsbroadcastconfiginfo
                    }, smsbroadcastconfiginfo.getToServiceId());
                    smsbroadcastconfiginfo = new SmsBroadcastConfigInfo(k, k, -1, -1, true);
                } else
                {
                    smsbroadcastconfiginfo.setToServiceId(k);
                }
            }

            if (smsbroadcastconfiginfo != null)
            {
                Xlog.d("RecoverChannelSettings", "updateChannelStatus last times");
                setCellBroadcastConfig(new SmsBroadcastConfigInfo[] {
                    smsbroadcastconfiginfo
                }, smsbroadcastconfiginfo.getToServiceId());
                return;
            }
        }
    }

}
