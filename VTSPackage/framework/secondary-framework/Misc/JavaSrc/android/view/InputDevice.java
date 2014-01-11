// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.hardware.input.InputManager;
import android.os.*;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package android.view:
//            KeyCharacterMap, MotionEvent

public final class InputDevice
    implements Parcelable
{
    public static final class MotionRange
    {

        private int mAxis;
        private float mFlat;
        private float mFuzz;
        private float mMax;
        private float mMin;
        private int mSource;

        public int getAxis()
        {
            return mAxis;
        }

        public float getFlat()
        {
            return mFlat;
        }

        public float getFuzz()
        {
            return mFuzz;
        }

        public float getMax()
        {
            return mMax;
        }

        public float getMin()
        {
            return mMin;
        }

        public float getRange()
        {
            return mMax - mMin;
        }

        public int getSource()
        {
            return mSource;
        }







        private MotionRange(int i, int j, float f, float f1, float f2, float f3)
        {
            mAxis = i;
            mSource = j;
            mMin = f;
            mMax = f1;
            mFlat = f2;
            mFuzz = f3;
        }

    }


    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public InputDevice createFromParcel(Parcel parcel)
        {
            return new InputDevice(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public InputDevice[] newArray(int i)
        {
            return new InputDevice[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    public static final int KEYBOARD_TYPE_ALPHABETIC = 2;
    public static final int KEYBOARD_TYPE_NONE = 0;
    public static final int KEYBOARD_TYPE_NON_ALPHABETIC = 1;
    public static final int MOTION_RANGE_ORIENTATION = 8;
    public static final int MOTION_RANGE_PRESSURE = 2;
    public static final int MOTION_RANGE_SIZE = 3;
    public static final int MOTION_RANGE_TOOL_MAJOR = 6;
    public static final int MOTION_RANGE_TOOL_MINOR = 7;
    public static final int MOTION_RANGE_TOUCH_MAJOR = 4;
    public static final int MOTION_RANGE_TOUCH_MINOR = 5;
    public static final int MOTION_RANGE_X = 0;
    public static final int MOTION_RANGE_Y = 1;
    public static final int SOURCE_ANY = -256;
    public static final int SOURCE_CLASS_BUTTON = 1;
    public static final int SOURCE_CLASS_JOYSTICK = 16;
    public static final int SOURCE_CLASS_MASK = 255;
    public static final int SOURCE_CLASS_POINTER = 2;
    public static final int SOURCE_CLASS_POSITION = 8;
    public static final int SOURCE_CLASS_TRACKBALL = 4;
    public static final int SOURCE_DPAD = 513;
    public static final int SOURCE_GAMEPAD = 1025;
    public static final int SOURCE_JOYSTICK = 0x1000010;
    public static final int SOURCE_KEYBOARD = 257;
    public static final int SOURCE_MOUSE = 8194;
    public static final int SOURCE_STYLUS = 16386;
    public static final int SOURCE_TOUCHPAD = 0x100008;
    public static final int SOURCE_TOUCHSCREEN = 4098;
    public static final int SOURCE_TRACKBALL = 0x10004;
    public static final int SOURCE_UNKNOWN;
    private final String mDescriptor;
    private final int mGeneration;
    private final boolean mHasVibrator;
    private final int mId;
    private final boolean mIsExternal;
    private final KeyCharacterMap mKeyCharacterMap;
    private final int mKeyboardType;
    private final ArrayList mMotionRanges;
    private final String mName;
    private final int mSources;
    private Vibrator mVibrator;

    private InputDevice(int i, int j, String s, String s1, boolean flag, int k, int l, 
            KeyCharacterMap keycharactermap, boolean flag1)
    {
        mMotionRanges = new ArrayList();
        mId = i;
        mGeneration = j;
        mName = s;
        mDescriptor = s1;
        mIsExternal = flag;
        mSources = k;
        mKeyboardType = l;
        mKeyCharacterMap = keycharactermap;
        mHasVibrator = flag1;
    }

    private InputDevice(Parcel parcel)
    {
        boolean flag = true;
        super();
        mMotionRanges = new ArrayList();
        mId = parcel.readInt();
        mGeneration = parcel.readInt();
        mName = parcel.readString();
        mDescriptor = parcel.readString();
        boolean flag1;
        if (parcel.readInt() != 0)
            flag1 = flag;
        else
            flag1 = false;
        mIsExternal = flag1;
        mSources = parcel.readInt();
        mKeyboardType = parcel.readInt();
        mKeyCharacterMap = (KeyCharacterMap)KeyCharacterMap.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0)
            flag = false;
        mHasVibrator = flag;
        do
        {
            int i = parcel.readInt();
            if (i < 0)
                return;
            addMotionRange(i, parcel.readInt(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat(), parcel.readFloat());
        } while (true);
    }


    private void addMotionRange(int i, int j, float f, float f1, float f2, float f3)
    {
        mMotionRanges.add(new MotionRange(i, j, f, f1, f2, f3));
    }

    private void appendSourceDescriptionIfApplicable(StringBuilder stringbuilder, int i, String s)
    {
        if ((i & mSources) == i)
        {
            stringbuilder.append(" ");
            stringbuilder.append(s);
        }
    }

    public static InputDevice getDevice(int i)
    {
        return InputManager.getInstance().getInputDevice(i);
    }

    public static int[] getDeviceIds()
    {
        return InputManager.getInstance().getInputDeviceIds();
    }

    public int describeContents()
    {
        return 0;
    }

    public String getDescriptor()
    {
        return mDescriptor;
    }

    public int getGeneration()
    {
        return mGeneration;
    }

    public int getId()
    {
        return mId;
    }

    public KeyCharacterMap getKeyCharacterMap()
    {
        return mKeyCharacterMap;
    }

    public int getKeyboardType()
    {
        return mKeyboardType;
    }

    public MotionRange getMotionRange(int i)
    {
        int j = mMotionRanges.size();
        for (int k = 0; k < j; k++)
        {
            MotionRange motionrange = (MotionRange)mMotionRanges.get(k);
            if (motionrange.mAxis == i)
                return motionrange;
        }

        return null;
    }

    public MotionRange getMotionRange(int i, int j)
    {
        int k = mMotionRanges.size();
        for (int l = 0; l < k; l++)
        {
            MotionRange motionrange = (MotionRange)mMotionRanges.get(l);
            if (motionrange.mAxis == i && motionrange.mSource == j)
                return motionrange;
        }

        return null;
    }

    public List getMotionRanges()
    {
        return mMotionRanges;
    }

    public String getName()
    {
        return mName;
    }

    public int getSources()
    {
        return mSources;
    }

    public Vibrator getVibrator()
    {
        ArrayList arraylist = mMotionRanges;
        arraylist;
        JVM INSTR monitorenter ;
        if (mVibrator == null)
        {
            if (!mHasVibrator)
                break MISSING_BLOCK_LABEL_44;
            mVibrator = InputManager.getInstance().getInputDeviceVibrator(mId);
        }
_L1:
        Vibrator vibrator = mVibrator;
        return vibrator;
        mVibrator = NullVibrator.getInstance();
          goto _L1
        Exception exception;
        exception;
        arraylist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isExternal()
    {
        return mIsExternal;
    }

    public boolean isFullKeyboard()
    {
        return (0x101 & mSources) == 257 && mKeyboardType == 2;
    }

    public boolean isVirtual()
    {
        return mId < 0;
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("Input Device ").append(mId).append(": ").append(mName).append("\n");
        stringbuilder.append("  Descriptor: ").append(mDescriptor).append("\n");
        stringbuilder.append("  Generation: ").append(mGeneration).append("\n");
        StringBuilder stringbuilder1 = stringbuilder.append("  Location: ");
        String s;
        if (mIsExternal)
            s = "external";
        else
            s = "built-in";
        stringbuilder1.append(s).append("\n");
        stringbuilder.append("  Keyboard Type: ");
        switch (mKeyboardType)
        {
        case 2: // '\002'
            stringbuilder.append("alphabetic");
            break;

        case 1: // '\001'
            stringbuilder.append("non-alphabetic");
            break;

        case 0: // '\0'
            stringbuilder.append("none");
            break;
        }
        stringbuilder.append("\n");
        stringbuilder.append("  Has Vibrator: ").append(mHasVibrator).append("\n");
        stringbuilder.append("  Sources: 0x").append(Integer.toHexString(mSources)).append(" (");
        appendSourceDescriptionIfApplicable(stringbuilder, 257, "keyboard");
        appendSourceDescriptionIfApplicable(stringbuilder, 513, "dpad");
        appendSourceDescriptionIfApplicable(stringbuilder, 4098, "touchscreen");
        appendSourceDescriptionIfApplicable(stringbuilder, 8194, "mouse");
        appendSourceDescriptionIfApplicable(stringbuilder, 16386, "stylus");
        appendSourceDescriptionIfApplicable(stringbuilder, 0x10004, "trackball");
        appendSourceDescriptionIfApplicable(stringbuilder, 0x100008, "touchpad");
        appendSourceDescriptionIfApplicable(stringbuilder, 0x1000010, "joystick");
        appendSourceDescriptionIfApplicable(stringbuilder, 1025, "gamepad");
        stringbuilder.append(" )\n");
        int i = mMotionRanges.size();
        for (int j = 0; j < i; j++)
        {
            MotionRange motionrange = (MotionRange)mMotionRanges.get(j);
            stringbuilder.append("    ").append(MotionEvent.axisToString(motionrange.mAxis));
            stringbuilder.append(": source=0x").append(Integer.toHexString(motionrange.mSource));
            stringbuilder.append(" min=").append(motionrange.mMin);
            stringbuilder.append(" max=").append(motionrange.mMax);
            stringbuilder.append(" flat=").append(motionrange.mFlat);
            stringbuilder.append(" fuzz=").append(motionrange.mFuzz);
            stringbuilder.append("\n");
        }

        return stringbuilder.toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        int j = 1;
        parcel.writeInt(mId);
        parcel.writeInt(mGeneration);
        parcel.writeString(mName);
        parcel.writeString(mDescriptor);
        int k;
        if (mIsExternal)
            k = j;
        else
            k = 0;
        parcel.writeInt(k);
        parcel.writeInt(mSources);
        parcel.writeInt(mKeyboardType);
        mKeyCharacterMap.writeToParcel(parcel, i);
        if (!mHasVibrator)
            j = 0;
        parcel.writeInt(j);
        int l = mMotionRanges.size();
        for (int i1 = 0; i1 < l; i1++)
        {
            MotionRange motionrange = (MotionRange)mMotionRanges.get(i1);
            parcel.writeInt(motionrange.mAxis);
            parcel.writeInt(motionrange.mSource);
            parcel.writeFloat(motionrange.mMin);
            parcel.writeFloat(motionrange.mMax);
            parcel.writeFloat(motionrange.mFlat);
            parcel.writeFloat(motionrange.mFuzz);
        }

        parcel.writeInt(-1);
    }

}
