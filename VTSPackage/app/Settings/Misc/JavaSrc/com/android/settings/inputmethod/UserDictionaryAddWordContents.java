// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import com.android.settings.UserDictionarySettings;
import com.android.settings.Utils;
import java.util.*;

// Referenced classes of package com.android.settings.inputmethod:
//            UserDictionaryList

public class UserDictionaryAddWordContents
{
    public static class LocaleRenderer
    {

        private final String mDescription;
        private final String mLocaleString;

        public String getLocaleString()
        {
            return mLocaleString;
        }

        public boolean isMoreLanguages()
        {
            return mLocaleString == null;
        }

        public String toString()
        {
            return mDescription;
        }

        public LocaleRenderer(Context context, String s)
        {
            mLocaleString = s;
            if (s == null)
            {
                mDescription = context.getString(0x7f0b06e6);
                return;
            }
            if ("".equals(s))
            {
                mDescription = context.getString(0x7f0b06e5);
                return;
            } else
            {
                mDescription = Utils.createLocaleFromString(s).getDisplayName();
                return;
            }
        }
    }


    public static final String EXTRA_LOCALE = "locale";
    public static final String EXTRA_MODE = "mode";
    public static final String EXTRA_ORIGINAL_SHORTCUT = "originalShortcut";
    public static final String EXTRA_ORIGINAL_WORD = "originalWord";
    public static final String EXTRA_SHORTCUT = "shortcut";
    public static final String EXTRA_WORD = "word";
    private static final int FREQUENCY_FOR_USER_DICTIONARY_ADDS = 250;
    private static final String HAS_WORD_PROJECTION[] = {
        "word"
    };
    private static final String HAS_WORD_SELECTION_ALL_LOCALES = "word=? AND locale is null";
    private static final String HAS_WORD_SELECTION_ONE_LOCALE = "word=? AND locale=?";
    public static final int MODE_EDIT = 0;
    public static final int MODE_INSERT = 1;
    private String mLocale;
    private final int mMode;
    private final String mOldShortcut;
    private final String mOldWord;
    private final EditText mShortcutEditText;
    private final EditText mWordEditText;

    UserDictionaryAddWordContents(View view, Bundle bundle)
    {
        mWordEditText = (EditText)view.findViewById(0x7f0801a0);
        mShortcutEditText = (EditText)view.findViewById(0x7f0801a3);
        String s = bundle.getString("word");
        if (s != null)
        {
            int i = view.getContext().getResources().getInteger(0x7f0c0000);
            mWordEditText.setText(s);
            EditText edittext = mWordEditText;
            if (s.length() <= i)
                i = s.length();
            edittext.setSelection(i);
        }
        String s1 = bundle.getString("shortcut");
        if (s1 != null && mShortcutEditText != null)
            mShortcutEditText.setText(s1);
        mMode = bundle.getInt("mode");
        mOldWord = bundle.getString("word");
        mOldShortcut = bundle.getString("shortcut");
        updateLocale(bundle.getString("locale"));
    }

    private static void addLocaleDisplayNameToList(Context context, ArrayList arraylist, String s)
    {
        if (s != null)
            arraylist.add(new LocaleRenderer(context, s));
    }

    private boolean hasWord(String s, Context context)
    {
        Cursor cursor;
        if ("".equals(mLocale))
        {
            cursor = context.getContentResolver().query(android.provider.UserDictionary.Words.CONTENT_URI, HAS_WORD_PROJECTION, "word=? AND locale is null", new String[] {
                s
            }, null);
        } else
        {
            ContentResolver contentresolver = context.getContentResolver();
            android.net.Uri uri = android.provider.UserDictionary.Words.CONTENT_URI;
            String as[] = HAS_WORD_PROJECTION;
            String as1[] = new String[2];
            as1[0] = s;
            as1[1] = mLocale;
            cursor = contentresolver.query(uri, as, "word=? AND locale=?", as1, null);
        }
        if (cursor == null)
        {
            if (cursor != null)
                cursor.close();
            return false;
        }
        int i = cursor.getCount();
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        if (cursor != null)
            cursor.close();
        return flag;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    int apply(Context context, Bundle bundle)
    {
        if (bundle != null)
            saveStateIntoBundle(bundle);
        ContentResolver contentresolver = context.getContentResolver();
        if (mMode == 0 && !TextUtils.isEmpty(mOldWord))
            UserDictionarySettings.deleteWord(mOldWord, mOldShortcut, contentresolver);
        String s = mWordEditText.getText().toString();
        String s2;
        if (mShortcutEditText == null)
        {
            s2 = null;
        } else
        {
            String s1 = mShortcutEditText.getText().toString();
            if (TextUtils.isEmpty(s1))
                s2 = null;
            else
                s2 = s1;
        }
        if (TextUtils.isEmpty(s))
            return 1;
        if (hasWord(s, context))
            return 2;
        UserDictionarySettings.deleteWord(s, null, contentresolver);
        if (!TextUtils.isEmpty(s2))
            UserDictionarySettings.deleteWord(s, s2, contentresolver);
        String s3 = s.toString();
        boolean flag = TextUtils.isEmpty(mLocale);
        Locale locale = null;
        if (!flag)
            locale = Utils.createLocaleFromString(mLocale);
        android.provider.UserDictionary.Words.addWord(context, s3, 250, s2, locale);
        return 0;
    }

    void delete(Context context)
    {
        if (mMode == 0 && !TextUtils.isEmpty(mOldWord))
        {
            ContentResolver contentresolver = context.getContentResolver();
            UserDictionarySettings.deleteWord(mOldWord, mOldShortcut, contentresolver);
        }
    }

    public ArrayList getLocalesList(Activity activity)
    {
        TreeSet treeset = UserDictionaryList.getUserDictionaryLocalesSet(activity);
        treeset.remove(mLocale);
        String s = Locale.getDefault().toString();
        treeset.remove(s);
        treeset.remove("");
        ArrayList arraylist = new ArrayList();
        addLocaleDisplayNameToList(activity, arraylist, mLocale);
        if (!s.equals(mLocale))
            addLocaleDisplayNameToList(activity, arraylist, s);
        for (Iterator iterator = treeset.iterator(); iterator.hasNext(); addLocaleDisplayNameToList(activity, arraylist, (String)iterator.next()));
        if (!"".equals(mLocale))
            addLocaleDisplayNameToList(activity, arraylist, "");
        arraylist.add(new LocaleRenderer(activity, null));
        return arraylist;
    }

    void saveStateIntoBundle(Bundle bundle)
    {
        bundle.putString("word", mWordEditText.getText().toString());
        bundle.putString("originalWord", mOldWord);
        if (mShortcutEditText != null)
            bundle.putString("shortcut", mShortcutEditText.getText().toString());
        if (mOldShortcut != null)
            bundle.putString("originalShortcut", mOldShortcut);
        bundle.putString("locale", mLocale);
    }

    void updateLocale(String s)
    {
        if (s == null)
            s = Locale.getDefault().toString();
        mLocale = s;
    }

}
