// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.provider;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Looper;
import android.util.Log;

public class CallHistoryAsync
{
    public static class AddCallArgs
    {

        public final Context mContext;
        public final String mCountryISO;
        public final boolean mIsMultiSim;
        public final String mNumber;
        public final int mSlotId;
        public final long mStart;

        public AddCallArgs(Context context, String s, String s1, long l, int i, boolean flag)
        {
            mContext = context;
            mNumber = s;
            mCountryISO = s1;
            mStart = l;
            mSlotId = i;
            mIsMultiSim = flag;
        }
    }

    private class AddCallTask extends AsyncTask
    {

        final CallHistoryAsync this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((AddCallArgs[])aobj);
        }

        protected transient Void doInBackground(AddCallArgs aaddcallargs[])
        {
            int i = aaddcallargs.length;
            int j = 0;
            while (j < i) 
            {
                AddCallArgs addcallargs = aaddcallargs[j];
                try
                {
                    CallHistory.Calls.addCallNumber(addcallargs.mContext, addcallargs.mNumber, addcallargs.mCountryISO, addcallargs.mStart, addcallargs.mSlotId, addcallargs.mIsMultiSim);
                }
                catch (Exception exception)
                {
                    Log.e("CallHistoryAsync", (new StringBuilder()).append("Exception raised during adding CallLog entry: ").append(exception).toString());
                }
                j++;
            }
            return null;
        }

        private AddCallTask()
        {
            this$0 = CallHistoryAsync.this;
            super();
        }

    }

    public static class DeleteCallArgs
    {

        public final Context mContext;
        public final String mNumber;

        public DeleteCallArgs(Context context, String s)
        {
            mContext = context;
            mNumber = s;
        }
    }

    private class DeleteCallTask extends AsyncTask
    {

        final CallHistoryAsync this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((DeleteCallArgs[])aobj);
        }

        protected transient Integer[] doInBackground(DeleteCallArgs adeletecallargs[])
        {
            int i = adeletecallargs.length;
            Integer ainteger[] = new Integer[i];
            int j = 0;
            do
            {
                if (j >= i)
                    break;
                DeleteCallArgs deletecallargs = adeletecallargs[j];
                try
                {
                    ainteger[j] = Integer.valueOf(CallHistory.Calls.deleteNumber(deletecallargs.mContext, deletecallargs.mNumber));
                }
                catch (Exception exception)
                {
                    Log.e("CallHistoryAsync", (new StringBuilder()).append("Exception raised during delete call entry: ").append(exception).toString());
                    ainteger[j] = null;
                }
                j++;
            } while (true);
            return ainteger;
        }

        private DeleteCallTask()
        {
            this$0 = CallHistoryAsync.this;
            super();
        }

    }

    public static class UpdateConfirmFlagArgs
    {

        public final long mConfirm;
        public final Context mContext;
        public final String mNumber;

        public UpdateConfirmFlagArgs(Context context, String s, long l)
        {
            mContext = context;
            mNumber = s;
            mConfirm = l;
        }
    }

    private class UpdateConfirmFlagTask extends AsyncTask
    {

        final CallHistoryAsync this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((UpdateConfirmFlagArgs[])aobj);
        }

        protected transient Integer[] doInBackground(UpdateConfirmFlagArgs aupdateconfirmflagargs[])
        {
            int i = aupdateconfirmflagargs.length;
            Integer ainteger[] = new Integer[i];
            int j = 0;
            do
            {
                if (j >= i)
                    break;
                UpdateConfirmFlagArgs updateconfirmflagargs = aupdateconfirmflagargs[j];
                try
                {
                    ainteger[j] = Integer.valueOf(CallHistory.Calls.updateConfirmFlag(updateconfirmflagargs.mContext, updateconfirmflagargs.mNumber, updateconfirmflagargs.mConfirm));
                }
                catch (Exception exception)
                {
                    Log.e("CallHistoryAsync", (new StringBuilder()).append("Exception raised during update confirm flag entry: ").append(exception).toString());
                    ainteger[j] = null;
                }
                j++;
            } while (true);
            return ainteger;
        }

        private UpdateConfirmFlagTask()
        {
            this$0 = CallHistoryAsync.this;
            super();
        }

    }


    private static final String TAG = "CallHistoryAsync";


    private void assertUiThread()
    {
        if (!Looper.getMainLooper().equals(Looper.myLooper()))
            throw new RuntimeException("Not on the UI thread!");
        else
            return;
    }

    public AsyncTask addCall(AddCallArgs addcallargs)
    {
        assertUiThread();
        return (new AddCallTask()).execute(new AddCallArgs[] {
            addcallargs
        });
    }

    public AsyncTask deleteCall(DeleteCallArgs deletecallargs)
    {
        assertUiThread();
        return (new DeleteCallTask()).execute(new DeleteCallArgs[] {
            deletecallargs
        });
    }

    public AsyncTask updateConfirmFlag(UpdateConfirmFlagArgs updateconfirmflagargs)
    {
        assertUiThread();
        return (new UpdateConfirmFlagTask()).execute(new UpdateConfirmFlagArgs[] {
            updateconfirmflagargs
        });
    }
}
