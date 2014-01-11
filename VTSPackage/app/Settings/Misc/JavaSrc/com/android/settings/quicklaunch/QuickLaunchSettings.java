// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.quicklaunch;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.ContentObserver;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Handler;
import android.preference.*;
import android.util.*;
import android.view.*;
import android.widget.*;
import java.net.URISyntaxException;

// Referenced classes of package com.android.settings.quicklaunch:
//            ShortcutPreference, BookmarkPicker

public class QuickLaunchSettings extends PreferenceActivity
    implements android.widget.AdapterView.OnItemLongClickListener, android.content.DialogInterface.OnClickListener
{
    private class BookmarksObserver extends ContentObserver
    {

        final QuickLaunchSettings this$0;

        public void onChange(boolean flag)
        {
            super.onChange(flag);
            refreshShortcuts();
        }

        public BookmarksObserver(Handler handler)
        {
            this$0 = QuickLaunchSettings.this;
            super(handler);
        }
    }


    private static final String CLEAR_DIALOG_BOOKMARK_TITLE = "CLEAR_DIALOG_BOOKMARK_TITLE";
    private static final String CLEAR_DIALOG_SHORTCUT = "CLEAR_DIALOG_SHORTCUT";
    private static final int COLUMN_INTENT = 2;
    private static final int COLUMN_SHORTCUT = 0;
    private static final int COLUMN_TITLE = 1;
    private static final String DEFAULT_BOOKMARK_FOLDER = "@quicklaunch";
    private static final int DIALOG_CLEAR_SHORTCUT = 0;
    private static final String KEY_SHORTCUT_CATEGORY = "shortcut_category";
    private static final int REQUEST_PICK_BOOKMARK = 1;
    private static final String TAG = "QuickLaunchSettings";
    private static final String sProjection[] = {
        "shortcut", "title", "intent"
    };
    private static final String sShortcutSelection = "shortcut=?";
    private SparseBooleanArray mBookmarkedShortcuts;
    private Cursor mBookmarksCursor;
    private BookmarksObserver mBookmarksObserver;
    private CharSequence mClearDialogBookmarkTitle;
    private char mClearDialogShortcut;
    private PreferenceGroup mShortcutGroup;
    private SparseArray mShortcutToPreference;
    private Handler mUiHandler;

    public QuickLaunchSettings()
    {
        mUiHandler = new Handler();
    }

    private void clearShortcut(char c)
    {
        ContentResolver contentresolver = getContentResolver();
        android.net.Uri uri = android.provider.Settings.Bookmarks.CONTENT_URI;
        String as[] = new String[1];
        as[0] = String.valueOf(c);
        contentresolver.delete(uri, "shortcut=?", as);
    }

    private ShortcutPreference createPreference(char c)
    {
        ShortcutPreference shortcutpreference = new ShortcutPreference(this, c);
        mShortcutGroup.addPreference(shortcutpreference);
        mShortcutToPreference.put(c, shortcutpreference);
        return shortcutpreference;
    }

    private ShortcutPreference getOrCreatePreference(char c)
    {
        ShortcutPreference shortcutpreference = (ShortcutPreference)mShortcutToPreference.get(c);
        if (shortcutpreference != null)
        {
            return shortcutpreference;
        } else
        {
            Log.w("QuickLaunchSettings", (new StringBuilder()).append("Unknown shortcut '").append(c).append("', creating preference anyway").toString());
            return createPreference(c);
        }
    }

    private void initShortcutPreferences()
    {
        SparseBooleanArray sparsebooleanarray = new SparseBooleanArray();
        KeyCharacterMap keycharactermap = KeyCharacterMap.load(-1);
        for (int i = -1 + KeyEvent.getMaxKeyCode(); i >= 0; i--)
        {
            char c = Character.toLowerCase(keycharactermap.getDisplayLabel(i));
            if (c != 0 && !sparsebooleanarray.get(c, false) && Character.isLetterOrDigit(c))
            {
                sparsebooleanarray.put(c, true);
                createPreference(c);
            }
        }

    }

    private void refreshShortcuts()
    {
        this;
        JVM INSTR monitorenter ;
        Cursor cursor = mBookmarksCursor;
        if (cursor != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (cursor.requery())
            break MISSING_BLOCK_LABEL_39;
        Log.e("QuickLaunchSettings", "Could not requery cursor when refreshing shortcuts.");
          goto _L1
        Exception exception;
        exception;
        throw exception;
        SparseBooleanArray sparsebooleanarray;
        SparseBooleanArray sparsebooleanarray1;
        sparsebooleanarray = mBookmarkedShortcuts;
        sparsebooleanarray1 = new SparseBooleanArray();
_L6:
        if (!cursor.moveToNext()) goto _L4; else goto _L3
_L3:
        char c1 = Character.toLowerCase((char)cursor.getInt(0));
        if (c1 == 0) goto _L6; else goto _L5
_L5:
        ShortcutPreference shortcutpreference1;
        CharSequence charsequence;
        String s;
        PackageManager packagemanager;
        shortcutpreference1 = getOrCreatePreference(c1);
        charsequence = android.provider.Settings.Bookmarks.getTitle(this, cursor);
        s = cursor.getString(cursor.getColumnIndex("intent"));
        packagemanager = getPackageManager();
        ResolveInfo resolveinfo = packagemanager.resolveActivity(Intent.parseUri(s, 0), 0);
        if (resolveinfo == null)
            break MISSING_BLOCK_LABEL_149;
        CharSequence charsequence1 = resolveinfo.loadLabel(packagemanager);
        charsequence = charsequence1;
_L11:
        shortcutpreference1.setTitle(charsequence);
        Object aobj[] = new Object[1];
        aobj[0] = String.valueOf(c1);
        shortcutpreference1.setSummary(getString(0x7f0b06ef, aobj));
        shortcutpreference1.setHasBookmark(true);
        sparsebooleanarray1.put(c1, true);
        if (sparsebooleanarray == null) goto _L6; else goto _L7
_L7:
        sparsebooleanarray.put(c1, false);
          goto _L6
_L4:
        if (sparsebooleanarray == null) goto _L9; else goto _L8
_L8:
        int i = -1 + sparsebooleanarray.size();
_L12:
        if (i < 0) goto _L9; else goto _L10
_L10:
        ShortcutPreference shortcutpreference;
        if (!sparsebooleanarray.valueAt(i))
            break MISSING_BLOCK_LABEL_296;
        char c = (char)sparsebooleanarray.keyAt(i);
        shortcutpreference = (ShortcutPreference)mShortcutToPreference.get(c);
        if (shortcutpreference == null)
            break MISSING_BLOCK_LABEL_296;
        shortcutpreference.setHasBookmark(false);
        break MISSING_BLOCK_LABEL_296;
_L9:
        mBookmarkedShortcuts = sparsebooleanarray1;
        cursor.deactivate();
          goto _L1
        URISyntaxException urisyntaxexception;
        urisyntaxexception;
          goto _L11
        i--;
          goto _L12
    }

    private void showClearDialog(ShortcutPreference shortcutpreference)
    {
        if (!shortcutpreference.hasBookmark())
        {
            return;
        } else
        {
            mClearDialogBookmarkTitle = shortcutpreference.getTitle();
            mClearDialogShortcut = shortcutpreference.getShortcut();
            showDialog(0);
            return;
        }
    }

    private void updateShortcut(char c, Intent intent)
    {
        android.provider.Settings.Bookmarks.add(getContentResolver(), intent, "", "@quicklaunch", c, 0);
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        if (j != -1)
            return;
        if (i == 1)
        {
            if (intent == null)
            {
                Log.w("QuickLaunchSettings", "Result from bookmark picker does not have an intent.");
                return;
            } else
            {
                updateShortcut(intent.getCharExtra("com.android.settings.quicklaunch.SHORTCUT", '\0'), intent);
                return;
            }
        } else
        {
            super.onActivityResult(i, j, intent);
            return;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (mClearDialogShortcut > 0 && i == -1)
            clearShortcut(mClearDialogShortcut);
        mClearDialogBookmarkTitle = null;
        mClearDialogShortcut = '\0';
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050024);
        mShortcutGroup = (PreferenceGroup)findPreference("shortcut_category");
        mShortcutToPreference = new SparseArray();
        mBookmarksObserver = new BookmarksObserver(mUiHandler);
        initShortcutPreferences();
        mBookmarksCursor = managedQuery(android.provider.Settings.Bookmarks.CONTENT_URI, sProjection, null, null);
        getListView().setOnItemLongClickListener(this);
    }

    protected Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 0: // '\0'
            android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(this)).setTitle(getString(0x7f0b06f0)).setIcon(0x1080027);
            Object aobj[] = new Object[2];
            aobj[0] = Character.valueOf(mClearDialogShortcut);
            aobj[1] = mClearDialogBookmarkTitle;
            return builder.setMessage(getString(0x7f0b06f1, aobj)).setPositiveButton(0x7f0b06f2, this).setNegativeButton(0x7f0b06f3, this).create();
        }
        return super.onCreateDialog(i);
    }

    public boolean onItemLongClick(AdapterView adapterview, View view, int i, long l)
    {
        Preference preference = (Preference)getPreferenceScreen().getRootAdapter().getItem(i);
        if (!(preference instanceof ShortcutPreference))
        {
            return false;
        } else
        {
            showClearDialog((ShortcutPreference)preference);
            return true;
        }
    }

    protected void onPause()
    {
        super.onPause();
        getContentResolver().unregisterContentObserver(mBookmarksObserver);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (!(preference instanceof ShortcutPreference))
        {
            return false;
        } else
        {
            ShortcutPreference shortcutpreference = (ShortcutPreference)preference;
            Intent intent = new Intent(this, com/android/settings/quicklaunch/BookmarkPicker);
            intent.putExtra("com.android.settings.quicklaunch.SHORTCUT", shortcutpreference.getShortcut());
            startActivityForResult(intent, 1);
            return true;
        }
    }

    protected void onPrepareDialog(int i, Dialog dialog)
    {
        switch (i)
        {
        case 0: // '\0'
            AlertDialog alertdialog = (AlertDialog)dialog;
            Object aobj[] = new Object[2];
            aobj[0] = Character.valueOf(mClearDialogShortcut);
            aobj[1] = mClearDialogBookmarkTitle;
            alertdialog.setMessage(getString(0x7f0b06f1, aobj));
            return;
        }
    }

    protected void onRestoreInstanceState(Bundle bundle)
    {
        super.onRestoreInstanceState(bundle);
        mClearDialogBookmarkTitle = bundle.getString("CLEAR_DIALOG_BOOKMARK_TITLE");
        mClearDialogShortcut = (char)bundle.getInt("CLEAR_DIALOG_SHORTCUT", 0);
    }

    protected void onResume()
    {
        super.onResume();
        getContentResolver().registerContentObserver(android.provider.Settings.Bookmarks.CONTENT_URI, true, mBookmarksObserver);
        refreshShortcuts();
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putCharSequence("CLEAR_DIALOG_BOOKMARK_TITLE", mClearDialogBookmarkTitle);
        bundle.putInt("CLEAR_DIALOG_SHORTCUT", mClearDialogShortcut);
    }


}
