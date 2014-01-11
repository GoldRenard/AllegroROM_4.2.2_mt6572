// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.os.*;

// Referenced classes of package android.view:
//            InputEventConsistencyVerifier, IInputFilterHost, InputEvent

public abstract class InputFilter extends IInputFilter.Stub
{
    private final class H extends Handler
    {

        final InputFilter this$0;

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 1 3: default 32
        //                       1 33
        //                       2 96
        //                       3 127;
               goto _L1 _L2 _L3 _L4
_L1:
            return;
_L2:
            mHost = (IInputFilterHost)message.obj;
            if (mInboundInputEventConsistencyVerifier != null)
                mInboundInputEventConsistencyVerifier.reset();
            if (mOutboundInputEventConsistencyVerifier != null)
                mOutboundInputEventConsistencyVerifier.reset();
            onInstalled();
            return;
_L3:
            onUninstalled();
            mHost = null;
            return;
            Exception exception1;
            exception1;
            mHost = null;
            throw exception1;
_L4:
            InputEvent inputevent = (InputEvent)message.obj;
            if (mInboundInputEventConsistencyVerifier != null)
                mInboundInputEventConsistencyVerifier.onInputEvent(inputevent, 0);
            onInputEvent(inputevent, message.arg1);
            inputevent.recycle();
            return;
            Exception exception;
            exception;
            inputevent.recycle();
            throw exception;
        }

        public H(Looper looper)
        {
            this$0 = InputFilter.this;
            super(looper);
        }
    }


    private static final int MSG_INPUT_EVENT = 3;
    private static final int MSG_INSTALL = 1;
    private static final int MSG_UNINSTALL = 2;
    private final H mH;
    private IInputFilterHost mHost;
    private final InputEventConsistencyVerifier mInboundInputEventConsistencyVerifier;
    private final InputEventConsistencyVerifier mOutboundInputEventConsistencyVerifier;

    public InputFilter(Looper looper)
    {
        InputEventConsistencyVerifier inputeventconsistencyverifier;
        if (InputEventConsistencyVerifier.isInstrumentationEnabled())
            inputeventconsistencyverifier = new InputEventConsistencyVerifier(this, 1, "InputFilter#InboundInputEventConsistencyVerifier");
        else
            inputeventconsistencyverifier = null;
        mInboundInputEventConsistencyVerifier = inputeventconsistencyverifier;
        boolean flag = InputEventConsistencyVerifier.isInstrumentationEnabled();
        InputEventConsistencyVerifier inputeventconsistencyverifier1 = null;
        if (flag)
            inputeventconsistencyverifier1 = new InputEventConsistencyVerifier(this, 1, "InputFilter#OutboundInputEventConsistencyVerifier");
        mOutboundInputEventConsistencyVerifier = inputeventconsistencyverifier1;
        mH = new H(looper);
    }

    public final void filterInputEvent(InputEvent inputevent, int i)
    {
        mH.obtainMessage(3, i, 0, inputevent).sendToTarget();
    }

    public final void install(IInputFilterHost iinputfilterhost)
    {
        mH.obtainMessage(1, iinputfilterhost).sendToTarget();
    }

    public void onInputEvent(InputEvent inputevent, int i)
    {
        sendInputEvent(inputevent, i);
    }

    public void onInstalled()
    {
    }

    public void onUninstalled()
    {
    }

    public void sendInputEvent(InputEvent inputevent, int i)
    {
        if (inputevent == null)
            throw new IllegalArgumentException("event must not be null");
        if (mHost == null)
            throw new IllegalStateException("Cannot send input event because the input filter is not installed.");
        if (mOutboundInputEventConsistencyVerifier != null)
            mOutboundInputEventConsistencyVerifier.onInputEvent(inputevent, 0);
        try
        {
            mHost.sendInputEvent(inputevent, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public final void uninstall()
    {
        mH.obtainMessage(2).sendToTarget();
    }


/*
    static IInputFilterHost access$002(InputFilter inputfilter, IInputFilterHost iinputfilterhost)
    {
        inputfilter.mHost = iinputfilterhost;
        return iinputfilterhost;
    }

*/


}
