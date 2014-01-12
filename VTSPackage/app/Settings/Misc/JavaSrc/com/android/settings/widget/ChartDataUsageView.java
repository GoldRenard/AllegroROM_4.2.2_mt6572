// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.Context;
import android.content.res.Resources;
import android.net.NetworkPolicy;
import android.net.NetworkStatsHistory;
import android.os.Handler;
import android.os.Message;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.format.Time;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.android.internal.util.Objects;
import java.util.Arrays;
import java.util.Calendar;

// Referenced classes of package com.android.settings.widget:
//            ChartView, InvertedChartAxis, ChartNetworkSeriesView, ChartSweepView, 
//            ChartAxis, ChartGridView

public class ChartDataUsageView extends ChartView
{
    public static class DataAxis
        implements ChartAxis
    {

        private static final boolean LOG_SCALE = true;
        private static final Object sSpanSize = new Object();
        private static final Object sSpanUnit = new Object();
        private long mMax;
        private long mMin;
        private float mSize;

        public long buildLabel(Resources resources, SpannableStringBuilder spannablestringbuilder, long l)
        {
            CharSequence charsequence;
            long l1;
            if (l < 0x3e800000L)
            {
                charsequence = resources.getText(0x104006e);
                l1 = 0x100000L;
            } else
            {
                charsequence = resources.getText(0x104006f);
                l1 = 0x40000000L;
            }
            double d = (double)l / (double)l1;
            String s;
            double d1;
            if (d < 10D)
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
            ChartDataUsageView.setText(spannablestringbuilder, sSpanSize, s, "^1");
            ChartDataUsageView.setText(spannablestringbuilder, sSpanUnit, charsequence, "^2");
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
            long l1 = ChartDataUsageView.roundUpToPowerOfTwo(l / 16L);
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
            if ((double)f < 0.10000000000000001D * (double)mSize)
                return -1;
            return (double)f <= 0.84999999999999998D * (double)mSize ? 0 : 1;
        }


    }

    public static interface DataUsageChartListener
    {

        public abstract void onInspectRangeChanged();

        public abstract void onLimitChanged();

        public abstract void onWarningChanged();

        public abstract void requestLimitEdit();

        public abstract void requestWarningEdit();
    }

    public static class TimeAxis
        implements ChartAxis
    {

        private static final int FIRST_DAY_OF_WEEK = -1 + Calendar.getInstance().getFirstDayOfWeek();
        private long mMax;
        private long mMin;
        private float mSize;

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
            float af[] = new float[32];
            int i = 0;
            Time time = new Time();
            time.set(mMax);
            time.monthDay = time.monthDay - (time.weekDay - FIRST_DAY_OF_WEEK);
            time.second = 0;
            time.minute = 0;
            time.hour = 0;
            time.normalize(true);
            for (long l = time.toMillis(true); l > mMin; l = time.toMillis(true))
            {
                if (l <= mMax)
                {
                    int j = i + 1;
                    af[i] = convertToPoint(l);
                    i = j;
                }
                time.monthDay = -7 + time.monthDay;
                time.normalize(true);
            }

            return Arrays.copyOf(af, i);
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
            long l = System.currentTimeMillis();
            setBounds(l - 0x9a7ec800L, l);
        }
    }


    private static final long DELAY_MILLIS = 250L;
    private static final long LIMIT_MAX_SIZE = 0xf9c0000000L;
    private static final boolean LIMIT_SWEEPS_TO_VALID_DATA = false;
    private static final int MSG_UPDATE_AXIS = 100;
    private static final long WARNING_MAX_SIZE = 0xe100000000L;
    private ChartNetworkSeriesView mDetailSeries;
    private ChartGridView mGrid;
    private Handler mHandler = new Handler() {

        final ChartDataUsageView this$0;

        public void handleMessage(Message message)
        {
            ChartSweepView chartsweepview = (ChartSweepView)message.obj;
            updateVertAxisBounds(chartsweepview);
            updateEstimateVisible();
            sendUpdateAxisDelayed(chartsweepview, true);
        }

            
            {
                this$0 = ChartDataUsageView.this;
                super();
            }
    }
;
    private NetworkStatsHistory mHistory;
    private ChartSweepView.OnSweepListener mHorizListener = new ChartSweepView.OnSweepListener() {

        final ChartDataUsageView this$0;

        public void onSweep(ChartSweepView chartsweepview, boolean flag)
        {
            updatePrimaryRange();
            if (flag && mListener != null)
                mListener.onInspectRangeChanged();
        }

        public void requestEdit(ChartSweepView chartsweepview)
        {
        }

            
            {
                this$0 = ChartDataUsageView.this;
                super();
            }
    }
;
    private DataUsageChartListener mListener;
    private ChartNetworkSeriesView mSeries;
    private ChartSweepView mSweepLeft;
    private ChartSweepView mSweepLimit;
    private ChartSweepView mSweepRight;
    private ChartSweepView mSweepWarning;
    private ChartSweepView.OnSweepListener mVertListener = new ChartSweepView.OnSweepListener() {

        final ChartDataUsageView this$0;

        public void onSweep(ChartSweepView chartsweepview, boolean flag)
        {
            if (flag)
            {
                clearUpdateAxisDelayed(chartsweepview);
                updateEstimateVisible();
                if (chartsweepview == mSweepWarning && mListener != null)
                    mListener.onWarningChanged();
                else
                if (chartsweepview == mSweepLimit && mListener != null)
                {
                    mListener.onLimitChanged();
                    return;
                }
                return;
            } else
            {
                sendUpdateAxisDelayed(chartsweepview, false);
                return;
            }
        }

        public void requestEdit(ChartSweepView chartsweepview)
        {
            if (chartsweepview == mSweepWarning && mListener != null)
                mListener.requestWarningEdit();
            else
            if (chartsweepview == mSweepLimit && mListener != null)
            {
                mListener.requestLimitEdit();
                return;
            }
        }

            
            {
                this$0 = ChartDataUsageView.this;
                super();
            }
    }
;
    private long mVertMax;

    public ChartDataUsageView(Context context)
    {
        this(context, null, 0);
    }

    public ChartDataUsageView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartDataUsageView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        init(new TimeAxis(), new InvertedChartAxis(new DataAxis()));
    }

    private void clearUpdateAxisDelayed(ChartSweepView chartsweepview)
    {
        mHandler.removeMessages(100, chartsweepview);
    }

    private long getHistoryEnd()
    {
        if (mHistory != null)
            return mHistory.getEnd();
        else
            return 0x8000000000000000L;
    }

    private long getHistoryStart()
    {
        if (mHistory != null)
            return mHistory.getStart();
        else
            return 0x7fffffffffffffffL;
    }

    private static long roundUpToPowerOfTwo(long l)
    {
        long l1 = l - 1L;
        long l2 = l1 | l1 >>> 1;
        long l3 = l2 | l2 >>> 2;
        long l4 = l3 | l3 >>> 4;
        long l5 = l4 | l4 >>> 8;
        long l6 = l5 | l5 >>> 16;
        long l7 = 1L + (l6 | l6 >>> 32);
        if (l7 > 0L)
            return l7;
        else
            return 0x7fffffffffffffffL;
    }

    private void sendUpdateAxisDelayed(ChartSweepView chartsweepview, boolean flag)
    {
        if (flag || !mHandler.hasMessages(100, chartsweepview))
            mHandler.sendMessageDelayed(mHandler.obtainMessage(100, chartsweepview), 250L);
    }

    private static void setText(SpannableStringBuilder spannablestringbuilder, Object obj, CharSequence charsequence, String s)
    {
        int i = spannablestringbuilder.getSpanStart(obj);
        int j = spannablestringbuilder.getSpanEnd(obj);
        if (i == -1)
        {
            i = TextUtils.indexOf(spannablestringbuilder, s);
            j = i + s.length();
            spannablestringbuilder.setSpan(obj, i, j, 18);
        }
        spannablestringbuilder.replace(i, j, charsequence);
    }

    private void updateEstimateVisible()
    {
        long l = mSeries.getMaxEstimate();
        long l1 = 0x7fffffffffffffffL;
        if (mSweepWarning.isEnabled())
            l1 = mSweepWarning.getValue();
        else
        if (mSweepLimit.isEnabled())
            l1 = mSweepLimit.getValue();
        if (l1 < 0L)
            l1 = 0x7fffffffffffffffL;
        boolean flag;
        if (l >= (7L * l1) / 10L)
            flag = true;
        else
            flag = false;
        mSeries.setEstimateVisible(flag);
    }

    private void updatePrimaryRange()
    {
        long l = mSweepLeft.getValue();
        long l1 = mSweepRight.getValue();
        if (mDetailSeries.getVisibility() == 0)
        {
            mDetailSeries.setPrimaryRange(l, l1);
            mSeries.setPrimaryRange(0L, 0L);
            return;
        } else
        {
            mSeries.setPrimaryRange(l, l1);
            return;
        }
    }

    private void updateVertAxisBounds(ChartSweepView chartsweepview)
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
        long l2 = Math.max(mSweepWarning.getValue(), mSweepLimit.getValue());
        long l3 = Math.max(Math.max((12L * Math.max(Math.max(mSeries.getMaxVisible(), mDetailSeries.getMaxVisible()), l2)) / 10L, 0x80000000L), l1);
        if (l3 != mVertMax)
        {
            mVertMax = l3;
            boolean flag = super.mVert.setBounds(0L, l3);
            mSweepWarning.setValidRange(0L, l3);
            mSweepLimit.setValidRange(0L, l3);
            if (flag)
            {
                mSeries.invalidatePath();
                mDetailSeries.invalidatePath();
            }
            mGrid.invalidate();
            if (chartsweepview != null)
                chartsweepview.updateValueFromPosition();
            if (mSweepLimit != chartsweepview)
                layoutSweep(mSweepLimit);
            if (mSweepWarning != chartsweepview)
                layoutSweep(mSweepWarning);
        }
    }

    public void bindDetailNetworkStats(NetworkStatsHistory networkstatshistory)
    {
        mDetailSeries.bindNetworkStats(networkstatshistory);
        ChartNetworkSeriesView chartnetworkseriesview = mDetailSeries;
        byte byte0;
        if (networkstatshistory != null)
            byte0 = 0;
        else
            byte0 = 8;
        chartnetworkseriesview.setVisibility(byte0);
        if (mHistory != null)
            mDetailSeries.setEndTime(mHistory.getEnd());
        updateVertAxisBounds(null);
        updateEstimateVisible();
        updatePrimaryRange();
        requestLayout();
    }

    public void bindNetworkPolicy(NetworkPolicy networkpolicy)
    {
        if (networkpolicy == null)
        {
            mSweepLimit.setVisibility(4);
            mSweepLimit.setValue(-1L);
            mSweepWarning.setVisibility(4);
            mSweepWarning.setValue(-1L);
            return;
        }
        if (networkpolicy.limitBytes != -1L)
        {
            mSweepLimit.setVisibility(0);
            mSweepLimit.setEnabled(true);
            mSweepLimit.setValue(networkpolicy.limitBytes);
        } else
        {
            mSweepLimit.setVisibility(0);
            mSweepLimit.setEnabled(false);
            mSweepLimit.setValue(-1L);
        }
        if (networkpolicy.warningBytes != -1L)
        {
            mSweepWarning.setVisibility(0);
            mSweepWarning.setValue(networkpolicy.warningBytes);
        } else
        {
            mSweepWarning.setVisibility(4);
            mSweepWarning.setValue(-1L);
        }
        updateVertAxisBounds(null);
        requestLayout();
        invalidate();
    }

    public void bindNetworkStats(NetworkStatsHistory networkstatshistory)
    {
        mSeries.bindNetworkStats(networkstatshistory);
        mHistory = networkstatshistory;
        updateVertAxisBounds(null);
        updateEstimateVisible();
        updatePrimaryRange();
        requestLayout();
    }

    public long getInspectEnd()
    {
        return mSweepRight.getValue();
    }

    public long getInspectStart()
    {
        return mSweepLeft.getValue();
    }

    public long getLimitBytes()
    {
        return mSweepLimit.getLabelValue();
    }

    public long getWarningBytes()
    {
        return mSweepWarning.getLabelValue();
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mGrid = (ChartGridView)findViewById(0x7f08004b);
        mSeries = (ChartNetworkSeriesView)findViewById(0x7f08004c);
        mDetailSeries = (ChartNetworkSeriesView)findViewById(0x7f08004d);
        mDetailSeries.setVisibility(8);
        mSweepLeft = (ChartSweepView)findViewById(0x7f08004e);
        mSweepRight = (ChartSweepView)findViewById(0x7f08004f);
        mSweepLimit = (ChartSweepView)findViewById(0x7f080051);
        mSweepWarning = (ChartSweepView)findViewById(0x7f080050);
        mSweepWarning.setMaxValue(0xe100000000L);
        mSweepLimit.setMaxValue(0xf9c0000000L);
        mSweepLeft.setValidRangeDynamic(null, mSweepRight);
        mSweepRight.setValidRangeDynamic(mSweepLeft, null);
        mSweepWarning.setValidRangeDynamic(null, mSweepLimit);
        mSweepLimit.setValidRangeDynamic(mSweepWarning, null);
        ChartSweepView chartsweepview = mSweepLeft;
        ChartSweepView achartsweepview[] = new ChartSweepView[1];
        achartsweepview[0] = mSweepRight;
        chartsweepview.setNeighbors(achartsweepview);
        ChartSweepView chartsweepview1 = mSweepRight;
        ChartSweepView achartsweepview1[] = new ChartSweepView[1];
        achartsweepview1[0] = mSweepLeft;
        chartsweepview1.setNeighbors(achartsweepview1);
        ChartSweepView chartsweepview2 = mSweepLimit;
        ChartSweepView achartsweepview2[] = new ChartSweepView[3];
        achartsweepview2[0] = mSweepWarning;
        achartsweepview2[1] = mSweepLeft;
        achartsweepview2[2] = mSweepRight;
        chartsweepview2.setNeighbors(achartsweepview2);
        ChartSweepView chartsweepview3 = mSweepWarning;
        ChartSweepView achartsweepview3[] = new ChartSweepView[3];
        achartsweepview3[0] = mSweepLimit;
        achartsweepview3[1] = mSweepLeft;
        achartsweepview3[2] = mSweepRight;
        chartsweepview3.setNeighbors(achartsweepview3);
        mSweepLeft.addOnSweepListener(mHorizListener);
        mSweepRight.addOnSweepListener(mHorizListener);
        mSweepWarning.addOnSweepListener(mVertListener);
        mSweepLimit.addOnSweepListener(mVertListener);
        mSweepWarning.setDragInterval(0x300000L);
        mSweepLimit.setDragInterval(0x300000L);
        mSweepLeft.setClickable(false);
        mSweepLeft.setFocusable(false);
        mSweepRight.setClickable(false);
        mSweepRight.setFocusable(false);
        mGrid.init(super.mHoriz, super.mVert);
        mSeries.init(super.mHoriz, super.mVert);
        mDetailSeries.init(super.mHoriz, super.mVert);
        mSweepLeft.init(super.mHoriz);
        mSweepRight.init(super.mHoriz);
        mSweepWarning.init(super.mVert);
        mSweepLimit.init(super.mVert);
        setActivated(false);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (isActivated())
            return false;
        switch (motionevent.getAction())
        {
        case 1: // '\001'
            setActivated(true);
            return true;

        case 0: // '\0'
            return true;
        }
        return false;
    }

    public void setListener(DataUsageChartListener datausagechartlistener)
    {
        mListener = datausagechartlistener;
    }

    public void setVisibleRange(long l, long l1)
    {
        boolean flag = super.mHoriz.setBounds(l, l1);
        mGrid.setBounds(l, l1);
        mSeries.setBounds(l, l1);
        mDetailSeries.setBounds(l, l1);
        long l2 = getHistoryStart();
        long l3 = getHistoryEnd();
        if (l2 != 0x7fffffffffffffffL)
            Math.max(l, l2);
        long l4;
        if (l3 == 0x8000000000000000L)
            l4 = l1;
        else
            l4 = Math.min(l1, l3);
        mSweepLeft.setValidRange(l, l1);
        mSweepRight.setValidRange(l, l1);
        long _tmp = (l1 + l) / 2L;
        long l5 = l4;
        long l6 = Math.max(l, l5 - 0x240c8400L);
        mSweepLeft.setValue(l6);
        mSweepRight.setValue(l5);
        requestLayout();
        if (flag)
        {
            mSeries.invalidatePath();
            mDetailSeries.invalidatePath();
        }
        updateVertAxisBounds(null);
        updateEstimateVisible();
        updatePrimaryRange();
    }










}
