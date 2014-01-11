// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.graphics.Camera;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.Transformation;

// Referenced classes of package android.widget:
//            BounceGallery

public class BounceCoverFlow extends BounceGallery
{

    private static final boolean DBG = false;
    private static int DEFAULT_MAX_ROTATION = 0;
    private static float DEFAULT_MAX_ZOOM = 0F;
    private static final String TAG = "BounceCoverFlow";
    private final Camera mCamera;
    private int mMaxRotationAngle;
    private float mMaxZoom;

    public BounceCoverFlow(Context context)
    {
        this(context, null);
    }

    public BounceCoverFlow(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public BounceCoverFlow(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mMaxRotationAngle = DEFAULT_MAX_ROTATION;
        mMaxZoom = DEFAULT_MAX_ZOOM;
        mCamera = new Camera();
        setStaticTransformationsEnabled(true);
    }

    private int getCenterOfCoverflow()
    {
        return (getMeasuredWidth() - super.mPaddingLeft - super.mPaddingRight >> 1) + super.mPaddingLeft;
    }

    private void transformImageBitmap(View view, Transformation transformation, int i)
    {
        mCamera.save();
        Matrix matrix = transformation.getMatrix();
        int j = view.getHeight();
        int k = view.getWidth();
        float f = (float)i * Math.abs(mMaxZoom / (float)mMaxRotationAngle);
        mCamera.translate(0.0F, 0.0F, f);
        mCamera.getMatrix(matrix);
        matrix.preTranslate(-(k / 2), -(j / 2));
        matrix.postTranslate(k / 2, j / 2);
        mCamera.restore();
    }

    protected boolean getChildStaticTransformation(View view, Transformation transformation)
    {
        int i = getCenterOfChildWithScroll(view);
        int j = view.getWidth();
        transformation.clear();
        transformation.setTransformationType(Transformation.TYPE_MATRIX);
        if (i == getCenterOfCoverflow())
        {
            transformImageBitmap(view, transformation, 0);
        } else
        {
            int k = (int)Math.abs(((float)(getCenterOfCoverflow() - i) / (float)j) * (float)mMaxRotationAngle);
            if (k > mMaxRotationAngle)
                k = mMaxRotationAngle;
            transformImageBitmap(view, transformation, k);
        }
        return true;
    }

    public void setMaxRotationAngle(int i)
    {
        mMaxRotationAngle = i;
    }

    public void setMaxZoomOut(float f)
    {
        mMaxZoom = f;
    }

    public void setNextSelectedPositionInt(int i)
    {
        super.setNextSelectedPositionInt(i);
    }

    static 
    {
        DEFAULT_MAX_ROTATION = 60;
        DEFAULT_MAX_ZOOM = 400F;
    }
}
