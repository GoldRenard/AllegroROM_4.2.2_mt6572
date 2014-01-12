// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.ilm;

import java.nio.ByteBuffer;

public interface MessageListener
{

    public abstract void onMessageReceived(int i, ByteBuffer bytebuffer);
}
