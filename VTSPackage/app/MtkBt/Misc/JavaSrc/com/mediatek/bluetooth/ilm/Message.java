// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.ilm;

import com.mediatek.bluetooth.util.ConvertUtils;
import java.nio.*;

public class Message
{

    protected static final int ILM[] = {
        0, 2076
    };
    protected static final int ILM_BA_ILM_DATA = 28;
    protected static final int ILM_BL_ILM_DATA = 2048;
    protected static final int ILM_B_SAP_ID = 20;
    protected static final int ILM_B_USED = 0;
    protected static final int ILM_I_DEST_MOD_ID = 4;
    protected static final int ILM_I_LOCAL_PARA_PTR = 2;
    protected static final int ILM_I_MSG_ID = 1;
    protected static final int ILM_I_PEER_BUFF_PTR = 6;
    protected static final int ILM_I_SRC_MOD_ID = 3;
    private ByteBuffer buffer;
    protected int id;
    protected int size;

    public Message(int i, ByteBuffer bytebuffer)
    {
        id = i;
        size = bytebuffer.capacity();
        buffer = bytebuffer.order(ByteOrder.nativeOrder());
    }

    public Message(int ai[])
    {
        id = ai[0];
        size = ai[1];
        buffer = ByteBuffer.allocateDirect(ai[1]).order(ByteOrder.nativeOrder());
    }

    protected ByteBuffer getBuffer()
    {
        return buffer;
    }

    protected ByteBuffer getBuffer(int i, int j)
    {
        buffer.position(i);
        buffer.limit(i + j);
        ByteBuffer bytebuffer = buffer.slice();
        bytebuffer.order(ByteOrder.nativeOrder());
        buffer.position(0);
        buffer.limit(buffer.capacity());
        return bytebuffer;
    }

    public byte getByte(int i)
    {
        return buffer.get(i);
    }

    public byte[] getByteArray(int i, int j)
    {
        byte abyte0[] = new byte[j];
        buffer.position(i);
        buffer.limit(i + j);
        buffer.slice().order(ByteOrder.nativeOrder()).get(abyte0);
        buffer.position(0);
        buffer.limit(buffer.capacity());
        return abyte0;
    }

    public int getId()
    {
        return id;
    }

    public int getInt(int i)
    {
        return buffer.asIntBuffer().get(i);
    }

    public long getLong(int i)
    {
        return buffer.asLongBuffer().get(i);
    }

    public short getShort(int i)
    {
        return buffer.asShortBuffer().get(i);
    }

    public void setByte(int i, byte byte0)
    {
        buffer.put(i, byte0);
    }

    public void setByteArray(int i, int j, byte abyte0[])
    {
        if (abyte0 != null && abyte0.length == j)
        {
            buffer.position(i);
            buffer.put(abyte0);
            buffer.rewind();
            return;
        } else
        {
            throw new IllegalArgumentException((new StringBuilder()).append("value[").append(abyte0).append("] is null or length doesn't equal to [").append(j).append("]").toString());
        }
    }

    public void setInt(int i, int j)
    {
        buffer.asIntBuffer().put(i, j);
    }

    public void setLong(int i, long l)
    {
        buffer.asLongBuffer().put(i, l);
    }

    public void setShort(int i, short word0)
    {
        buffer.asShortBuffer().put(i, word0);
    }

    public int size()
    {
        return size;
    }

    public String toHexString()
    {
        return ConvertUtils.toHexString(buffer);
    }

    public String toPrintString()
    {
        return (new StringBuilder()).append("name[").append(id).append("], ").append("size[").append(size()).append("], ").toString();
    }

}
