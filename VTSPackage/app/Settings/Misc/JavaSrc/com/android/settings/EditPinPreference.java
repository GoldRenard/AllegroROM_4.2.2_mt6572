// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import com.mediatek.xlog.Xlog;

class EditPinPreference extends EditTextPreference
{
    static interface OnPinEnteredListener
    {

        public abstract void onPinEntered(EditPinPreference editpinpreference, boolean flag);
    }


    private static final int MAXPINNUM = 8;
    private static final int MINPINNUM = 4;
    private static final String TAG = "EditTextPreference";
    private AlertDialog mAlertDialog;
    private OnPinEnteredListener mPinListener;

    public EditPinPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public EditPinPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    public boolean isDialogOpen()
    {
        Dialog dialog = getDialog();
        return dialog != null && dialog.isShowing();
    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
        EditText edittext = getEditText();
        if (edittext != null)
        {
            edittext.setSingleLine(true);
            edittext.setInputType(18);
            Xlog.d("EditTextPreference", "add deal with orientation change");
            edittext.addTextChangedListener(new TextWatcher() {

                final EditPinPreference this$0;

                public void afterTextChanged(Editable editable)
                {
label0:
                    {
                        if (mAlertDialog != null)
                        {
                            if (editable.length() < 4 || editable.length() > 8)
                                break label0;
                            mAlertDialog.getButton(-1).setEnabled(true);
                        }
                        return;
                    }
                    mAlertDialog.getButton(-1).setEnabled(false);
                }

                public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                }

                public void onTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                }

            
            {
                this$0 = EditPinPreference.this;
                super();
            }
            }
);
        }
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (mPinListener != null)
            mPinListener.onPinEntered(this, flag);
    }

    public void setOnPinEnteredListener(OnPinEnteredListener onpinenteredlistener)
    {
        mPinListener = onpinenteredlistener;
    }

    protected void showDialog(Bundle bundle)
    {
label0:
        {
            super.showDialog(bundle);
            Dialog dialog = getDialog();
            if (dialog != null)
            {
                Xlog.d("EditTextPreference", "showDialog");
                mAlertDialog = (AlertDialog)dialog;
                EditText edittext = (EditText)mAlertDialog.findViewById(0x1020003);
                if (edittext != null)
                {
                    int i = edittext.getText().toString().length();
                    Xlog.d("EditTextPreference", (new StringBuilder()).append("editText=").append(edittext.getText().toString()).append(" length of text=").append(i).toString());
                    if (i < 4 || i > 8)
                        break label0;
                    mAlertDialog.getButton(-1).setEnabled(true);
                }
            }
            return;
        }
        mAlertDialog.getButton(-1).setEnabled(false);
    }

    public void showPinDialog()
    {
        Dialog dialog = getDialog();
        if (dialog == null || !dialog.isShowing())
            showDialog(null);
    }

}
