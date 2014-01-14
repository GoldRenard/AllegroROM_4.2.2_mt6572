// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.toolbar;

import android.app.AlertDialog;
import android.content.*;
import android.content.res.Resources;
import android.net.sip.SipManager;
import android.util.AttributeSet;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import com.android.systemui.statusbar.BaseStatusBar;
import com.android.systemui.statusbar.util.SIMHelper;
import com.mediatek.systemui.ext.IStatusBarPlugin;
import com.mediatek.systemui.ext.PluginFactory;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.systemui.statusbar.toolbar:
//            SimIconView, ToolBarView

public class SimSwitchPanel extends LinearLayout
{

    private static final String ALWAYS_ASK = "ALWAYS_ASK";
    private static final int ALWAYS_ASK_COLOR = 5;
    private static final String AUTO = "AUTO";
    private static final int AUTO_COLOR = 6;
    private static final boolean DBG = true;
    private static final String SIP_CALL = "SIP_CALL";
    private static final int SIP_CALL_COLOR = 4;
    private static final String TAG = "SimSwitchPanelView";
    private SimIconView mAlwaysAskIconView;
    private SimIconView mAutoIconView;
    private com.mediatek.telephony.SimInfoManager.SimInfoRecord mChooseSIMInfo;
    private String mCurrentBussinessType;
    private String mCurrentServiceType;
    private BroadcastReceiver mIntentReceiver = new BroadcastReceiver() {

        final SimSwitchPanel this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s = intent.getAction();
            Xlog.d("SimSwitchPanelView", "sim state changed");
            if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED") && mSIMInfoList != null && mSIMInfoList.size() > 0)
            {
                for (int i1 = 0; i1 < mSIMInfoList.size(); i1++)
                {
                    com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord2 = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)mSIMInfoList.get(i1);
                    if (siminforecord2 != null)
                    {
                        SimIconView simiconview2 = findViewBySlotId(siminforecord2.mSimSlotId);
                        if (simiconview2 != null)
                            simiconview2.updateSimIcon(siminforecord2);
                    }
                }

            } else
            if (s.equals("android.intent.action.ANY_DATA_STATE"))
            {
                if (mCurrentServiceType == null || mCurrentServiceType.equals("gprs_connection_sim_setting"))
                {
                    String s1 = intent.getStringExtra("reason");
                    com.android.internal.telephony.PhoneConstants.DataState datastate = SimSwitchPanel.getMobileDataState(intent);
                    int k = intent.getIntExtra("simId", -1);
                    Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("mDataConnectionReceiver simId is : ").append(k).toString());
                    Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("mDataConnectionReceiver state is : ").append(datastate).toString());
                    Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("mDataConnectionReceiver reason is : ").append(s1).toString());
                    if (s1 != null && s1 != null && (s1.equals("dataAttached") || s1.equals("dataDetached")))
                    {
                        static class _cls7
                        {

                            static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[];

                            static 
                            {
                                $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState = new int[com.android.internal.telephony.PhoneConstants.DataState.values().length];
                                try
                                {
                                    $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.CONNECTED.ordinal()] = 1;
                                }
                                catch (NoSuchFieldError nosuchfielderror) { }
                                try
                                {
                                    $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED.ordinal()] = 2;
                                }
                                catch (NoSuchFieldError nosuchfielderror1)
                                {
                                    return;
                                }
                            }
                        }

                        switch (_cls7..SwitchMap.com.android.internal.telephony.PhoneConstants.DataState[datastate.ordinal()])
                        {
                        case 2: // '\002'
                            updateMobileConnection();
                            break;

                        case 1: // '\001'
                            updateMobileConnection();
                            break;
                        }
                        if (mSIMInfoList != null)
                        {
                            for (int l = 0; l < mSIMInfoList.size(); l++)
                            {
                                com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord1 = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)mSIMInfoList.get(l);
                                if (siminforecord1 != null)
                                {
                                    SimIconView simiconview1 = findViewBySlotId(siminforecord1.mSimSlotId);
                                    if (simiconview1 != null)
                                        simiconview1.updateSimIcon(siminforecord1);
                                }
                            }

                        }
                    }
                }
            } else
            if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
            {
                SIMHelper.updateSIMInfos(append);
                mSIMInfoList = SIMHelper.getSIMInfoList(append);
                int i = mSIMInfoList.size();
                for (int j = 0; j < i; j++)
                {
                    com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)mSIMInfoList.get(j);
                    if (siminforecord == null)
                        continue;
                    SimIconView simiconview = findViewBySlotId(siminforecord.mSimSlotId);
                    if (simiconview != null)
                    {
                        simiconview.setSlotId(siminforecord.mSimSlotId);
                        simiconview.setSimColor(siminforecord.mColor);
                        simiconview.updateSimIcon(siminforecord);
                    }
                }

            }
        }

            
            {
                this$0 = SimSwitchPanel.this;
                super();
            }
    }
;
    private boolean mPanelShowing;
    private android.content.DialogInterface.OnClickListener mRadioOffListener = new android.content.DialogInterface.OnClickListener() {

        final SimSwitchPanel this$0;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            if (mSwitchDialog != null)
                mSwitchDialog.dismiss();
            switch (i)
            {
            case -1: 
                radioOnBySlot(mChooseSIMInfo.mSimSlotId);
                changeDefaultSim(mChooseSIMInfo);
                return;

            case -2: 
            default:
                return;
            }
        }

            
            {
                this$0 = SimSwitchPanel.this;
                super();
            }
    }
;
    private List mSIMInfoList;
    private boolean mSimIconInflated;
    private List mSimInconViews;
    private android.view.View.OnClickListener mSimSwitchListener = new android.view.View.OnClickListener() {

        final SimSwitchPanel this$0;

        public void onClick(View view)
        {
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)view.getTag();
            long l = siminforecord.mSimInfoId;
            int i = SIMHelper.getSimIndicatorStateGemini(siminforecord.mSimSlotId);
            Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("user clicked simIcon, simId is : ").append(l).append(" , simState = ").append(i).toString());
            if (i == 1)
            {
                mChooseSIMInfo = siminforecord;
                if (mSwitchDialog == null)
                {
                    mSwitchDialog = createDialog(siminforecord);
                } else
                {
                    Resources resources = getResources();
                    Object aobj[] = new Object[1];
                    aobj[0] = siminforecord.mDisplayName;
                    String s = resources.getString(0x7f0b0027, aobj);
                    mSwitchDialog.setMessage(s);
                }
                mSwitchDialog.show();
                return;
            } else
            {
                changeDefaultSim(siminforecord);
                return;
            }
        }

            
            {
                this$0 = SimSwitchPanel.this;
                super();
            }
    }
;
    private SimIconView mSipCallIconView;
    private AlertDialog mSwitchDialog;
    private ToolBarView mToolBarView;
    private boolean mUpdating;

    public SimSwitchPanel(Context context)
    {
        this(context, null);
    }

    public SimSwitchPanel(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mUpdating = false;
        mPanelShowing = false;
        mSimIconInflated = false;
        mSimInconViews = new ArrayList();
    }

    private void buildSimIconViews()
    {
        removeAllViews();
        if (mSimInconViews != null)
            mSimInconViews.clear();
        mSIMInfoList = SIMHelper.getSIMInfoList(mContext);
        int i = mSIMInfoList.size();
        Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("buildSimIconViews call, mSIMInfoList size is ").append(i).toString());
        android.widget.LinearLayout.LayoutParams layoutparams = new android.widget.LinearLayout.LayoutParams(0, -1, 1.0F);
        for (int j = 0; j < i; j++)
        {
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)mSIMInfoList.get(j);
            SimIconView simiconview = (SimIconView)View.inflate(mContext, 0x7f040048, null);
            simiconview.setOrientation(1);
            addView(simiconview, layoutparams);
            mSimInconViews.add(simiconview);
            if (siminforecord != null)
            {
                simiconview.setSlotId(siminforecord.mSimSlotId);
                simiconview.setSimColor(siminforecord.mColor);
            }
            simiconview.setTag(siminforecord);
            simiconview.setOnClickListener(mSimSwitchListener);
            simiconview.updateSimIcon((com.mediatek.telephony.SimInfoManager.SimInfoRecord)mSIMInfoList.get(j));
        }

        if (SipManager.isVoipSupported(mContext))
        {
            final SimIconView simIconView = (SimIconView)View.inflate(mContext, 0x7f040049, null);
            simIconView.setSimIconViewResource(0x7f020251);
            simIconView.setOpName(0x7f0b001c);
            simIconView.setTag("SIP_CALL");
            simIconView.setOrientation(1);
            addView(simIconView, layoutparams);
            mSimInconViews.add(simIconView);
            simIconView.setSimColor(4);
            simIconView.setOnClickListener(new android.view.View.OnClickListener() {

                final SimSwitchPanel this$0;
                final SimIconView val$simIconView;

                public void onClick(View view)
                {
                    for (int k = 0; k < mSimInconViews.size(); k++)
                        ((SimIconView)mSimInconViews.get(k)).setSelected(false);

                    simIconView.setSelected(true);
                    android.provider.Settings.System.putLong(
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$0 = SimSwitchPanel.this;
                simIconView = simiconview;
                super();
            }
            }
);
            mSipCallIconView = simIconView;
            if (mPanelShowing)
            {
                String s1 = mCurrentBussinessType;
                if (s1.equals("voice_call_sim_setting") && isInternetCallEnabled(getContext()))
                    mSipCallIconView.setVisibility(0);
                else
                    mSipCallIconView.setVisibility(8);
                switchSimId(android.provider.Settings.System.getLong(mContext.getContentResolver(), s1, -1L));
            }
        }
        final SimIconView simIconView = (SimIconView)View.inflate(mContext, 0x7f040049, null);
        simIconView.setSimIconViewResource(0x7f02024c);
        simIconView.setOpName(0x7f0b0004);
        simIconView.setTag("ALWAYS_ASK");
        simIconView.setOrientation(1);
        addView(simIconView, layoutparams);
        mSimInconViews.add(simIconView);
        simIconView.setSimColor(5);
        simIconView.setOnClickListener(new android.view.View.OnClickListener() {

            final SimSwitchPanel this$0;
            final SimIconView val$simIconView;

            public void onClick(View view)
            {
                for (int k = 0; k < mSimInconViews.size(); k++)
                    ((SimIconView)mSimInconViews.get(k)).setSelected(false);

                simIconView.setSelected(true);
                android.provider.Settings.System.putLong(
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$0 = SimSwitchPanel.this;
                simIconView = simiconview;
                super();
            }
        }
);
        mAlwaysAskIconView = simIconView;
        if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
        {
            final SimIconView simIconView = (SimIconView)View.inflate(mContext, 0x7f040049, null);
            simIconView.setSimIconViewResource(0x7f02024e);
            simIconView.setOpName(0x7f0b0005);
            simIconView.setTag("AUTO");
            simIconView.setOrientation(1);
            addView(simIconView, layoutparams);
            mSimInconViews.add(simIconView);
            simIconView.setSimColor(6);
            simIconView.setOnClickListener(new android.view.View.OnClickListener() {

                final SimSwitchPanel this$0;
                final SimIconView val$simIconView;

                public void onClick(View view)
                {
                    for (int k = 0; k < mSimInconViews.size(); k++)
                        ((SimIconView)mSimInconViews.get(k)).setSelected(false);

                    simIconView.setSelected(true);
                    android.provider.Settings.System.putLong(SimSwitchPanel.this.ToolBarView.getContentResolver(), mCurrentServiceType, -3L);
                    Intent intent = new Intent();
                    intent.putExtra("simid", -3L);
                    if (mCurrentServiceType.equals("sms_sim_setting"))
                        intent.setAction("android.intent.action.SMS_DEFAULT_SIM");
                    getContext().sendBroadcast(intent);
                    mToolBarView.getStatusBarService().animateCollapsePanels(0);
                }

            
            {
                this$0 = SimSwitchPanel.this;
                simIconView = simiconview;
                super();
            }
            }
);
            mAutoIconView = simIconView;
        }
        if (mPanelShowing)
        {
            String s = mCurrentBussinessType;
            if (mSIMInfoList.size() < 2 && (!s.equals("voice_call_sim_setting") || mSIMInfoList.size() != 1 || !SipManager.isVoipSupported(mContext) || !isInternetCallEnabled(getContext())))
                mAlwaysAskIconView.setVisibility(8);
            else
                mAlwaysAskIconView.setVisibility(0);
            if (mSIMInfoList.size() == 1 && s.equals("sms_sim_setting"))
                mAlwaysAskIconView.setVisibility(8);
            if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
                if (s.equals("sms_sim_setting") && mSIMInfoList.size() >= 1)
                    mAutoIconView.setVisibility(0);
                else
                    mAutoIconView.setVisibility(8);
            switchSimId(android.provider.Settings.System.getLong(mContext.getContentResolver(), s, -1L));
        }
        mSimIconInflated = true;
    }

    private void changeDefaultSim(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord)
    {
        long l = siminforecord.mSimInfoId;
        if (l == android.provider.Settings.System.getLong(mContext.getContentResolver(), mCurrentServiceType, -1L))
        {
            mToolBarView.getStatusBarService().animateCollapsePanels(0);
            return;
        }
        if (!mCurrentServiceType.equals("gprs_connection_sim_setting"))
            android.provider.Settings.System.putLong(mContext.getContentResolver(), mCurrentServiceType, l);
        Intent intent = new Intent();
        if (mCurrentServiceType.equals("voice_call_sim_setting"))
        {
            intent.putExtra("simid", l);
            intent.setAction("android.intent.action.VOICE_CALL_DEFAULT_SIM");
        } else
        if (mCurrentServiceType.equals("sms_sim_setting"))
        {
            intent.putExtra("simid", l);
            intent.setAction("android.intent.action.SMS_DEFAULT_SIM");
        } else
        if (mCurrentServiceType.equals("gprs_connection_sim_setting"))
        {
            intent.putExtra("simid", l);
            intent.setAction("android.intent.action.DATA_DEFAULT_SIM");
        }
        getContext().sendBroadcast(intent);
        updateSimSelectState(siminforecord);
        mToolBarView.getStatusBarService().animateCollapsePanels(0);
    }

    private AlertDialog createDialog(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord)
    {
        Resources resources = getResources();
        Object aobj[] = new Object[1];
        aobj[0] = siminforecord.mDisplayName;
        String s = resources.getString(0x7f0b0027, aobj);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
        builder.setCancelable(true).setTitle(0x7f0b0026).setMessage(s).setInverseBackgroundForced(true).setNegativeButton(0x1040000, mRadioOffListener).setPositiveButton(0x7f0b0029, mRadioOffListener);
        AlertDialog alertdialog = builder.create();
        alertdialog.getWindow().setType(2014);
        return alertdialog;
    }

    private SimIconView findViewBySlotId(int i)
    {
        for (Iterator iterator = mSimInconViews.iterator(); iterator.hasNext();)
        {
            SimIconView simiconview = (SimIconView)iterator.next();
            if (simiconview.getSlotId() == i)
                return simiconview;
        }

        return null;
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(Intent intent)
    {
        String s = intent.getStringExtra("state");
        if (s != null)
            return (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s);
        else
            return com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
    }

    private static boolean isInternetCallEnabled(Context context)
    {
        return android.provider.Settings.System.getInt(context.getContentResolver(), "enable_internet_call_value", 0) == 1;
    }

    private void radioOnBySlot(int i)
    {
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        if (1 == android.provider.Settings.Global.getInt(contentresolver, "airplane_mode_on", -1))
        {
            Xlog.d("SimSwitchPanelView", "radioOnBySlot powerRadioOn airplane mode on");
            android.provider.Settings.Global.putInt(contentresolver, "airplane_mode_on", 0);
            mContext.sendBroadcast((new Intent("android.intent.action.AIRPLANE_MODE")).putExtra("state", false));
        } else
        {
            Xlog.d("SimSwitchPanelView", "radioOnBySlot powerRadioOn: airplane mode is off");
        }
        switchSimRadioState(i);
    }

    private boolean showSimIconViews(String s)
    {
        mCurrentBussinessType = s;
        if (s.equals("video_call_sim_setting"))
            return false;
        if (!mSimIconInflated)
            buildSimIconViews();
        if (s.equals("voice_call_sim_setting") && mSipCallIconView != null && isInternetCallEnabled(getContext()))
        {
            mSipCallIconView.setVisibility(0);
            StringBuilder stringbuilder1 = (new StringBuilder()).append("mSIMInfoList.size() 220 ").append(mSIMInfoList.size()).append(" mAlwaysAskIconView != null is ");
            boolean flag1;
            if (mAlwaysAskIconView != null)
                flag1 = true;
            else
                flag1 = false;
            Xlog.d("SimSwitchPanelView", stringbuilder1.append(flag1).toString());
            if (mSIMInfoList.size() >= 1 && mAlwaysAskIconView != null)
                mAlwaysAskIconView.setVisibility(0);
            else
            if (mAlwaysAskIconView != null)
                mAlwaysAskIconView.setVisibility(8);
        } else
        {
            if (mSipCallIconView != null)
                mSipCallIconView.setVisibility(8);
            if (mSIMInfoList.size() <= 1 && mAlwaysAskIconView != null)
                mAlwaysAskIconView.setVisibility(8);
        }
        if (s.equals("sms_sim_setting"))
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("mSIMInfoList.size() 238 ").append(mSIMInfoList.size()).append(" mAlwaysAskIconView != null is ");
            boolean flag;
            if (mAlwaysAskIconView != null)
                flag = true;
            else
                flag = false;
            Xlog.d("SimSwitchPanelView", stringbuilder.append(flag).toString());
            if (mSIMInfoList.size() > 1 && mAlwaysAskIconView != null)
                mAlwaysAskIconView.setVisibility(0);
            else
            if (mAlwaysAskIconView != null)
                mAlwaysAskIconView.setVisibility(8);
            if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
                if (mSIMInfoList.size() > 1 && mAutoIconView != null)
                    mAutoIconView.setVisibility(0);
                else
                if (mAutoIconView != null)
                    mAutoIconView.setVisibility(8);
        } else
        if (mAutoIconView != null)
            mAutoIconView.setVisibility(8);
        return true;
    }

    private void switchSimId(long l)
    {
        if (mSIMInfoList != null)
        {
            if (l > 0L)
            {
                updateSimIcons(l);
                return;
            }
            if (l == 0L)
            {
                for (int i1 = 0; i1 < mSimInconViews.size(); i1++)
                    ((SimIconView)mSimInconViews.get(i1)).setSelected(false);

            } else
            {
                if (l == -2L)
                {
                    for (int k = 0; k < mSimInconViews.size(); k++)
                        ((SimIconView)mSimInconViews.get(k)).setSelected(false);

                    SimIconView simiconview2 = (SimIconView)findViewWithTag("SIP_CALL");
                    if (simiconview2 == null)
                    {
                        Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("switchSimId failed, bussinessType is: ").append(mCurrentServiceType).append(", simId is ").append(l).toString());
                        return;
                    } else
                    {
                        simiconview2.setSelected(true);
                        return;
                    }
                }
                if (l == -1L)
                {
                    for (int j = 0; j < mSimInconViews.size(); j++)
                        ((SimIconView)mSimInconViews.get(j)).setSelected(false);

                    SimIconView simiconview1 = (SimIconView)findViewWithTag("ALWAYS_ASK");
                    if (simiconview1 == null)
                    {
                        Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("switchSimId failed, bussinessType is: ").append(mCurrentServiceType).append(", simId is ").append(l).toString());
                        return;
                    } else
                    {
                        simiconview1.setSelected(true);
                        return;
                    }
                }
                if (l == -3L)
                {
                    for (int i = 0; i < mSimInconViews.size(); i++)
                        ((SimIconView)mSimInconViews.get(i)).setSelected(false);

                    SimIconView simiconview = (SimIconView)findViewWithTag("AUTO");
                    if (simiconview == null)
                    {
                        Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("switchSimId failed, bussinessType is: ").append(mCurrentServiceType).append(", simId is ").append(l).toString());
                        return;
                    } else
                    {
                        simiconview.setSelected(true);
                        return;
                    }
                }
            }
        }
    }

    private void switchSimRadioState(int i)
    {
        int j = android.provider.Settings.System.getInt(mContext.getContentResolver(), "dual_sim_mode_setting", -1);
        int k = i;
        Xlog.i("SimSwitchPanelView", (new StringBuilder()).append("The current dual sim mode is ").append(j).append(" with slot = ").append(i).toString());
        switch (i)
        {
        case 3: // '\003'
            k = 8;
            break;

        case 2: // '\002'
            k = 4;
            break;

        case 1: // '\001'
            k = 2;
            break;

        case 0: // '\0'
            k = 1;
            break;

        default:
            Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("error of the slot = ").append(i).toString());
            break;
        }
        int l = j | k;
        Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("dualState = ").append(l).append(" to RadioOn").toString());
        android.provider.Settings.System.putInt(mContext.getContentResolver(), "dual_sim_mode_setting", l);
        Intent intent = new Intent("android.intent.action.DUAL_SIM_MODE");
        intent.putExtra("mode", l);
        mContext.sendBroadcast(intent);
    }

    private void updateMobileConnection()
    {
        long l = SIMHelper.getDefaultSIM(mContext, "gprs_connection_sim_setting");
        Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("updateMobileConnection, simId is").append(l).toString());
        switchSimId(l);
    }

    private void updateSimIcons(long l)
    {
        com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SIMHelper.getSIMInfo(mContext, l);
        if (siminforecord != null)
            updateSimSelectState(siminforecord);
    }

    private void updateSimSelectState(com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord)
    {
        if (siminforecord == null)
        {
            Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("updateSimSelectState failed for simInfo is null, bussinessType is: ").append(mCurrentServiceType).toString());
            return;
        }
        for (int i = 0; i < mSimInconViews.size(); i++)
            ((SimIconView)mSimInconViews.get(i)).setSelected(false);

        SimIconView simiconview = findViewBySlotId(siminforecord.mSimSlotId);
        if (simiconview != null)
        {
            simiconview.setSelected(true);
            return;
        } else
        {
            Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("updateSimSelectState failed, bussinessType is: ").append(mCurrentServiceType).append(", simId is ").append(siminforecord.mSimInfoId).toString());
            return;
        }
    }

    public void dismissDialogs()
    {
        if (mSwitchDialog != null)
            mSwitchDialog.dismiss();
    }

    protected int getSuggestedMinimumWidth()
    {
        return 0;
    }

    public boolean isPanelShowing()
    {
        return mPanelShowing;
    }

    public void setPanelShowing(boolean flag)
    {
        mPanelShowing = flag;
    }

    public void setToolBar(ToolBarView toolbarview)
    {
        mToolBarView = toolbarview;
    }

    void setUpdates(boolean flag)
    {
label0:
        {
            if (flag != mUpdating)
            {
                mUpdating = flag;
                if (!flag)
                    break label0;
                IntentFilter intentfilter = new IntentFilter();
                intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
                intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
                intentfilter.addAction("android.intent.action.ANY_DATA_STATE");
                mContext.registerReceiver(mIntentReceiver, intentfilter, null, null);
            }
            return;
        }
        mContext.unregisterReceiver(mIntentReceiver);
    }

    public void updateResources()
    {
        if (mSimInconViews != null && mSimInconViews.size() != 0)
        {
            if (mSimInconViews.size() >= 2)
            {
                SimIconView simiconview2 = (SimIconView)findViewWithTag("SIP_CALL");
                if (simiconview2 != null)
                    simiconview2.setOpName(0x7f0b001c);
            }
            SimIconView simiconview = (SimIconView)findViewWithTag("ALWAYS_ASK");
            if (simiconview != null)
                simiconview.setOpName(0x7f0b0004);
            if (PluginFactory.getStatusBarPlugin(mContext).supportDataTypeAlwaysDisplayWhileOn())
            {
                SimIconView simiconview1 = (SimIconView)findViewWithTag("AUTO");
                if (simiconview1 != null)
                    simiconview1.setOpName(0x7f0b0005);
            }
        }
        if (mSwitchDialog != null)
        {
            mSwitchDialog.setTitle(getResources().getString(0x7f0b0026));
            mSwitchDialog.getButton(-1).setText(0x7f0b0029);
            mSwitchDialog.getButton(-2).setText(0x1040000);
            if (mChooseSIMInfo != null)
            {
                AlertDialog alertdialog = mSwitchDialog;
                Resources resources = getResources();
                Object aobj[] = new Object[1];
                aobj[0] = mChooseSIMInfo.mDisplayName;
                alertdialog.setMessage(resources.getString(0x7f0b0027, aobj));
            }
        }
    }

    public void updateSimInfo()
    {
        buildSimIconViews();
    }

    public final boolean updateSimService(String s)
    {
        mCurrentServiceType = s;
        showSimIconViews(s);
        long l = android.provider.Settings.System.getLong(mContext.getContentResolver(), s, -1L);
        Xlog.d("SimSwitchPanelView", (new StringBuilder()).append("updateSimService, bussinessType is: ").append(s).append(", simId is ").append(l).toString());
        switchSimId(l);
        return true;
    }



/*
    static List access$002(SimSwitchPanel simswitchpanel, List list)
    {
        simswitchpanel.mSIMInfoList = list;
        return list;
    }

*/






/*
    static com.mediatek.telephony.SimInfoManager.SimInfoRecord access$1202(SimSwitchPanel simswitchpanel, com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord)
    {
        simswitchpanel.mChooseSIMInfo = siminforecord;
        return siminforecord;
    }

*/



/*
    static AlertDialog access$1302(SimSwitchPanel simswitchpanel, AlertDialog alertdialog)
    {
        simswitchpanel.mSwitchDialog = alertdialog;
        return alertdialog;
    }

*/











}
