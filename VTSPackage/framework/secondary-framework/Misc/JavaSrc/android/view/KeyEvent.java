// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import android.util.SparseIntArray;

// Referenced classes of package android.view:
//            InputEvent, KeyCharacterMap

public class KeyEvent extends InputEvent
    implements Parcelable
{
    public static interface Callback
    {

        public abstract boolean onKeyDown(int i, KeyEvent keyevent);

        public abstract boolean onKeyLongPress(int i, KeyEvent keyevent);

        public abstract boolean onKeyMultiple(int i, int j, KeyEvent keyevent);

        public abstract boolean onKeyUp(int i, KeyEvent keyevent);
    }


    public static final int ACTION_DOWN = 0;
    public static final int ACTION_MULTIPLE = 2;
    public static final int ACTION_UP = 1;
    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public KeyEvent createFromParcel(Parcel parcel)
        {
            parcel.readInt();
            return KeyEvent.createFromParcelBody(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public KeyEvent[] newArray(int i)
        {
            return new KeyEvent[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    static final boolean DEBUG = false;
    public static final int FLAG_CANCELED = 32;
    public static final int FLAG_CANCELED_LONG_PRESS = 256;
    public static final int FLAG_EDITOR_ACTION = 16;
    public static final int FLAG_FALLBACK = 1024;
    public static final int FLAG_FROM_SYSTEM = 8;
    public static final int FLAG_KEEP_TOUCH_MODE = 4;
    public static final int FLAG_LONG_PRESS = 128;
    public static final int FLAG_SOFT_KEYBOARD = 2;
    public static final int FLAG_START_TRACKING = 0x40000000;
    public static final int FLAG_TAINTED = 0x80000000;
    public static final int FLAG_TRACKING = 512;
    public static final int FLAG_VIRTUAL_HARD_KEY = 64;
    public static final int FLAG_WOKE_HERE = 1;
    public static final int KEYCODE_0 = 7;
    public static final int KEYCODE_1 = 8;
    public static final int KEYCODE_2 = 9;
    public static final int KEYCODE_3 = 10;
    public static final int KEYCODE_3D_MODE = 206;
    public static final int KEYCODE_4 = 11;
    public static final int KEYCODE_5 = 12;
    public static final int KEYCODE_6 = 13;
    public static final int KEYCODE_7 = 14;
    public static final int KEYCODE_8 = 15;
    public static final int KEYCODE_9 = 16;
    public static final int KEYCODE_A = 29;
    public static final int KEYCODE_ALT_LEFT = 57;
    public static final int KEYCODE_ALT_RIGHT = 58;
    public static final int KEYCODE_APOSTROPHE = 75;
    public static final int KEYCODE_APP_SWITCH = 187;
    public static final int KEYCODE_ASSIST = 219;
    public static final int KEYCODE_AT = 77;
    public static final int KEYCODE_AVR_INPUT = 182;
    public static final int KEYCODE_AVR_POWER = 181;
    public static final int KEYCODE_B = 30;
    public static final int KEYCODE_BACK = 4;
    public static final int KEYCODE_BACKSLASH = 73;
    public static final int KEYCODE_BOOKMARK = 174;
    public static final int KEYCODE_BREAK = 121;
    public static final int KEYCODE_BUTTON_1 = 188;
    public static final int KEYCODE_BUTTON_10 = 197;
    public static final int KEYCODE_BUTTON_11 = 198;
    public static final int KEYCODE_BUTTON_12 = 199;
    public static final int KEYCODE_BUTTON_13 = 200;
    public static final int KEYCODE_BUTTON_14 = 201;
    public static final int KEYCODE_BUTTON_15 = 202;
    public static final int KEYCODE_BUTTON_16 = 203;
    public static final int KEYCODE_BUTTON_2 = 189;
    public static final int KEYCODE_BUTTON_3 = 190;
    public static final int KEYCODE_BUTTON_4 = 191;
    public static final int KEYCODE_BUTTON_5 = 192;
    public static final int KEYCODE_BUTTON_6 = 193;
    public static final int KEYCODE_BUTTON_7 = 194;
    public static final int KEYCODE_BUTTON_8 = 195;
    public static final int KEYCODE_BUTTON_9 = 196;
    public static final int KEYCODE_BUTTON_A = 96;
    public static final int KEYCODE_BUTTON_B = 97;
    public static final int KEYCODE_BUTTON_C = 98;
    public static final int KEYCODE_BUTTON_L1 = 102;
    public static final int KEYCODE_BUTTON_L2 = 104;
    public static final int KEYCODE_BUTTON_MODE = 110;
    public static final int KEYCODE_BUTTON_R1 = 103;
    public static final int KEYCODE_BUTTON_R2 = 105;
    public static final int KEYCODE_BUTTON_SELECT = 109;
    public static final int KEYCODE_BUTTON_START = 108;
    public static final int KEYCODE_BUTTON_THUMBL = 106;
    public static final int KEYCODE_BUTTON_THUMBR = 107;
    public static final int KEYCODE_BUTTON_X = 99;
    public static final int KEYCODE_BUTTON_Y = 100;
    public static final int KEYCODE_BUTTON_Z = 101;
    public static final int KEYCODE_C = 31;
    public static final int KEYCODE_CALCULATOR = 210;
    public static final int KEYCODE_CALENDAR = 208;
    public static final int KEYCODE_CALL = 5;
    public static final int KEYCODE_CAMERA = 27;
    public static final int KEYCODE_CAPS_LOCK = 115;
    public static final int KEYCODE_CAPTIONS = 175;
    public static final int KEYCODE_CHANNEL_DOWN = 167;
    public static final int KEYCODE_CHANNEL_UP = 166;
    public static final int KEYCODE_CLEAR = 28;
    public static final int KEYCODE_COMMA = 55;
    public static final int KEYCODE_CONTACTS = 207;
    public static final int KEYCODE_CTRL_LEFT = 113;
    public static final int KEYCODE_CTRL_RIGHT = 114;
    public static final int KEYCODE_D = 32;
    public static final int KEYCODE_DEL = 67;
    public static final int KEYCODE_DPAD_CENTER = 23;
    public static final int KEYCODE_DPAD_DOWN = 20;
    public static final int KEYCODE_DPAD_LEFT = 21;
    public static final int KEYCODE_DPAD_RIGHT = 22;
    public static final int KEYCODE_DPAD_UP = 19;
    public static final int KEYCODE_DVR = 173;
    public static final int KEYCODE_E = 33;
    public static final int KEYCODE_EISU = 212;
    public static final int KEYCODE_ENDCALL = 6;
    public static final int KEYCODE_ENTER = 66;
    public static final int KEYCODE_ENVELOPE = 65;
    public static final int KEYCODE_EQUALS = 70;
    public static final int KEYCODE_ESCAPE = 111;
    public static final int KEYCODE_EXPLORER = 64;
    public static final int KEYCODE_F = 34;
    public static final int KEYCODE_F1 = 131;
    public static final int KEYCODE_F10 = 140;
    public static final int KEYCODE_F11 = 141;
    public static final int KEYCODE_F12 = 142;
    public static final int KEYCODE_F2 = 132;
    public static final int KEYCODE_F3 = 133;
    public static final int KEYCODE_F4 = 134;
    public static final int KEYCODE_F5 = 135;
    public static final int KEYCODE_F6 = 136;
    public static final int KEYCODE_F7 = 137;
    public static final int KEYCODE_F8 = 138;
    public static final int KEYCODE_F9 = 139;
    public static final int KEYCODE_FOCUS = 80;
    public static final int KEYCODE_FORWARD = 125;
    public static final int KEYCODE_FORWARD_DEL = 112;
    public static final int KEYCODE_FUNCTION = 119;
    public static final int KEYCODE_G = 35;
    public static final int KEYCODE_GRAVE = 68;
    public static final int KEYCODE_GUIDE = 172;
    public static final int KEYCODE_H = 36;
    public static final int KEYCODE_HEADSETHOOK = 79;
    public static final int KEYCODE_HENKAN = 214;
    public static final int KEYCODE_HOME = 3;
    public static final int KEYCODE_I = 37;
    public static final int KEYCODE_INFO = 165;
    public static final int KEYCODE_INSERT = 124;
    public static final int KEYCODE_J = 38;
    public static final int KEYCODE_K = 39;
    public static final int KEYCODE_KANA = 218;
    public static final int KEYCODE_KATAKANA_HIRAGANA = 215;
    public static final int KEYCODE_L = 40;
    public static final int KEYCODE_LANGUAGE_SWITCH = 204;
    public static final int KEYCODE_LEFT_BRACKET = 71;
    public static final int KEYCODE_M = 41;
    public static final int KEYCODE_MANNER_MODE = 205;
    public static final int KEYCODE_MEDIA_CLOSE = 128;
    public static final int KEYCODE_MEDIA_EJECT = 129;
    public static final int KEYCODE_MEDIA_FAST_FORWARD = 90;
    public static final int KEYCODE_MEDIA_NEXT = 87;
    public static final int KEYCODE_MEDIA_PAUSE = 127;
    public static final int KEYCODE_MEDIA_PLAY = 126;
    public static final int KEYCODE_MEDIA_PLAY_PAUSE = 85;
    public static final int KEYCODE_MEDIA_PREVIOUS = 88;
    public static final int KEYCODE_MEDIA_RECORD = 130;
    public static final int KEYCODE_MEDIA_REWIND = 89;
    public static final int KEYCODE_MEDIA_STOP = 86;
    public static final int KEYCODE_MENU = 82;
    public static final int KEYCODE_META_LEFT = 117;
    public static final int KEYCODE_META_RIGHT = 118;
    public static final int KEYCODE_MINUS = 69;
    public static final int KEYCODE_MOVE_END = 123;
    public static final int KEYCODE_MOVE_HOME = 122;
    public static final int KEYCODE_MUHENKAN = 213;
    public static final int KEYCODE_MUSIC = 209;
    public static final int KEYCODE_MUTE = 91;
    public static final int KEYCODE_N = 42;
    public static final int KEYCODE_NOTIFICATION = 83;
    public static final int KEYCODE_NUM = 78;
    public static final int KEYCODE_NUMPAD_0 = 144;
    public static final int KEYCODE_NUMPAD_1 = 145;
    public static final int KEYCODE_NUMPAD_2 = 146;
    public static final int KEYCODE_NUMPAD_3 = 147;
    public static final int KEYCODE_NUMPAD_4 = 148;
    public static final int KEYCODE_NUMPAD_5 = 149;
    public static final int KEYCODE_NUMPAD_6 = 150;
    public static final int KEYCODE_NUMPAD_7 = 151;
    public static final int KEYCODE_NUMPAD_8 = 152;
    public static final int KEYCODE_NUMPAD_9 = 153;
    public static final int KEYCODE_NUMPAD_ADD = 157;
    public static final int KEYCODE_NUMPAD_COMMA = 159;
    public static final int KEYCODE_NUMPAD_DIVIDE = 154;
    public static final int KEYCODE_NUMPAD_DOT = 158;
    public static final int KEYCODE_NUMPAD_ENTER = 160;
    public static final int KEYCODE_NUMPAD_EQUALS = 161;
    public static final int KEYCODE_NUMPAD_LEFT_PAREN = 162;
    public static final int KEYCODE_NUMPAD_MULTIPLY = 155;
    public static final int KEYCODE_NUMPAD_RIGHT_PAREN = 163;
    public static final int KEYCODE_NUMPAD_SUBTRACT = 156;
    public static final int KEYCODE_NUM_LOCK = 143;
    public static final int KEYCODE_O = 43;
    public static final int KEYCODE_P = 44;
    public static final int KEYCODE_PAGE_DOWN = 93;
    public static final int KEYCODE_PAGE_UP = 92;
    public static final int KEYCODE_PERIOD = 56;
    public static final int KEYCODE_PICTSYMBOLS = 94;
    public static final int KEYCODE_PLUS = 81;
    public static final int KEYCODE_POUND = 18;
    public static final int KEYCODE_POWER = 26;
    public static final int KEYCODE_PROG_BLUE = 186;
    public static final int KEYCODE_PROG_GREEN = 184;
    public static final int KEYCODE_PROG_RED = 183;
    public static final int KEYCODE_PROG_YELLOW = 185;
    public static final int KEYCODE_Q = 45;
    public static final int KEYCODE_R = 46;
    public static final int KEYCODE_RIGHT_BRACKET = 72;
    public static final int KEYCODE_RO = 217;
    public static final int KEYCODE_S = 47;
    public static final int KEYCODE_SCROLL_LOCK = 116;
    public static final int KEYCODE_SEARCH = 84;
    public static final int KEYCODE_SEMICOLON = 74;
    public static final int KEYCODE_SETTINGS = 176;
    public static final int KEYCODE_SHIFT_LEFT = 59;
    public static final int KEYCODE_SHIFT_RIGHT = 60;
    public static final int KEYCODE_SLASH = 76;
    public static final int KEYCODE_SOFT_LEFT = 1;
    public static final int KEYCODE_SOFT_RIGHT = 2;
    public static final int KEYCODE_SOS = 249;
    public static final int KEYCODE_SPACE = 62;
    public static final int KEYCODE_STAR = 17;
    public static final int KEYCODE_STB_INPUT = 180;
    public static final int KEYCODE_STB_POWER = 179;
    public static final int KEYCODE_SWITCH_CHARSET = 95;
    public static final int KEYCODE_SYM = 63;
    private static final SparseArray KEYCODE_SYMBOLIC_NAMES = new SparseArray();
    public static final int KEYCODE_SYSRQ = 120;
    public static final int KEYCODE_T = 48;
    public static final int KEYCODE_TAB = 61;
    public static final int KEYCODE_TV = 170;
    public static final int KEYCODE_TV_INPUT = 178;
    public static final int KEYCODE_TV_POWER = 177;
    public static final int KEYCODE_U = 49;
    public static final int KEYCODE_UNKNOWN = 0;
    public static final int KEYCODE_V = 50;
    public static final int KEYCODE_VOLUME_DOWN = 25;
    public static final int KEYCODE_VOLUME_MUTE = 164;
    public static final int KEYCODE_VOLUME_UP = 24;
    public static final int KEYCODE_W = 51;
    public static final int KEYCODE_WINDOW = 171;
    public static final int KEYCODE_X = 52;
    public static final int KEYCODE_Y = 53;
    public static final int KEYCODE_YEN = 216;
    public static final int KEYCODE_Z = 54;
    public static final int KEYCODE_ZENKAKU_HANKAKU = 211;
    public static final int KEYCODE_ZOOM_IN = 168;
    public static final int KEYCODE_ZOOM_OUT = 169;
    private static final int LAST_KEYCODE = 249;
    public static final int MAX_KEYCODE = 84;
    private static final int MAX_RECYCLED = 10;
    private static final int META_ALL_MASK = 0x7770ff;
    public static final int META_ALT_LEFT_ON = 16;
    public static final int META_ALT_LOCKED = 512;
    public static final int META_ALT_MASK = 50;
    public static final int META_ALT_ON = 2;
    public static final int META_ALT_RIGHT_ON = 32;
    public static final int META_CAPS_LOCK_ON = 0x100000;
    public static final int META_CAP_LOCKED = 256;
    public static final int META_CTRL_LEFT_ON = 8192;
    public static final int META_CTRL_MASK = 28672;
    public static final int META_CTRL_ON = 4096;
    public static final int META_CTRL_RIGHT_ON = 16384;
    public static final int META_FUNCTION_ON = 8;
    private static final int META_INVALID_MODIFIER_MASK = 0x700f00;
    private static final int META_LOCK_MASK = 0x700000;
    public static final int META_META_LEFT_ON = 0x20000;
    public static final int META_META_MASK = 0x70000;
    public static final int META_META_ON = 0x10000;
    public static final int META_META_RIGHT_ON = 0x40000;
    private static final int META_MODIFIER_MASK = 0x770ff;
    public static final int META_NUM_LOCK_ON = 0x200000;
    public static final int META_SCROLL_LOCK_ON = 0x400000;
    public static final int META_SELECTING = 2048;
    public static final int META_SHIFT_LEFT_ON = 64;
    public static final int META_SHIFT_MASK = 193;
    public static final int META_SHIFT_ON = 1;
    public static final int META_SHIFT_RIGHT_ON = 128;
    private static final String META_SYMBOLIC_NAMES[] = {
        "META_SHIFT_ON", "META_ALT_ON", "META_SYM_ON", "META_FUNCTION_ON", "META_ALT_LEFT_ON", "META_ALT_RIGHT_ON", "META_SHIFT_LEFT_ON", "META_SHIFT_RIGHT_ON", "META_CAP_LOCKED", "META_ALT_LOCKED", 
        "META_SYM_LOCKED", "0x00000800", "META_CTRL_ON", "META_CTRL_LEFT_ON", "META_CTRL_RIGHT_ON", "0x00008000", "META_META_ON", "META_META_LEFT_ON", "META_META_RIGHT_ON", "0x00080000", 
        "META_CAPS_LOCK_ON", "META_NUM_LOCK_ON", "META_SCROLL_LOCK_ON", "0x00800000", "0x01000000", "0x02000000", "0x04000000", "0x08000000", "0x10000000", "0x20000000", 
        "0x40000000", "0x80000000"
    };
    public static final int META_SYM_LOCKED = 1024;
    public static final int META_SYM_ON = 4;
    private static final int META_SYNTHETIC_MASK = 3840;
    static final String TAG = "KeyEvent";
    private static final Object gRecyclerLock = new Object();
    private static KeyEvent gRecyclerTop;
    private static int gRecyclerUsed;
    private int mAction;
    private String mCharacters;
    private int mDeviceId;
    private long mDownTime;
    private long mEventTime;
    private int mFlags;
    private int mKeyCode;
    private int mMetaState;
    private KeyEvent mNext;
    private int mRepeatCount;
    private int mScanCode;
    private int mSource;

    private KeyEvent()
    {
    }

    public KeyEvent(int i, int j)
    {
        mAction = i;
        mKeyCode = j;
        mRepeatCount = 0;
        mDeviceId = -1;
    }

    public KeyEvent(long l, long l1, int i, int j, int k)
    {
        mDownTime = l;
        mEventTime = l1;
        mAction = i;
        mKeyCode = j;
        mRepeatCount = k;
        mDeviceId = -1;
    }

    public KeyEvent(long l, long l1, int i, int j, int k, 
            int i1)
    {
        mDownTime = l;
        mEventTime = l1;
        mAction = i;
        mKeyCode = j;
        mRepeatCount = k;
        mMetaState = i1;
        mDeviceId = -1;
    }

    public KeyEvent(long l, long l1, int i, int j, int k, 
            int i1, int j1, int k1)
    {
        mDownTime = l;
        mEventTime = l1;
        mAction = i;
        mKeyCode = j;
        mRepeatCount = k;
        mMetaState = i1;
        mDeviceId = j1;
        mScanCode = k1;
    }

    public KeyEvent(long l, long l1, int i, int j, int k, 
            int i1, int j1, int k1, int i2)
    {
        mDownTime = l;
        mEventTime = l1;
        mAction = i;
        mKeyCode = j;
        mRepeatCount = k;
        mMetaState = i1;
        mDeviceId = j1;
        mScanCode = k1;
        mFlags = i2;
    }

    public KeyEvent(long l, long l1, int i, int j, int k, 
            int i1, int j1, int k1, int i2, int j2)
    {
        mDownTime = l;
        mEventTime = l1;
        mAction = i;
        mKeyCode = j;
        mRepeatCount = k;
        mMetaState = i1;
        mDeviceId = j1;
        mScanCode = k1;
        mFlags = i2;
        mSource = j2;
    }

    public KeyEvent(long l, String s, int i, int j)
    {
        mDownTime = l;
        mEventTime = l;
        mCharacters = s;
        mAction = 2;
        mKeyCode = 0;
        mRepeatCount = 0;
        mDeviceId = i;
        mFlags = j;
        mSource = 257;
    }

    private KeyEvent(Parcel parcel)
    {
        mDeviceId = parcel.readInt();
        mSource = parcel.readInt();
        mAction = parcel.readInt();
        mKeyCode = parcel.readInt();
        mRepeatCount = parcel.readInt();
        mMetaState = parcel.readInt();
        mScanCode = parcel.readInt();
        mFlags = parcel.readInt();
        mDownTime = parcel.readLong();
        mEventTime = parcel.readLong();
    }

    public KeyEvent(KeyEvent keyevent)
    {
        mDownTime = keyevent.mDownTime;
        mEventTime = keyevent.mEventTime;
        mAction = keyevent.mAction;
        mKeyCode = keyevent.mKeyCode;
        mRepeatCount = keyevent.mRepeatCount;
        mMetaState = keyevent.mMetaState;
        mDeviceId = keyevent.mDeviceId;
        mSource = keyevent.mSource;
        mScanCode = keyevent.mScanCode;
        mFlags = keyevent.mFlags;
        mCharacters = keyevent.mCharacters;
    }

    private KeyEvent(KeyEvent keyevent, int i)
    {
        mDownTime = keyevent.mDownTime;
        mEventTime = keyevent.mEventTime;
        mAction = i;
        mKeyCode = keyevent.mKeyCode;
        mRepeatCount = keyevent.mRepeatCount;
        mMetaState = keyevent.mMetaState;
        mDeviceId = keyevent.mDeviceId;
        mSource = keyevent.mSource;
        mScanCode = keyevent.mScanCode;
        mFlags = keyevent.mFlags;
    }

    public KeyEvent(KeyEvent keyevent, long l, int i)
    {
        mDownTime = keyevent.mDownTime;
        mEventTime = l;
        mAction = keyevent.mAction;
        mKeyCode = keyevent.mKeyCode;
        mRepeatCount = i;
        mMetaState = keyevent.mMetaState;
        mDeviceId = keyevent.mDeviceId;
        mSource = keyevent.mSource;
        mScanCode = keyevent.mScanCode;
        mFlags = keyevent.mFlags;
        mCharacters = keyevent.mCharacters;
    }

    public static String actionToString(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            return "ACTION_MULTIPLE";

        case 1: // '\001'
            return "ACTION_UP";

        case 0: // '\0'
            return "ACTION_DOWN";
        }
        return Integer.toString(i);
    }

    public static KeyEvent changeAction(KeyEvent keyevent, int i)
    {
        return new KeyEvent(keyevent, i);
    }

    public static KeyEvent changeFlags(KeyEvent keyevent, int i)
    {
        KeyEvent keyevent1 = new KeyEvent(keyevent);
        keyevent1.mFlags = i;
        return keyevent1;
    }

    public static KeyEvent changeTimeRepeat(KeyEvent keyevent, long l, int i)
    {
        return new KeyEvent(keyevent, l, i);
    }

    public static KeyEvent changeTimeRepeat(KeyEvent keyevent, long l, int i, int j)
    {
        KeyEvent keyevent1 = new KeyEvent(keyevent);
        keyevent1.mEventTime = l;
        keyevent1.mRepeatCount = i;
        keyevent1.mFlags = j;
        return keyevent1;
    }

    public static KeyEvent createFromParcelBody(Parcel parcel)
    {
        return new KeyEvent(parcel);
    }

    public static int getDeadChar(int i, int j)
    {
        return KeyCharacterMap.getDeadChar(i, j);
    }

    public static int getMaxKeyCode()
    {
        return 249;
    }

    public static int getModifierMetaStateMask()
    {
        return 0x770ff;
    }

    public static final boolean isGamepadButton(int i)
    {
        switch (i)
        {
        case 96: // '`'
        case 97: // 'a'
        case 98: // 'b'
        case 99: // 'c'
        case 100: // 'd'
        case 101: // 'e'
        case 102: // 'f'
        case 103: // 'g'
        case 104: // 'h'
        case 105: // 'i'
        case 106: // 'j'
        case 107: // 'k'
        case 108: // 'l'
        case 109: // 'm'
        case 110: // 'n'
        case 188: 
        case 189: 
        case 190: 
        case 191: 
        case 192: 
        case 193: 
        case 194: 
        case 195: 
        case 196: 
        case 197: 
        case 198: 
        case 199: 
        case 200: 
        case 201: 
        case 202: 
        case 203: 
            return true;
        }
        return false;
    }

    public static boolean isModifierKey(int i)
    {
        switch (i)
        {
        case 57: // '9'
        case 58: // ':'
        case 59: // ';'
        case 60: // '<'
        case 63: // '?'
        case 78: // 'N'
        case 113: // 'q'
        case 114: // 'r'
        case 117: // 'u'
        case 118: // 'v'
        case 119: // 'w'
            return true;
        }
        return false;
    }

    public static int keyCodeFromString(String s)
    {
        if (s == null)
            throw new IllegalArgumentException("symbolicName must not be null");
        int i = KEYCODE_SYMBOLIC_NAMES.size();
        for (int j = 0; j < i; j++)
            if (s.equals(KEYCODE_SYMBOLIC_NAMES.valueAt(j)))
                return j;

        int k;
        try
        {
            k = Integer.parseInt(s, 10);
        }
        catch (NumberFormatException numberformatexception)
        {
            return 0;
        }
        return k;
    }

    public static String keyCodeToString(int i)
    {
        String s = (String)KEYCODE_SYMBOLIC_NAMES.get(i);
        if (s != null)
            return s;
        else
            return Integer.toString(i);
    }

    private static int metaStateFilterDirectionalModifiers(int i, int j, int k, int l, int i1)
    {
        boolean flag = true;
        boolean flag1;
        if ((j & k) != 0)
            flag1 = flag;
        else
            flag1 = false;
        int j1 = l | i1;
        if ((j & j1) == 0)
            flag = false;
        if (flag1)
        {
            if (flag)
                throw new IllegalArgumentException((new StringBuilder()).append("modifiers must not contain ").append(metaStateToString(k)).append(" combined with ").append(metaStateToString(l)).append(" or ").append(metaStateToString(i1)).toString());
            i &= ~j1;
        } else
        if (flag)
            return i & ~k;
        return i;
    }

    public static boolean metaStateHasModifiers(int i, int j)
    {
        if ((0x700f00 & j) != 0)
            throw new IllegalArgumentException("modifiers must not contain META_CAPS_LOCK_ON, META_NUM_LOCK_ON, META_SCROLL_LOCK_ON, META_CAP_LOCKED, META_ALT_LOCKED, META_SYM_LOCKED, or META_SELECTING");
        return metaStateFilterDirectionalModifiers(metaStateFilterDirectionalModifiers(metaStateFilterDirectionalModifiers(metaStateFilterDirectionalModifiers(0x770ff & normalizeMetaState(i), j, 1, 64, 128), j, 2, 16, 32), j, 4096, 8192, 16384), j, 0x10000, 0x20000, 0x40000) == j;
    }

    public static boolean metaStateHasNoModifiers(int i)
    {
        return (0x770ff & normalizeMetaState(i)) == 0;
    }

    public static String metaStateToString(int i)
    {
        if (i != 0) goto _L2; else goto _L1
_L1:
        String s = "0";
          goto _L3
_L2:
        StringBuilder stringbuilder;
        int j;
        stringbuilder = null;
        j = 0;
_L8:
        if (i == 0) goto _L5; else goto _L4
_L4:
        boolean flag;
        if ((i & 1) != 0)
            flag = true;
        else
            flag = false;
        i >>>= 1;
        if (!flag)
            continue; /* Loop/switch isn't completed */
        s = META_SYMBOLIC_NAMES[j];
        if (stringbuilder != null) goto _L7; else goto _L6
_L6:
        if (i != 0)
        {
            stringbuilder = new StringBuilder(s);
            continue; /* Loop/switch isn't completed */
        }
_L3:
        return s;
_L7:
        stringbuilder.append('|');
        stringbuilder.append(s);
        j++;
          goto _L8
_L5:
        return stringbuilder.toString();
    }

    private native boolean native_hasDefaultAction(int i);

    private native boolean native_isSystemKey(int i);

    public static int normalizeMetaState(int i)
    {
        if ((i & 0xc0) != 0)
            i |= 1;
        if ((i & 0x30) != 0)
            i |= 2;
        if ((i & 0x6000) != 0)
            i |= 0x1000;
        if ((0x60000 & i) != 0)
            i |= 0x10000;
        if ((i & 0x100) != 0)
            i |= 0x100000;
        if ((i & 0x200) != 0)
            i |= 2;
        if ((i & 0x400) != 0)
            i |= 4;
        return 0x7770ff & i;
    }

    private static KeyEvent obtain()
    {
        Object obj = gRecyclerLock;
        obj;
        JVM INSTR monitorenter ;
        KeyEvent keyevent = gRecyclerTop;
        if (keyevent != null)
            break MISSING_BLOCK_LABEL_26;
        KeyEvent keyevent1 = new KeyEvent();
        obj;
        JVM INSTR monitorexit ;
        return keyevent1;
        gRecyclerTop = keyevent.mNext;
        gRecyclerUsed = -1 + gRecyclerUsed;
        obj;
        JVM INSTR monitorexit ;
        keyevent.mNext = null;
        keyevent.prepareForReuse();
        return keyevent;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static KeyEvent obtain(long l, long l1, int i, int j, int k, int i1, 
            int j1, int k1, int i2, int j2, String s)
    {
        KeyEvent keyevent = obtain();
        keyevent.mDownTime = l;
        keyevent.mEventTime = l1;
        keyevent.mAction = i;
        keyevent.mKeyCode = j;
        keyevent.mRepeatCount = k;
        keyevent.mMetaState = i1;
        keyevent.mDeviceId = j1;
        keyevent.mScanCode = k1;
        keyevent.mFlags = i2;
        keyevent.mSource = j2;
        keyevent.mCharacters = s;
        return keyevent;
    }

    public static KeyEvent obtain(KeyEvent keyevent)
    {
        KeyEvent keyevent1 = obtain();
        keyevent1.mDownTime = keyevent.mDownTime;
        keyevent1.mEventTime = keyevent.mEventTime;
        keyevent1.mAction = keyevent.mAction;
        keyevent1.mKeyCode = keyevent.mKeyCode;
        keyevent1.mRepeatCount = keyevent.mRepeatCount;
        keyevent1.mMetaState = keyevent.mMetaState;
        keyevent1.mDeviceId = keyevent.mDeviceId;
        keyevent1.mScanCode = keyevent.mScanCode;
        keyevent1.mFlags = keyevent.mFlags;
        keyevent1.mSource = keyevent.mSource;
        keyevent1.mCharacters = keyevent.mCharacters;
        return keyevent1;
    }

    private static void populateKeycodeSymbolicNames()
    {
        SparseArray sparsearray = KEYCODE_SYMBOLIC_NAMES;
        sparsearray.append(0, "KEYCODE_UNKNOWN");
        sparsearray.append(1, "KEYCODE_SOFT_LEFT");
        sparsearray.append(2, "KEYCODE_SOFT_RIGHT");
        sparsearray.append(3, "KEYCODE_HOME");
        sparsearray.append(4, "KEYCODE_BACK");
        sparsearray.append(5, "KEYCODE_CALL");
        sparsearray.append(6, "KEYCODE_ENDCALL");
        sparsearray.append(7, "KEYCODE_0");
        sparsearray.append(8, "KEYCODE_1");
        sparsearray.append(9, "KEYCODE_2");
        sparsearray.append(10, "KEYCODE_3");
        sparsearray.append(11, "KEYCODE_4");
        sparsearray.append(12, "KEYCODE_5");
        sparsearray.append(13, "KEYCODE_6");
        sparsearray.append(14, "KEYCODE_7");
        sparsearray.append(15, "KEYCODE_8");
        sparsearray.append(16, "KEYCODE_9");
        sparsearray.append(17, "KEYCODE_STAR");
        sparsearray.append(18, "KEYCODE_POUND");
        sparsearray.append(19, "KEYCODE_DPAD_UP");
        sparsearray.append(20, "KEYCODE_DPAD_DOWN");
        sparsearray.append(21, "KEYCODE_DPAD_LEFT");
        sparsearray.append(22, "KEYCODE_DPAD_RIGHT");
        sparsearray.append(23, "KEYCODE_DPAD_CENTER");
        sparsearray.append(24, "KEYCODE_VOLUME_UP");
        sparsearray.append(25, "KEYCODE_VOLUME_DOWN");
        sparsearray.append(26, "KEYCODE_POWER");
        sparsearray.append(27, "KEYCODE_CAMERA");
        sparsearray.append(28, "KEYCODE_CLEAR");
        sparsearray.append(29, "KEYCODE_A");
        sparsearray.append(30, "KEYCODE_B");
        sparsearray.append(31, "KEYCODE_C");
        sparsearray.append(32, "KEYCODE_D");
        sparsearray.append(33, "KEYCODE_E");
        sparsearray.append(34, "KEYCODE_F");
        sparsearray.append(35, "KEYCODE_G");
        sparsearray.append(36, "KEYCODE_H");
        sparsearray.append(37, "KEYCODE_I");
        sparsearray.append(38, "KEYCODE_J");
        sparsearray.append(39, "KEYCODE_K");
        sparsearray.append(40, "KEYCODE_L");
        sparsearray.append(41, "KEYCODE_M");
        sparsearray.append(42, "KEYCODE_N");
        sparsearray.append(43, "KEYCODE_O");
        sparsearray.append(44, "KEYCODE_P");
        sparsearray.append(45, "KEYCODE_Q");
        sparsearray.append(46, "KEYCODE_R");
        sparsearray.append(47, "KEYCODE_S");
        sparsearray.append(48, "KEYCODE_T");
        sparsearray.append(49, "KEYCODE_U");
        sparsearray.append(50, "KEYCODE_V");
        sparsearray.append(51, "KEYCODE_W");
        sparsearray.append(52, "KEYCODE_X");
        sparsearray.append(53, "KEYCODE_Y");
        sparsearray.append(54, "KEYCODE_Z");
        sparsearray.append(55, "KEYCODE_COMMA");
        sparsearray.append(56, "KEYCODE_PERIOD");
        sparsearray.append(57, "KEYCODE_ALT_LEFT");
        sparsearray.append(58, "KEYCODE_ALT_RIGHT");
        sparsearray.append(59, "KEYCODE_SHIFT_LEFT");
        sparsearray.append(60, "KEYCODE_SHIFT_RIGHT");
        sparsearray.append(61, "KEYCODE_TAB");
        sparsearray.append(62, "KEYCODE_SPACE");
        sparsearray.append(63, "KEYCODE_SYM");
        sparsearray.append(64, "KEYCODE_EXPLORER");
        sparsearray.append(65, "KEYCODE_ENVELOPE");
        sparsearray.append(66, "KEYCODE_ENTER");
        sparsearray.append(67, "KEYCODE_DEL");
        sparsearray.append(68, "KEYCODE_GRAVE");
        sparsearray.append(69, "KEYCODE_MINUS");
        sparsearray.append(70, "KEYCODE_EQUALS");
        sparsearray.append(71, "KEYCODE_LEFT_BRACKET");
        sparsearray.append(72, "KEYCODE_RIGHT_BRACKET");
        sparsearray.append(73, "KEYCODE_BACKSLASH");
        sparsearray.append(74, "KEYCODE_SEMICOLON");
        sparsearray.append(75, "KEYCODE_APOSTROPHE");
        sparsearray.append(76, "KEYCODE_SLASH");
        sparsearray.append(77, "KEYCODE_AT");
        sparsearray.append(78, "KEYCODE_NUM");
        sparsearray.append(79, "KEYCODE_HEADSETHOOK");
        sparsearray.append(80, "KEYCODE_FOCUS");
        sparsearray.append(81, "KEYCODE_PLUS");
        sparsearray.append(82, "KEYCODE_MENU");
        sparsearray.append(83, "KEYCODE_NOTIFICATION");
        sparsearray.append(84, "KEYCODE_SEARCH");
        sparsearray.append(85, "KEYCODE_MEDIA_PLAY_PAUSE");
        sparsearray.append(86, "KEYCODE_MEDIA_STOP");
        sparsearray.append(87, "KEYCODE_MEDIA_NEXT");
        sparsearray.append(88, "KEYCODE_MEDIA_PREVIOUS");
        sparsearray.append(89, "KEYCODE_MEDIA_REWIND");
        sparsearray.append(90, "KEYCODE_MEDIA_FAST_FORWARD");
        sparsearray.append(91, "KEYCODE_MUTE");
        sparsearray.append(92, "KEYCODE_PAGE_UP");
        sparsearray.append(93, "KEYCODE_PAGE_DOWN");
        sparsearray.append(94, "KEYCODE_PICTSYMBOLS");
        sparsearray.append(95, "KEYCODE_SWITCH_CHARSET");
        sparsearray.append(96, "KEYCODE_BUTTON_A");
        sparsearray.append(97, "KEYCODE_BUTTON_B");
        sparsearray.append(98, "KEYCODE_BUTTON_C");
        sparsearray.append(99, "KEYCODE_BUTTON_X");
        sparsearray.append(100, "KEYCODE_BUTTON_Y");
        sparsearray.append(101, "KEYCODE_BUTTON_Z");
        sparsearray.append(102, "KEYCODE_BUTTON_L1");
        sparsearray.append(103, "KEYCODE_BUTTON_R1");
        sparsearray.append(104, "KEYCODE_BUTTON_L2");
        sparsearray.append(105, "KEYCODE_BUTTON_R2");
        sparsearray.append(106, "KEYCODE_BUTTON_THUMBL");
        sparsearray.append(107, "KEYCODE_BUTTON_THUMBR");
        sparsearray.append(108, "KEYCODE_BUTTON_START");
        sparsearray.append(109, "KEYCODE_BUTTON_SELECT");
        sparsearray.append(110, "KEYCODE_BUTTON_MODE");
        sparsearray.append(111, "KEYCODE_ESCAPE");
        sparsearray.append(112, "KEYCODE_FORWARD_DEL");
        sparsearray.append(113, "KEYCODE_CTRL_LEFT");
        sparsearray.append(114, "KEYCODE_CTRL_RIGHT");
        sparsearray.append(115, "KEYCODE_CAPS_LOCK");
        sparsearray.append(116, "KEYCODE_SCROLL_LOCK");
        sparsearray.append(117, "KEYCODE_META_LEFT");
        sparsearray.append(118, "KEYCODE_META_RIGHT");
        sparsearray.append(119, "KEYCODE_FUNCTION");
        sparsearray.append(120, "KEYCODE_SYSRQ");
        sparsearray.append(121, "KEYCODE_BREAK");
        sparsearray.append(122, "KEYCODE_MOVE_HOME");
        sparsearray.append(123, "KEYCODE_MOVE_END");
        sparsearray.append(124, "KEYCODE_INSERT");
        sparsearray.append(125, "KEYCODE_FORWARD");
        sparsearray.append(126, "KEYCODE_MEDIA_PLAY");
        sparsearray.append(127, "KEYCODE_MEDIA_PAUSE");
        sparsearray.append(128, "KEYCODE_MEDIA_CLOSE");
        sparsearray.append(129, "KEYCODE_MEDIA_EJECT");
        sparsearray.append(130, "KEYCODE_MEDIA_RECORD");
        sparsearray.append(131, "KEYCODE_F1");
        sparsearray.append(132, "KEYCODE_F2");
        sparsearray.append(133, "KEYCODE_F3");
        sparsearray.append(134, "KEYCODE_F4");
        sparsearray.append(135, "KEYCODE_F5");
        sparsearray.append(136, "KEYCODE_F6");
        sparsearray.append(137, "KEYCODE_F7");
        sparsearray.append(138, "KEYCODE_F8");
        sparsearray.append(139, "KEYCODE_F9");
        sparsearray.append(140, "KEYCODE_F10");
        sparsearray.append(141, "KEYCODE_F11");
        sparsearray.append(142, "KEYCODE_F12");
        sparsearray.append(143, "KEYCODE_NUM_LOCK");
        sparsearray.append(144, "KEYCODE_NUMPAD_0");
        sparsearray.append(145, "KEYCODE_NUMPAD_1");
        sparsearray.append(146, "KEYCODE_NUMPAD_2");
        sparsearray.append(147, "KEYCODE_NUMPAD_3");
        sparsearray.append(148, "KEYCODE_NUMPAD_4");
        sparsearray.append(149, "KEYCODE_NUMPAD_5");
        sparsearray.append(150, "KEYCODE_NUMPAD_6");
        sparsearray.append(151, "KEYCODE_NUMPAD_7");
        sparsearray.append(152, "KEYCODE_NUMPAD_8");
        sparsearray.append(153, "KEYCODE_NUMPAD_9");
        sparsearray.append(154, "KEYCODE_NUMPAD_DIVIDE");
        sparsearray.append(155, "KEYCODE_NUMPAD_MULTIPLY");
        sparsearray.append(156, "KEYCODE_NUMPAD_SUBTRACT");
        sparsearray.append(157, "KEYCODE_NUMPAD_ADD");
        sparsearray.append(158, "KEYCODE_NUMPAD_DOT");
        sparsearray.append(159, "KEYCODE_NUMPAD_COMMA");
        sparsearray.append(160, "KEYCODE_NUMPAD_ENTER");
        sparsearray.append(161, "KEYCODE_NUMPAD_EQUALS");
        sparsearray.append(162, "KEYCODE_NUMPAD_LEFT_PAREN");
        sparsearray.append(163, "KEYCODE_NUMPAD_RIGHT_PAREN");
        sparsearray.append(164, "KEYCODE_VOLUME_MUTE");
        sparsearray.append(165, "KEYCODE_INFO");
        sparsearray.append(166, "KEYCODE_CHANNEL_UP");
        sparsearray.append(167, "KEYCODE_CHANNEL_DOWN");
        sparsearray.append(168, "KEYCODE_ZOOM_IN");
        sparsearray.append(169, "KEYCODE_ZOOM_OUT");
        sparsearray.append(170, "KEYCODE_TV");
        sparsearray.append(171, "KEYCODE_WINDOW");
        sparsearray.append(172, "KEYCODE_GUIDE");
        sparsearray.append(173, "KEYCODE_DVR");
        sparsearray.append(174, "KEYCODE_BOOKMARK");
        sparsearray.append(175, "KEYCODE_CAPTIONS");
        sparsearray.append(176, "KEYCODE_SETTINGS");
        sparsearray.append(177, "KEYCODE_TV_POWER");
        sparsearray.append(178, "KEYCODE_TV_INPUT");
        sparsearray.append(180, "KEYCODE_STB_INPUT");
        sparsearray.append(179, "KEYCODE_STB_POWER");
        sparsearray.append(181, "KEYCODE_AVR_POWER");
        sparsearray.append(182, "KEYCODE_AVR_INPUT");
        sparsearray.append(183, "KEYCODE_PROG_RED");
        sparsearray.append(184, "KEYCODE_PROG_GREEN");
        sparsearray.append(185, "KEYCODE_PROG_YELLOW");
        sparsearray.append(186, "KEYCODE_PROG_BLUE");
        sparsearray.append(187, "KEYCODE_APP_SWITCH");
        sparsearray.append(188, "KEYCODE_BUTTON_1");
        sparsearray.append(189, "KEYCODE_BUTTON_2");
        sparsearray.append(190, "KEYCODE_BUTTON_3");
        sparsearray.append(191, "KEYCODE_BUTTON_4");
        sparsearray.append(192, "KEYCODE_BUTTON_5");
        sparsearray.append(193, "KEYCODE_BUTTON_6");
        sparsearray.append(194, "KEYCODE_BUTTON_7");
        sparsearray.append(195, "KEYCODE_BUTTON_8");
        sparsearray.append(196, "KEYCODE_BUTTON_9");
        sparsearray.append(197, "KEYCODE_BUTTON_10");
        sparsearray.append(198, "KEYCODE_BUTTON_11");
        sparsearray.append(199, "KEYCODE_BUTTON_12");
        sparsearray.append(200, "KEYCODE_BUTTON_13");
        sparsearray.append(201, "KEYCODE_BUTTON_14");
        sparsearray.append(202, "KEYCODE_BUTTON_15");
        sparsearray.append(203, "KEYCODE_BUTTON_16");
        sparsearray.append(204, "KEYCODE_LANGUAGE_SWITCH");
        sparsearray.append(205, "KEYCODE_MANNER_MODE");
        sparsearray.append(206, "KEYCODE_3D_MODE");
        sparsearray.append(207, "KEYCODE_CONTACTS");
        sparsearray.append(208, "KEYCODE_CALENDAR");
        sparsearray.append(209, "KEYCODE_MUSIC");
        sparsearray.append(210, "KEYCODE_CALCULATOR");
        sparsearray.append(211, "KEYCODE_ZENKAKU_HANKAKU");
        sparsearray.append(212, "KEYCODE_EISU");
        sparsearray.append(213, "KEYCODE_MUHENKAN");
        sparsearray.append(214, "KEYCODE_HENKAN");
        sparsearray.append(215, "KEYCODE_KATAKANA_HIRAGANA");
        sparsearray.append(216, "KEYCODE_YEN");
        sparsearray.append(217, "KEYCODE_RO");
        sparsearray.append(218, "KEYCODE_KANA");
        sparsearray.append(219, "KEYCODE_ASSIST");
        sparsearray.append(249, "KEYCODE_SOS");
    }

    public volatile InputEvent copy()
    {
        return copy();
    }

    public KeyEvent copy()
    {
        return obtain(this);
    }

    public final boolean dispatch(Callback callback)
    {
        return dispatch(callback, null, null);
    }

    public final boolean dispatch(Callback callback, DispatcherState dispatcherstate, Object obj)
    {
        boolean flag = true;
        mAction;
        JVM INSTR tableswitch 0 2: default 32
    //                   0 38
    //                   1 134
    //                   2 155;
           goto _L1 _L2 _L3 _L4
_L1:
        flag = false;
_L6:
        return flag;
_L2:
        mFlags = 0xbfffffff & mFlags;
        flag = callback.onKeyDown(mKeyCode, this);
        if (dispatcherstate == null)
            continue; /* Loop/switch isn't completed */
        if (flag && mRepeatCount == 0 && (0x40000000 & mFlags) != 0)
        {
            dispatcherstate.startTracking(this, obj);
            return flag;
        }
        if (!isLongPress() || !dispatcherstate.isTracking(this))
            continue; /* Loop/switch isn't completed */
        int i;
        int j;
        boolean flag1;
        try
        {
            if (!callback.onKeyLongPress(mKeyCode, this))
                continue; /* Loop/switch isn't completed */
            dispatcherstate.performedLongPress(this);
        }
        catch (AbstractMethodError abstractmethoderror)
        {
            return flag;
        }
        return true;
_L3:
        if (dispatcherstate != null)
            dispatcherstate.handleUpEvent(this);
        return callback.onKeyUp(mKeyCode, this);
_L4:
        i = mRepeatCount;
        j = mKeyCode;
        if (!callback.onKeyMultiple(j, i, this))
            if (j != 0)
            {
                mAction = 0;
                mRepeatCount = 0;
                flag1 = callback.onKeyDown(j, this);
                if (flag1)
                {
                    mAction = ((flag) ? 1 : 0);
                    callback.onKeyUp(j, this);
                }
                mAction = 2;
                mRepeatCount = i;
                return flag1;
            } else
            {
                return false;
            }
        if (true) goto _L6; else goto _L5
_L5:
    }

    public final int getAction()
    {
        return mAction;
    }

    public final String getCharacters()
    {
        return mCharacters;
    }

    public final int getDeviceId()
    {
        return mDeviceId;
    }

    public char getDisplayLabel()
    {
        return getKeyCharacterMap().getDisplayLabel(mKeyCode);
    }

    public final long getDownTime()
    {
        return mDownTime;
    }

    public final long getEventTime()
    {
        return mEventTime;
    }

    public final long getEventTimeNano()
    {
        return 0xf4240L * mEventTime;
    }

    public final int getFlags()
    {
        return mFlags;
    }

    public final KeyCharacterMap getKeyCharacterMap()
    {
        return KeyCharacterMap.load(mDeviceId);
    }

    public final int getKeyCode()
    {
        return mKeyCode;
    }

    public boolean getKeyData(KeyCharacterMap.KeyData keydata)
    {
        return getKeyCharacterMap().getKeyData(mKeyCode, keydata);
    }

    public final int getKeyboardDevice()
    {
        return mDeviceId;
    }

    public char getMatch(char ac[])
    {
        return getMatch(ac, 0);
    }

    public char getMatch(char ac[], int i)
    {
        return getKeyCharacterMap().getMatch(mKeyCode, ac, i);
    }

    public final int getMetaState()
    {
        return mMetaState;
    }

    public final int getModifiers()
    {
        return 0x770ff & normalizeMetaState(mMetaState);
    }

    public char getNumber()
    {
        return getKeyCharacterMap().getNumber(mKeyCode);
    }

    public final int getRepeatCount()
    {
        return mRepeatCount;
    }

    public final int getScanCode()
    {
        return mScanCode;
    }

    public final int getSource()
    {
        return mSource;
    }

    public int getUnicodeChar()
    {
        return getUnicodeChar(mMetaState);
    }

    public int getUnicodeChar(int i)
    {
        return getKeyCharacterMap().get(mKeyCode, i);
    }

    public final boolean hasDefaultAction()
    {
        return native_hasDefaultAction(mKeyCode);
    }

    public final boolean hasModifiers(int i)
    {
        return metaStateHasModifiers(mMetaState, i);
    }

    public final boolean hasNoModifiers()
    {
        return metaStateHasNoModifiers(mMetaState);
    }

    public final boolean isAltPressed()
    {
        return (2 & mMetaState) != 0;
    }

    public final boolean isCanceled()
    {
        return (0x20 & mFlags) != 0;
    }

    public final boolean isCapsLockOn()
    {
        return (0x100000 & mMetaState) != 0;
    }

    public final boolean isCtrlPressed()
    {
        return (0x1000 & mMetaState) != 0;
    }

    public final boolean isDown()
    {
        return mAction == 0;
    }

    public final boolean isFunctionPressed()
    {
        return (8 & mMetaState) != 0;
    }

    public final boolean isLongPress()
    {
        return (0x80 & mFlags) != 0;
    }

    public final boolean isMetaPressed()
    {
        return (0x10000 & mMetaState) != 0;
    }

    public final boolean isNumLockOn()
    {
        return (0x200000 & mMetaState) != 0;
    }

    public boolean isPrintingKey()
    {
        return getKeyCharacterMap().isPrintingKey(mKeyCode);
    }

    public final boolean isScrollLockOn()
    {
        return (0x400000 & mMetaState) != 0;
    }

    public final boolean isShiftPressed()
    {
        return (1 & mMetaState) != 0;
    }

    public final boolean isSymPressed()
    {
        return (4 & mMetaState) != 0;
    }

    public final boolean isSystem()
    {
        return native_isSystemKey(mKeyCode);
    }

    public final boolean isTainted()
    {
        return (0x80000000 & mFlags) != 0;
    }

    public final boolean isTracking()
    {
        return (0x200 & mFlags) != 0;
    }

    public final void recycle()
    {
        recycle();
        mCharacters = null;
        synchronized (gRecyclerLock)
        {
            if (gRecyclerUsed < 10)
            {
                gRecyclerUsed = 1 + gRecyclerUsed;
                mNext = gRecyclerTop;
                gRecyclerTop = this;
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public final void recycleIfNeededAfterDispatch()
    {
    }

    public final void setSource(int i)
    {
        mSource = i;
    }

    public final void setTainted(boolean flag)
    {
        int i;
        if (flag)
            i = 0x80000000 | mFlags;
        else
            i = 0x7fffffff & mFlags;
        mFlags = i;
    }

    public final void startTracking()
    {
        mFlags = 0x40000000 | mFlags;
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("KeyEvent { action=").append(actionToString(mAction));
        stringbuilder.append(", keyCode=").append(keyCodeToString(mKeyCode));
        stringbuilder.append(", scanCode=").append(mScanCode);
        if (mCharacters != null)
            stringbuilder.append(", characters=\"").append(mCharacters).append("\"");
        stringbuilder.append(", metaState=").append(metaStateToString(mMetaState));
        stringbuilder.append(", flags=0x").append(Integer.toHexString(mFlags));
        stringbuilder.append(", repeatCount=").append(mRepeatCount);
        stringbuilder.append(", eventTime=").append(mEventTime);
        stringbuilder.append(", downTime=").append(mDownTime);
        stringbuilder.append(", deviceId=").append(mDeviceId);
        stringbuilder.append(", source=0x").append(Integer.toHexString(mSource));
        stringbuilder.append(" }");
        return stringbuilder.toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeInt(2);
        parcel.writeInt(mDeviceId);
        parcel.writeInt(mSource);
        parcel.writeInt(mAction);
        parcel.writeInt(mKeyCode);
        parcel.writeInt(mRepeatCount);
        parcel.writeInt(mMetaState);
        parcel.writeInt(mScanCode);
        parcel.writeInt(mFlags);
        parcel.writeLong(mDownTime);
        parcel.writeLong(mEventTime);
    }

    static 
    {
        populateKeycodeSymbolicNames();
    }


/*
    static int access$076(KeyEvent keyevent, int i)
    {
        int j = i | keyevent.mFlags;
        keyevent.mFlags = j;
        return j;
    }

*/
}
