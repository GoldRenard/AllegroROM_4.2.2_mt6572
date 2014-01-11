// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.ContentUris;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.*;
import android.util.Log;
import com.android.internal.telephony.CallerInfo;
import com.android.internal.telephony.Connection;

public class ContactsAsyncHelper
{
    public static class ImageTracker
    {

        public static final int DISPLAY_DEFAULT = -2;
        public static final int DISPLAY_IMAGE = -1;
        public static final int DISPLAY_UNDEFINED;
        private int displayMode;
        private CallerInfo mCurrentCallerInfo;

        public int getPhotoState()
        {
            return displayMode;
        }

        public Uri getPhotoUri()
        {
            if (mCurrentCallerInfo != null)
                return ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, mCurrentCallerInfo.person_id);
            else
                return null;
        }

        public boolean isDifferentImageRequest(CallerInfo callerinfo)
        {
            return mCurrentCallerInfo != callerinfo;
        }

        public boolean isDifferentImageRequest(Connection connection)
        {
            if (connection == null)
                return mCurrentCallerInfo != null;
            Object obj = connection.getUserData();
            boolean flag = true;
            if (obj instanceof CallerInfo)
                flag = isDifferentImageRequest((CallerInfo)obj);
            return flag;
        }

        public void setPhotoRequest(CallerInfo callerinfo)
        {
            mCurrentCallerInfo = callerinfo;
        }

        public void setPhotoState(int i)
        {
            displayMode = i;
        }

        public ImageTracker()
        {
            mCurrentCallerInfo = null;
            displayMode = 0;
        }
    }

    public static interface OnImageLoadCompleteListener
    {

        public abstract void onImageLoadComplete(int i, Drawable drawable, Bitmap bitmap, Object obj);
    }

    private static final class WorkerArgs
    {

        public Context context;
        public Object cookie;
        public OnImageLoadCompleteListener listener;
        public Drawable photo;
        public Bitmap photoIcon;
        public Uri uri;

        private WorkerArgs()
        {
        }

    }

    private class WorkerHandler extends Handler
    {

        final ContactsAsyncHelper this$0;

        private Bitmap getPhotoIconWhenAppropriate(Context context, Drawable drawable)
        {
            Bitmap bitmap;
            if (!(drawable instanceof BitmapDrawable))
            {
                bitmap = null;
            } else
            {
                int i = context.getResources().getDimensionPixelSize(0x7f0c001a);
                bitmap = ((BitmapDrawable)drawable).getBitmap();
                int j = bitmap.getWidth();
                int k = bitmap.getHeight();
                int l;
                if (j > k)
                    l = j;
                else
                    l = k;
                if (l > i)
                {
                    float f = (float)l / (float)i;
                    int i1 = (int)((float)j / f);
                    int j1 = (int)((float)k / f);
                    if (i1 > 0 && j1 > 0)
                    {
                        return Bitmap.createScaledBitmap(bitmap, i1, j1, true);
                    } else
                    {
                        Log.w("ContactsAsyncHelper", "Photo icon's width or height become 0.");
                        return null;
                    }
                }
            }
            return bitmap;
        }

        public void handleMessage(Message message)
        {
            WorkerArgs workerargs = (WorkerArgs)message.obj;
            message.arg1;
            JVM INSTR tableswitch 1 1: default 32
        //                       1 72;
               goto _L1 _L2
_L1:
            Message message1 = mResultHandler.obtainMessage(message.what);
            message1.arg1 = message.arg1;
            message1.obj = message.obj;
            message1.sendToTarget();
            return;
_L2:
            java.io.InputStream inputstream1 = android.provider.ContactsContract.Contacts.openContactPhotoInputStream(workerargs.context.getContentResolver(), workerargs.uri, true);
            java.io.InputStream inputstream = inputstream1;
_L4:
            Exception exception;
            if (inputstream != null)
            {
                workerargs.photo = Drawable.createFromStream(inputstream, workerargs.uri.toString());
                workerargs.photoIcon = getPhotoIconWhenAppropriate(workerargs.context, workerargs.photo);
            } else
            {
                workerargs.photo = null;
                workerargs.photoIcon = null;
            }
            if (true) goto _L1; else goto _L3
_L3:
            exception;
            Log.e("ContactsAsyncHelper", "Error opening photo input stream", exception);
            inputstream = null;
              goto _L4
        }

        public WorkerHandler(Looper looper)
        {
            this$0 = ContactsAsyncHelper.this;
            super(looper);
        }
    }


    private static final boolean DBG = false;
    private static final int EVENT_LOAD_IMAGE = 1;
    private static final String LOG_TAG = "ContactsAsyncHelper";
    private static ContactsAsyncHelper sInstance = new ContactsAsyncHelper();
    private static Handler sThreadHandler;
    private final Handler mResultHandler = new Handler() {

        final ContactsAsyncHelper this$0;

        public void handleMessage(Message message)
        {
            WorkerArgs workerargs = (WorkerArgs)message.obj;
            switch (message.arg1)
            {
            case 1: // '\001'
                if (workerargs.listener != null)
                {
                    workerargs.listener.onImageLoadComplete(message.what, workerargs.photo, workerargs.photoIcon, workerargs.cookie);
                    return;
                }
                break;
            }
        }

            
            {
                this$0 = ContactsAsyncHelper.this;
                super();
            }
    }
;

    private ContactsAsyncHelper()
    {
        HandlerThread handlerthread = new HandlerThread("ContactsAsyncWorker");
        handlerthread.start();
        sThreadHandler = new WorkerHandler(handlerthread.getLooper());
    }

    public static final void startObtainPhotoAsync(int i, Context context, Uri uri, OnImageLoadCompleteListener onimageloadcompletelistener, Object obj)
    {
        if (uri == null)
        {
            Log.wtf("ContactsAsyncHelper", "Uri is missing");
            return;
        } else
        {
            WorkerArgs workerargs = new WorkerArgs();
            workerargs.cookie = obj;
            workerargs.context = context;
            workerargs.uri = uri;
            workerargs.listener = onimageloadcompletelistener;
            Message message = sThreadHandler.obtainMessage(i);
            message.arg1 = 1;
            message.obj = workerargs;
            sThreadHandler.sendMessage(message);
            return;
        }
    }


}
