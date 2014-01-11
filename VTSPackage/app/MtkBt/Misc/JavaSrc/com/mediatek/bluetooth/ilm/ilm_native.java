// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.ilm;

import java.nio.ByteBuffer;

// Referenced classes of package com.mediatek.bluetooth.ilm:
//            Message

public class ilm_native
{

    public static final int END_OF_MOD_ID = 5;
    public static final int EXT_IL_SOCKET_NAMESPACE_ABSTRACT = 0;
    public static final int EXT_IL_SOCKET_NAMESPACE_FILESYSTEM = 2;
    public static final int EXT_IL_SOCKET_NAMESPACE_RESERVED = 1;
    public static final int MAX_ILM_BUFFER_SIZE = 2048;
    public static final int MOD_BT = 0;
    public static final int MOD_MMI = 2;
    public static final int MOD_SPP_DEFAULT = 4;
    public static final int MOD_TIMER = 1;
    public static final int MOD_TST = 3;
    public static final int NULL;


    public static native void close_socket(int i);

    public static native int create_client_socket(String s, int i);

    public static native int create_server_socket(String s, int i);

    public static native void print_message_id();

    public static int recv_message(int i, Message message)
    {
        ByteBuffer bytebuffer;
        if (message == null)
            bytebuffer = null;
        else
            bytebuffer = message.getBuffer();
        return recv_message0(i, bytebuffer);
    }

    private static native int recv_message0(int i, ByteBuffer bytebuffer);

    public static int send_message(int i, Message message, int j)
    {
        ByteBuffer bytebuffer;
        if (message == null)
            bytebuffer = null;
        else
            bytebuffer = message.getBuffer();
        return send_message0(i, bytebuffer, j);
    }

    private static native int send_message0(int i, ByteBuffer bytebuffer, int j);

    static 
    {
        System.loadLibrary("extsys_jni");
    }
}
