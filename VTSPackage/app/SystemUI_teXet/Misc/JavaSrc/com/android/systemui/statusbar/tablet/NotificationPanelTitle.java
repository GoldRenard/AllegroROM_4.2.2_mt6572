// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.widget.RelativeLayout;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.android.systemui.statusbar.tablet:
//            NotificationPanel

public class NotificationPanelTitle extends RelativeLayout
    implements android.view.View.OnClickListener
{

    private ArrayList buttons;
    private NotificationPanel mPanel;
    private View mSettingsButton;

    public NotificationPanelTitle(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        buttons = new ArrayList();
        setOnClickListener(this);
    }

    public void onClick(View view)
    {
        if (mSettingsButton.isEnabled() && view == this)
            mPanel.swapPanels();
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        ArrayList arraylist = buttons;
        View view = findViewById(0x7f0800ac);
        mSettingsButton = view;
        arraylist.add(view);
        buttons.add(findViewById(0x7f0800ad));
    }

    public boolean onRequestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityevent)
    {
        if (super.onRequestSendAccessibilityEvent(view, accessibilityevent))
        {
            AccessibilityEvent accessibilityevent1 = AccessibilityEvent.obtain();
            onInitializeAccessibilityEvent(accessibilityevent1);
            dispatchPopulateAccessibilityEvent(accessibilityevent1);
            accessibilityevent.appendRecord(accessibilityevent1);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (!mSettingsButton.isEnabled())
            return false;
        switch (motionevent.getAction())
        {
        default:
            break;

        case 3: // '\003'
            setPressed(false);
            break;

        case 1: // '\001'
            if (isPressed())
            {
                playSoundEffect(0);
                mPanel.swapPanels();
                setPressed(false);
            }
            break;

        case 2: // '\002'
            int i = (int)motionevent.getX();
            int j = (int)motionevent.getY();
            boolean flag = false;
            if (i > 0)
            {
                int k = getWidth();
                flag = false;
                if (i < k)
                {
                    flag = false;
                    if (j > 0)
                    {
                        int l = getHeight();
                        flag = false;
                        if (j < l)
                            flag = true;
                    }
                }
            }
            setPressed(flag);
            break;

        case 0: // '\0'
            setPressed(true);
            break;
        }
        return true;
    }

    public void setPanel(NotificationPanel notificationpanel)
    {
        mPanel = notificationpanel;
    }

    public void setPressed(boolean flag)
    {
        super.setPressed(flag);
        Iterator iterator = buttons.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            View view = (View)iterator.next();
            if (view != null)
                view.setPressed(flag);
        } while (true);
    }
}
