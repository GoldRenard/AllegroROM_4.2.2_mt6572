// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.telephony.PhoneNumberUtils;
import android.text.*;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import com.mediatek.telephony.PhoneNumberUtilsEx;
import java.util.ArrayList;

// Referenced classes of package com.mediatek.calloption:
//            InternationalCountrySelectDialogHandler, CallOptionUtils

public abstract class InternationalDialogHandler
    implements android.view.View.OnClickListener, TextWatcher, android.content.DialogInterface.OnShowListener, InternationalCountrySelectDialogHandler.OnCountrySelectListener
{
    public static class PrefixInfo
    {

        public String mAreaCode;
        public String mAreaName;
        public String mCountryCode;
        public String mCountryName;
        public String mCurrentCountryISO;
        public boolean mIsAreaCodeNeeded;
        public String mNumberOrigin;
        public String mNumberReplaceInterPrefix;
        public String mNumberSubscriber;
        public String mPossibleAreaPrefix;
        public String mSuggestCountryISO;
        public ArrayList mValidCountryISOList;

        public String toString()
        {
            return (new StringBuilder()).append("mCountryCode = ").append(mCountryCode).append(", mCountryName = ").append(mCountryName).append(", mSuggestCountryISO = ").append(mSuggestCountryISO).append(", mCurrentCountryISO = ").append(mCurrentCountryISO).append(", mAreaCode = ").append(mAreaCode).append(", mAreaName = ").append(mAreaName).append(", mIsAreaCodeNeeded = ").append(mIsAreaCodeNeeded).append(", mNumberOrigin = ").append(mNumberOrigin).append(", mNumberReplaceInterPrefix = ").append(mNumberReplaceInterPrefix).append(", mNumberSubscriber = ").append(mNumberSubscriber).append(", mPossibleAreaPrefix = ").append(mPossibleAreaPrefix).toString();
        }

        public PrefixInfo(String s, String s1, String s2, String s3, String s4, String s5, boolean flag, 
                String s6, String s7, String s8, String s9, ArrayList arraylist)
        {
            mCountryCode = s;
            mCountryName = s1;
            mSuggestCountryISO = s2;
            mCurrentCountryISO = s3;
            mAreaCode = s4;
            mAreaName = s5;
            mIsAreaCodeNeeded = flag;
            mNumberOrigin = s6;
            mNumberReplaceInterPrefix = s7;
            mNumberSubscriber = s8;
            mPossibleAreaPrefix = s9;
            mValidCountryISOList = arraylist;
        }
    }


    public static final int DIALOG_TYPE_AREA_INPUT_SINGLE_SELECT = 6;
    public static final int DIALOG_TYPE_COUNTRY_AREA_SINGLE_SELECT = 1;
    public static final int DIALOG_TYPE_COUNTRY_SELECT = 3;
    public static final int DIALOG_TYPE_COUNTRY_SELECT_AREA_INPUT = 4;
    public static final int DIALOG_TYPE_COUNTRY_SELECT_DEFAULT_AREA_INPUT = 5;
    public static final int DIALOG_TYPE_COUNTRY_SINGLE_SELECT = 2;
    public static final int DIALOG_TYPE_DEFAULT_AREA_INPUT_SINGLE_SELECT = 7;
    public static final int DIALOG_TYPE_INTERNATIONAL_PREFIX_CONFIRM = 0;
    private static final String TAG = "InternationalDialogHandler";
    protected AlertDialog mAlertDialog;
    protected TextView mAreaCodeDescription;
    protected Context mContext;
    protected Button mCountrySelectButton;
    protected InternationalCountrySelectDialogHandler mCountrySelectDialogHandler;
    protected TextView mDescriptionText;
    protected EditText mInputAreaEditText;
    protected int mInternationalDialOption;
    protected TextView mMessageNoText;
    protected TextView mMessageYesText;
    protected TextView mOriginNumberText;
    protected String mOriginSuggestNumber;
    protected PrefixInfo mPrefixInfo;
    protected RadioButton mRadioButton1;
    protected RadioButton mRadioButton2;
    protected ViewGroup mSingleGroup1;
    protected ViewGroup mSingleGroup2;
    protected TextView mSuggestNumberText;
    protected String mTextAreaCode;
    protected String mTextInputCodeHere;
    protected int mType;

    public InternationalDialogHandler(Context context, int i, int j, PrefixInfo prefixinfo)
    {
        mContext = context;
        mType = i;
        mInternationalDialOption = j;
        mPrefixInfo = prefixinfo;
    }

    private static void log(String s)
    {
        Log.d("InternationalDialogHandler", s);
    }

    public void afterTextChanged(Editable editable)
    {
        if (TextUtils.isEmpty(editable))
        {
            log("afterTextChanged(), input is null");
            mSuggestNumberText.setText(mOriginSuggestNumber);
            if (4 == mType || 5 == mType || 6 == mType && mRadioButton1.isChecked())
            {
                Button button1 = mAlertDialog.getButton(-1);
                if (button1 != null)
                {
                    log("afterTextChanged(), disable button");
                    button1.setEnabled(false);
                }
            }
        } else
        {
            log("afterTextChanged(), input is NOT null");
            String s = editable.toString();
            log((new StringBuilder()).append("mPrefixInfo.mPossibleAreaPrefix = ").append(mPrefixInfo.mPossibleAreaPrefix).toString());
            log((new StringBuilder()).append("inputAreaCode = ").append(s).toString());
            if (!TextUtils.isEmpty(mPrefixInfo.mPossibleAreaPrefix) && s.startsWith(mPrefixInfo.mPossibleAreaPrefix))
                s = s.replaceFirst(mPrefixInfo.mPossibleAreaPrefix, "");
            String s1 = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(mPrefixInfo.mCountryCode).append(s).append(mPrefixInfo.mNumberSubscriber).toString(), mPrefixInfo.mSuggestCountryISO);
            if (TextUtils.isEmpty(s1))
                s1 = (new StringBuilder()).append("+").append(mPrefixInfo.mCountryCode).append(s).append(mPrefixInfo.mNumberSubscriber).toString();
            mSuggestNumberText.setText(s1);
            if (4 == mType || 5 == mType || 6 == mType)
            {
                Button button = mAlertDialog.getButton(-1);
                if (button != null)
                {
                    log("afterTextChanged(), enable button");
                    button.setEnabled(true);
                    return;
                }
            }
        }
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    protected abstract View createAreaInputSingleSelectDialogItems();

    protected abstract View createButtonEditTextItems(String s, String s1, String s2, String s3, boolean flag, String s4, String s5, 
            String s6, String s7);

    protected abstract View createCountryAreaSingleSelectDialogItems();

    protected abstract View createCountrySelectAreaInputDialogItems(int i);

    protected abstract View createCountrySelectDefaultAreaInputDialogItems(int i);

    protected abstract View createCountrySelectDialogItems(int i);

    protected abstract View createCountrySingleSelectDialogItems();

    protected abstract View createDefaultAreaInputSingleSelectDialogItems();

    public View createDialogView()
    {
        switch (mType)
        {
        case 7: // '\007'
            return createDefaultAreaInputSingleSelectDialogItems();

        case 6: // '\006'
            return createAreaInputSingleSelectDialogItems();

        case 5: // '\005'
            return createCountrySelectDefaultAreaInputDialogItems(mInternationalDialOption);

        case 4: // '\004'
            return createCountrySelectAreaInputDialogItems(mInternationalDialOption);

        case 3: // '\003'
            return createCountrySelectDialogItems(mInternationalDialOption);

        case 2: // '\002'
            return createCountrySingleSelectDialogItems();

        case 1: // '\001'
            return createCountryAreaSingleSelectDialogItems();

        case 0: // '\0'
            return createPrefixConfirmDialogItems();
        }
        return null;
    }

    protected abstract View createEditTextSingleSelectItems(String s, String s1, String s2, String s3, String s4, String s5, String s6);

    protected abstract View createPrefixConfirmDialogItems();

    protected abstract View createSingleSelectItems(String s, String s1, String s2, String s3, String s4);

    public String getCountryCode()
    {
        return mPrefixInfo.mCountryCode;
    }

    public String getSelectResult()
    {
        Object obj = "";
        switch (mType)
        {
        default:
            break;

        case 3: // '\003'
        case 4: // '\004'
        case 5: // '\005'
            obj = mSuggestNumberText.getText();
            break;

        case 0: // '\0'
        case 1: // '\001'
        case 2: // '\002'
        case 6: // '\006'
        case 7: // '\007'
            if (mRadioButton1.isChecked())
            {
                obj = mSuggestNumberText.getText();
                break;
            }
            if (mRadioButton2.isChecked())
                obj = mOriginNumberText.getText();
            break;
        }
        return obj.toString();
    }

    public void onClick(View view)
    {
        Button button;
label0:
        {
            if (view != mSingleGroup1 && view != mSingleGroup2)
            {
                if (view == mCountrySelectButton)
                {
                    mCountrySelectDialogHandler.showCountrySelectDialog(mPrefixInfo.mValidCountryISOList);
                    return;
                }
            } else
            {
                if (view == mSingleGroup1)
                {
                    mRadioButton1.setChecked(true);
                    mRadioButton2.setChecked(false);
                }
                if (view == mSingleGroup2)
                {
                    mRadioButton2.setChecked(true);
                    mRadioButton1.setChecked(false);
                }
                button = mAlertDialog.getButton(-1);
                if (button != null)
                {
                    if (6 != mType || !mRadioButton1.isChecked() || !TextUtils.isEmpty(mInputAreaEditText.getText()))
                        break label0;
                    log("onClick(), disable button");
                    button.setEnabled(false);
                }
            }
            return;
        }
        log("onClick(), enable button");
        button.setEnabled(true);
    }

    public void onCountrySelected(String s, String s1, String s2)
    {
        log((new StringBuilder()).append("onCountrySelected(), countryISO = ").append(s).append(", countryCode = ").append(s1).append(", countryName = ").append(s2).toString());
        mPrefixInfo.mSuggestCountryISO = s;
        mPrefixInfo.mCountryCode = s1;
        mPrefixInfo.mCountryName = s2;
        CallOptionUtils.NumberInfo numberinfo = CallOptionUtils.getNumberInfo(mPrefixInfo.mNumberOrigin, mPrefixInfo.mSuggestCountryISO);
        mPrefixInfo.mAreaCode = numberinfo.mAreaCode;
        mPrefixInfo.mNumberSubscriber = numberinfo.mSubscriber;
        mPrefixInfo.mPossibleAreaPrefix = numberinfo.mAreaCodePrefix;
        if (TextUtils.isEmpty(mPrefixInfo.mAreaCode))
        {
            if (CallOptionUtils.isValidNumberForCountryISO(mContext, mPrefixInfo.mNumberOrigin, mPrefixInfo.mSuggestCountryISO))
                mPrefixInfo.mIsAreaCodeNeeded = PhoneNumberUtilsEx.isAreaCodeNeeded(mPrefixInfo.mSuggestCountryISO, mPrefixInfo.mNumberOrigin);
        } else
        {
            mPrefixInfo.mIsAreaCodeNeeded = false;
        }
        log((new StringBuilder()).append("mPrefixInfo = ").append(mPrefixInfo).toString());
        if (mCountrySelectButton != null)
            mCountrySelectButton.setText((new StringBuilder()).append(mPrefixInfo.mCountryName).append("(+").append(mPrefixInfo.mCountryCode).append(")").toString());
        if (mPrefixInfo.mIsAreaCodeNeeded)
        {
            mAreaCodeDescription.setVisibility(0);
            mInputAreaEditText.setVisibility(0);
            String s4 = com.mediatek.phone.provider.CallHistory.Calls.getLatestAreaCode(mContext.getApplicationContext(), mPrefixInfo.mSuggestCountryISO);
            if (!TextUtils.isEmpty(s4))
            {
                mInputAreaEditText.setText("");
                mInputAreaEditText.setHint(s4);
                mOriginSuggestNumber = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(mPrefixInfo.mCountryCode).append(s4).append(" ").append(mPrefixInfo.mNumberOrigin).toString(), mPrefixInfo.mSuggestCountryISO);
                if (TextUtils.isEmpty(mOriginSuggestNumber))
                    mOriginSuggestNumber = (new StringBuilder()).append("+").append(mPrefixInfo.mCountryCode).append(s4).append(mPrefixInfo.mNumberOrigin).toString();
                mSuggestNumberText.setText(mOriginSuggestNumber);
                mType = 4;
                Button button2 = mAlertDialog.getButton(-1);
                if (button2 != null)
                {
                    log("onCountrySelected(), use latest area code, enable button");
                    button2.setEnabled(true);
                }
            } else
            {
                mInputAreaEditText.setText("");
                mInputAreaEditText.setHint(mTextInputCodeHere);
                mOriginSuggestNumber = (new StringBuilder()).append("+").append(mPrefixInfo.mCountryCode).append(" (").append(mTextAreaCode).append(")").append(mPrefixInfo.mNumberOrigin).toString();
                mSuggestNumberText.setText(mOriginSuggestNumber);
                mType = 5;
                Button button1 = mAlertDialog.getButton(-1);
                if (button1 != null)
                {
                    log("onCountrySelected(), no area code, disable button");
                    button1.setEnabled(false);
                    return;
                }
            }
        } else
        {
            String s3 = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(mPrefixInfo.mCountryCode).append(mPrefixInfo.mAreaCode).append(mPrefixInfo.mNumberSubscriber).toString(), mPrefixInfo.mSuggestCountryISO);
            if (TextUtils.isEmpty(s3))
                s3 = (new StringBuilder()).append("+").append(mPrefixInfo.mCountryCode).append(mPrefixInfo.mAreaCode).append(mPrefixInfo.mNumberSubscriber).toString();
            mSuggestNumberText.setText(s3);
            mAreaCodeDescription.setVisibility(8);
            mInputAreaEditText.setVisibility(8);
            mType = 3;
            Button button = mAlertDialog.getButton(-1);
            if (button != null)
            {
                log("onCountrySelected(), no need area code, enable button");
                button.setEnabled(true);
                return;
            }
        }
    }

    public void onHandledDialogDismiss()
    {
        if (mCountrySelectDialogHandler != null)
            mCountrySelectDialogHandler.dismissHandledDialog();
    }

    public void onShow(DialogInterface dialoginterface)
    {
        Button button = mAlertDialog.getButton(-1);
        if (button == null)
            return;
        if (4 != mType && (6 != mType || !mRadioButton1.isChecked()))
        {
            log("onShow(), enable button");
            button.setEnabled(true);
            return;
        } else
        {
            log("onShow(), disable button");
            button.setEnabled(false);
            return;
        }
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void setAlertDialog(AlertDialog alertdialog)
    {
        mAlertDialog = alertdialog;
    }
}
