// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt;

import android.content.Context;
import android.util.Log;
import android.view.SurfaceHolder;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.mediatek.vt:
//            CameraParamters, VTelProvider

public class VTSettings
{

    static final int CAMERA_ZOOM_SCALE_LEVELS = 16;
    private static final boolean DEBUG = true;
    static final String KEY_CAMERA = "camera";
    static final String KEY_IS_MUTE = "microphone_is_mute";
    static final String KEY_LOCAL_IMAGE_PATH = "KEY_LOCAL_IMAGE_PATH";
    static final String KEY_LOCAL_IMAGE_TYPE = "KEY_LOCAL_IMAGE_TYPE";
    static final String KEY_LOCAL_VIDEO_TYPE = "KEY_LOCAL_VIDEO_TYPE";
    static final String KEY_SPEAKER_IS_ON = "SPEAKER_IS_ON";
    static final String KEY_VIDEO_QUALITY = "video_quality";
    public static final int OFF = 0;
    public static final int ON = 1;
    private static final String TAG = "VTSettings";
    static final String VTSETTING_FILE = "vt_settings";
    CameraParamters mCameraParamters;
    int mCameraZoomIncVal;
    Context mContext;
    String mImagePath;
    boolean mIsSwitch;
    SurfaceHolder mLocalSurface;
    SurfaceHolder mPeerSurface;
    int mVideoQuality;
    int mVideoType;


    public boolean canDecBrightness()
    {
        Log.i("VTSettings", "canDecBrightness");
        return mCameraParamters.getExposureCompensation() > mCameraParamters.getMinExposureCompensation();
    }

    public boolean canDecContrast()
    {
        Log.i("VTSettings", "canDecContrast");
        List list = mCameraParamters.getSupportedContrastMode();
        return list != null && list.size() != 0 && !"low".equals(getContrastMode());
    }

    public boolean canDecZoom()
    {
        Log.i("VTSettings", "canDecZoom");
        return mCameraParamters.isZoomSupported() && getZoom() > 0;
    }

    public boolean canIncBrightness()
    {
        Log.i("VTSettings", "getBrightnessMode");
        return mCameraParamters.getExposureCompensation() < mCameraParamters.getMaxExposureCompensation();
    }

    public boolean canIncContrast()
    {
        Log.i("VTSettings", "canIncContrast");
        List list = mCameraParamters.getSupportedContrastMode();
        return list != null && list.size() != 0 && !"high".equals(getContrastMode());
    }

    public boolean canIncZoom()
    {
        Log.i("VTSettings", "canIncZoom");
        return mCameraParamters.isZoomSupported() && getZoom() < mCameraParamters.getMaxZoom();
    }

    public boolean decBrightness()
    {
        Log.i("VTSettings", "decBrightness");
        int i = mCameraParamters.getExposureCompensation();
        int j = mCameraParamters.getMinExposureCompensation();
        float f = mCameraParamters.getExposureCompensationStep();
        int k = (int)((float)i - f);
        if (k < j)
            k = j;
        mCameraParamters.setExposureCompensation(k);
        return true;
    }

    public boolean decContrast()
    {
label0:
        {
            Log.i("VTSettings", "decContrast");
            String s = getContrastMode();
            if (s == null)
                mCameraParamters.setContrastMode("low");
            else
            if (s.equals("high"))
            {
                mCameraParamters.setContrastMode("middle");
            } else
            {
                if (!s.equals("middle"))
                    break label0;
                mCameraParamters.setContrastMode("low");
            }
            return true;
        }
        return false;
    }

    public boolean decZoom()
    {
        Log.i("VTSettings", "decZoom");
        int i = getZoom() - mCameraZoomIncVal;
        if (i < 0)
            i = 0;
        mCameraParamters.setZoom(i);
        return true;
    }

    void deinit()
    {
        mCameraParamters = null;
    }

    public String getBrightnessMode()
    {
        if (mCameraParamters == null)
            return null;
        else
            return mCameraParamters.getExposure();
    }

    void getCameraSettings()
    {
        mCameraParamters = VTelProvider.getParameters();
        if (mCameraParamters.isZoomSupported())
            mCameraZoomIncVal = 1;
    }

    public CameraParamters getCameraSettingsForTest()
    {
        Log.e("VTSettings", "call function getCameraSettings()");
        getCameraSettings();
        Log.e("VTSettings", "call function getCameraSettings() finished");
        return mCameraParamters;
    }

    public String getColorEffect()
    {
        if (mCameraParamters == null)
            return null;
        else
            return mCameraParamters.getColorEffect();
    }

    public String getContrastMode()
    {
        if (mCameraParamters == null)
        {
            return null;
        } else
        {
            String s = mCameraParamters.getContrastMode();
            Log.i("VTSettings", (new StringBuilder()).append("getContrastMode [").append(s).append("]").toString());
            return s;
        }
    }

    void getDefaultSettings()
    {
        mCameraParamters = null;
    }

    public String getImagePath()
    {
        return mImagePath;
    }

    public boolean getIsSwitch()
    {
        return mIsSwitch;
    }

    public SurfaceHolder getLocalSurface()
    {
        return mLocalSurface;
    }

    public boolean getNightMode()
    {
        if (getSceneMode() == null)
            return false;
        else
            return getSceneMode().equals("night");
    }

    public SurfaceHolder getPeerSurface()
    {
        return mPeerSurface;
    }

    public String getSceneMode()
    {
        if (mCameraParamters == null)
            return null;
        if (mCameraParamters.getSceneMode() == null)
        {
            Log.i("VTSettings", "mCameraParamters.getSceneMode() is null");
            return null;
        } else
        {
            Log.i("VTSettings", mCameraParamters.getSceneMode().toString());
            return mCameraParamters.getSceneMode();
        }
    }

    public List getSupportedBrightnessMode()
    {
        if (mCameraParamters == null)
            return null;
        else
            return mCameraParamters.getSupportedExposure();
    }

    public List getSupportedColorEffects()
    {
        if (mCameraParamters == null)
            return null;
        else
            return mCameraParamters.getSupportedColorEffects();
    }

    public List getSupportedContrastMode()
    {
        if (mCameraParamters == null)
            return null;
        else
            return mCameraParamters.getSupportedContrastMode();
    }

    public List getSupportedSceneModes()
    {
        if (mCameraParamters == null)
            return null;
        else
            return mCameraParamters.getSupportedSceneModes();
    }

    public int getVideoQuality()
    {
        return mVideoQuality;
    }

    public int getVideoType()
    {
        return mVideoType;
    }

    public int getZoom()
    {
        Log.i("VTSettings", "getZoom");
        if (mCameraParamters == null)
            return 0;
        else
            return mCameraParamters.getZoom();
    }

    public List getZoomRatios()
    {
        Log.i("VTSettings", "getZoomRatios");
        if (mCameraParamters == null)
            return null;
        else
            return mCameraParamters.getZoomRatios();
    }

    public boolean incBrightness()
    {
        Log.i("VTSettings", "incBrightness");
        int i = mCameraParamters.getExposureCompensation();
        int j = mCameraParamters.getMaxExposureCompensation();
        int k = (int)(mCameraParamters.getExposureCompensationStep() + (float)i);
        if (k > j)
            k = j;
        mCameraParamters.setExposureCompensation(k);
        return true;
    }

    public boolean incContrast()
    {
label0:
        {
            Log.i("VTSettings", "incContrast");
            String s = getContrastMode();
            if (s == null)
                mCameraParamters.setContrastMode("high");
            else
            if (s.equals("low"))
            {
                mCameraParamters.setContrastMode("middle");
            } else
            {
                if (!s.equals("middle"))
                    break label0;
                mCameraParamters.setContrastMode("high");
            }
            return true;
        }
        return false;
    }

    public boolean incZoom()
    {
        Log.i("VTSettings", "incZoom");
        int i = getZoom() + mCameraZoomIncVal;
        int j = mCameraParamters.getMaxZoom();
        if (i > j)
            i = j;
        mCameraParamters.setZoom(i);
        return true;
    }

    void init(Context context)
    {
        if (mCameraParamters != null)
        {
            Log.e("VTSettings", "init error");
            return;
        } else
        {
            mContext = context;
            mVideoType = 0;
            mImagePath = null;
            mIsSwitch = false;
            mVideoQuality = 1;
            mCameraZoomIncVal = 0;
            mCameraParamters = null;
            return;
        }
    }

    public boolean isSupportNightMode()
    {
label0:
        {
            List list = getSupportedSceneModes();
            if (list == null)
                break label0;
            Iterator iterator = list.iterator();
            do
                if (!iterator.hasNext())
                    break label0;
            while (!((String)iterator.next()).equalsIgnoreCase("night"));
            return true;
        }
        return false;
    }

    public boolean isZoomSupported()
    {
        if (mCameraParamters == null)
            return false;
        else
            return mCameraParamters.isZoomSupported();
    }

    public void setBrightnessMode(String s)
    {
        if (mCameraParamters == null)
        {
            return;
        } else
        {
            mCameraParamters.setExposure(s);
            return;
        }
    }

    public void setColorEffect(String s)
    {
        if (mCameraParamters == null)
        {
            return;
        } else
        {
            mCameraParamters.setColorEffect(s);
            return;
        }
    }

    public void setContrastMode(String s)
    {
        Log.i("VTSettings", (new StringBuilder()).append("setContrastMode [").append(s).append("]").toString());
        if (mCameraParamters == null)
        {
            return;
        } else
        {
            mCameraParamters.setContrastMode(s);
            return;
        }
    }

    public void setImagePath(String s)
    {
        mImagePath = s;
    }

    public void setIsSwitch(boolean flag)
    {
        mIsSwitch = flag;
    }

    public void setLocalSurface(SurfaceHolder surfaceholder)
    {
        mLocalSurface = surfaceholder;
    }

    public void setNightMode(boolean flag)
    {
        String s;
        if (flag)
            s = "night";
        else
            s = "auto";
        setNightModeFrameRate(flag);
        setSceneMode(s);
    }

    public void setNightModeFrameRate(boolean flag)
    {
        CameraParamters cameraparamters = mCameraParamters;
        byte byte0;
        if (flag)
            byte0 = 15;
        else
            byte0 = 30;
        cameraparamters.setPreviewFrameRate(byte0);
    }

    public void setPeerSurface(SurfaceHolder surfaceholder)
    {
        mPeerSurface = surfaceholder;
    }

    public void setSceneMode(String s)
    {
        Log.i("VTSettings", "setSceneMode");
        Log.i("VTSettings", s);
        if (mCameraParamters == null)
        {
            return;
        } else
        {
            mCameraParamters.setSceneMode(s);
            return;
        }
    }

    public void setVideoQuality(int i)
    {
        mVideoQuality = i;
    }

    public void setVideoType(int i)
    {
        mVideoType = i;
    }

    public void setZoom(int i)
    {
        Log.i("VTSettings", "setZoom");
        if (mCameraParamters == null)
            return;
        if (i < 0)
            i = 0;
        mCameraParamters.setZoom(i);
    }
}
