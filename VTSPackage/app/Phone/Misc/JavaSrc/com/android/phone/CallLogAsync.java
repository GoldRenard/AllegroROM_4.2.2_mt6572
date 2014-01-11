// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Looper;
import android.util.Log;
import com.android.internal.telephony.CallerInfo;

public class CallLogAsync
{
    public static class AddCallArgs
    {

        public final int callType;
        public final CallerInfo ci;
        public final Context context;
        public final int durationInSec;
        public final String number;
        public final int presentation;
        public final int simId;
        public final long timestamp;
        public final int vtCall;

        public AddCallArgs(Context context1, CallerInfo callerinfo, String s, int i, int j, long l, 
                long l1)
        {
            context = context1;
            ci = callerinfo;
            number = s;
            presentation = i;
            callType = j;
            timestamp = l;
            durationInSec = (int)(l1 / 1000L);
            simId = -1;
            vtCall = -1;
        }

        public AddCallArgs(Context context1, CallerInfo callerinfo, String s, int i, int j, long l, 
                long l1, int k)
        {
            context = context1;
            ci = callerinfo;
            number = s;
            presentation = i;
            callType = j;
            timestamp = l;
            durationInSec = (int)(l1 / 1000L);
            simId = k;
            vtCall = -1;
        }

        public AddCallArgs(Context context1, CallerInfo callerinfo, String s, int i, int j, long l, 
                long l1, int k, int i1)
        {
            context = context1;
            ci = callerinfo;
            number = s;
            presentation = i;
            callType = j;
            timestamp = l;
            durationInSec = (int)(l1 / 1000L);
            simId = k;
            vtCall = i1;
        }
    }

    private class AddCallTask extends AsyncTask
    {

        final CallLogAsync this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((AddCallArgs[])aobj);
        }

        protected transient Uri[] doInBackground(AddCallArgs aaddcallargs[])
        {
            int i = aaddcallargs.length;
            Uri auri[] = new Uri[i];
            int j = 0;
            do
            {
                if (j >= i)
                    break;
                AddCallArgs addcallargs = aaddcallargs[j];
                try
                {
                    auri[j] = android.provider.CallLog.Calls.addCall(addcallargs.ci, addcallargs.context, addcallargs.number, addcallargs.presentation, addcallargs.callType, addcallargs.timestamp, addcallargs.durationInSec, addcallargs.simId, addcallargs.vtCall);
                }
                catch (Exception exception)
                {
                    Log.e("CallLogAsync", (new StringBuilder()).append("Exception raised during adding CallLog entry: ").append(exception).toString());
                    auri[j] = null;
                }
                Log.d("CallLogAsync", (new StringBuilder()).append("Calls.addCall, number=").append(addcallargs.number).append(" vtCall=").append(addcallargs.vtCall).append(" presentation:").append(addcallargs.presentation).append(" callType:").append(addcallargs.callType).append(" timestamp:").append(addcallargs.timestamp).append(" durationInSec:").append(addcallargs.durationInSec).append(" simId: ").append(addcallargs.simId).append(" vtCall:").append(addcallargs.vtCall).toString());
                j++;
            } while (true);
            return auri;
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((Uri[])obj);
        }

        protected void onPostExecute(Uri auri[])
        {
            int i = auri.length;
            for (int j = 0; j < i; j++)
                if (auri[j] == null)
                    Log.e("CallLogAsync", "Failed to write call to the log.");

        }

        private AddCallTask()
        {
            this$0 = CallLogAsync.this;
            super();
        }

    }

    public static class GetLastOutgoingCallArgs
    {

        public final OnLastOutgoingCallComplete callback;
        public final Context context;

        public GetLastOutgoingCallArgs(Context context1, OnLastOutgoingCallComplete onlastoutgoingcallcomplete)
        {
            context = context1;
            callback = onlastoutgoingcallcomplete;
        }
    }

    private class GetLastOutgoingCallTask extends AsyncTask
    {

        private final OnLastOutgoingCallComplete mCallback;
        private String mNumber;
        final CallLogAsync this$0;

        protected volatile Object doInBackground(Object aobj[])
        {
            return doInBackground((GetLastOutgoingCallArgs[])aobj);
        }

        protected transient String doInBackground(GetLastOutgoingCallArgs agetlastoutgoingcallargs[])
        {
            int _tmp = agetlastoutgoingcallargs.length;
            String s = "";
            int i = agetlastoutgoingcallargs.length;
            for (int j = 0; j < i; j++)
                s = android.provider.CallLog.Calls.getLastOutgoingCall(agetlastoutgoingcallargs[j].context);

            return s;
        }

        protected volatile void onPostExecute(Object obj)
        {
            onPostExecute((String)obj);
        }

        protected void onPostExecute(String s)
        {
            assertUiThread();
            mCallback.lastOutgoingCall(s);
        }

        public GetLastOutgoingCallTask(OnLastOutgoingCallComplete onlastoutgoingcallcomplete)
        {
            this$0 = CallLogAsync.this;
            super();
            mCallback = onlastoutgoingcallcomplete;
        }
    }

    public static interface OnLastOutgoingCallComplete
    {

        public abstract void lastOutgoingCall(String s);
    }


    private static final String TAG = "CallLogAsync";


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

    public AsyncTask getLastOutgoingCall(GetLastOutgoingCallArgs getlastoutgoingcallargs)
    {
        assertUiThread();
        return (new GetLastOutgoingCallTask(getlastoutgoingcallargs.callback)).execute(new GetLastOutgoingCallArgs[] {
            getlastoutgoingcallargs
        });
    }

}
