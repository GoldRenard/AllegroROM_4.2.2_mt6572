// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.textservice;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Slog;
import java.util.*;

// Referenced classes of package android.view.textservice:
//            SpellCheckerInfo

public final class SpellCheckerSubtype
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public SpellCheckerSubtype createFromParcel(Parcel parcel)
        {
            return new SpellCheckerSubtype(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public SpellCheckerSubtype[] newArray(int i)
        {
            return new SpellCheckerSubtype[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final String EXTRA_VALUE_KEY_VALUE_SEPARATOR = "=";
    private static final String EXTRA_VALUE_PAIR_SEPARATOR = ",";
    private static final String TAG = android/view/textservice/SpellCheckerSubtype.getSimpleName();
    private HashMap mExtraValueHashMapCache;
    private final String mSubtypeExtraValue;
    private final int mSubtypeHashCode;
    private final String mSubtypeLocale;
    private final int mSubtypeNameResId;

    public SpellCheckerSubtype(int i, String s, String s1)
    {
        mSubtypeNameResId = i;
        if (s == null)
            s = "";
        mSubtypeLocale = s;
        if (s1 == null)
            s1 = "";
        mSubtypeExtraValue = s1;
        mSubtypeHashCode = hashCodeInternal(mSubtypeLocale, mSubtypeExtraValue);
    }

    SpellCheckerSubtype(Parcel parcel)
    {
        mSubtypeNameResId = parcel.readInt();
        String s = parcel.readString();
        if (s == null)
            s = "";
        mSubtypeLocale = s;
        String s1 = parcel.readString();
        if (s1 == null)
            s1 = "";
        mSubtypeExtraValue = s1;
        mSubtypeHashCode = hashCodeInternal(mSubtypeLocale, mSubtypeExtraValue);
    }

    public static Locale constructLocaleFromString(String s)
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
        if (mExtraValueHashMapCache == null)
        {
            mExtraValueHashMapCache = new HashMap();
            String as[] = mSubtypeExtraValue.split(",");
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                String as1[] = as[j].split("=");
                if (as1.length == 1)
                {
                    mExtraValueHashMapCache.put(as1[0], null);
                    continue;
                }
                if (as1.length <= 1)
                    continue;
                if (as1.length > 2)
                    Slog.w(TAG, "ExtraValue has two or more '='s");
                mExtraValueHashMapCache.put(as1[0], as1[1]);
            }

        }
        return mExtraValueHashMapCache;
    }

    private static int hashCodeInternal(String s, String s1)
    {
        return Arrays.hashCode(new Object[] {
            s, s1
        });
    }

    public static List sort(Context context, int i, SpellCheckerInfo spellcheckerinfo, List list)
    {
        if (spellcheckerinfo == null)
            return list;
        HashSet hashset = new HashSet(list);
        ArrayList arraylist = new ArrayList();
        int j = spellcheckerinfo.getSubtypeCount();
        for (int k = 0; k < j; k++)
        {
            SpellCheckerSubtype spellcheckersubtype = spellcheckerinfo.getSubtypeAt(k);
            if (hashset.contains(spellcheckersubtype))
            {
                arraylist.add(spellcheckersubtype);
                hashset.remove(spellcheckersubtype);
            }
        }

        for (Iterator iterator = hashset.iterator(); iterator.hasNext(); arraylist.add((SpellCheckerSubtype)iterator.next()));
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
        boolean flag = obj instanceof SpellCheckerSubtype;
        boolean flag1 = false;
        if (flag)
        {
            SpellCheckerSubtype spellcheckersubtype = (SpellCheckerSubtype)obj;
            int i = spellcheckersubtype.hashCode();
            int j = hashCode();
            flag1 = false;
            if (i == j)
            {
                int k = spellcheckersubtype.getNameResId();
                int l = getNameResId();
                flag1 = false;
                if (k == l)
                {
                    boolean flag2 = spellcheckersubtype.getLocale().equals(getLocale());
                    flag1 = false;
                    if (flag2)
                    {
                        boolean flag3 = spellcheckersubtype.getExtraValue().equals(getExtraValue());
                        flag1 = false;
                        if (flag3)
                            flag1 = true;
                    }
                }
            }
        }
        return flag1;
    }

    public CharSequence getDisplayName(Context context, String s, ApplicationInfo applicationinfo)
    {
        Locale locale = constructLocaleFromString(mSubtypeLocale);
        String s1;
        if (locale != null)
            s1 = locale.getDisplayName();
        else
            s1 = mSubtypeLocale;
        if (mSubtypeNameResId != 0)
        {
            CharSequence charsequence = context.getPackageManager().getText(s, mSubtypeNameResId, applicationinfo);
            if (!TextUtils.isEmpty(charsequence))
                return String.format(charsequence.toString(), new Object[] {
                    s1
                });
        }
        return s1;
    }

    public String getExtraValue()
    {
        return mSubtypeExtraValue;
    }

    public String getExtraValueOf(String s)
    {
        return (String)getExtraValueHashMap().get(s);
    }

    public String getLocale()
    {
        return mSubtypeLocale;
    }

    public int getNameResId()
    {
        return mSubtypeNameResId;
    }

    public int hashCode()
    {
        return mSubtypeHashCode;
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeInt(mSubtypeNameResId);
        parcel.writeString(mSubtypeLocale);
        parcel.writeString(mSubtypeExtraValue);
    }

}
