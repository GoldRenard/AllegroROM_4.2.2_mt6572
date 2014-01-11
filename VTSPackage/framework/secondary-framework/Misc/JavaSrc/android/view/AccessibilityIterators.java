// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.ComponentCallbacks;
import android.content.res.Configuration;
import java.text.BreakIterator;
import java.util.Locale;

// Referenced classes of package android.view:
//            ViewRootImpl

public final class AccessibilityIterators
{
    public static abstract class AbstractTextSegmentIterator
        implements TextSegmentIterator
    {

        private final int mSegment[] = new int[2];
        protected String mText;

        protected int[] getRange(int i, int j)
        {
            if (i >= 0 && j >= 0 && i != j)
            {
                mSegment[0] = i;
                mSegment[1] = j;
                return mSegment;
            } else
            {
                return null;
            }
        }

        public void initialize(String s)
        {
            mText = s;
        }

    }

    static class CharacterTextSegmentIterator extends AbstractTextSegmentIterator
        implements ComponentCallbacks
    {

        private static CharacterTextSegmentIterator sInstance;
        protected BreakIterator mImpl;
        private Locale mLocale;

        public static CharacterTextSegmentIterator getInstance(Locale locale)
        {
            if (sInstance == null)
                sInstance = new CharacterTextSegmentIterator(locale);
            return sInstance;
        }

        public int[] following(int i)
        {
            int j = super.mText.length();
            if (j > 0 && i < j)
            {
                int k = i;
                if (k < 0)
                    k = 0;
                while (!mImpl.isBoundary(k)) 
                {
                    k = mImpl.following(k);
                    if (k == -1)
                        return null;
                }
                int l = mImpl.following(k);
                if (l != -1)
                    return getRange(k, l);
            }
            return null;
        }

        public void initialize(String s)
        {
            super.initialize(s);
            mImpl.setText(s);
        }

        public void onConfigurationChanged(Configuration configuration)
        {
            Locale locale = configuration.locale;
            if (!mLocale.equals(locale))
            {
                mLocale = locale;
                onLocaleChanged(locale);
            }
        }

        protected void onLocaleChanged(Locale locale)
        {
            mImpl = BreakIterator.getCharacterInstance(locale);
        }

        public void onLowMemory()
        {
        }

        public int[] preceding(int i)
        {
            int j = super.mText.length();
            if (j > 0 && i > 0)
            {
                int k = i;
                if (k > j)
                    k = j;
                while (!mImpl.isBoundary(k)) 
                {
                    k = mImpl.preceding(k);
                    if (k == -1)
                        return null;
                }
                int l = mImpl.preceding(k);
                if (l != -1)
                    return getRange(l, k);
            }
            return null;
        }

        private CharacterTextSegmentIterator(Locale locale)
        {
            mLocale = locale;
            onLocaleChanged(locale);
            ViewRootImpl.addConfigCallback(this);
        }

    }

    static class ParagraphTextSegmentIterator extends AbstractTextSegmentIterator
    {

        private static ParagraphTextSegmentIterator sInstance;

        public static ParagraphTextSegmentIterator getInstance()
        {
            if (sInstance == null)
                sInstance = new ParagraphTextSegmentIterator();
            return sInstance;
        }

        private boolean isEndBoundary(int i)
        {
            return i > 0 && super.mText.charAt(i - 1) != '\n' && (i == super.mText.length() || super.mText.charAt(i) == '\n');
        }

        private boolean isStartBoundary(int i)
        {
            return super.mText.charAt(i) != '\n' && (i == 0 || super.mText.charAt(i - 1) == '\n');
        }

        public int[] following(int i)
        {
            int j = super.mText.length();
            if (j > 0 && i < j)
            {
                int k = i;
                if (k < 0)
                    k = 0;
                for (; k < j && super.mText.charAt(k) == '\n' && !isStartBoundary(k); k++);
                if (k < j)
                {
                    int l;
                    for (l = k + 1; l < j && !isEndBoundary(l); l++);
                    return getRange(k, l);
                }
            }
            return null;
        }

        public int[] preceding(int i)
        {
            int j = super.mText.length();
            if (j > 0 && i > 0)
            {
                int k = i;
                if (k > j)
                    k = j;
                for (; k > 0 && super.mText.charAt(k - 1) == '\n' && !isEndBoundary(k); k--);
                if (k > 0)
                {
                    int l;
                    for (l = k - 1; l > 0 && !isStartBoundary(l); l--);
                    return getRange(l, k);
                }
            }
            return null;
        }

    }

    public static interface TextSegmentIterator
    {

        public abstract int[] following(int i);

        public abstract int[] preceding(int i);
    }

    static class WordTextSegmentIterator extends CharacterTextSegmentIterator
    {

        private static WordTextSegmentIterator sInstance;

        public static WordTextSegmentIterator getInstance(Locale locale)
        {
            if (sInstance == null)
                sInstance = new WordTextSegmentIterator(locale);
            return sInstance;
        }

        private boolean isEndBoundary(int i)
        {
            return i > 0 && isLetterOrDigit(i - 1) && (i == super.mText.length() || !isLetterOrDigit(i));
        }

        private boolean isLetterOrDigit(int i)
        {
            if (i >= 0 && i < super.mText.length())
                return Character.isLetterOrDigit(super.mText.codePointAt(i));
            else
                return false;
        }

        private boolean isStartBoundary(int i)
        {
            return isLetterOrDigit(i) && (i == 0 || !isLetterOrDigit(i - 1));
        }

        public int[] following(int i)
        {
            if (super.mText.length() > 0 && i < super.mText.length())
            {
                int j = i;
                if (j < 0)
                    j = 0;
                while (!isLetterOrDigit(j) && !isStartBoundary(j)) 
                {
                    j = super.mImpl.following(j);
                    if (j == -1)
                        return null;
                }
                int k = super.mImpl.following(j);
                if (k != -1 && isEndBoundary(k))
                    return getRange(j, k);
            }
            return null;
        }

        protected void onLocaleChanged(Locale locale)
        {
            super.mImpl = BreakIterator.getWordInstance(locale);
        }

        public int[] preceding(int i)
        {
            int j = super.mText.length();
            if (j > 0 && i > 0)
            {
                int k = i;
                if (k > j)
                    k = j;
                while (k > 0 && !isLetterOrDigit(k - 1) && !isEndBoundary(k)) 
                {
                    k = super.mImpl.preceding(k);
                    if (k == -1)
                        return null;
                }
                int l = super.mImpl.preceding(k);
                if (l != -1 && isStartBoundary(l))
                    return getRange(l, k);
            }
            return null;
        }

        private WordTextSegmentIterator(Locale locale)
        {
            super(locale);
        }
    }


}
