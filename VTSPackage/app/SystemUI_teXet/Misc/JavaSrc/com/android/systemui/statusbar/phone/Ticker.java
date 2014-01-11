// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.app.Notification;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.*;
import com.android.internal.statusbar.StatusBarIcon;
import com.android.internal.statusbar.StatusBarNotification;
import com.android.internal.util.CharSequences;
import com.android.systemui.statusbar.StatusBarIconView;
import java.util.ArrayList;

public abstract class Ticker
{
    private final class Segment
    {

        int current;
        boolean first;
        Drawable icon;
        int next;
        StatusBarNotification notification;
        CharSequence text;
        final Ticker this$0;

        CharSequence advance()
        {
            first = false;
            int i = next;
            int j;
            for (j = text.length(); i < j && !Ticker.isGraphicOrEmoji(text.charAt(i)); i++);
            if (i >= j)
                return null;
            CharSequence charsequence = text.subSequence(i, text.length());
            StaticLayout staticlayout = getLayout(charsequence);
            int k = staticlayout.getLineCount();
            for (int l = 0; l < k; l++)
            {
                int i1 = staticlayout.getLineStart(l);
                int j1 = staticlayout.getLineEnd(l);
                if (l == k - 1)
                    next = j;
                else
                    next = i + staticlayout.getLineStart(l + 1);
                CharSequence charsequence1 = rtrim(charsequence, i1, j1);
                if (charsequence1 != null)
                {
                    current = i + i1;
                    return charsequence1;
                }
            }

            current = j;
            return null;
        }

        StaticLayout getLayout(CharSequence charsequence)
        {
            int i = mTextSwitcher.getWidth() - mTextSwitcher.getPaddingLeft() - mTextSwitcher.getPaddingRight();
            TextPaint textpaint = mPaint;
            int j;
            if (i > 0)
                j = i;
            else
                j = 0;
            return new StaticLayout(charsequence, textpaint, j, android.text.Layout.Alignment.ALIGN_NORMAL, 1.0F, 0.0F, true);
        }

        CharSequence getText()
        {
            if (current > text.length())
                return null;
            CharSequence charsequence = text.subSequence(current, text.length());
            StaticLayout staticlayout = getLayout(charsequence);
            int i = staticlayout.getLineCount();
            if (i > 0)
            {
                int j = staticlayout.getLineStart(0);
                int k = staticlayout.getLineEnd(0);
                next = k + current;
                return rtrim(charsequence, j, k);
            } else
            {
                throw new RuntimeException((new StringBuilder()).append("lineCount=").append(i).append(" current=").append(current).append(" text=").append(text).toString());
            }
        }

        CharSequence rtrim(CharSequence charsequence, int i, int j)
        {
            for (; j > i && !Ticker.isGraphicOrEmoji(charsequence.charAt(j - 1)); j--);
            if (j > i)
                return charsequence.subSequence(i, j);
            else
                return null;
        }

        Segment(StatusBarNotification statusbarnotification, Drawable drawable, CharSequence charsequence)
        {
            this$0 = Ticker.this;
            super();
            notification = statusbarnotification;
            icon = drawable;
            text = charsequence;
            int i = 0;
            for (int j = charsequence.length(); i < j && !Ticker.isGraphicOrEmoji(charsequence.charAt(i)); i++);
            current = i;
            next = i;
            first = true;
        }
    }


    private static final int TICKER_SEGMENT_DELAY = 3000;
    private Runnable mAdvanceTicker;
    private Context mContext;
    private Handler mHandler;
    private float mIconScale;
    private ImageSwitcher mIconSwitcher;
    private TextPaint mPaint;
    private ArrayList mSegments;
    private TextSwitcher mTextSwitcher;
    private View mTickerView;

    public Ticker(Context context, View view)
    {
        mHandler = new Handler();
        mSegments = new ArrayList();
        mAdvanceTicker = new Runnable() {

            final Ticker this$0;

            public void run()
            {
label0:
                {
                    CharSequence charsequence;
                    do
                    {
                        if (mSegments.size() <= 0)
                            break label0;
                        Segment segment = (Segment)mSegments.get(0);
                        if (segment.first)
                            mIconSwitcher.setImageDrawable(segment.icon);
                        charsequence = segment.advance();
                        if (charsequence != null)
                            break;
                        mSegments.remove(0);
                    } while (true);
                    mTextSwitcher.setText(charsequence);
                    scheduleAdvance();
                }
                if (mSegments.size() == 0)
                    tickerDone();
            }

            
            {
                this$0 = Ticker.this;
                super();
            }
        }
;
        mContext = context;
        Resources resources = context.getResources();
        int i = resources.getDimensionPixelSize(0x7f0d0017);
        mIconScale = (float)resources.getDimensionPixelSize(0x7f0d001c) / (float)i;
        mTickerView = view.findViewById(0x7f080055);
        mIconSwitcher = (ImageSwitcher)view.findViewById(0x7f080056);
        mIconSwitcher.setInAnimation(AnimationUtils.loadAnimation(context, 0x10a0037));
        mIconSwitcher.setOutAnimation(AnimationUtils.loadAnimation(context, 0x10a0038));
        mIconSwitcher.setScaleX(mIconScale);
        mIconSwitcher.setScaleY(mIconScale);
        mTextSwitcher = (TextSwitcher)view.findViewById(0x7f080057);
        mTextSwitcher.setInAnimation(AnimationUtils.loadAnimation(context, 0x10a0037));
        mTextSwitcher.setOutAnimation(AnimationUtils.loadAnimation(context, 0x10a0038));
        mPaint = ((TextView)mTextSwitcher.getChildAt(0)).getPaint();
    }

    public static boolean isGraphicOrEmoji(char c)
    {
        int i = Character.getType(c);
        return i != 15 && i != 16 && i != 0 && i != 13 && i != 14 && i != 12;
    }

    private void scheduleAdvance()
    {
        mHandler.postDelayed(mAdvanceTicker, 3000L);
    }

    public void addEntry(StatusBarNotification statusbarnotification)
    {
label0:
        {
            int i = mSegments.size();
            if (i > 0)
            {
                Segment segment3 = (Segment)mSegments.get(0);
                if (statusbarnotification.pkg.equals(segment3.notification.pkg) && statusbarnotification.notification.icon == segment3.notification.notification.icon && statusbarnotification.notification.iconLevel == segment3.notification.notification.iconLevel && CharSequences.equals(segment3.notification.notification.tickerText, statusbarnotification.notification.tickerText))
                    break label0;
            }
            Segment segment = new Segment(statusbarnotification, StatusBarIconView.getIcon(mContext, new StatusBarIcon(statusbarnotification.pkg, statusbarnotification.user, statusbarnotification.notification.icon, statusbarnotification.notification.iconLevel, 0, statusbarnotification.notification.tickerText)), statusbarnotification.notification.tickerText);
            for (int j = 0; j < mSegments.size(); j++)
            {
                Segment segment2 = (Segment)mSegments.get(j);
                if (statusbarnotification.id == segment2.notification.id && statusbarnotification.pkg.equals(segment2.notification.pkg))
                {
                    ArrayList arraylist = mSegments;
                    int k = j - 1;
                    arraylist.remove(j);
                    j = k;
                }
            }

            mSegments.add(segment);
            if (i == 0 && mSegments.size() > 0)
            {
                Segment segment1 = (Segment)mSegments.get(0);
                segment1.first = false;
                mIconSwitcher.setAnimateFirstView(false);
                mIconSwitcher.reset();
                mIconSwitcher.setImageDrawable(segment1.icon);
                mTextSwitcher.setAnimateFirstView(false);
                mTextSwitcher.reset();
                mTextSwitcher.setText(segment1.getText());
                tickerStarting();
                scheduleAdvance();
                return;
            }
        }
    }

    public void halt()
    {
        mHandler.removeCallbacks(mAdvanceTicker);
        mSegments.clear();
        tickerHalting();
    }

    public void reflowText()
    {
        if (mSegments.size() > 0)
        {
            CharSequence charsequence = ((Segment)mSegments.get(0)).getText();
            mTextSwitcher.setCurrentText(charsequence);
        }
    }

    public void removeEntry(StatusBarNotification statusbarnotification)
    {
        for (int i = -1 + mSegments.size(); i >= 0; i--)
        {
            Segment segment = (Segment)mSegments.get(i);
            if (statusbarnotification.id == segment.notification.id && statusbarnotification.pkg.equals(segment.notification.pkg))
                mSegments.remove(i);
        }

    }

    public abstract void tickerDone();

    public abstract void tickerHalting();

    public abstract void tickerStarting();





}
