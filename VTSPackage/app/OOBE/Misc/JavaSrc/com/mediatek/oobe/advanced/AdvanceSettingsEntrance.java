// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.accounts.AccountManager;
import android.accounts.AuthenticatorDescription;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.mediatek.oobe.advanced:
//            AdvanceSettingsEnd

public class AdvanceSettingsEntrance extends Activity
{

    public static final String ADVANCE_SETTING_END_ACTIVITY = "com.mediatek.android.oobe.advanced.AdvanceSettingsEnd";
    public static final String OOBE_STEP_INDEX = "oobe_step_index";
    public static final String OOBE_STEP_NEXT = "oobe_step_next";
    public static final String OOBE_STEP_TOTAL = "oobe_step_total";
    public static final int REQUEST_CODE = 10;
    private static final String TAG = "OOBE";
    private List mActivityList;
    private ImageView mAdvanceSettingsIcon;
    private Button mBackBtn;
    private int mCurrentIndex;
    private boolean mIsGoToNextStep;
    private Button mNextBtn;
    private int mTotalStep;

    public AdvanceSettingsEntrance()
    {
        mCurrentIndex = 0;
        mTotalStep = 0;
        mIsGoToNextStep = true;
    }

    private void goToNextSettings(boolean flag)
    {
        mIsGoToNextStep = flag;
        if (flag)
            mCurrentIndex = 1 + mCurrentIndex;
        else
            mCurrentIndex = -1 + mCurrentIndex;
        Xlog.v("OOBE", (new StringBuilder()).append("AdvanceSettingsEntrance.goToNextSettings(").append(flag).append("), current index=").append(mCurrentIndex).toString());
        if (mCurrentIndex < 0)
        {
            Xlog.w("OOBE", (new StringBuilder()).append("AdvanceSettingsEntrance, mCurrentIndex=").append(mCurrentIndex).append(", finish OOBE now").toString());
            setResult(22);
            finish();
            return;
        }
        if (mCurrentIndex == 0)
        {
            Xlog.e("OOBE", "Stay on advance settings entrance page");
            overridePendingTransition(0x7f040000, 0x7f040003);
            return;
        }
        Intent intent = new Intent();
        if (mCurrentIndex > mTotalStep)
        {
            intent.putExtra("oobe_step_total", mTotalStep);
            intent.putExtra("oobe_step_index", mTotalStep);
            intent.setClass(this, com/mediatek/oobe/advanced/AdvanceSettingsEnd);
            startActivityForResult(intent, 10);
            overridePendingTransition(0x7f040002, 0x7f040001);
            return;
        }
        String s = (String)mActivityList.get(-1 + mCurrentIndex);
        int i = s.indexOf("/");
        if (i > 0)
            intent.setComponent(new ComponentName(s.substring(0, i), s.substring(i + 1)));
        else
            intent.setAction(s);
        intent.putExtra("oobe_step_total", mTotalStep);
        intent.putExtra("oobe_step_index", mCurrentIndex);
        startActivityForResult(intent, 10);
        if (mIsGoToNextStep)
        {
            overridePendingTransition(0x7f040002, 0x7f040001);
            return;
        } else
        {
            overridePendingTransition(0x7f040000, 0x7f040003);
            return;
        }
    }

    private boolean isHasSNS()
    {
        AuthenticatorDescription aauthenticatordescription[] = AccountManager.get(this).getAuthenticatorTypes();
        if (aauthenticatordescription != null && aauthenticatordescription.length != 0)
        {
            for (int i = 0; i < aauthenticatordescription.length; i++)
            {
                String s = aauthenticatordescription[i].type;
                Xlog.d("OOBE", (new StringBuilder()).append("SNS account: ").append(s).toString());
                if (!"com.android.exchange".equals(s) && !"com.android.email".equals(s))
                    return true;
            }

        }
        return false;
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        if (i == 10)
        {
            Xlog.i("OOBE", (new StringBuilder()).append("AdvanceSettingsEntrance.onActivityResult, code=").append(j).append("  current index=").append(mCurrentIndex).toString());
            switch (j)
            {
            case 22: // '\026'
                setResult(22);
                finish();
                return;

            case 21: // '\025'
                goToNextSettings(false);
                return;

            case 20: // '\024'
                goToNextSettings(true);
                return;

            default:
                Xlog.d("OOBE", (new StringBuilder()).append("Enter default branch, where am I? result code = ").append(j).append(", mCurrent Index=").append(mCurrentIndex).toString());
                finish();
                break;
            }
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030002);
        mActivityList = new ArrayList();
        String as[] = {
            "com.mediatek.oobe.advanced.SyncSettings", "com.mediatek.oobe.advanced.AccountSettings", "com.mediatek.oobe.advanced.SNSSettings"
        };
        if (!isHasSNS())
        {
            Xlog.d("OOBE", "== No SNS type detected, remove SNS settings");
            for (int k = 0; k < as.length; k++)
                if (!"com.mediatek.oobe.advanced.SNSSettings".equals(as[k]))
                    mActivityList.add(as[k]);

        } else
        {
            for (int i = 0; i < as.length; i++)
                mActivityList.add(as[i]);

        }
        List list = mActivityList;
        int j = 0;
        if (list != null)
            j = mActivityList.size();
        mTotalStep = j;
        mAdvanceSettingsIcon = (ImageView)findViewById(0x7f0b0003);
        mBackBtn = (Button)findViewById(0x7f0b0006);
        mNextBtn = (Button)findViewById(0x7f0b0007);
        mNextBtn.setText(0x7f09004a);
        mAdvanceSettingsIcon.setOnClickListener(new android.view.View.OnClickListener() {

            final AdvanceSettingsEntrance this$0;

            public void onClick(View view)
            {
                mCurrentIndex = 0;
                goToNextSettings(true);
            }

            
            {
                this$0 = AdvanceSettingsEntrance.this;
                super();
            }
        }
);
        mNextBtn.setOnClickListener(new android.view.View.OnClickListener() {

            final AdvanceSettingsEntrance this$0;

            public void onClick(View view)
            {
                quitAdvanceSettings();
            }

            
            {
                this$0 = AdvanceSettingsEntrance.this;
                super();
            }
        }
);
        mBackBtn.setOnClickListener(new android.view.View.OnClickListener() {

            final AdvanceSettingsEntrance this$0;

            public void onClick(View view)
            {
                setResult(21);
                finish();
            }

            
            {
                this$0 = AdvanceSettingsEntrance.this;
                super();
            }
        }
);
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4)
        {
            setResult(21);
            finish();
            return true;
        } else
        {
            return super.onKeyDown(i, keyevent);
        }
    }

    public void quitAdvanceSettings()
    {
        Xlog.i("OOBE", "Do not enter advance settings, just quit");
        setResult(22);
        finish();
    }


/*
    static int access$002(AdvanceSettingsEntrance advancesettingsentrance, int i)
    {
        advancesettingsentrance.mCurrentIndex = i;
        return i;
    }

*/

}
