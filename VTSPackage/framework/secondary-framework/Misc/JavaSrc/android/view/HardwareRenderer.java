// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.*;
import android.opengl.GLUtils;
import android.opengl.ManagedEGLContext;
import android.os.*;
import android.util.Log;
import com.google.android.gles_jni.EGLImpl;
import java.io.File;
import java.io.PrintWriter;
import java.util.concurrent.locks.ReentrantLock;
import javax.microedition.khronos.egl.*;
import javax.microedition.khronos.opengles.GL;

// Referenced classes of package android.view:
//            GLES20Canvas, DisplayList, HardwareLayer, View, 
//            HardwareCanvas, Surface, ViewGroup, GLES20DisplayList, 
//            GLES20RenderLayer, GLES20TextureLayer, ViewRootImpl

public abstract class HardwareRenderer
{
    static class Gl20Renderer extends GlRenderer
    {

        private static EGLSurface sPbuffer;
        private static final Object sPbufferLock[] = new Object[0];
        private GLES20Canvas mGlCanvas;

        static HardwareRenderer create(boolean flag)
        {
            if (GLES20Canvas.isAvailable())
                return new Gl20Renderer(flag);
            else
                return null;
        }

        private static void destroyHardwareLayer(View view)
        {
            view.destroyLayer(true);
            if (view instanceof ViewGroup)
            {
                ViewGroup viewgroup = (ViewGroup)view;
                int i = viewgroup.getChildCount();
                for (int j = 0; j < i; j++)
                    destroyHardwareLayer(viewgroup.getChildAt(j));

            }
        }

        private static void destroyResources(View view)
        {
            view.destroyHardwareResources();
            if (view instanceof ViewGroup)
            {
                ViewGroup viewgroup = (ViewGroup)view;
                int i = viewgroup.getChildCount();
                for (int j = 0; j < i; j++)
                    destroyResources(viewgroup.getChildAt(j));

            }
        }

        static void endTrimMemory()
        {
            if (sEgl != null && sEglDisplay != null)
                sEgl.eglMakeCurrent(sEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        }

        static void startTrimMemory(int i)
        {
            if (sEgl != null && sEglConfig != null)
            {
                Gl20RendererEglContext gl20renderereglcontext = (Gl20RendererEglContext)sEglContextStorage.get();
                if (gl20renderereglcontext != null)
                {
                    usePbufferSurface(gl20renderereglcontext.getContext());
                    if (i >= 80)
                    {
                        GLES20Canvas.flushCaches(2);
                        return;
                    }
                    if (i >= 20)
                    {
                        GLES20Canvas.flushCaches(1);
                        return;
                    }
                }
            }
        }

        private static void usePbufferSurface(EGLContext eglcontext)
        {
            synchronized (sPbufferLock)
            {
                if (sPbuffer == null)
                    sPbuffer = sEgl.eglCreatePbufferSurface(sEglDisplay, sEglConfig, new int[] {
                        12375, 1, 12374, 1, 12344
                    });
            }
            sEgl.eglMakeCurrent(sEglDisplay, sPbuffer, sPbuffer, eglcontext);
            return;
            exception;
            aobj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        boolean canDraw()
        {
            return super.canDraw() && mGlCanvas != null;
        }

        HardwareCanvas createCanvas()
        {
            GLES20Canvas gles20canvas = new GLES20Canvas(super.mTranslucent);
            mGlCanvas = gles20canvas;
            return gles20canvas;
        }

        public DisplayList createDisplayList(String s)
        {
            return new GLES20DisplayList(s);
        }

        HardwareLayer createHardwareLayer(int i, int j, boolean flag)
        {
            return new GLES20RenderLayer(i, j, flag);
        }

        HardwareLayer createHardwareLayer(boolean flag)
        {
            return new GLES20TextureLayer(flag);
        }

        ManagedEGLContext createManagedContext(EGLContext eglcontext)
        {
            return new Gl20RendererEglContext(super.mEglContext);
        }

        SurfaceTexture createSurfaceTexture(HardwareLayer hardwarelayer)
        {
            return ((GLES20TextureLayer)hardwarelayer).getSurfaceTexture();
        }

        void destroy(boolean flag)
        {
            super.destroy(flag);
            if (flag && mGlCanvas != null)
                mGlCanvas = null;
            return;
            Exception exception;
            exception;
            if (flag && mGlCanvas != null)
                mGlCanvas = null;
            throw exception;
        }

        void destroyHardwareResources(View view)
        {
            if (view != null)
                safelyRun(view. new Runnable() {

                    final Gl20Renderer this$0;
                    final View val$view;

                    public void run()
                    {
                        if (mCanvas != null)
                            mCanvas.clearLayerUpdates();
                        Gl20Renderer.destroyResources(view);
                        GLES20Canvas.flushCaches(0);
                    }

            
            {
                this$0 = final_gl20renderer;
                view = View.this;
                super();
            }
                }
);
        }

        void destroyLayers(View view)
        {
            if (view != null)
                safelyRun(view. new Runnable() {

                    final Gl20Renderer this$0;
                    final View val$view;

                    public void run()
                    {
                        if (mCanvas != null)
                            mCanvas.clearLayerUpdates();
                        Gl20Renderer.destroyHardwareLayer(view);
                        GLES20Canvas.flushCaches(0);
                    }

            
            {
                this$0 = final_gl20renderer;
                view = View.this;
                super();
            }
                }
);
        }

        int[] getConfig(boolean flag)
        {
            int ai[] = new int[19];
            ai[0] = 12352;
            ai[1] = 4;
            ai[2] = 12324;
            ai[3] = 8;
            ai[4] = 12323;
            ai[5] = 8;
            ai[6] = 12322;
            ai[7] = 8;
            ai[8] = 12321;
            ai[9] = 8;
            ai[10] = 12325;
            ai[11] = 0;
            ai[12] = 12327;
            ai[13] = 12344;
            ai[14] = 12326;
            int i;
            if (super.mShowOverdraw)
                i = GLES20Canvas.getStencilSize();
            else
                i = 0;
            ai[15] = i;
            ai[16] = 12339;
            char c = '\0';
            if (flag)
                c = '\u0400';
            ai[17] = c | 4;
            ai[18] = 12344;
            return ai;
        }

        void initCaches()
        {
            GLES20Canvas.initCaches();
        }

        void onPostDraw()
        {
            mGlCanvas.onPostDraw();
        }

        int onPreDraw(Rect rect)
        {
            return mGlCanvas.onPreDraw(rect);
        }

        void pushLayerUpdate(HardwareLayer hardwarelayer)
        {
            mGlCanvas.pushLayerUpdate(hardwarelayer);
        }

        boolean safelyRun(Runnable runnable)
        {
            boolean flag;
            flag = true;
            if (isEnabled() && checkCurrent() != 0)
                flag = false;
            if (flag)
            {
                Gl20RendererEglContext gl20renderereglcontext = (Gl20RendererEglContext)sEglContextStorage.get();
                if (gl20renderereglcontext == null)
                    return false;
                usePbufferSurface(gl20renderereglcontext.getContext());
            }
            runnable.run();
            if (flag)
                sEgl.eglMakeCurrent(sEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            return true;
            Exception exception;
            exception;
            if (flag)
                sEgl.eglMakeCurrent(sEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            throw exception;
        }

        void setSurfaceTexture(HardwareLayer hardwarelayer, SurfaceTexture surfacetexture)
        {
            ((GLES20TextureLayer)hardwarelayer).setSurfaceTexture(surfacetexture);
        }

        void setup(int i, int j)
        {
            super.setup(i, j);
            if (super.mVsyncDisabled)
                disableVsync();
        }





/*
        static EGLSurface access$402(EGLSurface eglsurface)
        {
            sPbuffer = eglsurface;
            return eglsurface;
        }

*/



        Gl20Renderer(boolean flag)
        {
            super(2, flag);
        }
    }

    static class Gl20Renderer.Gl20RendererEglContext extends ManagedEGLContext
    {

        final Handler mHandler = new Handler();

        public void onTerminate(EGLContext eglcontext)
        {
            if (mHandler.getLooper() != Looper.myLooper())
            {
                mHandler.post(eglcontext. new Runnable() {

                    final Gl20Renderer.Gl20RendererEglContext this$0;
                    final EGLContext val$eglContext;

                    public void run()
                    {
                        onTerminate(eglContext);
                    }

            
            {
                this$0 = final_gl20renderereglcontext;
                eglContext = EGLContext.this;
                super();
            }
                }
);
                return;
            }
            synchronized (GlRenderer.sEglLock)
            {
                if (GlRenderer.sEgl != null)
                    break MISSING_BLOCK_LABEL_51;
            }
            return;
            exception;
            aobj;
            JVM INSTR monitorexit ;
            throw exception;
            if (EGLImpl.getInitCount(GlRenderer.sEglDisplay) == 1)
            {
                Gl20Renderer.usePbufferSurface(eglcontext);
                GLES20Canvas.terminateCaches();
                GlRenderer.sEgl.eglDestroyContext(GlRenderer.sEglDisplay, eglcontext);
                GlRenderer.sEglContextStorage.set(null);
                GlRenderer.sEglContextStorage.remove();
                GlRenderer.sEgl.eglDestroySurface(GlRenderer.sEglDisplay, Gl20Renderer.sPbuffer);
                GlRenderer.sEgl.eglMakeCurrent(GlRenderer.sEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                GlRenderer.sEgl.eglReleaseThread();
                GlRenderer.sEgl.eglTerminate(GlRenderer.sEglDisplay);
                GlRenderer.sEgl = null;
                GlRenderer.sEglDisplay = null;
                GlRenderer.sEglConfig = null;
                Gl20Renderer.sPbuffer = null;
            }
            aobj;
            JVM INSTR monitorexit ;
        }

        public Gl20Renderer.Gl20RendererEglContext(EGLContext eglcontext)
        {
            super(eglcontext);
        }
    }

    static abstract class GlRenderer extends HardwareRenderer
    {

        static final int FUNCTOR_PROCESS_DELAY = 4;
        static final int SURFACE_STATE_ERROR = 0;
        static final int SURFACE_STATE_SUCCESS = 1;
        static final int SURFACE_STATE_UPDATED = 2;
        static boolean sDirtyRegions;
        static final boolean sDirtyRegionsRequested;
        static EGL10 sEgl;
        static EGLConfig sEglConfig;
        static final ThreadLocal sEglContextStorage = new ThreadLocal();
        static EGLDisplay sEglDisplay;
        static final Object sEglLock[] = new Object[0];
        HardwareCanvas mCanvas;
        final boolean mDebugDirtyRegions = "true".equalsIgnoreCase(SystemProperties.get("debug.hwui.show_dirty_regions", "false"));
        Paint mDebugPaint;
        private boolean mDestroyed;
        boolean mDirtyRegionsEnabled;
        EGLContext mEglContext;
        EGLSurface mEglSurface;
        Thread mEglThread;
        long mFrameCount;
        private final FunctorsRunnable mFunctorsRunnable = new FunctorsRunnable();
        GL mGl;
        final int mGlVersion;
        int mHeight;
        int mProfileCurrentFrame;
        final float mProfileData[];
        final boolean mProfileEnabled = "true".equalsIgnoreCase(SystemProperties.get("debug.hwui.profile", "false"));
        final ReentrantLock mProfileLock;
        private final Rect mRedrawClip = new Rect();
        final boolean mShowOverdraw = SystemProperties.getBoolean("debug.hwui.show_overdraw", false);
        private final int mSurfaceSize[] = new int[2];
        final boolean mTranslucent;
        boolean mUpdateDirtyRegions;
        final boolean mVsyncDisabled = "true".equalsIgnoreCase(SystemProperties.get("debug.hwui.disable_vsync", "false"));
        int mWidth;

        private void checkEglErrorsForced()
        {
            int i = sEgl.eglGetError();
            if (i != 12288)
            {
                Log.w("HardwareRenderer", (new StringBuilder()).append("EGL error: ").append(GLUtils.getEGLErrorString(i)).toString());
                boolean flag;
                if (i != 12302)
                    flag = true;
                else
                    flag = false;
                fallback(flag);
            }
        }

        private EGLConfig chooseEglConfig()
        {
            EGLConfig aeglconfig[] = new EGLConfig[1];
            int ai[] = new int[1];
            int ai1[] = getConfig(sDirtyRegions);
            String s = SystemProperties.get("debug.hwui.print_config", "");
            if ("all".equalsIgnoreCase(s))
            {
                sEgl.eglChooseConfig(sEglDisplay, ai1, null, 0, ai);
                EGLConfig aeglconfig1[] = new EGLConfig[ai[0]];
                sEgl.eglChooseConfig(sEglDisplay, ai1, aeglconfig1, ai[0], ai);
                int i = aeglconfig1.length;
                for (int j = 0; j < i; j++)
                    printConfig(aeglconfig1[j]);

            }
            if (!sEgl.eglChooseConfig(sEglDisplay, ai1, aeglconfig, 1, ai))
                throw new IllegalArgumentException((new StringBuilder()).append("eglChooseConfig failed ").append(GLUtils.getEGLErrorString(sEgl.eglGetError())).toString());
            if (ai[0] > 0)
            {
                if ("choice".equalsIgnoreCase(s))
                    printConfig(aeglconfig[0]);
                return aeglconfig[0];
            } else
            {
                return null;
            }
        }

        private boolean createSurface(Surface surface)
        {
            mEglSurface = sEgl.eglCreateWindowSurface(sEglDisplay, sEglConfig, surface, null);
            if (mEglSurface != null && mEglSurface != EGL10.EGL_NO_SURFACE)
                if (!sEgl.eglMakeCurrent(sEglDisplay, mEglSurface, mEglSurface, mEglContext))
                {
                    throw new IllegalStateException((new StringBuilder()).append("eglMakeCurrent failed ").append(GLUtils.getEGLErrorString(sEgl.eglGetError())).toString());
                } else
                {
                    enableDirtyRegions();
                    return true;
                }
            int i = sEgl.eglGetError();
            if (i == 12299)
            {
                Log.e("HardwareRenderer", "createWindowSurface returned EGL_BAD_NATIVE_WINDOW.");
                return false;
            } else
            {
                throw new RuntimeException((new StringBuilder()).append("createWindowSurface failed ").append(GLUtils.getEGLErrorString(i)).toString());
            }
        }

        private void enableDirtyRegions()
        {
            if (sDirtyRegions)
            {
                boolean flag = preserveBackBuffer();
                mDirtyRegionsEnabled = flag;
                if (!flag)
                    Log.w("HardwareRenderer", "Backbuffer cannot be preserved");
            } else
            if (sDirtyRegionsRequested)
            {
                mDirtyRegionsEnabled = isBackBufferPreserved();
                return;
            }
        }

        private void fallback(boolean flag)
        {
            destroy(true);
            if (flag)
            {
                setRequested(false);
                Log.w("HardwareRenderer", "Mountain View, we've had a problem here. Switching back to software rendering.");
            }
        }

        private void handleFunctorStatus(View.AttachInfo attachinfo, int i)
        {
            if ((i & 1) != 0)
                if (mRedrawClip.isEmpty())
                {
                    attachinfo.mViewRootImpl.invalidate();
                } else
                {
                    attachinfo.mViewRootImpl.invalidateChildInParent(null, mRedrawClip);
                    mRedrawClip.setEmpty();
                }
            if ((i & 2) != 0 || attachinfo.mHandler.hasCallbacks(mFunctorsRunnable))
            {
                attachinfo.mHandler.removeCallbacks(mFunctorsRunnable);
                mFunctorsRunnable.attachInfo = attachinfo;
                attachinfo.mHandler.postDelayed(mFunctorsRunnable, 4L);
            }
        }

        private static void printConfig(EGLConfig eglconfig)
        {
            int ai[] = new int[1];
            Log.d("HardwareRenderer", (new StringBuilder()).append("EGL configuration ").append(eglconfig).append(":").toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12324, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  RED_SIZE = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12323, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  GREEN_SIZE = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12322, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  BLUE_SIZE = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12321, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  ALPHA_SIZE = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12325, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  DEPTH_SIZE = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12326, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  STENCIL_SIZE = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12338, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  SAMPLE_BUFFERS = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12337, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  SAMPLES = ").append(ai[0]).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12339, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  SURFACE_TYPE = 0x").append(Integer.toHexString(ai[0])).toString());
            sEgl.eglGetConfigAttrib(sEglDisplay, eglconfig, 12327, ai);
            Log.d("HardwareRenderer", (new StringBuilder()).append("  CONFIG_CAVEAT = 0x").append(Integer.toHexString(ai[0])).toString());
        }

        boolean attachFunctor(View.AttachInfo attachinfo, int i)
        {
            if (mCanvas != null)
            {
                mCanvas.attachFunctor(i);
                mFunctorsRunnable.attachInfo = attachinfo;
                attachinfo.mHandler.removeCallbacks(mFunctorsRunnable);
                attachinfo.mHandler.postDelayed(mFunctorsRunnable, 0L);
                return true;
            } else
            {
                return false;
            }
        }

        boolean canDraw()
        {
            return mGl != null && mCanvas != null;
        }

        int checkCurrent()
        {
label0:
            {
                boolean flag = true;
                if (mEglThread != Thread.currentThread())
                    throw new IllegalStateException((new StringBuilder()).append("Hardware acceleration can only be used with a single UI thread.\nOriginal thread: ").append(mEglThread).append("\n").append("Current thread: ").append(Thread.currentThread()).toString());
                if (!mEglContext.equals(sEgl.eglGetCurrentContext()) || !mEglSurface.equals(sEgl.eglGetCurrentSurface(12377)))
                {
                    if (sEgl.eglMakeCurrent(sEglDisplay, mEglSurface, mEglSurface, mEglContext))
                        break label0;
                    Log.e("HardwareRenderer", (new StringBuilder()).append("eglMakeCurrent failed ").append(GLUtils.getEGLErrorString(sEgl.eglGetError())).toString());
                    fallback(flag);
                    flag = false;
                }
                return ((flag) ? 1 : 0);
            }
            if (mUpdateDirtyRegions)
            {
                enableDirtyRegions();
                mUpdateDirtyRegions = false;
            }
            return 2;
        }

        void checkEglErrors()
        {
            if (isEnabled())
                checkEglErrorsForced();
        }

        abstract HardwareCanvas createCanvas();

        EGLContext createContext(EGL10 egl10, EGLDisplay egldisplay, EGLConfig eglconfig)
        {
            int ai[] = new int[3];
            ai[0] = 12440;
            ai[1] = mGlVersion;
            ai[2] = 12344;
            EGLContext eglcontext = EGL10.EGL_NO_CONTEXT;
            if (mGlVersion == 0)
                ai = null;
            EGLContext eglcontext1 = egl10.eglCreateContext(egldisplay, eglconfig, eglcontext, ai);
            if (eglcontext1 != null && eglcontext1 != EGL10.EGL_NO_CONTEXT)
                return eglcontext1;
            else
                throw new IllegalStateException((new StringBuilder()).append("Could not create an EGL context. eglCreateContext failed with error: ").append(GLUtils.getEGLErrorString(sEgl.eglGetError())).toString());
        }

        GL createEglSurface(Surface surface)
            throws Surface.OutOfResourcesException
        {
            if (sEgl == null)
                throw new RuntimeException("egl not initialized");
            if (sEglDisplay == null)
                throw new RuntimeException("eglDisplay not initialized");
            if (sEglConfig == null)
                throw new RuntimeException("eglConfig not initialized");
            if (Thread.currentThread() != mEglThread)
                throw new IllegalStateException("HardwareRenderer cannot be used from multiple threads");
            destroySurface();
            if (!createSurface(surface))
            {
                return null;
            } else
            {
                initCaches();
                return mEglContext.getGL();
            }
        }

        abstract ManagedEGLContext createManagedContext(EGLContext eglcontext);

        void destroy(boolean flag)
        {
            if (flag && mCanvas != null)
                mCanvas = null;
            if (isEnabled() && !mDestroyed)
            {
                destroySurface();
                setEnabled(false);
                mDestroyed = true;
                mGl = null;
                return;
            } else
            {
                setEnabled(false);
                return;
            }
        }

        void destroySurface()
        {
            if (mEglSurface != null && mEglSurface != EGL10.EGL_NO_SURFACE)
            {
                sEgl.eglMakeCurrent(sEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                sEgl.eglDestroySurface(sEglDisplay, mEglSurface);
                mEglSurface = null;
            }
        }

        void detachFunctor(int i)
        {
            if (mCanvas != null)
                mCanvas.detachFunctor(i);
        }

        boolean draw(View view, View.AttachInfo attachinfo, HardwareDrawCallbacks hardwaredrawcallbacks, Rect rect)
        {
            if (!canDraw()) goto _L2; else goto _L1
_L1:
            int i;
            if (!hasDirtyRegions())
                rect = null;
            attachinfo.mIgnoreDirtyState = true;
            attachinfo.mDrawingTime = SystemClock.uptimeMillis();
            view.mPrivateFlags = 0x20 | view.mPrivateFlags;
            i = checkCurrent();
            if (i == 0) goto _L2; else goto _L3
_L3:
            HardwareCanvas hardwarecanvas;
            hardwarecanvas = mCanvas;
            attachinfo.mHardwareCanvas = hardwarecanvas;
            if (mProfileEnabled)
                mProfileLock.lock();
            if (i != 2) goto _L5; else goto _L4
_L4:
            rect = null;
            HardwareRenderer.beginFrame(null);
_L10:
            int j = 0;
            boolean flag;
            long l;
            DisplayList displaylist;
            int k;
            int i1;
            long l2;
            int j1;
            if ((0x80000000 & view.mPrivateFlags) == 0x80000000)
                flag = true;
            else
                flag = false;
            view.mRecreateDisplayList = flag;
            view.mPrivateFlags = 0x7fffffff & view.mPrivateFlags;
            l = 0L;
            if (mProfileEnabled)
            {
                mProfileCurrentFrame = 3 + mProfileCurrentFrame;
                if (mProfileCurrentFrame >= mProfileData.length)
                    mProfileCurrentFrame = 0;
                l = System.nanoTime();
            }
            hardwarecanvas.clearLayerUpdates();
            Trace.traceBegin(8L, "getDisplayList");
            displaylist = view.getDisplayList();
            Trace.traceEnd(8L);
            Trace.traceBegin(8L, "prepareFrame");
            k = onPreDraw(rect);
            i1 = k;
            Trace.traceEnd(8L);
            j = hardwarecanvas.save();
            hardwaredrawcallbacks.onHardwarePreDraw(hardwarecanvas);
            if (mProfileEnabled)
            {
                float f2 = 1E-006F * (float)(System.nanoTime() - l);
                mProfileData[mProfileCurrentFrame] = f2;
            }
            if (displaylist == null) goto _L7; else goto _L6
_L6:
            l2 = 0L;
            if (mProfileEnabled)
                l2 = System.nanoTime();
            Trace.traceBegin(8L, "drawDisplayList");
            j1 = hardwarecanvas.drawDisplayList(displaylist, mRedrawClip, 1);
            i1 |= j1;
            Trace.traceEnd(8L);
            if (mProfileEnabled)
            {
                float f1 = 1E-006F * (float)(System.nanoTime() - l2);
                mProfileData[1 + mProfileCurrentFrame] = f1;
            }
            handleFunctorStatus(attachinfo, i1);
_L8:
            hardwaredrawcallbacks.onHardwarePostDraw(hardwarecanvas);
            hardwarecanvas.restoreToCount(j);
            view.mRecreateDisplayList = false;
            mFrameCount = 1L + mFrameCount;
            if (mDebugDirtyRegions)
            {
                if (mDebugPaint == null)
                {
                    mDebugPaint = new Paint();
                    mDebugPaint.setColor(0x7fff0000);
                }
                if (rect != null && (1L & mFrameCount) == 0L)
                {
                    Paint paint1 = mDebugPaint;
                    hardwarecanvas.drawRect(rect, paint1);
                }
            }
            onPostDraw();
            attachinfo.mIgnoreDirtyState = false;
            if ((i1 & 4) == 4)
            {
                long l1 = 0L;
                if (mProfileEnabled)
                    l1 = System.nanoTime();
                sEgl.eglSwapBuffers(sEglDisplay, mEglSurface);
                if (mProfileEnabled)
                {
                    float f = 1E-006F * (float)(System.nanoTime() - l1);
                    mProfileData[2 + mProfileCurrentFrame] = f;
                }
                checkEglErrors();
            }
            if (mProfileEnabled)
                mProfileLock.unlock();
            int ai[];
            Exception exception;
            Paint paint;
            Exception exception1;
            Exception exception2;
            Exception exception3;
            return rect == null;
_L5:
            ai = mSurfaceSize;
            HardwareRenderer.beginFrame(ai);
            if (ai[1] != mHeight || ai[0] != mWidth)
            {
                mWidth = ai[0];
                mHeight = ai[1];
                hardwarecanvas.setViewport(mWidth, mHeight);
                rect = null;
            }
            continue; /* Loop/switch isn't completed */
            exception1;
            Trace.traceEnd(8L);
            throw exception1;
            exception;
            hardwaredrawcallbacks.onHardwarePostDraw(hardwarecanvas);
            hardwarecanvas.restoreToCount(j);
            view.mRecreateDisplayList = false;
            mFrameCount = 1L + mFrameCount;
            if (mDebugDirtyRegions)
            {
                if (mDebugPaint == null)
                {
                    mDebugPaint = new Paint();
                    mDebugPaint.setColor(0x7fff0000);
                }
                if (rect != null && (1L & mFrameCount) == 0L)
                {
                    paint = mDebugPaint;
                    hardwarecanvas.drawRect(rect, paint);
                }
            }
            throw exception;
            exception2;
            Trace.traceEnd(8L);
            throw exception2;
            exception3;
            Trace.traceEnd(8L);
            throw exception3;
_L7:
            view.draw(hardwarecanvas);
              goto _L8
_L2:
            return false;
            if (true) goto _L10; else goto _L9
_L9:
        }

        void dumpGfxInfo(PrintWriter printwriter)
        {
            if (!mProfileEnabled) goto _L2; else goto _L1
_L1:
            int i;
            printwriter.printf("\n\tDraw\tProcess\tExecute\n", new Object[0]);
            mProfileLock.lock();
            i = 0;
_L5:
            if (i < mProfileData.length && mProfileData[i] >= 0.0F) goto _L4; else goto _L3
_L3:
            mProfileCurrentFrame = mProfileData.length;
            mProfileLock.unlock();
_L2:
            return;
_L4:
            float af[];
            float af1[];
            Object aobj[] = new Object[3];
            aobj[0] = Float.valueOf(mProfileData[i]);
            aobj[1] = Float.valueOf(mProfileData[i + 1]);
            aobj[2] = Float.valueOf(mProfileData[i + 2]);
            printwriter.printf("\t%3.2f\t%3.2f\t%3.2f\n", aobj);
            af = mProfileData;
            af1 = mProfileData;
            int j = i + 1;
            mProfileData[i + 2] = -1F;
            af1[j] = -1F;
            af[i] = -1F;
            i += 3;
              goto _L5
            Exception exception;
            exception;
            mProfileLock.unlock();
            throw exception;
        }

        HardwareCanvas getCanvas()
        {
            return mCanvas;
        }

        abstract int[] getConfig(boolean flag);

        long getFrameCount()
        {
            return mFrameCount;
        }

        int getHeight()
        {
            return mHeight;
        }

        int getWidth()
        {
            return mWidth;
        }

        boolean hasDirtyRegions()
        {
            return mDirtyRegionsEnabled;
        }

        abstract void initCaches();

        boolean initialize(Surface surface)
            throws Surface.OutOfResourcesException
        {
            if (isRequested() && !isEnabled())
            {
                initializeEgl();
                mGl = createEglSurface(surface);
                mDestroyed = false;
                if (mGl != null)
                {
                    if (sEgl.eglGetError() != 12288)
                    {
                        destroy(true);
                        setRequested(false);
                    } else
                    {
                        if (mCanvas == null)
                            mCanvas = createCanvas();
                        if (mCanvas != null)
                            setEnabled(true);
                        else
                            Log.w("HardwareRenderer", "Hardware accelerated Canvas could not be created");
                    }
                    return mCanvas != null;
                }
            }
            return false;
        }

        void initializeEgl()
        {
            Object aobj[] = sEglLock;
            aobj;
            JVM INSTR monitorenter ;
            if (sEgl != null || sEglConfig != null)
                break MISSING_BLOCK_LABEL_214;
            sEgl = (EGL10)EGLContext.getEGL();
            sEglDisplay = sEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (sEglDisplay == EGL10.EGL_NO_DISPLAY)
                throw new RuntimeException((new StringBuilder()).append("eglGetDisplay failed ").append(GLUtils.getEGLErrorString(sEgl.eglGetError())).toString());
            break MISSING_BLOCK_LABEL_93;
            Exception exception;
            exception;
            aobj;
            JVM INSTR monitorexit ;
            throw exception;
            int ai[] = new int[2];
            if (!sEgl.eglInitialize(sEglDisplay, ai))
                throw new RuntimeException((new StringBuilder()).append("eglInitialize failed ").append(GLUtils.getEGLErrorString(sEgl.eglGetError())).toString());
            checkEglErrorsForced();
            sEglConfig = chooseEglConfig();
            if (sEglConfig == null)
                if (sDirtyRegions)
                {
                    sDirtyRegions = false;
                    sEglConfig = chooseEglConfig();
                    if (sEglConfig == null)
                        throw new RuntimeException("eglConfig not initialized");
                } else
                {
                    throw new RuntimeException("eglConfig not initialized");
                }
            aobj;
            JVM INSTR monitorexit ;
            ManagedEGLContext managedeglcontext = (ManagedEGLContext)sEglContextStorage.get();
            EGLContext eglcontext;
            if (managedeglcontext != null)
                eglcontext = managedeglcontext.getContext();
            else
                eglcontext = null;
            mEglContext = eglcontext;
            mEglThread = Thread.currentThread();
            if (mEglContext == null)
            {
                mEglContext = createContext(sEgl, sEglDisplay, sEglConfig);
                sEglContextStorage.set(createManagedContext(mEglContext));
            }
            return;
        }

        void invalidate(Surface surface)
        {
            sEgl.eglMakeCurrent(sEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            if (mEglSurface != null && mEglSurface != EGL10.EGL_NO_SURFACE)
            {
                sEgl.eglDestroySurface(sEglDisplay, mEglSurface);
                mEglSurface = null;
                setEnabled(false);
            }
            if (surface.isValid() && createSurface(surface))
            {
                mUpdateDirtyRegions = true;
                if (mCanvas != null)
                {
                    setEnabled(true);
                    return;
                }
            }
        }

        void onPostDraw()
        {
        }

        int onPreDraw(Rect rect)
        {
            return 0;
        }

        void setup(int i, int j)
        {
            if (validate())
            {
                mCanvas.setViewport(i, j);
                mWidth = i;
                mHeight = j;
            }
        }

        void updateSurface(Surface surface)
            throws Surface.OutOfResourcesException
        {
            if (isRequested() && isEnabled())
                createEglSurface(surface);
        }

        boolean validate()
        {
            return checkCurrent() != 0;
        }

        static 
        {
            sDirtyRegions = "true".equalsIgnoreCase(SystemProperties.get("debug.hwui.render_dirty_regions", "true"));
            sDirtyRegionsRequested = sDirtyRegions;
        }



        GlRenderer(int i, boolean flag)
        {
            mWidth = -1;
            mHeight = -1;
            mProfileCurrentFrame = -3;
            mGlVersion = i;
            mTranslucent = flag;
            if (mVsyncDisabled)
                Log.d("HardwareRenderer", "Disabling v-sync");
            if (mProfileEnabled)
                Log.d("HardwareRenderer", "Profiling hardware renderer");
            if (mProfileEnabled)
            {
                mProfileData = new float[3 * Integer.valueOf(SystemProperties.get("debug.hwui.profile.maxframes", Integer.toString(128))).intValue()];
                for (int j = 0; j < mProfileData.length; j += 3)
                {
                    float af[] = mProfileData;
                    float af1[] = mProfileData;
                    int k = j + 1;
                    mProfileData[j + 2] = -1F;
                    af1[k] = -1F;
                    af[j] = -1F;
                }

                mProfileLock = new ReentrantLock();
            } else
            {
                mProfileData = null;
                mProfileLock = null;
            }
            if (mDebugDirtyRegions)
                Log.d("HardwareRenderer", "Debugging dirty regions");
        }
    }

    class GlRenderer.FunctorsRunnable
        implements Runnable
    {

        View.AttachInfo attachInfo;
        final GlRenderer this$0;

        public void run()
        {
            HardwareRenderer hardwarerenderer = attachInfo.mHardwareRenderer;
            if (hardwarerenderer != null && hardwarerenderer.isEnabled() && hardwarerenderer == GlRenderer.this && checkCurrent() != 0)
            {
                int i = mCanvas.invokeFunctors(mRedrawClip);
                handleFunctorStatus(attachInfo, i);
                return;
            } else
            {
                return;
            }
        }

        GlRenderer.FunctorsRunnable()
        {
            this$0 = GlRenderer.this;
            super();
        }
    }

    static interface HardwareDrawCallbacks
    {

        public abstract void onHardwarePostDraw(HardwareCanvas hardwarecanvas);

        public abstract void onHardwarePreDraw(HardwareCanvas hardwarecanvas);
    }


    private static final String CACHE_PATH_SHADERS = "com.android.opengl.shaders_cache";
    static final boolean DBG = false;
    public static final String DEBUG_DIRTY_REGIONS_PROPERTY = "debug.hwui.show_dirty_regions";
    public static final String DEBUG_SHOW_LAYERS_UPDATES_PROPERTY = "debug.hwui.show_layers_updates";
    public static final String DEBUG_SHOW_OVERDRAW_PROPERTY = "debug.hwui.show_overdraw";
    static final String DISABLE_VSYNC_PROPERTY = "debug.hwui.disable_vsync";
    static final String LOG_TAG = "HardwareRenderer";
    static final String PRINT_CONFIG_PROPERTY = "debug.hwui.print_config";
    private static final int PROFILE_FRAME_DATA_COUNT = 3;
    static final String PROFILE_MAXFRAMES_PROPERTY = "debug.hwui.profile.maxframes";
    private static final int PROFILE_MAX_FRAMES = 128;
    public static final String PROFILE_PROPERTY = "debug.hwui.profile";
    public static final boolean RENDER_DIRTY_REGIONS = true;
    static final String RENDER_DIRTY_REGIONS_PROPERTY = "debug.hwui.render_dirty_regions";
    public static boolean sRendererDisabled = false;
    public static boolean sSystemRendererDisabled = false;
    private boolean mEnabled;
    private boolean mForceDestroyLayers;
    private boolean mRequested;

    public HardwareRenderer()
    {
        mRequested = true;
    }

    private static void beginFrame(int ai[])
    {
        nBeginFrame(ai);
    }

    static HardwareRenderer createGlRenderer(int i, boolean flag)
    {
        switch (i)
        {
        case 2: // '\002'
            return Gl20Renderer.create(flag);
        }
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown GL version: ").append(i).toString());
    }

    public static void disable(boolean flag)
    {
        sRendererDisabled = true;
        if (flag)
            sSystemRendererDisabled = true;
    }

    static void disableVsync()
    {
        nDisableVsync();
    }

    static void endTrimMemory()
    {
        Gl20Renderer.endTrimMemory();
    }

    public static boolean isAvailable()
    {
        return GLES20Canvas.isAvailable();
    }

    static boolean isBackBufferPreserved()
    {
        return nIsBackBufferPreserved();
    }

    private static native void nBeginFrame(int ai[]);

    private static native void nDisableVsync();

    private static native boolean nIsBackBufferPreserved();

    private static native boolean nPreserveBackBuffer();

    private static native void nSetHWUIDebugLog(boolean flag);

    private static native void nSetupShadersDiskCache(String s);

    static boolean preserveBackBuffer()
    {
        return nPreserveBackBuffer();
    }

    public static void setHWUIDebugLog(boolean flag)
    {
        nSetHWUIDebugLog(flag);
    }

    public static void setupDiskCache(File file)
    {
        nSetupShadersDiskCache((new File(file, "com.android.opengl.shaders_cache")).getAbsolutePath());
    }

    static void startTrimMemory(int i)
    {
        Gl20Renderer.startTrimMemory(i);
    }

    static void trimMemory(int i)
    {
        startTrimMemory(i);
        endTrimMemory();
    }

    abstract boolean attachFunctor(View.AttachInfo attachinfo, int i);

    public abstract DisplayList createDisplayList(String s);

    abstract HardwareLayer createHardwareLayer(int i, int j, boolean flag);

    abstract HardwareLayer createHardwareLayer(boolean flag);

    abstract SurfaceTexture createSurfaceTexture(HardwareLayer hardwarelayer);

    abstract void destroy(boolean flag);

    abstract void destroyHardwareResources(View view);

    abstract void destroyLayers(View view);

    abstract void detachFunctor(int i);

    abstract boolean draw(View view, View.AttachInfo attachinfo, HardwareDrawCallbacks hardwaredrawcallbacks, Rect rect);

    abstract void dumpGfxInfo(PrintWriter printwriter);

    boolean forceDestroyLayers()
    {
        return mForceDestroyLayers;
    }

    abstract HardwareCanvas getCanvas();

    abstract long getFrameCount();

    abstract int getHeight();

    abstract int getWidth();

    abstract boolean initialize(Surface surface)
        throws Surface.OutOfResourcesException;

    boolean initializeIfNeeded(int i, int j, Surface surface)
        throws Surface.OutOfResourcesException
    {
        if (isRequested() && !isEnabled() && initialize(surface))
        {
            setup(i, j);
            return true;
        } else
        {
            return false;
        }
    }

    abstract void invalidate(Surface surface);

    boolean isEnabled()
    {
        return mEnabled;
    }

    boolean isRequested()
    {
        return mRequested;
    }

    abstract void pushLayerUpdate(HardwareLayer hardwarelayer);

    abstract boolean safelyRun(Runnable runnable);

    void setEnabled(boolean flag)
    {
        mEnabled = flag;
    }

    void setForceDestroyLayers(boolean flag)
    {
        mForceDestroyLayers = flag;
    }

    void setRequested(boolean flag)
    {
        mRequested = flag;
    }

    abstract void setSurfaceTexture(HardwareLayer hardwarelayer, SurfaceTexture surfacetexture);

    abstract void setup(int i, int j);

    abstract void updateSurface(Surface surface)
        throws Surface.OutOfResourcesException;

    abstract boolean validate();


}
