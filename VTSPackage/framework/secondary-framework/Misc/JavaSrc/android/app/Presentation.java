// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Context;
import android.content.res.Resources;
import android.hardware.display.DisplayManager;
import android.os.Handler;
import android.os.Message;
import android.util.*;
import android.view.*;

// Referenced classes of package android.app:
//            Dialog

public class Presentation extends Dialog
{

    private static final int MSG_CANCEL = 1;
    private static final String TAG = "Presentation";
    private final Display mDisplay;
    private final android.hardware.display.DisplayManager.DisplayListener mDisplayListener;
    private final DisplayManager mDisplayManager;
    private final Handler mHandler;

    public Presentation(Context context, Display display)
    {
        this(context, display, 0);
    }

    public Presentation(Context context, Display display, int i)
    {
        super(createPresentationContext(context, display, i), i, false);
        mDisplayListener = new android.hardware.display.DisplayManager.DisplayListener() {

            final Presentation this$0;

            public void onDisplayAdded(int j)
            {
            }

            public void onDisplayChanged(int j)
            {
                if (j == mDisplay.getDisplayId())
                    handleDisplayChanged();
            }

            public void onDisplayRemoved(int j)
            {
                if (j == mDisplay.getDisplayId())
                    handleDisplayRemoved();
            }

            
            {
                this$0 = Presentation.this;
                super();
            }
        }
;
        mHandler = new Handler() {

            final Presentation this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 1: // '\001'
                    cancel();
                    return;
                }
            }

            
            {
                this$0 = Presentation.this;
                super();
            }
        }
;
        mDisplay = display;
        mDisplayManager = (DisplayManager)getContext().getSystemService("display");
        getWindow().setGravity(119);
        setCanceledOnTouchOutside(false);
    }

    private static Context createPresentationContext(Context context, Display display, int i)
    {
        if (context == null)
            throw new IllegalArgumentException("outerContext must not be null");
        if (display == null)
            throw new IllegalArgumentException("display must not be null");
        Context context1 = context.createDisplayContext(display);
        if (i == 0)
        {
            TypedValue typedvalue = new TypedValue();
            context1.getTheme().resolveAttribute(0x10103c0, typedvalue, true);
            i = typedvalue.resourceId;
        }
        return new ContextThemeWrapper(context1, i, ((WindowManagerImpl)context.getSystemService("window")).createPresentationWindowManager(display)) {

            final WindowManagerImpl val$displayWindowManager;

            public Object getSystemService(String s)
            {
                if ("window".equals(s))
                    return displayWindowManager;
                else
                    return super.getSystemService(s);
            }

            
            {
                displayWindowManager = windowmanagerimpl;
                super(context, i);
            }
        }
;
    }

    private void handleDisplayChanged()
    {
        onDisplayChanged();
        if (!isConfigurationStillValid())
            cancel();
    }

    private void handleDisplayRemoved()
    {
        onDisplayRemoved();
        cancel();
    }

    private boolean isConfigurationStillValid()
    {
        DisplayMetrics displaymetrics = new DisplayMetrics();
        mDisplay.getMetrics(displaymetrics);
        return displaymetrics.equalsPhysical(getResources().getDisplayMetrics());
    }

    public Display getDisplay()
    {
        return mDisplay;
    }

    public Resources getResources()
    {
        return getContext().getResources();
    }

    public void onDisplayChanged()
    {
    }

    public void onDisplayRemoved()
    {
    }

    protected void onStart()
    {
        super.onStart();
        mDisplayManager.registerDisplayListener(mDisplayListener, mHandler);
        if (!isConfigurationStillValid())
        {
            Log.i("Presentation", "Presentation is being immediately dismissed because the display metrics have changed since it was created.");
            mHandler.sendEmptyMessage(1);
        }
    }

    protected void onStop()
    {
        mDisplayManager.unregisterDisplayListener(mDisplayListener);
        super.onStop();
    }

    public void show()
    {
        super.show();
    }



}
