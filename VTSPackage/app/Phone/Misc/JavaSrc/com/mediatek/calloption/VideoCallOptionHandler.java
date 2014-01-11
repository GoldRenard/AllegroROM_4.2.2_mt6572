// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.app.AlertDialog;
import android.content.*;
import android.util.Log;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.mediatek.phone.GeminiConstants;
import java.util.*;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, Request, CallOptionHandlerFactory, SimStatusCallOptionHandler, 
//            CallOptionUtils

public abstract class VideoCallOptionHandler extends CallOptionBaseHandler
{

    private static final String TAG = "VideoCallOptionHandler";
    private Request mRequest;
    private android.content.DialogInterface.OnCancelListener mThreeGSIMSelectCancelListener;
    private android.content.DialogInterface.OnClickListener mThreeGSIMSelectClickListener;
    private android.content.DialogInterface.OnDismissListener mThreeGSIMSelectDismissListener;
    private android.content.DialogInterface.OnCancelListener mThreeGServiceCancelListener;
    private android.content.DialogInterface.OnClickListener mThreeGServiceClickListener;
    private android.content.DialogInterface.OnDismissListener mThreeGServiceDismissListener;

    public VideoCallOptionHandler()
    {
        mThreeGSIMSelectClickListener = new android.content.DialogInterface.OnClickListener() {

            final VideoCallOptionHandler this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                int j = ((Integer)((AlertDialog)dialoginterface).getListView().getAdapter().getItem(i)).intValue();
                VideoCallOptionHandler.log((new StringBuilder()).append("3GSIMSelectClick, onClick() is called, slot = ").append(j).toString());
                dialoginterface.dismiss();
                mRequest.getIntent().putExtra("com.android.phone.extra.slot", j);
                SimStatusCallOptionHandler simstatuscalloptionhandler = mRequest.getCallOptionHandlerFactory().getSimStatusCallOptionHandler();
                simstatuscalloptionhandler.setSuccessor(mRequest.getCallOptionHandlerFactory().getFinalCallOptionHandler());
                simstatuscalloptionhandler.handleRequest(mRequest);
            }

            
            {
                this$0 = VideoCallOptionHandler.this;
                super();
            }
        }
;
        mThreeGSIMSelectDismissListener = new android.content.DialogInterface.OnDismissListener() {

            final VideoCallOptionHandler this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                VideoCallOptionHandler.log("3GSIMSelectDismiss, onDismiss() is called");
            }

            
            {
                this$0 = VideoCallOptionHandler.this;
                super();
            }
        }
;
        mThreeGSIMSelectCancelListener = new android.content.DialogInterface.OnCancelListener() {

            final VideoCallOptionHandler this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
                VideoCallOptionHandler.log("3GSIMSelectCancel, onCancel() is called");
                mRequest.getResultHandler().onHandlingFinish();
            }

            
            {
                this$0 = VideoCallOptionHandler.this;
                super();
            }
        }
;
        mThreeGServiceClickListener = new android.content.DialogInterface.OnClickListener() {

            final VideoCallOptionHandler this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                VideoCallOptionHandler.log((new StringBuilder()).append("onClick(), which = ").append(i).toString());
                if (-1 == i)
                {
                    Intent intent = new Intent();
                    intent.setClassName("com.android.phone", "com.mediatek.settings.Modem3GCapabilitySwitch");
                    mRequest.getActivityContext().startActivity(intent);
                } else
                if (-2 == i)
                {
                    dialoginterface.cancel();
                    return;
                }
            }

            
            {
                this$0 = VideoCallOptionHandler.this;
                super();
            }
        }
;
        mThreeGServiceDismissListener = new android.content.DialogInterface.OnDismissListener() {

            final VideoCallOptionHandler this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                VideoCallOptionHandler.log("onDismiss()");
            }

            
            {
                this$0 = VideoCallOptionHandler.this;
                super();
            }
        }
;
        mThreeGServiceCancelListener = new android.content.DialogInterface.OnCancelListener() {

            final VideoCallOptionHandler this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
                VideoCallOptionHandler.log("onCancel()");
                mRequest.getResultHandler().onHandlingFinish();
            }

            
            {
                this$0 = VideoCallOptionHandler.this;
                super();
            }
        }
;
    }

    private static void log(String s)
    {
        Log.d("VideoCallOptionHandler", s);
    }

    private void requestCheckSimStatus(Request request, int i)
    {
        request.getIntent().putExtra("com.android.phone.extra.slot", i);
        SimStatusCallOptionHandler simstatuscalloptionhandler = request.getCallOptionHandlerFactory().getSimStatusCallOptionHandler();
        simstatuscalloptionhandler.setSuccessor(request.getCallOptionHandlerFactory().getFinalCallOptionHandler());
        simstatuscalloptionhandler.handleRequest(request);
    }

    public void handleRequest(Request request)
    {
        log("handleRequest()");
        mRequest = request;
        if (!request.getIntent().getBooleanExtra("com.android.phone.extra.video", false))
        {
            if (super.mSuccessor != null)
                super.mSuccessor.handleRequest(request);
            return;
        }
        List list = CallOptionUtils.get3GCapabilitySlots();
        if (mRequest.isMultipleSim() && list.size() > 0)
        {
            ArrayList arraylist = new ArrayList();
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                int i1 = ((Integer)iterator.next()).intValue();
                if (CallOptionUtils.isSimInsert(request, i1))
                    arraylist.add(Integer.valueOf(i1));
            } while (true);
            if (arraylist.size() > 1)
            {
                show3GSIMSelectDialog(request, mThreeGSIMSelectClickListener, mThreeGSIMSelectDismissListener, mThreeGSIMSelectCancelListener);
                return;
            }
            if (arraylist.isEmpty())
            {
                request.getIntent().putExtra("com.android.phone.extra.slot", -1);
                SimStatusCallOptionHandler simstatuscalloptionhandler = request.getCallOptionHandlerFactory().getSimStatusCallOptionHandler();
                simstatuscalloptionhandler.setSuccessor(request.getCallOptionHandlerFactory().getFinalCallOptionHandler());
                simstatuscalloptionhandler.handleRequest(request);
                return;
            }
        }
        int i;
        if (request.is3GSwitchSupport())
            i = CallOptionUtils.get3GCapabilitySIM(request);
        else
            i = 0;
        int j;
        if (list.size() > 0)
            j = ((Integer)list.get(0)).intValue();
        else
            j = -1;
        if (-1 == i)
        {
            if (CallOptionUtils.isSimInsert(request, j) && !CallOptionUtils.isSimReady(request, j))
            {
                requestCheckSimStatus(request, j);
                return;
            }
            int ai[] = GeminiConstants.SLOTS;
            int k = ai.length;
            int l = 0;
            do
            {
label0:
                {
                    boolean flag = false;
                    if (l < k)
                    {
                        if (!CallOptionUtils.isSimInsert(request, ai[l]))
                            break label0;
                        flag = true;
                    }
                    showOpen3GServiceDialog(request, flag, mThreeGServiceClickListener, mThreeGServiceDismissListener, mThreeGServiceCancelListener);
                    return;
                }
                l++;
            } while (true);
        } else
        {
            requestCheckSimStatus(request, i);
            return;
        }
    }

    protected abstract void show3GSIMSelectDialog(Request request, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener);

    protected abstract void showOpen3GServiceDialog(Request request, boolean flag, android.content.DialogInterface.OnClickListener onclicklistener, android.content.DialogInterface.OnDismissListener ondismisslistener, android.content.DialogInterface.OnCancelListener oncancellistener);


}
