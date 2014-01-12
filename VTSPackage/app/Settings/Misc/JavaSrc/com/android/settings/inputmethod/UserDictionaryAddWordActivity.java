// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.content.Intent;
import android.os.*;
import android.view.View;
import android.view.Window;

// Referenced classes of package com.android.settings.inputmethod:
//            UserDictionaryAddWordContents

public class UserDictionaryAddWordActivity extends Activity
{

    static final int CODE_ALREADY_PRESENT = 2;
    static final int CODE_CANCEL = 1;
    static final int CODE_WORD_ADDED = 0;
    public static final String MODE_EDIT_ACTION = "com.android.settings.USER_DICTIONARY_EDIT";
    public static final String MODE_INSERT_ACTION = "com.android.settings.USER_DICTIONARY_INSERT";
    private static final String STATE_KEY_IS_OPEN = "isOpen";
    private UserDictionaryAddWordContents mContents;


    private void reportBackToCaller(int i, Bundle bundle)
    {
        Object obj = getIntent().getExtras().get("listener");
        if (!(obj instanceof Messenger))
            return;
        Messenger messenger = (Messenger)obj;
        Message message = Message.obtain();
        message.obj = bundle;
        message.what = i;
        try
        {
            messenger.send(message);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void onClickCancel(View view)
    {
        reportBackToCaller(1, null);
        finish();
    }

    public void onClickConfirm(View view)
    {
        Bundle bundle = new Bundle();
        reportBackToCaller(mContents.apply(this, bundle), bundle);
        finish();
    }

    public void onCreate(Bundle bundle)
    {
        String s;
label0:
        {
            super.onCreate(bundle);
            setContentView(0x7f040098);
            Intent intent = getIntent();
            s = intent.getAction();
            int i;
            if ("com.android.settings.USER_DICTIONARY_EDIT".equals(s))
            {
                i = 0;
            } else
            {
                if (!"com.android.settings.USER_DICTIONARY_INSERT".equals(s))
                    break label0;
                i = 1;
            }
            Bundle bundle1 = intent.getExtras();
            bundle1.putInt("mode", i);
            if (bundle != null)
                bundle1.putAll(bundle);
            mContents = new UserDictionaryAddWordContents(getWindow().getDecorView(), bundle1);
            return;
        }
        throw new RuntimeException((new StringBuilder()).append("Unsupported action: ").append(s).toString());
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        mContents.saveStateIntoBundle(bundle);
    }
}
