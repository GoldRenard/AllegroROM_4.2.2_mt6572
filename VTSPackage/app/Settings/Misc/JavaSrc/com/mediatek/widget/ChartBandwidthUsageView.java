// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.widget;

import android.content.Context;
import android.content.res.Resources;
import android.net.NetworkStats;
import android.os.Handler;
import android.os.Message;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.AttributeSet;
import com.android.internal.util.Objects;
import com.android.settings.widget.ChartAxis;
import com.android.settings.widget.InvertedChartAxis;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.widget:
//            ChartView, ChartSweepView, ChartBandwidthNetworkSeriesView, ChartBandwidthGridView

public class ChartBandwidthUsageView extends ChartView
{
    public static class BandwidthAxis
        implements ChartAxis
    {

        private static final Object SPAN_SIZE = new Object();
        private static final Object SPAN_UNIT = new Object();
        private long mMax;
        private long mMin;
        private float mSize;

        private int[] findOrCreateSpan(SpannableStringBuilder spannablestringbuilder, Object obj, CharSequence charsequence)
        {
            int i = spannablestringbuilder.getSpanStart(obj);
            int j = spannablestringbuilder.getSpanEnd(obj);
            if (i == -1)
            {
                i = TextUtils.indexOf(spannablestringbuilder, charsequence);
                j = i + charsequence.length();
                spannablestringbuilder.setSpan(obj, i, j, 18);
            }
            return (new int[] {
                i, j
            });
        }

        public long buildLabel(Resources resources, SpannableStringBuilder spannablestringbuilder, long l)
        {
            CharSequence charsequence;
            long l1;
            if (l < 0x100000L)
            {
                charsequence = resources.getText(0x7f0b017b);
                l1 = 1024L;
            } else
            {
                charsequence = resources.getText(0x7f0b017a);
                l1 = 0x100000L;
            }
            double d = (double)l / (double)l1;
            String s;
            double d1;
            if (l > 0x100000L && d < 10D)
            {
                Object aobj1[] = new Object[1];
                aobj1[0] = Double.valueOf(d);
                s = String.format("%.1f", aobj1);
                d1 = (l1 * Math.round(10D * d)) / 10L;
            } else
            {
                Object aobj[] = new Object[1];
                aobj[0] = Double.valueOf(d);
                s = String.format("%.0f", aobj);
                d1 = l1 * Math.round(d);
            }
            int ai[] = findOrCreateSpan(spannablestringbuilder, SPAN_SIZE, "^1");
            spannablestringbuilder.replace(ai[0], ai[1], s);
            int ai1[] = findOrCreateSpan(spannablestringbuilder, SPAN_UNIT, "^2");
            spannablestringbuilder.replace(ai1[0], ai1[1], charsequence);
            return (long)d1;
        }

        public float convertToPoint(long l)
        {
            return (float)(Math.pow(10D, -0.043281994520182526D + 0.36884343106175121D * Math.log10(((double)l - (double)mMin) / (double)(mMax - mMin))) * (double)mSize);
        }

        public long convertToValue(float f)
        {
            double d = 1.3102228476089057D * Math.pow(f / mSize, 2.7111774693164632D);
            return (long)((double)mMin + d * (double)(mMax - mMin));
        }

        public float[] getTickPoints()
        {
            long l = mMax - mMin;
            long l1;
            if (l < 0x300000L)
                l1 = 0x10000L;
            else
            if (l < 0x600000L)
                l1 = 0x20000L;
            else
                l1 = 0x40000L;
            float af[] = new float[(int)(l / l1)];
            long l2 = mMin;
            for (int i = 0; i < af.length; i++)
            {
                af[i] = convertToPoint(l2);
                l2 += l1;
            }

            return af;
        }

        public int hashCode()
        {
            Object aobj[] = new Object[3];
            aobj[0] = Long.valueOf(mMin);
            aobj[1] = Long.valueOf(mMax);
            aobj[2] = Float.valueOf(mSize);
            return Objects.hashCode(aobj);
        }

        public boolean setBounds(long l, long l1)
        {
            if (mMin == l && mMax == l1)
            {
                return false;
            } else
            {
                mMin = l;
                mMax = l1;
                return true;
            }
        }

        public boolean setSize(float f)
        {
            if (mSize != f)
            {
                mSize = f;
                return true;
            } else
            {
                return false;
            }
        }

        public int shouldAdjustAxis(long l)
        {
            float f = convertToPoint(l);
            if ((double)f < 0.5D * (double)mSize)
                return -1;
            return (double)f <= 0.84999999999999998D * (double)mSize ? 0 : 1;
        }


    }

    public static interface BandwidthChartListener
    {

        public abstract void onLimitChanged();

        public abstract void onLimitChanging();

        public abstract void requestLimitEdit();
    }

    public class TimeAxis
        implements ChartAxis
    {

        private static final long TICK_INTERVAL = 5L;
        private long mMax;
        private long mMin;
        private float mSize;
        final ChartBandwidthUsageView this$0;

        public long buildLabel(Resources resources, SpannableStringBuilder spannablestringbuilder, long l)
        {
            spannablestringbuilder.replace(0, spannablestringbuilder.length(), Long.toString(l));
            return l;
        }

        public float convertToPoint(long l)
        {
            return (mSize * (float)(l - mMin)) / (float)(mMax - mMin);
        }

        public long convertToValue(float f)
        {
            return (long)((float)mMin + (f * (float)(mMax - mMin)) / mSize);
        }

        public float[] getTickPoints()
        {
            int i = (int)((mMax - mMin) / 5L);
            float af[] = new float[i];
            for (int j = 0; j < i; j++)
                af[j] = convertToPoint(mMax - 5L * (long)(j + 1));

            return af;
        }

        public int hashCode()
        {
            Object aobj[] = new Object[3];
            aobj[0] = Long.valueOf(mMin);
            aobj[1] = Long.valueOf(mMax);
            aobj[2] = Float.valueOf(mSize);
            return Objects.hashCode(aobj);
        }

        public boolean setBounds(long l, long l1)
        {
            if (mMin == l && mMax == l1)
            {
                return false;
            } else
            {
                mMin = l;
                mMax = l1;
                return true;
            }
        }

        public boolean setSize(float f)
        {
            if (mSize != f)
            {
                mSize = f;
                return true;
            } else
            {
                return false;
            }
        }

        public int shouldAdjustAxis(long l)
        {
            return 0;
        }

        public TimeAxis()
        {
            this$0 = ChartBandwidthUsageView.this;
            super();
            setBounds(0L, 100L);
        }
    }


    private static final int DELAY_MILLIS = 250;
    public static final long GB_IN_BYTES = 0x40000000L;
    public static final long KB_IN_BYTES = 1024L;
    private static final long MAX_SIZE = 0xa00000L;
    public static final long MB_IN_BYTES = 0x100000L;
    private static final int MSG_UPDATE_AXIS = 100;
    private static final String TAG = "ChartBandwidthUsageView";
    private ChartBandwidthGridView mGrid;
    private Handler mHandler = new Handler() {

        final ChartBandwidthUsageView this$0;

        public void handleMessage(Message message)
        {
            ChartSweepView chartsweepview = (ChartSweepView)message.obj;
            updateVertAxisBounds(chartsweepview);
            sendUpdateAxisDelayed(chartsweepview, true);
        }

            
            {
                this$0 = ChartBandwidthUsageView.this;
                super();
            }
    }
;
    private BandwidthChartListener mListener;
    private ChartBandwidthNetworkSeriesView mSeries;
    private ChartSweepView mSweepLimit;
    private ChartSweepView.OnSweepListener mVertListener = new ChartSweepView.OnSweepListener() {

        final ChartBandwidthUsageView this$0;

        public void onSweep(ChartSweepView chartsweepview, boolean flag)
        {
            if (flag)
            {
                clearUpdateAxisDelayed(chartsweepview);
                if (chartsweepview == mSweepLimit && mListener != null)
                    mListener.onLimitChanged();
                return;
            } else
            {
                sendUpdateAxisDelayed(chartsweepview, false);
                mListener.onLimitChanging();
                return;
            }
        }

        public void requestEdit(ChartSweepView chartsweepview)
        {
            if (chartsweepview == mSweepLimit && mListener != null)
                mListener.requestLimitEdit();
        }

            
            {
                this$0 = ChartBandwidthUsageView.this;
                super();
            }
    }
;
    private long mVertMax;

    public ChartBandwidthUsageView(Context context)
    {
        this(context, null, 0);
    }

    public ChartBandwidthUsageView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartBandwidthUsageView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        init(new TimeAxis(), new InvertedChartAxis(new BandwidthAxis()));
    }

    private void clearUpdateAxisDelayed(ChartSweepView chartsweepview)
    {
        mHandler.removeMessages(100, chartsweepview);
    }

    private void sendUpdateAxisDelayed(ChartSweepView chartsweepview, boolean flag)
    {
        if (flag || !mHandler.hasMessages(100, chartsweepview))
            mHandler.sendMessageDelayed(mHandler.obtainMessage(100, chartsweepview), 250L);
    }

    public long getLimitBytes()
    {
        return mSweepLimit.getLabelValue();
    }

    public long getTotalUsedData()
    {
        return mSeries.getTotalUsedData();
    }

    protected void onFinishInflate()
    {
        Xlog.d("ChartBandwidthUsageView", "onFinishInflate");
        super.onFinishInflate();
        mGrid = (ChartBandwidthGridView)findViewById(0x7f08004b);
        mSeries = (ChartBandwidthNetworkSeriesView)findViewById(0x7f08004c);
        mSweepLimit = (ChartSweepView)findViewById(0x7f080051);
        mSweepLimit.setMaxValue(0xa00000L);
        mSweepLimit.addOnSweepListener(mVertListener);
        mSweepLimit.setDragInterval(2048L);
        mGrid.init(super.mHoriz, super.mVert);
        mSeries.init(super.mHoriz, super.mVert);
        mSweepLimit.init(super.mVert);
        mSweepLimit.setEnabled(true);
        updateVertAxisBounds(mSweepLimit);
    }

    public void setLimitBytes(long l)
    {
        mSweepLimit.setValue(l);
    }

    public void setLimitState(boolean flag)
    {
        ChartSweepView chartsweepview = mSweepLimit;
        byte byte0;
        if (flag)
            byte0 = 0;
        else
            byte0 = 4;
        chartsweepview.setVisibility(byte0);
    }

    public void setListener(BandwidthChartListener bandwidthchartlistener)
    {
        mListener = bandwidthchartlistener;
    }

    public void setNetworkStates(NetworkStats networkstats)
    {
        mSeries.setNetworkStates(networkstats);
    }

    public void updateVertAxisBounds(ChartSweepView chartsweepview)
    {
        long l = mVertMax;
        long l1 = 0L;
        if (chartsweepview != null)
        {
            int i = chartsweepview.shouldAdjustAxis();
            if (i > 0)
                l1 = (11L * l) / 10L;
            else
            if (i < 0)
                l1 = (9L * l) / 10L;
            else
                l1 = l;
        }
        long l2 = Math.max(Math.max(Math.max((12L * mSeries.getMaxBytes()) / 10L, 0x80000L), (11L * mSweepLimit.getValue()) / 10L), l1);
        if (l2 > 0xa00000L)
            l2 = 0xa00000L;
        if (l2 != mVertMax)
        {
            mVertMax = l2;
            boolean flag = super.mVert.setBounds(0L, l2);
            mSweepLimit.setValidRange(0L, l2);
            if (flag)
                mSeries.invalidatePath();
            mGrid.invalidate();
            if (chartsweepview != null)
                chartsweepview.updateValueFromPosition();
            if (mSweepLimit != chartsweepview)
                layoutSweep(mSweepLimit);
        }
    }




}
