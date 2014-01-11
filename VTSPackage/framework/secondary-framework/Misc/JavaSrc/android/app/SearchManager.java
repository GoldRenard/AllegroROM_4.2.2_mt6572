// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.database.Cursor;
import android.graphics.Rect;
import android.os.*;
import android.text.TextUtils;
import android.util.Log;
import java.util.List;

// Referenced classes of package android.app:
//            SearchDialog, ISearchManager, SearchableInfo

public class SearchManager
    implements android.content.DialogInterface.OnDismissListener, android.content.DialogInterface.OnCancelListener
{
    public static interface OnCancelListener
    {

        public abstract void onCancel();
    }

    public static interface OnDismissListener
    {

        public abstract void onDismiss();
    }


    public static final String ACTION_KEY = "action_key";
    public static final String ACTION_MSG = "action_msg";
    public static final String APP_DATA = "app_data";
    public static final String CONTEXT_IS_VOICE = "android.search.CONTEXT_IS_VOICE";
    public static final String CURSOR_EXTRA_KEY_IN_PROGRESS = "in_progress";
    private static final boolean DBG = false;
    public static final String DISABLE_VOICE_SEARCH = "android.search.DISABLE_VOICE_SEARCH";
    public static final String EXTRA_DATA_KEY = "intent_extra_data_key";
    public static final String EXTRA_NEW_SEARCH = "new_search";
    public static final String EXTRA_SELECT_QUERY = "select_query";
    public static final String EXTRA_WEB_SEARCH_PENDINGINTENT = "web_search_pendingintent";
    public static final int FLAG_QUERY_REFINEMENT = 1;
    public static final String INTENT_ACTION_GLOBAL_SEARCH = "android.search.action.GLOBAL_SEARCH";
    public static final String INTENT_ACTION_SEARCHABLES_CHANGED = "android.search.action.SEARCHABLES_CHANGED";
    public static final String INTENT_ACTION_SEARCH_SETTINGS = "android.search.action.SEARCH_SETTINGS";
    public static final String INTENT_ACTION_SEARCH_SETTINGS_CHANGED = "android.search.action.SETTINGS_CHANGED";
    public static final String INTENT_ACTION_WEB_SEARCH_SETTINGS = "android.search.action.WEB_SEARCH_SETTINGS";
    public static final String INTENT_GLOBAL_SEARCH_ACTIVITY_CHANGED = "android.search.action.GLOBAL_SEARCH_ACTIVITY_CHANGED";
    public static final char MENU_KEY = 115;
    public static final int MENU_KEYCODE = 47;
    public static final String QUERY = "query";
    public static final String SEARCH_MODE = "search_mode";
    public static final String SHORTCUT_MIME_TYPE = "vnd.android.cursor.item/vnd.android.search.suggest";
    public static final String SUGGEST_COLUMN_FLAGS = "suggest_flags";
    public static final String SUGGEST_COLUMN_FORMAT = "suggest_format";
    public static final String SUGGEST_COLUMN_ICON_1 = "suggest_icon_1";
    public static final String SUGGEST_COLUMN_ICON_2 = "suggest_icon_2";
    public static final String SUGGEST_COLUMN_INTENT_ACTION = "suggest_intent_action";
    public static final String SUGGEST_COLUMN_INTENT_DATA = "suggest_intent_data";
    public static final String SUGGEST_COLUMN_INTENT_DATA_ID = "suggest_intent_data_id";
    public static final String SUGGEST_COLUMN_INTENT_EXTRA_DATA = "suggest_intent_extra_data";
    public static final String SUGGEST_COLUMN_LAST_ACCESS_HINT = "suggest_last_access_hint";
    public static final String SUGGEST_COLUMN_QUERY = "suggest_intent_query";
    public static final String SUGGEST_COLUMN_SHORTCUT_ID = "suggest_shortcut_id";
    public static final String SUGGEST_COLUMN_SPINNER_WHILE_REFRESHING = "suggest_spinner_while_refreshing";
    public static final String SUGGEST_COLUMN_TEXT_1 = "suggest_text_1";
    public static final String SUGGEST_COLUMN_TEXT_2 = "suggest_text_2";
    public static final String SUGGEST_COLUMN_TEXT_2_URL = "suggest_text_2_url";
    public static final String SUGGEST_MIME_TYPE = "vnd.android.cursor.dir/vnd.android.search.suggest";
    public static final String SUGGEST_NEVER_MAKE_SHORTCUT = "_-1";
    public static final String SUGGEST_PARAMETER_LIMIT = "limit";
    public static final String SUGGEST_URI_PATH_QUERY = "search_suggest_query";
    public static final String SUGGEST_URI_PATH_SHORTCUT = "search_suggest_shortcut";
    private static final String TAG = "SearchManager";
    public static final String USER_QUERY = "user_query";
    private static ISearchManager mService;
    private String mAssociatedPackage;
    OnCancelListener mCancelListener;
    private final Context mContext;
    OnDismissListener mDismissListener;
    final Handler mHandler;
    private SearchDialog mSearchDialog;

    SearchManager(Context context, Handler handler)
    {
        mDismissListener = null;
        mCancelListener = null;
        mContext = context;
        mHandler = handler;
        mService = ISearchManager.Stub.asInterface(ServiceManager.getService("search"));
    }

    private void ensureSearchDialog()
    {
        if (mSearchDialog == null)
        {
            mSearchDialog = new SearchDialog(mContext, this);
            mSearchDialog.setOnCancelListener(this);
            mSearchDialog.setOnDismissListener(this);
        }
    }

    public Intent getAssistIntent(Context context)
    {
        return getAssistIntent(context, UserHandle.myUserId());
    }

    public Intent getAssistIntent(Context context, int i)
    {
        if (mService == null)
            return null;
        ComponentName componentname;
        Intent intent;
        try
        {
            componentname = mService.getAssistIntent(i);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("SearchManager", (new StringBuilder()).append("getAssistIntent() failed: ").append(remoteexception).toString());
            return null;
        }
        if (componentname == null)
            return null;
        intent = new Intent("android.intent.action.ASSIST");
        intent.setComponent(componentname);
        return intent;
    }

    public List getGlobalSearchActivities()
    {
        List list;
        try
        {
            list = mService.getGlobalSearchActivities();
        }
        catch (RemoteException remoteexception)
        {
            Log.e("SearchManager", (new StringBuilder()).append("getGlobalSearchActivities() failed: ").append(remoteexception).toString());
            return null;
        }
        return list;
    }

    public ComponentName getGlobalSearchActivity()
    {
        ComponentName componentname;
        try
        {
            componentname = mService.getGlobalSearchActivity();
        }
        catch (RemoteException remoteexception)
        {
            Log.e("SearchManager", (new StringBuilder()).append("getGlobalSearchActivity() failed: ").append(remoteexception).toString());
            return null;
        }
        return componentname;
    }

    public SearchableInfo getSearchableInfo(ComponentName componentname)
    {
        SearchableInfo searchableinfo;
        try
        {
            searchableinfo = mService.getSearchableInfo(componentname);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("SearchManager", (new StringBuilder()).append("getSearchableInfo() failed: ").append(remoteexception).toString());
            return null;
        }
        return searchableinfo;
    }

    public List getSearchablesInGlobalSearch()
    {
        List list;
        try
        {
            list = mService.getSearchablesInGlobalSearch();
        }
        catch (RemoteException remoteexception)
        {
            Log.e("SearchManager", (new StringBuilder()).append("getSearchablesInGlobalSearch() failed: ").append(remoteexception).toString());
            return null;
        }
        return list;
    }

    public Cursor getSuggestions(SearchableInfo searchableinfo, String s)
    {
        return getSuggestions(searchableinfo, s, -1);
    }

    public Cursor getSuggestions(SearchableInfo searchableinfo, String s, int i)
    {
        if (searchableinfo != null)
        {
            String s1 = searchableinfo.getSuggestAuthority();
            if (s1 != null)
            {
                android.net.Uri.Builder builder = (new android.net.Uri.Builder()).scheme("content").authority(s1).query("").fragment("");
                String s2 = searchableinfo.getSuggestPath();
                if (s2 != null)
                    builder.appendEncodedPath(s2);
                builder.appendPath("search_suggest_query");
                String s3 = searchableinfo.getSuggestSelection();
                String as[];
                if (s3 != null)
                {
                    as = (new String[] {
                        s
                    });
                } else
                {
                    builder.appendPath(s);
                    as = null;
                }
                if (i > 0)
                    builder.appendQueryParameter("limit", String.valueOf(i));
                android.net.Uri uri = builder.build();
                return mContext.getContentResolver().query(uri, null, s3, as, null);
            }
        }
        return null;
    }

    public ComponentName getWebSearchActivity()
    {
        ComponentName componentname;
        try
        {
            componentname = mService.getWebSearchActivity();
        }
        catch (RemoteException remoteexception)
        {
            Log.e("SearchManager", (new StringBuilder()).append("getWebSearchActivity() failed: ").append(remoteexception).toString());
            return null;
        }
        return componentname;
    }

    public boolean isVisible()
    {
        if (mSearchDialog == null)
            return false;
        else
            return mSearchDialog.isShowing();
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        if (mCancelListener != null)
            mCancelListener.onCancel();
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        if (mDismissListener != null)
            mDismissListener.onDismiss();
    }

    public void setOnCancelListener(OnCancelListener oncancellistener)
    {
        mCancelListener = oncancellistener;
    }

    public void setOnDismissListener(OnDismissListener ondismisslistener)
    {
        mDismissListener = ondismisslistener;
    }

    void startGlobalSearch(String s, boolean flag, Bundle bundle, Rect rect)
    {
        ComponentName componentname = getGlobalSearchActivity();
        if (componentname == null)
        {
            Log.w("SearchManager", "No global search activity found.");
            return;
        }
        Intent intent = new Intent("android.search.action.GLOBAL_SEARCH");
        intent.addFlags(0x10000000);
        intent.setComponent(componentname);
        Bundle bundle1;
        if (bundle == null)
            bundle1 = new Bundle();
        else
            bundle1 = new Bundle(bundle);
        if (!bundle1.containsKey("source"))
            bundle1.putString("source", mContext.getPackageName());
        intent.putExtra("app_data", bundle1);
        if (!TextUtils.isEmpty(s))
            intent.putExtra("query", s);
        if (flag)
            intent.putExtra("select_query", flag);
        intent.setSourceBounds(rect);
        try
        {
            mContext.startActivity(intent);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("SearchManager", (new StringBuilder()).append("Global search activity not found: ").append(componentname).toString());
        }
    }

    public void startSearch(String s, boolean flag, ComponentName componentname, Bundle bundle, boolean flag1)
    {
        startSearch(s, flag, componentname, bundle, flag1, null);
    }

    public void startSearch(String s, boolean flag, ComponentName componentname, Bundle bundle, boolean flag1, Rect rect)
    {
        if (flag1)
        {
            startGlobalSearch(s, flag, bundle, rect);
            return;
        } else
        {
            ensureSearchDialog();
            mSearchDialog.show(s, flag, componentname, bundle);
            return;
        }
    }

    public void stopSearch()
    {
        if (mSearchDialog != null)
            mSearchDialog.cancel();
    }

    public void triggerSearch(String s, ComponentName componentname, Bundle bundle)
    {
        if (!mAssociatedPackage.equals(componentname.getPackageName()))
            throw new IllegalArgumentException("invoking app search on a different package not associated with this search manager");
        if (s != null && TextUtils.getTrimmedLength(s) != 0)
        {
            startSearch(s, false, componentname, bundle, false);
            mSearchDialog.launchQuerySearch();
            return;
        } else
        {
            Log.w("SearchManager", "triggerSearch called with empty query, ignoring.");
            return;
        }
    }
}
