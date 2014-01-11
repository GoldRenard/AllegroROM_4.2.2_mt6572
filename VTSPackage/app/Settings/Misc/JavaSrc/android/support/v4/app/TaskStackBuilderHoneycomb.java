// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.app;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

public class TaskStackBuilderHoneycomb
{


    public static PendingIntent getActivitiesPendingIntent(Context context, int i, Intent aintent[], int j)
    {
        return PendingIntent.getActivities(context, i, aintent, j);
    }
}
