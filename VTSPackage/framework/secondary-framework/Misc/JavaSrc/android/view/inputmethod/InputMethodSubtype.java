// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.inputmethod;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Slog;
import java.util.*;

// Referenced classes of package android.view.inputmethod:
//            InputMethodInfo

public final class InputMethodSubtype
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public InputMethodSubtype createFromParcel(Parcel parcel)
        {
            return new InputMethodSubtype(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public InputMethodSubtype[] newArray(int i)
        {
            return new InputMethodSubtype[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final String EXTRA_KEY_UNTRANSLATABLE_STRING_IN_SUBTYPE_NAME = "UntranslatableReplacementStringInSubtypeName";
    private static final String EXTRA_VALUE_KEY_VALUE_SEPARATOR = "=";
    private static final String EXTRA_VALUE_PAIR_SEPARATOR = ",";
    private static final String TAG = android/view/inputmethod/InputMethodSubtype.getSimpleName();
    private volatile HashMap mExtraValueHashMapCache;
    private final boolean mIsAuxiliary;
    private final boolean mOverridesImplicitlyEnabledSubtype;
    private final String mSubtypeExtraValue;
    private final int mSubtypeHashCode;
    private final int mSubtypeIconResId;
    private final int mSubtypeId;
    private final String mSubtypeLocale;
    private final String mSubtypeMode;
    private final int mSubtypeNameResId;

    public InputMethodSubtype(int i, int j, String s, String s1, String s2, boolean flag)
    {
        this(i, j, s, s1, s2, flag, false);
    }

    public InputMethodSubtype(int i, int j, String s, String s1, String s2, boolean flag, boolean flag1)
    {
        this(i, j, s, s1, s2, flag, flag1, 0);
    }

    public InputMethodSubtype(int i, int j, String s, String s1, String s2, boolean flag, boolean flag1, 
            int k)
    {
        mSubtypeNameResId = i;
        mSubtypeIconResId = j;
        if (s == null)
            s = "";
        mSubtypeLocale = s;
        if (s1 == null)
            s1 = "";
        mSubtypeMode = s1;
        if (s2 == null)
            s2 = "";
        mSubtypeExtraValue = s2;
        mIsAuxiliary = flag;
        mOverridesImplicitlyEnabledSubtype = flag1;
        int l;
        if (k != 0)
            l = k;
        else
            l = hashCodeInternal(mSubtypeLocale, mSubtypeMode, mSubtypeExtraValue, mIsAuxiliary, mOverridesImplicitlyEnabledSubtype);
        mSubtypeHashCode = l;
        mSubtypeId = k;
    }

    InputMethodSubtype(Parcel parcel)
    {
        boolean flag = true;
        super();
        mSubtypeNameResId = parcel.readInt();
        mSubtypeIconResId = parcel.readInt();
        String s = parcel.readString();
        if (s == null)
            s = "";
        mSubtypeLocale = s;
        String s1 = parcel.readString();
        if (s1 == null)
            s1 = "";
        mSubtypeMode = s1;
        String s2 = parcel.readString();
        if (s2 == null)
            s2 = "";
        mSubtypeExtraValue = s2;
        boolean flag1;
        if (parcel.readInt() == flag)
            flag1 = flag;
        else
            flag1 = false;
        mIsAuxiliary = flag1;
        if (parcel.readInt() != flag)
            flag = false;
        mOverridesImplicitlyEnabledSubtype = flag;
        mSubtypeHashCode = parcel.readInt();
        mSubtypeId = parcel.readInt();
    }

    private static Locale constructLocaleFromString(String s)
    {
        if (!TextUtils.isEmpty(s))
        {
            String as[] = s.split("_", 3);
            if (as.length == 1)
                return new Locale(as[0]);
            if (as.length == 2)
                return new Locale(as[0], as[1]);
            if (as.length == 3)
                return new Locale(as[0], as[1], as[2]);
        }
        return null;
    }

    private HashMap getExtraValueHashMap()
    {
        if (mExtraValueHashMapCache != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorenter ;
        if (mExtraValueHashMapCache != null) goto _L4; else goto _L3
_L3:
        String as[];
        int i;
        mExtraValueHashMapCache = new HashMap();
        as = mSubtypeExtraValue.split(",");
        i = as.length;
        int j = 0;
_L10:
        if (j >= i) goto _L4; else goto _L5
_L5:
        String as1[] = as[j].split("=");
        if (as1.length != 1) goto _L7; else goto _L6
_L6:
        mExtraValueHashMapCache.put(as1[0], null);
          goto _L8
_L7:
        if (as1.length > 1)
        {
            if (as1.length > 2)
                Slog.w(TAG, "ExtraValue has two or more '='s");
            mExtraValueHashMapCache.put(as1[0], as1[1]);
        }
          goto _L8
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        this;
        JVM INSTR monitorexit ;
_L2:
        return mExtraValueHashMapCache;
_L8:
        j++;
        if (true) goto _L10; else goto _L9
_L9:
    }

    private static int hashCodeInternal(String s, String s1, String s2, boolean flag, boolean flag1)
    {
        Object aobj[] = new Object[5];
        aobj[0] = s;
        aobj[1] = s1;
        aobj[2] = s2;
        aobj[3] = Boolean.valueOf(flag);
        aobj[4] = Boolean.valueOf(flag1);
        return Arrays.hashCode(aobj);
    }

    public static List sort(Context context, int i, InputMethodInfo inputmethodinfo, List list)
    {
        if (inputmethodinfo == null)
            return list;
        HashSet hashset = new HashSet(list);
        ArrayList arraylist = new ArrayList();
        int j = inputmethodinfo.getSubtypeCount();
        for (int k = 0; k < j; k++)
        {
            InputMethodSubtype inputmethodsubtype = inputmethodinfo.getSubtypeAt(k);
            if (hashset.contains(inputmethodsubtype))
            {
                arraylist.add(inputmethodsubtype);
                hashset.remove(inputmethodsubtype);
            }
        }

        for (Iterator iterator = hashset.iterator(); iterator.hasNext(); arraylist.add((InputMethodSubtype)iterator.next()));
        return arraylist;
    }

    public boolean containsExtraValueKey(String s)
    {
        return getExtraValueHashMap().containsKey(s);
    }

    public int describeContents()
    {
        return 0;
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof InputMethodSubtype)
        {
            InputMethodSubtype inputmethodsubtype = (InputMethodSubtype)obj;
            if (inputmethodsubtype.mSubtypeId == 0 && mSubtypeId == 0)
            {
                if (inputmethodsubtype.hashCode() != hashCode() || inputmethodsubtype.getNameResId() != getNameResId() || !inputmethodsubtype.getMode().equals(getMode()) || inputmethodsubtype.getIconResId() != getIconResId() || !inputmethodsubtype.getLocale().equals(getLocale()) || !inputmethodsubtype.getExtraValue().equals(getExtraValue()) || inputmethodsubtype.isAuxiliary() != isAuxiliary())
                    return false;
            } else
            if (inputmethodsubtype.hashCode() != hashCode())
                return false;
            return true;
        } else
        {
            return false;
        }
    }

    public CharSequence getDisplayName(Context context, String s, ApplicationInfo applicationinfo)
    {
        String s1;
        Locale locale = constructLocaleFromString(mSubtypeLocale);
        if (locale != null)
            s1 = locale.getDisplayName();
        else
            s1 = mSubtypeLocale;
        if (mSubtypeNameResId != 0) goto _L2; else goto _L1
_L1:
        CharSequence charsequence;
        return s1;
_L2:
        if (TextUtils.isEmpty(charsequence = context.getPackageManager().getText(s, mSubtypeNameResId, applicationinfo))) goto _L1; else goto _L3
_L3:
        String s2;
        String s3;
        Object aobj[];
        if (containsExtraValueKey("UntranslatableReplacementStringInSubtypeName"))
            s2 = getExtraValueOf("UntranslatableReplacementStringInSubtypeName");
        else
            s2 = s1;
        s3 = charsequence.toString();
        aobj = new Object[1];
        if (s2 == null)
            s2 = "";
        try
        {
            aobj[0] = s2;
            return String.format(s3, aobj);
        }
        catch (IllegalFormatException illegalformatexception)
        {
            Slog.w(TAG, (new StringBuilder()).append("Found illegal format in subtype name(").append(charsequence).append("): ").append(illegalformatexception).toString());
        }
        return "";
    }

    public String getExtraValue()
    {
        return mSubtypeExtraValue;
    }

    public String getExtraValueOf(String s)
    {
        return (String)getExtraValueHashMap().get(s);
    }

    public int getIconResId()
    {
        return mSubtypeIconResId;
    }

    public String getLocale()
    {
        return mSubtypeLocale;
    }

    public String getMode()
    {
        return mSubtypeMode;
    }

    public int getNameResId()
    {
        return mSubtypeNameResId;
    }

    public int hashCode()
    {
        return mSubtypeHashCode;
    }

    public boolean isAuxiliary()
    {
        return mIsAuxiliary;
    }

    public boolean overridesImplicitlyEnabledSubtype()
    {
        return mOverridesImplicitlyEnabledSubtype;
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        int j = 1;
        parcel.writeInt(mSubtypeNameResId);
        parcel.writeInt(mSubtypeIconResId);
        parcel.writeString(mSubtypeLocale);
        parcel.writeString(mSubtypeMode);
        parcel.writeString(mSubtypeExtraValue);
        int k;
        if (mIsAuxiliary)
            k = j;
        else
            k = 0;
        parcel.writeInt(k);
        if (!mOverridesImplicitlyEnabledSubtype)
            j = 0;
        parcel.writeInt(j);
        parcel.writeInt(mSubtypeHashCode);
        parcel.writeInt(mSubtypeId);
    }

}
