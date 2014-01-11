// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.content.*;
import android.media.*;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController;
import com.android.internal.telephony.Phone;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneUtils;
import com.mediatek.phone.gemini.GeminiUtils;
import java.io.IOException;

public class UssdAlertActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener
{

    private static final String LOG_TAG = "UssdAlertActivity";
    private static final String TAG = "UssdAlertActivity";
    public static final int USSD_DIALOG_NOTIFICATION = 2;
    public static final int USSD_DIALOG_REQUEST = 1;
    public static final String USSD_MESSAGE_EXTRA = "ussd_message";
    public static final String USSD_SLOT_ID = "slot_id";
    public static final String USSD_TYPE_EXTRA = "ussd_type";
    private EditText mInputText;
    private boolean mIsClick;
    private MediaPlayer mMediaPlayer;
    private TextView mMsg;
    private Phone mPhone;
    private int mSlotId;
    private String mText;
    private int mType;

    public UssdAlertActivity()
    {
        mType = 1;
    }

    private View createView()
    {
        View view = getLayoutInflater().inflate(0x7f04000f, null);
        mMsg = (TextView)view.findViewById(0x7f080039);
        mInputText = (EditText)view.findViewById(0x7f08003b);
        if (mMsg != null)
            mMsg.setText(mText);
        if (mType == 2)
            mInputText.setVisibility(8);
        return view;
    }

    public AlertController getmAlertOnlyForTest()
    {
        return super.mAlert;
    }

    public EditText getmInputTextOnlyForTest()
    {
        return mInputText;
    }

    public int getmTypeOnlyForTest()
    {
        return mType;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        mIsClick = true;
        switch (i)
        {
        case -2: 
            PhoneUtils.cancelUssdDialog();
            finish();
            return;

        case -1: 
            if (mType == 1)
                GeminiUtils.sendUssdResponse(mPhone, mInputText.getText().toString(), mSlotId);
            finish();
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        mPhone = PhoneGlobals.getInstance().phone;
        Intent intent = getIntent();
        mText = intent.getStringExtra("ussd_message");
        mType = intent.getIntExtra("ussd_type", 1);
        mSlotId = intent.getIntExtra("slot_id", 0);
        alertparams.mView = createView();
        if (mType == 1)
        {
            alertparams.mPositiveButtonText = getString(0x7f0d019e);
            alertparams.mNegativeButtonText = getString(0x7f0d0196);
        } else
        {
            alertparams.mPositiveButtonText = getString(0x7f0d0192);
        }
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonListener = this;
        playUSSDTone(PhoneGlobals.getInstance().getApplicationContext());
        PhoneUtils.sUssdActivity = this;
        setupAlert();
    }

    protected void onDestroy()
    {
        Log.d("UssdAlertActivity", "onDestroy.");
        if (!mIsClick && mType == 1)
        {
            PhoneUtils.cancelUssdDialog();
            Log.d("UssdAlertActivity", "onDestroy: cancel the request dialog.");
        }
        super.onDestroy();
    }

    protected void onNewIntent(Intent intent)
    {
        Log.v("UssdAlertActivity", "onNewIntent");
        finish();
        playUSSDTone(PhoneGlobals.getInstance().getApplicationContext());
        startActivity(intent);
    }

    protected void onResume()
    {
        super.onResume();
        if (mType == 1)
        {
            String s = mInputText.getText().toString();
            if (s != null && s.length() > 0)
                super.mAlert.getButton(-1).setEnabled(true);
            else
                super.mAlert.getButton(-1).setEnabled(false);
            mIsClick = false;
            mInputText.addTextChangedListener(new TextWatcher() {

                final UssdAlertActivity this$0;

                public void afterTextChanged(Editable editable)
                {
                    int i;
                    if (editable == null)
                        i = 0;
                    else
                        i = editable.length();
                    if (i > 0)
                    {
                        
// JavaClassFileOutputException: get_constant: invalid tag

                public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                }

                public void onTextChanged(CharSequence charsequence, int i, int j, int k)
                {
                }

            
            {
                this$0 = UssdAlertActivity.this;
                super();
            }
            }
);
        }
    }

    public void playUSSDTone(final Context context)
    {
        int i = ((AudioManager)getSystemService("audio")).getRingerMode();
        if (i != 0 && i != 1)
        {
            (new Thread(new Runnable() {

                final UssdAlertActivity this$0;
                final Context val$context;

                public void run()
                {
                    mMediaPlayer = new MediaPlayer();
                    mMediaPlayer.reset();
                    try
                    {
                        mMediaPlayer.setDataSource(context, RingtoneManager.getDefaultUri(2));
                        mMediaPlayer.prepare();
                    }
                    catch (IllegalArgumentException illegalargumentexception)
                    {
                        illegalargumentexception.printStackTrace();
                    }
                    catch (SecurityException securityexception)
                    {
                        securityexception.printStackTrace();
                    }
                    catch (IllegalStateException illegalstateexception)
                    {
                        illegalstateexception.printStackTrace();
                    }
                    catch (IOException ioexception)
                    {
                        ioexception.printStackTrace();
                    }
                    mMediaPlayer.start();
                    setMediaListener(mMediaPlayer);
                }

            
            {
                this$0 = UssdAlertActivity.this;
                context = context1;
                super();
            }
            }
)).start();
            return;
        } else
        {
            Log.d("UssdAlertActivity", (new StringBuilder()).append("ringerMode = ").append(i).append(", do not play USSD tone...").toString());
            return;
        }
    }

    public void setMediaListener(MediaPlayer mediaplayer)
    {
        mediaplayer.setOnCompletionListener(new android.media.MediaPlayer.OnCompletionListener() {

            final UssdAlertActivity this$0;

            public void onCompletion(MediaPlayer mediaplayer1)
            {
                mMediaPlayer.release();
                mMediaPlayer = null;
            }

            
            {
                this$0 = UssdAlertActivity.this;
                super();
            }
        }
);
    }





/*
    static MediaPlayer access$202(UssdAlertActivity ussdalertactivity, MediaPlayer mediaplayer)
    {
        ussdalertactivity.mMediaPlayer = mediaplayer;
        return mediaplayer;
    }

*/
}
