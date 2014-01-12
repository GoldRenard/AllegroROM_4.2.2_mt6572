// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.qsg;

import android.app.Activity;
import android.content.Intent;
import android.content.res.*;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.SystemProperties;
import android.view.*;
import android.widget.*;
import com.mediatek.xlog.Xlog;
import java.io.IOException;

public class QuickStartGuideMain extends Activity
    implements android.media.MediaPlayer.OnCompletionListener, android.media.MediaPlayer.OnPreparedListener, android.view.SurfaceHolder.Callback
{

    private static final int SUMMARY[] = {
        0x7f09003d, 0x7f09003f, 0x7f090041, 0x7f090043, 0x7f090046
    };
    private static final String TAG = "QuickStartGuideMain";
    private static final int TITLE[] = {
        0x7f09003c, 0x7f09003e, 0x7f090040, 0x7f090042, 0x7f090037
    };
    private int mCurrentStep;
    private android.media.MediaPlayer.OnErrorListener mErrorListener;
    private LinearLayout mGroupButtons;
    private boolean mHideVideo;
    private SurfaceHolder mHolder;
    private boolean mIsFirstRun;
    private boolean mIsHolderCreated;
    private boolean mIsPreload;
    private boolean mIsTablet;
    private boolean mIsVideoReadyToBePlayed;
    private MediaPlayer mMediaPlayer;
    private LinearLayout mNextButtons;
    private android.view.View.OnClickListener mNextListener;
    private Button mNextbtn;
    private Button mOkbtn;
    private String mPath;
    private android.view.View.OnClickListener mPlayAgainListener;
    private Button mPlayAgainbtn;
    private SurfaceView mPreview;
    private LinearLayout mProgressBar;
    private boolean mSetScreen;
    private android.view.View.OnClickListener mSkipListener;
    private Button mSkipbtn;
    private android.view.View.OnClickListener mStartListener;
    private TextView mSummary;
    private TextView mTitle;
    private int mVideoHeight;
    private String mVideoTips[] = {
        "JB_01View_Home_screen.mp4", "JB_02Choose_some_widgets.mp4", "JB_03Launch_detail_page.mp4", "JB_04ViewNotifications.mp4"
    };
    private int mVideoWidth;

    public QuickStartGuideMain()
    {
        mCurrentStep = -1;
        mIsPreload = false;
        mHideVideo = true;
        mIsVideoReadyToBePlayed = false;
        mIsHolderCreated = false;
        mIsFirstRun = false;
        mIsTablet = false;
        mSetScreen = false;
        mSkipListener = new android.view.View.OnClickListener() {

            final QuickStartGuideMain this$0;

            public void onClick(View view)
            {
                finishGuickStartGuide();
            }

            
            {
                this$0 = QuickStartGuideMain.this;
                super();
            }
        }
;
        mStartListener = new android.view.View.OnClickListener() {

            final QuickStartGuideMain this$0;

            public void onClick(View view)
            {
                mHideVideo = false;
                mProgressBar.setVisibility(0);
                mGroupButtons.setVisibility(8);
                mNextButtons.setVisibility(0);
                updateProgress(mCurrentStep);
                hideTitleSummary();
                if (mMediaPlayer != null && mIsPreload)
                {
                    mMediaPlayer.seekTo(0);
                    if (mIsVideoReadyToBePlayed)
                        startVideoPlayback();
                }
            }

            
            {
                this$0 = QuickStartGuideMain.this;
                super();
            }
        }
;
        mNextListener = new android.view.View.OnClickListener() {

            final QuickStartGuideMain this$0;

            public void onClick(View view)
            {
                if (mNextbtn.getText().equals(getResources().getString(0x7f09003b)))
                {
                    Xlog.d("QuickStartGuideMain", "finishGuickStartGuide");
                    finishGuickStartGuide();
                    return;
                }
                if (mCurrentStep == -1 + mVideoTips.length)
                {
                    Xlog.d("QuickStartGuideMain", "go to last QSG page");
                    mIsPreload = false;
                    playVideo(mCurrentStep);
                    updateTitleSummary(mVideoTips.length);
                    mNextbtn.setText(0x7f09003b);
                    mPlayAgainbtn.setVisibility(0);
                    mPreview.setBackgroundResource(0x7f020037);
                    mHideVideo = true;
                    mProgressBar.setVisibility(8);
                    int i = ((updateTitleSummary) (this)).updateTitleSummary;
                    return;
                } else
                {
                    int i = ((updateTitleSummary) (this)).updateTitleSummary;
                    hideTitleSummary();
                    playVideo(mCurrentStep);
                    return;
                }
            }

            
            {
                this$0 = QuickStartGuideMain.this;
                super();
            }
        }
;
        mPlayAgainListener = new android.view.View.OnClickListener() {

            final QuickStartGuideMain this$0;

            public void onClick(View view)
            {
                if (mCurrentStep == mVideoTips.length)
                {
                    mCurrentStep = 0;
                    mHideVideo = false;
                    mProgressBar.setVisibility(0);
                    resetProgressBar();
                    mNextbtn.setText(0x7f090039);
                }
                hideTitleSummary();
                playVideo(mCurrentStep);
            }

            
            {
                this$0 = QuickStartGuideMain.this;
                super();
            }
        }
;
        mErrorListener = new android.media.MediaPlayer.OnErrorListener() {

            final QuickStartGuideMain this$0;

            public boolean onError(MediaPlayer mediaplayer, int i, int j)
            {
                Xlog.d("QuickStartGuideMain", (new StringBuilder()).append("play error: ").append(i).toString());
                releaseMediaPlayer();
                return false;
            }

            
            {
                this$0 = QuickStartGuideMain.this;
                super();
            }
        }
;
    }

    private void doCleanUp()
    {
        mVideoWidth = 0;
        mVideoHeight = 0;
        mIsVideoReadyToBePlayed = false;
        mProgressBar.setVisibility(0);
    }

    private void finishGuickStartGuide()
    {
        Xlog.v("QuickStartGuideMain", "finish quick start guide");
        if (mMediaPlayer != null && mMediaPlayer.isPlaying())
        {
            mMediaPlayer.pause();
            Xlog.d("QuickStartGuideMain", "video is playing ");
        }
        if (mIsFirstRun)
        {
            android.provider.Settings.System.putInt(getContentResolver(), "show_quick_start_guide", 1);
            Xlog.w("QuickStartGuideMain", "OOBE begin to start launcher with flag stored in settings providers");
        }
        Xlog.v("QuickStartGuideMain", "setResult code 25");
        finish();
    }

    private void isTablet()
    {
        if (SystemProperties.get("ro.build.characteristics").equals("tablet"))
            mIsTablet = true;
    }

    private void playVideo(int i)
    {
        Xlog.d("QuickStartGuideMain", (new StringBuilder()).append("playVideo step=").append(i).toString());
        if (mIsPreload)
        {
            doCleanUp();
            updateProgress(i);
        }
        if (i < 0)
            break MISSING_BLOCK_LABEL_67;
        if (i <= -1 + mVideoTips.length)
            mPath = mVideoTips[i];
        if (mMediaPlayer != null)
        {
            mMediaPlayer.reset();
            AssetFileDescriptor assetfiledescriptor = getAssets().openFd(mPath);
            mMediaPlayer.setDataSource(assetfiledescriptor.getFileDescriptor(), assetfiledescriptor.getStartOffset(), assetfiledescriptor.getLength());
            mMediaPlayer.prepare();
            resizeSurfaceView();
        }
        return;
        IOException ioexception;
        ioexception;
        Xlog.e("QuickStartGuideMain", (new StringBuilder()).append("unable to open file; error: ").append(ioexception.getMessage()).toString(), ioexception);
        mMediaPlayer.release();
        mMediaPlayer = null;
        return;
        IllegalStateException illegalstateexception;
        illegalstateexception;
        Xlog.e("QuickStartGuideMain", (new StringBuilder()).append("media player is in illegal state; error: ").append(illegalstateexception.getMessage()).toString(), illegalstateexception);
        mMediaPlayer.release();
        mMediaPlayer = null;
        return;
    }

    private void releaseMediaPlayer()
    {
        if (mMediaPlayer != null)
        {
            mMediaPlayer.release();
            mMediaPlayer = null;
        }
    }

    private void startVideoPlayback()
    {
        Xlog.v("QuickStartGuideMain", "startVideoPlayback");
        if (mIsHolderCreated)
        {
            mMediaPlayer.start();
            if (mMediaPlayer.isPlaying())
            {
                Xlog.d("QuickStartGuideMain", "QSG video is playing ");
                mPreview.setBackgroundColor(0x106000d);
                return;
            }
        }
    }

    protected void hideTitleSummary()
    {
        mTitle.setText("");
        mSummary.setText("");
        mPlayAgainbtn.setVisibility(4);
    }

    public void onCompletion(MediaPlayer mediaplayer)
    {
        Xlog.d("QuickStartGuideMain", "onCompletion called");
        if (!mHideVideo)
        {
            updateTitleSummary(mCurrentStep);
            mPlayAgainbtn.setVisibility(0);
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        isTablet();
        if (!mIsTablet)
            setRequestedOrientation(1);
        Xlog.d("QuickStartGuideMain", "QuickStartGuideMain onCreate ");
        setContentView(0x7f03001a);
        if ((0x400 & getWindow().getAttributes().flags) != 1024)
        {
            Xlog.d("QuickStartGuideMain", " fullscreen = false");
            getWindow().setFlags(1024, 1024);
        }
        mIsFirstRun = getIntent().getBooleanExtra("mIsFirstRun", false);
        Xlog.d("QuickStartGuideMain", (new StringBuilder()).append("mIsFirstRun = ").append(mIsFirstRun).toString());
        mSkipbtn = (Button)findViewById(0x7f0b0044);
        if (!mIsFirstRun)
        {
            mSkipbtn.setVisibility(4);
        } else
        {
            mSkipbtn.setOnClickListener(mSkipListener);
            mSkipbtn.setVisibility(0);
        }
        mOkbtn = (Button)findViewById(0x7f0b0045);
        mOkbtn.setOnClickListener(mStartListener);
        mGroupButtons = (LinearLayout)findViewById(0x7f0b0043);
        mNextButtons = (LinearLayout)findViewById(0x7f0b0046);
        mNextbtn = (Button)findViewById(0x7f0b0048);
        mNextbtn.setOnClickListener(mNextListener);
        mPlayAgainbtn = (Button)findViewById(0x7f0b0047);
        mPlayAgainbtn.setOnClickListener(mPlayAgainListener);
        mTitle = (TextView)findViewById(0x7f0b0041);
        mSummary = (TextView)findViewById(0x7f0b0042);
        mProgressBar = (LinearLayout)findViewById(0x7f0b0030);
        mPreview = (SurfaceView)findViewById(0x7f0b0058);
        mHolder = mPreview.getHolder();
        mHolder.addCallback(this);
        mHolder.setType(3);
        mMediaPlayer = new MediaPlayer();
        mMediaPlayer.setOnCompletionListener(this);
        mMediaPlayer.setOnPreparedListener(this);
        mMediaPlayer.setOnErrorListener(mErrorListener);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        releaseMediaPlayer();
        doCleanUp();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 4: // '\004'
            Xlog.i("QuickStartGuideMain", "Press back button to former settings");
            Xlog.i("QuickStartGuideMain", (new StringBuilder()).append("Is first started?").append(mIsFirstRun).toString());
            if (mIsFirstRun)
                return true;
            finishGuickStartGuide();
            break;
        }
        return super.onKeyDown(i, keyevent);
    }

    protected void onPause()
    {
        super.onPause();
        Xlog.d("QuickStartGuideMain", "onPause called");
        if (mMediaPlayer != null)
            mMediaPlayer.pause();
        if (mIsFirstRun)
        {
            android.provider.Settings.System.putInt(getContentResolver(), "oobe_display", 0);
            android.provider.Settings.Global.putInt(getContentResolver(), "device_provisioned", 1);
        }
    }

    public void onPrepared(MediaPlayer mediaplayer)
    {
        Xlog.d("QuickStartGuideMain", "onPrepared called");
        mIsVideoReadyToBePlayed = true;
        if (!mIsPreload && mIsHolderCreated)
        {
            Xlog.d("QuickStartGuideMain", "first prepare video...");
            mIsPreload = true;
            mMediaPlayer.start();
        } else
        if (mIsVideoReadyToBePlayed)
        {
            startVideoPlayback();
            return;
        }
    }

    protected void onResume()
    {
        super.onResume();
        Xlog.d("QuickStartGuideMain", (new StringBuilder()).append("onResume called: mHideVideo=").append(mHideVideo).toString());
        if (mMediaPlayer != null && mCurrentStep != -1 && !mHideVideo && mIsHolderCreated)
        {
            hideTitleSummary();
            mMediaPlayer.seekTo(0);
            mMediaPlayer.start();
        }
        if (mIsFirstRun)
        {
            android.provider.Settings.System.putInt(getContentResolver(), "oobe_display", 1);
            android.provider.Settings.Global.putInt(getContentResolver(), "device_provisioned", 0);
        }
    }

    protected void resetProgressBar()
    {
        for (int i = 0; i < mProgressBar.getChildCount(); i++)
        {
            ImageView imageview = (ImageView)mProgressBar.getChildAt(i);
            imageview.setImageResource(0x7f020032);
            if (i == 0)
                imageview.setImageResource(0x7f020033);
        }

    }

    public void resizeSurfaceView()
    {
        Xlog.d("QuickStartGuideMain", "resizeSurfaceView()");
        if (mSetScreen)
            return;
        mSetScreen = true;
        int i = mMediaPlayer.getVideoWidth();
        int j = mMediaPlayer.getVideoHeight();
        int k = getWindowManager().getDefaultDisplay().getWidth();
        int l = getWindowManager().getDefaultDisplay().getHeight();
        android.view.ViewGroup.LayoutParams layoutparams = mPreview.getLayoutParams();
        float f = (float)j / (float)i;
        if ((float)l / (float)k > f)
        {
            layoutparams.width = k;
            layoutparams.height = (int)(f * (float)k);
            Xlog.d("QuickStartGuideMain", "screenScale > videoScale");
        } else
        {
            layoutparams.height = l;
            layoutparams.width = (int)((float)l / f);
            Xlog.d("QuickStartGuideMain", "screenScale < videoScale");
        }
        mPreview.setLayoutParams(layoutparams);
    }

    public void surfaceChanged(SurfaceHolder surfaceholder, int i, int j, int k)
    {
        Xlog.d("QuickStartGuideMain", "surfaceChanged called");
    }

    public void surfaceCreated(SurfaceHolder surfaceholder)
    {
        Xlog.d("QuickStartGuideMain", "surfaceCreated called");
        mIsHolderCreated = true;
        if (mMediaPlayer != null)
        {
            mHolder = surfaceholder;
            mMediaPlayer.setDisplay(mHolder);
            if (mCurrentStep == -1)
            {
                mCurrentStep = 0;
                playVideo(mCurrentStep);
            } else
            {
                Xlog.d("QuickStartGuideMain", "surfaceCreated play video");
                if (!mHideVideo)
                {
                    hideTitleSummary();
                    mMediaPlayer.seekTo(0);
                    mMediaPlayer.start();
                    return;
                }
            }
        }
    }

    public void surfaceDestroyed(SurfaceHolder surfaceholder)
    {
        Xlog.d("QuickStartGuideMain", "surfaceDestroyed called");
        mIsHolderCreated = false;
        if (mMediaPlayer != null)
            mMediaPlayer.pause();
    }

    protected void updateProgress(int i)
    {
        for (int j = 0; j < mVideoTips.length; j++)
        {
            ImageView imageview = (ImageView)mProgressBar.getChildAt(j);
            imageview.setImageResource(0x7f020032);
            if (j == i)
                imageview.setImageResource(0x7f020033);
            imageview.setVisibility(0);
        }

    }

    protected void updateTitleSummary(int i)
    {
        mTitle.setText(TITLE[i]);
        mSummary.setText(SUMMARY[i]);
    }





/*
    static boolean access$102(QuickStartGuideMain quickstartguidemain, boolean flag)
    {
        quickstartguidemain.mHideVideo = flag;
        return flag;
    }

*/











/*
    static int access$502(QuickStartGuideMain quickstartguidemain, int i)
    {
        quickstartguidemain.mCurrentStep = i;
        return i;
    }

*/


/*
    static int access$508(QuickStartGuideMain quickstartguidemain)
    {
        int i = quickstartguidemain.mCurrentStep;
        quickstartguidemain.mCurrentStep = i + 1;
        return i;
    }

*/




/*
    static boolean access$702(QuickStartGuideMain quickstartguidemain, boolean flag)
    {
        quickstartguidemain.mIsPreload = flag;
        return flag;
    }

*/


}
