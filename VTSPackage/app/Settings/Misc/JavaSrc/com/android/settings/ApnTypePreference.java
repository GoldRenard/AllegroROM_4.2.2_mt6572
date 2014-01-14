// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.AlertDialog;
import android.content.*;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.widget.ListView;
import com.mediatek.settings.ext.IApnEditorExt;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            Utils

public class ApnTypePreference extends DialogPreference
    implements android.content.DialogInterface.OnMultiChoiceClickListener
{

    private static final String TAG = "ApnTypePreference";
    private String mApnTypeArray[];
    private int mApnTypeNum;
    private boolean mCheckState[];
    IApnEditorExt mExt;
    private ListView mListView;
    private String mTypeString;
    private boolean mUiCheckState[];

    public ApnTypePreference(Context context)
    {
        this(context, null);
    }

    public ApnTypePreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mExt = Utils.getApnEditorPlugin(context);
        mApnTypeArray = mExt.getApnTypeArray(getContext(), 0x7f070068, 0x7f070067, 0x7f070066);
        if (mApnTypeArray != null)
            mApnTypeNum = mApnTypeArray.length;
        mCheckState = new boolean[mApnTypeNum];
    }

    private void updateRecord()
    {
        if (mListView != null)
        {
            StringBuilder stringbuilder = new StringBuilder("");
            for (int i = 0; i < mApnTypeNum; i++)
                if (mCheckState[i])
                    stringbuilder.append(mApnTypeArray[i]).append(',');

            int j = stringbuilder.length();
            if (j > 1)
                mTypeString = stringbuilder.substring(0, j - 1);
            else
                mTypeString = "";
            Xlog.i("ApnTypePreference", (new StringBuilder()).append("mTypeString is ").append(mTypeString).toString());
        }
    }

    private void updateUiCheckBoxStatus()
    {
        for (int i = 0; i < mApnTypeNum; i++)
        {
            mCheckState[i] = mUiCheckState[i];
            Xlog.i("ApnTypePreference", (new StringBuilder()).append("updateUiCheckBoxStatus mCheckState[").append(i).append("]=").append(mCheckState[i]).toString());
        }

    }

    public String getTypeString()
    {
        return mTypeString;
    }

    public void intCheckState(String s)
    {
        Xlog.d("ApnTypePreference", (new StringBuilder()).append("init CheckState: ").append(s).toString());
        if (s != null)
        {
            mTypeString = s;
            for (int i = 0; i < mApnTypeNum; i++)
                mCheckState[i] = s.contains(mApnTypeArray[i]);

        }
    }

    public void onClick(DialogInterface dialoginterface, int i, boolean flag)
    {
        mCheckState[i] = flag;
        mUiCheckState[i] = flag;
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (flag)
        {
            updateUiCheckBoxStatus();
            updateRecord();
            callChangeListener(mTypeString);
            return;
        } else
        {
            intCheckState(mTypeString);
            return;
        }
    }

    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder)
    {
        super.onPrepareDialogBuilder(builder);
        builder.setMultiChoiceItems(mApnTypeArray, mCheckState, this);
        mListView = builder.create().getListView();
        mUiCheckState = new boolean[mApnTypeNum];
        for (int i = 0; i < mApnTypeNum; i++)
        {
            mUiCheckState[i] = mCheckState[i];
            Xlog.i("ApnTypePreference", (new StringBuilder()).append("onPrepareDialogBuilder mUiCheckState[").append(i).append("]=").append(mUiCheckState[i]).toString());
        }

    }

    public void setType(String s, String s1, Intent intent)
    {
        boolean flag = "tethering".equals(intent.getStringExtra("apn_type"));
        String s2 = (new StringBuilder()).append(s).append(s1).toString();
        mApnTypeArray = mExt.getApnTypeArrayByCard(getContext(), s2, flag, 0x7f07007b, 0x7f070067, 0x7f070066, mApnTypeArray);
        if (mApnTypeArray != null)
            mApnTypeNum = mApnTypeArray.length;
        mCheckState = new boolean[mApnTypeNum];
    }
}
