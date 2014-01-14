// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.media;

import android.content.Context;
import android.media.*;
import android.net.Uri;
import android.os.*;
import android.util.Slog;
import com.android.systemui.SystemUI;
import com.google.android.collect.Maps;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.*;

// Referenced classes of package com.android.systemui.media:
//            NotificationPlayer

public class RingtonePlayer extends SystemUI
{
    private class Client
        implements android.os.IBinder.DeathRecipient
    {

        private final Ringtone mRingtone;
        private final IBinder mToken;
        final RingtonePlayer this$0;

        public void binderDied()
        {
            synchronized (mClients)
            {
                mClients.remove(mToken);
            }
            mRingtone.stop();
            return;
            exception;
            hashmap;
            JVM INSTR monitorexit ;
            throw exception;
        }



        public Client(IBinder ibinder, Uri uri, UserHandle userhandle, int i)
        {
            this$0 = RingtonePlayer.this;
            super();
            mToken = ibinder;
            mRingtone = new Ringtone(getContextForUser(userhandle), false);
            mRingtone.setStreamType(i);
            mRingtone.setUri(uri);
        }
    }


    private static final boolean LOGD = false;
    private static final String TAG = "RingtonePlayer";
    private final NotificationPlayer mAsyncPlayer = new NotificationPlayer("RingtonePlayer");
    private IAudioService mAudioService;
    private IRingtonePlayer mCallback;
    private final HashMap mClients = Maps.newHashMap();

    public RingtonePlayer()
    {
        mCallback = new android.media.IRingtonePlayer.Stub() {

            final RingtonePlayer this$0;

            public boolean isPlaying(IBinder ibinder)
            {
                Client client;
                synchronized (mClients)
                {
                    client = (Client)mClients.get(ibinder);
                }
                if (client != null)
                    return client.mRingtone.isPlaying();
                else
                    return false;
                exception;
                hashmap;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void play(IBinder ibinder, Uri uri, int i)
                throws RemoteException
            {
                HashMap hashmap = mClients;
                hashmap;
                JVM INSTR monitorenter ;
                Client client = (Client)mClients.get(ibinder);
                if (client != null)
                    break MISSING_BLOCK_LABEL_79;
                UserHandle userhandle = Binder.getCallingUserHandle();
                client = new Client(ibinder, uri, userhandle, i);
                ibinder.linkToDeath(client, 0);
                mClients.put(ibinder, client);
                hashmap;
                JVM INSTR monitorexit ;
                client.mRingtone.play();
                return;
                Exception exception;
                exception;
                hashmap;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void playAsync(Uri uri, UserHandle userhandle, boolean flag, int i)
            {
                if (Binder.getCallingUid() != 1000)
                {
                    throw new SecurityException("Async playback only available from system UID.");
                } else
                {
                    mAsyncPlayer.play(getContextForUser(userhandle), uri, flag, i);
                    return;
                }
            }

            public void stop(IBinder ibinder)
            {
                Client client;
                synchronized (mClients)
                {
                    client = (Client)mClients.remove(ibinder);
                }
                if (client != null)
                {
                    client.mToken.unlinkToDeath(client, 0);
                    client.mRingtone.stop();
                }
                return;
                exception;
                hashmap;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void stopAsync()
            {
                if (Binder.getCallingUid() != 1000)
                {
                    throw new SecurityException("Async playback only available from system UID.");
                } else
                {
                    mAsyncPlayer.stop();
                    return;
                }
            }

            
            {
                this$0 = RingtonePlayer.this;
                super();
            }
        }
;
    }

    private Context getContextForUser(UserHandle userhandle)
    {
        Context context;
        try
        {
            context = super.mContext.createPackageContextAsUser(super.mContext.getPackageName(), 0, userhandle);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            throw new RuntimeException(namenotfoundexception);
        }
        return context;
    }

    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        printwriter.println("Clients:");
        HashMap hashmap = mClients;
        hashmap;
        JVM INSTR monitorenter ;
        Client client;
        for (Iterator iterator = mClients.values().iterator(); iterator.hasNext(); printwriter.println(client.mRingtone.getUri()))
        {
            client = (Client)iterator.next();
            printwriter.print("  mToken=");
            printwriter.print(client.mToken);
            printwriter.print(" mUri=");
        }

        break MISSING_BLOCK_LABEL_95;
        Exception exception;
        exception;
        hashmap;
        JVM INSTR monitorexit ;
        throw exception;
        hashmap;
        JVM INSTR monitorexit ;
    }

    public void start()
    {
        mAsyncPlayer.setUsesWakeLock(super.mContext);
        mAudioService = android.media.IAudioService.Stub.asInterface(ServiceManager.getService("audio"));
        try
        {
            mAudioService.setRingtonePlayer(mCallback);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Slog.e("RingtonePlayer", (new StringBuilder()).append("Problem registering RingtonePlayer: ").append(remoteexception).toString());
        }
    }



}
