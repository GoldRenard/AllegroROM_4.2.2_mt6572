// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.service.dreams.DreamService;

public class BeanBagDream extends DreamService
{

    private BeanBag.Board mBoard;


    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        setInteractive(true);
        setFullscreen(true);
        mBoard = new BeanBag.Board(this, null);
        setContentView(mBoard);
    }

    public void onDreamingStarted()
    {
        super.onDreamingStarted();
        mBoard.startAnimation();
    }

    public void onDreamingStopped()
    {
        mBoard.stopAnimation();
        super.onDreamingStopped();
    }
}
