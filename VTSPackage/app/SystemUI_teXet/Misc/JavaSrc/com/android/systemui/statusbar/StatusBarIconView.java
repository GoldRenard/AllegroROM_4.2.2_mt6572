// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar;

import android.app.Notification;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.*;
import android.view.accessibility.AccessibilityEvent;
import com.android.internal.statusbar.StatusBarIcon;
import java.text.NumberFormat;

// Referenced classes of package com.android.systemui.statusbar:
//            AnimatedImageView

public class StatusBarIconView extends AnimatedImageView
{

    private static final String TAG = "StatusBarIconView";
    private StatusBarIcon mIcon;
    private Notification mNotification;
    private Drawable mNumberBackground;
    private Paint mNumberPain;
    private String mNumberText;
    private int mNumberX;
    private int mNumberY;
    private int mPadding;
    private Drawable mSimInfoBackground;
    private String mSlot;

    public StatusBarIconView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        Resources resources = context.getResources();
        mPadding = resources.getDimensionPixelSize(0x7f0d0053);
        setPadding(mPadding, mPadding, mPadding, mPadding);
        int i = resources.getDimensionPixelSize(0x7f0d0017);
        float f = (float)resources.getDimensionPixelSize(0x7f0d001c) / (float)i;
        setScaleX(f);
        setScaleY(f);
        setAlpha(resources.getFraction(0x7f0d001d, 1, 1));
    }

    public StatusBarIconView(Context context, String s, Notification notification)
    {
        super(context);
        Resources resources = context.getResources();
        mPadding = resources.getDimensionPixelSize(0x7f0d0053);
        setPadding(mPadding, mPadding, mPadding, mPadding);
        mSlot = s;
        mNumberPain = new Paint();
        mNumberPain.setTextAlign(android.graphics.Paint.Align.CENTER);
        mNumberPain.setColor(resources.getColor(0x7f020254));
        mNumberPain.setAntiAlias(true);
        mNotification = notification;
        setContentDescription(notification);
        if (notification != null)
        {
            int i = resources.getDimensionPixelSize(0x7f0d0017);
            float f = (float)resources.getDimensionPixelSize(0x7f0d001c) / (float)i;
            setScaleX(f);
            setScaleY(f);
            setAlpha(resources.getFraction(0x7f0d001d, 1, 1));
        }
        setScaleType(android.widget.ImageView.ScaleType.CENTER);
    }

    public static Drawable getIcon(Context context, StatusBarIcon statusbaricon)
    {
        if (statusbaricon.iconPackage == null) goto _L2; else goto _L1
_L1:
        Resources resources;
        int i;
        Resources resources1;
        try
        {
            i = statusbaricon.user.getIdentifier();
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Slog.e("StatusBarIconView", (new StringBuilder()).append("Icon package not found: ").append(statusbaricon.iconPackage).toString());
            return null;
        }
        if (i == -1)
            i = 0;
        resources1 = context.getPackageManager().getResourcesForApplicationAsUser(statusbaricon.iconPackage, i);
        resources = resources1;
_L4:
        if (statusbaricon.iconId == 0)
            return null;
        break; /* Loop/switch isn't completed */
_L2:
        resources = context.getResources();
        if (true) goto _L4; else goto _L3
_L3:
        Drawable drawable;
        try
        {
            drawable = resources.getDrawable(statusbaricon.iconId);
        }
        catch (RuntimeException runtimeexception)
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("Icon not found in ");
            Object obj;
            if (statusbaricon.iconPackage != null)
                obj = Integer.valueOf(statusbaricon.iconId);
            else
                obj = "<system>";
            Slog.w("StatusBarIconView", stringbuilder.append(obj).append(": ").append(Integer.toHexString(statusbaricon.iconId)).toString());
            return null;
        }
        return drawable;
    }

    private Drawable getIcon(StatusBarIcon statusbaricon)
    {
        return getIcon(getContext(), statusbaricon);
    }

    private void setContentDescription(Notification notification)
    {
        if (notification != null)
        {
            CharSequence charsequence = notification.tickerText;
            if (!TextUtils.isEmpty(charsequence))
                setContentDescription(charsequence);
        }
    }

    private static boolean streq(String s, String s1)
    {
        boolean flag;
label0:
        {
            if (s == s1)
            {
                flag = true;
                break label0;
            }
            if (s == null)
            {
                flag = false;
                if (s1 != null)
                    break label0;
            }
            if (s != null)
            {
                flag = false;
                if (s1 == null)
                    break label0;
            }
            return s.equals(s1);
        }
        return flag;
    }

    protected void debug(int i)
    {
        super.debug(i);
        Log.d("View", (new StringBuilder()).append(debugIndent(i)).append("slot=").append(mSlot).toString());
        Log.d("View", (new StringBuilder()).append(debugIndent(i)).append("icon=").append(mIcon).toString());
    }

    public long getNotificationSimId()
    {
        return mNotification.simId;
    }

    public Drawable getSimInfoBackground()
    {
        return mSimInfoBackground;
    }

    public StatusBarIcon getStatusBarIcon()
    {
        return mIcon;
    }

    protected void onDraw(Canvas canvas)
    {
        if (mSimInfoBackground != null)
        {
            mSimInfoBackground.setBounds(0, 0, getWidth(), getHeight());
            mSimInfoBackground.draw(canvas);
        }
        super.onDraw(canvas);
        if (mNumberBackground != null)
        {
            mNumberBackground.draw(canvas);
            canvas.drawText(mNumberText, mNumberX, mNumberY, mNumberPain);
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        if (mNotification != null)
            accessibilityevent.setParcelableData(mNotification);
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        if (mNumberBackground != null)
            placeNumber();
    }

    void placeNumber()
    {
        int i = mContext.getResources().getInteger(0x10e0003);
        String s;
        if (mIcon.number > i)
            s = mContext.getResources().getString(0x1040017);
        else
            s = NumberFormat.getIntegerInstance().format(mIcon.number);
        mNumberText = s;
        int j = getWidth();
        int k = getHeight();
        Rect rect = new Rect();
        mNumberPain.getTextBounds(s, 0, s.length(), rect);
        int l = rect.right - rect.left;
        int i1 = rect.bottom - rect.top;
        mNumberBackground.getPadding(rect);
        int j1 = l + rect.left + rect.right;
        if (j1 < mNumberBackground.getMinimumWidth())
            j1 = mNumberBackground.getMinimumWidth();
        mNumberX = j - rect.right - (j1 - rect.right - rect.left) / 2;
        int k1 = i1 + rect.top + rect.bottom;
        if (k1 < mNumberBackground.getMinimumWidth())
            k1 = mNumberBackground.getMinimumWidth();
        mNumberY = k - rect.bottom - (k1 - rect.top - i1 - rect.bottom) / 2;
        mNumberBackground.setBounds(j - j1, k - k1, j, k);
    }

    public boolean set(StatusBarIcon statusbaricon)
    {
        boolean flag;
        if (mIcon != null && streq(mIcon.iconPackage, statusbaricon.iconPackage) && mIcon.iconId == statusbaricon.iconId)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (flag && mIcon.iconLevel == statusbaricon.iconLevel)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (mIcon != null && mIcon.visible == statusbaricon.visible)
            flag2 = true;
        else
            flag2 = false;
        boolean flag3;
        if (mIcon != null && mIcon.number == statusbaricon.number)
            flag3 = true;
        else
            flag3 = false;
        mIcon = statusbaricon.clone();
        setContentDescription(statusbaricon.contentDescription);
        if (!flag)
        {
            Drawable drawable = getIcon(statusbaricon);
            if (drawable == null)
            {
                Slog.w("StatusBarIconView", (new StringBuilder()).append("No icon for slot ").append(mSlot).toString());
                return false;
            }
            setImageDrawable(drawable);
        }
        if (!flag1)
            setImageLevel(statusbaricon.iconLevel);
        if (!flag3)
        {
            if (statusbaricon.number > 0 && mContext.getResources().getBoolean(0x7f0a0003))
            {
                if (mNumberBackground == null)
                    mNumberBackground = getContext().getResources().getDrawable(0x7f02001f);
                placeNumber();
            } else
            {
                mNumberBackground = null;
                mNumberText = null;
            }
            invalidate();
        }
        if (!flag2)
        {
            boolean flag4 = statusbaricon.visible;
            byte byte0 = 0;
            if (!flag4)
                byte0 = 8;
            setVisibility(byte0);
        }
        return true;
    }

    public void setSimInfoBackground(Drawable drawable)
    {
        mSimInfoBackground = drawable;
    }

    public String toString()
    {
        return (new StringBuilder()).append("StatusBarIconView(slot=").append(mSlot).append(" icon=").append(mIcon).append(" notification=").append(mNotification).append(")").toString();
    }
}
