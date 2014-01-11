// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.app.ActivityManager;
import android.app.WallpaperManager;
import android.content.*;
import android.graphics.*;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.os.SystemProperties;
import android.os.Trace;
import android.renderscript.Matrix4f;
import android.service.wallpaper.WallpaperService;
import android.util.Log;
import android.view.*;
import com.mediatek.xlog.Xlog;
import java.io.IOException;
import java.nio.*;
import javax.microedition.khronos.egl.*;
import javax.microedition.khronos.opengles.GL;

public class ImageWallpaper extends WallpaperService
{
    class DrawableEngine extends android.service.wallpaper.WallpaperService.Engine
    {

        static final int EGL_CONTEXT_CLIENT_VERSION = 12440;
        static final int EGL_OPENGL_ES2_BIT = 4;
        private static final int FLOAT_SIZE_BYTES = 4;
        private static final int TRIANGLE_VERTICES_DATA_POS_OFFSET = 0;
        private static final int TRIANGLE_VERTICES_DATA_STRIDE_BYTES = 20;
        private static final int TRIANGLE_VERTICES_DATA_UV_OFFSET = 3;
        private static final String sSimpleFS = "precision mediump float;\n\nvarying vec2 outTexCoords;\nuniform sampler2D texture;\n\nvoid main(void) {\n    gl_FragColor = texture2D(texture, outTexCoords);\n}\n\n";
        private static final String sSimpleVS = "attribute vec4 position;\nattribute vec2 texCoords;\nvarying vec2 outTexCoords;\nuniform mat4 projection;\n\nvoid main(void) {\n    outTexCoords = texCoords;\n    gl_Position = projection * position;\n}\n\n";
        Bitmap mBackground;
        private EGL10 mEgl;
        private EGLConfig mEglConfig;
        private EGLContext mEglContext;
        private EGLDisplay mEglDisplay;
        private EGLSurface mEglSurface;
        private GL mGL;
        int mLastRotation;
        int mLastSurfaceHeight;
        int mLastSurfaceWidth;
        int mLastXTranslation;
        int mLastYTranslation;
        private final Object mLock = new Object[0];
        boolean mOffsetsChanged;
        private WallpaperObserver mReceiver;
        boolean mRedrawNeeded;
        boolean mVisible;
        float mXOffset;
        float mYOffset;
        final ImageWallpaper this$0;

        private int buildProgram(String s, String s1)
        {
            int i = buildShader(s, 35633);
            int k;
            if (i == 0)
            {
                k = 0;
            } else
            {
                int j = buildShader(s1, 35632);
                if (j == 0)
                    return 0;
                k = GLES20.glCreateProgram();
                GLES20.glAttachShader(k, i);
                checkGlError();
                GLES20.glAttachShader(k, j);
                checkGlError();
                GLES20.glLinkProgram(k);
                checkGlError();
                int ai[] = new int[1];
                GLES20.glGetProgramiv(k, 35714, ai, 0);
                if (ai[0] != 1)
                {
                    String s2 = GLES20.glGetProgramInfoLog(k);
                    Log.d("ImageWallpaperGL", (new StringBuilder()).append("Error while linking program:\n").append(s2).toString());
                    GLES20.glDeleteShader(i);
                    GLES20.glDeleteShader(j);
                    GLES20.glDeleteProgram(k);
                    return 0;
                }
            }
            return k;
        }

        private int buildShader(String s, int i)
        {
            int j = GLES20.glCreateShader(i);
            GLES20.glShaderSource(j, s);
            checkGlError();
            GLES20.glCompileShader(j);
            checkGlError();
            int ai[] = new int[1];
            GLES20.glGetShaderiv(j, 35713, ai, 0);
            if (ai[0] != 1)
            {
                String s1 = GLES20.glGetShaderInfoLog(j);
                Log.d("ImageWallpaperGL", (new StringBuilder()).append("Error while compiling shader:\n").append(s1).toString());
                GLES20.glDeleteShader(j);
                j = 0;
            }
            return j;
        }

        private void checkEglError()
        {
            int i = mEgl.eglGetError();
            if (i != 12288)
                Log.w("ImageWallpaperGL", (new StringBuilder()).append("EGL error = ").append(GLUtils.getEGLErrorString(i)).toString());
        }

        private void checkGlError()
        {
            int i = GLES20.glGetError();
            if (i != 0)
                Log.w("ImageWallpaperGL", (new StringBuilder()).append("GL error = 0x").append(Integer.toHexString(i)).toString(), new Throwable());
        }

        private EGLConfig chooseEglConfig()
        {
            int ai[] = new int[1];
            EGLConfig aeglconfig[] = new EGLConfig[1];
            int ai1[] = getConfig();
            if (!mEgl.eglChooseConfig(mEglDisplay, ai1, aeglconfig, 1, ai))
                throw new IllegalArgumentException((new StringBuilder()).append("eglChooseConfig failed ").append(GLUtils.getEGLErrorString(mEgl.eglGetError())).toString());
            if (ai[0] > 0)
                return aeglconfig[0];
            else
                return null;
        }

        private FloatBuffer createMesh(int i, int j, float f, float f1)
        {
            float af[] = new float[20];
            af[0] = i;
            af[1] = f1;
            af[2] = 0.0F;
            af[3] = 0.0F;
            af[4] = 1.0F;
            af[5] = f;
            af[6] = f1;
            af[7] = 0.0F;
            af[8] = 1.0F;
            af[9] = 1.0F;
            af[10] = i;
            af[11] = j;
            af[12] = 0.0F;
            af[13] = 0.0F;
            af[14] = 0.0F;
            af[15] = f;
            af[16] = j;
            af[17] = 0.0F;
            af[18] = 1.0F;
            af[19] = 0.0F;
            FloatBuffer floatbuffer = ByteBuffer.allocateDirect(4 * af.length).order(ByteOrder.nativeOrder()).asFloatBuffer();
            floatbuffer.put(af).position(0);
            return floatbuffer;
        }

        private void drawWallpaperWithCanvas(SurfaceHolder surfaceholder, int i, int j, int k, int l)
        {
            Canvas canvas;
            float f;
            float f1;
            canvas = surfaceholder.lockCanvas();
            if (canvas == null)
                break MISSING_BLOCK_LABEL_114;
            f = k;
            f1 = l;
            canvas.translate(f, f1);
            if (i >= 0 && j >= 0)
                break MISSING_BLOCK_LABEL_87;
            canvas.save(2);
            canvas.clipRect(0.0F, 0.0F, mBackground.getWidth(), mBackground.getHeight(), android.graphics.Region.Op.DIFFERENCE);
            canvas.drawColor(0xff000000);
            canvas.restore();
            if (mBackground != null)
                canvas.drawBitmap(mBackground, 0.0F, 0.0F, null);
            surfaceholder.unlockCanvasAndPost(canvas);
            return;
            Exception exception;
            exception;
            surfaceholder.unlockCanvasAndPost(canvas);
            throw exception;
        }

        private boolean drawWallpaperWithOpenGL(SurfaceHolder surfaceholder, int i, int j, int k, int l)
        {
            Trace.traceBegin(2L, "drawWallpaperWithOpenGL");
            Xlog.d("ImageWallpaper", "drawWallpaperWithOpenGL begin");
            if (!initGL(surfaceholder))
                return false;
            float f = k + mBackground.getWidth();
            float f1 = l + mBackground.getHeight();
            Rect rect = surfaceholder.getSurfaceFrame();
            Matrix4f matrix4f = new Matrix4f();
            matrix4f.loadOrtho(0.0F, rect.width(), rect.height(), 0.0F, -1F, 1.0F);
            FloatBuffer floatbuffer = createMesh(k, l, f, f1);
            int i1 = loadTexture(mBackground);
            int j1 = buildProgram("attribute vec4 position;\nattribute vec2 texCoords;\nvarying vec2 outTexCoords;\nuniform mat4 projection;\n\nvoid main(void) {\n    outTexCoords = texCoords;\n    gl_Position = projection * position;\n}\n\n", "precision mediump float;\n\nvarying vec2 outTexCoords;\nuniform sampler2D texture;\n\nvoid main(void) {\n    gl_FragColor = texture2D(texture, outTexCoords);\n}\n\n");
            int k1 = GLES20.glGetAttribLocation(j1, "position");
            int l1 = GLES20.glGetAttribLocation(j1, "texCoords");
            int i2 = GLES20.glGetUniformLocation(j1, "texture");
            int j2 = GLES20.glGetUniformLocation(j1, "projection");
            checkGlError();
            GLES20.glViewport(0, 0, rect.width(), rect.height());
            GLES20.glBindTexture(3553, i1);
            GLES20.glUseProgram(j1);
            GLES20.glEnableVertexAttribArray(k1);
            GLES20.glEnableVertexAttribArray(l1);
            GLES20.glUniform1i(i2, 0);
            GLES20.glUniformMatrix4fv(j2, 1, false, matrix4f.getArray(), 0);
            checkGlError();
            if (i < 0 || j < 0)
            {
                GLES20.glClearColor(0.0F, 0.0F, 0.0F, 0.0F);
                GLES20.glClear(16384);
            }
            floatbuffer.position(0);
            GLES20.glVertexAttribPointer(k1, 3, 5126, false, 20, floatbuffer);
            floatbuffer.position(3);
            GLES20.glVertexAttribPointer(l1, 3, 5126, false, 20, floatbuffer);
            GLES20.glDrawArrays(5, 0, 4);
            if (!mEgl.eglSwapBuffers(mEglDisplay, mEglSurface))
            {
                throw new RuntimeException("Cannot swap buffers");
            } else
            {
                checkEglError();
                finishGL();
                Xlog.d("ImageWallpaper", "drawWallpaperWithOpenGL finishGL");
                Trace.traceEnd(2L);
                return true;
            }
        }

        private void finishGL()
        {
            mEgl.eglMakeCurrent(mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            mEgl.eglDestroySurface(mEglDisplay, mEglSurface);
            mEgl.eglDestroyContext(mEglDisplay, mEglContext);
        }

        private int[] getConfig()
        {
            return (new int[] {
                12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 0, 
                12325, 0, 12326, 0, 12327, 12344, 12344
            });
        }

        private boolean initGL(SurfaceHolder surfaceholder)
        {
            mEgl = (EGL10)EGLContext.getEGL();
            mEglDisplay = mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (mEglDisplay == EGL10.EGL_NO_DISPLAY)
                throw new RuntimeException((new StringBuilder()).append("eglGetDisplay failed ").append(GLUtils.getEGLErrorString(mEgl.eglGetError())).toString());
            int ai[] = new int[2];
            if (!mEgl.eglInitialize(mEglDisplay, ai))
                throw new RuntimeException((new StringBuilder()).append("eglInitialize failed ").append(GLUtils.getEGLErrorString(mEgl.eglGetError())).toString());
            mEglConfig = chooseEglConfig();
            if (mEglConfig == null)
                throw new RuntimeException("eglConfig not initialized");
            mEglContext = createContext(mEgl, mEglDisplay, mEglConfig);
            mEglSurface = mEgl.eglCreateWindowSurface(mEglDisplay, mEglConfig, surfaceholder, null);
            if (mEglSurface != null && mEglSurface != EGL10.EGL_NO_SURFACE)
                if (!mEgl.eglMakeCurrent(mEglDisplay, mEglSurface, mEglSurface, mEglContext))
                {
                    throw new RuntimeException((new StringBuilder()).append("eglMakeCurrent failed ").append(GLUtils.getEGLErrorString(mEgl.eglGetError())).toString());
                } else
                {
                    mGL = mEglContext.getGL();
                    return true;
                }
            int i = mEgl.eglGetError();
            if (i == 12299)
            {
                Log.e("ImageWallpaperGL", "createWindowSurface returned EGL_BAD_NATIVE_WINDOW.");
                return false;
            } else
            {
                throw new RuntimeException((new StringBuilder()).append("createWindowSurface failed ").append(GLUtils.getEGLErrorString(i)).toString());
            }
        }

        private int loadTexture(Bitmap bitmap)
        {
            int ai[] = new int[1];
            GLES20.glActiveTexture(33984);
            GLES20.glGenTextures(1, ai, 0);
            checkGlError();
            int i = ai[0];
            GLES20.glBindTexture(3553, i);
            checkGlError();
            GLES20.glTexParameteri(3553, 10241, 9729);
            GLES20.glTexParameteri(3553, 10240, 9729);
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
            GLUtils.texImage2D(3553, 0, 6408, bitmap, 5121, 0);
            checkGlError();
            return i;
        }

        private void updateWallpaperLocked()
        {
            Object obj = null;
            try
            {
                mWallpaperManager.forgetLoadedWallpaper();
                mBackground = null;
                mBackground = mWallpaperManager.getBitmap();
            }
            catch (RuntimeException runtimeexception)
            {
                obj = runtimeexception;
            }
            catch (OutOfMemoryError outofmemoryerror)
            {
                obj = outofmemoryerror;
            }
            if (obj == null)
                break MISSING_BLOCK_LABEL_61;
            mBackground = null;
            Log.w("ImageWallpaper", "Unable to load wallpaper!", ((Throwable) (obj)));
            mWallpaperManager.clear();
            return;
            IOException ioexception;
            ioexception;
            Log.w("ImageWallpaper", "Unable reset to default wallpaper!", ioexception);
            return;
        }

        EGLContext createContext(EGL10 egl10, EGLDisplay egldisplay, EGLConfig eglconfig)
        {
            int ai[] = {
                12440, 2, 12344
            };
            return egl10.eglCreateContext(egldisplay, eglconfig, EGL10.EGL_NO_CONTEXT, ai);
        }

        void drawFrameLocked()
        {
            SurfaceHolder surfaceholder;
            int l;
            int i1;
            int j1;
            int k1;
label0:
            {
label1:
                {
                    boolean flag = true;
                    surfaceholder = getSurfaceHolder();
                    Rect rect = surfaceholder.getSurfaceFrame();
                    int i = rect.width();
                    int j = rect.height();
                    int k = ((WindowManager)getSystemService("window")).getDefaultDisplay().getRotation();
                    boolean flag1;
                    if (i == mLastSurfaceWidth && j == mLastSurfaceHeight)
                        flag1 = false;
                    else
                        flag1 = flag;
                    if (!flag1 && k == mLastRotation)
                        flag = false;
                    if (!flag && !mOffsetsChanged)
                        break label1;
                    mLastRotation = k;
                    if (mBackground == null || flag1)
                    {
                        updateWallpaperLocked();
                        if (mBackground == null)
                            break label1;
                    }
                    l = i - mBackground.getWidth();
                    i1 = j - mBackground.getHeight();
                    if (l < 0)
                        j1 = (int)(0.5F + (float)l * mXOffset);
                    else
                        j1 = l / 2;
                    if (i1 < 0)
                        k1 = (int)(0.5F + (float)i1 * mYOffset);
                    else
                        k1 = i1 / 2;
                    mOffsetsChanged = false;
                    mRedrawNeeded = false;
                    if (flag1)
                    {
                        mLastSurfaceWidth = i;
                        mLastSurfaceHeight = j;
                    }
                    mLastXTranslation = j1;
                    mLastYTranslation = k1;
                    if (flag || j1 != mLastXTranslation || k1 != mLastYTranslation)
                    {
                        if (!mIsHwAccelerated)
                            break label0;
                        if (!drawWallpaperWithOpenGL(surfaceholder, l, i1, j1, k1))
                        {
                            drawWallpaperWithCanvas(surfaceholder, l, i1, j1, k1);
                            return;
                        }
                    }
                }
                return;
            }
            drawWallpaperWithCanvas(surfaceholder, l, i1, j1, k1);
            mBackground = null;
            mWallpaperManager.forgetLoadedWallpaper();
        }

        public void onCreate(SurfaceHolder surfaceholder)
        {
            super.onCreate(surfaceholder);
            updateSurfaceSize(surfaceholder);
            setOffsetNotificationsEnabled(false);
        }

        public void onDesiredSizeChanged(int i, int j)
        {
            super.onDesiredSizeChanged(i, j);
            SurfaceHolder surfaceholder = getSurfaceHolder();
            if (surfaceholder != null)
                updateSurfaceSize(surfaceholder);
        }

        public void onDestroy()
        {
            super.onDestroy();
            if (mReceiver != null)
                unregisterReceiver(mReceiver);
        }

        public void onOffsetsChanged(float f, float f1, float f2, float f3, int i, int j)
        {
            synchronized (mLock)
            {
                if (mXOffset != f || mYOffset != f1)
                {
                    mXOffset = f;
                    mYOffset = f1;
                    mOffsetsChanged = true;
                }
                drawFrameLocked();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void onSurfaceChanged(SurfaceHolder surfaceholder, int i, int j, int k)
        {
            super.onSurfaceChanged(surfaceholder, i, j, k);
            synchronized (mLock)
            {
                drawFrameLocked();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void onSurfaceCreated(SurfaceHolder surfaceholder)
        {
            super.onSurfaceCreated(surfaceholder);
            mLastSurfaceHeight = -1;
            mLastSurfaceWidth = -1;
        }

        public void onSurfaceDestroyed(SurfaceHolder surfaceholder)
        {
            super.onSurfaceDestroyed(surfaceholder);
            mLastSurfaceHeight = -1;
            mLastSurfaceWidth = -1;
        }

        public void onSurfaceRedrawNeeded(SurfaceHolder surfaceholder)
        {
            super.onSurfaceRedrawNeeded(surfaceholder);
            synchronized (mLock)
            {
                drawFrameLocked();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void onTouchEvent(MotionEvent motionevent)
        {
            super.onTouchEvent(motionevent);
        }

        public void onVisibilityChanged(boolean flag)
        {
            synchronized (mLock)
            {
                if (mVisible != flag)
                {
                    mVisible = flag;
                    drawFrameLocked();
                }
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void trimMemory(int i)
        {
            if (i >= 10 && mBackground != null && mIsHwAccelerated)
            {
                mBackground.recycle();
                mBackground = null;
                mWallpaperManager.forgetLoadedWallpaper();
            }
        }

        void updateSurfaceSize(SurfaceHolder surfaceholder)
        {
            surfaceholder.setFixedSize(getDesiredMinimumWidth(), getDesiredMinimumHeight());
        }


        public DrawableEngine()
        {
            this$0 = ImageWallpaper.this;
            super(ImageWallpaper.this);
            mLastSurfaceWidth = -1;
            mLastSurfaceHeight = -1;
            mLastRotation = -1;
            mVisible = true;
            setFixedSizeAllowed(true);
        }
    }

    class DrawableEngine.WallpaperObserver extends BroadcastReceiver
    {

        final DrawableEngine this$1;

        public void onReceive(Context context, Intent intent)
        {
            synchronized (mLock)
            {
                DrawableEngine drawableengine = DrawableEngine.this;
                mLastSurfaceHeight = -1;
                drawableengine.mLastSurfaceWidth = -1;
                mBackground = null;
                mRedrawNeeded = true;
                drawFrameLocked();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        DrawableEngine.WallpaperObserver()
        {
            this$1 = DrawableEngine.this;
            super();
        }
    }


    private static final boolean DEBUG = false;
    static final boolean FIXED_SIZED_SURFACE = true;
    private static final String GL_LOG_TAG = "ImageWallpaperGL";
    private static final String PROPERTY_KERNEL_QEMU = "ro.kernel.qemu";
    private static final String TAG = "ImageWallpaper";
    static final boolean USE_OPENGL = true;
    DrawableEngine mEngine;
    boolean mIsHwAccelerated;
    WallpaperManager mWallpaperManager;


    private static boolean isEmulator()
    {
        return "1".equals(SystemProperties.get("ro.kernel.qemu", "0"));
    }

    public void onCreate()
    {
        super.onCreate();
        mWallpaperManager = (WallpaperManager)getSystemService("wallpaper");
        if (!isEmulator())
            mIsHwAccelerated = ActivityManager.isHighEndGfx();
    }

    public android.service.wallpaper.WallpaperService.Engine onCreateEngine()
    {
        mEngine = new DrawableEngine();
        return mEngine;
    }

    public void onTrimMemory(int i)
    {
        if (mEngine != null)
            mEngine.trimMemory(i);
    }
}
