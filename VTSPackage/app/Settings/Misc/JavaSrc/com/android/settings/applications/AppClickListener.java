// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.view.View;
import android.widget.AdapterView;

interface AppClickListener
{

    public abstract void onItemClick(ManageApplications.TabInfo tabinfo, AdapterView adapterview, View view, int i, long l);
}
