// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import android.preference.*;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gsm.SmsBroadcastConfigInfo;
import com.android.phone.PhoneGlobals;
import com.android.phone.TimeConsumingPreferenceActivity;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.settings:
//            CellBroadcastChannel, CallSettings, CellBroadcastLanguage

public class CellBroadcastSettings extends TimeConsumingPreferenceActivity
    implements android.preference.Preference.OnPreferenceClickListener, android.content.DialogInterface.OnClickListener
{
    private class MyHandler extends Handler
    {

        final CellBroadcastSettings this$0;

        private void handleGetCellBroadcastConfigResponse(Message message)
        {
            if (message.arg2 == 100)
                onFinished(mLanguagePreference, true);
            else
                onFinished(mLanguagePreference, false);
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult == null)
            {
                Xlog.i("Settings/CellBroadcastSettings", "handleGetCellBroadcastConfigResponse,ar is null");
                onError(mLanguagePreference, 400);
                if (message.arg2 == 100)
                {
                    mLanguagePreference.setEnabled(false);
                    mAddChannelPreference.setEnabled(false);
                }
            } else
            if (asyncresult.exception != null)
            {
                Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("handleGetCellBroadcastConfigResponse: ar.exception=").append(asyncresult.exception).toString());
                onError(mLanguagePreference, 300);
                if (message.arg2 == 100)
                {
                    mLanguagePreference.setEnabled(false);
                    mAddChannelPreference.setEnabled(false);
                    return;
                }
            } else
            {
                if (asyncresult != null && (asyncresult.userObj instanceof Throwable))
                {
                    onError(mLanguagePreference, 400);
                    return;
                }
                if (asyncresult.result != null)
                {
                    ArrayList arraylist = (ArrayList)asyncresult.result;
                    if (queryChannelFromDatabase())
                    {
                        initChannelMap();
                        updateCurrentChannelAndLanguage(arraylist);
                        updateChannelUIList();
                        updateLanguageSummary();
                        return;
                    } else
                    {
                        showUpdateDBErrorInfoDialog();
                        return;
                    }
                }
                onError(mLanguagePreference, 400);
                Xlog.d("Settings/CellBroadcastSettings", "handleGetCellBroadcastConfigResponse: ar.result is null");
                if (message.arg2 == 100)
                {
                    mLanguagePreference.setEnabled(false);
                    mAddChannelPreference.setEnabled(false);
                    return;
                }
            }
        }

        private void handleSetCellBroadcastConfigResponse(Message message)
        {
            if (message.arg2 == 101)
            {
                AsyncResult asyncresult = (AsyncResult)message.obj;
                if (asyncresult == null)
                {
                    Xlog.i("Settings/CellBroadcastSettings", "handleSetCellBroadcastConfigResponse,ar is null");
                    onError(mLanguagePreference, 400);
                }
                if (asyncresult.exception != null)
                {
                    Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("handleSetCellBroadcastConfigResponse: ar.exception=").append(asyncresult.exception).toString());
                    onError(mLanguagePreference, 300);
                }
                getCellBroadcastConfig(false);
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 101: // 'e'
                handleSetCellBroadcastConfigResponse(message);
                return;

            case 100: // 'd'
                handleGetCellBroadcastConfigResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CellBroadcastSettings.this;
            super();
        }

    }


    private static final int CB_MAX_CHANNEL = 65535;
    private static final int CHANNEL_NAME_LENGTH = 20;
    private static final Uri CHANNEL_URI = Uri.parse("content://cb/channel");
    private static final Uri CHANNEL_URI1 = Uri.parse("content://cb/channel1");
    private static final Uri CHANNEL_URI2 = Uri.parse("content://cb/channel2");
    private static final Uri CHANNEL_URI3 = Uri.parse("content://cb/channel3");
    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String ENABLE = "enable";
    private static final String KEYID = "_id";
    private static final String KEY_ADD_CHANNEL = "button_add_channel";
    private static final String KEY_CHANNEL_LIST = "menu_channel_list";
    private static final String KEY_LANGUAGE = "button_language";
    private static final int LANGUAGE_NUM = 22;
    private static final String LOG_TAG = "Settings/CellBroadcastSettings";
    private static final int MENU_CHANNEL_DELETE = 12;
    private static final int MENU_CHANNEL_EDIT = 11;
    private static final int MENU_CHANNEL_ENABLE_DISABLE = 10;
    private static final int MESSAGE_GET_CONFIG = 100;
    private static final int MESSAGE_SET_CONFIG = 101;
    private static final String NAME = "name";
    private static final String NUMBER = "number";
    private PreferenceScreen mAddChannelPreference;
    private ArrayList mChannelArray;
    private PreferenceCategory mChannelListPreference;
    private HashMap mChannelMap;
    private MyHandler mHandler;
    private ArrayList mLanguageList;
    private HashMap mLanguageMap;
    private PreferenceScreen mLanguagePreference;
    private Phone mPhone;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final CellBroadcastSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("[action = ").append(s).append("]").toString());
            if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                setScreenEnabled();
        }

            
            {
                this$0 = CellBroadcastSettings.this;
                super();
            }
    }
;
    private int mSimId;
    private Uri mUri;

    public CellBroadcastSettings()
    {
        mUri = CHANNEL_URI;
        mHandler = new MyHandler();
        mLanguageList = new ArrayList();
        mChannelArray = new ArrayList();
        mSimId = 2;
    }

    private boolean checkChannelIdExist(int i)
    {
        int j = mChannelArray.size();
        for (int k = 0; k < j; k++)
            if (((CellBroadcastChannel)mChannelArray.get(k)).getChannelId() == i)
                return true;

        return false;
    }

    private boolean checkChannelIdExist(int i, int j)
    {
        int k = mChannelArray.size();
        for (int l = 0; l < k; l++)
        {
            CellBroadcastChannel cellbroadcastchannel = (CellBroadcastChannel)mChannelArray.get(l);
            int i1 = cellbroadcastchannel.getChannelId();
            int j1 = cellbroadcastchannel.getKeyId();
            if (i1 == i && j1 != j)
                return true;
        }

        return false;
    }

    private boolean checkChannelName(String s)
    {
        if (s == null || s.length() == 0)
            s = "";
        return s.length() <= 20;
    }

    private boolean checkChannelNumber(String s)
    {
        if (s != null && s.length() != 0)
        {
            int i = Integer.valueOf(s).intValue();
            if (i < 65535 && i >= 0)
                return true;
        }
        return false;
    }

    private void clearChannel()
    {
        if (mChannelArray != null)
            mChannelArray.clear();
    }

    private boolean deleteChannelFromDatabase(CellBroadcastChannel cellbroadcastchannel)
    {
        String s = (new StringBuilder()).append("number=").append(cellbroadcastchannel.getChannelId()).toString();
        try
        {
            getContentResolver().delete(mUri, s, null);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        return true;
    }

    private void displayMessage(int i)
    {
        Toast.makeText(this, getString(i), 0).show();
    }

    private void displayMessage(String s)
    {
        Toast.makeText(this, s, 0).show();
    }

    private void dumpConfigInfo(SmsBroadcastConfigInfo smsbroadcastconfiginfo)
    {
        Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("dump start for ").append(smsbroadcastconfiginfo.toString()).toString());
        Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("FromServiceId ").append(smsbroadcastconfiginfo.getFromServiceId()).append("  ToServiceId ").append(smsbroadcastconfiginfo.getToServiceId()).toString());
        Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("FromCodeId ").append(smsbroadcastconfiginfo.getFromCodeScheme()).append("  ToCodeId ").append(smsbroadcastconfiginfo.getToCodeScheme()).toString());
        Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("dump end for ").append(smsbroadcastconfiginfo.toString()).toString());
    }

    private void getCellBroadcastConfig(boolean flag)
    {
        Message message;
        if (flag)
            message = mHandler.obtainMessage(100, 0, 100, null);
        else
            message = mHandler.obtainMessage(100, 0, 101, null);
        if (CallSettings.isMultipleSim())
            ((GeminiPhone)mPhone).getCellBroadcastSmsConfigGemini(message, mSimId);
        else
            mPhone.getCellBroadcastSmsConfig(message);
        if (flag)
            onStarted(mLanguagePreference, flag);
    }

    private CellBroadcastChannel getChannelObjectFromKey(String s)
    {
        return (CellBroadcastChannel)mChannelMap.get(s);
    }

    private CellBroadcastLanguage getLanguageObjectFromKey(String s)
    {
        return (CellBroadcastLanguage)mLanguageMap.get(s);
    }

    private void initChannelMap()
    {
        mChannelMap = new HashMap();
        int i = mChannelArray.size();
        for (int j = 0; j < i; j++)
        {
            int k = ((CellBroadcastChannel)mChannelArray.get(j)).getChannelId();
            mChannelMap.put(String.valueOf(k), mChannelArray.get(j));
        }

    }

    private void initLanguage()
    {
        initLanguageList();
        initLanguageMap();
    }

    private void initLanguageList()
    {
        boolean aflag[] = new boolean[22];
        String[] _tmp = new String[22];
        String[] _tmp1 = new String[22];
        String as[] = getResources().getStringArray(0x7f07000c);
        String as1[] = getResources().getStringArray(0x7f07000d);
        for (int i = 0; i < 22; i++)
        {
            CellBroadcastLanguage cellbroadcastlanguage = new CellBroadcastLanguage(Integer.valueOf(as1[i]).intValue(), as[i], aflag[i]);
            mLanguageList.add(cellbroadcastlanguage);
        }

    }

    private void initLanguageMap()
    {
        mLanguageMap = new HashMap();
        for (int i = 0; i < 22; i++)
        {
            CellBroadcastLanguage cellbroadcastlanguage = (CellBroadcastLanguage)mLanguageList.get(i);
            if (cellbroadcastlanguage != null)
            {
                int j = cellbroadcastlanguage.getLanguageId();
                mLanguageMap.put(String.valueOf(j), cellbroadcastlanguage);
            }
        }

    }

    private void initPreference()
    {
        mLanguagePreference = (PreferenceScreen)findPreference("button_language");
        mAddChannelPreference = (PreferenceScreen)findPreference("button_add_channel");
        mChannelListPreference = (PreferenceCategory)findPreference("menu_channel_list");
        mLanguagePreference.setOnPreferenceClickListener(this);
        mAddChannelPreference.setOnPreferenceClickListener(this);
    }

    private boolean insertChannelToDatabase(CellBroadcastChannel cellbroadcastchannel)
    {
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("name", cellbroadcastchannel.getChannelName());
        contentvalues.put("number", Integer.valueOf(cellbroadcastchannel.getChannelId()));
        contentvalues.put("enable", Boolean.valueOf(cellbroadcastchannel.getChannelState()));
        try
        {
            int i = Integer.valueOf(getContentResolver().insert(mUri, contentvalues).getLastPathSegment()).intValue();
            cellbroadcastchannel.setKeyId(i);
            Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("insertChannelToDatabase(), insertId: ").append(i).toString());
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        return true;
    }

    private SmsBroadcastConfigInfo[] makeChannelConfigArray(CellBroadcastChannel cellbroadcastchannel)
    {
        SmsBroadcastConfigInfo asmsbroadcastconfiginfo[] = new SmsBroadcastConfigInfo[1];
        int i = cellbroadcastchannel.getChannelId();
        asmsbroadcastconfiginfo[0] = new SmsBroadcastConfigInfo(i, i, -1, -1, cellbroadcastchannel.getChannelState());
        return asmsbroadcastconfiginfo;
    }

    private SmsBroadcastConfigInfo[] makeLanguageConfigArray()
    {
        ArrayList arraylist = new ArrayList();
        if (((CellBroadcastLanguage)mLanguageList.get(0)).getLanguageState())
        {
            arraylist.add(new SmsBroadcastConfigInfo(-1, -1, -2, -2, true));
        } else
        {
            int i = ((CellBroadcastLanguage)mLanguageList.get(1)).getLanguageId();
            int j = i;
            boolean flag = ((CellBroadcastLanguage)mLanguageList.get(1)).getLanguageState();
            int k = mLanguageList.size();
            int l;
            for (l = 2; l < k; l++)
            {
                CellBroadcastLanguage cellbroadcastlanguage = (CellBroadcastLanguage)mLanguageList.get(l);
                int i1 = cellbroadcastlanguage.getLanguageId();
                boolean flag1 = cellbroadcastlanguage.getLanguageState();
                if (i1 == j + 1 && flag == flag1)
                {
                    j = i1;
                } else
                {
                    arraylist.add(new SmsBroadcastConfigInfo(-1, -1, i, j, flag));
                    i = i1;
                    j = i1;
                    flag = flag1;
                }
            }

            if (l == mLanguageList.size())
                arraylist.add(new SmsBroadcastConfigInfo(-1, -1, i, ((CellBroadcastLanguage)mLanguageList.get(l - 1)).getLanguageId(), flag));
        }
        return (SmsBroadcastConfigInfo[])arraylist.toArray(new SmsBroadcastConfigInfo[arraylist.size()]);
    }

    private boolean queryChannelFromDatabase()
    {
        boolean flag;
        clearChannel();
        String as[] = {
            "_id", "name", "number", "enable"
        };
        Cursor cursor;
        CellBroadcastChannel cellbroadcastchannel;
        try
        {
            cursor = getContentResolver().query(mUri, as, null, null, null);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        if (cursor == null)
            break MISSING_BLOCK_LABEL_143;
        if (!cursor.moveToNext())
            break MISSING_BLOCK_LABEL_137;
        cellbroadcastchannel = new CellBroadcastChannel();
        cellbroadcastchannel.setChannelId(cursor.getInt(2));
        cellbroadcastchannel.setKeyId(cursor.getInt(0));
        cellbroadcastchannel.setChannelName(cursor.getString(1));
        if (cursor.getInt(3) == 1)
            flag = true;
        else
            flag = false;
        cellbroadcastchannel.setChannelState(flag);
        mChannelArray.add(cellbroadcastchannel);
        break MISSING_BLOCK_LABEL_49;
        cursor.close();
        return true;
    }

    private void requestInputMethod(Dialog dialog)
    {
        dialog.getWindow().setSoftInputMode(21);
    }

    private void setCellBroadcastConfig(SmsBroadcastConfigInfo asmsbroadcastconfiginfo[])
    {
        Message message = mHandler.obtainMessage(101, 0, 101, null);
        if (CallSettings.isMultipleSim())
            ((GeminiPhone)mPhone).setCellBroadcastSmsConfigGemini(asmsbroadcastconfiginfo, asmsbroadcastconfiginfo, message, mSimId);
        else
            mPhone.setCellBroadcastSmsConfig(asmsbroadcastconfiginfo, asmsbroadcastconfiginfo, message);
        onStarted(mLanguagePreference, false);
    }

    private void setLanguageSummary(boolean aflag[])
    {
        if (aflag == null)
            return;
        boolean flag = true;
        int i = aflag.length;
        int j = 1;
        do
        {
label0:
            {
                if (j < i)
                {
                    if (aflag[j])
                        break label0;
                    flag = false;
                }
                aflag[0] = flag;
                if (aflag[0])
                {
                    mLanguagePreference.setSummary(0x7f0d00dd);
                    return;
                }
                int k = 0;
                String s = "";
                int l = -1;
                int i1 = 1;
                do
                {
label1:
                    {
                        if (i1 < i)
                        {
                            if (aflag[i1] && k < 2)
                            {
                                s = (new StringBuilder()).append(s).append(((CellBroadcastLanguage)mLanguageList.get(i1)).getLanguageName()).append(" ").toString();
                                k++;
                                l = i1;
                            }
                            if (!aflag[i1] || i1 <= l || l == -1)
                                break label1;
                            s = (new StringBuilder()).append(s).append(" ...").toString();
                        }
                        mLanguagePreference.setSummary(s);
                        return;
                    }
                    i1++;
                } while (true);
            }
            j++;
        } while (true);
    }

    private void setScreenEnabled()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (list.size() == 0)
            finish();
        else
        if (CallSettings.isMultipleSim() && list.size() == 1 && mSimId != ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot)
        {
            finish();
            return;
        }
    }

    private void showAddChannelDialog()
    {
        final View setView = LayoutInflater.from(this).inflate(0x7f04002f, null);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setView(setView);
        builder.setTitle(0x7f0d00d0);
        builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final CellBroadcastSettings this$0;
            final View val$setView;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                EditText edittext = (EditText)setView.findViewById(0x7f0800d2);
                EditText edittext1 = (EditText)setView.findViewById(0x7f0800d3);
                CheckBox checkbox = (CheckBox)setView.findViewById(0x7f0800d4);
                String s = edittext.getText().toString();
                String s1 = edittext1.getText().toString();
                boolean flag = checkbox.isChecked();
                String s2 = "";
                if (!checkChannelName(s))
                    s2 = (new StringBuilder()).append(s2).append(getString(0x7f0d00da)).toString();
                if (!checkChannelNumber(s1))
                    s2 = (new StringBuilder()).append(s2).append("\n").append(getString(0x7f0d00d9)).toString();
                if (s2.equals(""))
                {
                    int j = Integer.valueOf(s1).intValue();
                    if (!checkChannelIdExist(j))
                    {
                        dialoginterface.dismiss();
                        CellBroadcastChannel cellbroadcastchannel = new CellBroadcastChannel(j, s, flag);
                        SmsBroadcastConfigInfo asmsbroadcastconfiginfo[] = makeChannelConfigArray(cellbroadcastchannel);
                        if (insertChannelToDatabase(cellbroadcastchannel))
                        {
                            mChannelArray.add(cellbroadcastchannel);
                            mChannelMap.put(String.valueOf(cellbroadcastchannel.getChannelId()), cellbroadcastchannel);
                            updateChannelUIList();
                            if (cellbroadcastchannel.getChannelState())
                                setCellBroadcastConfig(asmsbroadcastconfiginfo);
                            return;
                        } else
                        {
                            showUpdateDBErrorInfoDialog();
                            return;
                        }
                    } else
                    {
                        displayMessage(0x7f0d00dc);
                        return;
                    }
                } else
                {
                    displayMessage(s2);
                    return;
                }
            }

            
            {
                this$0 = CellBroadcastSettings.this;
                setView = view;
                super();
            }
        }
);
        builder.setNegativeButton(0x1040000, null);
        AlertDialog alertdialog = builder.create();
        requestInputMethod(alertdialog);
        alertdialog.show();
    }

    private void showEditChannelDialog(final CellBroadcastChannel oldChannel)
    {
        oldChannel.getKeyId();
        int i = oldChannel.getChannelId();
        String s = oldChannel.getChannelName();
        boolean flag = oldChannel.getChannelState();
        View view = LayoutInflater.from(this).inflate(0x7f04002f, null);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setView(view);
        builder.setTitle(0x7f0d00d6);
        final EditText channelName = (EditText)view.findViewById(0x7f0800d2);
        final EditText channelNum = (EditText)view.findViewById(0x7f0800d3);
        final CheckBox channelState = (CheckBox)view.findViewById(0x7f0800d4);
        channelName.setText(s);
        channelNum.setText(String.valueOf(i));
        channelState.setChecked(flag);
        builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final CellBroadcastSettings this$0;
            final EditText val$channelName;
            final EditText val$channelNum;
            final CheckBox val$channelState;
            final CellBroadcastChannel val$oldChannel;

            public void onClick(DialogInterface dialoginterface, int j)
            {
                String s1 = channelName.getText().toString();
                String s2 = channelNum.getText().toString();
                boolean flag1 = channelState.isChecked();
                String s3 = "";
                if (!checkChannelName(s1))
                    s3 = (new StringBuilder()).append(s3).append(getString(0x7f0d00da)).toString();
                if (!checkChannelNumber(s2))
                    s3 = (new StringBuilder()).append(s3).append("\n").append(getString(0x7f0d00d9)).toString();
                if (s3.equals(""))
                {
                    int k = Integer.valueOf(s2).intValue();
                    int l = oldChannel.getChannelId();
                    if (!checkChannelIdExist(k, oldChannel.getKeyId()))
                    {
                        dialoginterface.dismiss();
                        CellBroadcastChannel cellbroadcastchannel = new CellBroadcastChannel(oldChannel.getKeyId(), k, s1, flag1);
                        oldChannel.setChannelState(false);
                        int i1 = cellbroadcastchannel.getChannelId();
                        SmsBroadcastConfigInfo asmsbroadcastconfiginfo[] = new SmsBroadcastConfigInfo[2];
                        asmsbroadcastconfiginfo[0] = new SmsBroadcastConfigInfo(l, l, -1, -1, false);
                        asmsbroadcastconfiginfo[1] = new SmsBroadcastConfigInfo(i1, i1, -1, -1, cellbroadcastchannel.getChannelState());
                        if (updateChannelToDatabase(oldChannel, cellbroadcastchannel))
                        {
                            setCellBroadcastConfig(asmsbroadcastconfiginfo);
                            return;
                        } else
                        {
                            showUpdateDBErrorInfoDialog();
                            return;
                        }
                    } else
                    {
                        displayMessage(getString(0x7f0d00dc));
                        return;
                    }
                } else
                {
                    displayMessage(s3);
                    return;
                }
            }

            
            {
                this$0 = CellBroadcastSettings.this;
                channelName = edittext;
                channelNum = edittext1;
                channelState = checkbox;
                oldChannel = cellbroadcastchannel;
                super();
            }
        }
);
        builder.setNegativeButton(0x1040000, null);
        AlertDialog alertdialog = builder.create();
        alertdialog.show();
        requestInputMethod(alertdialog);
    }

    private void showLanguageSelectDialog()
    {
        final boolean temp[] = new boolean[22];
        final boolean temp2[] = new boolean[22];
        boolean flag = true;
        for (int i = 1; i < temp.length; i++)
        {
            CellBroadcastLanguage cellbroadcastlanguage = (CellBroadcastLanguage)mLanguageList.get(i);
            if (cellbroadcastlanguage != null)
            {
                Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("language status ").append(cellbroadcastlanguage.getLanguageState()).toString());
                temp[i] = cellbroadcastlanguage.getLanguageState();
                temp2[i] = cellbroadcastlanguage.getLanguageState();
            } else
            {
                Xlog.i("Settings/CellBroadcastSettings", (new StringBuilder()).append("showLanguageSelectDialog() init the language list failed when i=").append(i).toString());
            }
            if (!temp[i])
                flag = false;
        }

        Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("All language status ").append(flag).toString());
        ((CellBroadcastLanguage)mLanguageList.get(0)).setLanguageState(flag);
        temp[0] = flag;
        temp2[0] = flag;
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setTitle(getString(0x7f0d00d2));
        builder.setPositiveButton(0x7f0d0192, new android.content.DialogInterface.OnClickListener() {

            final CellBroadcastSettings this$0;
            final boolean val$temp[];
            final boolean val$temp2[];

            public void onClick(DialogInterface dialoginterface, int j)
            {
                int k = temp.length;
                if (temp[0])
                {
                    for (int j1 = 0; j1 < k; j1++)
                        temp[j1] = true;

                }
                boolean flag1 = false;
                for (int l = 0; l < k; l++)
                {
                    ((CellBroadcastLanguage)mLanguageList.get(l)).setLanguageState(temp[l]);
                    if (temp[l])
                        flag1 = true;
                }

                if (flag1)
                {
                    SmsBroadcastConfigInfo asmsbroadcastconfiginfo[] = makeLanguageConfigArray();
                    setCellBroadcastConfig(asmsbroadcastconfiginfo);
                } else
                {
                    displayMessage(0x7f0d00db);
                    for (int i1 = 0; i1 < k; i1++)
                        ((CellBroadcastLanguage)mLanguageList.get(i1)).setLanguageState(temp2[i1]);

                }
            }

            
            {
                this$0 = CellBroadcastSettings.this;
                temp = aflag;
                temp2 = aflag1;
                super();
            }
        }
);
        builder.setNegativeButton(0x7f0d0196, null);
        builder.setMultiChoiceItems(0x7f07000c, temp, new android.content.DialogInterface.OnMultiChoiceClickListener() {

            final CellBroadcastSettings this$0;
            final boolean val$temp[];

            public void onClick(DialogInterface dialoginterface, int j, boolean flag1)
            {
                temp[j] = flag1;
                boolean flag2 = dialoginterface instanceof AlertDialog;
                AlertDialog alertdialog1 = null;
                if (flag2)
                    alertdialog1 = (AlertDialog)dialoginterface;
                if (j == 0)
                {
                    if (alertdialog1 != null)
                    {
                        for (int k = 1; k < temp.length; k++)
                        {
                            alertdialog1.getListView().setItemChecked(k, flag1);
                            temp[k] = flag1;
                        }

                    }
                } else
                if (!flag1 && alertdialog1 != null)
                {
                    alertdialog1.getListView().setItemChecked(0, flag1);
                    temp[0] = false;
                }
            }

            
            {
                this$0 = CellBroadcastSettings.this;
                temp = aflag;
                super();
            }
        }
);
        AlertDialog alertdialog = builder.create();
        if (alertdialog != null)
            alertdialog.show();
    }

    private void showUpdateDBErrorInfoDialog()
    {
        onError(mLanguagePreference, 300);
    }

    private boolean updateChannelToDatabase(CellBroadcastChannel cellbroadcastchannel, CellBroadcastChannel cellbroadcastchannel1)
    {
        new String[] {
            "_id", "name", "number", "enable"
        };
        int i = cellbroadcastchannel1.getKeyId();
        String s = cellbroadcastchannel1.getChannelName();
        boolean flag = cellbroadcastchannel1.getChannelState();
        int j = cellbroadcastchannel1.getChannelId();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("_id", Integer.valueOf(i));
        contentvalues.put("name", s);
        contentvalues.put("number", Integer.valueOf(j));
        int k;
        String s1;
        if (flag)
            k = 1;
        else
            k = 0;
        contentvalues.put("enable", Integer.valueOf(k));
        s1 = (new StringBuilder()).append("_id=").append(cellbroadcastchannel.getKeyId()).toString();
        try
        {
            getContentResolver().update(mUri, contentvalues, s1, null);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        return true;
    }

    private void updateChannelUIList()
    {
        mChannelListPreference.removeAll();
        int i = mChannelArray.size();
        for (int j = 0; j < i; j++)
        {
            Preference preference = new Preference(this);
            int k = ((CellBroadcastChannel)mChannelArray.get(j)).getKeyId();
            String s = ((CellBroadcastChannel)mChannelArray.get(j)).getChannelName();
            int l = ((CellBroadcastChannel)mChannelArray.get(j)).getChannelId();
            boolean flag = ((CellBroadcastChannel)mChannelArray.get(j)).getChannelState();
            preference.setTitle((new StringBuilder()).append(s).append("(").append(String.valueOf(l)).append(")").toString());
            final CellBroadcastChannel oldChannel = new CellBroadcastChannel(k, l, s, flag);
            if (flag)
                preference.setSummary(0x7f0d01e6);
            else
                preference.setSummary(0x7f0d01e7);
            preference.setOnPreferenceClickListener(new android.preference.Preference.OnPreferenceClickListener() {

                final CellBroadcastSettings this$0;
                final CellBroadcastChannel val$oldChannel;

                public boolean onPreferenceClick(Preference preference1)
                {
                    showEditChannelDialog(oldChannel);
                    return false;
                }

            
            {
                this$0 = CellBroadcastSettings.this;
                oldChannel = cellbroadcastchannel;
                super();
            }
            }
);
            mChannelListPreference.addPreference(preference);
        }

    }

    private void updateChannelsWithSingleConfig(SmsBroadcastConfigInfo smsbroadcastconfiginfo)
    {
        int i = smsbroadcastconfiginfo.getFromServiceId();
        int j = smsbroadcastconfiginfo.getToServiceId();
        boolean flag = smsbroadcastconfiginfo.isSelected();
        Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("updateChannelsWithSingleConfig STATE = ").append(flag).toString());
        if (i != -1)
        {
            for (int k = i; k <= j; k++)
            {
                String s = String.valueOf(k);
                CellBroadcastChannel cellbroadcastchannel = getChannelObjectFromKey(s);
                if (cellbroadcastchannel != null)
                {
                    cellbroadcastchannel.setChannelState(flag);
                    continue;
                }
                CellBroadcastChannel cellbroadcastchannel1 = new CellBroadcastChannel(k, (new StringBuilder()).append(getString(0x7f0d00de)).append(s).toString(), flag);
                if (!insertChannelToDatabase(cellbroadcastchannel1))
                    showUpdateDBErrorInfoDialog();
                mChannelArray.add(cellbroadcastchannel1);
                mChannelMap.put(s, cellbroadcastchannel1);
            }

        }
    }

    private void updateCurrentChannelAndLanguage(ArrayList arraylist)
    {
        if (arraylist != null && arraylist.size() != 0)
        {
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
            {
                SmsBroadcastConfigInfo smsbroadcastconfiginfo = (SmsBroadcastConfigInfo)arraylist.get(j);
                updateLanguagesWithSingleConfig(smsbroadcastconfiginfo);
                dumpConfigInfo(smsbroadcastconfiginfo);
                updateChannelsWithSingleConfig(smsbroadcastconfiginfo);
            }

        }
    }

    private void updateLanguageSummary()
    {
        boolean aflag[] = new boolean[22];
        int i = aflag.length;
        for (int j = 1; j < i; j++)
            aflag[j] = ((CellBroadcastLanguage)mLanguageList.get(j)).getLanguageState();

        setLanguageSummary(aflag);
    }

    private void updateLanguagesWithSingleConfig(SmsBroadcastConfigInfo smsbroadcastconfiginfo)
    {
        int i = smsbroadcastconfiginfo.getFromCodeScheme();
        int j = smsbroadcastconfiginfo.getToCodeScheme();
        if (i != -1 && i != -2)
        {
            for (int l = i; l <= j; l++)
            {
                CellBroadcastLanguage cellbroadcastlanguage1 = getLanguageObjectFromKey(String.valueOf(l));
                if (cellbroadcastlanguage1 != null)
                    cellbroadcastlanguage1.setLanguageState(smsbroadcastconfiginfo.isSelected());
            }

        } else
        {
            Xlog.d("Settings/CellBroadcastSettings", "Select all language!");
            if (i == -2 && j == -2)
            {
                for (int k = 0; k < mLanguageList.size(); k++)
                {
                    CellBroadcastLanguage cellbroadcastlanguage = getLanguageObjectFromKey(String.valueOf(((CellBroadcastLanguage)mLanguageList.get(k)).getLanguageId()));
                    if (cellbroadcastlanguage != null)
                        cellbroadcastlanguage.setLanguageState(true);
                }

            }
        }
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
        int i = -3 + ((android.widget.AdapterView.AdapterContextMenuInfo)menuitem.getMenuInfo()).position;
        CellBroadcastChannel cellbroadcastchannel = (CellBroadcastChannel)mChannelArray.get(i);
        switch (menuitem.getItemId())
        {
        default:
            break;

        case 12: // '\f'
            cellbroadcastchannel.setChannelState(false);
            SmsBroadcastConfigInfo asmsbroadcastconfiginfo1[] = makeChannelConfigArray(cellbroadcastchannel);
            if (deleteChannelFromDatabase(cellbroadcastchannel))
                setCellBroadcastConfig(asmsbroadcastconfiginfo1);
            else
                showUpdateDBErrorInfoDialog();
            break;

        case 11: // '\013'
            showEditChannelDialog(cellbroadcastchannel);
            break;

        case 10: // '\n'
            new CellBroadcastChannel();
            boolean flag;
            if (!cellbroadcastchannel.getChannelState())
                flag = true;
            else
                flag = false;
            cellbroadcastchannel.setChannelState(flag);
            int j = cellbroadcastchannel.getChannelId();
            SmsBroadcastConfigInfo asmsbroadcastconfiginfo[] = new SmsBroadcastConfigInfo[1];
            asmsbroadcastconfiginfo[0] = new SmsBroadcastConfigInfo(j, j, -1, -1, cellbroadcastchannel.getChannelState());
            if (updateChannelToDatabase(cellbroadcastchannel, cellbroadcastchannel))
                setCellBroadcastConfig(asmsbroadcastconfiginfo);
            else
                showUpdateDBErrorInfoDialog();
            break;
        }
        return super.onContextItemSelected(menuitem);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (CallSettings.isMultipleSim())
        {
            mSimId = getIntent().getIntExtra("simId", -1);
            switch (mSimId)
            {
            case 3: // '\003'
                mUri = CHANNEL_URI3;
                break;

            case 2: // '\002'
                mUri = CHANNEL_URI2;
                break;

            case 1: // '\001'
                mUri = CHANNEL_URI1;
                break;

            case 0: // '\0'
                mUri = CHANNEL_URI;
                break;

            default:
                Xlog.d("Settings/CellBroadcastSettings", (new StringBuilder()).append("error no sim id matched with mSimId = ").append(mSimId).toString());
                break;
            }
        }
        Xlog.d("CellBroadcastSetting", (new StringBuilder()).append("Sim Id : ").append(mSimId).toString());
        mPhone = PhoneGlobals.getPhone();
        addPreferencesFromResource(0x7f06000b);
        initPreference();
        initLanguage();
        registerForContextMenu(getListView());
        IntentFilter intentfilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, intentfilter);
    }

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
    {
        super.onCreateContextMenu(contextmenu, view, contextmenuinfo);
        android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo;
        if (adaptercontextmenuinfo == null)
        {
            Xlog.i("Settings/CellBroadcastSettings", "onCreateContextMenu,menuInfo is null");
        } else
        {
            int i = adaptercontextmenuinfo.position;
            if (i >= 3)
            {
                int j = i - 3;
                CellBroadcastChannel cellbroadcastchannel = (CellBroadcastChannel)mChannelArray.get(j);
                contextmenu.setHeaderTitle(cellbroadcastchannel.getChannelName());
                if (cellbroadcastchannel.getChannelState())
                    contextmenu.add(0, 10, 0, 0x7f0d01e7);
                else
                    contextmenu.add(0, 10, 0, 0x7f0d01e6);
                contextmenu.add(1, 11, 0, 0x7f0d00d7);
                contextmenu.add(2, 12, 0, 0x7f0d00d8);
                return;
            }
        }
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (preference.equals(mLanguagePreference))
        {
            showLanguageSelectDialog();
            return true;
        }
        if (preference.equals(mAddChannelPreference))
        {
            showAddChannelDialog();
            return true;
        } else
        {
            return false;
        }
    }

    public void onResume()
    {
        super.onResume();
        getCellBroadcastConfig(true);
    }


























}
