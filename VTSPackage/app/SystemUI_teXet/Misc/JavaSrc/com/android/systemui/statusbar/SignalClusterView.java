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
import com.android.systemui.statusbar.policy.NetworkController;
import com.android.systemui.statusbar.policy.TelephonyIconsGemini;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.systemui.ext.*;
import com.mediatek.xlog.Xlog;
import java.util.List;

public class SignalClusterView extends LinearLayout
    implements com.android.systemui.statusbar.policy.NetworkController.SignalCluster
{

    static final boolean DEBUG = false;
    static final String TAG = "SignalClusterView";
    ImageView mAirplane;
    private int mAirplaneIconId;
    private boolean mIsAirplaneMode;
    ImageView mMobile;
    ImageView mMobileActivity;
    private IconIdWrapper mMobileActivityId;
    private String mMobileDescription;
    ViewGroup mMobileGroup;
    private ImageView mMobileRoam;
    private IconIdWrapper mMobileStrengthId;
    ImageView mMobileType;
    private String mMobileTypeDescription;
    private int mMobileTypeId;
    private boolean mMobileVisible;
    NetworkController mNC;
    private NetworkType mNetworkType;
    private boolean mRoaming;
    private int mRoamingId;
    private boolean mShowSimIndicator;
    private ViewGroup mSignalClusterCombo;
    private ImageView mSignalNetworkType;
    private int mSimIndicatorResource;
    View mSpacer;
    ImageView mWifi;
    ImageView mWifiActivity;
    private int mWifiActivityId;
    private String mWifiDescription;
    ViewGroup mWifiGroup;
    View mWifiSpacer;
    private int mWifiStrengthId;
    private boolean mWifiVisible;

    public SignalClusterView(Context context)
    {
        this(context, null);
    }

    public SignalClusterView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SignalClusterView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mWifiVisible = false;
        mWifiStrengthId = 0;
        mWifiActivityId = 0;
        mMobileVisible = false;
        mMobileStrengthId = new IconIdWrapper();
        mMobileActivityId = new IconIdWrapper(0);
        mMobileTypeId = 0;
        mIsAirplaneMode = false;
        mAirplaneIconId = 0;
        mShowSimIndicator = false;
        mSimIndicatorResource = 0;
        mRoaming = false;
        mRoamingId = 0;
    }

    private void apply()
    {
        if (mWifiGroup == null)
            return;
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
        if (mWifiVisible && PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
            mWifiSpacer.setVisibility(4);
        else
            mWifiSpacer.setVisibility(8);
        if (mMobileVisible && !mIsAirplaneMode)
        {
            if (mRoaming)
            {
                mMobileRoam.setImageResource(mRoamingId);
                mMobileRoam.setVisibility(0);
            } else
            {
                mMobileRoam.setImageResource(0);
                mMobileRoam.setVisibility(8);
            }
            mMobileGroup.setVisibility(0);
            if (mMobileStrengthId.getResources() != null)
                mMobile.setImageDrawable(mMobileStrengthId.getDrawable());
            else
            if (mMobileStrengthId.getIconId() == 0)
                mMobile.setImageDrawable(null);
            else
                mMobile.setImageResource(mMobileStrengthId.getIconId());
            if (mMobileActivityId.getResources() != null)
                mMobileActivity.setImageDrawable(mMobileActivityId.getDrawable());
            else
            if (mMobileActivityId.getIconId() == 0)
                mMobileActivity.setImageDrawable(null);
            else
                mMobileActivity.setImageResource(mMobileActivityId.getIconId());
            mMobileType.setImageResource(mMobileTypeId);
            Xlog.d("SignalClusterView", (new StringBuilder()).append("apply() setImageResource(mMobileTypeId) mShowSimIndicator = ").append(mShowSimIndicator).toString());
            int i = SIMHelper.getSimIndicatorState();
            if (i != 0 && 2 != i && 4 != i && 3 != i && 1 != i)
            {
                int j = SIMHelper.getSIMColorIdBySlot(mContext, 0);
                if (j > -1 && j < 4 && mNetworkType != null)
                {
                    IconIdWrapper iconidwrapper = new IconIdWrapper(0);
                    int k = PluginFactory.getStatusBarPlugin(mContext).getDataNetworkTypeIconGemini(mNetworkType, j);
                    if (k != -1)
                    {
                        iconidwrapper.setResources(PluginFactory.getStatusBarPlugin(mContext).getPluginResources());
                        iconidwrapper.setIconId(k);
                    } else
                    if (PluginFactory.isDefaultStatusBarPlugin())
                        iconidwrapper.setIconId(TelephonyIconsGemini.getNetworkTypeIconGemini(mNetworkType, j));
                    Xlog.d("SignalClusterView", (new StringBuilder()).append("apply(), mNetworkType=").append(mNetworkType).append(" resId= ").append(iconidwrapper.getIconId()).append(" simColorId = ").append(j).toString());
                    if (iconidwrapper.getResources() != null)
                        mSignalNetworkType.setImageDrawable(iconidwrapper.getDrawable());
                    else
                    if (iconidwrapper.getIconId() == 0)
                        mSignalNetworkType.setImageDrawable(null);
                    else
                        mSignalNetworkType.setImageResource(iconidwrapper.getIconId());
                    mSignalNetworkType.setVisibility(0);
                    if (mMobileStrengthId.getIconId() == 0 || mMobileStrengthId.getIconId() == 0x7f020211)
                        mSignalNetworkType.setVisibility(8);
                }
            } else
            {
                mSignalNetworkType.setImageDrawable(null);
                mSignalNetworkType.setVisibility(8);
            }
            mMobileGroup.setContentDescription((new StringBuilder()).append(mMobileTypeDescription).append(" ").append(mMobileDescription).toString());
            if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
            {
                mMobileType.setVisibility(0);
            } else
            {
                ImageView imageview = mMobileType;
                byte byte0;
                if (!mWifiVisible)
                    byte0 = 0;
                else
                    byte0 = 8;
                imageview.setVisibility(byte0);
            }
            if (mMobileStrengthId.getIconId() == 0x7f020211)
                mMobileType.setVisibility(8);
            if (mShowSimIndicator)
            {
                mSignalClusterCombo.setBackgroundResource(mSimIndicatorResource);
            } else
            {
                mSignalClusterCombo.setPadding(0, 0, 0, 0);
                mSignalClusterCombo.setBackgroundDrawable(null);
            }
        } else
        {
            mMobileGroup.setVisibility(8);
        }
        if (mIsAirplaneMode)
        {
            mAirplane.setVisibility(0);
            mAirplane.setImageResource(mAirplaneIconId);
        } else
        {
            mAirplane.setVisibility(8);
        }
        if (mMobileVisible && mWifiVisible && mIsAirplaneMode)
        {
            mSpacer.setVisibility(4);
            return;
        } else
        {
            mSpacer.setVisibility(8);
            return;
        }
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        if (mWifiVisible && mWifiGroup.getContentDescription() != null)
            accessibilityevent.getText().add(mWifiGroup.getContentDescription());
        if (mMobileVisible && mMobileGroup.getContentDescription() != null)
            accessibilityevent.getText().add(mMobileGroup.getContentDescription());
        return super.dispatchPopulateAccessibilityEvent(accessibilityevent);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mWifiGroup = (ViewGroup)findViewById(0x7f08001b);
        mWifi = (ImageView)findViewById(0x7f08001c);
        mWifiActivity = (ImageView)findViewById(0x7f08001d);
        mMobileGroup = (ViewGroup)findViewById(0x7f080022);
        mMobile = (ImageView)findViewById(0x7f080023);
        mMobileActivity = (ImageView)findViewById(0x7f080027);
        mMobileType = (ImageView)findViewById(0x7f080025);
        mSpacer = findViewById(0x7f08001e);
        mWifiSpacer = findViewById(0x7f0800a2);
        mAirplane = (ImageView)findViewById(0x7f0800a3);
        mSignalClusterCombo = (ViewGroup)findViewById(0x7f080020);
        mSignalNetworkType = (ImageView)findViewById(0x7f080021);
        mMobileRoam = (ImageView)findViewById(0x7f080026);
        apply();
    }

    protected void onDetachedFromWindow()
    {
        mWifiGroup = null;
        mWifi = null;
        mWifiActivity = null;
        mMobileGroup = null;
        mMobile = null;
        mMobileActivity = null;
        mMobileType = null;
        mSpacer = null;
        mWifiSpacer = null;
        mAirplane = null;
        mMobileRoam = null;
        super.onDetachedFromWindow();
    }

    public void setIsAirplaneMode(boolean flag, int i)
    {
        mIsAirplaneMode = flag;
        mAirplaneIconId = i;
        apply();
    }

    public void setMobileDataIndicators(boolean flag, IconIdWrapper iconidwrapper, IconIdWrapper iconidwrapper1, int i, String s, String s1)
    {
        mMobileVisible = flag;
        mMobileStrengthId = iconidwrapper.clone();
        mMobileActivityId = iconidwrapper1.clone();
        mMobileTypeId = i;
        mMobileDescription = s;
        mMobileTypeDescription = s1;
        StringBuilder stringbuilder = (new StringBuilder()).append("setMobileDataIndicators mMobileVisible=").append(mMobileVisible).append(" mMobileStrengthId=").append(mMobileStrengthId.getIconId()).append(" mMobileActivityId=").append(mMobileActivityId.getIconId()).append(" mMobileTypeId=").append(mMobileTypeId).append(" mWifiGroup");
        String s2;
        if (mWifiGroup == null)
            s2 = "=null";
        else
            s2 = "!=null";
        Xlog.d("SignalClusterView", stringbuilder.append(s2).toString());
        apply();
    }

    public void setNetworkController(NetworkController networkcontroller)
    {
        mNC = networkcontroller;
    }

    public void setNetworkType(NetworkType networktype)
    {
        Xlog.d("SignalClusterView", (new StringBuilder()).append("setNetworkType, NetworkType=").append(networktype).toString());
        mNetworkType = networktype;
        apply();
    }

    public void setRoamingFlagandResource(boolean flag, int i)
    {
        mRoaming = flag;
        mRoamingId = i;
    }

    public void setShowSimIndicator(boolean flag, int i)
    {
        mShowSimIndicator = flag;
        mSimIndicatorResource = i;
        apply();
    }

    public void setWifiIndicators(boolean flag, int i, int j, String s)
    {
        mWifiVisible = flag;
        mWifiStrengthId = i;
        mWifiActivityId = j;
        mWifiDescription = s;
        apply();
    }
}
