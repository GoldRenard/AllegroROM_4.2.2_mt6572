// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.ListFragment;
import android.content.*;
import android.database.Cursor;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.text.TextUtils;
import android.view.*;
import android.widget.*;
import com.android.settings.inputmethod.UserDictionaryAddWordFragment;
import java.util.Locale;

public class UserDictionarySettings extends ListFragment
{
    private static class MyAdapter extends SimpleCursorAdapter
        implements SectionIndexer
    {

        private AlphabetIndexer mIndexer;
        private android.widget.SimpleCursorAdapter.ViewBinder mViewBinder;

        public int getPositionForSection(int i)
        {
            if (mIndexer == null)
                return 0;
            else
                return mIndexer.getPositionForSection(i);
        }

        public int getSectionForPosition(int i)
        {
            if (mIndexer == null)
                return 0;
            else
                return mIndexer.getSectionForPosition(i);
        }

        public Object[] getSections()
        {
            if (mIndexer == null)
                return null;
            else
                return mIndexer.getSections();
        }

        public MyAdapter(Context context, int i, Cursor cursor, String as[], int ai[], UserDictionarySettings userdictionarysettings)
        {
            super(context, i, cursor, as, ai);
            mViewBinder = new _cls1();
            if (cursor != null)
            {
                String s = context.getString(0x1040459);
                mIndexer = new AlphabetIndexer(cursor, cursor.getColumnIndexOrThrow("word"), s);
            }
            setViewBinder(mViewBinder);
        }
    }


    private static final String DELETE_SELECTION_WITHOUT_SHORTCUT = "word=? AND shortcut is null OR shortcut=''";
    private static final String DELETE_SELECTION_WITH_SHORTCUT = "word=? AND shortcut=?";
    private static final int INDEX_SHORTCUT = 2;
    private static final int OPTIONS_MENU_ADD = 1;
    private static final String QUERY_PROJECTION[] = {
        "_id", "word", "shortcut"
    };
    private static final String QUERY_SELECTION = "locale=?";
    private static final String QUERY_SELECTION_ALL_LOCALES = "locale is null";
    private static final String TAG = "UserDictionarySettings";
    private Cursor mCursor;
    protected String mLocale;


    private ListAdapter createAdapter()
    {
        return new MyAdapter(getActivity(), 0x7f04009a, mCursor, new String[] {
            "word", "shortcut"
        }, new int[] {
            0x1020014, 0x1020015
        }, this);
    }

    private Cursor createCursor(String s)
    {
        if ("".equals(s))
            return getActivity().managedQuery(android.provider.UserDictionary.Words.CONTENT_URI, QUERY_PROJECTION, "locale is null", null, "UPPER(word)");
        String s1;
        if (s != null)
            s1 = s;
        else
            s1 = Locale.getDefault().toString();
        return getActivity().managedQuery(android.provider.UserDictionary.Words.CONTENT_URI, QUERY_PROJECTION, "locale=?", new String[] {
            s1
        }, "UPPER(word)");
    }

    public static void deleteWord(String s, String s1, ContentResolver contentresolver)
    {
        if (TextUtils.isEmpty(s1))
        {
            contentresolver.delete(android.provider.UserDictionary.Words.CONTENT_URI, "word=? AND shortcut is null OR shortcut=''", new String[] {
                s
            });
            return;
        } else
        {
            contentresolver.delete(android.provider.UserDictionary.Words.CONTENT_URI, "word=? AND shortcut=?", new String[] {
                s, s1
            });
            return;
        }
    }

    private String getShortcut(int i)
    {
        if (mCursor != null)
        {
            mCursor.moveToPosition(i);
            if (!mCursor.isAfterLast())
                return mCursor.getString(mCursor.getColumnIndexOrThrow("shortcut"));
        }
        return null;
    }

    private String getWord(int i)
    {
        if (mCursor != null)
        {
            mCursor.moveToPosition(i);
            if (!mCursor.isAfterLast())
                return mCursor.getString(mCursor.getColumnIndexOrThrow("word"));
        }
        return null;
    }

    private void showAddOrEditDialog(String s, String s1)
    {
        Bundle bundle = new Bundle();
        int i;
        if (s == null)
            i = 1;
        else
            i = 0;
        bundle.putInt("mode", i);
        bundle.putString("word", s);
        bundle.putString("shortcut", s1);
        bundle.putString("locale", mLocale);
        ((PreferenceActivity)getActivity()).startPreferencePanel(com/android/settings/inputmethod/UserDictionaryAddWordFragment.getName(), bundle, 0x7f0b06d9, null, null, 0);
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Intent intent = getActivity().getIntent();
        String s;
        if (intent == null)
            s = null;
        else
            s = intent.getStringExtra("locale");
        Bundle bundle1 = getArguments();
        String s1;
        if (bundle1 == null)
            s1 = null;
        else
            s1 = bundle1.getString("locale");
        String s2;
        if (s1 != null)
            s2 = s1;
        else
        if (s != null)
            s2 = s;
        else
            s2 = null;
        mLocale = s2;
        mCursor = createCursor(s2);
        TextView textview = (TextView)getView().findViewById(0x1020004);
        textview.setText(0x7f0b06e4);
        ListView listview = getListView();
        listview.setAdapter(createAdapter());
        listview.setFastScrollEnabled(true);
        listview.setEmptyView(textview);
        setHasOptionsMenu(true);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
    }

    public void onCreateOptionsMenu(Menu menu, MenuInflater menuinflater)
    {
        menu.add(0, 1, 0, 0x7f0b06d8).setIcon(0x7f020067).setShowAsAction(5);
    }

    public View onCreateView(LayoutInflater layoutinflater, ViewGroup viewgroup, Bundle bundle)
    {
        return layoutinflater.inflate(0x10900a8, viewgroup, false);
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        String s = getWord(i);
        String s1 = getShortcut(i);
        if (s != null)
            showAddOrEditDialog(s, s1);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 1)
        {
            showAddOrEditDialog(null, null);
            return true;
        } else
        {
            return false;
        }
    }


    // Unreferenced inner class com/android/settings/UserDictionarySettings$MyAdapter$1

/* anonymous class */
    class MyAdapter._cls1
        implements android.widget.SimpleCursorAdapter.ViewBinder
    {

        final MyAdapter this$0;

        public boolean setViewValue(View view, Cursor cursor, int i)
        {
            if (i == 2)
            {
                String s = cursor.getString(2);
                if (TextUtils.isEmpty(s))
                {
                    view.setVisibility(8);
                } else
                {
                    ((TextView)view).setText(s);
                    view.setVisibility(0);
                }
                view.invalidate();
                return true;
            } else
            {
                return false;
            }
        }

            
            {
                this$0 = MyAdapter.this;
                super();
            }
    }

}
