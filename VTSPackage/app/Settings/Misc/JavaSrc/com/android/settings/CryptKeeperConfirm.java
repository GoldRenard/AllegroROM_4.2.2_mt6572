// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.content.Context;
import android.content.Intent;
import android.os.*;
import android.os.storage.IMountService;
import android.util.Log;
import android.view.*;
import android.widget.Button;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            Utils

public class CryptKeeperConfirm extends Fragment
{
    public static class Blank extends Activity
    {

        private static final String TAG = "Blank";
        private Handler mHandler;

        public void onCreate(Bundle bundle)
        {
            super.onCreate(bundle);
            setContentView(0x7f04001c);
            if (Utils.isMonkeyRunning())
            {
                Xlog.d("Blank", "MonkeyRunning");
                finish();
            }
            ((StatusBarManager)getSystemService("statusbar")).disable(0x1770000);
            mHandler.postDelayed(new Runnable() {

                final Blank this$0;

                public void run()
                {
                    android.os.IBinder ibinder = ServiceManager.getService("mount");
                    if (ibinder == null)
                    {
                        Log.e("CryptKeeper", "Failed to find the mount service");
                        finish();
                        return;
                    }
                    IMountService imountservice = android.os.storage.IMountService.Stub.asInterface(ibinder);
                    try
                    {
                        imountservice.encryptStorage(getIntent().getExtras().getString("password"));
                        return;
                    }
                    catch (Exception exception)
                    {
                        Log.e("CryptKeeper", "Error while encrypting...", exception);
                    }
                }

            
            {
                this$0 = Blank.this;
                super();
            }
            }
, 3000L);
        }

        public Blank()
        {
            mHandler = new Handler();
        }
    }


    private static final String TAG = "CryptKeeperConfirm";
    private View mContentView;
    private Context mContext;
    private Button mFinalButton;
    private android.view.View.OnClickListener mFinalClickListener;

    public CryptKeeperConfirm()
    {
        mFinalClickListener = new android.view.View.OnClickListener() {

            final CryptKeeperConfirm this$0;

            public void onClick(View view)
            {
                if (Utils.isMonkeyRunning())
                {
                    Xlog.d("CryptKeeperConfirm", "MonkeyRunning");
                    return;
                }
                if (mContext != null)
                    mContext.sendBroadcast(new Intent("notify.deskclock.reset.alarms"), null);
                Intent intent = new Intent(getActivity(), com/android/settings/CryptKeeperConfirm$Blank);
                intent.putExtras(getArguments());
                startActivity(intent);
            }

            
            {
                this$0 = CryptKeeperConfirm.this;
                super();
            }
        }
;
    }

    private void establishFinalConfirmationState()
    {
        mFinalButton = (Button)mContentView.findViewById(0x7f080039);
        mFinalButton.setOnClickListener(mFinalClickListener);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        mContext = getActivity().getApplicationContext();
        mContentView = layoutinflater.inflate(0x7f04001d, null);
        establishFinalConfirmationState();
        return mContentView;
    }

}
