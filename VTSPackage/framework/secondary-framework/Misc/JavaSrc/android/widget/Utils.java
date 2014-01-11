// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.appwidget.AppWidgetHostView;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import com.mediatek.xlog.Xlog;

// Referenced classes of package android.widget:
//            ImageView

public class Utils
{

    private static final String TAG = "Utils";
    static Handler mClearBitmapHandle;


    public static void callPassSim(Context context, String s, int i)
    {
        Intent intent = new Intent("android.intent.action.DIAL", Uri.fromParts("tel", s, null));
        intent.setFlags(0x10000000);
        context.startActivity(intent);
    }

    public static void clearView(View view)
    {
        if (view != null && !(view instanceof ImageView) && (view instanceof ViewGroup))
        {
            ViewGroup viewgroup = (ViewGroup)view;
            for (int i = 0; i < viewgroup.getChildCount(); i++)
                clearView(viewgroup.getChildAt(i));

        }
    }

    public static ViewGroup getWidgetHostView(View view)
    {
        if (view != null && view.getParent() != null)
        {
            android.view.ViewParent viewparent = view.getParent();
            if (viewparent != null && (viewparent instanceof View))
            {
                if (viewparent instanceof AppWidgetHostView)
                    return (ViewGroup)view;
                else
                    return getWidgetHostView((View)viewparent);
            } else
            {
                return null;
            }
        } else
        {
            return null;
        }
    }

    public static boolean hasInLancher(View view)
    {
        if (view != null)
        {
            android.view.ViewParent viewparent = view.getParent();
            if (viewparent != null && (viewparent instanceof View))
                if (viewparent.getClass().toString().indexOf("Workspace") >= 0)
                    return true;
                else
                    return hasInLancher((View)viewparent);
        }
        return false;
    }

    public static void initiateCall(Context context, CharSequence charsequence)
    {
        Intent intent = new Intent("android.intent.action.CALL_PRIVILEGED", Uri.fromParts("tel", charsequence.toString(), null));
        intent.setFlags(0x10000000);
        context.startActivity(intent);
    }

    public static void initiateSms(Context context, CharSequence charsequence)
    {
        Intent intent = new Intent("android.intent.action.SENDTO", Uri.fromParts("sms", charsequence.toString(), null));
        intent.setFlags(0x10000000);
        context.startActivity(intent);
    }

    public static void onDetachedFromWindowClearUp(View view)
    {
        if (mClearBitmapHandle == null)
            mClearBitmapHandle = new Handler() {

                public void handleMessage(Message message)
                {
label0:
                    {
                        Xlog.d("Utils", (new StringBuilder()).append("message = ").append(message).toString());
                        if (message.obj instanceof View)
                        {
                            View view1 = (View)message.obj;
                            if (Utils.hasInLancher(view1))
                                break label0;
                            Utils.clearView(Utils.getWidgetHostView(view1));
                            Xlog.d("Utils", "clearView imageView");
                        }
                        return;
                    }
                    Xlog.d("Utils", "no Remove imageView");
                }

            }
;
        mClearBitmapHandle.sendMessageDelayed(mClearBitmapHandle.obtainMessage(0, view), 100L);
    }
}
