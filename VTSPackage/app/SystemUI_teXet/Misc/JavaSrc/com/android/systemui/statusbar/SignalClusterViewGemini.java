// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.android.internal.telephony.PhoneConstants;
import com.android.systemui.statusbar.policy.NetworkControllerGemini;
import com.android.systemui.statusbar.policy.TelephonyIconsGemini;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.systemui.ext.*;
import com.mediatek.xlog.Xlog;
import java.util.List;

public class SignalClusterViewGemini extends LinearLayout
    implements com.android.systemui.statusbar.policy.NetworkControllerGemini.SignalCluster
{

    static final boolean DEBUG = false;
    private static final String TAG = "SignalClusterViewGemini";
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
    private NetworkControllerGemini mNC;
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

    public SignalClusterViewGemini(Context context)
    {
        this(context, null);
    }

    public SignalClusterViewGemini(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SignalClusterViewGemini(Context context, AttributeSet attributeset, int i)
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

    private boolean shouldMobileGroupVisible(int i)
    {
        return true;
    }

    public void apply()
    {
        if (mWifiGroup == null)
        {
            Xlog.d("SignalClusterViewGemini", "apply(), mWifiGroup is null, return");
            return;
        }
        Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("apply(), mWifiVisible is ").append(mWifiVisible).toString());
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
            boolean flag = shouldMobileGroupVisible(i);
            Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("apply(), slotId=").append(i).append(", mMobileVisible=").append(mMobileVisible[i]).append(", mShouldMobileGroupVisible=").append(flag).toString());
            if (mMobileVisible[i] && flag)
            {
                mSignalClusterCombo[i].setVisibility(0);
                if (mRoaming[i])
                {
                    mMobileRoam[i].setBackgroundResource(mRoamingId[i]);
                    mMobileRoam[i].setVisibility(0);
                } else
                {
                    mMobileRoam[i].setVisibility(8);
                }
                if (mMobileStrengthId[i][0].getIconId() == PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthNullIconGemini(i) || mMobileStrengthId[i][0].getIconId() == 0 || mMobileStrengthId[i][0].getIconId() == 0x7f0201e7)
                    mMobileRoam[i].setVisibility(8);
                if (mMobileStrengthId[i][0].getResources() != null)
                    mMobile[i].setImageDrawable(mMobileStrengthId[i][0].getDrawable());
                else
                if (mMobileStrengthId[i][0].getIconId() == 0)
                    mMobile[i].setImageDrawable(null);
                else
                    mMobile[i].setImageResource(mMobileStrengthId[i][0].getIconId());
                if (mMobileStrengthId[i][1].getResources() != null)
                    mMobile2[i].setImageDrawable(mMobileStrengthId[i][1].getDrawable());
                else
                if (mMobileStrengthId[i][1].getIconId() == 0)
                    mMobile2[i].setImageDrawable(null);
                else
                    mMobile2[i].setImageResource(mMobileStrengthId[i][1].getIconId());
                if (NetworkType.Type_1X3G != mDataNetType[i])
                    mMobile2[i].setVisibility(8);
                Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("apply(), slotId=").append(i).append(", mRoaming=").append(mRoaming[i]).append(" mMobileActivityId=").append(mMobileActivityId[i].getIconId()).append(" mMobileTypeId=").append(mMobileTypeId[i].getIconId()).append(" mMobileStrengthId[0] = ").append("").append(mMobileStrengthId[i][0].getIconId()).append(" mMobileStrengthId[1] = ").append(mMobileStrengthId[i][1].getIconId()).toString());
                if (mMobileActivityId[i].getResources() != null)
                    mMobileActivity[i].setImageDrawable(mMobileActivityId[i].getDrawable());
                else
                if (mMobileActivityId[i].getIconId() == 0)
                    mMobileActivity[i].setImageDrawable(null);
                else
                    mMobileActivity[i].setImageResource(mMobileActivityId[i].getIconId());
                if (mMobileTypeId[i].getResources() != null)
                    mMobileType[i].setImageDrawable(mMobileTypeId[i].getDrawable());
                else
                if (mMobileTypeId[i].getIconId() == 0)
                    mMobileType[i].setImageDrawable(null);
                else
                    mMobileType[i].setImageResource(mMobileTypeId[i].getIconId());
                int j = SIMHelper.getSimIndicatorStateGemini(i);
                if (SIMHelper.isSimInserted(i) && 2 != j && 4 != j && 3 != j && 1 != j)
                {
                    int i1 = SIMHelper.getSIMColorIdBySlot(mContext, i);
                    if (i1 > -1 && i1 < 4 && mDataNetType[i] != null)
                    {
                        IconIdWrapper iconidwrapper = new IconIdWrapper(0);
                        int j1 = PluginFactory.getStatusBarPlugin(mContext).getDataNetworkTypeIconGemini(mDataNetType[i], i1);
                        if (j1 != -1)
                        {
                            iconidwrapper.setResources(PluginFactory.getStatusBarPlugin(mContext).getPluginResources());
                            iconidwrapper.setIconId(j1);
                        } else
                        if (PluginFactory.isDefaultStatusBarPlugin())
                            iconidwrapper.setIconId(TelephonyIconsGemini.getNetworkTypeIconGemini(mDataNetType[i], i1));
                        Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("apply(), slot=").append(i).append(", mDataNetType=").append(mDataNetType[i]).append(" resId= ").append(iconidwrapper.getIconId()).append(" simColorId = ").append(i1).toString());
                        if (iconidwrapper.getResources() != null)
                            mSignalNetworkType[i].setImageDrawable(iconidwrapper.getDrawable());
                        else
                        if (iconidwrapper.getIconId() == 0)
                            mSignalNetworkType[i].setImageDrawable(null);
                        else
                            mSignalNetworkType[i].setImageResource(iconidwrapper.getIconId());
                        mSignalNetworkType[i].setVisibility(8);
                        if (mMobileStrengthId[i][0].getIconId() == PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthNullIconGemini(i) || mMobileStrengthId[i][0].getIconId() == 0 || mMobileStrengthId[i][0].getIconId() == 0x7f0201e7)
                            mSignalNetworkType[i].setVisibility(8);
                    }
                } else
                {
                    mSignalNetworkType[i].setImageDrawable(null);
                    mSignalNetworkType[i].setVisibility(8);
                }
                if (mMobileStrengthId[i][0].getIconId() != PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthNullIconGemini(i) && mMobileStrengthId[i][0].getIconId() != 0x7f0201e7)
                    mMobileSlotIndicator[i].setVisibility(0);
                else
                    mMobileSlotIndicator[i].setVisibility(4);
                mMobileGroup[i].setContentDescription((new StringBuilder()).append(mMobileTypeDescription[i]).append(" ").append(mMobileDescription[i]).toString());
                if (mShowSimIndicator[i])
                    mSignalClusterCombo[i].setBackgroundResource(mSimIndicatorResource[i]);
                else
                    mSignalClusterCombo[i].setBackgroundDrawable(null);
                mSignalClusterCombo[i].setPadding(0, 0, 0, 3);
                if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
                {
                    mMobileType[i].setVisibility(0);
                } else
                {
                    ImageView imageview = mMobileType[i];
                    byte byte0;
                    if (!mWifiVisible)
                        byte0 = 0;
                    else
                        byte0 = 8;
                    imageview.setVisibility(byte0);
                }
                int k = PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthSearchingIconGemini(i);
                int l = PluginFactory.getStatusBarPlugin(mContext).getSignalStrengthNullIconGemini(i);
                if (k == mMobileStrengthId[i][0].getIconId() || l == mMobileStrengthId[i][0].getIconId() || mMobileStrengthId[i][0].getIconId() == 0x7f0201e7)
                    mMobileType[i].setVisibility(8);
            } else
            {
                mSignalClusterCombo[i].setVisibility(8);
            }
            Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("apply(). mIsAirplaneMode is ").append(mIsAirplaneMode).toString());
            if (mIsAirplaneMode)
            {
                mSignalClusterCombo[i].setVisibility(8);
                mFlightMode.setVisibility(0);
            } else
            {
                mFlightMode.setVisibility(8);
            }
        }

        if (mWifiVisible)
        {
            mSpacer[0].setVisibility(4);
            return;
        } else
        {
            mSpacer[0].setVisibility(8);
            return;
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
        mWifiGroup = (ViewGroup)findViewById(0x7f08001b);
        mWifi = (ImageView)findViewById(0x7f08001c);
        mWifiActivity = (ImageView)findViewById(0x7f08001d);
        mMobile[0] = (ImageView)findViewById(0x7f080023);
        mMobile2[0] = (ImageView)findViewById(0x7f080024);
        mMobileGroup[0] = (ViewGroup)findViewById(0x7f080022);
        mMobileActivity[0] = (ImageView)findViewById(0x7f080027);
        mMobileType[0] = (ImageView)findViewById(0x7f080025);
        mMobileRoam[0] = (ImageView)findViewById(0x7f080026);
        mSpacer[0] = findViewById(0x7f08001e);
        mMobileSlotIndicator[0] = (ImageView)findViewById(0x7f080028);
        mSignalClusterCombo[0] = (ViewGroup)findViewById(0x7f080020);
        mSignalNetworkType[0] = (ImageView)findViewById(0x7f080021);
        for (int i = 1; i < mGeminiSimNum; i++)
        {
            int l = i + 1;
            mMobile[i] = (ImageView)findViewWithTag((new StringBuilder()).append("mobile_signal_").append(l).toString());
            mMobile2[i] = (ImageView)findViewWithTag((new StringBuilder()).append("mobile_signal2_").append(l).toString());
            mMobileGroup[i] = (ViewGroup)findViewWithTag((new StringBuilder()).append("mobile_combo_").append(l).toString());
            mMobileActivity[i] = (ImageView)findViewWithTag((new StringBuilder()).append("mobile_inout_").append(l).toString());
            mMobileType[i] = (ImageView)findViewWithTag((new StringBuilder()).append("mobile_type_").append(l).toString());
            mMobileRoam[i] = (ImageView)findViewWithTag((new StringBuilder()).append("mobile_roaming_").append(l).toString());
            mSpacer[i] = findViewWithTag((new StringBuilder()).append("spacer_").append(l).toString());
            mMobileSlotIndicator[i] = (ImageView)findViewWithTag((new StringBuilder()).append("mobile_slot_indicator_").append(l).toString());
            mSignalClusterCombo[i] = (ViewGroup)findViewWithTag((new StringBuilder()).append("signal_cluster_combo_").append(l).toString());
            mSignalNetworkType[i] = (ImageView)findViewWithTag((new StringBuilder()).append("network_type_").append(l).toString());
        }

        mFlightMode = (ImageView)findViewById(0x7f080047);
        for (int j = 0; j < mGeminiSimNum; j++)
        {
            int k = PluginFactory.getStatusBarPlugin(mContext).getSignalIndicatorIconGemini(j);
            if (k != -1)
            {
                mMobileSlotIndicator[j].setImageDrawable(PluginFactory.getStatusBarPlugin(mContext).getPluginResources().getDrawable(k));
                mMobileSlotIndicator[j].setVisibility(0);
            } else
            {
                mMobileSlotIndicator[j].setImageResource(0);
                mMobileSlotIndicator[j].setVisibility(8);
            }
        }

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
        Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("setDataNetType3G(").append(i).append("), dataNetType=").append(networktype).toString());
        mDataNetType[i] = networktype;
    }

    public void setIsAirplaneMode(boolean flag)
    {
        Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("setIsAirplaneMode=").append(flag).toString());
        mIsAirplaneMode = flag;
    }

    public void setMobileDataIndicators(int i, boolean flag, IconIdWrapper aiconidwrapper[], IconIdWrapper iconidwrapper, IconIdWrapper iconidwrapper1, String s, String s1)
    {
        Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("setMobileDataIndicators(").append(i).append("), visible=").append(flag).append(", strengthIcon[0] ~ [1] ").append(aiconidwrapper[0].getIconId()).append(" ~ ").append(aiconidwrapper[1].getIconId()).toString());
        mMobileVisible[i] = flag;
        mMobileStrengthId[i][0] = aiconidwrapper[0].clone();
        mMobileStrengthId[i][1] = aiconidwrapper[1].clone();
        mMobileActivityId[i] = iconidwrapper.clone();
        mMobileTypeId[i] = iconidwrapper1.clone();
        mMobileDescription[i] = s;
        mMobileTypeDescription[i] = s1;
    }

    public void setNetworkControllerGemini(NetworkControllerGemini networkcontrollergemini)
    {
        mNC = networkcontrollergemini;
    }

    public void setRoamingFlagandResource(boolean aflag[], int ai[])
    {
        for (int i = 0; i < mGeminiSimNum; i++)
        {
            Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("setRoamingFlagandResource(").append(i).append("), roaming=").append(aflag[i]).append(", roamingId=").append(ai[i]).toString());
            mRoaming[i] = aflag[i];
            mRoamingId[i] = ai[i];
        }

    }

    public void setShowSimIndicator(int i, boolean flag, int j)
    {
        Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("setShowSimIndicator(").append(i).append("), showSimIndicator=").append(flag).append(" simIndicatorResource = ").append(j).toString());
        mShowSimIndicator[i] = flag;
        mSimIndicatorResource[i] = j;
    }

    public void setWifiIndicators(boolean flag, int i, int j, String s)
    {
        Xlog.d("SignalClusterViewGemini", (new StringBuilder()).append("setWifiIndicators, visible=").append(flag).append(", strengthIcon=").append(i).append(", activityIcon=").append(j).append(", contentDescription=").append(s).toString());
        mWifiVisible = flag;
        mWifiStrengthId = i;
        mWifiActivityId = j;
        mWifiDescription = s;
    }
}
