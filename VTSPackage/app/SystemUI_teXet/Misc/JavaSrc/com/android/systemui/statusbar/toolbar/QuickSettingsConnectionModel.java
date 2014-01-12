// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.toolbar;

import android.app.*;
import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.graphics.drawable.AnimationDrawable;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.wifi.WifiManager;
import android.os.*;
import android.telephony.*;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.PhoneConstants;
import com.android.systemui.statusbar.phone.PhoneStatusBar;
import com.android.systemui.statusbar.util.SIMHelper;
import com.android.systemui.statusbar.util.StateTracker;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.audioprofile.AudioProfileManager;
import com.mediatek.common.audioprofile.AudioProfileListener;
import com.mediatek.systemui.ext.IStatusBarPlugin;
import com.mediatek.systemui.ext.PluginFactory;
import com.mediatek.telephony.SimInfoManager;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.android.systemui.statusbar.toolbar:
//            SimIconsListView

public final class QuickSettingsConnectionModel
{
    private final class AirlineModeStateTracker extends StateTracker
    {

        private boolean mAirPlaneModeClickable;
        final QuickSettingsConnectionModel this$0;

        public int getActualState(Context context)
        {
            return !QuickSettingsConnectionModel.isAirplaneModeOn(mContext) ? 0 : 1;
        }

        public int getDisabledResource()
        {
            return 0x7f020059;
        }

        public int getEnabledResource()
        {
            return 0x7f02005a;
        }

        public ImageView getImageButtonView()
        {
            return mAirlineModeIcon;
        }

        public ImageView getIndicatorView()
        {
            return null;
        }

        public View getTileView()
        {
            return mAirlineModeTileView;
        }

        public boolean isClickable()
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("mAirPlaneModeClickable is ").append(mAirPlaneModeClickable).append(" super.isClickable is ").append(super.isClickable()).toString());
            return mAirPlaneModeClickable && super.isClickable();
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            if (intent == null)
                return;
            boolean flag = intent.getBooleanExtra("state", false);
            int i = 0;
            if (flag)
                i = 1;
            setCurrentState(context, i);
        }

        public void requestStateChange(Context context, boolean flag)
        {
        }

        public void setAirPlaneModeClickable(boolean flag)
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("setAirPlaneModeClickable called, enabled is: ").append(flag).toString());
            mAirPlaneModeClickable = flag;
        }

        public void toggleState(Context context)
        {
            boolean flag = true;
            if (getIsUserSwitching())
            {
                Xlog.d("QuickSettingsConnectionModel", "toggleState user is swithing, so just return");
                return;
            }
            if (Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
            {
                Intent intent1 = new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS", null);
                intent1.addFlags(0x10000000);
                mContext.startActivity(intent1);
                return;
            }
            boolean flag1 = QuickSettingsConnectionModel.isAirplaneModeOn(mContext);
            if (PluginFactory.getStatusBarPlugin(mContext).supportDisableWifiAtAirplaneMode())
            {
                WifiStateTracker wifistatetracker = mWifiStateTracker;
                boolean flag2;
                if (!flag1)
                    flag2 = flag;
                else
                    flag2 = false;
                wifistatetracker.setAirlineMode(flag2);
                mWifiTileView.setEnabled(mWifiStateTracker.isClickable());
            }
            setIsUserSwitching(flag);
            mAirlineModeTileView.setEnabled(isClickable());
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("Airplane toogleState: ").append(isClickable()).append(", current airlineMode is ").append(flag1).toString());
            ContentResolver contentresolver = mContext.getContentResolver();
            int i;
            if (flag1)
                i = 0;
            else
                i = ((flag) ? 1 : 0);
            android.provider.Settings.Global.putInt(contentresolver, "airplane_mode_on", i);
            Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
            intent.addFlags(0x20000000);
            if (flag1)
                flag = false;
            intent.putExtra("state", flag);
            mContext.sendBroadcast(intent);
        }

        private AirlineModeStateTracker()
        {
            this$0 = QuickSettingsConnectionModel.this;
            super();
            mAirPlaneModeClickable = true;
        }

    }

    private final class AutoRotationStateTracker extends StateTracker
    {

        final QuickSettingsConnectionModel this$0;

        public int getActualState(Context context)
        {
            int i = android.provider.Settings.System.getInt(context.getContentResolver(), "accelerometer_rotation", -1);
            if (i == 1)
                return 1;
            return i != 0 ? -2 : 0;
        }

        public int getDisabledResource()
        {
            return 0x7f020037;
        }

        public int getEnabledResource()
        {
            return 0x7f020036;
        }

        public ImageView getImageButtonView()
        {
            return mAutoRotateIcon;
        }

        public ImageView getIndicatorView()
        {
            return null;
        }

        public View getTileView()
        {
            return mAutoRotateTileView;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            setCurrentState(context, getActualState(context));
        }

        public void requestStateChange(final Context context, boolean flag)
        {
            context.getContentResolver();
            (flag. new AsyncTask() {

                final AutoRotationStateTracker this$1;
                final Context val$context;
                final boolean val$desiredState;

                protected transient Boolean doInBackground(Void avoid[])
                {
                    ContentResolver contentresolver = context.getContentResolver();
                    int i;
                    if (desiredState)
                        i = 1;
                    else
                        i = 0;
                    android.provider.Settings.System.putInt(contentresolver, "accelerometer_rotation", i);
                    return Boolean.valueOf(desiredState);
                }

                protected volatile Object doInBackground(Object aobj[])
                {
                    return doInBackground((Void[])aobj);
                }

                protected void onPostExecute(Boolean boolean1)
                {
                    AutoRotationStateTracker autorotationstatetracker = AutoRotationStateTracker.this;
                    Context context1 = context;
                    int i;
                    if (boolean1.booleanValue())
                        i = 1;
                    else
                        i = 0;
                    autorotationstatetracker.setCurrentState(context1, i);
                }

                protected volatile void onPostExecute(Object obj)
                {
                    onPostExecute((Boolean)obj);
                }

            
            {
                this$1 = final_autorotationstatetracker;
                context = context1;
                desiredState = Z.this;
                super();
            }
            }
).execute(new Void[0]);
        }

        private AutoRotationStateTracker()
        {
            this$0 = QuickSettingsConnectionModel.this;
            super();
        }

    }

    private final class BluetoothStateTracker extends StateTracker
    {

        final QuickSettingsConnectionModel this$0;

        private int bluetoothStateToFiveState(int i)
        {
            switch (i)
            {
            case 13: // '\r'
                return 3;

            case 11: // '\013'
                return 2;

            case 12: // '\f'
                return 1;

            case 10: // '\n'
                return 0;
            }
            return -2;
        }

        public int getActualState(Context context)
        {
            BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
            if (bluetoothadapter == null)
                return 0;
            else
                return bluetoothStateToFiveState(bluetoothadapter.getState());
        }

        public int getDisabledResource()
        {
            return BluetoothAdapter.getDefaultAdapter() != null ? 0x7f020050 : 0x7f02004e;
        }

        public int getEnabledResource()
        {
            return 0x7f02004f;
        }

        public ImageView getImageButtonView()
        {
            return mBluetoothIcon;
        }

        public ImageView getIndicatorView()
        {
            return null;
        }

        public int getInterMedateResource()
        {
            return 0x7f02009b;
        }

        public ImageView getSwitchingGifView()
        {
            if (mBluetoothSwitchIngGifView == null)
            {
                new android.view.ViewGroup.LayoutParams(-1, -1);
                mBluetoothSwitchIngGifView = new ImageView(mContext);
                mBluetoothLayout.addView(mBluetoothSwitchIngGifView, 0);
                mBluetoothSwitchIngGifView.setVisibility(8);
            }
            return mBluetoothSwitchIngGifView;
        }

        public View getTileView()
        {
            return mBluetoothTileView;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            if (!"android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()))
            {
                return;
            } else
            {
                setCurrentState(context, bluetoothStateToFiveState(intent.getIntExtra("android.bluetooth.adapter.extra.STATE", -1)));
                return;
            }
        }

        protected void requestStateChange(Context context, final boolean desiredState)
        {
            BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
            if (bluetoothadapter == null)
            {
                setCurrentState(context, 0);
                return;
            } else
            {
                (bluetoothadapter. new AsyncTask() {

                    final BluetoothStateTracker this$1;
                    final BluetoothAdapter val$bluetoothAdapter;
                    final boolean val$desiredState;

                    protected volatile Object doInBackground(Object aobj[])
                    {
                        return doInBackground((Void[])aobj);
                    }

                    protected transient Void doInBackground(Void avoid[])
                    {
                        if (desiredState)
                            bluetoothAdapter.enable();
                        else
                            bluetoothAdapter.disable();
                        return null;
                    }

            
            {
                this$1 = final_bluetoothstatetracker;
                desiredState = flag;
                bluetoothAdapter = BluetoothAdapter.this;
                super();
            }
                }
).execute(new Void[0]);
                return;
            }
        }

        private BluetoothStateTracker()
        {
            this$0 = QuickSettingsConnectionModel.this;
            super();
        }

    }

    private final class GpsStateTracker extends StateTracker
    {

        final QuickSettingsConnectionModel this$0;

        public int getActualState(Context context)
        {
            return !android.provider.Settings.Secure.isLocationProviderEnabled(context.getContentResolver(), "gps") ? 0 : 1;
        }

        public int getDisabledResource()
        {
            return 0x7f02005e;
        }

        public int getEnabledResource()
        {
            return 0x7f02005d;
        }

        public ImageView getImageButtonView()
        {
            return mGpsIcon;
        }

        public ImageView getIndicatorView()
        {
            return null;
        }

        public View getTileView()
        {
            return mGpsTileView;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            setCurrentState(context, getActualState(context));
        }

        public void requestStateChange(Context context, boolean flag)
        {
            (context. new AsyncTask() {

                final GpsStateTracker this$1;
                final Context val$context;
                final boolean val$desiredState;
                final ContentResolver val$resolver;

                protected transient Boolean doInBackground(Void avoid[])
                {
                    android.provider.Settings.Secure.setLocationProviderEnabled(resolver, "gps", desiredState);
                    return Boolean.valueOf(desiredState);
                }

                protected volatile Object doInBackground(Object aobj[])
                {
                    return doInBackground((Void[])aobj);
                }

                protected void onPostExecute(Boolean boolean1)
                {
                    GpsStateTracker gpsstatetracker = GpsStateTracker.this;
                    Context context1 = context;
                    int i;
                    if (boolean1.booleanValue())
                        i = 1;
                    else
                        i = 0;
                    gpsstatetracker.setCurrentState(context1, i);
                    setImageViewResources(context);
                }

                protected volatile void onPostExecute(Object obj)
                {
                    onPostExecute((Boolean)obj);
                }

            
            {
                this$1 = final_gpsstatetracker;
                resolver = contentresolver;
                desiredState = flag;
                context = Context.this;
                super();
            }
            }
).execute(new Void[0]);
        }

        private GpsStateTracker()
        {
            this$0 = QuickSettingsConnectionModel.this;
            super();
        }

    }

    private final class MobileStateTracker extends StateTracker
    {

        private static final int ALL_RADIO_OFF;
        private boolean mGprsTargSim;
        private boolean mHasSim;
        private boolean mIsAirlineMode;
        private boolean mIsDataDialogShown;
        private boolean mIsMmsOngoing;
        final QuickSettingsConnectionModel this$0;

        private int current3GSlotId()
        {
            int i = -1;
            ITelephony itelephony;
            int j;
            try
            {
                itelephony = SIMHelper.getITelephony();
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("QuickSettingsConnectionModel", "current3GSlotId mTelephony exception");
                return i;
            }
            if (itelephony == null)
                break MISSING_BLOCK_LABEL_24;
            j = itelephony.get3GCapabilitySIM();
            i = j;
            return i;
        }

        private int dataSwitchConfirmDlgMsg(long l)
        {
label0:
            {
                int i = 0x7f0b0022;
                boolean flag = true;
                com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SIMHelper.getSIMInfo(mContext, l);
                boolean flag1 = SIMHelper.getDefault(mContext).isNetworkRoaming(siminforecord.mSimSlotId);
                if (siminforecord.mDataRoaming != flag)
                    flag = false;
                int j = current3GSlotId();
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("dataSwitchConfirmDlgMsg, g3SlotId=").append(j).append(" curSlotId=").append(siminforecord.mSimSlotId).toString());
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("dataSwitchConfirmDlgMsg, isInRoaming=").append(flag1).append(" isRoamingDataAllowed=").append(flag).toString());
                if (flag1)
                {
                    if (!flag)
                    {
                        if (siminforecord.mSimSlotId != j)
                            i = 0x7f0b0024;
                        else
                            return 0x7f0b0021;
                    } else
                    if (siminforecord.mSimSlotId == j)
                        break label0;
                    return i;
                }
                if (siminforecord.mSimSlotId != j)
                    return i;
            }
            return -1;
        }

        private void enableDataRoaming(long l)
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("enableDataRoaming with SimId=").append(l).toString());
            ITelephony itelephony;
            try
            {
                itelephony = SIMHelper.getITelephony();
            }
            catch (RemoteException remoteexception)
            {
                Xlog.e("QuickSettingsConnectionModel", "enableDataRoaming mTelephony exception");
                return;
            }
            if (itelephony == null)
                break MISSING_BLOCK_LABEL_54;
            itelephony.setDataRoamingEnabledGemini(true, SimInfoManager.getSlotById(mContext, l));
            SimInfoManager.setDataRoaming(mContext, 1, l);
            return;
        }

        private boolean isAllRadioOff()
        {
            boolean flag;
            if (!mIsAirlineMode && android.provider.Settings.System.getInt(mContext.getContentResolver(), "dual_sim_mode_setting", -1) != 0)
                flag = false;
            else
                flag = true;
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("isAllRadioOff=").append(flag).toString());
            return flag;
        }

        private boolean isRadioOff(int i)
        {
            boolean flag = true;
            ITelephony itelephony = SIMHelper.getITelephony();
            if (itelephony == null)
                break MISSING_BLOCK_LABEL_29;
            boolean flag2 = itelephony.isRadioOnGemini(i);
            boolean flag1;
            if (!flag2)
                flag = true;
            else
                flag = false;
_L2:
label0:
            {
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("MobileStateTracker: isRadioOff() is ").append(flag).append(", slotId=").append(i).toString());
                if (!isAllRadioOff())
                {
                    flag1 = false;
                    if (!flag)
                        break label0;
                }
                flag1 = true;
            }
            return flag1;
            RemoteException remoteexception;
            remoteexception;
            Xlog.e("QuickSettingsConnectionModel", "MobileStateTracker: isRadioOff() mTelephony exception");
            if (true) goto _L2; else goto _L1
_L1:
        }

        private int mobileStateToFiveState(Intent intent)
        {
            com.android.internal.telephony.PhoneConstants.DataState datastate = QuickSettingsConnectionModel.getMobileDataState(intent);
            int i = intent.getIntExtra("simId", -1);
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("mobileStateToFiveState simSlotId is : ").append(i).toString());
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("mobileStateToFiveState state is : ").append(datastate).toString());
            if (datastate != null)
            {
                static class _cls21
                {

                    static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[];
                    static final int $SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario[];

                    static 
                    {
                        $SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario = new int[com.mediatek.audioprofile.AudioProfileManager.Scenario.values().length];
                        try
                        {
                            $SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario[com.mediatek.audioprofile.AudioProfileManager.Scenario.GENERAL.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror) { }
                        try
                        {
                            $SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario[com.mediatek.audioprofile.AudioProfileManager.Scenario.MEETING.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror1) { }
                        try
                        {
                            $SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario[com.mediatek.audioprofile.AudioProfileManager.Scenario.OUTDOOR.ordinal()] = 3;
                        }
                        catch (NoSuchFieldError nosuchfielderror2) { }
                        try
                        {
                            $SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario[com.mediatek.audioprofile.AudioProfileManager.Scenario.SILENT.ordinal()] = 4;
                        }
                        catch (NoSuchFieldError nosuchfielderror3) { }
                        try
                        {
                            $SwitchMap$com$mediatek$audioprofile$AudioProfileManager$Scenario[com.mediatek.audioprofile.AudioProfileManager.Scenario.CUSTOM.ordinal()] = 5;
                        }
                        catch (NoSuchFieldError nosuchfielderror4) { }
                        $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState = new int[com.android.internal.telephony.PhoneConstants.DataState.values().length];
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.CONNECTED.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror5) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror6)
                        {
                            return;
                        }
                    }
                }

                switch (_cls21..SwitchMap.com.android.internal.telephony.PhoneConstants.DataState[datastate.ordinal()])
                {
                case 2: // '\002'
                    mDataTimerHandler.removeMessages(2000);
                    return 0;

                case 1: // '\001'
                    mDataTimerHandler.removeMessages(2001);
                    if (SIMHelper.getSIMInfoBySlot(mContext, i) == null)
                    {
                        Xlog.e("QuickSettingsConnectionModel", (new StringBuilder()).append("MobileStateTracker mobileStateToFiveState error for simInfo, slotId is ").append(i).toString());
                        return -2;
                    } else
                    {
                        return 1;
                    }
                }
                return -2;
            } else
            {
                return -2;
            }
        }

        private void switchDataConnectionMode(SimIconsListView.SimItem simitem)
        {
            if (!isWifiOnlyDevice())
                mMobileStateTracker.setIsUserSwitching(true);
            if (simitem.mIsSim)
            {
                mGprsTargSim = true;
                mDataTimerHandler.sendEmptyMessageDelayed(2001, 30000L);
            } else
            {
                mGprsTargSim = false;
                mDataTimerHandler.sendEmptyMessageDelayed(2000, 10000L);
            }
            if (!isWifiOnlyDevice())
            {
                mMobileIcon.setVisibility(8);
                int i = mMobileStateTracker.getInterMedateResource();
                if (i != -1)
                {
                    mMobileStateTracker.getSwitchingGifView().setImageResource(i);
                    mMobileStateTracker.getSwitchingGifView().setVisibility(0);
                }
                mMobileTileView.setEnabled(false);
            }
            AnimationDrawable animationdrawable = (AnimationDrawable)getSwitchingGifView().getDrawable();
            if (animationdrawable != null && !animationdrawable.isRunning())
                animationdrawable.start();
            Intent intent = new Intent();
            intent.putExtra("simid", simitem.mSimID);
            intent.setAction("android.intent.action.DATA_DEFAULT_SIM");
            mContext.sendBroadcast(intent);
            dismissDialogs();
        }

        private void unLockSimPin(int i)
        {
            if (mCellConnMgr != null)
            {
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("MobileStateTracker: unLockSimPin() slotId is ").append(i).toString());
                dismissDialogs();
                mStatusBarService.animateCollapsePanels();
                mCellConnMgr.handleCellConn(i, 302);
                return;
            } else
            {
                Xlog.d("QuickSettingsConnectionModel", "MobileStateTracker: mCellConnMgr is null");
                return;
            }
        }

        public int getActualState(Context context)
        {
            long l = SIMHelper.getDefaultSIM(mContext, "gprs_connection_sim_setting");
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("MobileStateTracker.getActualState called, simId is").append(l).toString());
            return l <= 0L || !mHasSim || getEnabledResource() == -1 ? 0 : 1;
        }

        public int getDisabledResource()
        {
            return 0x7f02006b;
        }

        public int getEnabledResource()
        {
            long l = SIMHelper.getDefaultSIM(mContext, "gprs_connection_sim_setting");
            if (l < 0L)
            {
                Xlog.e("QuickSettingsConnectionModel", (new StringBuilder()).append("Mobile StateTracker getEnabledResource error, selected simId is ").append(l).toString());
                return -1;
            }
            if (l == 0L)
                return getDisabledResource();
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SIMHelper.getSIMInfo(mContext, l);
            if (siminforecord == null)
            {
                Xlog.e("QuickSettingsConnectionModel", (new StringBuilder()).append("Mobile StateTracker getEnabledResource error, selected simId is ").append(l).toString());
                return -1;
            }
            int i = siminforecord.mSimSlotId;
            if (isRadioOff(i))
                return 0x7f020068;
            else
                return SIMHelper.getDataConnectionIconIdBySlotId(mContext, i);
        }

        public ImageView getImageButtonView()
        {
            return mMobileIcon;
        }

        public ImageView getIndicatorView()
        {
            return null;
        }

        public int getInterMedateResource()
        {
            return 0x7f0200a0;
        }

        public boolean getIsUserSwitching()
        {
            return mIsUserSwitching;
        }

        public ImageView getSwitchingGifView()
        {
            if (mDataConnSwitchIngGifView == null)
            {
                new android.view.ViewGroup.LayoutParams(-1, -1);
                mDataConnSwitchIngGifView = new ImageView(mContext);
                mDataConnLayout.addView(mDataConnSwitchIngGifView, 0);
                mDataConnSwitchIngGifView.setVisibility(8);
            }
            return mDataConnSwitchIngGifView;
        }

        public View getTileView()
        {
            return mMobileTileView;
        }

        public boolean isClickable()
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("mobile mHasSim is ").append(mHasSim).append(", mIsAirlineMode is ").append(mIsAirlineMode).append(", mIsMmsOngoing is ").append(mIsMmsOngoing).append(", mIsUserSwitching is ").append(mIsUserSwitching).toString());
            return mHasSim && !isAllRadioOff() && !mIsMmsOngoing && super.isClickable();
        }

        public boolean isDataDialogShown()
        {
            return mIsDataDialogShown;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            mIsUserSwitching = false;
            setCurrentState(context, mobileStateToFiveState(intent));
        }

        public void refresh()
        {
            mMobileStateTracker.setCurrentState(mContext, mMobileStateTracker.getActualState(mContext));
            mMobileStateTracker.setIsUserSwitching(false);
            mMobileTileView.setEnabled(mMobileStateTracker.isClickable());
            mMobileIcon.setVisibility(0);
            stopFrameAnim();
            mMobileStateTracker.setImageViewResources(mContext);
        }

        public void requestStateChange(Context context, boolean flag)
        {
        }

        public void setAirlineMode(boolean flag)
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("Mobile setAirlineMode called, enabled is: ").append(flag).toString());
            mIsAirlineMode = flag;
        }

        public void setHasSim(boolean flag)
        {
            mHasSim = flag;
        }

        public void setIsMmsOngoing(boolean flag)
        {
            mIsMmsOngoing = flag;
        }

        public void setIsUserSwitching(boolean flag)
        {
            mIsUserSwitching = flag;
        }

        public void toggleState(Context context)
        {
label0:
            {
                List list = SIMHelper.getSIMInfoList(context);
                StringBuilder stringbuilder = (new StringBuilder()).append("toggleState simInfos = ").append(list).append(" size = ");
                Integer integer;
                if (list != null)
                    integer = Integer.valueOf(list.size());
                else
                    integer = null;
                Xlog.d("QuickSettingsConnectionModel", stringbuilder.append(integer).toString());
                if (list != null)
                {
                    if (list.size() != 1)
                        break label0;
                    com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = (com.mediatek.telephony.SimInfoManager.SimInfoRecord)list.get(0);
                    int i = SIMHelper.getSimIndicatorStateGemini(siminforecord.mSimSlotId);
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("toggleState : Siminfo is ").append(siminforecord).append(" slot is ").append(siminforecord.mSimSlotId).append(" state is ").append(i).toString());
                    if (mSwitchListview == null)
                        mSwitchListview = new SimIconsListView(mContext, "gprs_connection_sim_setting");
                    if (mSwitchListview != null && mSwitchListview.getCount() >= 1)
                    {
                        SimIconsListView.SimItem simitem = (SimIconsListView.SimItem)mSwitchListview.getItemAtPosition(0);
                        SimIconsListView.SimItem simitem1 = (SimIconsListView.SimItem)mSwitchListview.getItemAtPosition(1);
                        if (simitem != null && simitem1 != null)
                            if (SIMHelper.getDefaultSIM(mContext, "gprs_connection_sim_setting") == 0L)
                            {
                                if (1 == i)
                                {
                                    Xlog.d("QuickSettingsConnectionModel", "toggleState : sim indicator state is radiooff");
                                    return;
                                }
                                if (2 == i)
                                {
                                    Xlog.d("QuickSettingsConnectionModel", "toggleState : sim indicator state is locked");
                                    unLockSimPin(siminforecord.mSimSlotId);
                                    return;
                                } else
                                {
                                    switchDataConnectionMode(simitem);
                                    return;
                                }
                            } else
                            {
                                switchDataConnectionMode(simitem1);
                                return;
                            }
                    }
                }
                return;
            }
            mIsDataDialogShown = true;
            (new Handler()).postDelayed(new Runnable() {

                final MobileStateTracker this$1;

                public void run()
                {
                    if (mSwitchListview == null)
                        mSwitchListview = new SimIconsListView(mContext, "gprs_connection_sim_setting");
                    ViewGroup viewgroup = (ViewGroup)mSwitchListview.getParent();
                    if (viewgroup != null)
                        viewgroup.removeView(mSwitchListview);
                    mSwitchDialog = createDialog(mSwitchListview, 0x7f0b000f);
                    mSwitchListview.initSimList();
                    mSwitchListview.notifyDataChange();
                    mSwitchListview.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {

                        final MobileStateTracker._cls1 this$2;

                        public void onItemClick(AdapterView adapterview, View view, int i, long l)
                        {
                            Xlog.d("QuickSettingsConnectionModel", "toggleState, onItemClick");
                            if (view != null && !view.isEnabled())
                            {
                                Xlog.d("QuickSettingsConnectionModel", "toggleState, click item is not enabled");
                                return;
                            }
                            SimIconsListView.SimItem simitem = (SimIconsListView.SimItem)adapterview.getItemAtPosition(i);
                            if (simitem != null)
                            {
                                if (simitem.mState == 2)
                                {
                                    unLockSimPin(simitem.mSlot);
                                    return;
                                }
                                if (simitem.mIsSim && simitem.mSimID == SIMHelper.getDefaultSIM(mContext, "gprs_connection_sim_setting"))
                                {
                                    dismissDialogs();
                                    return;
                                }
                                if (!simitem.mIsSim && SIMHelper.getDefaultSIM(mContext, "gprs_connection_sim_setting") == 0L)
                                {
                                    dismissDialogs();
                                    return;
                                }
                                final int mDataSwitchMsgIndex;
                                if (simitem.mSimID > 0L)
                                    mDataSwitchMsgIndex = dataSwitchConfirmDlgMsg(simitem.mSimID);
                                else
                                    mDataSwitchMsgIndex = -1;
                                if (mDataSwitchMsgIndex == -1)
                                {
                                    switchDataConnectionMode(simitem);
                                    return;
                                } else
                                {
                                    android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
                                    builder.setTitle(0x1040014);
                                    builder.setIcon(0x1080027);
                                    builder.setMessage(mContext.getResources().getString(mDataSwitchMsgIndex));
                                    builder.setPositiveButton(0x1040013, simitem. new android.content.DialogInterface.OnClickListener() {

                                        final MobileStateTracker._cls1._cls1 this$3;
                                        final int val$mDataSwitchMsgIndex;
                                        final SimIconsListView.SimItem val$simItem;

                                        public void onClick(DialogInterface dialoginterface, int i)
                                        {
                                            if (mDataSwitchMsgIndex == 0x7f0b0021 || mDataSwitchMsgIndex == 0x7f0b0023)
                                                enableDataRoaming(simItem.mSimID);
                                            switchDataConnectionMode(simItem);
                                        }

            
            {
                this$3 = final__pcls1;
                mDataSwitchMsgIndex = i;
                simItem = SimIconsListView.SimItem.this;
                super();
            }
                                    }
);
                                    builder.setNegativeButton(0x1040009, new android.content.DialogInterface.OnClickListener() {

                                        final MobileStateTracker._cls1._cls1 this$3;

                                        public void onClick(DialogInterface dialoginterface, int i)
                                        {
                                            dismissDialogs();
                                        }

            
            {
                this$3 = MobileStateTracker._cls1._cls1.this;
                super();
            }
                                    }
);
                                    dismissDialogs();
                                    mSwitchDialog = builder.create();
                                    mSwitchDialog.getWindow().setType(2014);
                                    mSwitchDialog.show();
                                    return;
                                }
                            } else
                            {
                                Xlog.e("QuickSettingsConnectionModel", "MobileIcon clicked and clicked a null sim item");
                                return;
                            }
                        }

            
            {
                this$2 = MobileStateTracker._cls1.this;
                super();
            }
                    }
);
                    mSwitchDialog.getWindow().setType(2014);
                    mSwitchDialog.show();
                    mIsDataDialogShown = false;
                }

            
            {
                this$1 = MobileStateTracker.this;
                super();
            }
            }
, ViewConfiguration.getPressedStateDuration());
        }








/*
        static boolean access$4702(MobileStateTracker mobilestatetracker, boolean flag)
        {
            mobilestatetracker.mIsDataDialogShown = flag;
            return flag;
        }

*/

        private MobileStateTracker()
        {
            this$0 = QuickSettingsConnectionModel.this;
            super();
            mGprsTargSim = false;
            mIsAirlineMode = false;
            mHasSim = false;
            mIsMmsOngoing = false;
            mIsDataDialogShown = false;
        }

    }

    private final class TimeoutStateTracker extends StateTracker
    {

        final QuickSettingsConnectionModel this$0;

        public int getActualState(Context context)
        {
            return 1;
        }

        public int getDisabledResource()
        {
            return 0x7f0200ab;
        }

        public int getEnabledResource()
        {
            return 0x7f0200ac;
        }

        public ImageView getImageButtonView()
        {
            return mTimeoutIcon;
        }

        public ImageView getIndicatorView()
        {
            switch (QuickSettingsConnectionModel.getTimeout(mContext))
            {
            case 60000: 
                mTimeoutIndicator.setImageResource(0x7f020060);
                break;

            case 30000: 
                mTimeoutIndicator.setImageResource(0x7f020062);
                break;

            case 15000: 
                mTimeoutIndicator.setImageResource(0x7f020061);
                break;
            }
            return mTimeoutIndicator;
        }

        public View getTileView()
        {
            return mTimeoutTileView;
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            setCurrentState(context, 1);
        }

        protected void requestStateChange(Context context, boolean flag)
        {
            setCurrentState(context, 1);
        }

        public void toggleState(Context context)
        {
            toggleTimeout(context);
        }

        private TimeoutStateTracker()
        {
            this$0 = QuickSettingsConnectionModel.this;
            super();
        }

    }

    private final class WifiStateTracker extends StateTracker
    {

        private boolean mIsAirlineMode;
        final QuickSettingsConnectionModel this$0;

        private int wifiStateToFiveState(int i)
        {
            switch (i)
            {
            case 2: // '\002'
                return 2;

            case 0: // '\0'
                return 3;

            case 3: // '\003'
                return 1;

            case 1: // '\001'
            default:
                return 0;
            }
        }

        public int getActualState(Context context)
        {
            WifiManager wifimanager = (WifiManager)context.getSystemService("wifi");
            if (wifimanager != null)
                return wifiStateToFiveState(wifimanager.getWifiState());
            else
                return 0;
        }

        public int getDisabledResource()
        {
            return 0x7f0200bd;
        }

        public int getEnabledResource()
        {
            return 0x7f0200b4;
        }

        public ImageView getImageButtonView()
        {
            return mWifiIcon;
        }

        public ImageView getIndicatorView()
        {
            return null;
        }

        public int getInterMedateResource()
        {
            return 0x7f0200a5;
        }

        public ImageView getSwitchingGifView()
        {
            if (mWifiSwitchIngGifView == null)
            {
                new android.view.ViewGroup.LayoutParams(-1, -1);
                mWifiSwitchIngGifView = new ImageView(mContext);
                mWifiLayout.addView(mWifiSwitchIngGifView, 0);
                mWifiSwitchIngGifView.setVisibility(8);
            }
            return mWifiSwitchIngGifView;
        }

        public View getTileView()
        {
            return mWifiTileView;
        }

        public boolean isClickable()
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("wifi mIsAirlineMode is ").append(mIsAirlineMode).append(", mIsUserSwitching is ").append(super.mIsUserSwitching).toString());
            return !mIsAirlineMode && super.isClickable();
        }

        public void onActualStateChange(Context context, Intent intent)
        {
            if (!"android.net.wifi.WIFI_STATE_CHANGED".equals(intent.getAction()))
            {
                return;
            } else
            {
                setCurrentState(context, wifiStateToFiveState(intent.getIntExtra("wifi_state", -1)));
                return;
            }
        }

        protected void requestStateChange(Context context, boolean flag)
        {
            final WifiManager wifiManager = (WifiManager)context.getSystemService("wifi");
            if (wifiManager == null)
            {
                Xlog.d("QuickSettingsConnectionModel", "No wifiManager.");
                setCurrentState(context, 0);
                return;
            } else
            {
                (flag. new AsyncTask() {

                    final WifiStateTracker this$1;
                    final boolean val$desiredState;
                    final WifiManager val$wifiManager;

                    protected volatile Object doInBackground(Object aobj[])
                    {
                        return doInBackground((Void[])aobj);
                    }

                    protected transient Void doInBackground(Void avoid[])
                    {
                        wifiManager.setWifiEnabled(desiredState);
                        return null;
                    }

            
            {
                this$1 = final_wifistatetracker;
                wifiManager = wifimanager;
                desiredState = Z.this;
                super();
            }
                }
).execute(new Void[0]);
                return;
            }
        }

        public void setAirlineMode(boolean flag)
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("Mobile setAirlineMode called, enabled is: ").append(flag).toString());
            mIsAirlineMode = flag;
        }

        private WifiStateTracker()
        {
            this$0 = QuickSettingsConnectionModel.this;
            super();
            mIsAirlineMode = false;
        }

    }


    private static final int ATTACH_TIME_OUT_LENGTH = 30000;
    private static final int COUNT = 5;
    private static final boolean DBG = true;
    private static final int DETACH_TIME_OUT_LENGTH = 10000;
    private static final int EVENT_ATTACH_TIME_OUT = 2001;
    private static final int EVENT_DETACH_TIME_OUT = 2000;
    private static final int FALLBACK_SCREEN_TIMEOUT_VALUE = 30000;
    private static final String IPO_BOOT = "android.intent.action.ACTION_PREBOOT_IPO";
    public static final int MAXIMUM_TIMEOUT = 60000;
    public static final int MEDIUM_TIMEOUT = 30000;
    public static final int MINIMUM_TIMEOUT = 15000;
    private static final int PROFILE_SWITCH_DIALOG_LONG_TIMEOUT = 4000;
    private static final int PROFILE_SWITCH_DIALOG_SHORT_TIMEOUT = 2000;
    private static final String TAG = "QuickSettingsConnectionModel";
    private static final String TRANSACTION_START = "com.android.mms.transaction.START";
    private static final String TRANSACTION_STOP = "com.android.mms.transaction.STOP";
    private ImageView mAirlineModeIcon;
    private AirlineModeStateTracker mAirlineModeStateTracker;
    private View mAirlineModeTileView;
    private AudioManager mAudioManager;
    private ImageView mAudioProfileIcon;
    private AudioProfileListener mAudioProfileListenr;
    private View mAudioProfileTileView;
    private ImageView mAutoRotateIcon;
    private View mAutoRotateTileView;
    private ContentObserver mAutoRotationChangeObserver;
    private AutoRotationStateTracker mAutoRotationStateTracker;
    private ImageView mBluetoothIcon;
    private FrameLayout mBluetoothLayout;
    private BluetoothStateTracker mBluetoothStateTracker;
    private ImageView mBluetoothSwitchIngGifView;
    private View mBluetoothTileView;
    private CellConnMgr mCellConnMgr;
    private Context mContext;
    private com.mediatek.audioprofile.AudioProfileManager.Scenario mCurrentScenario;
    private FrameLayout mDataConnLayout;
    private ImageView mDataConnSwitchIngGifView;
    private Handler mDataTimerHandler;
    private Runnable mDismissProfileSwitchDialogRunnable;
    private ImageView mGpsIcon;
    private GpsStateTracker mGpsStateTracker;
    private View mGpsTileView;
    private Handler mHandler;
    private BroadcastReceiver mIntentReceiver;
    private ImageView mMettingProfileIcon;
    private ImageView mMobileIcon;
    private ContentObserver mMobileStateChangeObserver;
    private ContentObserver mMobileStateForSingleCardChangeObserver;
    private MobileStateTracker mMobileStateTracker;
    private View mMobileTileView;
    private ImageView mMuteProfileIcon;
    private ImageView mNormalProfileIcon;
    private ImageView mOutdoorSwitchIcon;
    PhoneStateListener mPhoneStateListener1;
    PhoneStateListener mPhoneStateListenerGemini;
    private List mProfileKeys;
    private AudioProfileManager mProfileManager;
    private Dialog mProfileSwitchDialog;
    private android.view.View.OnClickListener mProfileSwitchListener;
    private int mServiceState1;
    private int mServiceStateGemini[];
    private boolean mSimCardReady;
    private PhoneStatusBar mStatusBarService;
    private AlertDialog mSwitchDialog;
    private SimIconsListView mSwitchListview;
    private ContentObserver mTimeoutChangeObserver;
    private ImageView mTimeoutIcon;
    private ImageView mTimeoutIndicator;
    private TimeoutStateTracker mTimeoutStateTracker;
    private View mTimeoutTileView;
    private boolean mUpdating;
    private ImageView mWifiIcon;
    private FrameLayout mWifiLayout;
    private WifiStateTracker mWifiStateTracker;
    private ImageView mWifiSwitchIngGifView;
    private View mWifiTileView;

    public QuickSettingsConnectionModel(Context context)
    {
        mUpdating = false;
        mHandler = new Handler();
        mSimCardReady = false;
        mDataTimerHandler = new Handler() {

            final QuickSettingsConnectionModel this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                default:
                    break;

                case 2001: 
                    long l1 = android.provider.Settings.System.getLong(mContext.getContentResolver(), "gprs_connection_sim_setting", -5L);
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("attach time out......simId is ").append(l1).toString());
                    if (!isWifiOnlyDevice())
                    {
                        mMobileStateTracker.refresh();
                        return;
                    }
                    break;

                case 2000: 
                    long l = android.provider.Settings.System.getLong(mContext.getContentResolver(), "gprs_connection_sim_setting", -5L);
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("detach time out......simId is ").append(l).toString());
                    if (!isWifiOnlyDevice())
                    {
                        mMobileStateTracker.refresh();
                        return;
                    }
                    break;
                }
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
;
        mMobileStateChangeObserver = new ContentObserver(new Handler()) {

            final QuickSettingsConnectionModel this$0;

            public void onChange(boolean flag)
            {
                if (!isWifiOnlyDevice() && !mMobileStateTracker.getIsUserSwitching())
                    mMobileStateTracker.setImageViewResources(mContext);
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super(handler);
            }
        }
;
        mMobileStateForSingleCardChangeObserver = new ContentObserver(new Handler()) {

            final QuickSettingsConnectionModel this$0;

            public void onChange(boolean flag)
            {
                if (!isWifiOnlyDevice())
                {
                    mMobileStateTracker.onActualStateChange(mContext, null);
                    mMobileStateTracker.setImageViewResources(mContext);
                }
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super(handler);
            }
        }
;
        mServiceStateGemini = new int[PhoneConstants.GEMINI_SIM_NUM];
        mPhoneStateListener1 = new PhoneStateListener() {

            final QuickSettingsConnectionModel this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("PhoneStateListener1.onServiceStateChanged: serviceState=").append(servicestate).toString());
                mServiceState1 = servicestate.getState();
                onAirplaneModeChanged();
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
;
        mPhoneStateListenerGemini = new PhoneStateListener() {

            final QuickSettingsConnectionModel this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                int i = servicestate.getMySimId();
                if (i >= 0 && i < 0 + PhoneConstants.GEMINI_SIM_NUM)
                {
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("mPhoneStateListenerGemini.onServiceStateChanged: serviceState = ").append(servicestate).toString());
                    mServiceStateGemini[servicestate.getMySimId()] = servicestate.getState();
                    onAirplaneModeChanged();
                    return;
                } else
                {
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("mPhoneStateListenerGemini.onServiceStateChanged: invalid sim id =").append(i).toString());
                    return;
                }
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
;
        mIntentReceiver = new BroadcastReceiver() {

            final QuickSettingsConnectionModel this$0;

            public void onReceive(Context context1, Intent intent)
            {
                String s;
                s = intent.getAction();
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("onReceive called, action is ").append(s).toString());
                if (!s.equals("android.net.wifi.WIFI_STATE_CHANGED")) goto _L2; else goto _L1
_L1:
                mWifiStateTracker.onActualStateChange(context1, intent);
                mWifiStateTracker.setImageViewResources(context1);
                  goto _L3
_L2:
                if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
                {
                    mBluetoothStateTracker.onActualStateChange(context1, intent);
                    mBluetoothStateTracker.setImageViewResources(context1);
                    return;
                }
                if (s.equals("android.location.PROVIDERS_CHANGED"))
                {
                    mGpsStateTracker.onActualStateChange(context1, intent);
                    mGpsStateTracker.setImageViewResources(context1);
                    return;
                }
                if (!s.equals("android.intent.action.AIRPLANE_MODE")) goto _L5; else goto _L4
_L4:
                boolean flag1 = intent.getBooleanExtra("state", false);
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("airline mode changed: state is ").append(flag1).toString());
                if (!isWifiOnlyDevice())
                {
                    mMobileStateTracker.setAirlineMode(flag1);
                    mMobileTileView.setEnabled(mMobileStateTracker.isClickable());
                    mMobileStateTracker.setImageViewResources(context1);
                    if (!flag1)
                    {
                        Intent intent2 = new Intent();
                        intent2.putExtra("state", flag1);
                        mAirlineModeStateTracker.onActualStateChange(mContext, intent2);
                        mAirlineModeStateTracker.setImageViewResources(mContext);
                    }
                }
                if (isWifiOnlyDevice())
                {
                    Intent intent1 = new Intent();
                    intent1.putExtra("state", flag1);
                    mAirlineModeStateTracker.onActualStateChange(mContext, intent1);
                    mAirlineModeStateTracker.setImageViewResources(mContext);
                }
                if (PluginFactory.getStatusBarPlugin(mContext).supportDisableWifiAtAirplaneMode())
                {
                    mWifiStateTracker.setAirlineMode(flag1);
                    mWifiTileView.setEnabled(mWifiStateTracker.isClickable());
                    return;
                }
                  goto _L3
_L5:
                if (!s.equals("android.intent.action.ANY_DATA_STATE")) goto _L7; else goto _L6
_L6:
                com.android.internal.telephony.PhoneConstants.DataState datastate;
                String s1;
                boolean flag;
                datastate = QuickSettingsConnectionModel.getMobileDataState(intent);
                s1 = intent.getStringExtra("apnType");
                flag = false;
                if (s1 == null) goto _L9; else goto _L8
_L8:
                String as[];
                int i;
                int j;
                as = s1.split(",");
                i = as.length;
                j = 0;
_L13:
                flag = false;
                if (j >= i) goto _L9; else goto _L10
_L10:
                if (!"default".equals(as[j])) goto _L12; else goto _L11
_L11:
                flag = true;
_L9:
                if (!isWifiOnlyDevice())
                {
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("isApnType = ").append(flag).append(" , state = ").append(datastate).append(" , mMobileStateTracker.mGprsTargSim = ").append(mMobileStateTracker.mGprsTargSim).append(" , mMobileStateTracker.mIsMmsOngoing = ").append(mMobileStateTracker.mIsMmsOngoing).toString());
                    if (flag && (datastate == com.android.internal.telephony.PhoneConstants.DataState.CONNECTED || datastate == com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED && !mMobileStateTracker.mGprsTargSim && !mMobileStateTracker.mIsMmsOngoing))
                    {
                        mMobileStateTracker.onActualStateChange(context1, intent);
                        mMobileStateTracker.setImageViewResources(context1);
                        if (mSwitchListview != null)
                        {
                            mSwitchListview.initSimList();
                            mSwitchListview.notifyDataChange();
                            return;
                        }
                    }
                }
                break; /* Loop/switch isn't completed */
_L12:
                j++;
                if (true) goto _L13; else goto _L3
_L7:
                if (s.equals("com.android.mms.transaction.START"))
                {
                    if (!isWifiOnlyDevice())
                    {
                        mMobileStateTracker.setIsMmsOngoing(true);
                        mMobileTileView.setEnabled(mMobileStateTracker.isClickable());
                        if (mSwitchDialog != null && mSwitchDialog.isShowing())
                        {
                            dismissDialogs();
                            return;
                        }
                    }
                } else
                if (s.equals("com.android.mms.transaction.STOP"))
                {
                    if (!isWifiOnlyDevice())
                    {
                        mMobileStateTracker.setIsMmsOngoing(false);
                        mMobileTileView.setEnabled(mMobileStateTracker.isClickable());
                        mMobileStateTracker.setImageViewResources(mContext);
                        if (mSwitchDialog != null && mSwitchDialog.isShowing())
                        {
                            dismissDialogs();
                            return;
                        }
                    }
                } else
                if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    if (!isWifiOnlyDevice())
                    {
                        updateForSimReady();
                        return;
                    }
                } else
                if (s.equals("android.intent.action.ACTION_PREBOOT_IPO"))
                {
                    Xlog.d("QuickSettingsConnectionModel", "IPO Boot: initConfigurationState()");
                    initConfigurationState();
                    return;
                }
_L3:
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
;
        mTimeoutChangeObserver = new ContentObserver(new Handler()) {

            final QuickSettingsConnectionModel this$0;

            public void onChange(boolean flag)
            {
                mTimeoutStateTracker.onActualStateChange(mContext, null);
                mTimeoutStateTracker.setImageViewResources(mContext);
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super(handler);
            }
        }
;
        mAutoRotationChangeObserver = new ContentObserver(new Handler()) {

            final QuickSettingsConnectionModel this$0;

            public void onChange(boolean flag)
            {
                mAutoRotationStateTracker.onActualStateChange(mContext, null);
                mAutoRotationStateTracker.setImageViewResources(mContext);
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super(handler);
            }
        }
;
        mProfileSwitchListener = new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                for (int i = 0; i < mProfileKeys.size(); i++)
                {
                    if (!view.getTag().equals(mProfileKeys.get(i)))
                        continue;
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("onClick called, profile clicked is: ").append((String)mProfileKeys.get(i)).toString());
                    String s = (String)mProfileKeys.get(i);
                    updateAudioProfile(s);
                    com.mediatek.audioprofile.AudioProfileManager.Scenario scenario = AudioProfileManager.getScenario(s);
                    updateProfileView(scenario);
                    if (mProfileSwitchDialog != null)
                        mProfileSwitchDialog.dismiss();
                }

            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
;
        mAudioProfileListenr = new AudioProfileListener() {

            final QuickSettingsConnectionModel this$0;

            public void onAudioProfileChanged(String s)
            {
                if (s != null && mUpdating)
                {
                    com.mediatek.audioprofile.AudioProfileManager.Scenario scenario = AudioProfileManager.getScenario(s);
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("onReceive called, profile type is: ").append(scenario).toString());
                    if (scenario != null)
                    {
                        updateProfileView(scenario);
                        return;
                    }
                }
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
;
        mDismissProfileSwitchDialogRunnable = new Runnable() {

            final QuickSettingsConnectionModel this$0;

            public void run()
            {
                if (mProfileSwitchDialog != null && mProfileSwitchDialog.isShowing())
                    mProfileSwitchDialog.dismiss();
                removeAllProfileSwitchDialogCallbacks();
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
;
        mContext = context;
        mCellConnMgr = new CellConnMgr(null);
        mCellConnMgr.register(mContext);
    }

    private AlertDialog createDialog(View view, int i)
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
        builder.setCancelable(true).setTitle(i).setView(view, 0, 0, 0, 0).setInverseBackgroundForced(true).setNegativeButton(0x1040000, new android.content.DialogInterface.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(DialogInterface dialoginterface, int j)
            {
                if (mSwitchDialog != null)
                    mSwitchDialog.hide();
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        AlertDialog alertdialog = builder.create();
        alertdialog.getWindow().setType(2014);
        return alertdialog;
    }

    private void createProfileSwitchDialog()
    {
        if (mProfileSwitchDialog == null)
        {
            mProfileSwitchDialog = new Dialog(mContext);
            mProfileSwitchDialog.requestWindowFeature(1);
            mProfileSwitchDialog.setContentView(0x7f040010);
            mProfileSwitchDialog.setCanceledOnTouchOutside(true);
            mProfileSwitchDialog.getWindow().setType(2014);
            android.view.WindowManager.LayoutParams layoutparams = mProfileSwitchDialog.getWindow().getAttributes();
            layoutparams.privateFlags = 0x10 | layoutparams.privateFlags;
            mProfileSwitchDialog.getWindow().clearFlags(2);
            mMettingProfileIcon = (ImageView)mProfileSwitchDialog.findViewById(0x7f08007b);
            mOutdoorSwitchIcon = (ImageView)mProfileSwitchDialog.findViewById(0x7f08007e);
            mMuteProfileIcon = (ImageView)mProfileSwitchDialog.findViewById(0x7f080078);
            mNormalProfileIcon = (ImageView)mProfileSwitchDialog.findViewById(0x7f080075);
            View view = mProfileSwitchDialog.findViewById(0x7f080074);
            view.setOnClickListener(mProfileSwitchListener);
            view.setTag(AudioProfileManager.getProfileKey(com.mediatek.audioprofile.AudioProfileManager.Scenario.GENERAL));
            View view1 = mProfileSwitchDialog.findViewById(0x7f080077);
            view1.setOnClickListener(mProfileSwitchListener);
            view1.setTag(AudioProfileManager.getProfileKey(com.mediatek.audioprofile.AudioProfileManager.Scenario.SILENT));
            View view2 = mProfileSwitchDialog.findViewById(0x7f08007a);
            view2.setOnClickListener(mProfileSwitchListener);
            view2.setTag(AudioProfileManager.getProfileKey(com.mediatek.audioprofile.AudioProfileManager.Scenario.MEETING));
            View view3 = mProfileSwitchDialog.findViewById(0x7f08007d);
            view3.setOnClickListener(mProfileSwitchListener);
            view3.setTag(AudioProfileManager.getProfileKey(com.mediatek.audioprofile.AudioProfileManager.Scenario.OUTDOOR));
            if (mCurrentScenario != null)
                loadEnabledProfileResource(mCurrentScenario);
        }
    }

    private void dismissProfileSwitchDialog(int i)
    {
        removeAllProfileSwitchDialogCallbacks();
        if (mProfileSwitchDialog != null)
            mHandler.postDelayed(mDismissProfileSwitchDialogRunnable, i);
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(Intent intent)
    {
        String s = intent.getStringExtra("state");
        if (s != null)
            return (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s);
        else
            return com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
    }

    public static int getTimeout(Context context)
    {
        int i;
        try
        {
            i = android.provider.Settings.System.getInt(context.getContentResolver(), "screen_off_timeout", 30000);
        }
        catch (Exception exception)
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("getTimeout: ").append(exception).toString());
            return 30000;
        }
        if (i <= 15000)
            return 15000;
        return i > 30000 ? 60000 : 30000;
    }

    private void initIconViews()
    {
        mWifiIcon = (ImageView)mWifiTileView.findViewById(0x7f08009f);
        mBluetoothIcon = (ImageView)mBluetoothTileView.findViewById(0x7f08008a);
        mGpsIcon = (ImageView)mGpsTileView.findViewById(0x7f080090);
        mMobileIcon = (ImageView)mMobileTileView.findViewById(0x7f08008e);
        mAirlineModeIcon = (ImageView)mAirlineModeTileView.findViewById(0x7f080080);
        mTimeoutIcon = (ImageView)mTimeoutTileView.findViewById(0x7f080099);
        mAutoRotateIcon = (ImageView)mAutoRotateTileView.findViewById(0x7f080085);
        mTimeoutIndicator = (ImageView)mTimeoutTileView.findViewById(0x7f08009a);
        mAudioProfileIcon = (ImageView)mAudioProfileTileView.findViewById(0x7f080083);
    }

    private void initLayout()
    {
        mDataConnLayout = (FrameLayout)mMobileTileView.findViewById(0x7f08008d);
        mBluetoothLayout = (FrameLayout)mBluetoothTileView.findViewById(0x7f080089);
        mWifiLayout = (FrameLayout)mWifiTileView.findViewById(0x7f08009e);
    }

    public static boolean isAirplaneModeOn(Context context)
    {
        int i = android.provider.Settings.Global.getInt(context.getContentResolver(), "airplane_mode_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    private boolean isWifiOnlyDevice()
    {
        Context context = mContext;
        Context _tmp = mContext;
        boolean flag = ((ConnectivityManager)context.getSystemService("connectivity")).isNetworkSupported(0);
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }

    private void loadDisabledProfileResouceForAll()
    {
        mNormalProfileIcon.setImageResource(0x7f020071);
        mMettingProfileIcon.setImageResource(0x7f020066);
        mOutdoorSwitchIcon.setImageResource(0x7f020075);
        mMuteProfileIcon.setImageResource(0x7f020070);
    }

    private void loadEnabledProfileResource(com.mediatek.audioprofile.AudioProfileManager.Scenario scenario)
    {
        Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("loadEnabledProfileResource called, profile is: ").append(scenario).toString());
        mCurrentScenario = scenario;
        switch (_cls21..SwitchMap.com.mediatek.audioprofile.AudioProfileManager.Scenario[scenario.ordinal()])
        {
        case 5: // '\005'
            mAudioProfileIcon.setImageResource(0x7f020056);
            // fall through

        default:
            mAudioProfileIcon.setImageResource(0x7f020056);
            return;

        case 4: // '\004'
            mMuteProfileIcon.setImageResource(0x7f02006f);
            mAudioProfileIcon.setImageResource(0x7f02009a);
            return;

        case 3: // '\003'
            mOutdoorSwitchIcon.setImageResource(0x7f020078);
            mAudioProfileIcon.setImageResource(0x7f020076);
            return;

        case 2: // '\002'
            mMettingProfileIcon.setImageResource(0x7f020065);
            mAudioProfileIcon.setImageResource(0x7f020063);
            return;

        case 1: // '\001'
            mNormalProfileIcon.setImageResource(0x7f020073);
            mAudioProfileIcon.setImageResource(0x7f02005b);
            return;
        }
    }

    private void onAirplaneModeChanged()
    {
        boolean flag = isAirplaneModeOn(mContext);
        if (flag)
        {
            for (int i = 0; i < 0 + PhoneConstants.GEMINI_SIM_NUM; i++)
                if (mServiceStateGemini[i] != 3)
                {
                    Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("Unfinish! mServiceStateGemini:").append(mServiceStateGemini[i]).append(" for simId = ").append(i).toString());
                    return;
                }

        }
        Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("onServiceStateChanged called, inAirplaneMode is: ").append(flag).toString());
        Intent intent = new Intent();
        intent.putExtra("state", flag);
        mAirlineModeStateTracker.onActualStateChange(mContext, intent);
        mAirlineModeStateTracker.setImageViewResources(mContext);
    }

    private void removeAllProfileSwitchDialogCallbacks()
    {
        mHandler.removeCallbacks(mDismissProfileSwitchDialogRunnable);
    }

    private void showProfileSwitchDialog()
    {
        createProfileSwitchDialog();
        if (!mProfileSwitchDialog.isShowing())
        {
            try
            {
                WindowManagerGlobal.getWindowManagerService().dismissKeyguard();
            }
            catch (RemoteException remoteexception) { }
            mProfileSwitchDialog.show();
            dismissProfileSwitchDialog(4000);
        }
    }

    private void stopFrameAnim()
    {
        ImageView imageview = mMobileStateTracker.getSwitchingGifView();
        if (imageview != null)
        {
            imageview.setVisibility(8);
            AnimationDrawable animationdrawable = (AnimationDrawable)imageview.getDrawable();
            if (animationdrawable != null && animationdrawable.isRunning())
                animationdrawable.stop();
        }
    }

    private void toggleTimeout(Context context)
    {
        ContentResolver contentresolver;
        int i;
        contentresolver = context.getContentResolver();
        i = android.provider.Settings.System.getInt(contentresolver, "screen_off_timeout", 30000);
        Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("toggleTimeout, before is ").append(i).toString());
        int j;
        if (i <= 15000)
            j = 30000;
        else
        if (i <= 30000)
            j = 60000;
        else
            j = 15000;
        try
        {
            android.provider.Settings.System.putInt(contentresolver, "screen_off_timeout", j);
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("toggleTimeout, after is ").append(j).toString());
            return;
        }
        catch (Exception exception)
        {
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("toggleTimeout: ").append(exception).toString());
        }
        return;
    }

    private void updateAudioProfile(String s)
    {
        if (s == null)
        {
            return;
        } else
        {
            Xlog.i("QuickSettingsConnectionModel", (new StringBuilder()).append("updateAudioProfile called, selected profile is: ").append(s).toString());
            mProfileManager.setActiveProfile(s);
            Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("updateAudioProfile called, setActiveProfile is: ").append(s).toString());
            return;
        }
    }

    private void updateProfileView(com.mediatek.audioprofile.AudioProfileManager.Scenario scenario)
    {
        loadDisabledProfileResouceForAll();
        loadEnabledProfileResource(scenario);
    }

    private boolean wasItTheMonkey()
    {
        ActivityManager _tmp = (ActivityManager)mContext.getSystemService("activity");
        if (ActivityManager.isUserAMonkey())
        {
            Xlog.d("QuickSettingsConnectionModel", "it was the monkey");
            return true;
        } else
        {
            Xlog.d("QuickSettingsConnectionModel", "it was an user");
            return false;
        }
    }

    public void buildIconViews()
    {
        mAudioManager = (AudioManager)mContext.getSystemService("audio");
        mProfileManager = (AudioProfileManager)mContext.getSystemService("audioprofile");
        mWifiStateTracker = new WifiStateTracker();
        mBluetoothStateTracker = new BluetoothStateTracker();
        mGpsStateTracker = new GpsStateTracker();
        if (!isWifiOnlyDevice())
            mMobileStateTracker = new MobileStateTracker();
        mAirlineModeStateTracker = new AirlineModeStateTracker();
        mTimeoutStateTracker = new TimeoutStateTracker();
        mAutoRotationStateTracker = new AutoRotationStateTracker();
        mWifiTileView.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                if (!wasItTheMonkey())
                {
                    WifiManager wifimanager = (WifiManager)mContext.getSystemService("wifi");
                    if (wifimanager != null)
                    {
                        int i = wifimanager.getWifiApState();
                        if (i == 12 || i == 13)
                            wifimanager.setWifiApEnabled(null, false);
                    }
                    mWifiStateTracker.toggleState(mContext);
                }
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        mBluetoothTileView.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                mBluetoothStateTracker.toggleState(mContext);
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        mGpsTileView.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                mGpsStateTracker.toggleState(mContext);
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        if (!isWifiOnlyDevice())
            mMobileTileView.setOnClickListener(new android.view.View.OnClickListener() {

                final QuickSettingsConnectionModel this$0;

                public void onClick(View view)
                {
                    if (!wasItTheMonkey() && !mMobileStateTracker.isDataDialogShown() && (mSwitchDialog == null || !mSwitchDialog.isShowing()))
                    {
                        mMobileStateTracker.toggleState(mContext);
                        return;
                    } else
                    {
                        return;
                    }
                }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
            }
);
        mAirlineModeTileView.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                if (!wasItTheMonkey())
                {
                    Xlog.d("ClickEvent", "AirPlane button click");
                    mAirlineModeStateTracker.setAirPlaneModeClickable(false);
                    mAirlineModeStateTracker.toggleState(mContext);
                    (new Handler()).postDelayed(new Runnable() {

                        final _cls11 this$1;

                        public void run()
                        {
                            mAirlineModeStateTracker.setAirPlaneModeClickable(true);
                            mAirlineModeTileView.setEnabled(mAirlineModeStateTracker.isClickable());
                        }

            
            {
                this$1 = _cls11.this;
                super();
            }
                    }
, 600L);
                }
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        mTimeoutTileView.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                mTimeoutStateTracker.toggleState(mContext);
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        mAutoRotateTileView.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                mAutoRotationStateTracker.toggleState(mContext);
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        mAudioProfileTileView.setOnClickListener(new android.view.View.OnClickListener() {

            final QuickSettingsConnectionModel this$0;

            public void onClick(View view)
            {
                showProfileSwitchDialog();
            }

            
            {
                this$0 = QuickSettingsConnectionModel.this;
                super();
            }
        }
);
        createProfileSwitchDialog();
    }

    public void dismissDialogs()
    {
        if (mSwitchDialog != null)
            mSwitchDialog.dismiss();
    }

    public void initConfigurationState()
    {
        boolean flag = isAirplaneModeOn(mContext);
        if (PluginFactory.getStatusBarPlugin(mContext).supportDisableWifiAtAirplaneMode())
            mWifiStateTracker.setAirlineMode(flag);
        mWifiStateTracker.setImageViewResources(mContext);
        mBluetoothStateTracker.setImageViewResources(mContext);
        mGpsStateTracker.setImageViewResources(mContext);
        mAirlineModeStateTracker.setImageViewResources(mContext);
        if (!isWifiOnlyDevice())
        {
            mMobileStateTracker.setAirlineMode(flag);
            mMobileStateTracker.setHasSim(false);
            mMobileStateTracker.setCurrentState(mContext, 0);
            mMobileStateTracker.setImageViewResources(mContext);
            mSimCardReady = SystemProperties.getBoolean("gsm.siminfo.ready", false);
            if (mSimCardReady)
            {
                Xlog.d("QuickSettingsConnectionModel", "Oops, sim ready, maybe phone is drop down and restarted");
                List list = SIMHelper.getSIMInfoList(mContext);
                if (list != null && list.size() > 0)
                    mMobileStateTracker.setHasSim(true);
                else
                    mMobileStateTracker.setHasSim(false);
                mMobileTileView.setEnabled(mMobileStateTracker.isClickable());
                mMobileStateTracker.setImageViewResources(mContext);
            }
        }
        mTimeoutStateTracker.setImageViewResources(mContext);
        mAutoRotationStateTracker.setImageViewResources(mContext);
        if (mProfileManager.getActiveProfileKey() != null)
            updateProfileView(AudioProfileManager.getScenario(mProfileManager.getActiveProfileKey()));
    }

    public void setQuickSettingsTileView(View view, View view1, View view2, View view3, View view4, View view5, View view6, 
            View view7)
    {
        mWifiTileView = view;
        mBluetoothTileView = view1;
        mGpsTileView = view2;
        mMobileTileView = view3;
        mAirlineModeTileView = view4;
        mTimeoutTileView = view5;
        mAutoRotateTileView = view6;
        mAudioProfileTileView = view7;
        initLayout();
        initIconViews();
    }

    public void setStatusBarService(PhoneStatusBar phonestatusbar)
    {
        mStatusBarService = phonestatusbar;
    }

    public void setUpdates(boolean flag)
    {
label0:
        {
            if (flag != mUpdating)
            {
                mProfileKeys = new ArrayList();
                mProfileKeys = mProfileManager.getPredefinedProfileKeys();
                mUpdating = flag;
                if (!flag)
                    break label0;
                IntentFilter intentfilter = new IntentFilter();
                intentfilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
                intentfilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
                intentfilter.addAction("android.location.PROVIDERS_CHANGED");
                intentfilter.addAction("android.intent.action.ANY_DATA_STATE");
                intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
                intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
                intentfilter.addAction("com.android.mms.transaction.START");
                intentfilter.addAction("com.android.mms.transaction.STOP");
                intentfilter.addAction("android.intent.action.ACTION_PREBOOT_IPO");
                mContext.registerReceiver(mIntentReceiver, intentfilter);
                mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("gprs_connection_sim_setting"), true, mMobileStateChangeObserver);
                TelephonyManager _tmp = (TelephonyManager)mContext.getSystemService("phone");
                for (int j = 0; j < 0 + PhoneConstants.GEMINI_SIM_NUM; j++)
                    SIMHelper.listen(mPhoneStateListenerGemini, 1, j);

                mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("screen_off_timeout"), true, mTimeoutChangeObserver);
                mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("accelerometer_rotation"), true, mAutoRotationChangeObserver);
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("setUpdates: listenAudioProfie with mAudioProfileListenr = ").append(mAudioProfileListenr).toString());
                mProfileManager.listenAudioProfie(mAudioProfileListenr, 1);
            }
            return;
        }
        mContext.unregisterReceiver(mIntentReceiver);
        mContext.getContentResolver().unregisterContentObserver(mMobileStateChangeObserver);
        TelephonyManager _tmp1 = (TelephonyManager)mContext.getSystemService("phone");
        for (int i = 0; i < 0 + PhoneConstants.GEMINI_SIM_NUM; i++)
            SIMHelper.listen(mPhoneStateListenerGemini, 0, i);

        mContext.getContentResolver().unregisterContentObserver(mTimeoutChangeObserver);
        mContext.getContentResolver().unregisterContentObserver(mAutoRotationChangeObserver);
        mProfileManager.listenAudioProfie(mAudioProfileListenr, 0);
    }

    public void updateForSimReady()
    {
        Xlog.d("QuickSettingsConnectionModel", "Panel sim ready called");
        if (!isWifiOnlyDevice())
        {
            mSimCardReady = true;
            List list = SIMHelper.getSIMInfoList(mContext);
            if (list != null && list.size() > 0)
                mMobileStateTracker.setHasSim(true);
            else
                mMobileStateTracker.setHasSim(false);
            mMobileTileView.setEnabled(mMobileStateTracker.isClickable());
            mMobileStateTracker.setImageViewResources(mContext);
        }
    }

    public void updateResources()
    {
        ((TextView)mWifiTileView.findViewById(0x7f0800a0)).setText(0x7f0b000d);
        ((TextView)mBluetoothTileView.findViewById(0x7f08008b)).setText(0x7f0b000e);
        ((TextView)mGpsTileView.findViewById(0x7f080091)).setText(0x7f0b0010);
        if (!isWifiOnlyDevice())
            ((TextView)mMobileTileView.findViewById(0x7f08008f)).setText(0x7f0b000f);
        ((TextView)mTimeoutTileView.findViewById(0x7f08009b)).setText(0x7f0b0018);
        ((TextView)mAutoRotateTileView.findViewById(0x7f080086)).setText(0x7f0b0011);
        ((TextView)mAudioProfileTileView.findViewById(0x7f080084)).setText(0x7f0b0033);
        ((TextView)mAirlineModeTileView.findViewById(0x7f080081)).setText(0x7f0b0016);
        if (mSwitchDialog != null)
            mSwitchDialog.setTitle(0x7f0b000f);
        if (mSwitchListview != null)
            mSwitchListview.updateResources();
        Dialog dialog = mProfileSwitchDialog;
        boolean flag = false;
        if (dialog != null)
        {
            removeAllProfileSwitchDialogCallbacks();
            flag = mProfileSwitchDialog.isShowing();
            mProfileSwitchDialog.dismiss();
        }
        mProfileSwitchDialog = null;
        if (flag)
            showProfileSwitchDialog();
    }

    public void updateSimInfo(Intent intent)
    {
        if (!isWifiOnlyDevice() && intent.getIntExtra("type", -1) == 1)
        {
            long l = intent.getLongExtra("simid", -1L);
            long l1 = SIMHelper.getDefaultSIM(mContext, "gprs_connection_sim_setting");
            if (l == l1 && l1 > 0L)
            {
                Xlog.d("QuickSettingsConnectionModel", (new StringBuilder()).append("sim setting changed, simId is ").append(l).toString());
                mMobileStateTracker.setImageViewResources(mContext);
            }
        }
    }








/*
    static SimIconsListView access$1502(QuickSettingsConnectionModel quicksettingsconnectionmodel, SimIconsListView simiconslistview)
    {
        quicksettingsconnectionmodel.mSwitchListview = simiconslistview;
        return simiconslistview;
    }

*/



/*
    static AlertDialog access$1602(QuickSettingsConnectionModel quicksettingsconnectionmodel, AlertDialog alertdialog)
    {
        quicksettingsconnectionmodel.mSwitchDialog = alertdialog;
        return alertdialog;
    }

*/










/*
    static ImageView access$3002(QuickSettingsConnectionModel quicksettingsconnectionmodel, ImageView imageview)
    {
        quicksettingsconnectionmodel.mWifiSwitchIngGifView = imageview;
        return imageview;
    }

*/


/*
    static int access$302(QuickSettingsConnectionModel quicksettingsconnectionmodel, int i)
    {
        quicksettingsconnectionmodel.mServiceState1 = i;
        return i;
    }

*/






/*
    static ImageView access$3402(QuickSettingsConnectionModel quicksettingsconnectionmodel, ImageView imageview)
    {
        quicksettingsconnectionmodel.mBluetoothSwitchIngGifView = imageview;
        return imageview;
    }

*/













/*
    static ImageView access$4902(QuickSettingsConnectionModel quicksettingsconnectionmodel, ImageView imageview)
    {
        quicksettingsconnectionmodel.mDataConnSwitchIngGifView = imageview;
        return imageview;
    }

*/



















}
