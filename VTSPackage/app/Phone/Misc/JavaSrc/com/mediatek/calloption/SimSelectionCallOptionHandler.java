// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.app.AlertDialog;
import android.content.*;
import android.net.Uri;
import android.util.Log;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.mediatek.phone.SIMInfoWrapper;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, Request, CallOptionUtils, CallOptionHandlerFactory, 
//            InternetCallOptionHandler, SimAssociateHandler

public abstract class SimSelectionCallOptionHandler extends CallOptionBaseHandler
{
    public class AssociateSimMissingArgs
    {

        public static final int ASSOCIATE_SIM_MISSING_YES_NO = 0;
        public static final int ASSOCIATE_SIM_MISSING_YES_OTHER = 1;
        public long suggested;
        final SimSelectionCallOptionHandler this$0;
        public int type;
        public android.provider.Telephony.SIMInfo viaSimInfo;

        public AssociateSimMissingArgs()
        {
            this$0 = SimSelectionCallOptionHandler.this;
            super();
        }
    }

    private class CallbackArgs
    {

        public Object args;
        public long id;
        public String number;
        public int reason;
        final SimSelectionCallOptionHandler this$0;

        public CallbackArgs()
        {
            this$0 = SimSelectionCallOptionHandler.this;
            super();
        }

        public CallbackArgs(int i, String s, long l, Object obj)
        {
            this$0 = SimSelectionCallOptionHandler.this;
            super();
            reason = i;
            number = s;
            id = l;
            args = obj;
        }
    }


    private static final int MAKE_CALL_REASON_ASK = 5;
    private static final int MAKE_CALL_REASON_ASSOCIATE_MISSING = 6;
    private static final int MAKE_CALL_REASON_OK = 0;
    private static final String TAG = "SimSelectionCallOptionHandler";
    private android.content.DialogInterface.OnCancelListener mAssociateMissingCancelListener;
    private android.content.DialogInterface.OnClickListener mAssociateMissingClickListener;
    private android.content.DialogInterface.OnDismissListener mAssociateMissingDismissListener;
    private AssociateSimMissingArgs mAssociateSimMissingArgs;
    private android.content.DialogInterface.OnCancelListener mReasonAskCancelListener;
    private android.content.DialogInterface.OnClickListener mReasonAskClickListener;
    private android.content.DialogInterface.OnDismissListener mReasonAskDismissListener;
    private Request mRequest;

    public SimSelectionCallOptionHandler()
    {
        mReasonAskClickListener = new android.content.DialogInterface.OnClickListener() {

            final SimSelectionCallOptionHandler this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                int j = ((Integer)((AlertDialog)dialoginterface).getListView().getAdapter().getItem(i)).intValue();
                SimSelectionCallOptionHandler.log((new StringBuilder()).append("ReasonAskDismissDialog, onClick() is called, slot = ").append(j).toString());
                if (j == -2)
                {
                    dialoginterface.dismiss();
                    doSipCallOptionHandle();
                } else
                {
                    dialoginterface.dismiss();
                    mRequest.getIntent().putExtra("com.android.phone.extra.slot", j);
                    if (mSuccessor != null)
                    {
                        mSuccessor.handleRequest(mRequest);
                        return;
                    }
                }
            }

            
            {
                this$0 = SimSelectionCallOptionHandler.this;
                super();
            }
        }
;
        mReasonAskDismissListener = new android.content.DialogInterface.OnDismissListener() {

            final SimSelectionCallOptionHandler this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                SimSelectionCallOptionHandler.log("ReasonAskDismissDialog, onDismiss() is called");
            }

            
            {
                this$0 = SimSelectionCallOptionHandler.this;
                super();
            }
        }
;
        mReasonAskCancelListener = new android.content.DialogInterface.OnCancelListener() {

            final SimSelectionCallOptionHandler this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
                SimSelectionCallOptionHandler.log("ReasonAskDismissDialog, onCancel() is called");
                mRequest.getResultHandler().onHandlingFinish();
            }

            
            {
                this$0 = SimSelectionCallOptionHandler.this;
                super();
            }
        }
;
        mAssociateMissingClickListener = new android.content.DialogInterface.OnClickListener() {

            final SimSelectionCallOptionHandler this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (-1 == i)
                {
                    AlertDialog _tmp = (AlertDialog)dialoginterface;
                    if (mAssociateSimMissingArgs != null)
                        if (mAssociateSimMissingArgs.viaSimInfo != null)
                        {
                            dialoginterface.dismiss();
                            int j = mAssociateSimMissingArgs.viaSimInfo.mSlot;
                            mRequest.getIntent().putExtra("com.android.phone.extra.slot", j);
                            if (mSuccessor != null)
                                mSuccessor.handleRequest(mRequest);
                        } else
                        {
                            dialoginterface.dismiss();
                            doSipCallOptionHandle();
                            return;
                        }
                } else
                if (-2 == i)
                {
                    if (mAssociateSimMissingArgs.type == 0)
                    {
                        dialoginterface.cancel();
                        return;
                    }
                    if (1 == mAssociateSimMissingArgs.type)
                    {
                        CallbackArgs callbackargs = new CallbackArgs();
                        callbackargs.args = Long.valueOf(mAssociateSimMissingArgs.suggested);
                        callbackargs.reason = 5;
                        onMakeCall(callbackargs);
                        return;
                    }
                }
            }

            
            {
                this$0 = SimSelectionCallOptionHandler.this;
                super();
            }
        }
;
        mAssociateMissingDismissListener = new android.content.DialogInterface.OnDismissListener() {

            final SimSelectionCallOptionHandler this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
            }

            
            {
                this$0 = SimSelectionCallOptionHandler.this;
                super();
            }
        }
;
        mAssociateMissingCancelListener = new android.content.DialogInterface.OnCancelListener() {

            final SimSelectionCallOptionHandler this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
                mRequest.getResultHandler().onHandlingFinish();
            }

            
            {
                this$0 = SimSelectionCallOptionHandler.this;
                super();
            }
        }
;
    }

    private void doSipCallOptionHandle()
    {
        log("doSipCallOptionHandle()");
        if (mRequest.getIntent() == null)
        {
            log("doSipCallOptionHandle(), mRequest.getIntent() == null");
            return;
        } else
        {
            mRequest.getIntent().putExtra("follow_sim_management", false);
            String s = CallOptionUtils.getInitialNumber(mRequest.getApplicationContext(), mRequest.getIntent());
            mRequest.getIntent().setData(Uri.fromParts("sip", s, null));
            mRequest.getCallOptionHandlerFactory().getInternetCallOptionHandler().handleRequest(mRequest);
            return;
        }
    }

    private static void log(String s)
    {
        Log.d("SimSelectionCallOptionHandler", s);
    }

    public void handleRequest(Request request)
    {
        CallbackArgs callbackargs;
        long l;
        long l2;
        SIMInfoWrapper siminfowrapper;
        long l3;
        ArrayList arraylist;
        boolean flag2;
        int i;
        boolean flag3;
label0:
        {
label1:
            {
                log("handleRequest()");
                boolean flag = "voicemail:".equals(request.getIntent().getData().toString());
                boolean flag1 = false;
                if (flag)
                    flag1 = true;
                if (-1 != request.getIntent().getIntExtra("com.android.phone.extra.slot", -1))
                {
                    if (super.mSuccessor != null)
                        super.mSuccessor.handleRequest(request);
                    return;
                }
                mRequest = request;
                String s = CallOptionUtils.getInitialNumber(request.getApplicationContext(), request.getIntent());
                callbackargs = new CallbackArgs(0, s, 0L, null);
                l = request.getIntent().getLongExtra("com.android.phone.extra.original", -5L);
                long l1 = -5L;
                l2 = -5L;
                siminfowrapper = SIMInfoWrapper.getDefault();
                l3 = android.provider.Settings.System.getLong(request.getApplicationContext().getContentResolver(), "voice_call_sim_setting", -5L);
                arraylist = SimAssociateHandler.getInstance(request.getApplicationContext()).query(s);
                if (arraylist != null && arraylist.size() > 0)
                    flag2 = true;
                else
                    flag2 = false;
                i = 0;
                if (flag2)
                {
                    Iterator iterator1 = arraylist.iterator();
                    do
                    {
                        if (!iterator1.hasNext())
                            break;
                        int j2 = ((Integer)iterator1.next()).intValue();
                        int k2 = siminfowrapper.getSimSlotById(j2);
                        if (k2 >= 0 && CallOptionUtils.isSimInsert(request, k2))
                        {
                            i++;
                            l2 = j2;
                        }
                    } while (true);
                }
                int j = android.provider.Settings.System.getInt(request.getApplicationContext().getContentResolver(), "enable_internet_call_value", 0);
                if (siminfowrapper.getInsertedSimCount() == 0 && l3 != -2L)
                {
                    if (1 != j)
                    {
                        callbackargs.id = 0L;
                        callbackargs.reason = 0;
                    } else
                    {
                        callbackargs.reason = 5;
                        callbackargs.args = Long.valueOf(-2L);
                    }
                    onMakeCall(callbackargs);
                    return;
                }
                if (l3 == -5L)
                {
                    onMakeCall(callbackargs);
                    return;
                }
                int k = l != -5L;
                flag3 = false;
                if (k != 0)
                {
                    int i2 = siminfowrapper.getSimSlotById((int)l);
                    if (i2 >= 0 && CallOptionUtils.isSimInsert(request, i2))
                        flag3 = true;
                    else
                        flag3 = false;
                    if (l == -2L)
                        if (j == 1)
                            flag3 = true;
                        else
                            flag3 = false;
                }
                log((new StringBuilder()).append("makeVoiceCall, number = ").append(s).append(", originalSim = ").append(l).append(", defaultSim = ").append(l3).append(", associateSims = ").append(arraylist).toString());
                if (l3 == -1L)
                {
                    if (1 != j && siminfowrapper.getInsertedSimCount() == 0)
                    {
                        callbackargs.reason = 0;
                        onMakeCall(callbackargs);
                        return;
                    }
                    log((new StringBuilder()).append("always, associateSimInserts = ").append(i).append(" originalSim = ").append(l).toString());
                    if (i > 1)
                        l1 = -5L;
                    else
                    if (i == 1)
                        l1 = l2;
                    else
                    if (flag3)
                        l1 = l;
                    if (flag1)
                        l1 = -5L;
                    callbackargs.args = Long.valueOf(l1);
                    callbackargs.reason = 5;
                    onMakeCall(callbackargs);
                    return;
                }
                if (!flag2 && l != -5L && l3 == -2L && l != l3)
                {
                    if (flag3)
                        callbackargs.args = Long.valueOf(l);
                    else
                        callbackargs.args = Long.valueOf(-5L);
                    callbackargs.reason = 5;
                    onMakeCall(callbackargs);
                    return;
                }
                if (l3 == -2L)
                {
                    if (!flag2 && (l == -5L || l == -2L))
                    {
                        doSipCallOptionHandle();
                        return;
                    }
                    if (i > 1)
                        l1 = -5L;
                    else
                    if (i == 1)
                        l1 = l2;
                    else
                    if (flag3)
                        l1 = l;
                    callbackargs.args = Long.valueOf(l1);
                    callbackargs.reason = 5;
                    onMakeCall(callbackargs);
                    return;
                }
                if (l == -5L && !flag2)
                {
                    log((new StringBuilder()).append("deaultSim = ").append(l3).toString());
                    callbackargs.reason = 0;
                    callbackargs.id = l3;
                    onMakeCall(callbackargs);
                    return;
                }
                if (l != -5L && !flag2)
                    if (l3 != l && flag3)
                    {
                        long l5 = -5L;
                        if (flag3)
                            l5 = l;
                        callbackargs.reason = 5;
                        callbackargs.args = Long.valueOf(l5);
                        onMakeCall(callbackargs);
                        return;
                    } else
                    {
                        callbackargs.reason = 0;
                        callbackargs.id = l3;
                        onMakeCall(callbackargs);
                        return;
                    }
                if (l != -5L || !flag2)
                    break label0;
                if (i >= 2)
                {
                    callbackargs.reason = 5;
                    callbackargs.args = Long.valueOf(-5L);
                    onMakeCall(callbackargs);
                    return;
                }
                if (arraylist.size() == 1)
                {
                    l2 = ((Integer)arraylist.get(0)).intValue();
                    break label1;
                }
                if (arraylist.size() < 2)
                    break label1;
                Iterator iterator = arraylist.iterator();
                int j1;
                int k1;
                do
                {
                    if (!iterator.hasNext())
                        break label1;
                    j1 = ((Integer)iterator.next()).intValue();
                    k1 = siminfowrapper.getSimSlotById(j1);
                } while (k1 < 0 || !CallOptionUtils.isSimInsert(request, k1));
                l2 = j1;
            }
            if (i == 1)
            {
                if (l3 == l2)
                {
                    callbackargs.reason = 0;
                    callbackargs.id = l3;
                } else
                {
                    callbackargs.reason = 5;
                    callbackargs.args = Long.valueOf(l2);
                }
                onMakeCall(callbackargs);
                return;
            }
        }
        if (l3 == l && l3 == l2)
        {
            callbackargs.reason = 0;
            callbackargs.id = l3;
            onMakeCall(callbackargs);
            return;
        }
        if (l3 == l && flag2 && i == 0)
        {
            callbackargs.reason = 5;
            callbackargs.args = Long.valueOf(l);
            onMakeCall(callbackargs);
            return;
        }
        if (l != -5L && flag2 && i == 0)
        {
            int i1 = siminfowrapper.getSimSlotById((int)l);
            if (i1 >= 0 && l != l3 && CallOptionUtils.isSimInsert(request, i1))
            {
                callbackargs.args = Long.valueOf(l);
                callbackargs.reason = 5;
                onMakeCall(callbackargs);
                return;
            }
        }
        if (i >= 2)
        {
            callbackargs.reason = 5;
            callbackargs.args = Long.valueOf(-5L);
            onMakeCall(callbackargs);
            return;
        }
        if (i == 1)
        {
            callbackargs.reason = 5;
            callbackargs.args = Long.valueOf(l2);
        } else
        {
            if (l2 == -5L)
                l2 = ((Integer)arraylist.get(0)).intValue();
            callbackargs.id = l2;
            callbackargs.reason = 6;
            AssociateSimMissingArgs associatesimmissingargs = new AssociateSimMissingArgs();
            if (SIMInfoWrapper.getDefault().getInsertedSimCount() <= 1)
            {
                associatesimmissingargs.type = 0;
                long l4;
                if (flag3)
                    l4 = l;
                else
                    l4 = l3;
                if (l3 == -2L)
                    associatesimmissingargs.suggested = -2L;
                else
                    associatesimmissingargs.viaSimInfo = siminfowrapper.getSimInfoById((int)l4);
            } else
            {
                associatesimmissingargs.type = 1;
                if (!flag3)
                    l = l3;
                associatesimmissingargs.suggested = l;
                if (l3 != -1L && l3 != -2L)
                    associatesimmissingargs.viaSimInfo = siminfowrapper.getSimInfoById((int)l3);
            }
            callbackargs.args = associatesimmissingargs;
        }
        onMakeCall(callbackargs);
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        log((new StringBuilder()).append("onClick, dialog = ").append(dialoginterface).append(" which = ").append(i).toString());
        int j = ((Integer)((AlertDialog)dialoginterface).getListView().getAdapter().getItem(i)).intValue();
        log((new StringBuilder()).append("onClick, slot = ").append(j).toString());
        if (j == -2)
        {
            dialoginterface.dismiss();
            doSipCallOptionHandle();
        } else
        {
            dialoginterface.dismiss();
            mRequest.getIntent().putExtra("com.android.phone.extra.slot", j);
            if (super.mSuccessor != null)
            {
                super.mSuccessor.handleRequest(mRequest);
                return;
            }
        }
    }

    public void onMakeCall(CallbackArgs callbackargs)
    {
        boolean flag = true;
        log((new StringBuilder()).append("onMakeCall, reason = ").append(callbackargs.reason).append(" args = ").append(callbackargs.args).toString());
        switch (callbackargs.reason)
        {
        case 6: // '\006'
            mAssociateSimMissingArgs = (AssociateSimMissingArgs)callbackargs.args;
            android.provider.Telephony.SIMInfo siminfo = SIMInfoWrapper.getDefault().getSimInfoById((int)callbackargs.id);
            showAssociateMissingDialog(mRequest, siminfo, callbackargs.number, (AssociateSimMissingArgs)callbackargs.args, mAssociateMissingClickListener, mAssociateMissingDismissListener, mAssociateMissingCancelListener);
            return;

        case 5: // '\005'
            long l;
            if (callbackargs.args == null)
                l = -5L;
            else
                l = ((Long)callbackargs.args).longValue();
            if (mRequest.getIntent().getBooleanExtra("com.android.phone.extra.ip", false) && SIMInfoWrapper.getDefault().getInsertedSimCount() != 0 || flag == mRequest.getIntent().getIntExtra("com.android.phone.extra.international", 0))
                flag = false;
            if ("voicemail:".equals(mRequest.getIntent().getData().toString()))
                flag = false;
            showReasonAskDialog(mRequest, l, flag, mReasonAskClickListener, mReasonAskDismissListener, mReasonAskCancelListener);
            return;

        case 0: // '\0'
            int i = SIMInfoWrapper.getDefault().getSimSlotById((int)callbackargs.id);
            if (i == -1)
                i = 0;
            mRequest.getIntent().putExtra("com.android.phone.extra.slot", i);
            if (super.mSuccessor != null)
            {
                super.mSuccessor.handleRequest(mRequest);
                return;
            }
            break;

        default:
            log("onMakeCall: no match case found!");
            break;
        }
    }

    protected abstract void showAssociateMissingDialog(Request request, android.provider.Telephony.SIMInfo siminfo, String s, AssociateSimMissingArgs associatesimmissingargs, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener);

    protected abstract void showReasonAskDialog(Request request, long l, boolean flag, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener);




}
