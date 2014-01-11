// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt;

import android.util.Log;
import java.util.*;

public class CameraParamters
{
    public static class Size
    {

        public int height;
        public int width;

        public boolean equals(Object obj)
        {
            if (obj instanceof Size)
            {
                Size size = (Size)obj;
                if (width == size.width && height == size.height)
                    return true;
            }
            return false;
        }

        public int hashCode()
        {
            return 32713 * width + height;
        }

        public Size(int i, int j)
        {
            width = i;
            height = j;
        }
    }


    public static final String ANTIBANDING_50HZ = "50hz";
    public static final String ANTIBANDING_60HZ = "60hz";
    public static final String ANTIBANDING_AUTO = "auto";
    public static final String ANTIBANDING_OFF = "off";
    public static final String CAPTURE_MODE_BEST_SHOT = "bestshot";
    public static final String CAPTURE_MODE_BURST_SHOT = "burstshot";
    public static final String CAPTURE_MODE_EV_BRACKET_SHOT = "evbracketshot";
    public static final String CAPTURE_MODE_NORMAL = "normal";
    public static final String CONTRAST_HIGH = "high";
    public static final String CONTRAST_LOW = "low";
    public static final String CONTRAST_MIDDLE = "middle";
    public static final String EFFECT_AQUA = "aqua";
    public static final String EFFECT_BLACKBOARD = "blackboard";
    public static final String EFFECT_MONO = "mono";
    public static final String EFFECT_NEGATIVE = "negative";
    public static final String EFFECT_NONE = "none";
    public static final String EFFECT_POSTERIZE = "posterize";
    public static final String EFFECT_SEPIA = "sepia";
    public static final String EFFECT_SOLARIZE = "solarize";
    public static final String EFFECT_WHITEBOARD = "whiteboard";
    public static final String FLASH_MODE_AUTO = "auto";
    public static final String FLASH_MODE_OFF = "off";
    public static final String FLASH_MODE_ON = "on";
    public static final String FLASH_MODE_RED_EYE = "red-eye";
    public static final String FLASH_MODE_TORCH = "torch";
    public static final String FOCUS_MODE_AUTO = "auto";
    public static final String FOCUS_MODE_EDOF = "edof";
    public static final String FOCUS_MODE_FIXED = "fixed";
    public static final String FOCUS_MODE_INFINITY = "infinity";
    public static final String FOCUS_MODE_MACRO = "macro";
    private static final String KEY_ANTIBANDING = "antibanding";
    private static final String KEY_BRIGHTNESS_MODE = "brightness";
    private static final String KEY_BURST_SHOT_NUM = "burst-num";
    private static final String KEY_CAPTURE_MODE = "cap-mode";
    private static final String KEY_CAPTURE_PATH = "capfname";
    private static final String KEY_CONTRAST_MODE = "contrast";
    private static final String KEY_EDGE_MODE = "edge";
    private static final String KEY_EFFECT = "effect";
    private static final String KEY_EXPOSURE = "exposure";
    private static final String KEY_EXPOSURE_COMPENSATION = "exposure-compensation";
    private static final String KEY_EXPOSURE_COMPENSATION_STEP = "exposure-compensation-step";
    private static final String KEY_EXPOSURE_METER = "exposure-meter";
    private static final String KEY_FD_MODE = "fd-mode";
    private static final String KEY_FLASH_MODE = "flash-mode";
    private static final String KEY_FOCAL_LENGTH = "focal-length";
    private static final String KEY_FOCUS_METER = "focus-meter";
    private static final String KEY_FOCUS_MODE = "focus-mode";
    private static final String KEY_GPS_ALTITUDE = "gps-altitude";
    private static final String KEY_GPS_LATITUDE = "gps-latitude";
    private static final String KEY_GPS_LONGITUDE = "gps-longitude";
    private static final String KEY_GPS_PROCESSING_METHOD = "gps-processing-method";
    private static final String KEY_GPS_TIMESTAMP = "gps-timestamp";
    private static final String KEY_HORIZONTAL_VIEW_ANGLE = "horizontal-view-angle";
    private static final String KEY_HUE_MODE = "hue";
    private static final String KEY_ISOSPEED_MODE = "iso-speed";
    private static final String KEY_JPEG_QUALITY = "jpeg-quality";
    private static final String KEY_JPEG_THUMBNAIL_HEIGHT = "jpeg-thumbnail-height";
    private static final String KEY_JPEG_THUMBNAIL_QUALITY = "jpeg-thumbnail-quality";
    private static final String KEY_JPEG_THUMBNAIL_SIZE = "jpeg-thumbnail-size";
    private static final String KEY_JPEG_THUMBNAIL_WIDTH = "jpeg-thumbnail-width";
    private static final String KEY_MAX_EXPOSURE_COMPENSATION = "max-exposure-compensation";
    private static final String KEY_MAX_ZOOM = "max-zoom";
    private static final String KEY_MIN_EXPOSURE_COMPENSATION = "min-exposure-compensation";
    private static final String KEY_PICTURE_FORMAT = "picture-format";
    private static final String KEY_PICTURE_SIZE = "picture-size";
    private static final String KEY_PREVIEW_FORMAT = "preview-format";
    private static final String KEY_PREVIEW_FRAME_RATE = "preview-frame-rate";
    private static final String KEY_PREVIEW_SIZE = "preview-size";
    private static final String KEY_ROTATION = "rotation";
    private static final String KEY_SATURATION_MODE = "saturation";
    private static final String KEY_SCENE_MODE = "scene-mode";
    private static final String KEY_SMOOTH_ZOOM_SUPPORTED = "smooth-zoom-supported";
    private static final String KEY_VERTICAL_VIEW_ANGLE = "vertical-view-angle";
    private static final String KEY_WHITE_BALANCE = "whitebalance";
    private static final String KEY_ZOOM = "zoom";
    private static final String KEY_ZOOM_RATIOS = "zoom-ratios";
    private static final String KEY_ZOOM_SUPPORTED = "zoom-supported";
    private static final String PIXEL_FORMAT_JPEG = "jpeg";
    private static final String PIXEL_FORMAT_RGB565 = "rgb565";
    private static final String PIXEL_FORMAT_YUV420SP = "yuv420sp";
    private static final String PIXEL_FORMAT_YUV422I = "yuv422i-yuyv";
    private static final String PIXEL_FORMAT_YUV422SP = "yuv422sp";
    public static final String SCENE_MODE_ACTION = "action";
    public static final String SCENE_MODE_AUTO = "auto";
    public static final String SCENE_MODE_BARCODE = "barcode";
    public static final String SCENE_MODE_BEACH = "beach";
    public static final String SCENE_MODE_CANDLELIGHT = "candlelight";
    public static final String SCENE_MODE_FIREWORKS = "fireworks";
    public static final String SCENE_MODE_LANDSCAPE = "landscape";
    public static final String SCENE_MODE_NIGHT = "night";
    public static final String SCENE_MODE_NIGHT_PORTRAIT = "night-portrait";
    public static final String SCENE_MODE_PARTY = "party";
    public static final String SCENE_MODE_PORTRAIT = "portrait";
    public static final String SCENE_MODE_SNOW = "snow";
    public static final String SCENE_MODE_SPORTS = "sports";
    public static final String SCENE_MODE_STEADYPHOTO = "steadyphoto";
    public static final String SCENE_MODE_SUNSET = "sunset";
    public static final String SCENE_MODE_THEATRE = "theatre";
    private static final String SUPPORTED_VALUES_SUFFIX = "-values";
    private static final String TAG = "VT Camera Parameters";
    private static final String TRUE = "true";
    public static final String WHITE_BALANCE_AUTO = "auto";
    public static final String WHITE_BALANCE_CLOUDY_DAYLIGHT = "cloudy-daylight";
    public static final String WHITE_BALANCE_DAYLIGHT = "daylight";
    public static final String WHITE_BALANCE_FLUORESCENT = "fluorescent";
    public static final String WHITE_BALANCE_INCANDESCENT = "incandescent";
    public static final String WHITE_BALANCE_SHADE = "shade";
    public static final String WHITE_BALANCE_TWILIGHT = "twilight";
    public static final String WHITE_BALANCE_WARM_FLUORESCENT = "warm-fluorescent";
    private HashMap mMap;

    public CameraParamters()
    {
        mMap = new HashMap();
    }

    private float getFloat(String s, float f)
    {
        float f1;
        try
        {
            f1 = Float.parseFloat((String)mMap.get(s));
        }
        catch (NumberFormatException numberformatexception)
        {
            return f;
        }
        return f1;
    }

    private int getInt(String s, int i)
    {
        int j;
        try
        {
            j = Integer.parseInt((String)mMap.get(s));
        }
        catch (NumberFormatException numberformatexception)
        {
            return i;
        }
        return j;
    }

    private ArrayList split(String s)
    {
        ArrayList arraylist;
        if (s == null)
        {
            arraylist = null;
        } else
        {
            StringTokenizer stringtokenizer = new StringTokenizer(s, ",");
            arraylist = new ArrayList();
            for (; stringtokenizer.hasMoreElements(); arraylist.add(stringtokenizer.nextToken()));
        }
        return arraylist;
    }

    private ArrayList splitInt(String s)
    {
        ArrayList arraylist;
        if (s == null)
        {
            arraylist = null;
        } else
        {
            StringTokenizer stringtokenizer = new StringTokenizer(s, ",");
            arraylist = new ArrayList();
            for (; stringtokenizer.hasMoreElements(); arraylist.add(Integer.valueOf(Integer.parseInt(stringtokenizer.nextToken()))));
            if (arraylist.size() == 0)
                return null;
        }
        return arraylist;
    }

    private ArrayList splitSize(String s)
    {
        ArrayList arraylist;
        if (s == null)
        {
            arraylist = null;
        } else
        {
            StringTokenizer stringtokenizer = new StringTokenizer(s, ",");
            arraylist = new ArrayList();
            do
            {
                if (!stringtokenizer.hasMoreElements())
                    break;
                Size size = strToSize(stringtokenizer.nextToken());
                if (size != null)
                    arraylist.add(size);
            } while (true);
            if (arraylist.size() == 0)
                return null;
        }
        return arraylist;
    }

    private Size strToSize(String s)
    {
        if (s == null)
            return null;
        int i = s.indexOf('x');
        if (i != -1)
        {
            String s1 = s.substring(0, i);
            String s2 = s.substring(i + 1);
            return new Size(Integer.parseInt(s1), Integer.parseInt(s2));
        } else
        {
            Log.e("VT Camera Parameters", (new StringBuilder()).append("Invalid size parameter string=").append(s).toString());
            return null;
        }
    }

    public void dump()
    {
        Log.e("VT Camera Parameters", (new StringBuilder()).append("dump: size=").append(mMap.size()).toString());
        String s;
        for (Iterator iterator = mMap.keySet().iterator(); iterator.hasNext(); Log.e("VT Camera Parameters", (new StringBuilder()).append("dump: ").append(s).append("=").append((String)mMap.get(s)).toString()))
            s = (String)iterator.next();

    }

    public String flatten()
    {
        StringBuilder stringbuilder = new StringBuilder();
        for (Iterator iterator = mMap.keySet().iterator(); iterator.hasNext(); stringbuilder.append(";"))
        {
            String s = (String)iterator.next();
            stringbuilder.append(s);
            stringbuilder.append("=");
            stringbuilder.append((String)mMap.get(s));
        }

        stringbuilder.deleteCharAt(-1 + stringbuilder.length());
        return stringbuilder.toString();
    }

    public String get(String s)
    {
        return (String)mMap.get(s);
    }

    public String getAntibanding()
    {
        return get("antibanding");
    }

    public String getBrightnessMode()
    {
        return get("brightness");
    }

    public String getCaptureMode()
    {
        return get("cap-mode");
    }

    public String getColorEffect()
    {
        return get("effect");
    }

    public String getContrastMode()
    {
        return get("contrast");
    }

    public String getEdgeMode()
    {
        return get("edge");
    }

    public String getExposure()
    {
        return get("exposure");
    }

    public int getExposureCompensation()
    {
        return getInt("exposure-compensation", 0);
    }

    public float getExposureCompensationStep()
    {
        return getFloat("exposure-compensation-step", 0.0F);
    }

    public String getExposureMeter()
    {
        return get("exposure-meter");
    }

    public String getFDMode()
    {
        return get("fd-mode");
    }

    public String getFlashMode()
    {
        return get("flash-mode");
    }

    public float getFocalLength()
    {
        return Float.parseFloat(get("focal-length"));
    }

    public String getFocusMeter()
    {
        return get("focus-meter");
    }

    public String getFocusMode()
    {
        return get("focus-mode");
    }

    public float getHorizontalViewAngle()
    {
        return Float.parseFloat(get("horizontal-view-angle"));
    }

    public String getHueMode()
    {
        return get("hue");
    }

    public String getISOSpeed()
    {
        return get("iso-speed");
    }

    public int getInt(String s)
    {
        return Integer.parseInt((String)mMap.get(s));
    }

    public int getJpegQuality()
    {
        return getInt("jpeg-quality");
    }

    public int getJpegThumbnailQuality()
    {
        return getInt("jpeg-thumbnail-quality");
    }

    public Size getJpegThumbnailSize()
    {
        return new Size(getInt("jpeg-thumbnail-width"), getInt("jpeg-thumbnail-height"));
    }

    public int getMaxExposureCompensation()
    {
        return getInt("max-exposure-compensation", 0);
    }

    public int getMaxZoom()
    {
        return getInt("max-zoom", 0);
    }

    public int getMinExposureCompensation()
    {
        return getInt("min-exposure-compensation", 0);
    }

    public Size getPictureSize()
    {
        return strToSize(get("picture-size"));
    }

    public int getPreviewFrameRate()
    {
        return getInt("preview-frame-rate");
    }

    public Size getPreviewSize()
    {
        return strToSize(get("preview-size"));
    }

    public String getSaturationMode()
    {
        return get("saturation");
    }

    public String getSceneMode()
    {
        return get("scene-mode");
    }

    public List getSupportedAntibanding()
    {
        return split(get("antibanding-values"));
    }

    public List getSupportedBrightnessMode()
    {
        return split(get("brightness-values"));
    }

    public List getSupportedCaptureMode()
    {
        return split(get("cap-mode-values"));
    }

    public List getSupportedColorEffects()
    {
        return split(get("effect-values"));
    }

    public List getSupportedContrastMode()
    {
        return split(get("contrast-values"));
    }

    public List getSupportedEdgeMode()
    {
        return split(get("edge-values"));
    }

    public List getSupportedExposure()
    {
        return split(get("exposure-values"));
    }

    public List getSupportedExposureMeter()
    {
        return split(get("exposure-meter-values"));
    }

    public List getSupportedFDMode()
    {
        return split(get("fd-mode-values"));
    }

    public List getSupportedFlashModes()
    {
        return split(get("flash-mode-values"));
    }

    public List getSupportedFocusMeter()
    {
        return split(get("focus-meter-values"));
    }

    public List getSupportedFocusModes()
    {
        return split(get("focus-mode-values"));
    }

    public List getSupportedHueMode()
    {
        return split(get("hue-values"));
    }

    public List getSupportedISOSpeed()
    {
        return split(get("iso-speed-values"));
    }

    public List getSupportedJpegThumbnailSizes()
    {
        return splitSize(get("jpeg-thumbnail-size-values"));
    }

    public List getSupportedPreviewFrameRates()
    {
        return splitInt(get("preview-frame-rate-values"));
    }

    public List getSupportedPreviewSizes()
    {
        return splitSize(get("preview-size-values"));
    }

    public List getSupportedSaturationMode()
    {
        return split(get("saturation-values"));
    }

    public List getSupportedSceneModes()
    {
        return split(get("scene-mode-values"));
    }

    public List getSupportedWhiteBalance()
    {
        return split(get("whitebalance-values"));
    }

    public float getVerticalViewAngle()
    {
        return Float.parseFloat(get("vertical-view-angle"));
    }

    public String getWhiteBalance()
    {
        return get("whitebalance");
    }

    public int getZoom()
    {
        return getInt("zoom", 0);
    }

    public List getZoomRatios()
    {
        return splitInt(get("zoom-ratios"));
    }

    public boolean isSmoothZoomSupported()
    {
        return "true".equals(get("smooth-zoom-supported"));
    }

    public boolean isZoomSupported()
    {
        return "true".equals(get("zoom-supported"));
    }

    public void remove(String s)
    {
        mMap.remove(s);
    }

    public void removeGpsData()
    {
        remove("gps-latitude");
        remove("gps-longitude");
        remove("gps-altitude");
        remove("gps-timestamp");
        remove("gps-processing-method");
    }

    public void set(String s, int i)
    {
        mMap.put(s, Integer.toString(i));
    }

    public void set(String s, String s1)
    {
        if (s.indexOf('=') == -1 && s.indexOf(';') == -1)
        {
            if (s1.indexOf('=') == -1 && s1.indexOf(';') == -1)
            {
                mMap.put(s, s1);
                return;
            } else
            {
                Log.e("VT Camera Parameters", (new StringBuilder()).append("Value \"").append(s1).append("\" contains invalid character (= or ;)").toString());
                return;
            }
        } else
        {
            Log.e("VT Camera Parameters", (new StringBuilder()).append("Key \"").append(s).append("\" contains invalid character (= or ;)").toString());
            return;
        }
    }

    public void setAntibanding(String s)
    {
        set("antibanding", s);
    }

    public void setBrightnessMode(String s)
    {
        set("brightness", s);
    }

    public void setBurstShotNum(int i)
    {
        set("burst-num", i);
    }

    public void setCaptureMode(String s)
    {
        set("cap-mode", s);
    }

    public void setCapturePath(String s)
    {
        set("capfname", s);
    }

    public void setColorEffect(String s)
    {
        set("effect", s);
    }

    public void setContrastMode(String s)
    {
        set("contrast", s);
    }

    public void setEdgeMode(String s)
    {
        set("edge", s);
    }

    public void setExposure(String s)
    {
        set("exposure", s);
    }

    public void setExposureCompensation(int i)
    {
        set("exposure-compensation", i);
    }

    public void setExposureMeter(String s)
    {
        set("exposure-meter", s);
    }

    public void setFDMode(String s)
    {
        set("fd-mode", s);
    }

    public void setFlashMode(String s)
    {
        set("flash-mode", s);
    }

    public void setFocusMeter(String s)
    {
        set("focus-meter", s);
    }

    public void setFocusMode(String s)
    {
        set("focus-mode", s);
    }

    public void setGpsAltitude(double d)
    {
        set("gps-altitude", Double.toString(d));
    }

    public void setGpsLatitude(double d)
    {
        set("gps-latitude", Double.toString(d));
    }

    public void setGpsLongitude(double d)
    {
        set("gps-longitude", Double.toString(d));
    }

    public void setGpsProcessingMethod(String s)
    {
        set("gps-processing-method", s);
    }

    public void setGpsTimestamp(long l)
    {
        set("gps-timestamp", Long.toString(l));
    }

    public void setHueMode(String s)
    {
        set("hue", s);
    }

    public void setISOSpeed(String s)
    {
        set("iso-speed", s);
    }

    public void setJpegQuality(int i)
    {
        set("jpeg-quality", i);
    }

    public void setJpegThumbnailQuality(int i)
    {
        set("jpeg-thumbnail-quality", i);
    }

    public void setJpegThumbnailSize(int i, int j)
    {
        set("jpeg-thumbnail-width", i);
        set("jpeg-thumbnail-height", j);
    }

    public void setPictureSize(int i, int j)
    {
        set("picture-size", (new StringBuilder()).append(Integer.toString(i)).append("x").append(Integer.toString(j)).toString());
    }

    public void setPreviewFrameRate(int i)
    {
        set("preview-frame-rate", i);
    }

    public void setPreviewSize(int i, int j)
    {
        set("preview-size", (new StringBuilder()).append(Integer.toString(i)).append("x").append(Integer.toString(j)).toString());
    }

    public void setRotation(int i)
    {
        if (i != 0 && i != 90 && i != 180 && i != 270)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid rotation=").append(i).toString());
        } else
        {
            set("rotation", Integer.toString(i));
            return;
        }
    }

    public void setSaturationMode(String s)
    {
        set("saturation", s);
    }

    public void setSceneMode(String s)
    {
        set("scene-mode", s);
    }

    public void setWhiteBalance(String s)
    {
        set("whitebalance", s);
    }

    public void setZoom(int i)
    {
        set("zoom", i);
    }

    public void unflatten(String s)
    {
        mMap.clear();
        StringTokenizer stringtokenizer = new StringTokenizer(s, ";");
        do
        {
            if (!stringtokenizer.hasMoreElements())
                break;
            String s1 = stringtokenizer.nextToken();
            int i = s1.indexOf('=');
            if (i != -1)
            {
                String s2 = s1.substring(0, i);
                String s3 = s1.substring(i + 1);
                mMap.put(s2, s3);
            }
        } while (true);
    }
}
