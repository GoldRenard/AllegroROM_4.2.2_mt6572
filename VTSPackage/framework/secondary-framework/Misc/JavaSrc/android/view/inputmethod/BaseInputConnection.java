// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view.inputmethod;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.*;
import android.text.method.MetaKeyKeyListener;
import android.util.Log;
import android.util.LogPrinter;
import android.view.*;

// Referenced classes of package android.view.inputmethod:
//            InputConnection, ComposingText, InputMethodManager, CompletionInfo, 
//            CorrectionInfo, ExtractedTextRequest, ExtractedText

public class BaseInputConnection
    implements InputConnection
{

    static final Object COMPOSING = new ComposingText();
    static boolean DEBUG = false;
    private static final String TAG = "BaseInputConnection";
    private Object mDefaultComposingSpans[];
    final boolean mDummyMode;
    Editable mEditable;
    protected final InputMethodManager mIMM;
    KeyCharacterMap mKeyCharacterMap;
    final View mTargetView;

    public BaseInputConnection(View view, boolean flag)
    {
        mIMM = (InputMethodManager)view.getContext().getSystemService("input_method");
        mTargetView = view;
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        mDummyMode = flag1;
    }

    BaseInputConnection(InputMethodManager inputmethodmanager, boolean flag)
    {
        mIMM = inputmethodmanager;
        mTargetView = null;
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        mDummyMode = flag1;
    }

    private void ensureDefaultComposingSpans()
    {
        if (mDefaultComposingSpans == null)
        {
            Context context;
            if (mTargetView != null)
                context = mTargetView.getContext();
            else
            if (mIMM.mServedView != null)
                context = mIMM.mServedView.getContext();
            else
                context = null;
            if (context != null)
            {
                TypedArray typedarray = context.getTheme().obtainStyledAttributes(new int[] {
                    0x1010230
                });
                CharSequence charsequence = typedarray.getText(0);
                typedarray.recycle();
                if (charsequence != null && (charsequence instanceof Spanned))
                    mDefaultComposingSpans = ((Spanned)charsequence).getSpans(0, charsequence.length(), java/lang/Object);
            }
        }
    }

    public static int getComposingSpanEnd(Spannable spannable)
    {
        return spannable.getSpanEnd(COMPOSING);
    }

    public static int getComposingSpanStart(Spannable spannable)
    {
        return spannable.getSpanStart(COMPOSING);
    }

    public static final void removeComposingSpans(Spannable spannable)
    {
        spannable.removeSpan(COMPOSING);
        Object aobj[] = spannable.getSpans(0, spannable.length(), java/lang/Object);
        if (aobj != null)
        {
            for (int i = -1 + aobj.length; i >= 0; i--)
            {
                Object obj = aobj[i];
                if ((0x100 & spannable.getSpanFlags(obj)) != 0)
                    spannable.removeSpan(obj);
            }

        }
    }

    private void replaceText(CharSequence charsequence, int i, boolean flag)
    {
        Editable editable = getEditable();
        if (editable == null)
            return;
        beginBatchEdit();
        int j = getComposingSpanStart(editable);
        int k = getComposingSpanEnd(editable);
        if (DEBUG)
            Log.v("BaseInputConnection", (new StringBuilder()).append("Composing span: ").append(j).append(" to ").append(k).toString());
        if (k < j)
        {
            int k1 = j;
            j = k;
            k = k1;
        }
        if (j != -1 && k != -1)
        {
            removeComposingSpans(editable);
        } else
        {
            j = Selection.getSelectionStart(editable);
            k = Selection.getSelectionEnd(editable);
            if (j < 0)
                j = 0;
            if (k < 0)
                k = 0;
            if (k < j)
            {
                int j1 = j;
                j = k;
                k = j1;
            }
        }
        if (flag)
        {
            Object obj;
            if (!(charsequence instanceof Spannable))
            {
                obj = new SpannableStringBuilder(charsequence);
                charsequence = ((CharSequence) (obj));
                ensureDefaultComposingSpans();
                if (mDefaultComposingSpans != null)
                {
                    for (int i1 = 0; i1 < mDefaultComposingSpans.length; i1++)
                        ((Spannable) (obj)).setSpan(mDefaultComposingSpans[i1], 0, ((Spannable) (obj)).length(), 289);

                }
            } else
            {
                obj = (Spannable)charsequence;
            }
            setComposingSpans(((Spannable) (obj)));
        }
        if (DEBUG)
            Log.v("BaseInputConnection", (new StringBuilder()).append("Replacing from ").append(j).append(" to ").append(k).append(" with \"").append(charsequence).append("\", composing=").append(flag).append(", type=").append(charsequence.getClass().getCanonicalName()).toString());
        if (DEBUG)
        {
            LogPrinter logprinter1 = new LogPrinter(2, "BaseInputConnection");
            logprinter1.println("Current text:");
            TextUtils.dumpSpans(editable, logprinter1, "  ");
            logprinter1.println("Composing text:");
            TextUtils.dumpSpans(charsequence, logprinter1, "  ");
        }
        int l;
        if (i > 0)
            l = i + (k - 1);
        else
            l = i + j;
        if (l < 0)
            l = 0;
        if (l > editable.length())
            l = editable.length();
        Selection.setSelection(editable, l);
        editable.replace(j, k, charsequence);
        if (DEBUG)
        {
            LogPrinter logprinter = new LogPrinter(2, "BaseInputConnection");
            logprinter.println("Final text:");
            TextUtils.dumpSpans(editable, logprinter, "  ");
        }
        endBatchEdit();
    }

    private void sendCurrentText()
    {
        if (mDummyMode)
        {
            Editable editable = getEditable();
            if (editable != null)
            {
                int i = editable.length();
                if (i != 0)
                {
                    if (i == 1)
                    {
                        if (mKeyCharacterMap == null)
                            mKeyCharacterMap = KeyCharacterMap.load(-1);
                        char ac[] = new char[1];
                        editable.getChars(0, 1, ac, 0);
                        KeyEvent akeyevent[] = mKeyCharacterMap.getEvents(ac);
                        if (akeyevent != null)
                        {
                            for (int j = 0; j < akeyevent.length; j++)
                            {
                                if (DEBUG)
                                    Log.v("BaseInputConnection", (new StringBuilder()).append("Sending: ").append(akeyevent[j]).toString());
                                sendKeyEvent(akeyevent[j]);
                            }

                            editable.clear();
                            return;
                        }
                    }
                    sendKeyEvent(new KeyEvent(SystemClock.uptimeMillis(), editable.toString(), -1, 0));
                    editable.clear();
                    return;
                }
            }
        }
    }

    public static void setComposingSpans(Spannable spannable)
    {
        setComposingSpans(spannable, 0, spannable.length());
    }

    public static void setComposingSpans(Spannable spannable, int i, int j)
    {
        Object aobj[] = spannable.getSpans(i, j, java/lang/Object);
        if (aobj != null)
        {
            for (int k = -1 + aobj.length; k >= 0; k--)
            {
                Object obj = aobj[k];
                if (obj == COMPOSING)
                {
                    spannable.removeSpan(obj);
                    continue;
                }
                int l = spannable.getSpanFlags(obj);
                if ((l & 0x133) != 289)
                    spannable.setSpan(obj, spannable.getSpanStart(obj), spannable.getSpanEnd(obj), 0x21 | (0x100 | l & 0xffffffcc));
            }

        }
        spannable.setSpan(COMPOSING, i, j, 289);
    }

    public boolean beginBatchEdit()
    {
        return false;
    }

    public boolean clearMetaKeyStates(int i)
    {
        Editable editable = getEditable();
        if (editable == null)
        {
            return false;
        } else
        {
            MetaKeyKeyListener.clearMetaKeyState(editable, i);
            return true;
        }
    }

    public boolean commitCompletion(CompletionInfo completioninfo)
    {
        return false;
    }

    public boolean commitCorrection(CorrectionInfo correctioninfo)
    {
        return false;
    }

    public boolean commitText(CharSequence charsequence, int i)
    {
        if (DEBUG)
            Log.v("BaseInputConnection", (new StringBuilder()).append("commitText ").append(charsequence).toString());
        replaceText(charsequence, i, false);
        sendCurrentText();
        return true;
    }

    public boolean deleteSurroundingText(int i, int j)
    {
        if (DEBUG)
            Log.v("BaseInputConnection", (new StringBuilder()).append("deleteSurroundingText ").append(i).append(" / ").append(j).toString());
        Editable editable = getEditable();
        if (editable == null)
            return false;
        beginBatchEdit();
        int k = Selection.getSelectionStart(editable);
        int l = Selection.getSelectionEnd(editable);
        if (k > l)
        {
            int l2 = k;
            k = l;
            l = l2;
        }
        int i1 = getComposingSpanStart(editable);
        int j1 = getComposingSpanEnd(editable);
        if (j1 < i1)
        {
            int k2 = i1;
            i1 = j1;
            j1 = k2;
        }
        if (i1 != -1 && j1 != -1)
        {
            if (i1 < k)
                k = i1;
            if (j1 > l)
                l = j1;
        }
        int k1 = 0;
        if (i > 0)
        {
            int j2 = k - i;
            if (j2 < 0)
                j2 = 0;
            editable.delete(j2, k);
            k1 = k - j2;
        }
        if (j > 0)
        {
            int l1 = l - k1;
            int i2 = l1 + j;
            if (i2 > editable.length())
                i2 = editable.length();
            editable.delete(l1, i2);
        }
        endBatchEdit();
        return true;
    }

    public boolean endBatchEdit()
    {
        return false;
    }

    public boolean finishComposingText()
    {
        if (DEBUG)
            Log.v("BaseInputConnection", "finishComposingText");
        Editable editable = getEditable();
        if (editable != null)
        {
            beginBatchEdit();
            removeComposingSpans(editable);
            endBatchEdit();
            sendCurrentText();
        }
        return true;
    }

    public int getCursorCapsMode(int i)
    {
        if (!mDummyMode)
        {
            Editable editable = getEditable();
            if (editable != null)
            {
                int j = Selection.getSelectionStart(editable);
                int k = Selection.getSelectionEnd(editable);
                if (j > k)
                {
                    int _tmp = j;
                    j = k;
                }
                return TextUtils.getCapsMode(editable, j, i);
            }
        }
        return 0;
    }

    public Editable getEditable()
    {
        if (mEditable == null)
        {
            mEditable = android.text.Editable.Factory.getInstance().newEditable("");
            Selection.setSelection(mEditable, 0);
        }
        return mEditable;
    }

    public ExtractedText getExtractedText(ExtractedTextRequest extractedtextrequest, int i)
    {
        return null;
    }

    public CharSequence getSelectedText(int i)
    {
        Editable editable = getEditable();
        if (editable != null)
        {
            int j = Selection.getSelectionStart(editable);
            int k = Selection.getSelectionEnd(editable);
            if (j > k)
            {
                int l = j;
                j = k;
                k = l;
            }
            if (j != k)
                if ((i & 1) != 0)
                    return editable.subSequence(j, k);
                else
                    return TextUtils.substring(editable, j, k);
        }
        return null;
    }

    public CharSequence getTextAfterCursor(int i, int j)
    {
        Editable editable = getEditable();
        if (editable == null)
            return null;
        int k = Selection.getSelectionStart(editable);
        int l = Selection.getSelectionEnd(editable);
        if (k > l)
        {
            int _tmp = l;
            l = k;
        }
        if (l < 0)
            l = 0;
        if (l + i > editable.length())
            i = editable.length() - l;
        if ((j & 1) != 0)
            return editable.subSequence(l, l + i);
        else
            return TextUtils.substring(editable, l, l + i);
    }

    public CharSequence getTextBeforeCursor(int i, int j)
    {
        Editable editable = getEditable();
        if (editable == null)
            return null;
        int k = Selection.getSelectionStart(editable);
        int l = Selection.getSelectionEnd(editable);
        if (k > l)
        {
            int _tmp = k;
            k = l;
        }
        if (k <= 0)
            return "";
        if (i > k)
            i = k;
        if ((j & 1) != 0)
            return editable.subSequence(k - i, k);
        else
            return TextUtils.substring(editable, k - i, k);
    }

    public boolean performContextMenuAction(int i)
    {
        return false;
    }

    public boolean performEditorAction(int i)
    {
        long l = SystemClock.uptimeMillis();
        sendKeyEvent(new KeyEvent(l, l, 0, 66, 0, 0, -1, 0, 22));
        sendKeyEvent(new KeyEvent(SystemClock.uptimeMillis(), l, 1, 66, 0, 0, -1, 0, 22));
        return true;
    }

    public boolean performPrivateCommand(String s, Bundle bundle)
    {
        return false;
    }

    protected void reportFinish()
    {
    }

    public boolean reportFullscreenMode(boolean flag)
    {
        mIMM.setFullscreenMode(flag);
        return true;
    }

    public boolean sendKeyEvent(KeyEvent keyevent)
    {
        InputMethodManager.H h = mIMM.mH;
        h;
        JVM INSTR monitorenter ;
        if (mTargetView == null) goto _L2; else goto _L1
_L1:
        ViewRootImpl viewrootimpl = mTargetView.getViewRootImpl();
_L4:
        if (viewrootimpl != null)
            break MISSING_BLOCK_LABEL_53;
        if (mIMM.mServedView != null)
            viewrootimpl = mIMM.mServedView.getViewRootImpl();
        if (viewrootimpl == null)
            break MISSING_BLOCK_LABEL_64;
        viewrootimpl.dispatchKeyFromIme(keyevent);
        h;
        JVM INSTR monitorexit ;
        return false;
        Exception exception;
        exception;
        h;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        viewrootimpl = null;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public boolean setComposingRegion(int i, int j)
    {
        Editable editable = getEditable();
        if (editable != null)
        {
            beginBatchEdit();
            removeComposingSpans(editable);
            int k = i;
            int l = j;
            if (k > l)
            {
                int k1 = k;
                k = l;
                l = k1;
            }
            int i1 = editable.length();
            if (k < 0)
                k = 0;
            if (l < 0)
                l = 0;
            if (k > i1)
                k = i1;
            if (l > i1)
                l = i1;
            ensureDefaultComposingSpans();
            if (mDefaultComposingSpans != null)
            {
                for (int j1 = 0; j1 < mDefaultComposingSpans.length; j1++)
                    editable.setSpan(mDefaultComposingSpans[j1], k, l, 289);

            }
            editable.setSpan(COMPOSING, k, l, 289);
            endBatchEdit();
            sendCurrentText();
        }
        return true;
    }

    public boolean setComposingText(CharSequence charsequence, int i)
    {
        if (DEBUG)
            Log.v("BaseInputConnection", (new StringBuilder()).append("setComposingText ").append(charsequence).toString());
        replaceText(charsequence, i, true);
        return true;
    }

    public boolean setSelection(int i, int j)
    {
        boolean flag = true;
        if (DEBUG)
            Log.v("BaseInputConnection", (new StringBuilder()).append("setSelection ").append(i).append(", ").append(j).toString());
        Editable editable = getEditable();
        if (editable == null)
        {
            flag = false;
        } else
        {
            int k = editable.length();
            if (i <= k && j <= k)
                if (i == j && MetaKeyKeyListener.getMetaState(editable, 2048) != 0)
                {
                    Selection.extendSelection(editable, i);
                    return flag;
                } else
                {
                    Selection.setSelection(editable, i, j);
                    return flag;
                }
        }
        return flag;
    }

    static 
    {
        DEBUG = false;
    }
}
