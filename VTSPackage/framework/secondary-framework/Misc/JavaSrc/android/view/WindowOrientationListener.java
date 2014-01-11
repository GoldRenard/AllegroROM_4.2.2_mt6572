// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.hardware.*;
import android.os.SystemProperties;
import android.util.*;

public abstract class WindowOrientationListener
{
    static final class SensorEventListenerImpl
        implements SensorEventListener
    {

        private static final float ACCELERATION_TOLERANCE = 4F;
        private static final int ACCELEROMETER_DATA_X = 0;
        private static final int ACCELEROMETER_DATA_Y = 1;
        private static final int ACCELEROMETER_DATA_Z = 2;
        private static final int ADJACENT_ORIENTATION_ANGLE_GAP = 45;
        private static final float FILTER_TIME_CONSTANT_MS = 300F;
        private static final float FLAT_ANGLE = 75F;
        private static final long FLAT_TIME_NANOS = 0x3b9aca00L;
        private static final float MAX_ACCELERATION_MAGNITUDE = 13.80665F;
        private static final long MAX_FILTER_DELTA_TIME_NANOS = 0x3b9aca00L;
        private static final int MAX_TILT = 75;
        private static final float MIN_ACCELERATION_MAGNITUDE = 5.80665F;
        private static final long NANOS_PER_MS = 0xf4240L;
        private static final float NEAR_ZERO_MAGNITUDE = 1F;
        private static final long PROPOSAL_MIN_TIME_SINCE_ACCELERATION_ENDED_NANOS = 0x1dcd6500L;
        private static final long PROPOSAL_MIN_TIME_SINCE_FLAT_ENDED_NANOS = 0x1dcd6500L;
        private static final long PROPOSAL_MIN_TIME_SINCE_SWING_ENDED_NANOS = 0x11e1a300L;
        private static final long PROPOSAL_SETTLE_TIME_NANOS = 0x2625a00L;
        private static final float RADIANS_TO_DEGREES = 57.29578F;
        private static final float SWING_AWAY_ANGLE_DELTA = 20F;
        private static final long SWING_TIME_NANOS = 0x11e1a300L;
        private static final int TILT_HISTORY_SIZE = 40;
        private static final int TILT_TOLERANCE[][] = {
            {
                -25, 70
            }, {
                -25, 65
            }, {
                -25, 60
            }, {
                -25, 65
            }
        };
        private long mAccelerationTimestampNanos;
        private long mFlatTimestampNanos;
        private long mLastFilteredTimestampNanos;
        private float mLastFilteredX;
        private float mLastFilteredY;
        private float mLastFilteredZ;
        private final WindowOrientationListener mOrientationListener;
        private int mPredictedRotation;
        private long mPredictedRotationTimestampNanos;
        private int mProposedRotation;
        private long mSwingTimestampNanos;
        private float mTiltHistory[];
        private int mTiltHistoryIndex;
        private long mTiltHistoryTimestampNanos[];

        private void addTiltHistoryEntry(long l, float f)
        {
            mTiltHistory[mTiltHistoryIndex] = f;
            mTiltHistoryTimestampNanos[mTiltHistoryIndex] = l;
            mTiltHistoryIndex = (1 + mTiltHistoryIndex) % 40;
            mTiltHistoryTimestampNanos[mTiltHistoryIndex] = 0x8000000000000000L;
        }

        private void clearPredictedRotation()
        {
            mPredictedRotation = -1;
            mPredictedRotationTimestampNanos = 0x8000000000000000L;
        }

        private void clearTiltHistory()
        {
            mTiltHistoryTimestampNanos[0] = 0x8000000000000000L;
            mTiltHistoryIndex = 1;
        }

        private boolean isAccelerating(float f)
        {
            return f < 5.80665F || f > 13.80665F;
        }

        private boolean isFlat(long l)
        {
            int i = mTiltHistoryIndex;
            do
            {
                i = nextTiltHistoryIndex(i);
                if (i >= 0 && mTiltHistory[i] >= 75F)
                {
                    if (0x3b9aca00L + mTiltHistoryTimestampNanos[i] <= l)
                        return true;
                } else
                {
                    return false;
                }
            } while (true);
        }

        private boolean isOrientationAngleAcceptable(int i, int j)
        {
label0:
            {
                int i1;
label1:
                {
label2:
                    {
                        int k = mOrientationListener.mCurrentRotation;
                        if (k < 0)
                            break label0;
                        if (i == k || i == (k + 1) % 4)
                        {
                            int l = 22 + (-45 + i * 90);
                            if (i != 0 ? j < l : j >= 315 && j < l + 360)
                                break label2;
                        }
                        if (i != k && i != (k + 3) % 4)
                            break label0;
                        i1 = -22 + (45 + i * 90);
                        if (i != 0)
                            break label1;
                        if (j > 45 || j <= i1)
                            break label0;
                    }
                    return false;
                }
                if (j > i1)
                    return false;
            }
            return true;
        }

        private boolean isPredictedRotationAcceptable(long l)
        {
            return l >= 0x2625a00L + mPredictedRotationTimestampNanos && l >= 0x1dcd6500L + mFlatTimestampNanos && l >= 0x11e1a300L + mSwingTimestampNanos && l >= 0x1dcd6500L + mAccelerationTimestampNanos;
        }

        private boolean isSwinging(long l, float f)
        {
            int i = mTiltHistoryIndex;
            do
            {
                i = nextTiltHistoryIndex(i);
                if (i >= 0 && 0x11e1a300L + mTiltHistoryTimestampNanos[i] >= l)
                {
                    if (20F + mTiltHistory[i] <= f)
                        return true;
                } else
                {
                    return false;
                }
            } while (true);
        }

        private boolean isTiltAngleAcceptable(int i, int j)
        {
            return j >= TILT_TOLERANCE[i][0] && j <= TILT_TOLERANCE[i][1];
        }

        private int nextTiltHistoryIndex(int i)
        {
            if (i == 0)
                i = 40;
            int j = i - 1;
            if (mTiltHistoryTimestampNanos[j] != 0x8000000000000000L)
                return j;
            else
                return -1;
        }

        private static float remainingMS(long l, long l1)
        {
            if (l >= l1)
                return 0.0F;
            else
                return 1E-006F * (float)(l1 - l);
        }

        private void reset()
        {
            mLastFilteredTimestampNanos = 0x8000000000000000L;
            mProposedRotation = -1;
            mFlatTimestampNanos = 0x8000000000000000L;
            mSwingTimestampNanos = 0x8000000000000000L;
            mAccelerationTimestampNanos = 0x8000000000000000L;
            clearPredictedRotation();
            clearTiltHistory();
        }

        private void updatePredictedRotation(long l, int i)
        {
            if (mPredictedRotation != i)
            {
                mPredictedRotation = i;
                mPredictedRotationTimestampNanos = l;
            }
        }

        public int getProposedRotation()
        {
            return mProposedRotation;
        }

        public void onAccuracyChanged(Sensor sensor, int i)
        {
        }

        public void onSensorChanged(SensorEvent sensorevent)
        {
            float f = sensorevent.values[0];
            float f1 = sensorevent.values[1];
            float f2 = sensorevent.values[2];
            if (WindowOrientationListener.LOG)
                Slog.v("WindowOrientationListener", (new StringBuilder()).append("Raw acceleration vector: x=").append(f).append(", y=").append(f1).append(", z=").append(f2).append(", magnitude=").append(FloatMath.sqrt(f * f + f1 * f1 + f2 * f2)).toString());
            long l = sensorevent.timestamp;
            long l1 = mLastFilteredTimestampNanos;
            float f3 = 1E-006F * (float)(l - l1);
            boolean flag;
            if (l >= l1 && l <= 0x3b9aca00L + l1 && (f != 0.0F || f1 != 0.0F || f2 != 0.0F))
            {
                float f5 = f3 / (300F + f3);
                f = f5 * (f - mLastFilteredX) + mLastFilteredX;
                f1 = f5 * (f1 - mLastFilteredY) + mLastFilteredY;
                f2 = f5 * (f2 - mLastFilteredZ) + mLastFilteredZ;
                if (WindowOrientationListener.LOG)
                    Slog.v("WindowOrientationListener", (new StringBuilder()).append("Filtered acceleration vector: x=").append(f).append(", y=").append(f1).append(", z=").append(f2).append(", magnitude=").append(FloatMath.sqrt(f * f + f1 * f1 + f2 * f2)).toString());
                flag = false;
            } else
            {
                if (WindowOrientationListener.LOG)
                    Slog.v("WindowOrientationListener", "Resetting orientation listener.");
                reset();
                flag = true;
            }
            mLastFilteredTimestampNanos = l;
            mLastFilteredX = f;
            mLastFilteredY = f1;
            mLastFilteredZ = f2;
            boolean flag1 = false;
            boolean flag2 = false;
            boolean flag3 = false;
            if (!flag)
            {
                float f4 = FloatMath.sqrt(f * f + f1 * f1 + f2 * f2);
                if (f4 < 1.0F)
                {
                    if (WindowOrientationListener.LOG)
                        Slog.v("WindowOrientationListener", "Ignoring sensor data, magnitude too close to zero.");
                    clearPredictedRotation();
                } else
                {
                    boolean flag4 = isAccelerating(f4);
                    flag1 = false;
                    if (flag4)
                    {
                        flag1 = true;
                        mAccelerationTimestampNanos = l;
                    }
                    int j = (int)Math.round(57.295780181884766D * Math.asin(f2 / f4));
                    addTiltHistoryEntry(l, j);
                    boolean flag5 = isFlat(l);
                    flag2 = false;
                    if (flag5)
                    {
                        flag2 = true;
                        mFlatTimestampNanos = l;
                    }
                    boolean flag6 = isSwinging(l, j);
                    flag3 = false;
                    if (flag6)
                    {
                        flag3 = true;
                        mSwingTimestampNanos = l;
                    }
                    if (Math.abs(j) > 75)
                    {
                        if (WindowOrientationListener.LOG)
                            Slog.v("WindowOrientationListener", (new StringBuilder()).append("Ignoring sensor data, tilt angle too high: tiltAngle=").append(j).toString());
                        clearPredictedRotation();
                    } else
                    {
                        int k = (int)Math.round(57.295780181884766D * -Math.atan2(-f, f1));
                        if (k < 0)
                            k += 360;
                        int i1 = (k + 45) / 90;
                        if (i1 == 4)
                            i1 = 0;
                        if (isTiltAngleAcceptable(i1, j) && isOrientationAngleAcceptable(i1, k))
                        {
                            updatePredictedRotation(l, i1);
                            if (WindowOrientationListener.LOG)
                                Slog.v("WindowOrientationListener", (new StringBuilder()).append("Predicted: tiltAngle=").append(j).append(", orientationAngle=").append(k).append(", predictedRotation=").append(mPredictedRotation).append(", predictedRotationAgeMS=").append(1E-006F * (float)(l - mPredictedRotationTimestampNanos)).toString());
                        } else
                        {
                            if (WindowOrientationListener.LOG)
                                Slog.v("WindowOrientationListener", (new StringBuilder()).append("Ignoring sensor data, no predicted rotation: tiltAngle=").append(j).append(", orientationAngle=").append(k).toString());
                            clearPredictedRotation();
                        }
                    }
                }
            }
            int i = mProposedRotation;
            if (mPredictedRotation < 0 || isPredictedRotationAcceptable(l))
                mProposedRotation = mPredictedRotation;
            if (WindowOrientationListener.LOG)
                Slog.v("WindowOrientationListener", (new StringBuilder()).append("Result: currentRotation=").append(mOrientationListener.mCurrentRotation).append(", proposedRotation=").append(mProposedRotation).append(", predictedRotation=").append(mPredictedRotation).append(", timeDeltaMS=").append(f3).append(", isAccelerating=").append(flag1).append(", isFlat=").append(flag2).append(", isSwinging=").append(flag3).append(", timeUntilSettledMS=").append(remainingMS(l, 0x2625a00L + mPredictedRotationTimestampNanos)).append(", timeUntilAccelerationDelayExpiredMS=").append(remainingMS(l, 0x1dcd6500L + mAccelerationTimestampNanos)).append(", timeUntilFlatDelayExpiredMS=").append(remainingMS(l, 0x1dcd6500L + mFlatTimestampNanos)).append(", timeUntilSwingDelayExpiredMS=").append(remainingMS(l, 0x11e1a300L + mSwingTimestampNanos)).toString());
            if (mProposedRotation != i && mProposedRotation >= 0)
            {
                if (WindowOrientationListener.LOG)
                    Slog.v("WindowOrientationListener", (new StringBuilder()).append("Proposed rotation changed!  proposedRotation=").append(mProposedRotation).append(", oldProposedRotation=").append(i).toString());
                mOrientationListener.onProposedRotationChanged(mProposedRotation);
            }
        }



        public SensorEventListenerImpl(WindowOrientationListener windoworientationlistener)
        {
            mTiltHistory = new float[40];
            mTiltHistoryTimestampNanos = new long[40];
            mOrientationListener = windoworientationlistener;
            reset();
        }
    }


    private static final boolean LOG = SystemProperties.getBoolean("debug.orientation.log", false);
    private static final String TAG = "WindowOrientationListener";
    private static final boolean USE_GRAVITY_SENSOR;
    int mCurrentRotation;
    private boolean mEnabled;
    private int mRate;
    private Sensor mSensor;
    private SensorEventListenerImpl mSensorEventListener;
    private SensorManager mSensorManager;

    public WindowOrientationListener(Context context)
    {
        this(context, 2);
    }

    private WindowOrientationListener(Context context, int i)
    {
        mCurrentRotation = -1;
        mSensorManager = (SensorManager)context.getSystemService("sensor");
        mRate = i;
        mSensor = mSensorManager.getDefaultSensor(1);
        if (mSensor != null)
            mSensorEventListener = new SensorEventListenerImpl(this);
    }

    public boolean canDetectOrientation()
    {
        return mSensor != null;
    }

    public void disable()
    {
        if (mSensor == null)
            Log.w("WindowOrientationListener", "Cannot detect sensors. Invalid disable");
        else
        if (mEnabled)
        {
            if (LOG)
                Log.d("WindowOrientationListener", "WindowOrientationListener disabled");
            mSensorEventListener.reset();
            mSensorManager.unregisterListener(mSensorEventListener);
            mEnabled = false;
            return;
        }
    }

    public void enable()
    {
        if (mSensor == null)
            Log.w("WindowOrientationListener", "Cannot detect sensors. Not enabled");
        else
        if (!mEnabled)
        {
            if (LOG)
                Log.d("WindowOrientationListener", "WindowOrientationListener enabled");
            mSensorManager.registerListener(mSensorEventListener, mSensor, mRate);
            mEnabled = true;
            return;
        }
    }

    public int getProposedRotation()
    {
        if (mEnabled)
            return mSensorEventListener.getProposedRotation();
        else
            return -1;
    }

    public abstract void onProposedRotationChanged(int i);

    public void setCurrentRotation(int i)
    {
        mCurrentRotation = i;
    }


}
