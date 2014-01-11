// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.os.*;
import android.util.AndroidException;

// Referenced classes of package android.app:
//            ActivityManagerNative, IActivityManager

public final class PendingIntent
    implements Parcelable
{
    public static class CanceledException extends AndroidException
    {


        public CanceledException(Exception exception)
        {
            super(exception);
        }

        public CanceledException(String s)
        {
            super(s);
        }
    }

    private static class FinishedDispatcher extends android.content.IIntentReceiver.Stub
        implements Runnable
    {

        private final Handler mHandler;
        private Intent mIntent;
        private final PendingIntent mPendingIntent;
        private int mResultCode;
        private String mResultData;
        private Bundle mResultExtras;
        private final OnFinished mWho;

        public void performReceive(Intent intent, int i, String s, Bundle bundle, boolean flag, boolean flag1, int j)
        {
            mIntent = intent;
            mResultCode = i;
            mResultData = s;
            mResultExtras = bundle;
            if (mHandler == null)
            {
                run();
                return;
            } else
            {
                mHandler.post(this);
                return;
            }
        }

        public void run()
        {
            mWho.onSendFinished(mPendingIntent, mIntent, mResultCode, mResultData, mResultExtras);
        }

        FinishedDispatcher(PendingIntent pendingintent, OnFinished onfinished, Handler handler)
        {
            mPendingIntent = pendingintent;
            mWho = onfinished;
            mHandler = handler;
        }
    }

    public static interface OnFinished
    {

        public abstract void onSendFinished(PendingIntent pendingintent, Intent intent, int i, String s, Bundle bundle);
    }


    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public PendingIntent createFromParcel(Parcel parcel)
        {
            IBinder ibinder = parcel.readStrongBinder();
            if (ibinder != null)
                return new PendingIntent(ibinder);
            else
                return null;
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public PendingIntent[] newArray(int i)
        {
            return new PendingIntent[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    public static final int FLAG_CANCEL_CURRENT = 0x10000000;
    public static final int FLAG_NO_CREATE = 0x20000000;
    public static final int FLAG_ONE_SHOT = 0x40000000;
    public static final int FLAG_UPDATE_CURRENT = 0x8000000;
    private final IIntentSender mTarget;

    PendingIntent(IIntentSender iintentsender)
    {
        mTarget = iintentsender;
    }

    PendingIntent(IBinder ibinder)
    {
        mTarget = android.content.IIntentSender.Stub.asInterface(ibinder);
    }

    public static PendingIntent getActivities(Context context, int i, Intent aintent[], int j)
    {
        return getActivities(context, i, aintent, j, null);
    }

    public static PendingIntent getActivities(Context context, int i, Intent aintent[], int j, Bundle bundle)
    {
        String s = context.getPackageName();
        String as[] = new String[aintent.length];
        for (int k = 0; k < aintent.length; k++)
        {
            aintent[k].setAllowFds(false);
            as[k] = aintent[k].resolveTypeIfNeeded(context.getContentResolver());
        }

        IIntentSender iintentsender;
        PendingIntent pendingintent;
        try
        {
            iintentsender = ActivityManagerNative.getDefault().getIntentSender(2, s, null, null, i, aintent, as, j, bundle, UserHandle.myUserId());
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (iintentsender == null)
            break MISSING_BLOCK_LABEL_97;
        pendingintent = new PendingIntent(iintentsender);
        return pendingintent;
        return null;
    }

    public static PendingIntent getActivitiesAsUser(Context context, int i, Intent aintent[], int j, Bundle bundle, UserHandle userhandle)
    {
        String s = context.getPackageName();
        String as[] = new String[aintent.length];
        for (int k = 0; k < aintent.length; k++)
        {
            aintent[k].setAllowFds(false);
            as[k] = aintent[k].resolveTypeIfNeeded(context.getContentResolver());
        }

        IIntentSender iintentsender;
        PendingIntent pendingintent;
        try
        {
            iintentsender = ActivityManagerNative.getDefault().getIntentSender(2, s, null, null, i, aintent, as, j, bundle, userhandle.getIdentifier());
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (iintentsender == null)
            break MISSING_BLOCK_LABEL_99;
        pendingintent = new PendingIntent(iintentsender);
        return pendingintent;
        return null;
    }

    public static PendingIntent getActivity(Context context, int i, Intent intent, int j)
    {
        return getActivity(context, i, intent, j, null);
    }

    public static PendingIntent getActivity(Context context, int i, Intent intent, int j, Bundle bundle)
    {
        String s = context.getPackageName();
        String s1;
        IActivityManager iactivitymanager;
        Intent aintent[];
        String as[];
        IIntentSender iintentsender;
        PendingIntent pendingintent;
        if (intent != null)
            s1 = intent.resolveTypeIfNeeded(context.getContentResolver());
        else
            s1 = null;
        try
        {
            intent.setAllowFds(false);
            iactivitymanager = ActivityManagerNative.getDefault();
            aintent = (new Intent[] {
                intent
            });
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (s1 == null)
            break MISSING_BLOCK_LABEL_106;
        as = (new String[] {
            s1
        });
_L1:
        iintentsender = iactivitymanager.getIntentSender(2, s, null, null, i, aintent, as, j, bundle, UserHandle.myUserId());
        if (iintentsender == null)
            break MISSING_BLOCK_LABEL_112;
        pendingintent = new PendingIntent(iintentsender);
        return pendingintent;
        as = null;
          goto _L1
        return null;
    }

    public static PendingIntent getActivityAsUser(Context context, int i, Intent intent, int j, Bundle bundle, UserHandle userhandle)
    {
        String s = context.getPackageName();
        String s1;
        IActivityManager iactivitymanager;
        Intent aintent[];
        String as[];
        IIntentSender iintentsender;
        PendingIntent pendingintent;
        if (intent != null)
            s1 = intent.resolveTypeIfNeeded(context.getContentResolver());
        else
            s1 = null;
        try
        {
            intent.setAllowFds(false);
            iactivitymanager = ActivityManagerNative.getDefault();
            aintent = (new Intent[] {
                intent
            });
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (s1 == null)
            break MISSING_BLOCK_LABEL_108;
        as = (new String[] {
            s1
        });
_L1:
        iintentsender = iactivitymanager.getIntentSender(2, s, null, null, i, aintent, as, j, bundle, userhandle.getIdentifier());
        if (iintentsender == null)
            break MISSING_BLOCK_LABEL_114;
        pendingintent = new PendingIntent(iintentsender);
        return pendingintent;
        as = null;
          goto _L1
        return null;
    }

    public static PendingIntent getBroadcast(Context context, int i, Intent intent, int j)
    {
        return getBroadcastAsUser(context, i, intent, j, new UserHandle(UserHandle.myUserId()));
    }

    public static PendingIntent getBroadcastAsUser(Context context, int i, Intent intent, int j, UserHandle userhandle)
    {
        String s = context.getPackageName();
        String s1;
        IActivityManager iactivitymanager;
        Intent aintent[];
        String as[];
        IIntentSender iintentsender;
        PendingIntent pendingintent;
        if (intent != null)
            s1 = intent.resolveTypeIfNeeded(context.getContentResolver());
        else
            s1 = null;
        try
        {
            intent.setAllowFds(false);
            iactivitymanager = ActivityManagerNative.getDefault();
            aintent = (new Intent[] {
                intent
            });
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (s1 == null)
            break MISSING_BLOCK_LABEL_107;
        as = (new String[] {
            s1
        });
_L1:
        iintentsender = iactivitymanager.getIntentSender(1, s, null, null, i, aintent, as, j, null, userhandle.getIdentifier());
        if (iintentsender == null)
            break MISSING_BLOCK_LABEL_113;
        pendingintent = new PendingIntent(iintentsender);
        return pendingintent;
        as = null;
          goto _L1
        return null;
    }

    public static PendingIntent getService(Context context, int i, Intent intent, int j)
    {
        String s = context.getPackageName();
        String s1;
        IActivityManager iactivitymanager;
        Intent aintent[];
        String as[];
        IIntentSender iintentsender;
        PendingIntent pendingintent;
        if (intent != null)
            s1 = intent.resolveTypeIfNeeded(context.getContentResolver());
        else
            s1 = null;
        try
        {
            intent.setAllowFds(false);
            iactivitymanager = ActivityManagerNative.getDefault();
            aintent = (new Intent[] {
                intent
            });
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (s1 == null)
            break MISSING_BLOCK_LABEL_105;
        as = (new String[] {
            s1
        });
_L1:
        iintentsender = iactivitymanager.getIntentSender(4, s, null, null, i, aintent, as, j, null, UserHandle.myUserId());
        if (iintentsender == null)
            break MISSING_BLOCK_LABEL_111;
        pendingintent = new PendingIntent(iintentsender);
        return pendingintent;
        as = null;
          goto _L1
        return null;
    }

    public static PendingIntent readPendingIntentOrNullFromParcel(Parcel parcel)
    {
        IBinder ibinder = parcel.readStrongBinder();
        if (ibinder != null)
            return new PendingIntent(ibinder);
        else
            return null;
    }

    public static void writePendingIntentOrNullToParcel(PendingIntent pendingintent, Parcel parcel)
    {
        IBinder ibinder;
        if (pendingintent != null)
            ibinder = pendingintent.mTarget.asBinder();
        else
            ibinder = null;
        parcel.writeStrongBinder(ibinder);
    }

    public void cancel()
    {
        try
        {
            ActivityManagerNative.getDefault().cancelIntentSender(mTarget);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public int describeContents()
    {
        return 0;
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof PendingIntent)
            return mTarget.asBinder().equals(((PendingIntent)obj).mTarget.asBinder());
        else
            return false;
    }

    public String getCreatorPackage()
    {
        String s;
        try
        {
            s = ActivityManagerNative.getDefault().getPackageForIntentSender(mTarget);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return s;
    }

    public int getCreatorUid()
    {
        int i;
        try
        {
            i = ActivityManagerNative.getDefault().getUidForIntentSender(mTarget);
        }
        catch (RemoteException remoteexception)
        {
            return -1;
        }
        return i;
    }

    public UserHandle getCreatorUserHandle()
    {
        int i;
        UserHandle userhandle;
        try
        {
            i = ActivityManagerNative.getDefault().getUidForIntentSender(mTarget);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        if (i <= 0)
            break MISSING_BLOCK_LABEL_31;
        userhandle = new UserHandle(UserHandle.getUserId(i));
        return userhandle;
        return null;
    }

    public Intent getIntent()
    {
        Intent intent;
        try
        {
            intent = ActivityManagerNative.getDefault().getIntentForIntentSender(mTarget);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return intent;
    }

    public IntentSender getIntentSender()
    {
        return new IntentSender(mTarget);
    }

    public IIntentSender getTarget()
    {
        return mTarget;
    }

    public String getTargetPackage()
    {
        String s;
        try
        {
            s = ActivityManagerNative.getDefault().getPackageForIntentSender(mTarget);
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return s;
    }

    public int hashCode()
    {
        return mTarget.asBinder().hashCode();
    }

    public boolean isActivity()
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().isIntentSenderAnActivity(mTarget);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public boolean isTargetedToPackage()
    {
        boolean flag;
        try
        {
            flag = ActivityManagerNative.getDefault().isIntentSenderTargetedToPackage(mTarget);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public void send()
        throws CanceledException
    {
        send(null, 0, null, null, null, null);
    }

    public void send(int i)
        throws CanceledException
    {
        send(null, i, null, null, null, null);
    }

    public void send(int i, OnFinished onfinished, Handler handler)
        throws CanceledException
    {
        send(null, i, null, onfinished, handler, null);
    }

    public void send(Context context, int i, Intent intent)
        throws CanceledException
    {
        send(context, i, intent, null, null, null);
    }

    public void send(Context context, int i, Intent intent, OnFinished onfinished, Handler handler)
        throws CanceledException
    {
        send(context, i, intent, onfinished, handler, null);
    }

    public void send(Context context, int i, Intent intent, OnFinished onfinished, Handler handler, String s)
        throws CanceledException
    {
        if (intent == null)
            break MISSING_BLOCK_LABEL_80;
        String s1 = intent.resolveTypeIfNeeded(context.getContentResolver());
_L1:
        IIntentSender iintentsender = mTarget;
        FinishedDispatcher finisheddispatcher;
        finisheddispatcher = null;
        if (onfinished == null)
            break MISSING_BLOCK_LABEL_42;
        finisheddispatcher = new FinishedDispatcher(this, onfinished, handler);
        if (iintentsender.send(i, intent, s1, finisheddispatcher, s) < 0)
            throw new CanceledException();
        break MISSING_BLOCK_LABEL_86;
        RemoteException remoteexception;
        remoteexception;
        throw new CanceledException(remoteexception);
        s1 = null;
          goto _L1
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder(128);
        stringbuilder.append("PendingIntent{");
        stringbuilder.append(Integer.toHexString(System.identityHashCode(this)));
        stringbuilder.append(": ");
        IBinder ibinder;
        if (mTarget != null)
            ibinder = mTarget.asBinder();
        else
            ibinder = null;
        stringbuilder.append(ibinder);
        stringbuilder.append('}');
        return stringbuilder.toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeStrongBinder(mTarget.asBinder());
    }

}
