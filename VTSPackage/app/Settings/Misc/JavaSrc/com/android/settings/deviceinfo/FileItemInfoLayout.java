// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.Context;
import android.os.UserHandle;
import android.util.AttributeSet;
import android.widget.*;
import java.io.File;

public class FileItemInfoLayout extends RelativeLayout
    implements Checkable
{

    private static final int sLengthExternalStorageDirPrefix = 1 + (new android.os.Environment.UserEnvironment(UserHandle.myUserId())).getExternalStorageDirectory().getAbsolutePath().length();
    private CheckBox mCheckbox;
    private TextView mFileNameView;
    private TextView mFileSizeView;

    public FileItemInfoLayout(Context context)
    {
        this(context, null);
    }

    public FileItemInfoLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public FileItemInfoLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    public CheckBox getCheckBox()
    {
        return mCheckbox;
    }

    public boolean isChecked()
    {
        return mCheckbox.isChecked();
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mFileNameView = (TextView)findViewById(0x7f08016d);
        mFileSizeView = (TextView)findViewById(0x7f08016e);
        mCheckbox = (CheckBox)findViewById(0x7f08016c);
    }

    public void setChecked(boolean flag)
    {
        mCheckbox.setChecked(flag);
    }

    public void setFileName(String s)
    {
        mFileNameView.setText(s.substring(sLengthExternalStorageDirPrefix));
    }

    public void setFileSize(String s)
    {
        mFileSizeView.setText(s);
    }

    public void toggle()
    {
        boolean flag;
        if (!mCheckbox.isChecked())
            flag = true;
        else
            flag = false;
        setChecked(flag);
    }

}
