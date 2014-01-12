// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.os.*;
import android.text.Spannable;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.*;
import java.lang.ref.WeakReference;

public class KeyguardTransportControlView extends FrameLayout
    implements android.view.View.OnClickListener
{
    private static class IRemoteControlDisplayWeak extends android.media.IRemoteControlDisplay.Stub
    {

        private WeakReference mLocalHandler;

        public void setAllMetadata(int i, Bundle bundle, Bitmap bitmap)
        {
            Handler handler = (Handler)mLocalHandler.get();
            if (handler != null)
            {
                handler.obtainMessage(101, i, 0, bundle).sendToTarget();
                handler.obtainMessage(103, i, 0, bitmap).sendToTarget();
            }
        }

        public void setArtwork(int i, Bitmap bitmap)
        {
            Handler handler = (Handler)mLocalHandler.get();
            if (handler != null)
                handler.obtainMessage(103, i, 0, bitmap).sendToTarget();
        }

        public void setCurrentClientId(int i, PendingIntent pendingintent, boolean flag)
            throws RemoteException
        {
            Handler handler = (Handler)mLocalHandler.get();
            if (handler != null)
            {
                int j;
                if (flag)
                    j = 1;
                else
                    j = 0;
                handler.obtainMessage(104, i, j, pendingintent).sendToTarget();
            }
        }

        public void setMetadata(int i, Bundle bundle)
        {
            Handler handler = (Handler)mLocalHandler.get();
            if (handler != null)
                handler.obtainMessage(101, i, 0, bundle).sendToTarget();
        }

        public void setPlaybackState(int i, int j, long l)
        {
            Handler handler = (Handler)mLocalHandler.get();
            if (handler != null)
                handler.obtainMessage(100, i, j).sendToTarget();
        }

        public void setTransportControlFlags(int i, int j)
        {
            Handler handler = (Handler)mLocalHandler.get();
            if (handler != null)
                handler.obtainMessage(102, i, j).sendToTarget();
        }

        IRemoteControlDisplayWeak(Handler handler)
        {
            mLocalHandler = new WeakReference(handler);
        }
    }

    class Metadata
    {

        private String albumTitle;
        private String artist;
        private Bitmap bitmap;
        final KeyguardTransportControlView this$0;
        private String trackTitle;

        public String toString()
        {
            return (new StringBuilder()).append("Metadata[artist=").append(artist).append(" trackTitle=").append(trackTitle).append(" albumTitle=").append(albumTitle).append("]").toString();
        }



/*
        static String access$1002(Metadata metadata, String s)
        {
            metadata.trackTitle = s;
            return s;
        }

*/



/*
        static String access$1102(Metadata metadata, String s)
        {
            metadata.albumTitle = s;
            return s;
        }

*/



/*
        static Bitmap access$502(Metadata metadata, Bitmap bitmap1)
        {
            metadata.bitmap = bitmap1;
            return bitmap1;
        }

*/



/*
        static String access$902(Metadata metadata, String s)
        {
            metadata.artist = s;
            return s;
        }

*/

        Metadata()
        {
            this$0 = KeyguardTransportControlView.this;
            super();
        }
    }

    static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        boolean clientPresent;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            int j;
            if (clientPresent)
                j = 1;
            else
                j = 0;
            parcel.writeInt(j);
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            boolean flag;
            if (parcel.readInt() != 0)
                flag = true;
            else
                flag = false;
            clientPresent = flag;
        }


        SavedState(Parcelable parcelable)
        {
            super(parcelable);
        }
    }


    protected static final boolean DEBUG = false;
    private static final int DISPLAY_TIMEOUT_MS = 5000;
    private static final int MSG_SET_ARTWORK = 103;
    private static final int MSG_SET_GENERATION_ID = 104;
    private static final int MSG_SET_METADATA = 101;
    private static final int MSG_SET_TRANSPORT_CONTROLS = 102;
    private static final int MSG_UPDATE_STATE = 100;
    protected static final String TAG = "TransportControlView";
    private ImageView mAlbumArt;
    private boolean mAttached;
    private AudioManager mAudioManager;
    private ImageView mBtnNext;
    private ImageView mBtnPlay;
    private ImageView mBtnPrev;
    private int mClientGeneration;
    private PendingIntent mClientIntent;
    private int mCurrentPlayState;
    private Handler mHandler;
    private IRemoteControlDisplayWeak mIRCD;
    private Metadata mMetadata;
    private boolean mMusicClientPresent;
    private Bundle mPopulateMetadataWhenAttached;
    private TextView mTrackTitle;
    private KeyguardHostView.TransportCallback mTransportCallback;
    private int mTransportControlFlags;

    public KeyguardTransportControlView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mMetadata = new Metadata();
        mMusicClientPresent = true;
        mPopulateMetadataWhenAttached = null;
        mHandler = new Handler() {

            final KeyguardTransportControlView this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                default:
                    break;

                case 104: // 'h'
                    if (message.arg2 != 0)
                        onListenerDetached();
                    else
                        onListenerAttached();
                    mClientGeneration = message.arg1;
                    mClientIntent = (PendingIntent)message.obj;
                    return;

                case 103: // 'g'
                    if (mClientGeneration == message.arg1)
                    {
                        if (mMetadata.bitmap != null)
                            mMetadata.bitmap.recycle();
                        mMetadata.bitmap = (Bitmap)message.obj;
                        mAlbumArt.setImageBitmap(mMetadata.bitmap);
                        return;
                    }
                    break;

                case 102: // 'f'
                    if (mClientGeneration == message.arg1)
                    {
                        updateTransportControls(message.arg2);
                        return;
                    }
                    break;

                case 101: // 'e'
                    if (mClientGeneration == message.arg1)
                    {
                        updateMetadata((Bundle)message.obj);
                        return;
                    }
                    break;

                case 100: // 'd'
                    if (mClientGeneration == message.arg1)
                    {
                        updatePlayPauseState(message.arg2);
                        return;
                    }
                    break;
                }
            }

            
            {
                this$0 = KeyguardTransportControlView.this;
                super();
            }
        }
;
        mAudioManager = new AudioManager(mContext);
        mCurrentPlayState = 0;
        mIRCD = new IRemoteControlDisplayWeak(mHandler);
    }

    private String getMdString(Bundle bundle, int i)
    {
        return bundle.getString(Integer.toString(i));
    }

    private void onListenerAttached()
    {
        mMusicClientPresent = true;
        if (mTransportCallback != null)
        {
            mTransportCallback.onListenerAttached();
            return;
        } else
        {
            Log.w("TransportControlView", "onListenerAttached(): no callback");
            return;
        }
    }

    private void populateMetadata()
    {
        StringBuilder stringbuilder = new StringBuilder();
        boolean flag = TextUtils.isEmpty(mMetadata.trackTitle);
        int i = 0;
        if (!flag)
        {
            stringbuilder.append(mMetadata.trackTitle);
            i = mMetadata.trackTitle.length();
        }
        if (!TextUtils.isEmpty(mMetadata.artist))
        {
            if (stringbuilder.length() != 0)
                stringbuilder.append(" - ");
            stringbuilder.append(mMetadata.artist);
        }
        if (!TextUtils.isEmpty(mMetadata.albumTitle))
        {
            if (stringbuilder.length() != 0)
                stringbuilder.append(" - ");
            stringbuilder.append(mMetadata.albumTitle);
        }
        mTrackTitle.setText(stringbuilder.toString(), android.widget.TextView.BufferType.SPANNABLE);
        Spannable spannable = (Spannable)mTrackTitle.getText();
        if (i != 0)
        {
            spannable.setSpan(new ForegroundColorSpan(-1), 0, i, 33);
            i++;
        }
        if (stringbuilder.length() > i)
            spannable.setSpan(new ForegroundColorSpan(0x7fffffff), i, stringbuilder.length(), 33);
        mAlbumArt.setImageBitmap(mMetadata.bitmap);
        int j = mTransportControlFlags;
        setVisibilityBasedOnFlag(mBtnPrev, j, 1);
        setVisibilityBasedOnFlag(mBtnNext, j, 128);
        setVisibilityBasedOnFlag(mBtnPlay, j, 60);
        updatePlayPauseState(mCurrentPlayState);
    }

    private void sendMediaButtonClick(int i)
    {
        if (mClientIntent == null)
        {
            Log.e("TransportControlView", "sendMediaButtonClick(): No client is currently registered");
            return;
        }
        KeyEvent keyevent = new KeyEvent(0, i);
        Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
        intent.putExtra("android.intent.extra.KEY_EVENT", keyevent);
        KeyEvent keyevent1;
        Intent intent1;
        try
        {
            mClientIntent.send(getContext(), 0, intent);
        }
        catch (android.app.PendingIntent.CanceledException canceledexception)
        {
            Log.e("TransportControlView", (new StringBuilder()).append("Error sending intent for media button down: ").append(canceledexception).toString());
            canceledexception.printStackTrace();
        }
        keyevent1 = new KeyEvent(1, i);
        intent1 = new Intent("android.intent.action.MEDIA_BUTTON");
        intent1.putExtra("android.intent.extra.KEY_EVENT", keyevent1);
        try
        {
            mClientIntent.send(getContext(), 0, intent1);
            return;
        }
        catch (android.app.PendingIntent.CanceledException canceledexception1)
        {
            Log.e("TransportControlView", (new StringBuilder()).append("Error sending intent for media button up: ").append(canceledexception1).toString());
            canceledexception1.printStackTrace();
            return;
        }
    }

    private static void setVisibilityBasedOnFlag(View view, int i, int j)
    {
        if ((i & j) != 0)
        {
            view.setVisibility(0);
            return;
        } else
        {
            view.setVisibility(8);
            return;
        }
    }

    private void updateMetadata(Bundle bundle)
    {
        if (mAttached)
        {
            mMetadata.artist = getMdString(bundle, 13);
            mMetadata.trackTitle = getMdString(bundle, 7);
            mMetadata.albumTitle = getMdString(bundle, 1);
            populateMetadata();
            return;
        } else
        {
            mPopulateMetadataWhenAttached = bundle;
            return;
        }
    }

    private void updatePlayPauseState(int i)
    {
        if (i == mCurrentPlayState)
            return;
        int j;
        int k;
        switch (i)
        {
        case 8: // '\b'
            j = 0x108031c;
            k = 0x10402ff;
            break;

        case 3: // '\003'
            j = 0x1080023;
            k = 0x10402fd;
            break;

        case 9: // '\t'
            j = 0x108008a;
            k = 0x10402fe;
            break;

        default:
            j = 0x1080024;
            k = 0x10402fe;
            break;
        }
        mBtnPlay.setImageResource(j);
        mBtnPlay.setContentDescription(getResources().getString(k));
        mCurrentPlayState = i;
        mTransportCallback.onPlayStateChanged();
    }

    private void updateTransportControls(int i)
    {
        mTransportControlFlags = i;
    }

    private boolean wasPlayingRecently(int i, long l)
    {
        boolean flag = true;
        switch (i)
        {
        case 1: // '\001'
        case 2: // '\002'
        case 9: // '\t'
            if (SystemClock.elapsedRealtime() - l >= 5000L)
                return false;
            break;

        case 0: // '\0'
            return false;

        default:
            Log.e("TransportControlView", (new StringBuilder()).append("Unknown playback state ").append(i).append(" in wasPlayingRecently()").toString());
            flag = false;
            break;

        case 3: // '\003'
        case 4: // '\004'
        case 5: // '\005'
        case 6: // '\006'
        case 7: // '\007'
        case 8: // '\b'
            break;
        }
        return flag;
    }

    public boolean isMusicPlaying()
    {
        return mCurrentPlayState == 3 || mCurrentPlayState == 8;
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (mPopulateMetadataWhenAttached != null)
        {
            updateMetadata(mPopulateMetadataWhenAttached);
            mPopulateMetadataWhenAttached = null;
        }
        if (!mAttached)
            mAudioManager.registerRemoteControlDisplay(mIRCD);
        mAttached = true;
    }

    public void onClick(View view)
    {
        byte byte0 = -1;
        if (view == mBtnPrev)
            byte0 = 88;
        else
        if (view == mBtnNext)
            byte0 = 87;
        else
        if (view == mBtnPlay)
            byte0 = 85;
        if (byte0 != -1)
            sendMediaButtonClick(byte0);
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mAttached)
            mAudioManager.unregisterRemoteControlDisplay(mIRCD);
        mAttached = false;
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        mTrackTitle = (TextView)findViewById(0x1020016);
        mTrackTitle.setSelected(true);
        mAlbumArt = (ImageView)findViewById(0x102030b);
        mBtnPrev = (ImageView)findViewById(0x102030c);
        mBtnPlay = (ImageView)findViewById(0x102030d);
        mBtnNext = (ImageView)findViewById(0x102030e);
        View aview[] = new View[3];
        aview[0] = mBtnPrev;
        aview[1] = mBtnPlay;
        aview[2] = mBtnNext;
        int i = aview.length;
        for (int j = 0; j < i; j++)
            aview[j].setOnClickListener(this);

    }

    protected void onListenerDetached()
    {
        mMusicClientPresent = false;
        if (mTransportCallback != null)
        {
            mTransportCallback.onListenerDetached();
            return;
        } else
        {
            Log.w("TransportControlView", "onListenerDetached: no callback");
            return;
        }
    }

    public void onRestoreInstanceState(Parcelable parcelable)
    {
        if (!(parcelable instanceof SavedState))
        {
            super.onRestoreInstanceState(parcelable);
        } else
        {
            SavedState savedstate = (SavedState)parcelable;
            super.onRestoreInstanceState(savedstate.getSuperState());
            if (savedstate.clientPresent)
            {
                onListenerAttached();
                return;
            }
        }
    }

    public Parcelable onSaveInstanceState()
    {
        SavedState savedstate = new SavedState(super.onSaveInstanceState());
        savedstate.clientPresent = mMusicClientPresent;
        return savedstate;
    }

    public boolean providesClock()
    {
        return false;
    }

    public void setKeyguardCallback(KeyguardHostView.TransportCallback transportcallback)
    {
        mTransportCallback = transportcallback;
    }



/*
    static int access$002(KeyguardTransportControlView keyguardtransportcontrolview, int i)
    {
        keyguardtransportcontrolview.mClientGeneration = i;
        return i;
    }

*/








/*
    static PendingIntent access$802(KeyguardTransportControlView keyguardtransportcontrolview, PendingIntent pendingintent)
    {
        keyguardtransportcontrolview.mClientIntent = pendingintent;
        return pendingintent;
    }

*/
}
