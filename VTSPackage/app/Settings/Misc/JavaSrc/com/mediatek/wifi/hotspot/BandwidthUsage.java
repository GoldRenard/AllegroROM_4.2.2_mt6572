// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.wifi.hotspot;

import android.animation.LayoutTransition;
import android.app.*;
import android.content.*;
import android.net.IConnectivityManager;
import android.os.*;
import android.view.*;
import android.widget.*;
import com.android.settings.fuelgauge.Utils;
import com.google.android.collect.Lists;
import com.mediatek.widget.ChartBandwidthUsageView;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

public class BandwidthUsage extends Fragment
{
    public class LimitEditorFragment extends DialogFragment
    {

        final BandwidthUsage this$0;

        public Dialog onCreateDialog(Bundle bundle)
        {
            Activity activity = getActivity();
            BandwidthUsage _tmp = (BandwidthUsage)getTargetFragment();
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(activity);
            View view = LayoutInflater.from(builder.getContext()).inflate(0x7f040027, null, false);
            NumberPicker numberpicker = (NumberPicker)view.findViewById(0x7f080048);
            long l = mChart.getLimitBytes();
            numberpicker.setMaxValue(10);
            numberpicker.setMinValue(0);
            numberpicker.setValue((int)(l / 0x100000L));
            numberpicker.setWrapSelectorWheel(false);
            builder.setTitle(0x7f0b08c0);
            builder.setView(view);
            builder.setPositiveButton(0x7f0b08be, numberpicker. new android.content.DialogInterface.OnClickListener() {

                final LimitEditorFragment this$1;
                final NumberPicker val$bytesPicker;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    bytesPicker.clearFocus();
                    long l = 0x100000L * (long)bytesPicker.getValue();
                    mChart.setLimitBytes(l);
                    Xlog.d("BandwidthUsage", (new StringBuilder()).append("set Limit Bytes=").append(l).toString());
                    mChart.updateVertAxisBounds(null);
                    setLimitData(true);
                }

            
            {
                this$1 = final_limiteditorfragment;
                bytesPicker = NumberPicker.this;
                super();
            }
            }
);
            return builder.create();
        }

        public LimitEditorFragment()
        {
            this$0 = BandwidthUsage.this;
            super();
        }
    }


    private static final int EVENT_TICK = 1;
    private static final long GB_IN_BYTES = 0x40000000L;
    private static final String IFACE = "ap0";
    private static final long KB_IN_BYTES = 1024L;
    private static final int LIMIT_MAX_SIZE = 10;
    private static final long MB_IN_BYTES = 0x100000L;
    private static final String NETWORK_INFO = "network_info";
    private static final String NETWORK_LIMIT = "network_limit";
    private static final String TAG = "BandwidthUsage";
    private static final String TAG_LIMIT_EDITOR = "limitEditor";
    private ChartBandwidthUsageView mChart;
    private com.mediatek.widget.ChartBandwidthUsageView.BandwidthChartListener mChartListener;
    private IConnectivityManager mConnManager;
    private CheckBox mEnableThrottling;
    private View mEnableThrottlingView;
    private android.view.ViewTreeObserver.OnGlobalLayoutListener mFirstLayoutListener;
    private Handler mHandler;
    private IntentFilter mIntentFilter;
    private INetworkManagementService mNetworkService;
    private android.view.View.OnClickListener mOnEnableCheckBoxClick;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final BandwidthUsage this$0;

        public void onReceive(Context context, Intent intent)
        {
            int i = 1;
            String s = intent.getAction();
            if ("android.intent.action.AIRPLANE_MODE".equals(s))
            {
                mHandler.removeMessages(i);
                if (android.provider.Settings.System.getInt(getActivity().getContentResolver(), "airplane_mode_on", 0) == 0)
                    i = 0;
                if (i != 0)
                {
                    mEnableThrottlingView.setEnabled(false);
                    getActivity().onBackPressed();
                }
            } else
            if ("android.net.wifi.WIFI_AP_STATE_CHANGED".equals(s) && intent.getIntExtra("wifi_state", 14) != 13)
            {
                getActivity().finish();
                return;
            }
        }

            
            {
                this$0 = BandwidthUsage.this;
                super();
            }
    }
;
    private long mStartTime;
    private View mTotalDataView;
    private View mTotalTimeView;

    public BandwidthUsage()
    {
        mStartTime = 0L;
        mHandler = new Handler() {

            final BandwidthUsage this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 1: // '\001'
                    updateBandwidthUsage();
                    sendEmptyMessageDelayed(1, 1000L);
                    return;
                }
            }

            
            {
                this$0 = BandwidthUsage.this;
                super();
            }
        }
;
        mFirstLayoutListener = new android.view.ViewTreeObserver.OnGlobalLayoutListener() {

            final BandwidthUsage this$0;

            public void onGlobalLayout()
            {
                LayoutTransition layouttransition = buildLayoutTransition();
                layouttransition.setStartDelay(2, 0L);
                layouttransition.setStartDelay(3, 0L);
                layouttransition.setAnimator(2, null);
                layouttransition.setAnimator(3, null);
                mChart.setLayoutTransition(layouttransition);
            }

            
            {
                this$0 = BandwidthUsage.this;
                super();
            }
        }
;
        mChartListener = new com.mediatek.widget.ChartBandwidthUsageView.BandwidthChartListener() {

            final BandwidthUsage this$0;

            public void onLimitChanged()
            {
                setLimitData(true);
                mHandler.sendEmptyMessageDelayed(1, 1000L);
            }

            public void onLimitChanging()
            {
                mHandler.removeMessages(1);
            }

            public void requestLimitEdit()
            {
                LimitEditorFragment limiteditorfragment = new LimitEditorFragment();
                limiteditorfragment.setTargetFragment(BandwidthUsage.this, 0);
                limiteditorfragment.show(getFragmentManager(), "limitEditor");
            }

            
            {
                this$0 = BandwidthUsage.this;
                super();
            }
        }
;
        mOnEnableCheckBoxClick = new android.view.View.OnClickListener() {

            final BandwidthUsage this$0;

            public void onClick(View view)
            {
                if (mEnableThrottling.isChecked())
                {
                    mEnableThrottling.setChecked(false);
                    setThrottleEnabled(false);
                    mChart.setLimitState(false);
                    setLimitData(false);
                    return;
                } else
                {
                    mEnableThrottling.setChecked(true);
                    setThrottleEnabled(true);
                    mChart.setLimitState(true);
                    Activity activity = getActivity();
                    getActivity();
                    long l = activity.getSharedPreferences("network_info", 1).getLong("network_limit", 1L);
                    Xlog.d("BandwidthUsage", (new StringBuilder()).append("init limit value=").append(l).toString());
                    mChart.setLimitBytes(l);
                    setLimitData(true);
                    return;
                }
            }

            
            {
                this$0 = BandwidthUsage.this;
                super();
            }
        }
;
    }

    private LayoutTransition buildLayoutTransition()
    {
        LayoutTransition layouttransition = new LayoutTransition();
        layouttransition.setAnimateParentHierarchy(false);
        return layouttransition;
    }

    private String[] checkIfacePairs(String as[])
    {
        ArrayList arraylist = Lists.newArrayList();
        if (as.length < 2)
            return null;
        for (int i = 0; i < as.length; i += 2)
            if (as[i] != null && !as[i].equals(as[i + 1]))
            {
                arraylist.add(as[i]);
                arraylist.add(as[i + 1]);
            }

        return (String[])arraylist.toArray(new String[arraylist.size()]);
    }

    private View inflatePreference(LayoutInflater layoutinflater, ViewGroup viewgroup, View view)
    {
        View view1 = layoutinflater.inflate(0x7f04005b, viewgroup, false);
        ((LinearLayout)view1.findViewById(0x1020018)).addView(view, new android.widget.LinearLayout.LayoutParams(-2, -2));
        return view1;
    }

    private void refreshTimeAndData()
    {
        long l = 0L;
        if (mStartTime != 0L)
            l = System.currentTimeMillis() - mStartTime;
        String s = Utils.formatElapsedTime(getActivity(), l);
        setPreferenceTitle(mTotalTimeView, 0x7f0b0178, (new StringBuilder()).append(" ").append(s).toString());
        long l1 = mChart.getTotalUsedData();
        ChartBandwidthUsageView _tmp = mChart;
        long l2;
        String s1;
        if (l1 < 0x100000L)
        {
            ChartBandwidthUsageView _tmp1 = mChart;
            l2 = l1 / 1024L;
            s1 = " KB";
        } else
        {
            ChartBandwidthUsageView _tmp2 = mChart;
            if (l1 < 0x40000000L)
            {
                ChartBandwidthUsageView _tmp3 = mChart;
                l2 = l1 / 0x100000L;
                s1 = " M";
            } else
            {
                ChartBandwidthUsageView _tmp4 = mChart;
                l2 = l1 / 0x40000000L;
                s1 = " G";
            }
        }
        setPreferenceTitle(mTotalDataView, 0x7f0b0179, (new StringBuilder()).append(" ").append(String.valueOf(l2)).append(s1).toString());
    }

    private void setLimitData(boolean flag)
    {
        int i = 1;
        if (!flag) goto _L2; else goto _L1
_L1:
        long l = mChart.getLimitBytes();
        if (l != 0L) goto _L4; else goto _L3
_L3:
        int j = i;
          goto _L5
_L7:
        android.content.SharedPreferences.Editor editor;
        Xlog.d("BandwidthUsage", (new StringBuilder()).append("setLimitData,setInterfaceThrottle,rxBytes=").append(j).append(",txBytes=").append(i).toString());
        mNetworkService.setInterfaceThrottle("ap0", j, i);
        Activity activity = getActivity();
        getActivity();
        editor = activity.getSharedPreferences("network_info", 2).edit();
          goto _L6
_L4:
        j = (int)(2L * (l * 8L)) / 3072;
          goto _L5
_L8:
        i = (int)(l * 8L) / 3072;
        break; /* Loop/switch isn't completed */
_L2:
        mNetworkService.setInterfaceThrottle("ap0", -1, -1);
        return;
_L6:
        if (l == 0L)
            l = 1L;
        try
        {
            editor.putLong("network_limit", l);
            editor.commit();
            return;
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("BandwidthUsage", " RemoteException happens when setInterfaceRxThrottle");
        }
        return;
_L5:
        if (l != 0L) goto _L8; else goto _L7
    }

    private void setPreferenceTitle(View view, int i)
    {
        ((TextView)view.findViewById(0x1020016)).setText(i);
    }

    private void setPreferenceTitle(View view, int i, String s)
    {
        String s1 = getActivity().getString(i, new Object[] {
            s
        });
        ((TextView)view.findViewById(0x1020016)).setText(s1);
    }

    private void setThrottleEnabled(boolean flag)
    {
        Xlog.d("BandwidthUsage", (new StringBuilder()).append("setThrottleEnabled:").append(flag).toString());
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Secure.putInt(getActivity().getContentResolver(), "interface_throttle_enable", i);
    }

    private void updateBandwidthUsage()
    {
        String as[];
        android.net.NetworkStats networkstats;
        try
        {
            as = checkIfacePairs(mConnManager.getTetheredIfacePairs());
        }
        catch (RemoteException remoteexception)
        {
            Xlog.d("BandwidthUsage", "RemoteException happens");
            return;
        }
        if (as == null)
            break MISSING_BLOCK_LABEL_39;
        networkstats = mNetworkService.getNetworkStatsTethering(as);
        mChart.setNetworkStates(networkstats);
        refreshTimeAndData();
        return;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mNetworkService = android.os.INetworkManagementService.Stub.asInterface(ServiceManager.getService("network_management"));
        mConnManager = android.net.IConnectivityManager.Stub.asInterface(ServiceManager.getService("connectivity"));
        mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        mIntentFilter.addAction("android.net.wifi.WIFI_AP_STATE_CHANGED");
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        Xlog.i("BandwidthUsage", "onCreateView");
        layoutinflater.getContext();
        View view = layoutinflater.inflate(0x7f0400a2, viewgroup, false);
        LinearLayout linearlayout = (LinearLayout)view.findViewById(0x7f0801d0);
        mEnableThrottling = new CheckBox(layoutinflater.getContext());
        mEnableThrottling.setClickable(false);
        mEnableThrottling.setFocusable(false);
        mEnableThrottlingView = inflatePreference(layoutinflater, linearlayout, mEnableThrottling);
        mEnableThrottlingView.setClickable(true);
        mEnableThrottlingView.setFocusable(true);
        mEnableThrottlingView.setOnClickListener(mOnEnableCheckBoxClick);
        linearlayout.addView(mEnableThrottlingView);
        setPreferenceTitle(mEnableThrottlingView, 0x7f0b0173);
        mChart = (ChartBandwidthUsageView)view.findViewById(0x7f08004a);
        mChart.setListener(mChartListener);
        LinearLayout linearlayout1 = (LinearLayout)view.findViewById(0x7f0801d1);
        mTotalTimeView = layoutinflater.inflate(0x7f04005b, linearlayout1, false);
        mTotalTimeView.setClickable(false);
        mTotalTimeView.setFocusable(false);
        linearlayout1.addView(mTotalTimeView);
        LinearLayout linearlayout2 = (LinearLayout)view.findViewById(0x7f0800b2);
        mTotalDataView = layoutinflater.inflate(0x7f04005b, linearlayout2, false);
        mTotalDataView.setClickable(false);
        mTotalDataView.setFocusable(false);
        linearlayout2.addView(mTotalDataView);
        return view;
    }

    public void onDestroy()
    {
        Xlog.d("BandwidthUsage", "onDestory");
        getActivity().setRequestedOrientation(4);
        super.onDestroy();
    }

    public void onDestroyView()
    {
        super.onDestroyView();
        mEnableThrottlingView = null;
    }

    public void onPause()
    {
        Xlog.d("BandwidthUsage", "onPause");
        super.onPause();
        getActivity().unregisterReceiver(mReceiver);
        mHandler.removeMessages(1);
    }

    public void onResume()
    {
        Xlog.d("BandwidthUsage", "onResume");
        super.onResume();
        getActivity().registerReceiver(mReceiver, mIntentFilter);
        boolean flag;
        if (android.provider.Settings.System.getInt(getActivity().getContentResolver(), "airplane_mode_on", 0) != 0)
            flag = true;
        else
            flag = false;
        if (flag)
            getActivity().onBackPressed();
        mHandler.sendEmptyMessageDelayed(1, 1000L);
        int i = android.provider.Settings.Secure.getInt(getActivity().getContentResolver(), "interface_throttle_enable", 0);
        boolean flag1 = false;
        if (i == 1)
            flag1 = true;
        Xlog.d("BandwidthUsage", (new StringBuilder()).append("onResume,getInterfaceRxThrottle=").append(flag1).toString());
        mEnableThrottling.setChecked(flag1);
        mChart.setLimitState(flag1);
        Activity activity = getActivity();
        getActivity();
        long l = activity.getSharedPreferences("network_info", 1).getLong("network_limit", 0L);
        Xlog.d("BandwidthUsage", (new StringBuilder()).append("init limit value=").append(l).toString());
        mChart.setLimitBytes(l);
        mChart.updateVertAxisBounds(null);
        mStartTime = android.provider.Settings.System.getLong(getActivity().getContentResolver(), "wifi_hotspot_start_time", 0L);
        Xlog.d("BandwidthUsage", (new StringBuilder()).append("mStartTime:").append(mStartTime).toString());
        refreshTimeAndData();
    }








}
