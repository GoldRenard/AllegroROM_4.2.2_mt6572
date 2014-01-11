// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.util.*;

// Referenced classes of package com.google.common.base:
//            Predicate, Preconditions, Platform

public abstract class CharMatcher
    implements Predicate
{
    private static class And extends CharMatcher
    {

        List components;

        public CharMatcher and(CharMatcher charmatcher)
        {
            ArrayList arraylist = new ArrayList(components);
            arraylist.add(Preconditions.checkNotNull(charmatcher));
            return new And(arraylist);
        }

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public boolean matches(char c)
        {
            for (Iterator iterator = components.iterator(); iterator.hasNext();)
                if (!((CharMatcher)iterator.next()).matches(c))
                    return false;

            return true;
        }

        And(List list)
        {
            components = list;
        }
    }

    private static final class LookupTable
    {

        int data[];

        boolean get(char c)
        {
            return (data[c >> 5] & 1 << c) != 0;
        }

        void set(char c)
        {
            int ai[] = data;
            int i = c >> 5;
            ai[i] = ai[i] | 1 << c;
        }

        private LookupTable()
        {
            data = new int[2048];
        }

    }

    private static class Or extends CharMatcher
    {

        List components;

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public boolean matches(char c)
        {
            for (Iterator iterator = components.iterator(); iterator.hasNext();)
                if (((CharMatcher)iterator.next()).matches(c))
                    return true;

            return false;
        }

        public CharMatcher or(CharMatcher charmatcher)
        {
            ArrayList arraylist = new ArrayList(components);
            arraylist.add(Preconditions.checkNotNull(charmatcher));
            return new Or(arraylist);
        }

        void setBits(LookupTable lookuptable)
        {
            for (Iterator iterator = components.iterator(); iterator.hasNext(); ((CharMatcher)iterator.next()).setBits(lookuptable));
        }

        Or(List list)
        {
            components = list;
        }
    }


    public static final CharMatcher ANY = new CharMatcher() {

        public CharMatcher and(CharMatcher charmatcher1)
        {
            return (CharMatcher)Preconditions.checkNotNull(charmatcher1);
        }

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public String collapseFrom(CharSequence charsequence, char c1)
        {
            if (charsequence.length() == 0)
                return "";
            else
                return String.valueOf(c1);
        }

        public int countIn(CharSequence charsequence)
        {
            return charsequence.length();
        }

        public int indexIn(CharSequence charsequence)
        {
            return charsequence.length() != 0 ? 0 : -1;
        }

        public int indexIn(CharSequence charsequence, int k)
        {
            int l = charsequence.length();
            Preconditions.checkPositionIndex(k, l);
            if (k == l)
                k = -1;
            return k;
        }

        public int lastIndexIn(CharSequence charsequence)
        {
            return -1 + charsequence.length();
        }

        public boolean matches(char c1)
        {
            return true;
        }

        public boolean matchesAllOf(CharSequence charsequence)
        {
            Preconditions.checkNotNull(charsequence);
            return true;
        }

        public boolean matchesNoneOf(CharSequence charsequence)
        {
            return charsequence.length() == 0;
        }

        public CharMatcher negate()
        {
            return NONE;
        }

        public CharMatcher or(CharMatcher charmatcher1)
        {
            Preconditions.checkNotNull(charmatcher1);
            return this;
        }

        public CharMatcher precomputed()
        {
            return this;
        }

        public String removeFrom(CharSequence charsequence)
        {
            Preconditions.checkNotNull(charsequence);
            return "";
        }

        public String replaceFrom(CharSequence charsequence, char c1)
        {
            char ac1[] = new char[charsequence.length()];
            Arrays.fill(ac1, c1);
            return new String(ac1);
        }

        public String replaceFrom(CharSequence charsequence, CharSequence charsequence1)
        {
            StringBuilder stringbuilder = new StringBuilder(charsequence.length() * charsequence1.length());
            for (int k = 0; k < charsequence.length(); k++)
                stringbuilder.append(charsequence1);

            return stringbuilder.toString();
        }

        public String trimFrom(CharSequence charsequence)
        {
            Preconditions.checkNotNull(charsequence);
            return "";
        }

    }
;
    public static final CharMatcher ASCII = inRange('\0', '\177');
    public static final CharMatcher BREAKING_WHITESPACE = anyOf("\t\n\013\f\r \205\u1680\u2028\u2029\u205F\u3000").or(inRange('\u2000', '\u2006')).or(inRange('\u2008', '\u200A')).precomputed();
    private static final String BREAKING_WHITESPACE_CHARS = "\t\n\013\f\r \205\u1680\u2028\u2029\u205F\u3000";
    public static final CharMatcher DIGIT;
    public static final CharMatcher INVISIBLE = inRange('\0', ' ').or(inRange('\177', '\240')).or(is('\255')).or(inRange('\u0600', '\u0603')).or(anyOf("\u06DD\u070F\u1680\u17B4\u17B5\u180E")).or(inRange('\u2000', '\u200F')).or(inRange('\u2028', '\u202F')).or(inRange('\u205F', '\u2064')).or(inRange('\u206A', '\u206F')).or(is('\u3000')).or(inRange('\uD800', '\uF8FF')).or(anyOf("\uFEFF\uFFF9\uFFFA\uFFFB")).precomputed();
    public static final CharMatcher JAVA_DIGIT = new CharMatcher() {

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public boolean matches(char c1)
        {
            return Character.isDigit(c1);
        }

    }
;
    public static final CharMatcher JAVA_ISO_CONTROL = inRange('\0', '\037').or(inRange('\177', '\237'));
    public static final CharMatcher JAVA_LETTER = new CharMatcher() {

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public boolean matches(char c1)
        {
            return Character.isLetter(c1);
        }

    }
;
    public static final CharMatcher JAVA_LETTER_OR_DIGIT = new CharMatcher() {

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public boolean matches(char c1)
        {
            return Character.isLetterOrDigit(c1);
        }

    }
;
    public static final CharMatcher JAVA_LOWER_CASE = new CharMatcher() {

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public boolean matches(char c1)
        {
            return Character.isLowerCase(c1);
        }

    }
;
    public static final CharMatcher JAVA_UPPER_CASE = new CharMatcher() {

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public boolean matches(char c1)
        {
            return Character.isUpperCase(c1);
        }

    }
;
    public static final CharMatcher NONE = new CharMatcher() {

        public CharMatcher and(CharMatcher charmatcher1)
        {
            Preconditions.checkNotNull(charmatcher1);
            return this;
        }

        public volatile boolean apply(Object obj)
        {
            return apply((Character)obj);
        }

        public String collapseFrom(CharSequence charsequence, char c1)
        {
            return charsequence.toString();
        }

        public int countIn(CharSequence charsequence)
        {
            Preconditions.checkNotNull(charsequence);
            return 0;
        }

        public int indexIn(CharSequence charsequence)
        {
            Preconditions.checkNotNull(charsequence);
            return -1;
        }

        public int indexIn(CharSequence charsequence, int k)
        {
            Preconditions.checkPositionIndex(k, charsequence.length());
            return -1;
        }

        public int lastIndexIn(CharSequence charsequence)
        {
            Preconditions.checkNotNull(charsequence);
            return -1;
        }

        public boolean matches(char c1)
        {
            return false;
        }

        public boolean matchesAllOf(CharSequence charsequence)
        {
            return charsequence.length() == 0;
        }

        public boolean matchesNoneOf(CharSequence charsequence)
        {
            Preconditions.checkNotNull(charsequence);
            return true;
        }

        public CharMatcher negate()
        {
            return ANY;
        }

        public CharMatcher or(CharMatcher charmatcher1)
        {
            return (CharMatcher)Preconditions.checkNotNull(charmatcher1);
        }

        public CharMatcher precomputed()
        {
            return this;
        }

        public String removeFrom(CharSequence charsequence)
        {
            return charsequence.toString();
        }

        public String replaceFrom(CharSequence charsequence, char c1)
        {
            return charsequence.toString();
        }

        public String replaceFrom(CharSequence charsequence, CharSequence charsequence1)
        {
            Preconditions.checkNotNull(charsequence1);
            return charsequence.toString();
        }

        void setBits(LookupTable lookuptable)
        {
        }

        public String trimFrom(CharSequence charsequence)
        {
            return charsequence.toString();
        }

    }
;
    private static final String NON_BREAKING_WHITESPACE_CHARS = "\240\u180E\u202F";
    public static final CharMatcher SINGLE_WIDTH = inRange('\0', '\u04F9').or(is('\u05BE')).or(inRange('\u05D0', '\u05EA')).or(is('\u05F3')).or(is('\u05F4')).or(inRange('\u0600', '\u06FF')).or(inRange('\u0750', '\u077F')).or(inRange('\u0E00', '\u0E7F')).or(inRange('\u1E00', '\u20AF')).or(inRange('\u2100', '\u213A')).or(inRange('\uFB50', '\uFDFF')).or(inRange('\uFE70', '\uFEFF')).or(inRange('\uFF61', '\uFFDC')).precomputed();
    public static final CharMatcher WHITESPACE = anyOf("\t\n\013\f\r \205\u1680\u2028\u2029\u205F\u3000\240\u180E\u202F").or(inRange('\u2000', '\u200A')).precomputed();


    public static CharMatcher anyOf(CharSequence charsequence)
    {
        switch (charsequence.length())
        {
        case 2: // '\002'
            return new CharMatcher(charsequence.charAt(0), charsequence.charAt(1)) {

                final char val$match1;
                final char val$match2;

                public volatile boolean apply(Object obj)
                {
                    return apply((Character)obj);
                }

                public boolean matches(char c)
                {
                    return c == match1 || c == match2;
                }

                public CharMatcher precomputed()
                {
                    return this;
                }

                void setBits(LookupTable lookuptable)
                {
                    lookuptable.set(match1);
                    lookuptable.set(match2);
                }

            
            {
                match1 = c;
                match2 = c1;
                super();
            }
            }
;

        case 1: // '\001'
            return is(charsequence.charAt(0));

        case 0: // '\0'
            return NONE;
        }
        char ac[] = charsequence.toString().toCharArray();
        Arrays.sort(ac);
        return new CharMatcher(ac) {

            final char val$chars[];

            public volatile boolean apply(Object obj)
            {
                return apply((Character)obj);
            }

            public boolean matches(char c)
            {
                return Arrays.binarySearch(chars, c) >= 0;
            }

            void setBits(LookupTable lookuptable)
            {
                char ac1[] = chars;
                int i = ac1.length;
                for (int j = 0; j < i; j++)
                    lookuptable.set(ac1[j]);

            }

            
            {
                chars = ac;
                super();
            }
        }
;
    }

    public static CharMatcher forPredicate(Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        if (predicate instanceof CharMatcher)
            return (CharMatcher)predicate;
        else
            return new CharMatcher(predicate) {

                final Predicate val$predicate;

                public boolean apply(Character character)
                {
                    return predicate.apply(Preconditions.checkNotNull(character));
                }

                public volatile boolean apply(Object obj)
                {
                    return apply((Character)obj);
                }

                public boolean matches(char c)
                {
                    return predicate.apply(Character.valueOf(c));
                }

            
            {
                predicate = predicate1;
                super();
            }
            }
;
    }

    public static CharMatcher inRange(char c, char c1)
    {
        boolean flag;
        if (c1 >= c)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        return new CharMatcher(c, c1) {

            final char val$endInclusive;
            final char val$startInclusive;

            public volatile boolean apply(Object obj)
            {
                return apply((Character)obj);
            }

            public boolean matches(char c2)
            {
                return startInclusive <= c2 && c2 <= endInclusive;
            }

            public CharMatcher precomputed()
            {
                return this;
            }

            void setBits(LookupTable lookuptable)
            {
                char c2 = startInclusive;
                do
                {
                    lookuptable.set(c2);
                    char c3 = (char)(c2 + 1);
                    if (c2 == endInclusive)
                        return;
                    c2 = c3;
                } while (true);
            }

            
            {
                startInclusive = c;
                endInclusive = c1;
                super();
            }
        }
;
    }

    public static CharMatcher is(char c)
    {
        return new CharMatcher(c) {

            final char val$match;

            public CharMatcher and(CharMatcher charmatcher)
            {
                if (charmatcher.matches(match))
                    return this;
                else
                    return NONE;
            }

            public volatile boolean apply(Object obj)
            {
                return apply((Character)obj);
            }

            public boolean matches(char c1)
            {
                return c1 == match;
            }

            public CharMatcher negate()
            {
                return isNot(match);
            }

            public CharMatcher or(CharMatcher charmatcher)
            {
                if (charmatcher.matches(match))
                    return charmatcher;
                else
                    return or(charmatcher);
            }

            public CharMatcher precomputed()
            {
                return this;
            }

            public String replaceFrom(CharSequence charsequence, char c1)
            {
                return charsequence.toString().replace(match, c1);
            }

            void setBits(LookupTable lookuptable)
            {
                lookuptable.set(match);
            }

            
            {
                match = c;
                super();
            }
        }
;
    }

    public static CharMatcher isNot(char c)
    {
        return new CharMatcher(c) {

            final char val$match;

            public CharMatcher and(CharMatcher charmatcher)
            {
                if (charmatcher.matches(match))
                    charmatcher = and(charmatcher);
                return charmatcher;
            }

            public volatile boolean apply(Object obj)
            {
                return apply((Character)obj);
            }

            public boolean matches(char c1)
            {
                return c1 != match;
            }

            public CharMatcher negate()
            {
                return is(match);
            }

            public CharMatcher or(CharMatcher charmatcher)
            {
                if (charmatcher.matches(match))
                    this = ANY;
                return this;
            }

            
            {
                match = c;
                super();
            }
        }
;
    }

    public static CharMatcher noneOf(CharSequence charsequence)
    {
        return anyOf(charsequence).negate();
    }

    public CharMatcher and(CharMatcher charmatcher)
    {
        CharMatcher acharmatcher[] = new CharMatcher[2];
        acharmatcher[0] = this;
        acharmatcher[1] = (CharMatcher)Preconditions.checkNotNull(charmatcher);
        return new And(Arrays.asList(acharmatcher));
    }

    public boolean apply(Character character)
    {
        return matches(character.charValue());
    }

    public volatile boolean apply(Object obj)
    {
        return apply((Character)obj);
    }

    public String collapseFrom(CharSequence charsequence, char c)
    {
        int i = indexIn(charsequence);
        if (i == -1)
            return charsequence.toString();
        StringBuilder stringbuilder = (new StringBuilder(charsequence.length())).append(charsequence.subSequence(0, i)).append(c);
        boolean flag = true;
        for (int j = i + 1; j < charsequence.length(); j++)
        {
            char c1 = charsequence.charAt(j);
            if (apply(Character.valueOf(c1)))
            {
                if (!flag)
                {
                    stringbuilder.append(c);
                    flag = true;
                }
            } else
            {
                stringbuilder.append(c1);
                flag = false;
            }
        }

        return stringbuilder.toString();
    }

    public int countIn(CharSequence charsequence)
    {
        int i = 0;
        for (int j = 0; j < charsequence.length(); j++)
            if (matches(charsequence.charAt(j)))
                i++;

        return i;
    }

    public int indexIn(CharSequence charsequence)
    {
        int i = charsequence.length();
        for (int j = 0; j < i; j++)
            if (matches(charsequence.charAt(j)))
                return j;

        return -1;
    }

    public int indexIn(CharSequence charsequence, int i)
    {
        int j = charsequence.length();
        Preconditions.checkPositionIndex(i, j);
        for (int k = i; k < j; k++)
            if (matches(charsequence.charAt(k)))
                return k;

        return -1;
    }

    public int lastIndexIn(CharSequence charsequence)
    {
        for (int i = -1 + charsequence.length(); i >= 0; i--)
            if (matches(charsequence.charAt(i)))
                return i;

        return -1;
    }

    public abstract boolean matches(char c);

    public boolean matchesAllOf(CharSequence charsequence)
    {
        for (int i = -1 + charsequence.length(); i >= 0; i--)
            if (!matches(charsequence.charAt(i)))
                return false;

        return true;
    }

    public boolean matchesAnyOf(CharSequence charsequence)
    {
        return !matchesNoneOf(charsequence);
    }

    public boolean matchesNoneOf(CharSequence charsequence)
    {
        return indexIn(charsequence) == -1;
    }

    public CharMatcher negate()
    {
        return new CharMatcher() {

            final CharMatcher this$0;
            final CharMatcher val$original;

            public volatile boolean apply(Object obj)
            {
                return apply((Character)obj);
            }

            public int countIn(CharSequence charsequence)
            {
                return charsequence.length() - original.countIn(charsequence);
            }

            public boolean matches(char c)
            {
                return !original.matches(c);
            }

            public boolean matchesAllOf(CharSequence charsequence)
            {
                return original.matchesNoneOf(charsequence);
            }

            public boolean matchesNoneOf(CharSequence charsequence)
            {
                return original.matchesAllOf(charsequence);
            }

            public CharMatcher negate()
            {
                return original;
            }

            
            {
                this$0 = CharMatcher.this;
                original = charmatcher1;
                super();
            }
        }
;
    }

    public CharMatcher or(CharMatcher charmatcher)
    {
        CharMatcher acharmatcher[] = new CharMatcher[2];
        acharmatcher[0] = this;
        acharmatcher[1] = (CharMatcher)Preconditions.checkNotNull(charmatcher);
        return new Or(Arrays.asList(acharmatcher));
    }

    public CharMatcher precomputed()
    {
        return Platform.precomputeCharMatcher(this);
    }

    CharMatcher precomputedInternal()
    {
        final LookupTable table = new LookupTable();
        setBits(table);
        return new CharMatcher() {

            final CharMatcher this$0;
            final LookupTable val$table;

            public volatile boolean apply(Object obj)
            {
                return apply((Character)obj);
            }

            public boolean matches(char c)
            {
                return table.get(c);
            }

            public CharMatcher precomputed()
            {
                return this;
            }

            
            {
                this$0 = CharMatcher.this;
                table = lookuptable;
                super();
            }
        }
;
    }

    public String removeFrom(CharSequence charsequence)
    {
        int i;
        char ac[];
        int j;
        String s = charsequence.toString();
        i = indexIn(s);
        if (i == -1)
            return s;
        ac = s.toCharArray();
        j = 1;
_L2:
        i++;
        do
        {
label0:
            {
                if (i == ac.length)
                    return new String(ac, 0, i - j);
                if (!matches(ac[i]))
                    break label0;
                j++;
            }
            if (true)
                continue;
            ac[i - j] = ac[i];
            i++;
        } while (true);
        if (true) goto _L2; else goto _L1
_L1:
    }

    public String replaceFrom(CharSequence charsequence, char c)
    {
        String s = charsequence.toString();
        int i = indexIn(s);
        if (i == -1)
            return s;
        char ac[] = s.toCharArray();
        ac[i] = c;
        for (int j = i + 1; j < ac.length; j++)
            if (matches(ac[j]))
                ac[j] = c;

        return new String(ac);
    }

    public String replaceFrom(CharSequence charsequence, CharSequence charsequence1)
    {
        int i = charsequence1.length();
        String s;
        if (i == 0)
        {
            s = removeFrom(charsequence);
        } else
        {
            if (i == 1)
                return replaceFrom(charsequence, charsequence1.charAt(0));
            s = charsequence.toString();
            int j = indexIn(s);
            if (j != -1)
            {
                int k = s.length();
                StringBuilder stringbuilder = new StringBuilder(16 + (k * 3) / 2);
                int l = 0;
                do
                {
                    stringbuilder.append(s, l, j);
                    stringbuilder.append(charsequence1);
                    l = j + 1;
                    j = indexIn(s, l);
                } while (j != -1);
                stringbuilder.append(s, l, k);
                return stringbuilder.toString();
            }
        }
        return s;
    }

    public String retainFrom(CharSequence charsequence)
    {
        return negate().removeFrom(charsequence);
    }

    void setBits(LookupTable lookuptable)
    {
        char c = '\0';
        do
        {
            if (matches(c))
                lookuptable.set(c);
            char c1 = (char)(c + 1);
            if (c == '\uFFFF')
                return;
            c = c1;
        } while (true);
    }

    public String trimAndCollapseFrom(CharSequence charsequence, char c)
    {
        int i = negate().indexIn(charsequence);
        if (i == -1)
            return "";
        StringBuilder stringbuilder = new StringBuilder(charsequence.length());
        boolean flag = false;
        for (int j = i; j < charsequence.length(); j++)
        {
            char c1 = charsequence.charAt(j);
            if (apply(Character.valueOf(c1)))
            {
                flag = true;
                continue;
            }
            if (flag)
            {
                stringbuilder.append(c);
                flag = false;
            }
            stringbuilder.append(c1);
        }

        return stringbuilder.toString();
    }

    public String trimFrom(CharSequence charsequence)
    {
        int i = charsequence.length();
        int j;
        for (j = 0; j < i && matches(charsequence.charAt(j)); j++);
        int k;
        for (k = i - 1; k > j && matches(charsequence.charAt(k)); k--);
        return charsequence.subSequence(j, k + 1).toString();
    }

    public String trimLeadingFrom(CharSequence charsequence)
    {
        int i = charsequence.length();
        int j;
        for (j = 0; j < i && matches(charsequence.charAt(j)); j++);
        return charsequence.subSequence(j, i).toString();
    }

    public String trimTrailingFrom(CharSequence charsequence)
    {
        int i;
        for (i = -1 + charsequence.length(); i >= 0 && matches(charsequence.charAt(i)); i--);
        return charsequence.subSequence(0, i + 1).toString();
    }

    static 
    {
        CharMatcher charmatcher = inRange('0', '9');
        char ac[] = "\u0660\u06F0\u07C0\u0966\u09E6\u0A66\u0AE6\u0B66\u0BE6\u0C66\u0CE6\u0D66\u0E50\u0ED0\u0F20\u1040\u1090\u17E0\u1810\u1946\u19D0\u1B50\u1BB0\u1C40\u1C50\uA620\uA8D0\uA900\uAA50\uFF10".toCharArray();
        int i = ac.length;
        for (int j = 0; j < i; j++)
        {
            char c = ac[j];
            charmatcher = charmatcher.or(inRange(c, (char)(c + 9)));
        }

        DIGIT = charmatcher.precomputed();
    }
}
