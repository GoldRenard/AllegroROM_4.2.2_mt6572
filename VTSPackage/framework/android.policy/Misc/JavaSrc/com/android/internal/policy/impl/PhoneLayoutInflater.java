// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;

public class PhoneLayoutInflater extends LayoutInflater
{

    private static final String sClassPrefixList[] = {
        "android.widget.", "android.webkit."
    };

    public PhoneLayoutInflater(Context context)
    {
        super(context);
    }

    protected PhoneLayoutInflater(LayoutInflater layoutinflater, Context context)
    {
        super(layoutinflater, context);
    }

    public LayoutInflater cloneInContext(Context context)
    {
        return new PhoneLayoutInflater(this, context);
    }

    protected View onCreateView(String s, AttributeSet attributeset)
        throws ClassNotFoundException
    {
        String as[];
        int i;
        int j;
        as = sClassPrefixList;
        i = as.length;
        j = 0;
_L3:
        if (j >= i) goto _L2; else goto _L1
_L1:
        String s1 = as[j];
        View view = createView(s, s1, attributeset);
        if (view != null)
            return view;
        continue; /* Loop/switch isn't completed */
        ClassNotFoundException classnotfoundexception;
        classnotfoundexception;
        j++;
          goto _L3
_L2:
        return super.onCreateView(s, attributeset);
    }

}
