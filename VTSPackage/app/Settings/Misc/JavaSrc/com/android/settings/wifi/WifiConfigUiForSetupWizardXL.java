// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;

// Referenced classes of package com.android.settings.wifi:
//            WifiConfigUiBase, WifiSettingsForSetupWizardXL, WifiConfigController, AccessPoint

public class WifiConfigUiForSetupWizardXL
    implements WifiConfigUiBase, android.view.View.OnFocusChangeListener
{
    private class FocusRunnable
        implements Runnable
    {

        final View mViewToBeFocused;
        final WifiConfigUiForSetupWizardXL this$0;

        public void run()
        {
            if (mInputMethodManager.showSoftInput(mViewToBeFocused, 0))
            {
                mActivity.setPaddingVisibility(8);
                return;
            } else
            {
                Log.w("SetupWizard", "Failed to show software keyboard ");
                return;
            }
        }

        public FocusRunnable(View view)
        {
            this$0 = WifiConfigUiForSetupWizardXL.this;
            super();
            mViewToBeFocused = view;
        }
    }


    private static final String TAG = "SetupWizard";
    private AccessPoint mAccessPoint;
    private final WifiSettingsForSetupWizardXL mActivity;
    private Button mCancelButton;
    private Button mConnectButton;
    private WifiConfigController mController;
    private boolean mEdit;
    private Handler mHandler;
    private LayoutInflater mInflater;
    private final InputMethodManager mInputMethodManager;
    private View mView;

    public WifiConfigUiForSetupWizardXL(WifiSettingsForSetupWizardXL wifisettingsforsetupwizardxl, ViewGroup viewgroup, AccessPoint accesspoint, boolean flag)
    {
        mHandler = new Handler();
        mActivity = wifisettingsforsetupwizardxl;
        mConnectButton = (Button)wifisettingsforsetupwizardxl.findViewById(0x7f080235);
        mCancelButton = (Button)wifisettingsforsetupwizardxl.findViewById(0x7f080234);
        mAccessPoint = accesspoint;
        mEdit = flag;
        mInflater = (LayoutInflater)wifisettingsforsetupwizardxl.getSystemService("layout_inflater");
        mView = mInflater.inflate(0x7f0400a9, viewgroup, true);
        mController = new WifiConfigController(this, mView, mAccessPoint, flag);
        mInputMethodManager = (InputMethodManager)wifisettingsforsetupwizardxl.getSystemService("input_method");
        if (mView.findViewById(0x7f0801eb).getVisibility() == 0)
            requestFocusAndShowKeyboard(0x7f0801bb);
        else
        if (mView.findViewById(0x7f0801e8).getVisibility() == 0)
        {
            requestFocusAndShowKeyboard(0x7f0801d7);
            return;
        }
    }

    public AccessPoint getAccessPoint()
    {
        return mAccessPoint;
    }

    public Button getCancelButton()
    {
        return mCancelButton;
    }

    public Context getContext()
    {
        return mActivity;
    }

    public WifiConfigController getController()
    {
        return mController;
    }

    public Button getForgetButton()
    {
        return null;
    }

    public LayoutInflater getLayoutInflater()
    {
        return mInflater;
    }

    public Button getSubmitButton()
    {
        return mConnectButton;
    }

    public View getView()
    {
        return mView;
    }

    public boolean isEdit()
    {
        return mEdit;
    }

    public void onFocusChange(View view, boolean flag)
    {
        view.setOnFocusChangeListener(null);
        if (flag)
            mHandler.post(new FocusRunnable(view));
    }

    public void requestFocusAndShowKeyboard(int i)
    {
        View view = mView.findViewById(i);
        if (view == null)
        {
            Log.w("SetupWizard", "password field to be focused not found.");
        } else
        {
            if (!(view instanceof EditText))
            {
                Log.w("SetupWizard", "password field is not EditText");
                return;
            }
            if (view.isFocused())
            {
                Log.i("SetupWizard", "Already focused");
                if (!mInputMethodManager.showSoftInput(view, 0))
                {
                    Log.w("SetupWizard", "Failed to show SoftInput");
                    return;
                }
            } else
            {
                view.setOnFocusChangeListener(this);
                boolean flag = view.requestFocus();
                Object aobj[] = new Object[1];
                String s;
                if (flag)
                    s = "successful";
                else
                    s = "failed";
                aobj[0] = s;
                Log.i("SetupWizard", String.format("Focus request: %s", aobj));
                if (!flag)
                {
                    view.setOnFocusChangeListener(null);
                    return;
                }
            }
        }
    }

    public void setCancelButton(CharSequence charsequence)
    {
        mCancelButton.setVisibility(0);
    }

    public void setForgetButton(CharSequence charsequence)
    {
    }

    public void setSubmitButton(CharSequence charsequence)
    {
        mConnectButton.setVisibility(0);
        mConnectButton.setText(charsequence);
    }

    public void setTitle(int i)
    {
        Log.d("SetupWizard", "Ignoring setTitle");
    }

    public void setTitle(CharSequence charsequence)
    {
        Log.d("SetupWizard", "Ignoring setTitle");
    }


}
