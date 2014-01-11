// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.telephony.PhoneNumberUtils;
import android.util.Log;

public class BlackListManager
{

    private static final int ALL_NUMBERS = 1;
    private static final int AUTO_REJECT = 2;
    private static final String BLACK_LIST_PROJECTION[] = {
        "Number", "Type"
    };
    private static final String BLACK_LIST_URI = "content://reject/list";
    private static final int BLOCK_VIDEO_CALL = 2;
    private static final int BLOCK_VOICE_AND_VIDEO_CALL = 3;
    private static final int BLOCK_VOICE_CALL = 1;
    private static final boolean DBG = true;
    private static final int DO_NOT_BLOCK = 0;
    private static final int OFF = 0;
    private static final String TAG = "BlackListManager";
    public static final int VIDEO_CALL_REJECT_MODE = 1;
    private static final String VIDEO_CALL_REJECT_MODE_KEY = "vt_call_reject_mode";
    public static final int VOICE_CALL_REJECT_MODE = 0;
    private static final String VOICE_CALL_REJECT_MODE_KEY = "voice_call_reject_mode";
    protected Context mContext;

    public BlackListManager(Context context)
    {
        mContext = context;
    }

    public boolean autoReject(String s, int i)
    {
        Cursor cursor = mContext.getContentResolver().query(Uri.parse("content://reject/list"), BLACK_LIST_PROJECTION, null, null, "name ASC");
        if (cursor == null)
        {
            log("cursor is null...");
            return false;
        }
        cursor.moveToFirst();
        do
        {
label0:
            {
                boolean flag = cursor.isAfterLast();
                boolean flag1 = false;
                if (!flag)
                {
                    if (!PhoneNumberUtils.compare(s, cursor.getString(0)))
                        break label0;
                    int j = Integer.parseInt(cursor.getString(1));
                    log((new StringBuilder()).append("blockType = ").append(j).toString());
                    if (j == 3)
                        flag1 = true;
                    else
                    if (i == 0 && j == 1)
                    {
                        flag1 = true;
                    } else
                    {
                        if (i != 1 || j != 2)
                            break label0;
                        flag1 = true;
                    }
                }
                cursor.close();
                return flag1;
            }
            cursor.moveToNext();
        } while (true);
    }

    public int getBlockMode(int i)
    {
        String s;
        int j;
        if (i == 0)
            s = "voice_call_reject_mode";
        else
            s = "vt_call_reject_mode";
        try
        {
            j = android.provider.Settings.System.getInt(mContext.getContentResolver(), s);
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            settingnotfoundexception.printStackTrace();
            return 0;
        }
        return j;
    }

    void log(String s)
    {
        Log.d("BlackListManager", s);
    }

    public boolean shouldBlock(String s, int i)
    {
        boolean flag = true;
        int j = getBlockMode(i);
        log((new StringBuilder()).append("shouldBlock, number = ").append(s).append(" type = ").append(i).append(" mode = ").append(j).toString());
        if (j == 0)
            flag = false;
        else
        if (j != flag)
            return autoReject(s, i);
        return flag;
    }

}
