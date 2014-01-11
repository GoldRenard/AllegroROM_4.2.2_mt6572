// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.preference.EditTextPreference;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;
import com.android.internal.telephony.IccCard;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.settings.CallBarringChangePassword;
import com.mediatek.xlog.Xlog;

public class EditPinPreference extends EditTextPreference
{
    public static interface OnPinEnteredListener
    {

        public abstract void onPinEntered(EditPinPreference editpinpreference, boolean flag);
    }


    public static final int FDN_MODE_FLAG = 10;
    private static final String LOG_TAG = "Settings/EditPinPreference";
    private int mMode;
    private Phone mPhone;
    private OnPinEnteredListener mPinListener;
    private boolean mShouldHideButtons;
    private int mSimId;

    public EditPinPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    public EditPinPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
    }

    private void handleFdnModeClick()
    {
        Xlog.i("Settings/EditPinPreference", "Enable or Disable the FDN state button is clicked");
        boolean flag = ((GeminiPhone)mPhone).getIccCardGemini(mSimId).isPhbReady();
        Xlog.i("Settings/EditPinPreference", (new StringBuilder()).append("Phone book state from system is :").append(flag).toString());
        if (!flag)
        {
            Context context = getContext();
            showTipDialog(context.getString(0x7f0d00cc), context.getString(0x7f0d0086));
            return;
        } else
        {
            showDialog(null);
            return;
        }
    }

    public void initFdnModeData(Phone phone, int i, int j)
    {
        mPhone = phone;
        mMode = i;
        mSimId = j;
    }

    protected void onBindDialogView(View view)
    {
        super.onBindDialogView(view);
        boolean flag;
        if (view.findViewById(0x1020003) == null)
            flag = true;
        else
            flag = false;
        mShouldHideButtons = flag;
    }

    protected void onClick()
    {
        if (getDialog() != null)
            return;
        switch (mMode)
        {
        case 10: // '\n'
            Xlog.i("Settings/EditPinPreference", "onClick, FDN_MODE_FLAG");
            handleFdnModeClick();
            return;
        }
        showDialog(null);
    }

    protected View onCreateDialogView()
    {
        setDialogLayoutResource(0x7f040031);
        View view = super.onCreateDialogView();
        EditText edittext = getEditText();
        edittext.setInputType(18);
        if (this instanceof CallBarringChangePassword)
        {
            InputFilter ainputfilter[] = new InputFilter[1];
            ainputfilter[0] = new android.text.InputFilter.LengthFilter(4);
            edittext.setFilters(ainputfilter);
        }
        return view;
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (mPinListener != null)
            mPinListener.onPinEntered(this, flag);
    }

    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder)
    {
        super.onPrepareDialogBuilder(builder);
        if (mShouldHideButtons)
        {
            builder.setPositiveButton(null, this);
            builder.setNegativeButton(null, this);
        }
    }

    public void setOnPinEnteredListener(OnPinEnteredListener onpinenteredlistener)
    {
        mPinListener = onpinenteredlistener;
    }

    public void showPinDialog()
    {
        showDialog(null);
    }

    public void showTipDialog(String s, String s1)
    {
        Toast.makeText(getContext(), s1, 1).show();
    }
}
