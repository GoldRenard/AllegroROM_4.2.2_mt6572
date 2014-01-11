// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.*;

// Referenced classes of package android.widget:
//            ImageView

public class GestureImageView extends ImageView
    implements android.view.GestureDetector.OnGestureListener
{

    private static final String ACTION_ENTER_WEATHER_SETTING = "com.weather.action.ENTERSETTING";
    private static final String ACTION_SCROLL = "com.weather.action.SCROLL";
    private static final String DIRECTION = "Dircetion";
    private static final String DIRECTION_NEXT = "direction_next";
    private static final String DIRECTION_PREVIOUS = "direction_previous";
    private static final String TAG = "GestureImageView";
    private GestureDetector gestureDetector;
    private int mAppWidgetId;
    private long sendTime;

    public GestureImageView(Context context)
    {
        super(context);
        init(context);
    }

    public GestureImageView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        init(context);
    }

    public GestureImageView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        init(context);
    }

    private void init(Context context)
    {
        gestureDetector = new GestureDetector(context, this);
    }

    public boolean onDown(MotionEvent motionevent)
    {
        return true;
    }

    public boolean onFling(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
    {
        if (SystemClock.elapsedRealtime() - sendTime < 1000L)
            return true;
        Intent intent = new Intent("com.weather.action.SCROLL");
        intent.putExtra("appWidgetId", mAppWidgetId);
        if (f1 > 0.0F)
            intent.putExtra("Dircetion", "direction_next");
        else
            intent.putExtra("Dircetion", "direction_previous");
        getContext().sendBroadcast(intent);
        sendTime = SystemClock.elapsedRealtime();
        return true;
    }

    public void onLongPress(MotionEvent motionevent)
    {
    }

    public boolean onScroll(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
    {
        if (SystemClock.elapsedRealtime() - sendTime >= 1000L)
        {
            float f2 = Math.abs(f);
            float f3 = Math.abs(f1);
            if (f2 <= f3)
            {
                getParent().requestDisallowInterceptTouchEvent(true);
                if (f2 > 5F && f3 > 7F)
                {
                    Intent intent = new Intent("com.weather.action.SCROLL");
                    intent.putExtra("appWidgetId", mAppWidgetId);
                    if (f1 < 0.0F)
                        intent.putExtra("Dircetion", "direction_next");
                    else
                        intent.putExtra("Dircetion", "direction_previous");
                    getContext().sendBroadcast(intent);
                    sendTime = SystemClock.elapsedRealtime();
                    return true;
                } else
                {
                    return false;
                }
            }
        }
        return true;
    }

    public void onShowPress(MotionEvent motionevent)
    {
    }

    public boolean onSingleTapUp(MotionEvent motionevent)
    {
        Intent intent = new Intent("com.weather.action.ENTERSETTING");
        getContext().sendBroadcast(intent);
        return false;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return gestureDetector.onTouchEvent(motionevent);
    }

    public void setWidgetId(int i)
    {
        mAppWidgetId = i;
    }
}
