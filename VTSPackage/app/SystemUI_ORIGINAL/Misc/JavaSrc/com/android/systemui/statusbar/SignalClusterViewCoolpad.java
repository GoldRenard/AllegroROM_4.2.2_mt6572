// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.android.internal.telephony.PhoneConstants;
import com.android.systemui.statusbar.policy.NetworkControllerCoolpad;
import com.mediatek.systemui.ext.IconIdWrapper;
import com.mediatek.systemui.ext.NetworkType;
import com.mediatek.xlog.Xlog;
import java.util.List;

public class SignalClusterViewCoolpad extends LinearLayout
    implements com.android.systemui.statusbar.policy.NetworkControllerCoolpad.SignalCluster
{

    static final boolean DEBUG = false;
    private static final String TAG = "SignalClusterViewCoolpad";
    private ViewGroup mDataConnectionGroup;
    private NetworkType mDataNetType[];
    private View mFlightMode;
    private int mGeminiSimNum;
    private boolean mIsAirplaneMode;
    private ImageView mMobile[];
    private ImageView mMobile2[];
    private ImageView mMobileActivity[];
    private IconIdWrapper mMobileActivityId[];
    private String mMobileDescription[];
    private ViewGroup mMobileGroup[];
    private ImageView mMobileNetType[];
    private ImageView mMobileRoam[];
    private ImageView mMobileSlotIndicator[];
    private IconIdWrapper mMobileStrengthId[][];
    private int mMobileStrengthIdNum;
    private ImageView mMobileType[];
    private String mMobileTypeDescription[];
    private IconIdWrapper mMobileTypeId[];
    private boolean mMobileVisible[];
    private NetworkControllerCoolpad mNC;
    private boolean mRoaming[];
    private int mRoamingId[];
    private int mSIMColorId[];
    private boolean mShowSimIndicator[];
    private ViewGroup mSignalClusterCombo[];
    private ImageView mSignalNetworkType[];
    private int mSimIndicatorResource[];
    private View mSpacer[];
    private ImageView mWifi;
    private ImageView mWifiActivity;
    private int mWifiActivityId;
    private String mWifiDescription;
    private ViewGroup mWifiGroup;
    private int mWifiStrengthId;
    private boolean mWifiVisible;

    public SignalClusterViewCoolpad(Context context)
    {
        this(context, null);
    }

    public SignalClusterViewCoolpad(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SignalClusterViewCoolpad(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mIsAirplaneMode = false;
        mWifiVisible = false;
        mWifiStrengthId = 0;
        mWifiActivityId = 0;
        mGeminiSimNum = PhoneConstants.GEMINI_SIM_NUM;
        mMobileStrengthIdNum = 2;
        mRoaming = new boolean[mGeminiSimNum];
        mRoamingId = new int[mGeminiSimNum];
        mMobileDescription = new String[mGeminiSimNum];
        mMobileTypeDescription = new String[mGeminiSimNum];
        mSignalClusterCombo = new ViewGroup[mGeminiSimNum];
        mSignalNetworkType = new ImageView[mGeminiSimNum];
        mMobileGroup = new ViewGroup[mGeminiSimNum];
        mMobileRoam = new ImageView[mGeminiSimNum];
        mMobile = new ImageView[mGeminiSimNum];
        mMobile2 = new ImageView[mGeminiSimNum];
        mMobileActivity = new ImageView[mGeminiSimNum];
        mMobileType = new ImageView[mGeminiSimNum];
        mSpacer = new View[mGeminiSimNum];
        mMobileSlotIndicator = new ImageView[mGeminiSimNum];
        mDataNetType = new NetworkType[mGeminiSimNum];
        mMobileNetType = new ImageView[mGeminiSimNum];
        mSIMColorId = new int[mGeminiSimNum];
        mMobileActivityId = new IconIdWrapper[mGeminiSimNum];
        mMobileTypeId = new IconIdWrapper[mGeminiSimNum];
        mMobileStrengthId = new IconIdWrapper[mGeminiSimNum][];
        mShowSimIndicator = new boolean[mGeminiSimNum];
        mSimIndicatorResource = new int[mGeminiSimNum];
        mMobileVisible = new boolean[mGeminiSimNum];
        for (int j = 0; j < mGeminiSimNum; j++)
        {
            mMobileStrengthId[j] = new IconIdWrapper[mMobileStrengthIdNum];
            for (int k = 0; k < mMobileStrengthIdNum; k++)
                mMobileStrengthId[j][k] = new IconIdWrapper(0);

            mMobileTypeId[j] = new IconIdWrapper(0);
            mMobileActivityId[j] = new IconIdWrapper(0);
        }

    }

    public void apply()
    {
        if (mWifiGroup == null)
        {
            Xlog.d("SignalClusterViewCoolpad", "apply(), mWifiGroup is null, return");
        } else
        {
            Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("apply(), mWifiVisible is ").append(mWifiVisible).toString());
            if (mWifiVisible)
            {
                mWifiGroup.setVisibility(0);
                mWifi.setImageResource(mWifiStrengthId);
                mWifiActivity.setImageResource(mWifiActivityId);
                mWifiGroup.setContentDescription(mWifiDescription);
            } else
            {
                mWifiGroup.setVisibility(8);
            }
            for (int i = 0; i < mGeminiSimNum; i++)
            {
                Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("apply(), slotId=").append(i).append(", mMobileVisible=").append(mMobileVisible[i]).toString());
                if (!mMobileVisible[i])
                    continue;
                mSignalClusterCombo[i].setVisibility(0);
                if (mRoaming[i])
                {
                    mMobileRoam[i].setImageResource(mRoamingId[i]);
                    mMobileRoam[i].setVisibility(0);
                } else
                {
                    mMobileRoam[i].setVisibility(8);
                }
                if (mMobileActivityId[i].getIconId() == 0)
                {
                    mMobileActivity[i].setImageDrawable(null);
                    mMobileActivity[i].setVisibility(8);
                } else
                {
                    mMobileActivity[i].setVisibility(0);
                    mMobileActivity[i].setImageResource(mMobileActivityId[i].getIconId());
                }
                if (mMobileStrengthId[i][0].getIconId() == 0)
                {
                    mMobile[i].setImageDrawable(null);
                    mMobile[i].setVisibility(8);
                } else
                {
                    mMobile[i].setVisibility(0);
                    mMobile[i].setImageResource(mMobileStrengthId[i][0].getIconId());
                }
                if (mMobileTypeId[i].getIconId() == 0)
                {
                    mMobileType[i].setImageDrawable(null);
                    mMobileType[i].setVisibility(8);
                } else
                {
                    mMobileType[i].setVisibility(0);
                    mMobileType[i].setImageResource(mMobileTypeId[i].getIconId());
                }
                Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("apply(), slotId=").append(i).append(", mRoaming=").append(mRoaming[i]).append(" mMobileActivityId=").append(mMobileActivityId[i].getIconId()).append(" mMobileTypeId=").append(mMobileTypeId[i].getIconId()).append(" mMobileStrengthId[0] = ").append("").append(mMobileStrengthId[i][0].getIconId()).append(" mMobileStrengthId[1] = ").append(mMobileStrengthId[i][1].getIconId()).toString());
                mMobileGroup[i].setContentDescription((new StringBuilder()).append(mMobileTypeDescription[i]).append(" ").append(mMobileDescription[i]).toString());
                Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("apply(). mIsAirplaneMode is ").append(mIsAirplaneMode).toString());
                if (mIsAirplaneMode)
                {
                    mSignalClusterCombo[i].setVisibility(8);
                    mMobileRoam[i].setVisibility(8);
                    mMobileActivity[i].setVisibility(8);
                    mFlightMode.setVisibility(0);
                } else
                {
                    mFlightMode.setVisibility(8);
                }
            }

        }
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (mWifiVisible && mWifiGroup.getContentDescription() != null)
            accessibilityevent.getText().add(mWifiGroup.getContentDescription());
        if (mMobileVisible[0] && mMobileGroup[0].getContentDescription() != null)
            accessibilityevent.getText().add(mMobileGroup[0].getContentDescription());
        return super.dispatchPopulateAccessibilityEvent(accessibilityevent);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mWifiGroup = (ViewGroup)findViewById(0x7f080012);
        mWifi = (ImageView)findViewById(0x7f080013);
        mWifiActivity = (ImageView)findViewById(0x7f080014);
        mMobile[0] = (ImageView)findViewById(0x7f080020);
        mMobileGroup[0] = (ViewGroup)findViewById(0x7f08001f);
        mMobileActivity[0] = (ImageView)findViewById(0x7f08001b);
        mMobileType[0] = (ImageView)findViewById(0x7f08001e);
        mMobileRoam[0] = (ImageView)findViewById(0x7f080018);
        mSignalClusterCombo[0] = (ViewGroup)findViewById(0x7f08001d);
        mMobile[1] = (ImageView)findViewById(0x7f080024);
        mMobileGroup[1] = (ViewGroup)findViewById(0x7f080023);
        mMobileActivity[1] = (ImageView)findViewById(0x7f08001c);
        mMobileType[1] = (ImageView)findViewById(0x7f080022);
        mMobileRoam[1] = (ImageView)findViewById(0x7f080019);
        mSignalClusterCombo[1] = (ViewGroup)findViewById(0x7f080021);
        mFlightMode = (ImageView)findViewById(0x7f080025);
        apply();
    }

    protected void onDetachedFromWindow()
    {
        mWifiGroup = null;
        mWifi = null;
        mWifiActivity = null;
        mDataConnectionGroup = null;
        for (int i = 0; i < mGeminiSimNum; i++)
        {
            mMobileGroup[i] = null;
            mMobile[i] = null;
            mMobileActivity[i] = null;
            mMobileType[i] = null;
            mSpacer[i] = null;
            mMobileRoam[i] = null;
            mMobileNetType[i] = null;
            mMobile2[i] = null;
        }

        super.onDetachedFromWindow();
    }

    public void setDataNetType3G(int i, NetworkType networktype)
    {
        Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("setDataNetType3G(").append(i).append("), dataNetType=").append(networktype).toString());
        mDataNetType[i] = networktype;
    }

    public void setIsAirplaneMode(boolean flag)
    {
        Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("setIsAirplaneMode=").append(flag).toString());
        mIsAirplaneMode = flag;
    }

    public void setMobileDataIndicators(int i, boolean flag, IconIdWrapper aiconidwrapper[], IconIdWrapper iconidwrapper, IconIdWrapper iconidwrapper1, String s, String s1)
    {
        Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("setMobileDataIndicators(").append(i).append("), visible=").append(flag).append(", strengthIcon[0] ~ [1] ").append(aiconidwrapper[0].getIconId()).append(" ~ ").append(aiconidwrapper[1].getIconId()).toString());
        mMobileVisible[i] = flag;
        mMobileStrengthId[i][0] = aiconidwrapper[0].clone();
        mMobileStrengthId[i][1] = aiconidwrapper[1].clone();
        mMobileActivityId[i] = iconidwrapper.clone();
        mMobileTypeId[i] = iconidwrapper1.clone();
        mMobileDescription[i] = s;
        mMobileTypeDescription[i] = s1;
    }

    public void setNetworkControllerCoolpad(NetworkControllerCoolpad networkcontrollercoolpad)
    {
        mNC = networkcontrollercoolpad;
    }

    public void setRoamingFlagandResource(boolean aflag[], int ai[])
    {
        for (int i = 0; i < mGeminiSimNum; i++)
        {
            Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("setRoamingFlagandResource(").append(i).append("), roaming=").append(aflag[i]).append(", roamingId=").append(ai[i]).toString());
            mRoaming[i] = aflag[i];
            mRoamingId[i] = ai[i];
        }

    }

    public void setShowSimIndicator(int i, boolean flag, int j)
    {
        Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("setShowSimIndicator(").append(i).append("), showSimIndicator=").append(flag).append(" simIndicatorResource = ").append(j).toString());
        mShowSimIndicator[i] = flag;
        mSimIndicatorResource[i] = j;
    }

    public void setWifiIndicators(boolean flag, int i, int j, String s)
    {
        Xlog.d("SignalClusterViewCoolpad", (new StringBuilder()).append("setWifiIndicators, visible=").append(flag).append(", strengthIcon=").append(i).append(", activityIcon=").append(j).append(", contentDescription=").append(s).toString());
        mWifiVisible = flag;
        mWifiStrengthId = i;
        mWifiActivityId = j;
        mWifiDescription = s;
    }
}
