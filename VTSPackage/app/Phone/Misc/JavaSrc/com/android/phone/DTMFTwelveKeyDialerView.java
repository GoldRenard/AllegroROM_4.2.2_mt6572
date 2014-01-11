// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.Button;
import android.widget.LinearLayout;

// Referenced classes of package com.android.phone:
//            DTMFTwelveKeyDialer

public class DTMFTwelveKeyDialerView extends LinearLayout
{

    private static final boolean DBG = false;
    private static final String LOG_TAG = "PHONE/DTMFTwelveKeyDialerView";
    private DTMFTwelveKeyDialer mDialer;
    private Button mEndCallButton;
    private Button mHideButton;

    public DTMFTwelveKeyDialerView(Context context)
    {
        super(context);
    }

    public DTMFTwelveKeyDialerView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    private void log(String s)
    {
        Log.d("PHONE/DTMFTwelveKeyDialerView", s);
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        int i = keyevent.getKeyCode();
        if (mDialer != null)
            switch (i)
            {
            case 4: // '\004'
            case 5: // '\005'
                if (keyevent.isDown())
                    return mDialer.onKeyDown(i, keyevent);
                else
                    return mDialer.onKeyUp(i, keyevent);
            }
        return super.dispatchKeyEvent(keyevent);
    }

    void setDialer(DTMFTwelveKeyDialer dtmftwelvekeydialer)
    {
        mDialer = dtmftwelvekeydialer;
    }
}
