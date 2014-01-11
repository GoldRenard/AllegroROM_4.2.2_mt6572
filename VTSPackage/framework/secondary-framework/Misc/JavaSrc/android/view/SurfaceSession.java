// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;


public final class SurfaceSession
{

    private int mNativeClient;

    public SurfaceSession()
    {
        mNativeClient = nativeCreate();
    }

    private static native int nativeCreate();

    private static native void nativeDestroy(int i);

    private static native void nativeKill(int i);

    protected void finalize()
        throws Throwable
    {
        if (mNativeClient != 0)
            nativeDestroy(mNativeClient);
        super.finalize();
        return;
        Exception exception;
        exception;
        super.finalize();
        throw exception;
    }

    public void kill()
    {
        nativeKill(mNativeClient);
    }
}
