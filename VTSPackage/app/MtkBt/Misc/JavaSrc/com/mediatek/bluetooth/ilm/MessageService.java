// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.ilm;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import com.mediatek.bluetooth.util.BtLog;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.mediatek.bluetooth.ilm:
//            Message, ilm_native, MessageListener

public class MessageService extends Service
    implements Runnable
{

    public static final int MSG_ID_SYS_SHUTDOWN_SERVICE_REQ = -1;
    private static Message SHUTDOWN_SERVICE_REQUEST;
    protected int clientSocketFd;
    protected boolean isListening;
    protected ArrayList listenerList;
    protected int serverSocketFd;

    public MessageService()
    {
        clientSocketFd = -1;
        serverSocketFd = -1;
    }

    protected void closeSocket(int i)
    {
        BtLog.d((new StringBuilder()).append("MessageService.closeSocket()[+]:").append(i).toString());
        if (i >= 0)
            ilm_native.close_socket(i);
    }

    public IBinder onBind(Intent intent)
    {
        BtLog.e("MessageService.onBind(): unimplemented function.");
        return null;
    }

    public void onCreate()
    {
        BtLog.i("MessageService.onCreate()[+]");
        isListening = false;
        listenerList = new ArrayList(2);
        serverSocketFd = openSocket(true, serverSocketFd, "bt.ext.adp.prx", 0);
        clientSocketFd = openSocket(false, clientSocketFd, "/dev/socket/bt.int.adp", 2);
        if (serverSocketFd > -1 && clientSocketFd > -1)
        {
            startListen();
            return;
        } else
        {
            BtLog.e("MessageService.onCreate() error: can't create server & client sockets.");
            return;
        }
    }

    public void onDestroy()
    {
        BtLog.i("MessageService.onDestroy()[+]");
        closeSocket(clientSocketFd);
        stopListen();
    }

    protected int openSocket(boolean flag, int i, String s, int j)
    {
        if (i >= 0)
            closeSocket(i);
        int k;
        if (flag)
            k = ilm_native.create_server_socket(s, j);
        else
            k = ilm_native.create_client_socket(s, j);
        if (k < 0)
            BtLog.e((new StringBuilder()).append("MessageService.openSocket() error: isServer[").append(flag).append("], fd[").append(k).append("], name[").append(s).append("], namespace[").append(j).append("]").toString());
        return k;
    }

    public void registerMessageListener(MessageListener messagelistener)
    {
        this;
        JVM INSTR monitorenter ;
        listenerList.add(messagelistener);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void run()
    {
        isListening = true;
_L1:
        if (!isListening)
            break MISSING_BLOCK_LABEL_81;
        BtLog.d("MessageService.run() - listening message...");
        Message message;
        int i;
        message = new Message(Message.ILM);
        if (ilm_native.recv_message(serverSocketFd, message) != 1)
            break MISSING_BLOCK_LABEL_167;
        BtLog.d((new StringBuilder()).append("MessageService.run(): recv message[").append(message.toPrintString()).append("]").toString());
        i = message.getInt(1);
        if (i != -1)
            break MISSING_BLOCK_LABEL_95;
        closeSocket(serverSocketFd);
        listenerList = null;
        return;
        try
        {
            short word0 = message.getBuffer(28, 4).asShortBuffer().get(1);
            Iterator iterator = listenerList.iterator();
            while (iterator.hasNext()) 
                ((MessageListener)iterator.next()).onMessageReceived(i, message.getBuffer(28, word0));
        }
        catch (Exception exception)
        {
            BtLog.e("MessageService.run() error: ", exception);
        }
          goto _L1
        BtLog.w("MessageService.run(): revc_message() failed");
          goto _L1
    }

    public void send(Message message)
    {
        BtLog.d((new StringBuilder()).append("send()[+]: msgId[").append(message.getId()).append("]").toString());
        Message message1 = new Message(Message.ILM);
        message1.setInt(1, message.getId());
        message1.setInt(3, 2);
        message1.setInt(4, 0);
        ByteBuffer bytebuffer = message.getBuffer();
        ByteBuffer bytebuffer1 = message1.getBuffer();
        bytebuffer1.position(28);
        bytebuffer1.put(bytebuffer);
        bytebuffer.flip();
        int i = -2048 + message1.size() + message.size();
        ilm_native.send_message(clientSocketFd, message1, i);
    }

    protected void startListen()
    {
        BtLog.d("MessageService.startListen()[+]");
        (new Thread(this, "MessageServiceThread")).start();
    }

    protected void stopListen()
    {
        this;
        JVM INSTR monitorenter ;
        if (isListening)
        {
            isListening = false;
            int i = ilm_native.create_client_socket("bt.ext.adp.prx", 0);
            ilm_native.send_message(i, SHUTDOWN_SERVICE_REQUEST, -2048 + SHUTDOWN_SERVICE_REQUEST.size());
            ilm_native.close_socket(i);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void unregisterMessageListener(MessageListener messagelistener)
    {
        this;
        JVM INSTR monitorenter ;
        listenerList.remove(messagelistener);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    static 
    {
        SHUTDOWN_SERVICE_REQUEST = new Message(Message.ILM);
        SHUTDOWN_SERVICE_REQUEST.setInt(1, -1);
    }
}
