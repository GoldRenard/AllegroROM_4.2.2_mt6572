// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.wifi;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;

// Referenced classes of package com.mediatek.oobe.basic.wifi:
//            WifiConfigUiBase, WifiConfigController, AccessPoint

class WifiDialog extends AlertDialog
    implements WifiConfigUiBase
{

    static final int BUTTON_FORGET = -3;
    static final int BUTTON_SUBMIT = -1;
    private final AccessPoint mAccessPoint;
    private WifiConfigController mController;
    private final boolean mEdit;
    private final android.content.DialogInterface.OnClickListener mListener;
    private View mView;

    public WifiDialog(Context context, android.content.DialogInterface.OnClickListener onclicklistener, AccessPoint accesspoint, boolean flag)
    {
        super(context, 0x7f0a0021);
        mEdit = flag;
        mListener = onclicklistener;
        mAccessPoint = accesspoint;
    }

    public static String addQuote(String s)
    {
        return WifiConfigController.addQuote(s);
    }

    public static String makeNAI(String s, String s1)
    {
        return WifiConfigController.makeNAI(s, s1);
    }

    public void closeSpinnerDialog()
    {
        if (mController != null)
            mController.closeSpinnerDialog();
    }

    public Button getCancelButton()
    {
        return getButton(-2);
    }

    public WifiConfigController getController()
    {
        return mController;
    }

    public Button getForgetButton()
    {
        return getButton(-3);
    }

    public Button getSubmitButton()
    {
        return getButton(-1);
    }

    public boolean isEdit()
    {
        return mEdit;
    }

    protected void onCreate(Bundle bundle)
    {
        mView = getLayoutInflater().inflate(0x7f03001b, null);
        setView(mView);
        setInverseBackgroundForced(true);
        mController = new WifiConfigController(this, mView, mAccessPoint, mEdit);
        super.onCreate(bundle);
        mController.enableSubmitIfAppropriate();
    }

    public void setCancelButton(CharSequence charsequence)
    {
        setButton(-2, charsequence, mListener);
    }

    public void setForgetButton(CharSequence charsequence)
    {
        setButton(-3, charsequence, mListener);
    }

    public void setSubmitButton(CharSequence charsequence)
    {
        setButton(-1, charsequence, mListener);
    }
}
