// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.preference.EditTextPreference;
import android.text.Editable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.EditText;

public class SelectableEditTextPreference extends EditTextPreference
{

    public static final int SELECTION_CURSOR_END = 0;
    public static final int SELECTION_CURSOR_START = 1;
    public static final int SELECTION_SELECT_ALL = 2;
    private int mSelectionMode;

    public SelectableEditTextPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
        EditText edittext = getEditText();
        int i;
        if (edittext.getText() != null)
            i = edittext.getText().length();
        else
            i = 0;
        if (!TextUtils.isEmpty(edittext.getText()))
            switch (mSelectionMode)
            {
            case 2: // '\002'
                edittext.setSelection(0, i);
                return;

            case 1: // '\001'
                edittext.setSelection(0);
                return;

            case 0: // '\0'
                edittext.setSelection(i);
                return;
            }
    }

    public void setInitialSelectionMode(int i)
    {
        mSelectionMode = i;
    }
}
