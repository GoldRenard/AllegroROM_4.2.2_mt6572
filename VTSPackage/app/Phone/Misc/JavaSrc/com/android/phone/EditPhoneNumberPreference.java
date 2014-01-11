// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Activity;
import android.app.Dialog;
import android.content.*;
import android.content.res.TypedArray;
import android.preference.EditTextPreference;
import android.telephony.PhoneNumberUtils;
import android.text.InputFilter;
import android.text.TextUtils;
import android.text.method.ArrowKeyMovementMethod;
import android.text.method.DialerKeyListener;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.*;

public class EditPhoneNumberPreference extends EditTextPreference
{
    public static interface GetDefaultNumberListener
    {

        public abstract String onGetDefaultNumber(EditPhoneNumberPreference editphonenumberpreference);
    }

    public static interface OnDialogClosedListener
    {

        public abstract void onDialogClosed(EditPhoneNumberPreference editphonenumberpreference, int i);
    }


    private static final int CM_ACTIVATION = 1;
    private static final int CM_CONFIRM = 0;
    private static final String TAG = "EditPhoneNumberPreference";
    private static final String VALUE_OFF = "0";
    private static final String VALUE_ON = "1";
    private static final String VALUE_SEPARATOR = ":";
    private int mButtonClicked;
    private CharSequence mChangeNumberText;
    private boolean mChecked;
    private int mConfirmationMode;
    private Intent mContactListIntent;
    private ImageButton mContactPickButton;
    private android.view.View.OnFocusChangeListener mDialogFocusChangeListener;
    private OnDialogClosedListener mDialogOnClosedListener;
    private CharSequence mDisableText;
    private CharSequence mEnableText;
    private String mEncodedText;
    private GetDefaultNumberListener mGetDefaultNumberListener;
    private Activity mParentActivity;
    private String mPhoneNumber;
    private int mPrefId;
    private CharSequence mSummaryOff;
    private CharSequence mSummaryOn;

    public EditPhoneNumberPreference(Context context)
    {
        this(context, null);
    }

    public EditPhoneNumberPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mEncodedText = null;
        setDialogLayoutResource(0x7f040030);
        mContactListIntent = new Intent("android.intent.action.GET_CONTENT");
        mContactListIntent.setType("vnd.android.cursor.item/phone_v2");
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, R.styleable.EditPhoneNumberPreference, 0, 0x7f0f000b);
        mEnableText = typedarray.getString(0);
        mDisableText = typedarray.getString(1);
        mChangeNumberText = typedarray.getString(2);
        mConfirmationMode = typedarray.getInt(3, 0);
        typedarray.recycle();
        TypedArray typedarray1 = context.obtainStyledAttributes(attributeset, android.R.styleable.CheckBoxPreference, 0, 0);
        mSummaryOn = typedarray1.getString(0);
        mSummaryOff = typedarray1.getString(1);
        typedarray1.recycle();
    }

    public String getPhoneNumber()
    {
        return PhoneNumberUtils.stripSeparators(mPhoneNumber);
    }

    protected String getRawPhoneNumber()
    {
        return mPhoneNumber;
    }

    protected String getStringValue()
    {
        StringBuilder stringbuilder = new StringBuilder();
        String s;
        if (isToggled())
            s = "1";
        else
            s = "0";
        return stringbuilder.append(s).append(":").append(getPhoneNumber()).toString();
    }

    public CharSequence getSummaryOff()
    {
        return mSummaryOff;
    }

    public CharSequence getSummaryOn()
    {
        return mSummaryOn;
    }

    public boolean isToggled()
    {
        return mChecked;
    }

    protected void onAddEditTextToDialogView(View view, EditText edittext)
    {
        ViewGroup viewgroup = (ViewGroup)view.findViewById(0x7f080010);
        if (viewgroup != null)
        {
            if (edittext != null)
            {
                InputFilter ainputfilter[] = new InputFilter[1];
                ainputfilter[0] = new android.text.InputFilter.LengthFilter(100);
                edittext.setFilters(ainputfilter);
            }
            viewgroup.addView(edittext, -1, -2);
        }
    }

    protected void onBindDialogView(View view)
    {
        mButtonClicked = -2;
        super.onBindDialogView(view);
        EditText edittext = getEditText();
        mContactPickButton = (ImageButton)view.findViewById(0x7f080012);
        if (edittext != null)
        {
            if (mGetDefaultNumberListener != null)
            {
                String s = mGetDefaultNumberListener.onGetDefaultNumber(this);
                if (s != null)
                    mPhoneNumber = s;
            }
            edittext.setText(mPhoneNumber);
            edittext.setMovementMethod(ArrowKeyMovementMethod.getInstance());
            edittext.setKeyListener(DialerKeyListener.getInstance());
            edittext.setOnFocusChangeListener(mDialogFocusChangeListener);
        }
        if (mContactPickButton != null)
            mContactPickButton.setOnClickListener(new android.view.View.OnClickListener() {

                final EditPhoneNumberPreference this$0;

                public void onClick(View view1)
                {
                    if (mParentActivity == null)
                        break MISSING_BLOCK_LABEL_34;
                    mParentActivity.startActivityForResult(mContactListIntent, mPrefId);
                    return;
                    ActivityNotFoundException activitynotfoundexception;
                    activitynotfoundexception;
                    Log.d("EditPhoneNumberPreference", activitynotfoundexception.toString());
                    return;
                }

            
            {
                this$0 = EditPhoneNumberPreference.this;
                super();
            }
            }
);
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        TextView textview = (TextView)view.findViewById(0x1020010);
        if (textview != null)
        {
            CharSequence charsequence;
            if (mConfirmationMode == 1)
            {
                if (mChecked)
                {
                    if (mSummaryOn == null)
                        charsequence = getSummary();
                    else
                        charsequence = mSummaryOn;
                } else
                if (mSummaryOff == null)
                    charsequence = getSummary();
                else
                    charsequence = mSummaryOff;
            } else
            {
                charsequence = getSummary();
            }
            byte byte0;
            if (charsequence != null)
            {
                textview.setText(charsequence);
                byte0 = 0;
            } else
            {
                byte0 = 8;
            }
            if (byte0 != textview.getVisibility())
                textview.setVisibility(byte0);
        }
    }

    protected void onClick()
    {
        super.onClick();
        Dialog dialog = getDialog();
        if (dialog != null)
        {
            Window window = dialog.getWindow();
            if (window != null)
                window.setSoftInputMode(37);
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        boolean flag = true;
        if (mConfirmationMode == flag && i == -3)
        {
            if (isToggled())
                flag = false;
            setToggled(flag);
        }
        mButtonClicked = i;
        super.onClick(dialoginterface, i);
    }

    protected void onDialogClosed(boolean flag)
    {
        if (mButtonClicked != -1 && mButtonClicked != -3)
        {
            super.onDialogClosed(flag);
        } else
        {
            setPhoneNumber(getEditText().getText().toString());
            super.onDialogClosed(flag);
            setText(getStringValue());
        }
        if (mDialogOnClosedListener != null)
            mDialogOnClosedListener.onDialogClosed(this, mButtonClicked);
    }

    public void onPickActivityResult(String s)
    {
        EditText edittext = getEditText();
        if (edittext != null)
            edittext.setText(s);
    }

    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder)
    {
        if (mConfirmationMode == 1)
            if (mChecked)
            {
                builder.setPositiveButton(mChangeNumberText, this);
                builder.setNeutralButton(mDisableText, this);
            } else
            {
                builder.setPositiveButton(null, null);
                builder.setNeutralButton(mEnableText, this);
            }
        builder.setIcon(0x7f030001);
    }

    protected void onSetInitialValue(boolean flag, Object obj)
    {
        String s;
        if (flag)
            s = getPersistedString(getStringValue());
        else
            s = (String)obj;
        setValueFromString(s);
    }

    protected boolean persistString(String s)
    {
        mEncodedText = s;
        return super.persistString(s);
    }

    public void setDialogOnClosedListener(OnDialogClosedListener ondialogclosedlistener)
    {
        mDialogOnClosedListener = ondialogclosedlistener;
    }

    public void setDialogOnFocusChangeListener(android.view.View.OnFocusChangeListener onfocuschangelistener)
    {
        mDialogFocusChangeListener = onfocuschangelistener;
    }

    public void setParentActivity(Activity activity, int i)
    {
        mParentActivity = activity;
        mPrefId = i;
        mGetDefaultNumberListener = null;
    }

    public void setParentActivity(Activity activity, int i, GetDefaultNumberListener getdefaultnumberlistener)
    {
        mParentActivity = activity;
        mPrefId = i;
        mGetDefaultNumberListener = getdefaultnumberlistener;
    }

    public EditPhoneNumberPreference setPhoneNumber(String s)
    {
        mPhoneNumber = s;
        setText(getStringValue());
        notifyChanged();
        return this;
    }

    public EditPhoneNumberPreference setSummaryOff(int i)
    {
        return setSummaryOff(((CharSequence) (getContext().getString(i))));
    }

    public EditPhoneNumberPreference setSummaryOff(CharSequence charsequence)
    {
        mSummaryOff = charsequence;
        if (!isToggled())
            notifyChanged();
        return this;
    }

    public EditPhoneNumberPreference setSummaryOn(int i)
    {
        return setSummaryOn(((CharSequence) (getContext().getString(i))));
    }

    public EditPhoneNumberPreference setSummaryOn(CharSequence charsequence)
    {
        mSummaryOn = charsequence;
        if (isToggled())
            notifyChanged();
        return this;
    }

    public EditPhoneNumberPreference setToggled(boolean flag)
    {
        mChecked = flag;
        setText(getStringValue());
        notifyChanged();
        return this;
    }

    protected void setValueFromString(String s)
    {
        String as[] = s.split(":", 2);
        setToggled(as[0].equals("1"));
        setPhoneNumber(as[1]);
    }

    public boolean shouldDisableDependents()
    {
        if (mConfirmationMode == 1 && mEncodedText != null)
            return mEncodedText.split(":", 2)[0].equals("1");
        return TextUtils.isEmpty(mPhoneNumber) && mConfirmationMode == 0;
    }

    public void showPhoneNumberDialog()
    {
        showDialog(null);
    }



}
