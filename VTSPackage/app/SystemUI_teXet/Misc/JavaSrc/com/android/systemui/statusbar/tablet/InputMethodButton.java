// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.content.Context;
import android.os.IBinder;
import android.util.AttributeSet;
import android.view.inputmethod.*;
import android.widget.ImageView;
import java.util.List;

public class InputMethodButton extends ImageView
{

    private static final boolean DEBUG = false;
    private static final int ID_IME_BUTTON_VISIBILITY_ALWAYS_HIDE = 2;
    private static final int ID_IME_BUTTON_VISIBILITY_ALWAYS_SHOW = 1;
    private static final int ID_IME_BUTTON_VISIBILITY_AUTO = 0;
    private static final String TAG = "StatusBar/InputMethodButton";
    private static final String TAG_TRY_SUPPRESSING_IME_SWITCHER = "TrySuppressingImeSwitcher";
    private boolean mHardKeyboardAvailable;
    private ImageView mIcon;
    private final int mId = getId();
    private final InputMethodManager mImm;
    private boolean mScreenLocked;
    private boolean mShowButton;
    private IBinder mToken;

    public InputMethodButton(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mShowButton = false;
        mScreenLocked = false;
        mImm = (InputMethodManager)context.getSystemService("input_method");
    }

    private int loadInputMethodSelectorVisibility()
    {
        return android.provider.Settings.Secure.getInt(getContext().getContentResolver(), "input_method_selector_visibility", 0);
    }

    private boolean needsToShowIMEButton()
    {
        boolean flag = true;
        if (mShowButton && !mScreenLocked)
        {
            if (!mHardKeyboardAvailable)
                switch (loadInputMethodSelectorVisibility())
                {
                case 2: // '\002'
                    return false;

                case 0: // '\0'
                    return needsToShowIMEButtonWhenVisibilityAuto();

                default:
                    return false;

                case 1: // '\001'
                    break;
                }
        } else
        {
            flag = false;
        }
        return flag;
    }

    private boolean needsToShowIMEButtonWhenVisibilityAuto()
    {
        List list = mImm.getEnabledInputMethodList();
        int i = list.size();
        if (i > 2)
            return true;
        if (i < 1)
            return false;
        int j = 0;
        int k = 0;
        InputMethodSubtype inputmethodsubtype = null;
        InputMethodSubtype inputmethodsubtype1 = null;
        for (int l = 0; l < i; l++)
        {
            InputMethodInfo inputmethodinfo = (InputMethodInfo)list.get(l);
            List list1 = mImm.getEnabledInputMethodSubtypeList(inputmethodinfo, true);
            int i1 = list1.size();
            if (i1 == 0)
            {
                j++;
                continue;
            }
            for (int j1 = 0; j1 < i1; j1++)
            {
                InputMethodSubtype inputmethodsubtype2 = (InputMethodSubtype)list1.get(j1);
                if (!inputmethodsubtype2.isAuxiliary())
                {
                    j++;
                    inputmethodsubtype = inputmethodsubtype2;
                } else
                {
                    k++;
                    inputmethodsubtype1 = inputmethodsubtype2;
                }
            }

        }

        if (j <= 1 && k <= 1)
        {
            if (j == 1 && k == 1)
                return inputmethodsubtype == null || inputmethodsubtype1 == null || !inputmethodsubtype.getLocale().equals(inputmethodsubtype1.getLocale()) && !inputmethodsubtype1.overridesImplicitlyEnabledSubtype() && !inputmethodsubtype.overridesImplicitlyEnabledSubtype() || !inputmethodsubtype.containsExtraValueKey("TrySuppressingImeSwitcher");
            else
                return false;
        } else
        {
            return true;
        }
    }

    private void refreshStatusIcon()
    {
        if (mIcon == null)
            return;
        if (!needsToShowIMEButton())
        {
            setVisibility(8);
            return;
        } else
        {
            setVisibility(0);
            mIcon.setImageResource(0x7f0200e8);
            return;
        }
    }

    protected void onAttachedToWindow()
    {
        mIcon = (ImageView)findViewById(mId);
        refreshStatusIcon();
    }

    public void setHardKeyboardStatus(boolean flag)
    {
        if (mHardKeyboardAvailable != flag)
        {
            mHardKeyboardAvailable = flag;
            refreshStatusIcon();
        }
    }

    public void setIconImage(int i)
    {
        if (mIcon != null)
            mIcon.setImageResource(i);
    }

    public void setImeWindowStatus(IBinder ibinder, boolean flag)
    {
        mToken = ibinder;
        mShowButton = flag;
        refreshStatusIcon();
    }

    public void setScreenLocked(boolean flag)
    {
        mScreenLocked = flag;
        refreshStatusIcon();
    }
}
