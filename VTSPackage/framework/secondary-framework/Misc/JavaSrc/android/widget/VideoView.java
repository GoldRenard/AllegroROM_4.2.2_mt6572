// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.*;
import android.media.MediaPlayer;
import android.media.Metadata;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.io.IOException;
import java.util.Map;

// Referenced classes of package android.widget:
//            MediaController

public class VideoView extends SurfaceView
    implements MediaController.MediaPlayerControl
{

    protected static final int STATE_ERROR = -1;
    protected static final int STATE_IDLE = 0;
    protected static final int STATE_PAUSED = 4;
    protected static final int STATE_PLAYBACK_COMPLETED = 5;
    protected static final int STATE_PLAYING = 3;
    protected static final int STATE_PREPARED = 2;
    protected static final int STATE_PREPARING = 1;
    private String TAG;
    protected android.media.MediaPlayer.OnBufferingUpdateListener mBufferingUpdateListener = new android.media.MediaPlayer.OnBufferingUpdateListener() {

        final VideoView this$0;

        public void onBufferingUpdate(MediaPlayer mediaplayer, int i)
        {
            mCurrentBufferPercentage = i;
        }

            
            {
                this$0 = VideoView.this;
                super();
            }
    }
;
    protected boolean mCanPause;
    protected boolean mCanSeekBack;
    protected boolean mCanSeekForward;
    protected android.media.MediaPlayer.OnCompletionListener mCompletionListener = new android.media.MediaPlayer.OnCompletionListener() {

        final VideoView this$0;

        public void onCompletion(MediaPlayer mediaplayer)
        {
            mCurrentState = 5;
            mTargetState = 5;
            if (mMediaController != null)
                mMediaController.hide();
            if (mOnCompletionListener != null)
                mOnCompletionListener.onCompletion(mMediaPlayer);
        }

            
            {
                this$0 = VideoView.this;
                super();
            }
    }
;
    protected int mCurrentBufferPercentage;
    protected int mCurrentState;
    protected android.media.MediaPlayer.OnErrorListener mErrorListener = new android.media.MediaPlayer.OnErrorListener() ;
    protected Map mHeaders;
    protected MediaController mMediaController;
    protected MediaPlayer mMediaPlayer;
    protected android.media.MediaPlayer.OnCompletionListener mOnCompletionListener;
    protected android.media.MediaPlayer.OnErrorListener mOnErrorListener;
    private android.media.MediaPlayer.OnInfoListener mOnInfoListener;
    protected android.media.MediaPlayer.OnPreparedListener mOnPreparedListener;
    protected android.media.MediaPlayer.OnPreparedListener mPreparedListener = new android.media.MediaPlayer.OnPreparedListener() {

        final VideoView this$0;

        public void onPrepared(MediaPlayer mediaplayer)
        {
            mCurrentState = 2;
            Metadata metadata = mediaplayer.getMetadata(false, false);
            if (metadata != null)
            {
                VideoView videoview2 = VideoView.this;
                boolean flag;
                if (metadata.has(1) && !metadata.getBoolean(1))
                    flag = false;
                else
                    flag = true;
                videoview2.mCanPause = flag;
                VideoView videoview3 = VideoView.this;
                boolean flag1;
                if (metadata.has(2) && !metadata.getBoolean(2))
                    flag1 = false;
                else
                    flag1 = true;
                videoview3.mCanSeekBack = flag1;
                VideoView videoview4 = VideoView.this;
                boolean flag2;
                if (metadata.has(3) && !metadata.getBoolean(3))
                    flag2 = false;
                else
                    flag2 = true;
                videoview4.mCanSeekForward = flag2;
            } else
            {
                VideoView videoview = VideoView.this;
                VideoView videoview1 = VideoView.this;
                mCanSeekForward = true;
                videoview1.mCanSeekBack = true;
                videoview.mCanPause = true;
            }
            if (mOnPreparedListener != null)
                mOnPreparedListener.onPrepared(mMediaPlayer);
            if (mMediaController != null)
                mMediaController.setEnabled(true);
            mVideoWidth = mediaplayer.getVideoWidth();
            mVideoHeight = mediaplayer.getVideoHeight();
            int i = mSeekWhenPrepared;
            if (i != 0)
                seekTo(i);
            if (mVideoWidth != 0 && mVideoHeight != 0)
            {
                getHolder().setFixedSize(mVideoWidth, mVideoHeight);
                if (mTargetState == 3)
                {
                    start();
                    if (mMediaController != null)
                        mMediaController.show();
                } else
                if (!isPlaying() && (i != 0 || getCurrentPosition() > 0) && mMediaController != null)
                {
                    mMediaController.show(0);
                    return;
                }
            } else
            if (mTargetState == 3)
            {
                start();
                if (mMediaController != null)
                {
                    mMediaController.show();
                    return;
                }
            } else
            if (!isPlaying() && (i != 0 || getCurrentPosition() > 0) && mMediaController != null)
            {
                mMediaController.show(0);
                return;
            }
        }

            
            {
                this$0 = VideoView.this;
                super();
            }
    }
;
    protected android.view.SurfaceHolder.Callback mSHCallback = new android.view.SurfaceHolder.Callback() {

        final VideoView this$0;

        public void surfaceChanged(SurfaceHolder surfaceholder, int i, int j, int k)
        {
            mSurfaceWidth = j;
            mSurfaceHeight = k;
            boolean flag;
            if (mTargetState == 3)
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (mVideoWidth == j && mVideoHeight == k)
                flag1 = true;
            else
                flag1 = false;
            if (mMediaPlayer != null && flag && flag1)
            {
                if (mSeekWhenPrepared != 0)
                    seekTo(mSeekWhenPrepared);
                start();
            }
        }

        public void surfaceCreated(SurfaceHolder surfaceholder)
        {
            mSurfaceHolder = surfaceholder;
            openVideo();
        }

        public void surfaceDestroyed(SurfaceHolder surfaceholder)
        {
            mSurfaceHolder = null;
            if (mMediaController != null)
                mMediaController.hide();
            release(true);
        }

            
            {
                this$0 = VideoView.this;
                super();
            }
    }
;
    protected int mSeekWhenPrepared;
    protected android.media.MediaPlayer.OnVideoSizeChangedListener mSizeChangedListener = new android.media.MediaPlayer.OnVideoSizeChangedListener() {

        final VideoView this$0;

        public void onVideoSizeChanged(MediaPlayer mediaplayer, int i, int j)
        {
            mVideoWidth = mediaplayer.getVideoWidth();
            mVideoHeight = mediaplayer.getVideoHeight();
            if (mVideoWidth != 0 && mVideoHeight != 0)
            {
                getHolder().setFixedSize(mVideoWidth, mVideoHeight);
                requestLayout();
            }
        }

            
            {
                this$0 = VideoView.this;
                super();
            }
    }
;
    protected int mSurfaceHeight;
    protected SurfaceHolder mSurfaceHolder;
    protected int mSurfaceWidth;
    protected int mTargetState;
    protected Uri mUri;
    protected int mVideoHeight;
    protected int mVideoWidth;

    public VideoView(Context context)
    {
        super(context);
        TAG = "VideoView";
        mCurrentState = 0;
        mTargetState = 0;
        mSurfaceHolder = null;
        mMediaPlayer = null;
        initVideoView();
    }

    public VideoView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
        initVideoView();
    }

    public VideoView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        TAG = "VideoView";
        mCurrentState = 0;
        mTargetState = 0;
        mSurfaceHolder = null;
        mMediaPlayer = null;
        initVideoView();
    }

    protected void attachMediaController()
    {
        if (mMediaPlayer != null && mMediaController != null)
        {
            mMediaController.setMediaPlayer(this);
            Object obj;
            if (getParent() instanceof View)
                obj = (View)getParent();
            else
                obj = this;
            mMediaController.setAnchorView(((View) (obj)));
            mMediaController.setEnabled(isInPlaybackState());
        }
    }

    public boolean canPause()
    {
        return mCanPause;
    }

    public boolean canSeekBackward()
    {
        return mCanSeekBack;
    }

    public boolean canSeekForward()
    {
        return mCanSeekForward;
    }

    public int getBufferPercentage()
    {
        if (mMediaPlayer != null)
            return mCurrentBufferPercentage;
        else
            return 0;
    }

    public int getCurrentPosition()
    {
        if (isInPlaybackState())
            return mMediaPlayer.getCurrentPosition();
        else
            return 0;
    }

    public int getDuration()
    {
        if (isInPlaybackState())
            return mMediaPlayer.getDuration();
        else
            return -1;
    }

    protected void initVideoView()
    {
        mVideoWidth = 0;
        mVideoHeight = 0;
        getHolder().addCallback(mSHCallback);
        getHolder().setType(3);
        setFocusable(true);
        setFocusableInTouchMode(true);
        requestFocus();
        mCurrentState = 0;
        mTargetState = 0;
    }

    public boolean isInPlaybackState()
    {
        return mMediaPlayer != null && mCurrentState != -1 && mCurrentState != 0 && mCurrentState != 1;
    }

    public boolean isPlaying()
    {
        return isInPlaybackState() && mMediaPlayer.isPlaying();
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/VideoView.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/VideoView.getName());
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
label0:
        {
label1:
            {
label2:
                {
label3:
                    {
                        boolean flag;
                        if (i != 4 && i != 24 && i != 25 && i != 164 && i != 82 && i != 5 && i != 6 && i != 27)
                            flag = true;
                        else
                            flag = false;
                        if (isInPlaybackState() && flag && mMediaController != null)
                        {
                            if (i == 79 || i == 85)
                                break label2;
                            if (i == 126)
                            {
                                if (!mMediaPlayer.isPlaying())
                                {
                                    start();
                                    mMediaController.hide();
                                    return true;
                                }
                                break label1;
                            }
                            if (i == 86 || i == 127)
                                break label3;
                            toggleMediaControlsVisiblity();
                        }
                        return super.onKeyDown(i, keyevent);
                    }
                    if (mMediaPlayer.isPlaying())
                    {
                        pause();
                        mMediaController.show();
                        return true;
                    }
                    break label1;
                }
                if (!mMediaPlayer.isPlaying())
                    break label0;
                pause();
                mMediaController.show();
            }
            return true;
        }
        start();
        mMediaController.hide();
        return true;
    }

    protected void onMeasure(int i, int j)
    {
        int k = getDefaultSize(mVideoWidth, i);
        int l = getDefaultSize(mVideoHeight, j);
        if (mVideoWidth > 0 && mVideoHeight > 0)
            if (l * mVideoWidth > k * mVideoHeight)
                l = (k * mVideoHeight) / mVideoWidth;
            else
            if (l * mVideoWidth < k * mVideoHeight)
                k = (l * mVideoWidth) / mVideoHeight;
        setMeasuredDimension(k, l);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (isInPlaybackState() && mMediaController != null)
            toggleMediaControlsVisiblity();
        return false;
    }

    public boolean onTrackballEvent(MotionEvent motionevent)
    {
        if (isInPlaybackState() && mMediaController != null)
            toggleMediaControlsVisiblity();
        return false;
    }

    protected void openVideo()
    {
        if (mUri == null || mSurfaceHolder == null)
            return;
        Intent intent = new Intent("com.android.music.musicservicecommand");
        intent.putExtra("command", "pause");
        super.mContext.sendBroadcast(intent);
        release(false);
        try
        {
            mMediaPlayer = new MediaPlayer();
            mMediaPlayer.setOnPreparedListener(mPreparedListener);
            mMediaPlayer.setOnVideoSizeChangedListener(mSizeChangedListener);
            mMediaPlayer.setOnCompletionListener(mCompletionListener);
            mMediaPlayer.setOnErrorListener(mErrorListener);
            mMediaPlayer.setOnInfoListener(mOnInfoListener);
            mMediaPlayer.setOnBufferingUpdateListener(mBufferingUpdateListener);
            mCurrentBufferPercentage = 0;
            mMediaPlayer.setDataSource(super.mContext, mUri, mHeaders);
            mMediaPlayer.setDisplay(mSurfaceHolder);
            mMediaPlayer.setAudioStreamType(3);
            mMediaPlayer.setScreenOnWhilePlaying(true);
            mMediaPlayer.prepareAsync();
            mCurrentState = 1;
            attachMediaController();
            return;
        }
        catch (IOException ioexception)
        {
            Log.w(TAG, (new StringBuilder()).append("Unable to open content: ").append(mUri).toString(), ioexception);
            mCurrentState = -1;
            mTargetState = -1;
            mErrorListener.onError(mMediaPlayer, 1, 0);
            return;
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            Log.w(TAG, (new StringBuilder()).append("Unable to open content: ").append(mUri).toString(), illegalargumentexception);
        }
        mCurrentState = -1;
        mTargetState = -1;
        mErrorListener.onError(mMediaPlayer, 1, 0);
    }

    public void pause()
    {
        if (isInPlaybackState() && mMediaPlayer.isPlaying())
        {
            mMediaPlayer.pause();
            mCurrentState = 4;
        }
        mTargetState = 4;
    }

    protected void release(boolean flag)
    {
        if (mMediaPlayer != null)
        {
            mMediaPlayer.reset();
            mMediaPlayer.release();
            mMediaPlayer = null;
            mCurrentState = 0;
            if (flag)
                mTargetState = 0;
        }
    }

    public int resolveAdjustedSize(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(j);
        int l = android.view.View.MeasureSpec.getSize(j);
        switch (k)
        {
        case 1073741824: 
            return l;

        case -2147483648: 
            return Math.min(i, l);

        case 0: // '\0'
            return i;
        }
        return i;
    }

    public void resume()
    {
        openVideo();
    }

    public void seekTo(int i)
    {
        if (isInPlaybackState())
        {
            mMediaPlayer.seekTo(i);
            mSeekWhenPrepared = 0;
            return;
        } else
        {
            mSeekWhenPrepared = i;
            return;
        }
    }

    public void setMediaController(MediaController mediacontroller)
    {
        if (mMediaController != null)
            mMediaController.hide();
        mMediaController = mediacontroller;
        attachMediaController();
    }

    public void setOnCompletionListener(android.media.MediaPlayer.OnCompletionListener oncompletionlistener)
    {
        mOnCompletionListener = oncompletionlistener;
    }

    public void setOnErrorListener(android.media.MediaPlayer.OnErrorListener onerrorlistener)
    {
        mOnErrorListener = onerrorlistener;
    }

    public void setOnInfoListener(android.media.MediaPlayer.OnInfoListener oninfolistener)
    {
        mOnInfoListener = oninfolistener;
    }

    public void setOnPreparedListener(android.media.MediaPlayer.OnPreparedListener onpreparedlistener)
    {
        mOnPreparedListener = onpreparedlistener;
    }

    public void setVideoPath(String s)
    {
        setVideoURI(Uri.parse(s));
    }

    public void setVideoURI(Uri uri)
    {
        setVideoURI(uri, null);
    }

    public void setVideoURI(Uri uri, Map map)
    {
        mUri = uri;
        mHeaders = map;
        mSeekWhenPrepared = 0;
        openVideo();
        requestLayout();
        invalidate();
    }

    public void start()
    {
        if (isInPlaybackState())
        {
            mMediaPlayer.start();
            mCurrentState = 3;
        }
        mTargetState = 3;
    }

    public void stopPlayback()
    {
        if (mMediaPlayer != null)
        {
            mMediaPlayer.stop();
            mMediaPlayer.release();
            mMediaPlayer = null;
            mCurrentState = 0;
            mTargetState = 0;
        }
    }

    public void suspend()
    {
        release(false);
    }

    protected void toggleMediaControlsVisiblity()
    {
        if (mMediaController.isShowing())
        {
            mMediaController.hide();
            return;
        } else
        {
            mMediaController.show();
            return;
        }
    }




    // Unreferenced inner class android/widget/VideoView$4$1

/* anonymous class */
    class _cls1
        implements android.content.DialogInterface.OnClickListener
    {

        final _cls4 this$1;

        public void onClick(DialogInterface dialoginterface, int i)
        {
            if (mOnCompletionListener != null)
                mOnCompletionListener.onCompletion(mMediaPlayer);
        }

            
            {
                this$1 = _cls4.this;
                super();
            }
    }

}
