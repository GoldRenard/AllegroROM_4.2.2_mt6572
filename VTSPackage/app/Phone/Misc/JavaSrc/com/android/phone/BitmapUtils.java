// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.graphics.Bitmap;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.util.Log;

public class BitmapUtils
{

    private static final int BLUE_MASK = 255;
    private static final boolean DBG = false;
    private static final int GREEN_MASK = 65280;
    private static final int GREEN_MASK_SHIFT = 8;
    private static final int RED_MASK = 0xff0000;
    private static final int RED_MASK_SHIFT = 16;
    private static final String TAG = "BitmapUtils";

    private BitmapUtils()
    {
    }

    public static Bitmap createBlurredBitmap(Bitmap bitmap)
    {
        if (DBG)
            log("createBlurredBitmap()...");
        long l = SystemClock.uptimeMillis();
        Bitmap bitmap2;
        if (bitmap == null)
        {
            Log.w("BitmapUtils", "createBlurredBitmap: null bitmap");
            bitmap2 = null;
        } else
        {
            if (DBG)
                log((new StringBuilder()).append("- input bitmap: ").append(bitmap.getWidth()).append(" x ").append(bitmap.getHeight()).toString());
            Bitmap bitmap1 = Bitmap.createScaledBitmap(bitmap, 128, 128, true);
            if (DBG)
                log((new StringBuilder()).append("- after resize: ").append(bitmap1.getWidth()).append(" x ").append(bitmap1.getHeight()).toString());
            bitmap2 = gaussianBlur(bitmap1);
            if (DBG)
                log((new StringBuilder()).append("- after blur: ").append(bitmap2.getWidth()).append(" x ").append(bitmap2.getHeight()).toString());
            long l1 = SystemClock.uptimeMillis();
            if (DBG)
            {
                log((new StringBuilder()).append("createBlurredBitmap() done (elapsed = ").append(l1 - l).append(" msec)").toString());
                return bitmap2;
            }
        }
        return bitmap2;
    }

    public static Bitmap gaussianBlur(Bitmap bitmap)
    {
        int i = bitmap.getWidth();
        int j = bitmap.getHeight();
        if (DBG)
            log((new StringBuilder()).append("gaussianBlur(): input: ").append(i).append(" x ").append(j).toString());
        int k = i * j;
        int ai[] = new int[k];
        int ai1[] = new int[k];
        bitmap.getPixels(ai, 0, i, 0, 0, i, j);
        gaussianBlurFilter(ai, ai1, i, j);
        gaussianBlurFilter(ai1, ai, i, j);
        Bitmap bitmap1 = Bitmap.createBitmap(ai, i, j, android.graphics.Bitmap.Config.ARGB_8888);
        bitmap.recycle();
        return bitmap1;
    }

    private static void gaussianBlurFilter(int ai[], int ai1[], int i, int j)
    {
        int ai2[] = {
            13, 23, 32, 39, 42, 39, 32, 23, 13
        };
        int k = 0;
        int l = i - 1;
        for (int i1 = 0; i1 < j; i1++)
        {
            int j1 = i1;
            for (int k1 = 0; k1 < i; k1++)
            {
                int l1 = 0;
                int i2 = 0;
                int j2 = 0;
                for (int k2 = -4; k2 <= 4; k2++)
                {
                    int l2 = ai[k + (l & k1 + k2)];
                    int i3 = ai2[k2 + 4];
                    l1 += i3 * ((0xff0000 & l2) >> 16);
                    i2 += i3 * ((0xff00 & l2) >> 8);
                    j2 += i3 * (l2 & 0xff);
                }

                ai1[j1] = 0xff000000 | (l1 >> 8) << 16 | (i2 >> 8) << 8 | j2 >> 8;
                j1 += j;
            }

            k += i;
        }

    }

    private static void log(String s)
    {
        Log.d("BitmapUtils", s);
    }

    static 
    {
        boolean flag = true;
        if (SystemProperties.getInt("ro.debuggable", 0) != flag)
            flag = false;
        DBG = flag;
    }
}
