// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import android.content.Context;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.mediatek.calloption.InternationalDialogHandler;

// Referenced classes of package com.mediatek.phone.calloption:
//            PhoneInternationalCountrySelectDialogHandler

public class PhoneInternationalDialogHandler extends InternationalDialogHandler
{

    private static final String TAG = "PhoneInternationalDialogHandler";

    public PhoneInternationalDialogHandler(Context context, int i, int j, com.mediatek.calloption.InternationalDialogHandler.PrefixInfo prefixinfo)
    {
        super(context, i, j, prefixinfo);
        super.mCountrySelectDialogHandler = new PhoneInternationalCountrySelectDialogHandler(super.mContext, this);
    }

    private static void log(String s)
    {
        Log.d("PhoneInternationalDialogHandler", s);
    }

    protected View createAreaInputSingleSelectDialogItems()
    {
        Context context = super.mContext;
        Object aobj[] = new Object[1];
        aobj[0] = super.mPrefixInfo.mCountryName;
        String s = context.getString(0x7f0d0129, aobj);
        String s1 = super.mContext.getString(0x7f0d012c);
        String s2 = super.mContext.getString(0x7f0d0135);
        String s3 = super.mContext.getString(0x7f0d0130);
        String s4 = (new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(" (").append(super.mContext.getString(0x7f0d0133)).append(") ").append(super.mPrefixInfo.mNumberOrigin).toString();
        String s5 = super.mContext.getString(0x7f0d0131);
        String s6 = PhoneNumberUtils.formatNumber(super.mPrefixInfo.mNumberOrigin, super.mPrefixInfo.mCurrentCountryISO);
        if (TextUtils.isEmpty(s6))
            s6 = super.mPrefixInfo.mNumberOrigin;
        return createEditTextSingleSelectItems(s, s1, s2, s3, s4, s5, s6);
    }

    protected View createButtonEditTextItems(String s, String s1, String s2, String s3, boolean flag, String s4, String s5, 
            String s6, String s7)
    {
        super.mOriginSuggestNumber = s5;
        super.mTextAreaCode = s6;
        super.mTextInputCodeHere = s7;
        View view = ((LayoutInflater)super.mContext.getSystemService("layout_inflater")).inflate(0x7f040022, null);
        super.mDescriptionText = (TextView)view.findViewById(0x7f080098);
        super.mDescriptionText.setText(s);
        super.mCountrySelectButton = (Button)view.findViewById(0x7f080038);
        super.mCountrySelectButton.setText(s1);
        super.mCountrySelectButton.setOnClickListener(this);
        super.mAreaCodeDescription = (TextView)view.findViewById(0x7f080099);
        super.mAreaCodeDescription.setText(s2);
        super.mInputAreaEditText = (EditText)view.findViewById(0x7f08009a);
        super.mInputAreaEditText.setHint(s3);
        super.mInputAreaEditText.addTextChangedListener(this);
        if (flag)
        {
            super.mAreaCodeDescription.setVisibility(0);
            super.mInputAreaEditText.setVisibility(0);
        } else
        {
            super.mAreaCodeDescription.setVisibility(8);
            super.mInputAreaEditText.setVisibility(8);
        }
        super.mMessageYesText = (TextView)view.findViewById(0x7f08009b);
        super.mMessageYesText.setText(s4);
        super.mSuggestNumberText = (TextView)view.findViewById(0x7f08009c);
        super.mSuggestNumberText.setText(s5);
        return view;
    }

    protected View createCountryAreaSingleSelectDialogItems()
    {
        Context context = super.mContext;
        Object aobj[] = new Object[3];
        aobj[0] = super.mPrefixInfo.mAreaName;
        aobj[1] = super.mPrefixInfo.mCountryName;
        aobj[2] = (new StringBuilder()).append(super.mPrefixInfo.mCountryCode).append(" ").append(super.mPrefixInfo.mAreaCode).toString();
        String s = context.getString(0x7f0d0127, aobj);
        String s1 = super.mContext.getString(0x7f0d0130);
        String s2 = super.mContext.getString(0x7f0d0131);
        String s3 = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberSubscriber).toString(), super.mPrefixInfo.mSuggestCountryISO);
        if (TextUtils.isEmpty(s3))
            s3 = (new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberSubscriber).toString();
        String s4 = PhoneNumberUtils.formatNumber(super.mPrefixInfo.mNumberOrigin, super.mPrefixInfo.mCurrentCountryISO);
        if (TextUtils.isEmpty(s4))
            s4 = super.mPrefixInfo.mNumberOrigin;
        return createSingleSelectItems(s, s1, s3, s2, s4);
    }

    protected View createCountrySelectAreaInputDialogItems(int i)
    {
        String s;
        if (1 == i)
            s = super.mContext.getString(0x7f0d012f);
        else
            s = super.mContext.getString(0x7f0d0125);
        return createButtonEditTextItems(s, (new StringBuilder()).append(super.mPrefixInfo.mCountryName).append("(+").append(super.mPrefixInfo.mCountryCode).append(")").toString(), super.mContext.getString(0x7f0d012b), super.mContext.getString(0x7f0d012c), true, super.mContext.getString(0x7f0d012d), (new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(" (").append(super.mContext.getString(0x7f0d0133)).append(") ").append(super.mPrefixInfo.mNumberOrigin).toString(), super.mContext.getString(0x7f0d0133), super.mContext.getString(0x7f0d012c));
    }

    protected View createCountrySelectDefaultAreaInputDialogItems(int i)
    {
        String s;
        if (1 == i)
            s = super.mContext.getString(0x7f0d012f);
        else
            s = super.mContext.getString(0x7f0d0125);
        String s1 = (new StringBuilder()).append(super.mPrefixInfo.mCountryName).append(" (+").append(super.mPrefixInfo.mCountryCode).append(") ").toString();
        Context context = super.mContext;
        Object aobj[] = new Object[1];
        aobj[0] = super.mPrefixInfo.mAreaName;
        String s2 = context.getString(0x7f0d012e, aobj);
        String s3 = super.mPrefixInfo.mAreaCode;
        if (!TextUtils.isEmpty(super.mPrefixInfo.mAreaName))
            s3 = (new StringBuilder()).append(s3).append(" (").append(super.mPrefixInfo.mAreaName).append(") ").toString();
        String s4 = super.mContext.getString(0x7f0d012d);
        String s5 = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(" ").append(super.mPrefixInfo.mAreaCode).append(" ").append(super.mPrefixInfo.mNumberOrigin).toString(), super.mPrefixInfo.mSuggestCountryISO);
        if (TextUtils.isEmpty(s5))
            s5 = (new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberOrigin).toString();
        return createButtonEditTextItems(s, s1, s2, s3, true, s4, s5, super.mContext.getString(0x7f0d0133), super.mContext.getString(0x7f0d012c));
    }

    protected View createCountrySelectDialogItems(int i)
    {
        String s;
        if (1 == i)
            s = super.mContext.getString(0x7f0d012f);
        else
            s = super.mContext.getString(0x7f0d0125);
        String s1 = (new StringBuilder()).append(super.mPrefixInfo.mCountryName).append("(+").append(super.mPrefixInfo.mCountryCode).append(")").toString();
        String s2 = super.mContext.getString(0x7f0d012b);
        String s3 = super.mContext.getString(0x7f0d012c);
        String s4 = super.mContext.getString(0x7f0d012d);
        String s5 = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberSubscriber).toString(), super.mPrefixInfo.mSuggestCountryISO);
        if (TextUtils.isEmpty(s5))
            s5 = (new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberSubscriber).toString();
        return createButtonEditTextItems(s, s1, s2, s3, false, s4, s5, super.mContext.getString(0x7f0d0133), super.mContext.getString(0x7f0d012c));
    }

    protected View createCountrySingleSelectDialogItems()
    {
        Context context = super.mContext;
        Object aobj[] = new Object[2];
        aobj[0] = super.mPrefixInfo.mCountryName;
        aobj[1] = super.mPrefixInfo.mCountryCode;
        String s = context.getString(0x7f0d0126, aobj);
        String s1 = super.mContext.getString(0x7f0d0130);
        String s2 = super.mContext.getString(0x7f0d0131);
        String s3 = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberSubscriber).toString(), super.mPrefixInfo.mSuggestCountryISO);
        if (TextUtils.isEmpty(s3))
            s3 = (new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberSubscriber).toString();
        String s4 = PhoneNumberUtils.formatNumber(super.mPrefixInfo.mNumberOrigin, super.mPrefixInfo.mCurrentCountryISO);
        if (TextUtils.isEmpty(s4))
            s4 = super.mPrefixInfo.mNumberOrigin;
        return createSingleSelectItems(s, s1, s3, s2, s4);
    }

    protected View createDefaultAreaInputSingleSelectDialogItems()
    {
        Context context = super.mContext;
        Object aobj[] = new Object[2];
        aobj[0] = super.mPrefixInfo.mCountryName;
        aobj[1] = super.mPrefixInfo.mAreaName;
        String s = context.getString(0x7f0d012a, aobj);
        String s1 = super.mPrefixInfo.mAreaCode;
        if (!TextUtils.isEmpty(super.mPrefixInfo.mAreaName))
            s1 = (new StringBuilder()).append(s1).append(" (").append(super.mPrefixInfo.mAreaName).append(") ").toString();
        String s2 = super.mContext.getString(0x7f0d0135);
        String s3 = super.mContext.getString(0x7f0d0130);
        String s4 = PhoneNumberUtils.formatNumber((new StringBuilder()).append("+").append(super.mPrefixInfo.mCountryCode).append(super.mPrefixInfo.mAreaCode).append(super.mPrefixInfo.mNumberOrigin).toString(), super.mPrefixInfo.mSuggestCountryISO);
        String s5 = super.mContext.getString(0x7f0d0131);
        String s6 = PhoneNumberUtils.formatNumber(super.mPrefixInfo.mNumberOrigin, super.mPrefixInfo.mCurrentCountryISO);
        if (TextUtils.isEmpty(s6))
            s6 = super.mPrefixInfo.mNumberOrigin;
        return createEditTextSingleSelectItems(s, s1, s2, s3, s4, s5, s6);
    }

    protected View createEditTextSingleSelectItems(String s, String s1, String s2, String s3, String s4, String s5, String s6)
    {
        super.mOriginSuggestNumber = s4;
        View view = ((LayoutInflater)super.mContext.getSystemService("layout_inflater")).inflate(0x7f040023, null);
        super.mDescriptionText = (TextView)view.findViewById(0x7f080098);
        super.mDescriptionText.setText(s);
        super.mInputAreaEditText = (EditText)view.findViewById(0x7f08009a);
        super.mInputAreaEditText.setHint(s1);
        super.mInputAreaEditText.addTextChangedListener(this);
        super.mAreaCodeDescription = (TextView)view.findViewById(0x7f080099);
        super.mAreaCodeDescription.setText(s2);
        super.mSingleGroup1 = (ViewGroup)view.findViewById(0x7f08009d);
        super.mMessageYesText = (TextView)super.mSingleGroup1.findViewById(0x7f080098);
        super.mMessageYesText.setText(s3);
        super.mSuggestNumberText = (TextView)super.mSingleGroup1.findViewById(0x7f080099);
        super.mSuggestNumberText.setText(s4);
        super.mRadioButton1 = (RadioButton)super.mSingleGroup1.findViewById(0x7f0800a0);
        super.mRadioButton1.setChecked(true);
        super.mSingleGroup1.setOnClickListener(this);
        super.mSingleGroup2 = (ViewGroup)view.findViewById(0x7f08009e);
        super.mMessageNoText = (TextView)super.mSingleGroup2.findViewById(0x7f080098);
        super.mMessageNoText.setText(s5);
        super.mOriginNumberText = (TextView)super.mSingleGroup2.findViewById(0x7f080099);
        super.mOriginNumberText.setText(s6);
        super.mRadioButton2 = (RadioButton)super.mSingleGroup2.findViewById(0x7f0800a0);
        super.mSingleGroup2.setOnClickListener(this);
        return view;
    }

    protected View createPrefixConfirmDialogItems()
    {
        Context context = super.mContext;
        Object aobj[] = new Object[1];
        aobj[0] = super.mPrefixInfo.mCountryName;
        String s = context.getString(0x7f0d0128, aobj);
        String s1 = super.mContext.getString(0x7f0d0130);
        String s2 = super.mContext.getString(0x7f0d0131);
        String s3 = PhoneNumberUtils.formatNumber(super.mPrefixInfo.mNumberReplaceInterPrefix, super.mPrefixInfo.mSuggestCountryISO);
        if (TextUtils.isEmpty(s3))
            s3 = super.mPrefixInfo.mNumberReplaceInterPrefix;
        String s4 = PhoneNumberUtils.formatNumber(super.mPrefixInfo.mNumberOrigin, super.mPrefixInfo.mCurrentCountryISO);
        if (TextUtils.isEmpty(s4))
            s4 = super.mPrefixInfo.mNumberOrigin;
        return createSingleSelectItems(s, s1, s3, s2, s4);
    }

    protected View createSingleSelectItems(String s, String s1, String s2, String s3, String s4)
    {
        super.mOriginSuggestNumber = s2;
        View view = ((LayoutInflater)super.mContext.getSystemService("layout_inflater")).inflate(0x7f040024, null);
        super.mDescriptionText = (TextView)view.findViewById(0x7f08009f);
        super.mDescriptionText.setText(s);
        super.mSingleGroup1 = (ViewGroup)view.findViewById(0x7f08009d);
        super.mMessageYesText = (TextView)super.mSingleGroup1.findViewById(0x7f080098);
        super.mMessageYesText.setText(s1);
        super.mSuggestNumberText = (TextView)super.mSingleGroup1.findViewById(0x7f080099);
        super.mSuggestNumberText.setText(s2);
        super.mRadioButton1 = (RadioButton)super.mSingleGroup1.findViewById(0x7f0800a0);
        super.mRadioButton1.setChecked(true);
        super.mSingleGroup1.setOnClickListener(this);
        super.mSingleGroup2 = (ViewGroup)view.findViewById(0x7f08009e);
        super.mMessageNoText = (TextView)super.mSingleGroup2.findViewById(0x7f080098);
        super.mMessageNoText.setText(s3);
        super.mOriginNumberText = (TextView)super.mSingleGroup2.findViewById(0x7f080099);
        super.mOriginNumberText.setText(s4);
        super.mRadioButton2 = (RadioButton)super.mSingleGroup2.findViewById(0x7f0800a0);
        super.mSingleGroup2.setOnClickListener(this);
        return view;
    }
}
