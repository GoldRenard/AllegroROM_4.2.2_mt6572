.class public Lcom/android/browser/provider/BrowserProvider2;
.super Lcom/android/browser/provider/SQLiteContentProvider;
.source "BrowserProvider2.java"

# interfaces
.implements Lcom/mediatek/browser/ext/IBrowserProvider2Ex;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;,
        Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;,
        Lcom/android/browser/provider/BrowserProvider2$BookmarkFoldersColumns;,
        Lcom/android/browser/provider/BrowserProvider2$OmniboxSuggestions;,
        Lcom/android/browser/provider/BrowserProvider2$Thumbnails;
    }
.end annotation


# static fields
.field static final ACCOUNTS:I = 0x1b58

.field static final ACCOUNTS_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final BOOKMARKS:I = 0x3e8

.field static final BOOKMARKS_DEFAULT_FOLDER_ID:I = 0x3ed

.field static final BOOKMARKS_FOLDER:I = 0x3ea

.field static final BOOKMARKS_FOLDER_ID:I = 0x3eb

.field static final BOOKMARKS_ID:I = 0x3e9

.field static final BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final BOOKMARKS_SUGGESTIONS:I = 0x3ec

.field private static final BOOKMARK_COLUMN_FOLDER_ID:Ljava/lang/String; = "folder_id"

.field private static final BOOKMARK_COLUMN_VISITS:Ljava/lang/String; = "visits"

.field public static final BOOKMARK_FOLDERS_PROJECTION:[Ljava/lang/String; = null

.field public static final BOOKMARK_FOLDERS_PROJECTION_DATE_INDEX:I = 0x4

.field public static final BOOKMARK_FOLDERS_PROJECTION_FOLDER_LEVEL_INDEX:I = 0x2

.field public static final BOOKMARK_FOLDERS_PROJECTION_ID_INDEX:I = 0x0

.field public static final BOOKMARK_FOLDERS_PROJECTION_NAME_INDEX:I = 0x3

.field public static final BOOKMARK_FOLDERS_PROJECTION_PARENT_ID_INDEX:I = 0x1

.field public static final BOOKMARK_FOLDERS_PROJECTION_VISITS_INDEX:I = 0x5

.field static final COMBINED:I = 0x1770

.field static final COMBINED_BOOKMARK_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final COMBINED_HISTORY_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final COMBINED_ID:I = 0x1771

.field static final DEFAULT_BOOKMARKS_SORT_ORDER:Ljava/lang/String; = "folder DESC, position ASC, _id ASC"

.field static final DEFAULT_BOOKMARKS_SORT_ORDER_SYNC:Ljava/lang/String; = "position ASC, _id ASC"

.field static final DEFAULT_SORT_ACCOUNTS:Ljava/lang/String; = "account_name IS NOT NULL DESC, account_name ASC"

.field static final DEFAULT_SORT_HISTORY:Ljava/lang/String; = "date DESC"

.field public static final FIXED_ID_ROOT:J = 0x1L

.field static final FORMAT_COMBINED_JOIN_SUBQUERY_JOIN_IMAGES:Ljava/lang/String; = "history LEFT OUTER JOIN (%s) bookmarks ON history.url = bookmarks.url LEFT OUTER JOIN images ON history.url = images.url_key"

.field private static final GOOGLE_URL:Ljava/lang/String; = "http://www.google.com/"

.field static final HISTORY:I = 0x7d0

.field static final HISTORY_ID:I = 0x7d1

.field static final HISTORY_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final HOMEPAGE:I = 0x1e

.field static final IMAGES:I = 0x1388

.field static final IMAGES_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final IMAGE_PRUNE:Ljava/lang/String; = "url_key NOT IN (SELECT url FROM bookmarks WHERE url IS NOT NULL AND deleted == 0) AND url_key NOT IN (SELECT url FROM history WHERE url IS NOT NULL)"

.field static final LEGACY:I = 0x2328

.field public static final LEGACY_AUTHORITY:Ljava/lang/String; = "browser"

.field static final LEGACY_AUTHORITY_URI:Landroid/net/Uri; = null

.field static final LEGACY_ID:I = 0x2329

.field static final OMNIBOX_SUGGESTIONS:I = 0x14

.field static final OTHER_BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARAM_ALLOW_EMPTY_ACCOUNTS:Ljava/lang/String; = "allowEmptyAccounts"

.field public static final PARAM_GROUP_BY:Ljava/lang/String; = "groupBy"

.field static final SEARCHES:I = 0xbb8

.field static final SEARCHES_ID:I = 0xbb9

.field static final SEARCHES_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final SETTINGS:I = 0x1f40

.field static final SETTINGS_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final SQL_CREATE_VIEW_OMNIBOX_SUGGESTIONS:Ljava/lang/String; = "CREATE VIEW IF NOT EXISTS v_omnibox_suggestions  AS   SELECT _id, url, title, 1 AS bookmark, 0 AS visits, 0 AS date  FROM bookmarks   WHERE deleted = 0 AND folder = 0   UNION ALL   SELECT _id, url, title, 0 AS bookmark, visits, date   FROM history   WHERE url NOT IN (SELECT url FROM bookmarks    WHERE deleted = 0 AND folder = 0)   ORDER BY bookmark DESC, visits DESC, date DESC "

.field private static final SQL_WHERE_ACCOUNT_HAS_BOOKMARKS:Ljava/lang/String; = "0 < ( SELECT count(*) FROM bookmarks WHERE deleted = 0 AND folder = 0   AND (     v_accounts.account_name = bookmarks.account_name     OR (v_accounts.account_name IS NULL AND bookmarks.account_name IS NULL)   )   AND (     v_accounts.account_type = bookmarks.account_type     OR (v_accounts.account_type IS NULL AND bookmarks.account_type IS NULL)   ) )"

.field private static final SUGGEST_PROJECTION:[Ljava/lang/String; = null

.field private static final SUGGEST_SELECTION:Ljava/lang/String; = "history.url LIKE ? OR history.url LIKE ? OR history.url LIKE ? OR history.url LIKE ? OR history.title LIKE ? OR bookmarks.title LIKE ?"

.field static final SYNCSTATE:I = 0xfa0

.field static final SYNCSTATE_ID:I = 0xfa1

.field static final SYNC_STATE_PROJECTION_MAP:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final TABLE_BOOKMARKS:Ljava/lang/String; = "bookmarks"

.field private static final TABLE_BOOKMARKS_JOIN_HISTORY:Ljava/lang/String; = "history LEFT OUTER JOIN bookmarks ON (history.url = bookmarks.url AND bookmarks.deleted=0 AND bookmarks.folder=0)"

.field static final TABLE_BOOKMARKS_JOIN_IMAGES:Ljava/lang/String; = "bookmarks LEFT OUTER JOIN images ON bookmarks.url = images.url_key"

.field static final TABLE_HISTORY:Ljava/lang/String; = "history"

.field static final TABLE_HISTORY_JOIN_IMAGES:Ljava/lang/String; = "history LEFT OUTER JOIN images ON history.url = images.url_key"

.field static final TABLE_IMAGES:Ljava/lang/String; = "images"

.field static final TABLE_SEARCHES:Ljava/lang/String; = "searches"

.field static final TABLE_SETTINGS:Ljava/lang/String; = "settings"

.field static final TABLE_SNAPSHOTS:Ljava/lang/String; = "snapshots"

.field static final TABLE_SYNC_STATE:Ljava/lang/String; = "syncstate"

.field static final TABLE_THUMBNAILS:Ljava/lang/String; = "thumbnails"

.field static final THUMBNAILS:I = 0xa

.field static final THUMBNAILS_ID:I = 0xb

.field static final URI_MATCHER:Landroid/content/UriMatcher; = null

.field static final VIEW_ACCOUNTS:Ljava/lang/String; = "v_accounts"

.field static final VIEW_OMNIBOX_SUGGESTIONS:Ljava/lang/String; = "v_omnibox_suggestions"

.field static final VIEW_SNAPSHOTS_COMBINED:Ljava/lang/String; = "v_snapshots_combined"

.field private static final XLOGTAG:Ljava/lang/String; = "browser/BrowserProvider"

.field private static final ZERO_QUERY_SUGGEST_SELECTION:Ljava/lang/String; = "history.date != 0"


# instance fields
.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

.field mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

.field mSyncToNetwork:Z

.field mUpdateWidgets:Z

.field mWidgetObserver:Landroid/database/ContentObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/16 v7, 0x3ec

    .line 85
    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    const-string v4, "browser"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "content"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->LEGACY_AUTHORITY_URI:Landroid/net/Uri;

    .line 135
    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "history"

    const-string v5, "_id"

    invoke-static {v4, v5}, Lcom/android/browser/provider/BrowserProvider2;->qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    const-string v4, "history"

    const-string v5, "url"

    invoke-static {v4, v5}, Lcom/android/browser/provider/BrowserProvider2;->qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v9

    const-string v4, "title"

    invoke-static {v4}, Lcom/android/browser/provider/BrowserProvider2;->bookmarkOrHistoryColumn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v10

    const-string v4, "url"

    const v5, 0x7f020020

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f020037

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/android/browser/provider/BrowserProvider2;->bookmarkOrHistoryLiteral(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v11

    const/4 v4, 0x4

    const-string v5, "history"

    const-string v6, "date"

    invoke-static {v5, v6}, Lcom/android/browser/provider/BrowserProvider2;->qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->SUGGEST_PROJECTION:[Ljava/lang/String;

    .line 168
    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "_id"

    aput-object v4, v3, v8

    const-string v4, "parent_id"

    aput-object v4, v3, v9

    const-string v4, "folder_level"

    aput-object v4, v3, v10

    const-string v4, "name"

    aput-object v4, v3, v11

    const/4 v4, 0x4

    const-string v5, "date"

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const-string v5, "visits"

    aput-object v5, v3, v4

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARK_FOLDERS_PROJECTION:[Ljava/lang/String;

    .line 225
    new-instance v3, Landroid/content/UriMatcher;

    const/4 v4, -0x1

    invoke-direct {v3, v4}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    .line 227
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->ACCOUNTS_PROJECTION_MAP:Ljava/util/HashMap;

    .line 228
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    .line 229
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->OTHER_BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    .line 231
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->HISTORY_PROJECTION_MAP:Ljava/util/HashMap;

    .line 232
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->SYNC_STATE_PROJECTION_MAP:Ljava/util/HashMap;

    .line 233
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->IMAGES_PROJECTION_MAP:Ljava/util/HashMap;

    .line 234
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->COMBINED_HISTORY_PROJECTION_MAP:Ljava/util/HashMap;

    .line 235
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->COMBINED_BOOKMARK_PROJECTION_MAP:Ljava/util/HashMap;

    .line 236
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->SEARCHES_PROJECTION_MAP:Ljava/util/HashMap;

    .line 237
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/android/browser/provider/BrowserProvider2;->SETTINGS_PROJECTION_MAP:Ljava/util/HashMap;

    .line 240
    sget-object v2, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    .line 241
    .local v2, matcher:Landroid/content/UriMatcher;
    const-string v0, "com.android.browser"

    .line 242
    .local v0, authority:Ljava/lang/String;
    const-string v3, "com.android.browser"

    const-string v4, "accounts"

    const/16 v5, 0x1b58

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 243
    const-string v3, "com.android.browser"

    const-string v4, "bookmarks"

    const/16 v5, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 244
    const-string v3, "com.android.browser"

    const-string v4, "bookmarks/#"

    const/16 v5, 0x3e9

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 245
    const-string v3, "com.android.browser"

    const-string v4, "bookmarks/folder"

    const/16 v5, 0x3ea

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 246
    const-string v3, "com.android.browser"

    const-string v4, "bookmarks/folder/#"

    const/16 v5, 0x3eb

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 247
    const-string v3, "com.android.browser"

    const-string v4, "bookmarks/folder/id"

    const/16 v5, 0x3ed

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 248
    const-string v3, "com.android.browser"

    const-string v4, "search_suggest_query"

    invoke-virtual {v2, v3, v4, v7}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 251
    const-string v3, "com.android.browser"

    const-string v4, "bookmarks/search_suggest_query"

    invoke-virtual {v2, v3, v4, v7}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 254
    const-string v3, "com.android.browser"

    const-string v4, "history"

    const/16 v5, 0x7d0

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 255
    const-string v3, "com.android.browser"

    const-string v4, "history/#"

    const/16 v5, 0x7d1

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 256
    const-string v3, "com.android.browser"

    const-string v4, "searches"

    const/16 v5, 0xbb8

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 257
    const-string v3, "com.android.browser"

    const-string v4, "searches/#"

    const/16 v5, 0xbb9

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 258
    const-string v3, "com.android.browser"

    const-string v4, "syncstate"

    const/16 v5, 0xfa0

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 259
    const-string v3, "com.android.browser"

    const-string v4, "syncstate/#"

    const/16 v5, 0xfa1

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 260
    const-string v3, "com.android.browser"

    const-string v4, "images"

    const/16 v5, 0x1388

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 261
    const-string v3, "com.android.browser"

    const-string v4, "combined"

    const/16 v5, 0x1770

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 262
    const-string v3, "com.android.browser"

    const-string v4, "combined/#"

    const/16 v5, 0x1771

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 263
    const-string v3, "com.android.browser"

    const-string v4, "settings"

    const/16 v5, 0x1f40

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 264
    const-string v3, "com.android.browser"

    const-string v4, "thumbnails"

    const/16 v5, 0xa

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 265
    const-string v3, "com.android.browser"

    const-string v4, "thumbnails/#"

    const/16 v5, 0xb

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 266
    const-string v3, "com.android.browser"

    const-string v4, "omnibox_suggestions"

    const/16 v5, 0x14

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 268
    sget-object v3, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    const-string v4, "com.android.browser"

    const-string v5, "homepage"

    const/16 v6, 0x1e

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 271
    const-string v3, "browser"

    const-string v4, "searches"

    const/16 v5, 0xbb8

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 272
    const-string v3, "browser"

    const-string v4, "searches/#"

    const/16 v5, 0xbb9

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 273
    const-string v3, "browser"

    const-string v4, "bookmarks"

    const/16 v5, 0x2328

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 274
    const-string v3, "browser"

    const-string v4, "bookmarks/#"

    const/16 v5, 0x2329

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 275
    const-string v3, "browser"

    const-string v4, "search_suggest_query"

    invoke-virtual {v2, v3, v4, v7}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 278
    const-string v3, "browser"

    const-string v4, "bookmarks/search_suggest_query"

    invoke-virtual {v2, v3, v4, v7}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 286
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->ACCOUNTS_PROJECTION_MAP:Ljava/util/HashMap;

    .line 287
    .local v1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "account_type"

    const-string v4, "account_type"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    const-string v3, "account_name"

    const-string v4, "account_name"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    const-string v3, "root_id"

    const-string v4, "root_id"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    .line 293
    const-string v3, "_id"

    const-string v4, "bookmarks"

    const-string v5, "_id"

    invoke-static {v4, v5}, Lcom/android/browser/provider/BrowserProvider2;->qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    const-string v3, "title"

    const-string v4, "title"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    const-string v3, "url"

    const-string v4, "url"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    const-string v3, "favicon"

    const-string v4, "favicon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    const-string v3, "thumbnail"

    const-string v4, "thumbnail"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    const-string v3, "touch_icon"

    const-string v4, "touch_icon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    const-string v3, "folder"

    const-string v4, "folder"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    const-string v3, "parent"

    const-string v4, "parent"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    const-string v3, "position"

    const-string v4, "position"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    const-string v3, "insert_after"

    const-string v4, "insert_after"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    const-string v3, "deleted"

    const-string v4, "deleted"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    const-string v3, "account_name"

    const-string v4, "account_name"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    const-string v3, "account_type"

    const-string v4, "account_type"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    const-string v3, "sourceid"

    const-string v4, "sourceid"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    const-string v3, "version"

    const-string v4, "version"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    const-string v3, "created"

    const-string v4, "created"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    const-string v3, "modified"

    const-string v4, "modified"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    const-string v3, "dirty"

    const-string v4, "dirty"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    const-string v3, "sync1"

    const-string v4, "sync1"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    const-string v3, "sync2"

    const-string v4, "sync2"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    const-string v3, "sync3"

    const-string v4, "sync3"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    const-string v3, "sync4"

    const-string v4, "sync4"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    const-string v3, "sync5"

    const-string v4, "sync5"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    const-string v3, "parent_source"

    const-string v4, "(SELECT sourceid FROM bookmarks A WHERE A._id=bookmarks.parent) AS parent_source"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    const-string v3, "insert_after_source"

    const-string v4, "(SELECT sourceid FROM bookmarks A WHERE A._id=bookmarks.insert_after) AS insert_after_source"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    const-string v3, "type"

    const-string v4, "CASE  WHEN folder=0 THEN 1 WHEN sync3=\'bookmark_bar\' THEN 3 WHEN sync3=\'other_bookmarks\' THEN 4 ELSE 2 END AS type"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    sget-object v3, Lcom/android/browser/provider/BrowserProvider2;->OTHER_BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    sget-object v4, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 338
    sget-object v3, Lcom/android/browser/provider/BrowserProvider2;->OTHER_BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    const-string v4, "position"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-wide v6, 0x7fffffffffffffffL

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AS "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "position"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->HISTORY_PROJECTION_MAP:Ljava/util/HashMap;

    .line 343
    const-string v3, "_id"

    const-string v4, "history"

    const-string v5, "_id"

    invoke-static {v4, v5}, Lcom/android/browser/provider/BrowserProvider2;->qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    const-string v3, "title"

    const-string v4, "title"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    const-string v3, "url"

    const-string v4, "url"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    const-string v3, "favicon"

    const-string v4, "favicon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    const-string v3, "thumbnail"

    const-string v4, "thumbnail"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    const-string v3, "touch_icon"

    const-string v4, "touch_icon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    const-string v3, "created"

    const-string v4, "created"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    const-string v3, "date"

    const-string v4, "date"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    const-string v3, "visits"

    const-string v4, "visits"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    const-string v3, "user_entered"

    const-string v4, "user_entered"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->SYNC_STATE_PROJECTION_MAP:Ljava/util/HashMap;

    .line 356
    const-string v3, "_id"

    const-string v4, "_id"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    const-string v3, "account_name"

    const-string v4, "account_name"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    const-string v3, "account_type"

    const-string v4, "account_type"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    const-string v3, "data"

    const-string v4, "data"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->IMAGES_PROJECTION_MAP:Ljava/util/HashMap;

    .line 363
    const-string v3, "url_key"

    const-string v4, "url_key"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    const-string v3, "favicon"

    const-string v4, "favicon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    const-string v3, "thumbnail"

    const-string v4, "thumbnail"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    const-string v3, "touch_icon"

    const-string v4, "touch_icon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->COMBINED_HISTORY_PROJECTION_MAP:Ljava/util/HashMap;

    .line 370
    const-string v3, "_id"

    const-string v4, "_id"

    invoke-static {v4}, Lcom/android/browser/provider/BrowserProvider2;->bookmarkOrHistoryColumn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    const-string v3, "title"

    const-string v4, "title"

    invoke-static {v4}, Lcom/android/browser/provider/BrowserProvider2;->bookmarkOrHistoryColumn(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    const-string v3, "url"

    const-string v4, "history"

    const-string v5, "url"

    invoke-static {v4, v5}, Lcom/android/browser/provider/BrowserProvider2;->qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    const-string v3, "created"

    const-string v4, "history"

    const-string v5, "created"

    invoke-static {v4, v5}, Lcom/android/browser/provider/BrowserProvider2;->qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    const-string v3, "date"

    const-string v4, "date"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    const-string v3, "bookmark"

    const-string v4, "CASE WHEN bookmarks._id IS NOT NULL THEN 1 ELSE 0 END AS bookmark"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    const-string v3, "visits"

    const-string v4, "visits"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    const-string v3, "favicon"

    const-string v4, "favicon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    const-string v3, "thumbnail"

    const-string v4, "thumbnail"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    const-string v3, "touch_icon"

    const-string v4, "touch_icon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    const-string v3, "user_entered"

    const-string v4, "NULL AS user_entered"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->COMBINED_BOOKMARK_PROJECTION_MAP:Ljava/util/HashMap;

    .line 386
    const-string v3, "_id"

    const-string v4, "_id"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    const-string v3, "title"

    const-string v4, "title"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    const-string v3, "url"

    const-string v4, "url"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    const-string v3, "created"

    const-string v4, "created"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    const-string v3, "date"

    const-string v4, "NULL AS date"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    const-string v3, "bookmark"

    const-string v4, "1 AS bookmark"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    const-string v3, "visits"

    const-string v4, "0 AS visits"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    const-string v3, "favicon"

    const-string v4, "favicon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    const-string v3, "thumbnail"

    const-string v4, "thumbnail"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    const-string v3, "touch_icon"

    const-string v4, "touch_icon"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-string v3, "user_entered"

    const-string v4, "NULL AS user_entered"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->SEARCHES_PROJECTION_MAP:Ljava/util/HashMap;

    .line 400
    const-string v3, "_id"

    const-string v4, "_id"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    const-string v3, "search"

    const-string v4, "search"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    const-string v3, "date"

    const-string v4, "date"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->SETTINGS_PROJECTION_MAP:Ljava/util/HashMap;

    .line 406
    const-string v3, "key"

    const-string v4, "key"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    const-string v3, "value"

    const-string v4, "value"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Lcom/android/browser/provider/SQLiteContentProvider;-><init>()V

    .line 426
    new-instance v0, Lcom/android/common/content/SyncStateContentProviderHelper;

    invoke-direct {v0}, Lcom/android/common/content/SyncStateContentProviderHelper;-><init>()V

    iput-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    .line 428
    iput-object v1, p0, Lcom/android/browser/provider/BrowserProvider2;->mWidgetObserver:Landroid/database/ContentObserver;

    .line 429
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mUpdateWidgets:Z

    .line 430
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mSyncToNetwork:Z

    .line 432
    iput-object v1, p0, Lcom/android/browser/provider/BrowserProvider2;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 2387
    return-void
.end method

.method static synthetic access$100(Lcom/android/browser/provider/BrowserProvider2;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J
    .locals 2
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Lcom/android/browser/provider/BrowserProvider2;->insertSettingsInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$200(Lcom/android/browser/provider/BrowserProvider2;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    .locals 1
    .parameter "x0"

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-object v0
.end method

.method static synthetic access$202(Lcom/android/browser/provider/BrowserProvider2;Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 78
    iput-object p1, p0, Lcom/android/browser/provider/BrowserProvider2;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-object p1
.end method

.method static final bookmarkOrHistoryColumn(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "column"

    .prologue
    .line 411
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CASE WHEN bookmarks."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " IS NOT NULL THEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "bookmarks."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ELSE history."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " END AS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static final bookmarkOrHistoryLiteral(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "column"
    .parameter "bookmarkValue"
    .parameter "historyValue"

    .prologue
    .line 417
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CASE WHEN bookmarks."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " IS NOT NULL THEN \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" ELSE \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" END"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private createCombinedQuery(Landroid/net/Uri;[Ljava/lang/String;Landroid/database/sqlite/SQLiteQueryBuilder;)[Ljava/lang/String;
    .locals 21
    .parameter "uri"
    .parameter "projection"
    .parameter "qb"

    .prologue
    .line 1365
    const/4 v12, 0x0

    .line 1366
    .local v12, args:[Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    const/16 v2, 0x80

    move-object/from16 v0, v19

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1367
    .local v19, whereBuilder:Ljava/lang/StringBuilder;
    const-string v2, "deleted"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1368
    const-string v2, " = 0"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1370
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->getSelectionWithAccounts(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v20

    .line 1371
    .local v20, withAccount:[Ljava/lang/Object;
    const/4 v2, 0x0

    aget-object v16, v20, v2

    check-cast v16, Ljava/lang/String;

    .line 1372
    .local v16, selection:Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v2, v20, v2

    check-cast v2, [Ljava/lang/String;

    move-object/from16 v17, v2

    check-cast v17, [Ljava/lang/String;

    .line 1373
    .local v17, selectionArgs:[Ljava/lang/String;
    if-eqz v16, :cond_0

    .line 1374
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1375
    if-eqz v17, :cond_0

    .line 1377
    move-object/from16 v0, v17

    array-length v2, v0

    mul-int/lit8 v2, v2, 0x2

    new-array v12, v2, [Ljava/lang/String;

    .line 1378
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, v17

    array-length v5, v0

    move-object/from16 v0, v17

    invoke-static {v0, v2, v12, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1379
    const/4 v2, 0x0

    move-object/from16 v0, v17

    array-length v3, v0

    move-object/from16 v0, v17

    array-length v5, v0

    move-object/from16 v0, v17

    invoke-static {v0, v2, v12, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1383
    :cond_0
    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1385
    .local v4, where:Ljava/lang/String;
    const-string v2, "bookmarks"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1386
    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v2, p3

    invoke-virtual/range {v2 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 1388
    .local v18, subQuery:Ljava/lang/String;
    const-string v2, "history LEFT OUTER JOIN (%s) bookmarks ON history.url = bookmarks.url LEFT OUTER JOIN images ON history.url = images.url_key"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v18, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1389
    sget-object v2, Lcom/android/browser/provider/BrowserProvider2;->COMBINED_HISTORY_PROJECTION_MAP:Ljava/util/HashMap;

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1390
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v5, p3

    invoke-virtual/range {v5 .. v11}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1393
    .local v14, historySubQuery:Ljava/lang/String;
    const-string v2, "bookmarks LEFT OUTER JOIN images ON bookmarks.url = images.url_key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1394
    sget-object v2, Lcom/android/browser/provider/BrowserProvider2;->COMBINED_BOOKMARK_PROJECTION_MAP:Ljava/util/HashMap;

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1395
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND %s NOT IN (SELECT %s FROM %s)"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "url"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "url"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "history"

    aput-object v7, v5, v6

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1397
    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v2, p3

    invoke-virtual/range {v2 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1400
    .local v13, bookmarksSubQuery:Ljava/lang/String;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v14, v2, v3

    const/4 v3, 0x1

    aput-object v13, v2, v3

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2, v3, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildUnionQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1403
    .local v15, query:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1404
    const/4 v2, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1405
    return-object v12
.end method

.method private doSuggestQuery(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 11
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "limit"

    .prologue
    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 1331
    aget-object v0, p2, v2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1332
    const-string p1, "history.date != 0"

    .line 1333
    const/4 p2, 0x0

    .line 1356
    :goto_0
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v0}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "history LEFT OUTER JOIN bookmarks ON (history.url = bookmarks.url AND bookmarks.deleted=0 AND bookmarks.folder=0)"

    sget-object v2, Lcom/android/browser/provider/BrowserProvider2;->SUGGEST_PROJECTION:[Ljava/lang/String;

    move-object v3, p1

    move-object v4, p2

    move-object v6, v5

    move-object v7, v5

    move-object v8, v5

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 1360
    .local v9, c:Landroid/database/Cursor;
    new-instance v0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;

    invoke-direct {v0, v9}, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;-><init>(Landroid/database/Cursor;)V

    return-object v0

    .line 1335
    .end local v9           #c:Landroid/database/Cursor;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v1, p2, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1336
    .local v10, like:Ljava/lang/String;
    aget-object v0, p2, v2

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    aget-object v0, p2, v2

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1338
    :cond_1
    aput-object v10, p2, v2

    .line 1340
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "history."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 1342
    :cond_2
    const/4 v0, 0x6

    new-array p2, v0, [Ljava/lang/String;

    .line 1343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p2, v2

    .line 1344
    const/4 v0, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://www."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p2, v0

    .line 1345
    const/4 v0, 0x2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p2, v0

    .line 1346
    const/4 v0, 0x3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://www."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p2, v0

    .line 1348
    const/4 v0, 0x4

    aput-object v10, p2, v0

    .line 1349
    const/4 v0, 0x5

    aput-object v10, p2, v0

    .line 1350
    const-string p1, "history.url LIKE ? OR history.url LIKE ? OR history.url LIKE ? OR history.url LIKE ? OR history.title LIKE ? OR bookmarks.title LIKE ?"

    goto/16 :goto_0
.end method

.method private filterSearchClient(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "url"

    .prologue
    const/4 v3, 0x0

    .line 1807
    const-string v2, "client="

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 1808
    .local v1, index:I
    if-lez v1, :cond_0

    const-string v2, ".google."

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1809
    const/16 v2, 0x26

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 1810
    .local v0, end:I
    if-lez v0, :cond_1

    .line 1811
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1818
    .end local v0           #end:I
    :cond_0
    :goto_0
    return-object p1

    .line 1815
    .restart local v0       #end:I
    :cond_1
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private filterSearchClient([Ljava/lang/String;)V
    .locals 2
    .parameter "selectionArgs"

    .prologue
    .line 1796
    if-eqz p1, :cond_0

    .line 1797
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 1798
    aget-object v1, p1, v0

    invoke-direct {p0, v1}, Lcom/android/browser/provider/BrowserProvider2;->filterSearchClient(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    .line 1797
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1801
    .end local v0           #i:I
    :cond_0
    return-void
.end method

.method private getAccountNameAndType(J)[Ljava/lang/String;
    .locals 11
    .parameter "id"

    .prologue
    const/4 v2, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v3, 0x0

    .line 1752
    const-wide/16 v4, 0x0

    cmp-long v0, p1, v4

    if-gtz v0, :cond_1

    .line 1770
    :cond_0
    :goto_0
    return-object v3

    .line 1755
    :cond_1
    sget-object v0, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 1756
    .local v1, uri:Landroid/net/Uri;
    new-array v2, v2, [Ljava/lang/String;

    const-string v0, "account_name"

    aput-object v0, v2, v9

    const-string v0, "account_type"

    aput-object v0, v2, v10

    move-object v0, p0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Lcom/android/browser/provider/BrowserProvider2;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1759
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 1763
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1764
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1765
    .local v7, parentName:Ljava/lang/String;
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1766
    .local v8, parentType:Ljava/lang/String;
    const/4 v0, 0x2

    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object v7, v3, v0

    const/4 v0, 0x1

    aput-object v8, v3, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1770
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .end local v7           #parentName:Ljava/lang/String;
    .end local v8           #parentType:Ljava/lang/String;
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private static getClientId(Landroid/content/Context;)Ljava/lang/String;
    .locals 8
    .parameter "context"

    .prologue
    .line 920
    const-string v7, "android-google"

    .line 921
    .local v7, ret:Ljava/lang/String;
    const/4 v6, 0x0

    .line 922
    .local v6, c:Landroid/database/Cursor;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 924
    .local v0, cr:Landroid/content/ContentResolver;
    :try_start_0
    const-string v1, "content://com.google.settings/partner"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "value"

    aput-object v4, v2, v3

    const-string v3, "name=\'client_id\'"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 926
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 927
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 932
    :cond_0
    if-eqz v6, :cond_1

    .line 933
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 936
    :cond_1
    :goto_0
    return-object v7

    .line 929
    :catch_0
    move-exception v1

    .line 932
    if-eqz v6, :cond_1

    .line 933
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 932
    :catchall_0
    move-exception v1

    if-eqz v6, :cond_2

    .line 933
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v1
.end method

.method private getHomePage(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .parameter "context"

    .prologue
    .line 2381
    invoke-static {p1}, Lcom/android/browser/BrowserSettings;->getFactoryResetUrlFromRes(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 2382
    .local v0, factoryResetUrl:Ljava/lang/String;
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2383
    .local v1, p:Landroid/content/SharedPreferences;
    const-string v3, "homepage"

    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2384
    .local v2, url:Ljava/lang/String;
    return-object v2
.end method

.method private insertSearchesInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J
    .locals 12
    .parameter "db"
    .parameter "values"

    .prologue
    .line 1825
    const-string v0, "search"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1826
    .local v11, search:Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1827
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Must include the SEARCH field"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1829
    :cond_0
    const/4 v8, 0x0

    .line 1831
    .local v8, cursor:Landroid/database/Cursor;
    :try_start_0
    const-string v1, "searches"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const-string v3, "search=?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object v11, v4, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1833
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1834
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    .line 1835
    .local v9, id:J
    const-string v0, "searches"

    const-string v1, "_id=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p1, v0, p2, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1842
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .end local v9           #id:J
    :cond_1
    :goto_0
    return-wide v9

    .line 1839
    :cond_2
    :try_start_1
    const-string v0, "searches"

    const-string v1, "search"

    invoke-virtual {p1, v0, v1, p2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v9

    .line 1842
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    if-eqz v8, :cond_3

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private insertSettingsInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J
    .locals 12
    .parameter "db"
    .parameter "values"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1850
    const-string v0, "key"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1851
    .local v11, key:Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1852
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Must include the KEY field"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1854
    :cond_0
    new-array v4, v2, [Ljava/lang/String;

    aput-object v11, v4, v1

    .line 1855
    .local v4, keyArray:[Ljava/lang/String;
    const/4 v8, 0x0

    .line 1857
    .local v8, cursor:Landroid/database/Cursor;
    :try_start_0
    const-string v1, "settings"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "key"

    aput-object v3, v2, v0

    const-string v3, "key=?"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1859
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1860
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    .line 1861
    .local v9, id:J
    const-string v0, "settings"

    const-string v1, "key=?"

    invoke-virtual {p1, v0, p2, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1867
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .end local v9           #id:J
    :cond_1
    :goto_0
    return-wide v9

    .line 1864
    :cond_2
    :try_start_1
    const-string v0, "settings"

    const-string v1, "value"

    invoke-virtual {p1, v0, v1, p2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v9

    .line 1867
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    if-eqz v8, :cond_3

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private isValidAccountName(JLjava/lang/String;)Z
    .locals 11
    .parameter "parentId"
    .parameter "title"

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 1715
    const-string v0, "browser/BrowserProvider"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BrowserProvider2.isValidAccountName parentId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " title:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1717
    const-wide/16 v2, 0x0

    cmp-long v0, p1, v2

    if-lez v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v0, v9

    .line 1748
    :goto_0
    return v0

    .line 1720
    :cond_1
    sget-object v1, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    .line 1721
    .local v1, uri:Landroid/net/Uri;
    const/4 v6, 0x0

    .line 1723
    .local v6, cursor:Landroid/database/Cursor;
    const/4 v0, 0x1

    :try_start_0
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "title"

    aput-object v3, v2, v0

    const-string v3, "parent = ? AND deleted = ? AND folder = ?"

    const/4 v0, 0x3

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, ""

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v0, 0x1

    const-string v5, "0"

    aput-object v5, v4, v0

    const/4 v0, 0x2

    const-string v5, "1"

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/android/browser/provider/BrowserProvider2;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1730
    if-eqz v6, :cond_2

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_4

    .line 1742
    :cond_2
    if-eqz v6, :cond_3

    .line 1743
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    move v0, v9

    goto :goto_0

    .line 1734
    :cond_4
    :try_start_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1735
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    if-eqz v0, :cond_4

    .line 1742
    if-eqz v6, :cond_5

    .line 1743
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_5
    move v0, v8

    goto :goto_0

    .line 1742
    :cond_6
    if-eqz v6, :cond_7

    .line 1743
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_7
    :goto_1
    move v0, v9

    .line 1748
    goto :goto_0

    .line 1739
    :catch_0
    move-exception v7

    .line 1740
    .local v7, e:Ljava/lang/IllegalStateException;
    :try_start_2
    const-string v0, "browser/BrowserProvider"

    invoke-virtual {v7}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1742
    if-eqz v6, :cond_7

    .line 1743
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1742
    .end local v7           #e:Ljava/lang/IllegalStateException;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_8

    .line 1743
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_8
    throw v0
.end method

.method private isValidParent(Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 4
    .parameter "accountType"
    .parameter "accountName"
    .parameter "parentId"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1786
    invoke-direct {p0, p3, p4}, Lcom/android/browser/provider/BrowserProvider2;->getAccountNameAndType(J)[Ljava/lang/String;

    move-result-object v0

    .line 1787
    .local v0, parent:[Ljava/lang/String;
    if-eqz v0, :cond_0

    aget-object v3, v0, v2

    invoke-static {p2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    aget-object v3, v0, v1

    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1792
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method static final qualifyColumn(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "table"
    .parameter "column"

    .prologue
    .line 422
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AS "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static replaceSystemPropertyInString(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 9
    .parameter "context"
    .parameter "srcString"

    .prologue
    .line 942
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 943
    .local v7, sb:Ljava/lang/StringBuffer;
    const/4 v5, 0x0

    .line 945
    .local v5, lastCharLoc:I
    invoke-static {p0}, Lcom/android/browser/provider/BrowserProvider2;->getClientId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 947
    .local v1, clientId:Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-ge v2, v8, :cond_3

    .line 948
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 949
    .local v0, c:C
    const/16 v8, 0x7b

    if-ne v0, v8, :cond_0

    .line 950
    invoke-interface {p1, v5, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuffer;

    .line 951
    move v5, v2

    .line 953
    move v3, v2

    .local v3, j:I
    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-ge v3, v8, :cond_0

    .line 954
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 955
    .local v4, k:C
    const/16 v8, 0x7d

    if-ne v4, v8, :cond_2

    .line 956
    add-int/lit8 v8, v2, 0x1

    invoke-interface {p1, v8, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 957
    .local v6, propertyKeyValue:Ljava/lang/String;
    const-string v8, "CLIENT_ID"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 958
    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 962
    :goto_2
    add-int/lit8 v5, v3, 0x1

    .line 963
    move v2, v3

    .line 947
    .end local v3           #j:I
    .end local v4           #k:C
    .end local v6           #propertyKeyValue:Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 960
    .restart local v3       #j:I
    .restart local v4       #k:C
    .restart local v6       #propertyKeyValue:Ljava/lang/String;
    :cond_1
    const-string v8, "unknown"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 953
    .end local v6           #propertyKeyValue:Ljava/lang/String;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 969
    .end local v0           #c:C
    .end local v3           #j:I
    .end local v4           #k:C
    :cond_3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v8

    sub-int/2addr v8, v5

    if-lez v8, :cond_4

    .line 971
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v8

    invoke-interface {p1, v5, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuffer;

    .line 973
    :cond_4
    return-object v7
.end method

.method private setHomePage(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .parameter "context"
    .parameter "url"

    .prologue
    .line 2370
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_1

    .line 2371
    :cond_0
    const/4 v2, 0x0

    .line 2377
    :goto_0
    return v2

    .line 2373
    :cond_1
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2374
    .local v1, p:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2375
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "homepage"

    invoke-interface {v0, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 2376
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2377
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private setParentValues(JLandroid/content/ContentValues;)Z
    .locals 4
    .parameter "parentId"
    .parameter "values"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1775
    invoke-direct {p0, p1, p2}, Lcom/android/browser/provider/BrowserProvider2;->getAccountNameAndType(J)[Ljava/lang/String;

    move-result-object v0

    .line 1776
    .local v0, parent:[Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1781
    :goto_0
    return v1

    .line 1779
    :cond_0
    const-string v3, "account_name"

    aget-object v1, v0, v1

    invoke-virtual {p3, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1780
    const-string v1, "account_type"

    aget-object v3, v0, v2

    invoke-virtual {p3, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    move v1, v2

    .line 1781
    goto :goto_0
.end method

.method private shouldUpdateImages(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)Z
    .locals 16
    .parameter "db"
    .parameter "url"
    .parameter "values"

    .prologue
    .line 2035
    const/4 v1, 0x3

    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "favicon"

    aput-object v2, v3, v1

    const/4 v1, 0x1

    const-string v2, "thumbnail"

    aput-object v2, v3, v1

    const/4 v1, 0x2

    const-string v2, "touch_icon"

    aput-object v2, v3, v1

    .line 2040
    .local v3, projection:[Ljava/lang/String;
    const-string v2, "images"

    const-string v4, "url_key=?"

    const/4 v1, 0x1

    new-array v5, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v5, v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 2042
    .local v12, cursor:Landroid/database/Cursor;
    const-string v1, "favicon"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v13

    .line 2043
    .local v13, nfavicon:[B
    const-string v1, "thumbnail"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v14

    .line 2044
    .local v14, nthumb:[B
    const-string v1, "touch_icon"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v15

    .line 2045
    .local v15, ntouch:[B
    const/4 v9, 0x0

    .line 2046
    .local v9, cfavicon:[B
    const/4 v10, 0x0

    .line 2047
    .local v10, cthumb:[B
    const/4 v11, 0x0

    .line 2049
    .local v11, ctouch:[B
    :try_start_0
    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-gtz v1, :cond_2

    .line 2050
    if-nez v13, :cond_0

    if-nez v14, :cond_0

    if-eqz v15, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 2073
    :goto_0
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 2075
    :goto_1
    return v1

    .line 2050
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 2052
    :cond_2
    :try_start_1
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2053
    if-eqz v13, :cond_3

    .line 2054
    const/4 v1, 0x0

    invoke-interface {v12, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v9

    .line 2055
    invoke-static {v13, v9}, Ljava/util/Arrays;->equals([B[B)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-nez v1, :cond_3

    .line 2056
    const/4 v1, 0x1

    .line 2073
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 2059
    :cond_3
    if-eqz v14, :cond_4

    .line 2060
    const/4 v1, 0x1

    :try_start_2
    invoke-interface {v12, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v10

    .line 2061
    invoke-static {v14, v10}, Ljava/util/Arrays;->equals([B[B)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v1

    if-nez v1, :cond_4

    .line 2062
    const/4 v1, 0x1

    .line 2073
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 2065
    :cond_4
    if-eqz v15, :cond_2

    .line 2066
    const/4 v1, 0x2

    :try_start_3
    invoke-interface {v12, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v11

    .line 2067
    invoke-static {v15, v11}, Ljava/util/Arrays;->equals([B[B)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v1

    if-nez v1, :cond_2

    .line 2068
    const/4 v1, 0x1

    .line 2073
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :cond_5
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 2075
    const/4 v1, 0x0

    goto :goto_1

    .line 2073
    :catchall_0
    move-exception v1

    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    throw v1
.end method


# virtual methods
.method public addDefaultBookmarksHost(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;II)I
    .locals 9
    .parameter "db"
    .parameter "parentId"
    .parameter "bookmarks"
    .parameter "operatorId"
    .parameter "position"

    .prologue
    const-wide/16 v7, 0x1

    .line 437
    const-string v0, "browser/BrowserProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parentId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "position: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    const/4 v5, 0x0

    .line 439
    .local v5, preloads:Landroid/content/res/TypedArray;
    packed-switch p5, :pswitch_data_0

    .line 458
    :goto_0
    return p6

    .line 441
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08005a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 442
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move v6, p6

    #calls: Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I
    invoke-static/range {v0 .. v6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->access$000(Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I

    move-result p6

    .line 443
    goto :goto_0

    .line 445
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080059

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 446
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move v6, p6

    #calls: Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I
    invoke-static/range {v0 .. v6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->access$000(Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;Landroid/database/sqlite/SQLiteDatabase;J[Ljava/lang/CharSequence;Landroid/content/res/TypedArray;I)I

    move-result p6

    .line 449
    if-lez p6, :cond_0

    const/4 v0, 0x1

    :goto_1
    add-int/2addr p6, v0

    .line 451
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v0, p1, v7, v8, p6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarksForYahoo(Landroid/database/sqlite/SQLiteDatabase;JI)I

    move-result p6

    .line 453
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v0, p1, v7, v8, p6}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->addDefaultBookmarks(Landroid/database/sqlite/SQLiteDatabase;JI)I

    move-result p6

    .line 454
    goto :goto_0

    .line 449
    :cond_0
    const/4 v0, 0x2

    goto :goto_1

    .line 439
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method appendAccountToSelection(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "uri"
    .parameter "selection"

    .prologue
    .line 2277
    const-string v5, "account_name"

    invoke-virtual {p1, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2278
    .local v0, accountName:Ljava/lang/String;
    const-string v5, "account_type"

    invoke-virtual {p1, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2280
    .local v1, accountType:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    xor-int v2, v5, v6

    .line 2281
    .local v2, partialUri:Z
    if-eqz v2, :cond_0

    .line 2283
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Must specify both or neither of ACCOUNT_NAME and ACCOUNT_TYPE for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 2289
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const/4 v4, 0x1

    .line 2290
    .local v4, validAccount:Z
    :goto_0
    if-eqz v4, :cond_2

    .line 2291
    new-instance v3, Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "account_name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "account_type"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2295
    .local v3, selectionSb:Ljava/lang/StringBuilder;
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 2296
    const-string v5, " AND ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2297
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2298
    const/16 v5, 0x29

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2300
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2302
    .end local v3           #selectionSb:Ljava/lang/StringBuilder;
    .end local p2
    :cond_2
    return-object p2

    .line 2289
    .end local v4           #validAccount:Z
    .restart local p2
    :cond_3
    const/4 v4, 0x0

    goto :goto_0
.end method

.method deleteBookmarks(Ljava/lang/String;[Ljava/lang/String;Z)I
    .locals 5
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "callerIsSyncAdapter"

    .prologue
    .line 1411
    iget-object v2, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v2}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1412
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    if-eqz p3, :cond_0

    .line 1413
    const-string v2, "bookmarks"

    invoke-virtual {v0, v2, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 1418
    :goto_0
    return v2

    .line 1415
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1416
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "modified"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1417
    const-string v2, "deleted"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1418
    invoke-virtual {p0, v1, p1, p2, p3}, Lcom/android/browser/provider/BrowserProvider2;->updateBookmarksInTransaction(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v2

    goto :goto_0
.end method

.method public deleteInTransaction(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Z)I
    .locals 22
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "callerIsSyncAdapter"

    .prologue
    .line 1425
    sget-object v7, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v18

    .line 1426
    .local v18, match:I
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v7}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 1427
    .local v5, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v14, 0x0

    .line 1428
    .local v14, deleted:I
    sparse-switch v18, :sswitch_data_0

    .line 1535
    new-instance v7, Ljava/lang/UnsupportedOperationException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unknown delete URI "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1430
    :sswitch_0
    const-string v7, "bookmarks._id=?"

    move-object/from16 v0, p2

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1432
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    move-object/from16 v0, p3

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    .line 1438
    :sswitch_1
    invoke-virtual/range {p0 .. p3}, Lcom/android/browser/provider/BrowserProvider2;->getSelectionWithAccounts(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v21

    .line 1439
    .local v21, withAccount:[Ljava/lang/Object;
    const/4 v7, 0x0

    aget-object p2, v21, v7

    .end local p2
    check-cast p2, Ljava/lang/String;

    .line 1440
    .restart local p2
    const/4 v7, 0x1

    aget-object v7, v21, v7

    check-cast v7, [Ljava/lang/String;

    move-object/from16 p3, v7

    check-cast p3, [Ljava/lang/String;

    .line 1441
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->deleteBookmarks(Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v14

    .line 1442
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->pruneImages()I

    .line 1443
    if-lez v14, :cond_0

    .line 1444
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->refreshWidgets()V

    .line 1538
    .end local v21           #withAccount:[Ljava/lang/Object;
    :cond_0
    :goto_0
    if-lez v14, :cond_1

    .line 1539
    invoke-virtual/range {p0 .. p1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 1540
    invoke-virtual/range {p0 .. p1}, Lcom/android/browser/provider/BrowserProvider2;->shouldNotifyLegacy(Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1541
    sget-object v7, Lcom/android/browser/provider/BrowserProvider2;->LEGACY_AUTHORITY_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 1544
    :cond_1
    return v14

    .line 1450
    :sswitch_2
    const-string v7, "history._id=?"

    move-object/from16 v0, p2

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1451
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    move-object/from16 v0, p3

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    .line 1456
    :sswitch_3
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->filterSearchClient([Ljava/lang/String;)V

    .line 1457
    const-string v7, "history"

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v5, v7, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    .line 1458
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->pruneImages()I

    goto :goto_0

    .line 1463
    :sswitch_4
    const-string v7, "searches._id=?"

    move-object/from16 v0, p2

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1464
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    move-object/from16 v0, p3

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    .line 1469
    :sswitch_5
    const-string v7, "searches"

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v5, v7, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    .line 1470
    goto :goto_0

    .line 1474
    :sswitch_6
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v7, v5, v0, v1}, Lcom/android/common/content/SyncStateContentProviderHelper;->delete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    .line 1475
    goto :goto_0

    .line 1478
    :sswitch_7
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "_id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-nez p2, :cond_2

    const-string v7, ""

    :goto_1
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 1481
    .local v19, selectionWithId:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-virtual {v7, v5, v0, v1}, Lcom/android/common/content/SyncStateContentProviderHelper;->delete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    .line 1482
    goto/16 :goto_0

    .line 1478
    .end local v19           #selectionWithId:Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " AND ("

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, ")"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 1485
    :sswitch_8
    const-string v7, "_id = CAST(? AS INTEGER)"

    move-object/from16 v0, p2

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1487
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    move-object/from16 v0, p3

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    .line 1492
    :sswitch_9
    const/4 v7, 0x3

    new-array v6, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "_id"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-string v8, "bookmark"

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-string v8, "url"

    aput-object v8, v6, v7

    .line 1494
    .local v6, projection:[Ljava/lang/String;
    new-instance v4, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v4}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1495
    .local v4, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6, v4}, Lcom/android/browser/provider/BrowserProvider2;->createCombinedQuery(Landroid/net/Uri;[Ljava/lang/String;Landroid/database/sqlite/SQLiteQueryBuilder;)[Ljava/lang/String;

    move-result-object v12

    .line 1496
    .local v12, args:[Ljava/lang/String;
    if-nez p3, :cond_3

    .line 1497
    move-object/from16 p3, v12

    .line 1502
    :goto_2
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 1504
    .local v13, c:Landroid/database/Cursor;
    :goto_3
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1505
    const/4 v7, 0x0

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    .line 1506
    .local v15, id:J
    const/4 v7, 0x1

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    if-eqz v7, :cond_4

    const/16 v17, 0x1

    .line 1507
    .local v17, isBookmark:Z
    :goto_4
    const/4 v7, 0x2

    invoke-interface {v13, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 1508
    .local v20, url:Ljava/lang/String;
    if-eqz v17, :cond_5

    .line 1509
    const-string v7, "_id=?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    move-object/from16 v0, p0

    move/from16 v1, p4

    invoke-virtual {v0, v7, v8, v1}, Lcom/android/browser/provider/BrowserProvider2;->deleteBookmarks(Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v7

    add-int/2addr v14, v7

    .line 1512
    const-string v7, "history"

    const-string v8, "url=?"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v20, v9, v10

    invoke-virtual {v5, v7, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_3

    .line 1499
    .end local v13           #c:Landroid/database/Cursor;
    .end local v15           #id:J
    .end local v17           #isBookmark:Z
    .end local v20           #url:Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p3

    invoke-static {v12, v0}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    goto :goto_2

    .line 1506
    .restart local v13       #c:Landroid/database/Cursor;
    .restart local v15       #id:J
    :cond_4
    const/16 v17, 0x0

    goto :goto_4

    .line 1515
    .restart local v17       #isBookmark:Z
    .restart local v20       #url:Ljava/lang/String;
    :cond_5
    const-string v7, "history"

    const-string v8, "_id=?"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v5, v7, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    add-int/2addr v14, v7

    goto :goto_3

    .line 1520
    .end local v15           #id:J
    .end local v17           #isBookmark:Z
    .end local v20           #url:Ljava/lang/String;
    :cond_6
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 1524
    .end local v4           #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .end local v6           #projection:[Ljava/lang/String;
    .end local v12           #args:[Ljava/lang/String;
    .end local v13           #c:Landroid/database/Cursor;
    :sswitch_a
    const-string v7, "_id = ?"

    move-object/from16 v0, p2

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1526
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    move-object/from16 v0, p3

    invoke-static {v0, v7}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    .line 1531
    :sswitch_b
    const-string v7, "thumbnails"

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v5, v7, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    .line 1532
    goto/16 :goto_0

    .line 1428
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_b
        0xb -> :sswitch_a
        0x3e8 -> :sswitch_1
        0x3e9 -> :sswitch_0
        0x7d0 -> :sswitch_3
        0x7d1 -> :sswitch_2
        0xbb8 -> :sswitch_5
        0xbb9 -> :sswitch_4
        0xfa0 -> :sswitch_6
        0xfa1 -> :sswitch_7
        0x2328 -> :sswitch_9
        0x2329 -> :sswitch_8
    .end sparse-switch
.end method

.method extractImageValues(Landroid/content/ContentValues;Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 3
    .parameter "values"
    .parameter "url"

    .prologue
    .line 2307
    const/4 v0, 0x0

    .line 2309
    .local v0, imageValues:Landroid/content/ContentValues;
    const-string v1, "favicon"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2310
    new-instance v0, Landroid/content/ContentValues;

    .end local v0           #imageValues:Landroid/content/ContentValues;
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2311
    .restart local v0       #imageValues:Landroid/content/ContentValues;
    const-string v1, "favicon"

    const-string v2, "favicon"

    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2312
    const-string v1, "favicon"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 2316
    :cond_0
    const-string v1, "thumbnail"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2317
    if-nez v0, :cond_1

    .line 2318
    new-instance v0, Landroid/content/ContentValues;

    .end local v0           #imageValues:Landroid/content/ContentValues;
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2320
    .restart local v0       #imageValues:Landroid/content/ContentValues;
    :cond_1
    const-string v1, "thumbnail"

    const-string v2, "thumbnail"

    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2321
    const-string v1, "thumbnail"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 2325
    :cond_2
    const-string v1, "touch_icon"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2326
    if-nez v0, :cond_3

    .line 2327
    new-instance v0, Landroid/content/ContentValues;

    .end local v0           #imageValues:Landroid/content/ContentValues;
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2329
    .restart local v0       #imageValues:Landroid/content/ContentValues;
    :cond_3
    const-string v1, "touch_icon"

    const-string v2, "touch_icon"

    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2330
    const-string v1, "touch_icon"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 2333
    :cond_4
    if-eqz v0, :cond_5

    .line 2334
    const-string v1, "url_key"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2336
    :cond_5
    return-object v0
.end method

.method public getDatabaseHelper(Landroid/content/Context;)Landroid/database/sqlite/SQLiteOpenHelper;
    .locals 1
    .parameter "context"

    .prologue
    .line 978
    monitor-enter p0

    .line 979
    :try_start_0
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    if-nez v0, :cond_0

    .line 980
    new-instance v0, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-direct {v0, p0, p1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;-><init>(Lcom/android/browser/provider/BrowserProvider2;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    .line 982
    :cond_0
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    monitor-exit p0

    return-object v0

    .line 983
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method getSelectionWithAccounts(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/Object;
    .locals 7
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1044
    const-string v3, "acct_type"

    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1045
    .local v1, accountType:Ljava/lang/String;
    const-string v3, "acct_name"

    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1046
    .local v0, accountName:Ljava/lang/String;
    const/4 v2, 0x0

    .line 1047
    .local v2, hasAccounts:Z
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 1048
    invoke-virtual {p0, v1}, Lcom/android/browser/provider/BrowserProvider2;->isNullAccount(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {p0, v0}, Lcom/android/browser/provider/BrowserProvider2;->isNullAccount(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1049
    const-string v3, "account_type=? AND account_name=? "

    invoke-static {p2, v3}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1051
    new-array v3, v6, [Ljava/lang/String;

    aput-object v1, v3, v4

    aput-object v0, v3, v5

    invoke-static {p3, v3}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    .line 1053
    const/4 v2, 0x1

    .line 1060
    :cond_0
    :goto_0
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p2, v3, v4

    aput-object p3, v3, v5

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v6

    return-object v3

    .line 1055
    :cond_1
    const-string v3, "account_name IS NULL AND account_type IS NULL"

    invoke-static {p2, v3}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .parameter "uri"

    .prologue
    .line 1016
    sget-object v1, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    .line 1017
    .local v0, match:I
    sparse-switch v0, :sswitch_data_0

    .line 1033
    const/4 v1, 0x0

    :goto_0
    return-object v1

    .line 1020
    :sswitch_0
    const-string v1, "vnd.android.cursor.dir/bookmark"

    goto :goto_0

    .line 1023
    :sswitch_1
    const-string v1, "vnd.android.cursor.item/bookmark"

    goto :goto_0

    .line 1025
    :sswitch_2
    const-string v1, "vnd.android.cursor.dir/browser-history"

    goto :goto_0

    .line 1027
    :sswitch_3
    const-string v1, "vnd.android.cursor.item/browser-history"

    goto :goto_0

    .line 1029
    :sswitch_4
    const-string v1, "vnd.android.cursor.dir/searches"

    goto :goto_0

    .line 1031
    :sswitch_5
    const-string v1, "vnd.android.cursor.item/searches"

    goto :goto_0

    .line 1017
    nop

    :sswitch_data_0
    .sparse-switch
        0x3e8 -> :sswitch_0
        0x3e9 -> :sswitch_1
        0x7d0 -> :sswitch_2
        0x7d1 -> :sswitch_3
        0xbb8 -> :sswitch_4
        0xbb9 -> :sswitch_5
        0x2328 -> :sswitch_0
        0x2329 -> :sswitch_1
    .end sparse-switch
.end method

.method getUrlCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)I
    .locals 10
    .parameter "db"
    .parameter "table"
    .parameter "url"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v1, 0x0

    .line 2079
    new-array v2, v4, [Ljava/lang/String;

    const-string v0, "COUNT(*)"

    aput-object v0, v2, v1

    const-string v3, "url = ?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object p3, v4, v1

    move-object v0, p1

    move-object v1, p2

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2082
    .local v8, c:Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 2083
    .local v9, count:I
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2084
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v9

    .line 2088
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    return v9

    :catchall_0
    move-exception v0

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public insertInTransaction(Landroid/net/Uri;Landroid/content/ContentValues;Z)Landroid/net/Uri;
    .locals 26
    .parameter "uri"
    .parameter "values"
    .parameter "callerIsSyncAdapter"

    .prologue
    .line 1568
    sget-object v22, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v16

    .line 1569
    .local v16, match:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    .line 1570
    .local v8, db:Landroid/database/sqlite/SQLiteDatabase;
    const-wide/16 v11, -0x1

    .line 1571
    .local v11, id:J
    const/16 v22, 0x2328

    move/from16 v0, v16

    move/from16 v1, v22

    if-ne v0, v1, :cond_1

    .line 1573
    const-string v22, "bookmark"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    .line 1574
    .local v6, bookmark:Ljava/lang/Integer;
    const-string v22, "bookmark"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 1575
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v22

    if-nez v22, :cond_2

    .line 1576
    :cond_0
    const/16 v16, 0x7d0

    .line 1585
    .end local v6           #bookmark:Ljava/lang/Integer;
    :cond_1
    :goto_0
    sparse-switch v16, :sswitch_data_0

    .line 1696
    new-instance v22, Ljava/lang/UnsupportedOperationException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Unknown insert URI "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 1578
    .restart local v6       #bookmark:Ljava/lang/Integer;
    :cond_2
    const/16 v16, 0x3e8

    .line 1579
    const-string v22, "date"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 1580
    const-string v22, "visits"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 1581
    const-string v22, "user_entered"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 1582
    const-string v22, "folder"

    const/16 v23, 0x0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    .line 1588
    .end local v6           #bookmark:Ljava/lang/Integer;
    :sswitch_0
    if-nez p3, :cond_5

    .line 1589
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    .line 1590
    .local v17, now:J
    const-string v22, "created"

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1591
    const-string v22, "modified"

    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1592
    const-string v22, "dirty"

    const/16 v23, 0x1

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1594
    const-string v22, "account_type"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_3

    const-string v22, "account_name"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_6

    :cond_3
    const/4 v9, 0x1

    .line 1596
    .local v9, hasAccounts:Z
    :goto_1
    const-string v22, "account_type"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1598
    .local v5, accountType:Ljava/lang/String;
    const-string v22, "account_name"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1600
    .local v4, accountName:Ljava/lang/String;
    const-string v22, "parent"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v10

    .line 1601
    .local v10, hasParent:Z
    if-eqz v10, :cond_7

    if-eqz v9, :cond_7

    .line 1603
    const-string v22, "parent"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    .line 1604
    .local v19, parentId:J
    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    invoke-direct {v0, v5, v4, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->isValidParent(Ljava/lang/String;Ljava/lang/String;J)Z

    move-result v10

    .line 1612
    .end local v19           #parentId:J
    :cond_4
    :goto_2
    if-nez v10, :cond_5

    .line 1613
    const-string v22, "parent"

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/android/browser/provider/BrowserProvider2;->queryDefaultFolderId(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1619
    .end local v4           #accountName:Ljava/lang/String;
    .end local v5           #accountType:Ljava/lang/String;
    .end local v9           #hasAccounts:Z
    .end local v10           #hasParent:Z
    .end local v17           #now:J
    :cond_5
    const-string v22, "folder"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_8

    .line 1620
    const-string v22, "folder"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v22

    if-eqz v22, :cond_8

    const-string v22, "parent"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_8

    const-string v22, "title"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_8

    .line 1622
    const-string v22, "parent"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v22

    const-string v24, "title"

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->isValidAccountName(JLjava/lang/String;)Z

    move-result v15

    .line 1624
    .local v15, isValid:Z
    if-nez v15, :cond_8

    .line 1625
    const/16 v22, 0x0

    .line 1707
    .end local v15           #isValid:Z
    :goto_3
    return-object v22

    .line 1594
    .restart local v17       #now:J
    :cond_6
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 1606
    .restart local v4       #accountName:Ljava/lang/String;
    .restart local v5       #accountType:Ljava/lang/String;
    .restart local v9       #hasAccounts:Z
    .restart local v10       #hasParent:Z
    :cond_7
    if-eqz v10, :cond_4

    if-nez v9, :cond_4

    .line 1607
    const-string v22, "parent"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    .line 1608
    .restart local v19       #parentId:J
    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->setParentValues(JLandroid/content/ContentValues;)Z

    move-result v10

    goto/16 :goto_2

    .line 1632
    .end local v4           #accountName:Ljava/lang/String;
    .end local v5           #accountType:Ljava/lang/String;
    .end local v9           #hasAccounts:Z
    .end local v10           #hasParent:Z
    .end local v17           #now:J
    .end local v19           #parentId:J
    :cond_8
    const-string v22, "position"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_9

    .line 1633
    const-string v22, "position"

    const-wide/high16 v23, -0x8000

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1637
    :cond_9
    const-string v22, "url"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1638
    .local v21, url:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->extractImageValues(Landroid/content/ContentValues;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v13

    .line 1639
    .local v13, imageValues:Landroid/content/ContentValues;
    const-string v22, "folder"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v14

    .line 1640
    .local v14, isFolder:Ljava/lang/Boolean;
    if-eqz v14, :cond_a

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v22

    if-nez v22, :cond_b

    :cond_a
    if-eqz v13, :cond_b

    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v22

    if-nez v22, :cond_b

    .line 1642
    const-string v22, "images"

    const-string v23, "url_key=?"

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput-object v21, v24, v25

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v8, v0, v13, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    .line 1644
    .local v7, count:I
    if-nez v7, :cond_b

    .line 1645
    const-string v22, "images"

    const-string v23, "favicon"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v8, v0, v1, v13}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1649
    .end local v7           #count:I
    :cond_b
    const-string v22, "bookmarks"

    const-string v23, "dirty"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, p2

    invoke-virtual {v8, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v11

    .line 1650
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->refreshWidgets()V

    .line 1700
    .end local v13           #imageValues:Landroid/content/ContentValues;
    .end local v14           #isFolder:Ljava/lang/Boolean;
    .end local v21           #url:Ljava/lang/String;
    :goto_4
    const-wide/16 v22, 0x0

    cmp-long v22, v11, v22

    if-ltz v22, :cond_f

    .line 1701
    invoke-virtual/range {p0 .. p1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 1702
    invoke-virtual/range {p0 .. p1}, Lcom/android/browser/provider/BrowserProvider2;->shouldNotifyLegacy(Landroid/net/Uri;)Z

    move-result v22

    if-eqz v22, :cond_c

    .line 1703
    sget-object v22, Lcom/android/browser/provider/BrowserProvider2;->LEGACY_AUTHORITY_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 1705
    :cond_c
    move-object/from16 v0, p1

    invoke-static {v0, v11, v12}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v22

    goto/16 :goto_3

    .line 1656
    :sswitch_1
    const-string v22, "created"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_d

    .line 1657
    const-string v22, "created"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v23

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1659
    :cond_d
    const-string v22, "url"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1660
    .restart local v21       #url:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->filterSearchClient(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1661
    const-string v22, "url"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1664
    const-string v22, "url"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->extractImageValues(Landroid/content/ContentValues;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v13

    .line 1666
    .restart local v13       #imageValues:Landroid/content/ContentValues;
    if-eqz v13, :cond_e

    .line 1667
    const-string v22, "images"

    const-string v23, "favicon"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v8, v0, v1, v13}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1670
    :cond_e
    const-string v22, "history"

    const-string v23, "visits"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, p2

    invoke-virtual {v8, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v11

    .line 1671
    goto/16 :goto_4

    .line 1675
    .end local v13           #imageValues:Landroid/content/ContentValues;
    .end local v21           #url:Ljava/lang/String;
    :sswitch_2
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1}, Lcom/android/browser/provider/BrowserProvider2;->insertSearchesInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J

    move-result-wide v11

    .line 1676
    goto/16 :goto_4

    .line 1680
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-virtual {v0, v8, v1}, Lcom/android/common/content/SyncStateContentProviderHelper;->insert(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J

    move-result-wide v11

    .line 1681
    goto/16 :goto_4

    .line 1685
    :sswitch_4
    const-wide/16 v11, 0x0

    .line 1686
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1}, Lcom/android/browser/provider/BrowserProvider2;->insertSettingsInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)J

    goto/16 :goto_4

    .line 1691
    :sswitch_5
    const-string v22, "thumbnails"

    const/16 v23, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, p2

    invoke-virtual {v8, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->replaceOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v11

    .line 1692
    goto/16 :goto_4

    .line 1707
    :cond_f
    const/16 v22, 0x0

    goto/16 :goto_3

    .line 1585
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_5
        0x3e8 -> :sswitch_0
        0x7d0 -> :sswitch_1
        0xbb8 -> :sswitch_2
        0xfa0 -> :sswitch_3
        0x1f40 -> :sswitch_4
    .end sparse-switch
.end method

.method public isCallerSyncAdapter(Landroid/net/Uri;)Z
    .locals 2
    .parameter "uri"

    .prologue
    .line 988
    const-string v0, "caller_is_syncadapter"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method isNullAccount(Ljava/lang/String;)Z
    .locals 2
    .parameter "account"

    .prologue
    const/4 v0, 0x1

    .line 1037
    if-nez p1, :cond_1

    .line 1039
    :cond_0
    :goto_0
    return v0

    .line 1038
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 1039
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "null"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onEndTransaction(Z)V
    .locals 2
    .parameter "callerIsSyncAdapter"

    .prologue
    const/4 v1, 0x0

    .line 1002
    invoke-super {p0, p1}, Lcom/android/browser/provider/SQLiteContentProvider;->onEndTransaction(Z)V

    .line 1003
    iget-boolean v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mUpdateWidgets:Z

    if-eqz v0, :cond_0

    .line 1004
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mWidgetObserver:Landroid/database/ContentObserver;

    if-nez v0, :cond_1

    .line 1005
    invoke-virtual {p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/browser/widget/BookmarkThumbnailWidgetProvider;->refreshWidgets(Landroid/content/Context;)V

    .line 1009
    :goto_0
    iput-boolean v1, p0, Lcom/android/browser/provider/BrowserProvider2;->mUpdateWidgets:Z

    .line 1011
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mSyncToNetwork:Z

    .line 1012
    return-void

    .line 1007
    :cond_1
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mWidgetObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/database/ContentObserver;->dispatchChange(Z)V

    goto :goto_0
.end method

.method pruneImages()I
    .locals 4

    .prologue
    .line 2340
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2341
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "images"

    const-string v2, "url_key NOT IN (SELECT url FROM bookmarks WHERE url IS NOT NULL AND deleted == 0) AND url_key NOT IN (SELECT url FROM history WHERE url IS NOT NULL)"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 39
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    .line 1066
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v5}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12

    .line 1067
    .local v12, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v33

    .line 1068
    .local v33, match:I
    new-instance v4, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v4}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 1069
    .local v4, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    const-string v5, "limit"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 1070
    .local v19, limit:Ljava/lang/String;
    const-string v5, "groupBy"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1071
    .local v16, groupBy:Ljava/lang/String;
    sparse-switch v33, :sswitch_data_0

    .line 1320
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown URL "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1073
    :sswitch_0
    const-string v5, "v_accounts"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1074
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->ACCOUNTS_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1075
    const-string v5, "allowEmptyAccounts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 1076
    .local v22, allowEmpty:Ljava/lang/String;
    const-string v5, "false"

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1077
    const-string v5, "0 < ( SELECT count(*) FROM bookmarks WHERE deleted = 0 AND folder = 0   AND (     v_accounts.account_name = bookmarks.account_name     OR (v_accounts.account_name IS NULL AND bookmarks.account_name IS NULL)   )   AND (     v_accounts.account_type = bookmarks.account_type     OR (v_accounts.account_type IS NULL AND bookmarks.account_type IS NULL)   ) )"

    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1080
    :cond_0
    if-nez p5, :cond_1

    .line 1081
    const-string p5, "account_name IS NOT NULL DESC, account_name ASC"

    .line 1324
    .end local v22           #allowEmpty:Ljava/lang/String;
    :cond_1
    :goto_0
    const/16 v17, 0x0

    move-object v11, v4

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v18, p5

    invoke-virtual/range {v11 .. v19}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v28

    .line 1326
    .local v28, cursor:Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v7, Landroid/provider/BrowserContract;->AUTHORITY_URI:Landroid/net/Uri;

    move-object/from16 v0, v28

    invoke-interface {v0, v5, v7}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 1327
    .end local v12           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v28           #cursor:Landroid/database/Cursor;
    :cond_2
    :goto_1
    return-object v28

    .line 1090
    .restart local v12       #db:Landroid/database/sqlite/SQLiteDatabase;
    :sswitch_1
    const-string v5, "show_deleted"

    const/4 v7, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v7}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_3

    .line 1091
    const-string v5, "deleted=0"

    move-object/from16 v0, p3

    invoke-static {v5, v0}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1095
    :cond_3
    const/16 v5, 0x3e9

    move/from16 v0, v33

    if-ne v0, v5, :cond_6

    .line 1097
    const-string v5, "bookmarks._id=?"

    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1099
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    move-object/from16 v0, p4

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1109
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->getSelectionWithAccounts(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v38

    .line 1110
    .local v38, withAccount:[Ljava/lang/Object;
    const/4 v5, 0x0

    aget-object p3, v38, v5

    .end local p3
    check-cast p3, Ljava/lang/String;

    .line 1111
    .restart local p3
    const/4 v5, 0x1

    aget-object v5, v38, v5

    check-cast v5, [Ljava/lang/String;

    move-object/from16 p4, v5

    check-cast p4, [Ljava/lang/String;

    .line 1112
    const/4 v5, 0x2

    aget-object v5, v38, v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v29

    .line 1115
    .local v29, hasAccounts:Z
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 1116
    if-eqz v29, :cond_7

    .line 1117
    const-string p5, "position ASC, _id ASC"

    .line 1123
    :cond_5
    :goto_3
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1124
    const-string v5, "bookmarks LEFT OUTER JOIN images ON bookmarks.url = images.url_key"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1101
    .end local v29           #hasAccounts:Z
    .end local v38           #withAccount:[Ljava/lang/Object;
    :cond_6
    const/16 v5, 0x3eb

    move/from16 v0, v33

    if-ne v0, v5, :cond_4

    .line 1103
    const-string v5, "bookmarks.parent=?"

    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1105
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    move-object/from16 v0, p4

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    goto :goto_2

    .line 1119
    .restart local v29       #hasAccounts:Z
    .restart local v38       #withAccount:[Ljava/lang/Object;
    :cond_7
    const-string p5, "folder DESC, position ASC, _id ASC"

    goto :goto_3

    .line 1130
    .end local v29           #hasAccounts:Z
    .end local v38           #withAccount:[Ljava/lang/Object;
    :sswitch_2
    const/16 v37, 0x0

    .line 1131
    .local v37, useAccount:Z
    const-string v5, "acct_type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1132
    .local v21, accountType:Ljava/lang/String;
    const-string v5, "acct_name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1133
    .local v20, accountName:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->isNullAccount(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_8

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->isNullAccount(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 1134
    const/16 v37, 0x1

    .line 1137
    :cond_8
    const-string v5, "bookmarks LEFT OUTER JOIN images ON bookmarks.url = images.url_key"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1141
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1142
    if-eqz v37, :cond_c

    .line 1143
    const-string p5, "position ASC, _id ASC"

    .line 1148
    :cond_9
    :goto_4
    if-nez v37, :cond_d

    .line 1149
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1150
    const-string v6, "parent=? AND deleted=0"

    .line 1151
    .local v6, where:Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-static {v6, v0}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1152
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/4 v5, 0x0

    const-wide/16 v7, 0x1

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v23, v5

    .line 1153
    .local v23, args:[Ljava/lang/String;
    if-eqz p4, :cond_a

    .line 1154
    move-object/from16 v0, v23

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    .line 1156
    :cond_a
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    move-object/from16 v5, p2

    move-object/from16 v9, p5

    invoke-virtual/range {v4 .. v10}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 1195
    .local v36, query:Ljava/lang/String;
    :cond_b
    :goto_5
    move-object/from16 v0, v36

    move-object/from16 v1, v23

    invoke-virtual {v12, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v28

    .line 1196
    .restart local v28       #cursor:Landroid/database/Cursor;
    if-eqz v28, :cond_2

    .line 1197
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v7, Landroid/provider/BrowserContract;->AUTHORITY_URI:Landroid/net/Uri;

    move-object/from16 v0, v28

    invoke-interface {v0, v5, v7}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_1

    .line 1145
    .end local v6           #where:Ljava/lang/String;
    .end local v23           #args:[Ljava/lang/String;
    .end local v28           #cursor:Landroid/database/Cursor;
    .end local v36           #query:Ljava/lang/String;
    :cond_c
    const-string p5, "folder DESC, position ASC, _id ASC"

    goto :goto_4

    .line 1158
    :cond_d
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1159
    const-string v6, "account_type=? AND account_name=? AND parent = (SELECT _id FROM bookmarks WHERE sync3=\'bookmark_bar\' AND account_type = ? AND account_name = ?) AND deleted=0"

    .line 1167
    .restart local v6       #where:Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-static {v6, v0}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1168
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v5, p2

    invoke-virtual/range {v4 .. v10}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 1170
    .local v26, bookmarksBarQuery:Ljava/lang/String;
    const/4 v5, 0x4

    new-array v0, v5, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/4 v5, 0x0

    aput-object v21, v23, v5

    const/4 v5, 0x1

    aput-object v20, v23, v5

    const/4 v5, 0x2

    aput-object v21, v23, v5

    const/4 v5, 0x3

    aput-object v20, v23, v5

    .line 1172
    .restart local v23       #args:[Ljava/lang/String;
    if-eqz p4, :cond_e

    .line 1173
    move-object/from16 v0, v23

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    .line 1176
    :cond_e
    const-string v6, "account_type=? AND account_name=? AND sync3=?"

    .line 1178
    move-object/from16 v0, p3

    invoke-static {v6, v0}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1179
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->OTHER_BOOKMARKS_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1180
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v5, p2

    invoke-virtual/range {v4 .. v10}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 1183
    .local v35, otherBookmarksQuery:Ljava/lang/String;
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v26, v5, v7

    const/4 v7, 0x1

    aput-object v35, v5, v7

    move-object/from16 v0, p5

    move-object/from16 v1, v19

    invoke-virtual {v4, v5, v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->buildUnionQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 1187
    .restart local v36       #query:Ljava/lang/String;
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v21, v5, v7

    const/4 v7, 0x1

    aput-object v20, v5, v7

    const/4 v7, 0x2

    const-string v8, "other_bookmarks"

    aput-object v8, v5, v7

    move-object/from16 v0, v23

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    .line 1190
    if-eqz p4, :cond_b

    .line 1191
    move-object/from16 v0, v23

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    goto/16 :goto_5

    .line 1204
    .end local v6           #where:Ljava/lang/String;
    .end local v20           #accountName:Ljava/lang/String;
    .end local v21           #accountType:Ljava/lang/String;
    .end local v23           #args:[Ljava/lang/String;
    .end local v26           #bookmarksBarQuery:Ljava/lang/String;
    .end local v35           #otherBookmarksQuery:Ljava/lang/String;
    .end local v36           #query:Ljava/lang/String;
    .end local v37           #useAccount:Z
    :sswitch_3
    const-string v5, "acct_name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 1205
    .restart local v20       #accountName:Ljava/lang/String;
    const-string v5, "acct_type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1206
    .restart local v21       #accountType:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->queryDefaultFolderId(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v31

    .line 1207
    .local v31, id:J
    new-instance v27, Landroid/database/MatrixCursor;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "_id"

    aput-object v8, v5, v7

    move-object/from16 v0, v27

    invoke-direct {v0, v5}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 1208
    .local v27, c:Landroid/database/MatrixCursor;
    invoke-virtual/range {v27 .. v27}, Landroid/database/MatrixCursor;->newRow()Landroid/database/MatrixCursor$RowBuilder;

    move-result-object v5

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/database/MatrixCursor$RowBuilder;->add(Ljava/lang/Object;)Landroid/database/MatrixCursor$RowBuilder;

    move-object/from16 v28, v27

    .line 1209
    goto/16 :goto_1

    .line 1213
    .end local v20           #accountName:Ljava/lang/String;
    .end local v21           #accountType:Ljava/lang/String;
    .end local v27           #c:Landroid/database/MatrixCursor;
    .end local v31           #id:J
    :sswitch_4
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->doSuggestQuery(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v28

    goto/16 :goto_1

    .line 1217
    :sswitch_5
    const-string v5, "history._id=?"

    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1218
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    move-object/from16 v0, p4

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1223
    :sswitch_6
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->filterSearchClient([Ljava/lang/String;)V

    .line 1224
    if-nez p5, :cond_f

    .line 1225
    const-string p5, "date DESC"

    .line 1227
    :cond_f
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->HISTORY_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 1228
    const-string v5, "history LEFT OUTER JOIN images ON history.url = images.url_key"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1233
    :sswitch_7
    const-string v5, "searches._id=?"

    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1234
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    move-object/from16 v0, p4

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1239
    :sswitch_8
    const-string v5, "searches"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1240
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->SEARCHES_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 1245
    :sswitch_9
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object v8, v12

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-virtual/range {v7 .. v12}, Lcom/android/common/content/SyncStateContentProviderHelper;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .end local v12           #db:Landroid/database/sqlite/SQLiteDatabase;
    move-result-object v28

    goto/16 :goto_1

    .line 1249
    .restart local v12       #db:Landroid/database/sqlite/SQLiteDatabase;
    :sswitch_a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->appendAccountToSelection(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1250
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "_id="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v7

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-nez p3, :cond_10

    const-string v5, ""

    :goto_6
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1253
    .local v10, selectionWithId:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object v8, v12

    move-object/from16 v9, p2

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-virtual/range {v7 .. v12}, Lcom/android/common/content/SyncStateContentProviderHelper;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .end local v12           #db:Landroid/database/sqlite/SQLiteDatabase;
    move-result-object v28

    goto/16 :goto_1

    .line 1250
    .end local v10           #selectionWithId:Ljava/lang/String;
    .restart local v12       #db:Landroid/database/sqlite/SQLiteDatabase;
    :cond_10
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " AND ("

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, ")"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_6

    .line 1257
    :sswitch_b
    const-string v5, "images"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1258
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->IMAGES_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 1264
    :sswitch_c
    const-string v5, "_id = CAST(? AS INTEGER)"

    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1266
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    move-object/from16 v0, p4

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1272
    :sswitch_d
    const/16 v5, 0x2328

    move/from16 v0, v33

    if-eq v0, v5, :cond_11

    const/16 v5, 0x2329

    move/from16 v0, v33

    if-ne v0, v5, :cond_12

    :cond_11
    if-nez p2, :cond_12

    .line 1274
    sget-object p2, Landroid/provider/Browser;->HISTORY_PROJECTION:[Ljava/lang/String;

    .line 1276
    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v4}, Lcom/android/browser/provider/BrowserProvider2;->createCombinedQuery(Landroid/net/Uri;[Ljava/lang/String;Landroid/database/sqlite/SQLiteQueryBuilder;)[Ljava/lang/String;

    move-result-object v23

    .line 1277
    .restart local v23       #args:[Ljava/lang/String;
    if-nez p4, :cond_13

    .line 1278
    move-object/from16 p4, v23

    goto/16 :goto_0

    .line 1280
    :cond_13
    move-object/from16 v0, v23

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1282
    goto/16 :goto_0

    .line 1286
    .end local v23           #args:[Ljava/lang/String;
    :sswitch_e
    const-string v5, "settings"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 1287
    sget-object v5, Lcom/android/browser/provider/BrowserProvider2;->SETTINGS_PROJECTION_MAP:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    goto/16 :goto_0

    .line 1292
    :sswitch_f
    const-string v5, "_id = ?"

    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1294
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    move-object/from16 v0, p4

    invoke-static {v0, v5}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1299
    :sswitch_10
    const-string v5, "thumbnails"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1304
    :sswitch_11
    const-string v5, "v_omnibox_suggestions"

    invoke-virtual {v4, v5}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1309
    :sswitch_12
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/android/browser/provider/BrowserProvider2;->getHomePage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v30

    .line 1310
    .local v30, homepage:Ljava/lang/String;
    if-nez v30, :cond_14

    .line 1311
    const/16 v28, 0x0

    goto/16 :goto_1

    .line 1313
    :cond_14
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/String;

    move-object/from16 v24, v0

    const/4 v5, 0x0

    const-string v7, "homepage"

    aput-object v7, v24, v5

    .line 1314
    .local v24, arrColumns:[Ljava/lang/String;
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/String;

    move-object/from16 v25, v0

    const/4 v5, 0x0

    aput-object v30, v25, v5

    .line 1315
    .local v25, arrHomepage:[Ljava/lang/String;
    new-instance v34, Landroid/database/MatrixCursor;

    const/4 v5, 0x1

    move-object/from16 v0, v34

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v5}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    .line 1316
    .local v34, matrixCursor:Landroid/database/MatrixCursor;
    move-object/from16 v0, v34

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    move-object/from16 v28, v34

    .line 1317
    goto/16 :goto_1

    .line 1071
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_10
        0xb -> :sswitch_f
        0x14 -> :sswitch_11
        0x1e -> :sswitch_12
        0x3e8 -> :sswitch_1
        0x3e9 -> :sswitch_1
        0x3ea -> :sswitch_2
        0x3eb -> :sswitch_1
        0x3ec -> :sswitch_4
        0x3ed -> :sswitch_3
        0x7d0 -> :sswitch_6
        0x7d1 -> :sswitch_5
        0xbb8 -> :sswitch_8
        0xbb9 -> :sswitch_7
        0xfa0 -> :sswitch_9
        0xfa1 -> :sswitch_a
        0x1388 -> :sswitch_b
        0x1770 -> :sswitch_d
        0x1771 -> :sswitch_c
        0x1b58 -> :sswitch_0
        0x1f40 -> :sswitch_e
        0x2328 -> :sswitch_d
        0x2329 -> :sswitch_c
    .end sparse-switch
.end method

.method queryDefaultFolderId(Ljava/lang/String;Ljava/lang/String;)J
    .locals 10
    .parameter "accountName"
    .parameter "accountType"

    .prologue
    const/4 v9, 0x1

    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 1548
    invoke-virtual {p0, p1}, Lcom/android/browser/provider/BrowserProvider2;->isNullAccount(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0, p2}, Lcom/android/browser/provider/BrowserProvider2;->isNullAccount(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1549
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1550
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "bookmarks"

    new-array v2, v9, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v7

    const-string v3, "sync3 = ? AND account_type = ? AND account_name = ?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const-string v6, "bookmark_bar"

    aput-object v6, v4, v7

    aput-object p2, v4, v9

    const/4 v6, 0x2

    aput-object p1, v4, v6

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1556
    .local v8, c:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1557
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 1560
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1563
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v8           #c:Landroid/database/Cursor;
    :goto_0
    return-wide v1

    .line 1560
    .restart local v0       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v8       #c:Landroid/database/Cursor;
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1563
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v8           #c:Landroid/database/Cursor;
    :cond_1
    const-wide/16 v1, 0x1

    goto :goto_0

    .line 1560
    .restart local v0       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v8       #c:Landroid/database/Cursor;
    :catchall_0
    move-exception v1

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method refreshWidgets()V
    .locals 1

    .prologue
    .line 997
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mUpdateWidgets:Z

    .line 998
    return-void
.end method

.method public setWidgetObserver(Landroid/database/ContentObserver;)V
    .locals 0
    .parameter "obs"
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 993
    iput-object p1, p0, Lcom/android/browser/provider/BrowserProvider2;->mWidgetObserver:Landroid/database/ContentObserver;

    .line 994
    return-void
.end method

.method shouldNotifyLegacy(Landroid/net/Uri;)Z
    .locals 2
    .parameter "uri"

    .prologue
    .line 2345
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const-string v1, "history"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const-string v1, "bookmarks"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const-string v1, "searches"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2348
    :cond_0
    const/4 v0, 0x1

    .line 2350
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected syncToNetwork(Landroid/net/Uri;)Z
    .locals 2
    .parameter "uri"

    .prologue
    .line 2355
    const-string v0, "com.android.browser"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const-string v1, "bookmarks"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2357
    iget-boolean v0, p0, Lcom/android/browser/provider/BrowserProvider2;->mSyncToNetwork:Z

    .line 2363
    :goto_0
    return v0

    .line 2359
    :cond_0
    const-string v0, "browser"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2361
    const/4 v0, 0x1

    goto :goto_0

    .line 2363
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method updateBookmarksInTransaction(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I
    .locals 36
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "callerIsSyncAdapter"

    .prologue
    .line 2097
    const/16 v18, 0x0

    .line 2098
    .local v18, count:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v4}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 2099
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v4, 0x7

    new-array v5, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v6, "_id"

    aput-object v6, v5, v4

    const/4 v4, 0x1

    const-string v6, "version"

    aput-object v6, v5, v4

    const/4 v4, 0x2

    const-string v6, "url"

    aput-object v6, v5, v4

    const/4 v4, 0x3

    const-string v6, "title"

    aput-object v6, v5, v4

    const/4 v4, 0x4

    const-string v6, "folder"

    aput-object v6, v5, v4

    const/4 v4, 0x5

    const-string v6, "account_name"

    aput-object v6, v5, v4

    const/4 v4, 0x6

    const-string v6, "account_type"

    aput-object v6, v5, v4

    .line 2108
    .local v5, bookmarksProjection:[Ljava/lang/String;
    const-string v4, "bookmarks"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v19

    .line 2110
    .local v19, cursor:Landroid/database/Cursor;
    const-string v4, "parent"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v32

    .line 2111
    .local v32, updatingParent:Z
    const/16 v29, 0x0

    .line 2112
    .local v29, parentAccountName:Ljava/lang/String;
    const/16 v30, 0x0

    .line 2113
    .local v30, parentAccountType:Ljava/lang/String;
    if-eqz v32, :cond_9

    .line 2114
    const-string v4, "parent"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v27

    .line 2115
    .local v27, parent:J
    const-string v7, "bookmarks"

    const/4 v4, 0x2

    new-array v8, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v6, "account_name"

    aput-object v6, v8, v4

    const/4 v4, 0x1

    const-string v6, "account_type"

    aput-object v6, v8, v4

    const-string v9, "_id = ?"

    const/4 v4, 0x1

    new-array v10, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {v27 .. v28}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v10, v4

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v6, v3

    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 2119
    .local v17, c:Landroid/database/Cursor;
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2120
    const/4 v4, 0x0

    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    .line 2121
    const/4 v4, 0x1

    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    .line 2123
    :cond_0
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->close()V

    .line 2129
    .end local v17           #c:Landroid/database/Cursor;
    .end local v27           #parent:J
    :cond_1
    :goto_0
    const/4 v4, 0x1

    :try_start_0
    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v16, v0

    .line 2131
    .local v16, args:[Ljava/lang/String;
    if-nez p4, :cond_2

    .line 2132
    const-string v4, "modified"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2133
    const-string v4, "dirty"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2136
    :cond_2
    const-string v4, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v33

    .line 2137
    .local v33, updatingUrl:Z
    const/16 v35, 0x0

    .line 2138
    .local v35, url:Ljava/lang/String;
    if-eqz v33, :cond_3

    .line 2139
    const-string v4, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 2141
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->extractImageValues(Landroid/content/ContentValues;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v22

    .line 2143
    .local v22, imageValues:Landroid/content/ContentValues;
    :cond_4
    :goto_1
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 2144
    const/4 v4, 0x0

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 2145
    .local v20, id:J
    const/4 v4, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v16, v4

    .line 2146
    const/4 v4, 0x5

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 2147
    .local v14, accountName:Ljava/lang/String;
    const/4 v4, 0x6

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 2150
    .local v15, accountType:Ljava/lang/String;
    if-eqz v32, :cond_a

    move-object/from16 v0, v29

    invoke-static {v14, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    move-object/from16 v0, v30

    invoke-static {v15, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 2157
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->valuesFromCursor(Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v26

    .line 2158
    .local v26, newValues:Landroid/content/ContentValues;
    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    .line 2159
    const-string v4, "_id"

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 2160
    const-string v4, "version"

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 2161
    const-string v4, "account_name"

    move-object/from16 v0, v26

    move-object/from16 v1, v29

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2162
    const-string v4, "account_type"

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2163
    sget-object v4, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move/from16 v2, p4

    invoke-virtual {v0, v4, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->insertInTransaction(Landroid/net/Uri;Landroid/content/ContentValues;Z)Landroid/net/Uri;

    move-result-object v23

    .line 2165
    .local v23, insertUri:Landroid/net/Uri;
    invoke-static/range {v23 .. v23}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v24

    .line 2166
    .local v24, newId:J
    const/4 v4, 0x4

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-eqz v4, :cond_6

    .line 2168
    new-instance v31, Landroid/content/ContentValues;

    const/4 v4, 0x1

    move-object/from16 v0, v31

    invoke-direct {v0, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 2169
    .local v31, updateChildren:Landroid/content/ContentValues;
    const-string v4, "parent"

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v31

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2170
    const-string v4, "parent=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, p4

    invoke-virtual {v0, v1, v4, v6, v2}, Lcom/android/browser/provider/BrowserProvider2;->updateBookmarksInTransaction(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v4

    add-int v18, v18, v4

    .line 2175
    .end local v31           #updateChildren:Landroid/content/ContentValues;
    :cond_6
    sget-object v4, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    move-wide/from16 v0, v20

    invoke-static {v4, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v34

    .line 2176
    .local v34, uri:Landroid/net/Uri;
    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    move/from16 v2, p4

    invoke-virtual {v0, v1, v4, v6, v2}, Lcom/android/browser/provider/BrowserProvider2;->deleteInTransaction(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Z)I

    .line 2177
    add-int/lit8 v18, v18, 0x1

    .line 2187
    .end local v23           #insertUri:Landroid/net/Uri;
    .end local v24           #newId:J
    .end local v26           #newValues:Landroid/content/ContentValues;
    .end local v34           #uri:Landroid/net/Uri;
    :goto_2
    if-eqz v22, :cond_4

    .line 2188
    if-nez v33, :cond_7

    .line 2189
    const/4 v4, 0x2

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v35

    .line 2190
    const-string v4, "url_key"

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2193
    :cond_7
    invoke-static/range {v35 .. v35}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 2194
    const/4 v4, 0x0

    aput-object v35, v16, v4

    .line 2195
    const-string v4, "images"

    const-string v6, "url_key=?"

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v3, v4, v0, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_4

    .line 2196
    const-string v4, "images"

    const-string v6, "favicon"

    move-object/from16 v0, v22

    invoke-virtual {v3, v4, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_1

    .line 2202
    .end local v14           #accountName:Ljava/lang/String;
    .end local v15           #accountType:Ljava/lang/String;
    .end local v16           #args:[Ljava/lang/String;
    .end local v20           #id:J
    .end local v22           #imageValues:Landroid/content/ContentValues;
    .end local v33           #updatingUrl:Z
    .end local v35           #url:Ljava/lang/String;
    :catchall_0
    move-exception v4

    if-eqz v19, :cond_8

    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->close()V

    :cond_8
    throw v4

    .line 2124
    :cond_9
    const-string v4, "account_name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "account_type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto/16 :goto_0

    .line 2179
    .restart local v14       #accountName:Ljava/lang/String;
    .restart local v15       #accountType:Ljava/lang/String;
    .restart local v16       #args:[Ljava/lang/String;
    .restart local v20       #id:J
    .restart local v22       #imageValues:Landroid/content/ContentValues;
    .restart local v33       #updatingUrl:Z
    .restart local v35       #url:Ljava/lang/String;
    :cond_a
    if-nez p4, :cond_b

    .line 2181
    :try_start_1
    const-string v4, "version"

    const/4 v6, 0x1

    move-object/from16 v0, v19

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2183
    :cond_b
    const-string v4, "bookmarks"

    const-string v6, "_id=?"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v3, v4, v0, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    add-int v18, v18, v4

    goto :goto_2

    .line 2202
    .end local v14           #accountName:Ljava/lang/String;
    .end local v15           #accountType:Ljava/lang/String;
    .end local v20           #id:J
    :cond_c
    if-eqz v19, :cond_d

    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->close()V

    .line 2204
    :cond_d
    return v18
.end method

.method updateHistoryInTransaction(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 15
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 2234
    const/4 v8, 0x0

    .line 2235
    .local v8, count:I
    iget-object v1, p0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    invoke-virtual {v1}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v11

    .line 2236
    .local v11, db:Landroid/database/sqlite/SQLiteDatabase;
    move-object/from16 v0, p3

    invoke-direct {p0, v0}, Lcom/android/browser/provider/BrowserProvider2;->filterSearchClient([Ljava/lang/String;)V

    .line 2237
    sget-object v2, Landroid/provider/BrowserContract$History;->CONTENT_URI:Landroid/net/Uri;

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v4, "_id"

    aput-object v4, v3, v1

    const/4 v1, 0x1

    const-string v4, "url"

    aput-object v4, v3, v1

    const/4 v6, 0x0

    move-object v1, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-virtual/range {v1 .. v6}, Lcom/android/browser/provider/BrowserProvider2;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 2240
    .local v10, cursor:Landroid/database/Cursor;
    if-nez v10, :cond_0

    move v9, v8

    .line 2273
    .end local v8           #count:I
    .local v9, count:I
    :goto_0
    return v9

    .line 2244
    .end local v9           #count:I
    .restart local v8       #count:I
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    new-array v7, v1, [Ljava/lang/String;

    .line 2246
    .local v7, args:[Ljava/lang/String;
    const-string v1, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v13

    .line 2247
    .local v13, updatingUrl:Z
    const/4 v14, 0x0

    .line 2248
    .local v14, url:Ljava/lang/String;
    if-eqz v13, :cond_1

    .line 2249
    const-string v1, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/browser/provider/BrowserProvider2;->filterSearchClient(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 2250
    const-string v1, "url"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2252
    :cond_1
    move-object/from16 v0, p1

    invoke-virtual {p0, v0, v14}, Lcom/android/browser/provider/BrowserProvider2;->extractImageValues(Landroid/content/ContentValues;Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object v12

    .line 2254
    .local v12, imageValues:Landroid/content/ContentValues;
    :cond_2
    :goto_1
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2255
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v7, v1

    .line 2256
    const-string v1, "history"

    const-string v2, "_id=?"

    move-object/from16 v0, p1

    invoke-virtual {v11, v1, v0, v2, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    add-int/2addr v8, v1

    .line 2259
    if-eqz v12, :cond_2

    .line 2260
    if-nez v13, :cond_3

    .line 2261
    const/4 v1, 0x1

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 2262
    const-string v1, "url_key"

    invoke-virtual {v12, v1, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2264
    :cond_3
    const/4 v1, 0x0

    aput-object v14, v7, v1

    .line 2265
    const-string v1, "images"

    const-string v2, "url_key=?"

    invoke-virtual {v11, v1, v12, v2, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_2

    .line 2266
    const-string v1, "images"

    const-string v2, "favicon"

    invoke-virtual {v11, v1, v2, v12}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 2271
    .end local v7           #args:[Ljava/lang/String;
    .end local v12           #imageValues:Landroid/content/ContentValues;
    .end local v13           #updatingUrl:Z
    .end local v14           #url:Ljava/lang/String;
    :catchall_0
    move-exception v1

    if-eqz v10, :cond_4

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v1

    .restart local v7       #args:[Ljava/lang/String;
    .restart local v12       #imageValues:Landroid/content/ContentValues;
    .restart local v13       #updatingUrl:Z
    .restart local v14       #url:Ljava/lang/String;
    :cond_5
    if-eqz v10, :cond_6

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_6
    move v9, v8

    .line 2273
    .end local v8           #count:I
    .restart local v9       #count:I
    goto :goto_0
.end method

.method public updateInTransaction(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I
    .locals 20
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "callerIsSyncAdapter"

    .prologue
    .line 1874
    sget-object v16, Lcom/android/browser/provider/BrowserProvider2;->URI_MATCHER:Landroid/content/UriMatcher;

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v10

    .line 1875
    .local v10, match:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mOpenHelper:Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/android/browser/provider/BrowserProvider2$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    .line 1876
    .local v8, db:Landroid/database/sqlite/SQLiteDatabase;
    const/16 v16, 0x2328

    move/from16 v0, v16

    if-eq v10, v0, :cond_0

    const/16 v16, 0x2329

    move/from16 v0, v16

    if-ne v10, v0, :cond_2

    .line 1878
    :cond_0
    const-string v16, "bookmark"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    .line 1879
    .local v6, bookmark:Ljava/lang/Integer;
    const-string v16, "bookmark"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 1880
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v16

    if-nez v16, :cond_4

    .line 1881
    :cond_1
    const/16 v16, 0x2328

    move/from16 v0, v16

    if-ne v10, v0, :cond_3

    .line 1882
    const/16 v10, 0x7d0

    .line 1897
    .end local v6           #bookmark:Ljava/lang/Integer;
    :cond_2
    :goto_0
    const/4 v11, 0x0

    .line 1898
    .local v11, modified:I
    sparse-switch v10, :sswitch_data_0

    .line 2014
    new-instance v16, Ljava/lang/UnsupportedOperationException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Unknown update URI "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 1884
    .end local v11           #modified:I
    .restart local v6       #bookmark:Ljava/lang/Integer;
    :cond_3
    const/16 v10, 0x7d1

    goto :goto_0

    .line 1887
    :cond_4
    const/16 v16, 0x2328

    move/from16 v0, v16

    if-ne v10, v0, :cond_5

    .line 1888
    const/16 v10, 0x3e8

    .line 1892
    :goto_1
    const-string v16, "date"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 1893
    const-string v16, "visits"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 1894
    const-string v16, "user_entered"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    goto :goto_0

    .line 1890
    :cond_5
    const/16 v10, 0x3e9

    goto :goto_1

    .line 1900
    .end local v6           #bookmark:Ljava/lang/Integer;
    .restart local v11       #modified:I
    :sswitch_0
    const-string v16, "bookmarks._id=?"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1902
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1907
    :sswitch_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->getSelectionWithAccounts(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v15

    .line 1908
    .local v15, withAccount:[Ljava/lang/Object;
    const/16 v16, 0x0

    aget-object p3, v15, v16

    .end local p3
    check-cast p3, Ljava/lang/String;

    .line 1909
    .restart local p3
    const/16 v16, 0x1

    aget-object v16, v15, v16

    check-cast v16, [Ljava/lang/String;

    move-object/from16 p4, v16

    check-cast p4, [Ljava/lang/String;

    .line 1910
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move/from16 v4, p5

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/browser/provider/BrowserProvider2;->updateBookmarksInTransaction(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I

    move-result v11

    .line 1912
    if-lez v11, :cond_6

    .line 1913
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->refreshWidgets()V

    .line 2017
    .end local v15           #withAccount:[Ljava/lang/Object;
    :cond_6
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->pruneImages()I

    .line 2018
    if-lez v11, :cond_7

    .line 2019
    invoke-virtual/range {p0 .. p1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 2020
    invoke-virtual/range {p0 .. p1}, Lcom/android/browser/provider/BrowserProvider2;->shouldNotifyLegacy(Landroid/net/Uri;)Z

    move-result v16

    if-eqz v16, :cond_7

    .line 2021
    sget-object v16, Lcom/android/browser/provider/BrowserProvider2;->LEGACY_AUTHORITY_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    :cond_7
    move v7, v11

    .line 2024
    :goto_3
    return v7

    .line 1919
    :sswitch_2
    const-string v16, "history._id=?"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1920
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Landroid/database/DatabaseUtils;->appendSelectionArgs([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    .line 1925
    :sswitch_3
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/browser/provider/BrowserProvider2;->updateHistoryInTransaction(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    .line 1926
    goto :goto_2

    .line 1930
    :sswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->appendAccountToSelection(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, p2

    move-object/from16 v3, v18

    move-object/from16 v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/common/content/SyncStateContentProviderHelper;->update(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    .line 1932
    goto :goto_2

    .line 1936
    :sswitch_5
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/provider/BrowserProvider2;->appendAccountToSelection(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1937
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "_id="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v17

    invoke-virtual/range {v16 .. v18}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    if-nez p3, :cond_8

    const-string v16, ""

    :goto_4
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1940
    .local v12, selectionWithId:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v12, v3}, Lcom/android/common/content/SyncStateContentProviderHelper;->update(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    .line 1942
    goto/16 :goto_2

    .line 1937
    .end local v12           #selectionWithId:Ljava/lang/String;
    :cond_8
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, " AND ("

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v18, ")"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    goto :goto_4

    .line 1946
    :sswitch_6
    const-string v16, "url_key"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1947
    .local v14, url:Ljava/lang/String;
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-eqz v16, :cond_9

    .line 1948
    new-instance v16, Ljava/lang/IllegalArgumentException;

    const-string v17, "Images.URL is required"

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 1950
    :cond_9
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v14, v1}, Lcom/android/browser/provider/BrowserProvider2;->shouldUpdateImages(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)Z

    move-result v16

    if-nez v16, :cond_a

    .line 1951
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 1953
    :cond_a
    const-string v16, "images"

    const-string v17, "url_key=?"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v14, v18, v19

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    invoke-virtual {v8, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v7

    .line 1955
    .local v7, count:I
    if-nez v7, :cond_b

    .line 1956
    const-string v16, "images"

    const-string v17, "favicon"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, p2

    invoke-virtual {v8, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1957
    const/4 v7, 0x1

    .line 1962
    :cond_b
    const/4 v13, 0x0

    .line 1963
    .local v13, updatedLegacy:Z
    const-string v16, "bookmarks"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v8, v1, v14}, Lcom/android/browser/provider/BrowserProvider2;->getUrlCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    if-lez v16, :cond_c

    .line 1964
    sget-object v16, Landroid/provider/BrowserContract$Bookmarks;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 1965
    const-string v16, "favicon"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v13

    .line 1966
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->refreshWidgets()V

    .line 1968
    :cond_c
    const-string v16, "history"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v8, v1, v14}, Lcom/android/browser/provider/BrowserProvider2;->getUrlCount(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)I

    move-result v16

    if-lez v16, :cond_d

    .line 1969
    sget-object v16, Landroid/provider/BrowserContract$History;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 1970
    const-string v16, "favicon"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v13

    .line 1972
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->pruneImages()I

    move-result v16

    if-gtz v16, :cond_e

    if-eqz v13, :cond_f

    .line 1973
    :cond_e
    sget-object v16, Lcom/android/browser/provider/BrowserProvider2;->LEGACY_AUTHORITY_URI:Landroid/net/Uri;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/android/browser/provider/BrowserProvider2;->postNotifyUri(Landroid/net/Uri;)V

    .line 1978
    :cond_f
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/browser/provider/BrowserProvider2;->mSyncToNetwork:Z

    goto/16 :goto_3

    .line 1983
    .end local v7           #count:I
    .end local v13           #updatedLegacy:Z
    .end local v14           #url:Ljava/lang/String;
    :sswitch_7
    const-string v16, "searches"

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v8, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    .line 1984
    goto/16 :goto_2

    .line 1988
    :sswitch_8
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v5

    .line 1989
    .local v5, accounts:[Landroid/accounts/Account;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mSyncHelper:Lcom/android/common/content/SyncStateContentProviderHelper;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/browser/provider/BrowserProvider2;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v5}, Lcom/android/common/content/SyncStateContentProviderHelper;->onAccountsChanged(Landroid/database/sqlite/SQLiteDatabase;[Landroid/accounts/Account;)V

    goto/16 :goto_2

    .line 1994
    .end local v5           #accounts:[Landroid/accounts/Account;
    :sswitch_9
    const-string v16, "thumbnails"

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v8, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    .line 1996
    goto/16 :goto_2

    .line 2001
    :sswitch_a
    if-eqz p2, :cond_11

    .line 2002
    const-string v16, "homepage"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2003
    .local v9, homepage:Ljava/lang/String;
    if-nez v9, :cond_10

    .line 2004
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 2007
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/android/browser/provider/BrowserProvider2;->getContext()Landroid/content/Context;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v9}, Lcom/android/browser/provider/BrowserProvider2;->setHomePage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_11

    .line 2008
    const/4 v7, 0x1

    goto/16 :goto_3

    .line 2011
    .end local v9           #homepage:Ljava/lang/String;
    :cond_11
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 1898
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_9
        0x1e -> :sswitch_a
        0x3e8 -> :sswitch_1
        0x3e9 -> :sswitch_0
        0x7d0 -> :sswitch_3
        0x7d1 -> :sswitch_2
        0xbb8 -> :sswitch_7
        0xfa0 -> :sswitch_4
        0xfa1 -> :sswitch_5
        0x1388 -> :sswitch_6
        0x1b58 -> :sswitch_8
    .end sparse-switch
.end method

.method valuesFromCursor(Landroid/database/Cursor;)Landroid/content/ContentValues;
    .locals 7
    .parameter "c"

    .prologue
    .line 2208
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnCount()I

    move-result v1

    .line 2209
    .local v1, count:I
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 2210
    .local v3, values:Landroid/content/ContentValues;
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    .line 2211
    .local v0, colNames:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 2212
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getType(I)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 2211
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2214
    :pswitch_0
    aget-object v4, v0, v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    goto :goto_1

    .line 2217
    :pswitch_1
    aget-object v4, v0, v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    goto :goto_1

    .line 2220
    :pswitch_2
    aget-object v4, v0, v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    .line 2223
    :pswitch_3
    aget-object v4, v0, v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 2227
    :cond_0
    return-object v3

    .line 2212
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method
