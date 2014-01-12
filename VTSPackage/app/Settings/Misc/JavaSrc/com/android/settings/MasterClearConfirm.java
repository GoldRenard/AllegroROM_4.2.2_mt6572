// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.*;
import android.widget.Button;
import com.android.internal.os.storage.ExternalStorageFormatter;

// Referenced classes of package com.android.settings:
//            Utils

public class MasterClearConfirm extends Fragment
{

    private View mContentView;
    private boolean mEraseSdCard;
    private Button mFinalButton;
    private android.view.View.OnClickListener mFinalClickListener;

    public MasterClearConfirm()
    {
        mFinalClickListener = new android.view.View.OnClickListener() {

            final MasterClearConfirm this$0;

            public void onClick(View view)
            {
                if (Utils.isMonkeyRunning())
                    return;
                if (mEraseSdCard)
                {
                    Intent intent = new Intent("com.android.internal.os.storage.FORMAT_AND_FACTORY_RESET");
                    intent.setComponent(ExternalStorageFormatter.COMPONENT_NAME);
                    getActivity().startService(intent);
                    return;
                } else
                {
                    getActivity().sendBroadcast(new Intent("android.intent.action.MASTER_CLEAR"));
                    return;
                }
            }

            
            {
                this$0 = MasterClearConfirm.this;
                super();
            }
        }
;
    }

    private void establishFinalConfirmationState()
    {
        mFinalButton = (Button)mContentView.findViewById(0x7f0800d6);
        mFinalButton.setOnClickListener(mFinalClickListener);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Bundle bundle1 = getArguments();
        boolean flag;
        if (bundle1 != null)
            flag = bundle1.getBoolean("erase_sd");
        else
            flag = false;
        mEraseSdCard = flag;
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mContentView = layoutinflater.inflate(0x7f04004b, null);
        establishFinalConfirmationState();
        return mContentView;
    }

}
