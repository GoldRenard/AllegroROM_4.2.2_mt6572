// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.text.*;
import android.text.method.WordIterator;
import android.text.style.SpellCheckSpan;
import android.text.style.SuggestionSpan;
import android.util.Log;
import android.util.LruCache;
import android.view.textservice.*;
import com.android.internal.util.ArrayUtils;
import java.util.Locale;

// Referenced classes of package android.widget:
//            TextView

public class SpellChecker
    implements android.view.textservice.SpellCheckerSession.SpellCheckerSessionListener
{
    private class SpellParser
    {

        private Object mRange;
        final SpellChecker this$0;

        private void removeRangeSpan(Editable editable)
        {
            editable.removeSpan(mRange);
        }

        private void removeSpansAt(Editable editable, int i, Object aobj[])
        {
            int j = aobj.length;
            for (int k = 0; k < j; k++)
            {
                Object obj = aobj[k];
                if (editable.getSpanStart(obj) <= i && editable.getSpanEnd(obj) >= i)
                    editable.removeSpan(obj);
            }

        }

        private void setRangeSpan(Editable editable, int i, int j)
        {
            editable.setSpan(mRange, i, j, 33);
        }

        public boolean isFinished()
        {
            return ((Editable)mTextView.getText()).getSpanStart(mRange) < 0;
        }

        public void parse()
        {
            Editable editable;
            int i;
            int j;
            int k;
            int l;
            int i1;
            SpellCheckSpan aspellcheckspan[];
            SuggestionSpan asuggestionspan[];
            boolean flag;
            int j1;
            editable = (Editable)mTextView.getText();
            if (mIsSentenceSpellCheckSupported)
                i = Math.max(0, -50 + editable.getSpanStart(mRange));
            else
                i = editable.getSpanStart(mRange);
            j = editable.getSpanEnd(mRange);
            k = Math.min(j, 350 + i);
            mWordIterator.setCharSequence(editable, i, k);
            l = mWordIterator.preceding(i);
            if (l == -1)
            {
                i1 = mWordIterator.following(i);
                if (i1 != -1)
                    l = mWordIterator.getBeginning(i1);
            } else
            {
                i1 = mWordIterator.getEnd(l);
            }
            if (i1 == -1)
            {
                removeRangeSpan(editable);
                return;
            }
            aspellcheckspan = (SpellCheckSpan[])editable.getSpans(i - 1, j + 1, android/text/style/SpellCheckSpan);
            asuggestionspan = (SuggestionSpan[])editable.getSpans(i - 1, j + 1, android/text/style/SuggestionSpan);
            flag = mIsSentenceSpellCheckSupported;
            j1 = 0;
            if (!flag) goto _L2; else goto _L1
_L1:
            boolean flag1;
            int i3 = k;
            flag1 = false;
            if (i3 < j)
                flag1 = true;
            int j3 = mWordIterator.preceding(k);
            boolean flag3;
            if (j3 != -1)
                flag3 = true;
            else
                flag3 = false;
            if (flag3)
            {
                j3 = mWordIterator.getEnd(j3);
                if (j3 != -1)
                    flag3 = true;
                else
                    flag3 = false;
            }
            if (!flag3)
            {
                removeRangeSpan(editable);
                return;
            }
            int k3 = l;
            boolean flag4 = true;
            int l3 = 0;
label0:
            do
            {
label1:
                {
                    SpellCheckSpan spellcheckspan;
                    int i4;
                    int j4;
label2:
                    {
                        if (l3 < mLength)
                        {
                            spellcheckspan = mSpellCheckSpans[l3];
                            if (mIds[l3] < 0 || spellcheckspan.isSpellCheckInProgress())
                                break label1;
                            i4 = editable.getSpanStart(spellcheckspan);
                            j4 = editable.getSpanEnd(spellcheckspan);
                            if (j4 < k3 || j3 < i4)
                                break label1;
                            if (i4 > k3 || j3 > j4)
                                break label2;
                            flag4 = false;
                        }
                        if (j3 >= i)
                            if (j3 <= k3)
                                Log.w(SpellChecker.TAG, (new StringBuilder()).append("Trying to spellcheck invalid region, from ").append(i).append(" to ").append(j).toString());
                            else
                            if (flag4)
                                addSpellCheckSpan(editable, k3, j3);
                        l = j3;
                        break label0;
                    }
                    editable.removeSpan(spellcheckspan);
                    k3 = Math.min(i4, k3);
                    j3 = Math.max(j4, j3);
                }
                l3++;
            } while (true);
              goto _L3
_L2:
            int k1;
            k1 = l;
            flag1 = false;
            if (k1 > j) goto _L3; else goto _L4
_L4:
            if (i1 < i || i1 <= l) goto _L6; else goto _L5
_L5:
            if (j1 < 50) goto _L8; else goto _L7
_L7:
            flag1 = true;
              goto _L3
_L8:
            boolean flag2;
            if (l < i && i1 > i)
            {
                removeSpansAt(editable, i, aspellcheckspan);
                removeSpansAt(editable, i, asuggestionspan);
            }
            if (l < j && i1 > j)
            {
                removeSpansAt(editable, j, aspellcheckspan);
                removeSpansAt(editable, j, asuggestionspan);
            }
            flag2 = true;
            if (i1 != i) goto _L10; else goto _L9
_L9:
            int l2 = 0;
_L19:
            if (l2 < aspellcheckspan.length)
            {
                if (editable.getSpanEnd(aspellcheckspan[l2]) != i)
                    break MISSING_BLOCK_LABEL_885;
                flag2 = false;
            }
_L10:
            if (l != j) goto _L12; else goto _L11
_L11:
            int k2 = 0;
_L18:
            if (k2 >= aspellcheckspan.length) goto _L12; else goto _L13
_L13:
            if (editable.getSpanStart(aspellcheckspan[k2]) != j) goto _L15; else goto _L14
_L14:
            flag2 = false;
_L12:
            if (flag2)
                addSpellCheckSpan(editable, l, i1);
            j1++;
_L6:
            int j2;
            int i2 = i1;
            i1 = mWordIterator.following(i1);
            if (k < j && (i1 == -1 || i1 >= k))
            {
                k = Math.min(j, i2 + 350);
                mWordIterator.setCharSequence(editable, i2, k);
                i1 = mWordIterator.following(i2);
            }
            j2 = i1;
            flag1 = false;
            if (j2 == -1) goto _L3; else goto _L16
_L16:
            l = mWordIterator.getBeginning(i1);
            if (l != -1) goto _L2; else goto _L17
_L17:
            flag1 = false;
_L3:
            if (flag1)
            {
                int l1;
                if (l > j)
                    l1 = l;
                else
                    l1 = j;
                setRangeSpan(editable, l, l1);
            } else
            {
                removeRangeSpan(editable);
            }
            spellCheck();
            return;
_L15:
            k2++;
              goto _L18
            l2++;
              goto _L19
        }

        public void parse(int i, int j)
        {
            int k = mTextView.length();
            int l;
            if (j > k)
            {
                Log.w(SpellChecker.TAG, (new StringBuilder()).append("Parse invalid region, from ").append(i).append(" to ").append(j).toString());
                l = k;
            } else
            {
                l = j;
            }
            if (l > i)
            {
                setRangeSpan((Editable)mTextView.getText(), i, l);
                parse();
            }
        }

        public void stop()
        {
            removeRangeSpan((Editable)mTextView.getText());
        }

        private SpellParser()
        {
            this$0 = SpellChecker.this;
            super();
            mRange = new Object();
        }

    }


    public static final int AVERAGE_WORD_LENGTH = 7;
    private static final boolean DBG = false;
    public static final int MAX_NUMBER_OF_WORDS = 50;
    private static final int MIN_SENTENCE_LENGTH = 50;
    private static final int SPELL_PAUSE_DURATION = 400;
    private static final int SUGGESTION_SPAN_CACHE_SIZE = 10;
    private static final String TAG = android/widget/SpellChecker.getSimpleName();
    private static final int USE_SPAN_RANGE = -1;
    public static final int WORD_ITERATOR_INTERVAL = 350;
    final int mCookie = hashCode();
    private Locale mCurrentLocale;
    private int mIds[];
    private boolean mIsSentenceSpellCheckSupported;
    private int mLength;
    private int mSpanSequenceCounter;
    private SpellCheckSpan mSpellCheckSpans[];
    SpellCheckerSession mSpellCheckerSession;
    private SpellParser mSpellParsers[];
    private Runnable mSpellRunnable;
    private final LruCache mSuggestionSpanCache = new LruCache(10);
    private TextServicesManager mTextServicesManager;
    private final TextView mTextView;
    private WordIterator mWordIterator;

    public SpellChecker(TextView textview)
    {
        mSpellParsers = new SpellParser[0];
        mSpanSequenceCounter = 0;
        mTextView = textview;
        int i = ArrayUtils.idealObjectArraySize(1);
        mIds = new int[i];
        mSpellCheckSpans = new SpellCheckSpan[i];
        setLocale(mTextView.getTextServicesLocale());
    }

    private void addSpellCheckSpan(Editable editable, int i, int j)
    {
        int k = nextSpellCheckSpanIndex();
        SpellCheckSpan spellcheckspan = mSpellCheckSpans[k];
        editable.setSpan(spellcheckspan, i, j, 33);
        spellcheckspan.setSpellCheckInProgress(false);
        int ai[] = mIds;
        int l = mSpanSequenceCounter;
        mSpanSequenceCounter = l + 1;
        ai[k] = l;
    }

    private void createMisspelledSuggestionSpan(Editable editable, SuggestionsInfo suggestionsinfo, SpellCheckSpan spellcheckspan, int i, int j)
    {
        int k = editable.getSpanStart(spellcheckspan);
        int l = editable.getSpanEnd(spellcheckspan);
        if (k >= 0 && l > k)
        {
            int i1;
            int j1;
            if (i != -1 && j != -1)
            {
                i1 = k + i;
                j1 = i1 + j;
            } else
            {
                i1 = k;
                j1 = l;
            }
            int k1 = suggestionsinfo.getSuggestionsCount();
            String as[];
            if (k1 > 0)
            {
                as = new String[k1];
                for (int l1 = 0; l1 < k1; l1++)
                    as[l1] = suggestionsinfo.getSuggestionAt(l1);

            } else
            {
                as = (String[])ArrayUtils.emptyArray(java/lang/String);
            }
            SuggestionSpan suggestionspan = new SuggestionSpan(mTextView.getContext(), as, 3);
            if (mIsSentenceSpellCheckSupported)
            {
                Long long1 = Long.valueOf(TextUtils.packRangeInLong(i1, j1));
                SuggestionSpan suggestionspan1 = (SuggestionSpan)mSuggestionSpanCache.get(long1);
                if (suggestionspan1 != null)
                    editable.removeSpan(suggestionspan1);
                mSuggestionSpanCache.put(long1, suggestionspan);
            }
            editable.setSpan(suggestionspan, i1, j1, 33);
            mTextView.invalidateRegion(i1, j1, false);
            return;
        } else
        {
            return;
        }
    }

    private boolean isSessionActive()
    {
        return mSpellCheckerSession != null;
    }

    private int nextSpellCheckSpanIndex()
    {
        for (int i = 0; i < mLength; i++)
            if (mIds[i] < 0)
                return i;

        if (mLength == mSpellCheckSpans.length)
        {
            int j = 2 * mLength;
            int ai[] = new int[j];
            SpellCheckSpan aspellcheckspan[] = new SpellCheckSpan[j];
            System.arraycopy(mIds, 0, ai, 0, mLength);
            System.arraycopy(mSpellCheckSpans, 0, aspellcheckspan, 0, mLength);
            mIds = ai;
            mSpellCheckSpans = aspellcheckspan;
        }
        mSpellCheckSpans[mLength] = new SpellCheckSpan();
        mLength = 1 + mLength;
        return -1 + mLength;
    }

    private SpellCheckSpan onGetSuggestionsInternal(SuggestionsInfo suggestionsinfo, int i, int j)
    {
        SpellCheckSpan spellcheckspan;
label0:
        {
            if (suggestionsinfo != null && suggestionsinfo.getCookie() == mCookie)
            {
                Editable editable = (Editable)mTextView.getText();
                int k = suggestionsinfo.getSequence();
                int l = 0;
                do
                {
                    if (l >= mLength)
                        break;
                    if (k == mIds[l])
                    {
                        int i1 = suggestionsinfo.getSuggestionsAttributes();
                        boolean flag;
                        if ((i1 & 1) > 0)
                            flag = true;
                        else
                            flag = false;
                        boolean flag1;
                        if ((i1 & 2) > 0)
                            flag1 = true;
                        else
                            flag1 = false;
                        spellcheckspan = mSpellCheckSpans[l];
                        if (!flag && flag1)
                        {
                            createMisspelledSuggestionSpan(editable, suggestionsinfo, spellcheckspan, i, j);
                            return spellcheckspan;
                        }
                        if (mIsSentenceSpellCheckSupported)
                        {
                            int j1 = editable.getSpanStart(spellcheckspan);
                            int k1 = editable.getSpanEnd(spellcheckspan);
                            int l1;
                            int i2;
                            if (i != -1 && j != -1)
                            {
                                l1 = j1 + i;
                                i2 = l1 + j;
                            } else
                            {
                                l1 = j1;
                                i2 = k1;
                            }
                            if (j1 >= 0 && k1 > j1 && i2 > l1)
                            {
                                Long long1 = Long.valueOf(TextUtils.packRangeInLong(l1, i2));
                                SuggestionSpan suggestionspan = (SuggestionSpan)mSuggestionSpanCache.get(long1);
                                if (suggestionspan != null)
                                {
                                    editable.removeSpan(suggestionspan);
                                    mSuggestionSpanCache.remove(long1);
                                    return spellcheckspan;
                                }
                            }
                        }
                        break label0;
                    }
                    l++;
                } while (true);
                return null;
            }
            spellcheckspan = null;
        }
        return spellcheckspan;
    }

    private void resetSession()
    {
        closeSession();
        mTextServicesManager = (TextServicesManager)mTextView.getContext().getSystemService("textservices");
        if (mTextServicesManager.isSpellCheckerEnabled() && mTextServicesManager.getCurrentSpellCheckerSubtype(true) != null)
        {
            mSpellCheckerSession = mTextServicesManager.newSpellCheckerSession(null, mCurrentLocale, this, false);
            mIsSentenceSpellCheckSupported = true;
        } else
        {
            mSpellCheckerSession = null;
        }
        for (int i = 0; i < mLength; i++)
            mIds[i] = -1;

        mLength = 0;
        mTextView.removeMisspelledSpans((Editable)mTextView.getText());
        mSuggestionSpanCache.evictAll();
    }

    private void scheduleNewSpellCheck()
    {
        if (mSpellRunnable == null)
            mSpellRunnable = new Runnable() {

                final SpellChecker this$0;

                public void run()
                {
                    int i = mSpellParsers.length;
                    int j = 0;
                    do
                    {
label0:
                        {
                            if (j < i)
                            {
                                SpellParser spellparser = mSpellParsers[j];
                                if (spellparser.isFinished())
                                    break label0;
                                spellparser.parse();
                            }
                            return;
                        }
                        j++;
                    } while (true);
                }

            
            {
                this$0 = SpellChecker.this;
                super();
            }
            }
;
        else
            mTextView.removeCallbacks(mSpellRunnable);
        mTextView.postDelayed(mSpellRunnable, 400L);
    }

    private void setLocale(Locale locale)
    {
        mCurrentLocale = locale;
        resetSession();
        mWordIterator = new WordIterator(locale);
        mTextView.onLocaleChanged();
    }

    private void spellCheck()
    {
        if (mSpellCheckerSession != null)
        {
            Editable editable = (Editable)mTextView.getText();
            int i = Selection.getSelectionStart(editable);
            int j = Selection.getSelectionEnd(editable);
            TextInfo atextinfo[] = new TextInfo[mLength];
            int k = 0;
            for (int l = 0; l < mLength; l++)
            {
                SpellCheckSpan spellcheckspan = mSpellCheckSpans[l];
                if (mIds[l] < 0 || spellcheckspan.isSpellCheckInProgress())
                    continue;
                int i1 = editable.getSpanStart(spellcheckspan);
                int j1 = editable.getSpanEnd(spellcheckspan);
                boolean flag;
                if (mIsSentenceSpellCheckSupported)
                {
                    if (j > i1 && i <= j1)
                        flag = false;
                    else
                        flag = true;
                } else
                if (j >= i1 && i <= j1)
                    flag = false;
                else
                    flag = true;
                if (i1 < 0 || j1 <= i1 || !flag)
                    continue;
                String s;
                if (editable instanceof SpannableStringBuilder)
                    s = ((SpannableStringBuilder)editable).substring(i1, j1);
                else
                    s = editable.subSequence(i1, j1).toString();
                spellcheckspan.setSpellCheckInProgress(true);
                int k1 = k + 1;
                atextinfo[k] = new TextInfo(s, mCookie, mIds[l]);
                k = k1;
            }

            if (k > 0)
            {
                if (k < atextinfo.length)
                {
                    TextInfo atextinfo1[] = new TextInfo[k];
                    System.arraycopy(atextinfo, 0, atextinfo1, 0, k);
                    atextinfo = atextinfo1;
                }
                if (mIsSentenceSpellCheckSupported)
                {
                    mSpellCheckerSession.getSentenceSuggestions(atextinfo, 5);
                    return;
                } else
                {
                    mSpellCheckerSession.getSuggestions(atextinfo, 5, false);
                    return;
                }
            }
        }
    }

    public void closeSession()
    {
        if (mSpellCheckerSession != null)
            mSpellCheckerSession.close();
        int i = mSpellParsers.length;
        for (int j = 0; j < i; j++)
            mSpellParsers[j].stop();

        if (mSpellRunnable != null)
            mTextView.removeCallbacks(mSpellRunnable);
    }

    public void onGetSentenceSuggestions(SentenceSuggestionsInfo asentencesuggestionsinfo[])
    {
        Editable editable = (Editable)mTextView.getText();
        for (int i = 0; i < asentencesuggestionsinfo.length; i++)
        {
            SentenceSuggestionsInfo sentencesuggestionsinfo = asentencesuggestionsinfo[i];
            if (sentencesuggestionsinfo == null)
                continue;
            SpellCheckSpan spellcheckspan = null;
            for (int j = 0; j < sentencesuggestionsinfo.getSuggestionsCount(); j++)
            {
                SuggestionsInfo suggestionsinfo = sentencesuggestionsinfo.getSuggestionsInfoAt(j);
                if (suggestionsinfo == null)
                    continue;
                SpellCheckSpan spellcheckspan1 = onGetSuggestionsInternal(suggestionsinfo, sentencesuggestionsinfo.getOffsetAt(j), sentencesuggestionsinfo.getLengthAt(j));
                if (spellcheckspan == null && spellcheckspan1 != null)
                    spellcheckspan = spellcheckspan1;
            }

            if (spellcheckspan != null)
                editable.removeSpan(spellcheckspan);
        }

        scheduleNewSpellCheck();
    }

    public void onGetSuggestions(SuggestionsInfo asuggestionsinfo[])
    {
        Editable editable = (Editable)mTextView.getText();
        for (int i = 0; i < asuggestionsinfo.length; i++)
        {
            SpellCheckSpan spellcheckspan = onGetSuggestionsInternal(asuggestionsinfo[i], -1, -1);
            if (spellcheckspan != null)
                editable.removeSpan(spellcheckspan);
        }

        scheduleNewSpellCheck();
    }

    public void onSelectionChanged()
    {
        spellCheck();
    }

    public void onSpellCheckSpanRemoved(SpellCheckSpan spellcheckspan)
    {
        int i = 0;
        do
        {
label0:
            {
                if (i < mLength)
                {
                    if (mSpellCheckSpans[i] != spellcheckspan)
                        break label0;
                    mIds[i] = -1;
                }
                return;
            }
            i++;
        } while (true);
    }

    public void spellCheck(int i, int j)
    {
        Locale locale = mTextView.getTextServicesLocale();
        boolean flag = isSessionActive();
        if (mCurrentLocale != null && mCurrentLocale.equals(locale))
        {
            if (flag != mTextServicesManager.isSpellCheckerEnabled())
                resetSession();
        } else
        {
            setLocale(locale);
            i = 0;
            j = mTextView.getText().length();
        }
        if (!flag)
            return;
        int k = mSpellParsers.length;
        for (int l = 0; l < k; l++)
        {
            SpellParser spellparser1 = mSpellParsers[l];
            if (spellparser1.isFinished())
            {
                spellparser1.parse(i, j);
                return;
            }
        }

        SpellParser aspellparser[] = new SpellParser[k + 1];
        System.arraycopy(mSpellParsers, 0, aspellparser, 0, k);
        mSpellParsers = aspellparser;
        SpellParser spellparser = new SpellParser();
        mSpellParsers[k] = spellparser;
        spellparser.parse(i, j);
    }











}
