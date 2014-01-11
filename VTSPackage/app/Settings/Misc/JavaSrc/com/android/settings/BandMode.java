// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.DialogInterface;
import android.os.*;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.*;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;

public class BandMode extends Activity
{
    private static class BandListItem
    {

        private int mBandMode;

        public int getBand()
        {
            return mBandMode;
        }

        public String toString()
        {
            return BandMode.BAND_NAMES[mBandMode];
        }

        public BandListItem(int i)
        {
            mBandMode = 0;
            mBandMode = i;
        }
    }


    private static final String BAND_NAMES[] = {
        "Automatic", "EURO Band", "USA Band", "JAPAN Band", "AUS Band", "AUS2 Band"
    };
    private static final boolean DBG = false;
    private static final int EVENT_BAND_SCAN_COMPLETED = 100;
    private static final int EVENT_BAND_SELECTION_DONE = 200;
    private static final String LOG_TAG = "phone";
    private ListView mBandList;
    private ArrayAdapter mBandListAdapter;
    private android.widget.AdapterView.OnItemClickListener mBandSelectionHandler;
    private Handler mHandler;
    private Phone mPhone;
    private DialogInterface mProgressPanel;
    private BandListItem mTargetBand;

    public BandMode()
    {
        mTargetBand = null;
        mPhone = null;
        mBandSelectionHandler = new android.widget.AdapterView.OnItemClickListener() {

            final BandMode this$0;

            public void onItemClick(AdapterView adapterview, View view, int i, long l)
            {
                getWindow().setFeatureInt(5, -1);
                mTargetBand = (BandListItem)adapterview.getAdapter().getItem(i);
                Message message = mHandler.obtainMessage(200);
                mPhone.setBandMode(mTargetBand.getBand(), message);
            }

            
            {
                this$0 = BandMode.this;
                super();
            }
        }
;
        mHandler = new Handler() {

            final BandMode this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 200: 
                    AsyncResult asyncresult1 = (AsyncResult)message.obj;
                    getWindow().setFeatureInt(5, -2);
                    if (!isFinishing())
                    {
                        displayBandSelectionResult(asyncresult1.exception);
                        return;
                    }
                    // fall through

                default:
                    return;

                case 100: // 'd'
                    AsyncResult asyncresult = (AsyncResult)message.obj;
                    bandListLoaded(asyncresult);
                    return;
                }
            }

            
            {
                this$0 = BandMode.this;
                super();
            }
        }
;
    }

    private void bandListLoaded(AsyncResult asyncresult)
    {
        if (mProgressPanel != null)
            mProgressPanel.dismiss();
        clearList();
        Object obj = asyncresult.result;
        boolean flag = false;
        if (obj != null)
        {
            int ai[] = (int[])(int[])asyncresult.result;
            int j = ai[0];
            flag = false;
            if (j > 0)
            {
                for (int k = 1; k < j; k++)
                {
                    BandListItem bandlistitem1 = new BandListItem(ai[k]);
                    mBandListAdapter.add(bandlistitem1);
                }

                flag = true;
            }
        }
        if (!flag)
        {
            for (int i = 0; i < 6; i++)
            {
                BandListItem bandlistitem = new BandListItem(i);
                mBandListAdapter.add(bandlistitem);
            }

        }
        mBandList.requestFocus();
    }

    private void clearList()
    {
        for (; mBandListAdapter.getCount() > 0; mBandListAdapter.remove(mBandListAdapter.getItem(0)));
    }

    private void displayBandSelectionResult(Throwable throwable)
    {
        String s = (new StringBuilder()).append(getString(0x7f0b0332)).append(" [").append(mTargetBand.toString()).append("] ").toString();
        String s1;
        if (throwable != null)
            s1 = (new StringBuilder()).append(s).append(getString(0x7f0b0333)).toString();
        else
            s1 = (new StringBuilder()).append(s).append(getString(0x7f0b0334)).toString();
        mProgressPanel = (new android.app.AlertDialog.Builder(this)).setMessage(s1).setPositiveButton(0x104000a, null).show();
    }

    private void loadBandList()
    {
        String s = getString(0x7f0b0331);
        mProgressPanel = (new android.app.AlertDialog.Builder(this)).setMessage(s).show();
        Message message = mHandler.obtainMessage(100);
        mPhone.queryAvailableBandMode(message);
    }

    private void log(String s)
    {
        Log.d("phone", (new StringBuilder()).append("[BandsList] ").append(s).toString());
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        requestWindowFeature(5);
        setContentView(0x7f04000b);
        setTitle(getString(0x7f0b0330));
        getWindow().setLayout(-1, -2);
        mPhone = PhoneFactory.getDefaultPhone();
        mBandList = (ListView)findViewById(0x7f08000d);
        mBandListAdapter = new ArrayAdapter(this, 0x1090003);
        mBandList.setAdapter(mBandListAdapter);
        mBandList.setOnItemClickListener(mBandSelectionHandler);
        loadBandList();
    }




/*
    static BandListItem access$002(BandMode bandmode, BandListItem bandlistitem)
    {
        bandmode.mTargetBand = bandlistitem;
        return bandlistitem;
    }

*/





}
