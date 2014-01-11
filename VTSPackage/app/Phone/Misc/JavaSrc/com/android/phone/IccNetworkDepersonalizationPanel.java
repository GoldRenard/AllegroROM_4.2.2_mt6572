// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.content.res.Resources;
import android.os.*;
import android.text.*;
import android.text.method.DialerKeyListener;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.*;
import com.android.internal.telephony.IccCard;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            IccPanel, PhoneGlobals, SpecialCharSequenceMgr

public class IccNetworkDepersonalizationPanel extends IccPanel
{

    private static final boolean DBG = false;
    private static final int EVENT_ICC_NTWRK_DEPERSONALIZATION_RESULT = 100;
    private Button mDismissButton;
    android.view.View.OnClickListener mDismissListener;
    private LinearLayout mEntryPanel;
    private Handler mHandler;
    private Phone mPhone;
    private EditText mPinEntry;
    private TextWatcher mPinEntryWatcher;
    private LinearLayout mStatusPanel;
    private TextView mStatusText;
    private Button mUnlockButton;
    android.view.View.OnClickListener mUnlockListener;

    public IccNetworkDepersonalizationPanel(Context context)
    {
        super(context);
        mPinEntryWatcher = new TextWatcher() {

            final IccNetworkDepersonalizationPanel this$0;

            public void afterTextChanged(Editable editable)
            {
                if (SpecialCharSequenceMgr.handleChars(getContext(), editable.toString()))
                    mPinEntry.getText().clear();
            }

            public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
            {
            }

            public void onTextChanged(CharSequence charsequence, int i, int j, int k)
            {
            }

            
            {
                this$0 = IccNetworkDepersonalizationPanel.this;
                super();
            }
        }
;
        mHandler = new Handler() {

            final IccNetworkDepersonalizationPanel this$0;

            public void handleMessage(Message message)
            {
label0:
                {
                    if (message.what == 100)
                    {
                        if (((AsyncResult)message.obj).exception == null)
                            break label0;
                        indicateError();
                        postDelayed(new Runnable() {

                            final _cls2 this$1;

                            public void run()
                            {
                                hideAlert();
                                mPinEntry.getText().clear();
                                mPinEntry.requestFocus();
                            }

            
            {
                this$1 = _cls2.this;
                super();
            }
                        }
, 3000L);
                    }
                    return;
                }
                indicateSuccess();
                postDelayed(new Runnable() {

                    final _cls2 this$1;

                    public void run()
                    {
                        dismiss();
                    }

            
            {
                this$1 = _cls2.this;
                super();
            }
                }
, 3000L);
            }

            
            {
                this$0 = IccNetworkDepersonalizationPanel.this;
                super();
            }
        }
;
        mUnlockListener = new android.view.View.OnClickListener() {

            final IccNetworkDepersonalizationPanel this$0;

            public void onClick(View view)
            {
                String s = mPinEntry.getText().toString();
                if (TextUtils.isEmpty(s))
                {
                    return;
                } else
                {
                    mPhone.getIccCard().supplyNetworkDepersonalization(s, Message.obtain(mHandler, 100));
                    indicateBusy();
                    return;
                }
            }

            
            {
                this$0 = IccNetworkDepersonalizationPanel.this;
                super();
            }
        }
;
        mDismissListener = new android.view.View.OnClickListener() {

            final IccNetworkDepersonalizationPanel this$0;

            public void onClick(View view)
            {
                dismiss();
            }

            
            {
                this$0 = IccNetworkDepersonalizationPanel.this;
                super();
            }
        }
;
    }

    private void hideAlert()
    {
        mEntryPanel.setVisibility(0);
        mStatusPanel.setVisibility(8);
    }

    private void indicateBusy()
    {
        mStatusText.setText(0x7f0d01ab);
        mEntryPanel.setVisibility(8);
        mStatusPanel.setVisibility(0);
    }

    private void indicateError()
    {
        mStatusText.setText(0x7f0d01ac);
        mEntryPanel.setVisibility(8);
        mStatusPanel.setVisibility(0);
    }

    private void indicateSuccess()
    {
        mStatusText.setText(0x7f0d01ad);
        mEntryPanel.setVisibility(8);
        mStatusPanel.setVisibility(0);
    }

    private void log(String s)
    {
        Log.v("PhoneGlobals", (new StringBuilder()).append("[IccNetworkDepersonalizationPanel] ").append(s).toString());
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040039);
        mPinEntry = (EditText)findViewById(0x7f0800fb);
        mPinEntry.setKeyListener(DialerKeyListener.getInstance());
        mPinEntry.setOnClickListener(mUnlockListener);
        Editable editable = mPinEntry.getText();
        ((Spannable)editable).setSpan(mPinEntryWatcher, 0, editable.length(), 18);
        mEntryPanel = (LinearLayout)findViewById(0x7f0800fa);
        mUnlockButton = (Button)findViewById(0x7f0800fc);
        mUnlockButton.setOnClickListener(mUnlockListener);
        mDismissButton = (Button)findViewById(0x7f0800fd);
        if (getContext().getResources().getBoolean(0x7f0a0001))
        {
            mDismissButton.setVisibility(0);
            mDismissButton.setOnClickListener(mDismissListener);
        } else
        {
            mDismissButton.setVisibility(8);
        }
        mStatusPanel = (LinearLayout)findViewById(0x7f0800fe);
        mStatusText = (TextView)findViewById(0x7f0800ff);
        mPhone = PhoneGlobals.getPhone();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4)
            return true;
        else
            return super.onKeyDown(i, keyevent);
    }

    protected void onStart()
    {
        super.onStart();
    }







}
