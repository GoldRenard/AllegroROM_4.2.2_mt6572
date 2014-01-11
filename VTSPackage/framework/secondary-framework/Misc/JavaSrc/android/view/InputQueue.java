// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;


// Referenced classes of package android.view:
//            InputChannel

public final class InputQueue
{
    public static interface Callback
    {

        public abstract void onInputQueueCreated(InputQueue inputqueue);

        public abstract void onInputQueueDestroyed(InputQueue inputqueue);
    }


    final InputChannel mChannel;

    public InputQueue(InputChannel inputchannel)
    {
        mChannel = inputchannel;
    }

    public InputChannel getInputChannel()
    {
        return mChannel;
    }
}
