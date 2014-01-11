// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.graphics.Rect;
import android.text.*;
import android.text.method.DialerKeyListener;
import android.text.method.TextKeyListener;
import android.util.AttributeSet;
import android.view.KeyEvent;

// Referenced classes of package android.widget:
//            RelativeLayout, EditText, ImageView

public class DialerFilter extends RelativeLayout
{

    public static final int DIGITS_AND_LETTERS = 1;
    public static final int DIGITS_AND_LETTERS_NO_DIGITS = 2;
    public static final int DIGITS_AND_LETTERS_NO_LETTERS = 3;
    public static final int DIGITS_ONLY = 4;
    public static final int LETTERS_ONLY = 5;
    EditText mDigits;
    EditText mHint;
    ImageView mIcon;
    InputFilter mInputFilters[];
    private boolean mIsQwerty;
    EditText mLetters;
    int mMode;
    EditText mPrimary;

    public DialerFilter(Context context)
    {
        super(context);
    }

    public DialerFilter(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    private void makeDigitsPrimary()
    {
        if (mPrimary == mLetters)
            swapPrimaryAndHint(false);
    }

    private void makeLettersPrimary()
    {
        if (mPrimary == mDigits)
            swapPrimaryAndHint(true);
    }

    private void swapPrimaryAndHint(boolean flag)
    {
        Editable editable = mLetters.getText();
        Editable editable1 = mDigits.getText();
        android.text.method.KeyListener keylistener = mLetters.getKeyListener();
        android.text.method.KeyListener keylistener1 = mDigits.getKeyListener();
        if (flag)
        {
            mLetters = mPrimary;
            mDigits = mHint;
        } else
        {
            mLetters = mHint;
            mDigits = mPrimary;
        }
        mLetters.setKeyListener(keylistener);
        mLetters.setText(editable);
        Editable editable2 = mLetters.getText();
        Selection.setSelection(editable2, editable2.length());
        mDigits.setKeyListener(keylistener1);
        mDigits.setText(editable1);
        Editable editable3 = mDigits.getText();
        Selection.setSelection(editable3, editable3.length());
        mPrimary.setFilters(mInputFilters);
        mHint.setFilters(mInputFilters);
    }

    public void append(String s)
    {
        switch (mMode)
        {
        case 2: // '\002'
        case 5: // '\005'
            mLetters.getText().append(s);
            return;

        case 3: // '\003'
        case 4: // '\004'
            mDigits.getText().append(s);
            return;

        case 1: // '\001'
            mDigits.getText().append(s);
            mLetters.getText().append(s);
            return;
        }
    }

    public void clearText()
    {
        mLetters.getText().clear();
        mDigits.getText().clear();
        if (mIsQwerty)
        {
            setMode(1);
            return;
        } else
        {
            setMode(4);
            return;
        }
    }

    public CharSequence getDigits()
    {
        if (mDigits.getVisibility() == 0)
            return mDigits.getText();
        else
            return "";
    }

    public CharSequence getFilterText()
    {
        if (mMode != 4)
            return getLetters();
        else
            return getDigits();
    }

    public CharSequence getLetters()
    {
        if (mLetters.getVisibility() == 0)
            return mLetters.getText();
        else
            return "";
    }

    public int getMode()
    {
        return mMode;
    }

    public boolean isQwertyKeyboard()
    {
        return mIsQwerty;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        InputFilter ainputfilter[] = new InputFilter[1];
        ainputfilter[0] = new android.text.InputFilter.AllCaps();
        mInputFilters = ainputfilter;
        mHint = (EditText)findViewById(0x1020005);
        if (mHint == null)
            throw new IllegalStateException("DialerFilter must have a child EditText named hint");
        mHint.setFilters(mInputFilters);
        mLetters = mHint;
        mLetters.setKeyListener(TextKeyListener.getInstance());
        mLetters.setMovementMethod(null);
        mLetters.setFocusable(false);
        mPrimary = (EditText)findViewById(0x102000c);
        if (mPrimary == null)
        {
            throw new IllegalStateException("DialerFilter must have a child EditText named primary");
        } else
        {
            mPrimary.setFilters(mInputFilters);
            mDigits = mPrimary;
            mDigits.setKeyListener(DialerKeyListener.getInstance());
            mDigits.setMovementMethod(null);
            mDigits.setFocusable(false);
            mIcon = (ImageView)findViewById(0x1020006);
            setFocusable(true);
            mIsQwerty = true;
            setMode(1);
            return;
        }
    }

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        super.onFocusChanged(flag, i, rect);
        if (mIcon != null)
        {
            ImageView imageview = mIcon;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            imageview.setVisibility(byte0);
        }
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        boolean flag = true;
        boolean flag1 = false;
        switch (i)
        {
        case 67: // 'C'
            switch (mMode)
            {
            case 5: // '\005'
                flag1 = mLetters.onKeyDown(i, keyevent);
                break;

            case 4: // '\004'
                flag1 = mDigits.onKeyDown(i, keyevent);
                break;

            case 3: // '\003'
                if (mDigits.getText().length() == mLetters.getText().length())
                {
                    mLetters.onKeyDown(i, keyevent);
                    setMode(flag);
                }
                flag1 = mDigits.onKeyDown(i, keyevent);
                break;

            case 2: // '\002'
                flag1 = mLetters.onKeyDown(i, keyevent);
                if (mLetters.getText().length() == mDigits.getText().length())
                    setMode(flag);
                break;

            case 1: // '\001'
                flag1 = mDigits.onKeyDown(i, keyevent) & mLetters.onKeyDown(i, keyevent);
                break;

            default:
                flag1 = false;
                break;
            }
            break;

        default:
            int j = mMode;
            flag1 = false;
            switch (j)
            {
            default:
                break;

            case 2: // '\002'
            case 5: // '\005'
                flag1 = mLetters.onKeyDown(i, keyevent);
                break;

            case 3: // '\003'
            case 4: // '\004'
                flag1 = mDigits.onKeyDown(i, keyevent);
                break;

            case 1: // '\001'
                flag1 = mLetters.onKeyDown(i, keyevent);
                if (KeyEvent.isModifierKey(i))
                {
                    mDigits.onKeyDown(i, keyevent);
                    flag1 = true;
                    break;
                }
                if (!keyevent.isPrintingKey() && i != 62 && i != 61)
                    break;
                if (keyevent.getMatch(DialerKeyListener.CHARACTERS) != 0)
                    flag1 &= mDigits.onKeyDown(i, keyevent);
                else
                    setMode(2);
                break;
            }
            break;

        case 19: // '\023'
        case 20: // '\024'
        case 21: // '\025'
        case 22: // '\026'
        case 23: // '\027'
        case 66: // 'B'
            break;
        }
        if (!flag1)
            flag = super.onKeyDown(i, keyevent);
        return flag;
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        boolean flag = mLetters.onKeyUp(i, keyevent);
        boolean flag1 = mDigits.onKeyUp(i, keyevent);
        return flag || flag1;
    }

    protected void onModeChange(int i, int j)
    {
    }

    public void removeFilterWatcher(TextWatcher textwatcher)
    {
        Editable editable;
        if (mMode != 4)
            editable = mLetters.getText();
        else
            editable = mDigits.getText();
        editable.removeSpan(textwatcher);
    }

    public void setDigitsWatcher(TextWatcher textwatcher)
    {
        Editable editable = mDigits.getText();
        ((Spannable)editable).setSpan(textwatcher, 0, editable.length(), 18);
    }

    public void setFilterWatcher(TextWatcher textwatcher)
    {
        if (mMode != 4)
        {
            setLettersWatcher(textwatcher);
            return;
        } else
        {
            setDigitsWatcher(textwatcher);
            return;
        }
    }

    public void setLettersWatcher(TextWatcher textwatcher)
    {
        Editable editable = mLetters.getText();
        ((Spannable)editable).setSpan(textwatcher, 0, editable.length(), 18);
    }

    public void setMode(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            makeLettersPrimary();
            mLetters.setVisibility(0);
            mDigits.setVisibility(4);
            break;

        case 3: // '\003'
            makeDigitsPrimary();
            mLetters.setVisibility(4);
            mDigits.setVisibility(0);
            break;

        case 5: // '\005'
            makeLettersPrimary();
            mLetters.setVisibility(0);
            mDigits.setVisibility(8);
            break;

        case 4: // '\004'
            makeDigitsPrimary();
            mLetters.setVisibility(8);
            mDigits.setVisibility(0);
            break;

        case 1: // '\001'
            makeDigitsPrimary();
            mLetters.setVisibility(0);
            mDigits.setVisibility(0);
            break;
        }
        int j = mMode;
        mMode = i;
        onModeChange(j, i);
    }
}
