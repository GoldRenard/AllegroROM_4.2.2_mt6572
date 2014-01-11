.class public final Lcom/android/launcher2/Launcher;
.super Landroid/app/Activity;
.source "Launcher.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/android/launcher2/LauncherModel$Callbacks;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/Launcher$AppWidgetResetObserver;,
        Lcom/android/launcher2/Launcher$CloseSystemDialogsIntentReceiver;,
        Lcom/android/launcher2/Launcher$LocaleConfiguration;,
        Lcom/android/launcher2/Launcher$PendingAddArguments;,
        Lcom/android/launcher2/Launcher$State;
    }
.end annotation


# static fields
.field static final APPWIDGET_HOST_ID:I = 0x400

.field static final DEBUG_STRICT_MODE:Z = false

.field static final DEBUG_WIDGETS:Z = true

.field static final DEFAULT_SCREEN:I = 0x2

.field private static final DISMISS_CLING_DURATION:I = 0xfa

.field static final DUMP_STATE_PROPERTY:Ljava/lang/String; = "launcher_dump_state"

.field private static final EXIT_SPRINGLOADED_MODE_LONG_TIMEOUT:I = 0x258

.field private static final EXIT_SPRINGLOADED_MODE_SHORT_TIMEOUT:I = 0x12c

.field static final EXTRA_SHORTCUT_DUPLICATE:Ljava/lang/String; = "duplicate"

.field static final FORCE_ENABLE_ROTATION_PROPERTY:Ljava/lang/String; = "launcher_force_rotate"

.field static final INTENT_EXTRA_IGNORE_LAUNCH_ANIMATION:Ljava/lang/String; = "com.android.launcher.intent.extra.shortcut.INGORE_LAUNCH_ANIMATION"

.field static final LOGD:Z = false

.field static final MAX_UNREAD_COUNT:I = 0x63

.field private static final MENU_GROUP_WALLPAPER:I = 0x1

.field private static final MENU_HELP:I = 0x5

.field private static final MENU_MANAGE_APPS:I = 0x3

.field private static final MENU_SYSTEM_SETTINGS:I = 0x4

.field private static final MENU_WALLPAPER_SETTINGS:I = 0x2

.field private static NEW_APPS_ANIMATION_INACTIVE_TIMEOUT_SECONDS:I = 0x0

.field private static final ORIENTATION_0:I = 0x0

.field private static final ORIENTATION_180:I = 0xb4

.field private static final ORIENTATION_270:I = 0x10e

.field private static final ORIENTATION_90:I = 0x5a

.field private static final PREFERENCES:Ljava/lang/String; = "launcher.preferences"

.field static final PROFILE_STARTUP:Z = false

.field private static final REQUEST_BIND_APPWIDGET:I = 0xb

.field private static final REQUEST_CREATE_APPWIDGET:I = 0x5

.field private static final REQUEST_CREATE_SHORTCUT:I = 0x1

.field private static final REQUEST_PICK_APPLICATION:I = 0x6

.field private static final REQUEST_PICK_APPWIDGET:I = 0x9

.field private static final REQUEST_PICK_SHORTCUT:I = 0x7

.field private static final REQUEST_PICK_WALLPAPER:I = 0xa

.field private static final RUNTIME_STATE:Ljava/lang/String; = "launcher.state"

.field private static final RUNTIME_STATE_CURRENT_SCREEN:Ljava/lang/String; = "launcher.current_screen"

.field private static final RUNTIME_STATE_PENDING_ADD_CELL_X:Ljava/lang/String; = "launcher.add_cell_x"

.field private static final RUNTIME_STATE_PENDING_ADD_CELL_Y:Ljava/lang/String; = "launcher.add_cell_y"

.field private static final RUNTIME_STATE_PENDING_ADD_CONTAINER:Ljava/lang/String; = "launcher.add_container"

.field private static final RUNTIME_STATE_PENDING_ADD_SCREEN:Ljava/lang/String; = "launcher.add_screen"

.field private static final RUNTIME_STATE_PENDING_ADD_SPAN_X:Ljava/lang/String; = "launcher.add_span_x"

.field private static final RUNTIME_STATE_PENDING_ADD_SPAN_Y:Ljava/lang/String; = "launcher.add_span_y"

.field private static final RUNTIME_STATE_PENDING_ADD_WIDGET_INFO:Ljava/lang/String; = "launcher.add_widget_info"

.field private static final RUNTIME_STATE_PENDING_FOLDER_RENAME:Ljava/lang/String; = "launcher.rename_folder"

.field private static final RUNTIME_STATE_PENDING_FOLDER_RENAME_ID:Ljava/lang/String; = "launcher.rename_folder_id"

.field static final SCREEN_COUNT:I = 0x5

.field private static final SHOW_CLING_DURATION:I = 0x226

.field private static final TAG:Ljava/lang/String; = "Launcher"

.field static final TAG_SURFACEWIDGET:Ljava/lang/String; = "MTKWidgetView"

.field private static final TOOLBAR_ICON_METADATA_NAME:Ljava/lang/String; = "com.android.launcher.toolbar_icon"

.field private static final TOOLBAR_SEARCH_ICON_METADATA_NAME:Ljava/lang/String; = "com.android.launcher.toolbar_search_icon"

.field private static final TOOLBAR_VOICE_SEARCH_ICON_METADATA_NAME:Ljava/lang/String; = "com.android.launcher.toolbar_voice_search_icon"

.field private static sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

.field static final sDumpLogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sFolders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/android/launcher2/FolderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static sForceEnableRotation:Z

.field private static sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

.field private static sLocaleChanged:Z

.field private static sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

.field private static final sLock:Ljava/lang/Object;

.field private static sPausedFromUserAction:Z

.field private static sPendingAddList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/Launcher$PendingAddArguments;",
            ">;"
        }
    .end annotation
.end field

.field private static sScreen:I

.field private static sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;


# instance fields
.field private final ADVANCE_MSG:I

.field private final mAdvanceInterval:I

.field private final mAdvanceStagger:I

.field private mAllAppsButton:Landroid/view/View;

.field private mAppMarketIntent:Landroid/content/Intent;

.field private mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

.field private mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

.field private mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

.field private mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

.field private mAttached:Z

.field private mAutoAdvanceRunning:Z

.field private mAutoAdvanceSentTime:J

.field private mAutoAdvanceTimeLeft:J

.field private mBindingAppsFinished:Z

.field private mBindingWorkspaceFinished:Z

.field private mBlackBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mBuildLayersRunnable:Ljava/lang/Runnable;

.field private final mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

.field private mCurrentBounds:Landroid/graphics/Rect;

.field private mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

.field private mDividerAnimator:Landroid/animation/AnimatorSet;

.field private mDockDivider:Landroid/view/View;

.field private mDragController:Lcom/android/launcher2/DragController;

.field private mDragLayer:Lcom/android/launcher2/DragLayer;

.field private mFolderIconBitmap:Landroid/graphics/Bitmap;

.field private mFolderIconCanvas:Landroid/graphics/Canvas;

.field private mFolderIconImageView:Landroid/widget/ImageView;

.field private mFolderInfo:Lcom/android/launcher2/FolderInfo;

.field private final mHandler:Landroid/os/Handler;

.field private mHideFromAccessibilityHelper:Lcom/android/launcher2/HideFromAccessibilityHelper;

.field private mHotseat:Lcom/android/launcher2/Hotseat;

.field private mIconCache:Lcom/android/launcher2/IconCache;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mIsLoadingWorkspace:Z

.field private mLastOrientation:I

.field private mLauncherView:Landroid/view/View;

.field private mLongPressWidgetToAddToast:Landroid/widget/Toast;

.field private mModel:Lcom/android/launcher2/LauncherModel;

.field private mNewShortcutAnimatePage:I

.field private mNewShortcutAnimateViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mOnResumeNeedsLoad:Z

.field private mOnResumeState:Lcom/android/launcher2/Launcher$State;

.field private mOrientationChanged:Z

.field private mOrientationListener:Landroid/view/OrientationEventListener;

.field private mPagesWereRecreated:Z

.field private mPaused:Z

.field private mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

.field private mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

.field private mQsbDivider:Landroid/view/View;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRectForFolderAnimation:Landroid/graphics/Rect;

.field private final mRestoreScreenOrientationDelay:I

.field private mRestoring:Z

.field private mSavedInstanceState:Landroid/os/Bundle;

.field private mSavedState:Landroid/os/Bundle;

.field private mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

.field private mSharedPrefs:Landroid/content/SharedPreferences;

.field private mState:Lcom/android/launcher2/Launcher$State;

.field private mStateAnimation:Landroid/animation/AnimatorSet;

.field private final mSynchronouslyBoundPages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTmpAddItemCellCoordinates:[I

.field private mUnreadLoadCompleted:Z

.field private mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

.field private mUserPresent:Z

.field private mVisible:Z

.field private mWaitingForResult:Z

.field private mWaitingForResume:Lcom/android/launcher2/BubbleTextView;

.field private final mWidgetObserver:Landroid/database/ContentObserver;

.field private mWidgetsToAdvance:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mWorkspace:Lcom/android/launcher2/Workspace;

.field private mWorkspaceBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mWorkspaceLoading:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x2

    .line 210
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/launcher2/Launcher;->sLock:Ljava/lang/Object;

    .line 211
    sput v1, Lcom/android/launcher2/Launcher;->sScreen:I

    .line 214
    const/16 v0, 0xa

    sput v0, Lcom/android/launcher2/Launcher;->NEW_APPS_ANIMATION_INACTIVE_TIMEOUT_SECONDS:I

    .line 263
    sput-boolean v2, Lcom/android/launcher2/Launcher;->sPausedFromUserAction:Z

    .line 273
    const/4 v0, 0x0

    sput-object v0, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    .line 275
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/launcher2/Launcher;->sFolders:Ljava/util/HashMap;

    .line 293
    new-array v0, v1, [Landroid/graphics/drawable/Drawable$ConstantState;

    sput-object v0, Lcom/android/launcher2/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    .line 294
    new-array v0, v1, [Landroid/graphics/drawable/Drawable$ConstantState;

    sput-object v0, Lcom/android/launcher2/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    .line 295
    new-array v0, v1, [Landroid/graphics/drawable/Drawable$ConstantState;

    sput-object v0, Lcom/android/launcher2/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    .line 302
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    .line 330
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/launcher2/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    .line 333
    const-string v0, "launcher_force_rotate"

    invoke-static {v0}, Lcom/android/launcher2/Launcher;->isPropertyEnabled(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/android/launcher2/Launcher;->sForceEnableRotation:Z

    .line 349
    sput-boolean v2, Lcom/android/launcher2/Launcher;->sLocaleChanged:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 128
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 200
    sget-object v0, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    .line 216
    new-instance v0, Lcom/android/launcher2/Launcher$CloseSystemDialogsIntentReceiver;

    invoke-direct {v0, p0, v3}, Lcom/android/launcher2/Launcher$CloseSystemDialogsIntentReceiver;-><init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/Launcher$1;)V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

    .line 218
    new-instance v0, Lcom/android/launcher2/Launcher$AppWidgetResetObserver;

    invoke-direct {v0, p0}, Lcom/android/launcher2/Launcher$AppWidgetResetObserver;-><init>(Lcom/android/launcher2/Launcher;)V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mWidgetObserver:Landroid/database/ContentObserver;

    .line 232
    new-instance v0, Lcom/android/launcher2/ItemInfo;

    invoke-direct {v0}, Lcom/android/launcher2/ItemInfo;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    .line 235
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 245
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceRunning:Z

    .line 251
    sget-object v0, Lcom/android/launcher2/Launcher$State;->NONE:Lcom/android/launcher2/Launcher$State;

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    .line 253
    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    .line 255
    iput-boolean v1, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    .line 257
    iput-boolean v1, p0, Lcom/android/launcher2/Launcher;->mPaused:Z

    .line 269
    iput-boolean v1, p0, Lcom/android/launcher2/Launcher;->mUserPresent:Z

    .line 270
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mVisible:Z

    .line 271
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mAttached:Z

    .line 277
    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    .line 280
    iput v1, p0, Lcom/android/launcher2/Launcher;->ADVANCE_MSG:I

    .line 281
    const/16 v0, 0x4e20

    iput v0, p0, Lcom/android/launcher2/Launcher;->mAdvanceInterval:I

    .line 282
    const/16 v0, 0xfa

    iput v0, p0, Lcom/android/launcher2/Launcher;->mAdvanceStagger:I

    .line 284
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceTimeLeft:J

    .line 285
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    .line 290
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/android/launcher2/Launcher;->mRestoreScreenOrientationDelay:I

    .line 300
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mSynchronouslyBoundPages:Ljava/util/ArrayList;

    .line 310
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimatePage:I

    .line 311
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    .line 315
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    .line 319
    new-instance v0, Lcom/android/launcher2/HideFromAccessibilityHelper;

    invoke-direct {v0}, Lcom/android/launcher2/HideFromAccessibilityHelper;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mHideFromAccessibilityHelper:Lcom/android/launcher2/HideFromAccessibilityHelper;

    .line 322
    new-instance v0, Lcom/android/launcher2/Launcher$1;

    invoke-direct {v0, p0}, Lcom/android/launcher2/Launcher$1;-><init>(Lcom/android/launcher2/Launcher;)V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;

    .line 358
    iput v2, p0, Lcom/android/launcher2/Launcher;->mLastOrientation:I

    .line 365
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mUnreadLoadCompleted:Z

    .line 366
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mBindingWorkspaceFinished:Z

    .line 367
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mBindingAppsFinished:Z

    .line 371
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mCurrentBounds:Landroid/graphics/Rect;

    .line 1406
    new-instance v0, Lcom/android/launcher2/Launcher$7;

    invoke-direct {v0, p0}, Lcom/android/launcher2/Launcher$7;-><init>(Lcom/android/launcher2/Launcher;)V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 1523
    new-instance v0, Lcom/android/launcher2/Launcher$9;

    invoke-direct {v0, p0}, Lcom/android/launcher2/Launcher$9;-><init>(Lcom/android/launcher2/Launcher;)V

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    .line 3707
    return-void
.end method

.method private acceptFilter()Z
    .locals 2

    .prologue
    .line 955
    const-string v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 957
    .local v0, inputManager:Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isFullscreenMode()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static synthetic access$100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Workspace;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/LauncherAppWidgetHost;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizeTabHost;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/android/launcher2/Launcher;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    iput-boolean p1, p0, Lcom/android/launcher2/Launcher;->mUserPresent:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/DragLayer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/android/launcher2/Launcher;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateRunning()V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/launcher2/Launcher;)Ljava/lang/Runnable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/launcher2/Launcher;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/launcher2/Launcher;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/Launcher;->sendAdvanceMessage(J)V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/Launcher$State;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    return-object v0
.end method

.method static synthetic access$1902(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/Launcher$State;)Lcom/android/launcher2/Launcher$State;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    iput-object p1, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    return-object p1
.end method

.method static synthetic access$2000(Lcom/android/launcher2/Launcher;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/android/launcher2/Launcher;Landroid/view/View;F)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 128
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V

    return-void
.end method

.method static synthetic access$2200(Lcom/android/launcher2/Launcher;Landroid/view/View;ZZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 128
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    return-void
.end method

.method static synthetic access$2300(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/SearchDropTargetBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/android/launcher2/Launcher;)Landroid/animation/AnimatorSet;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/android/launcher2/Launcher;Landroid/view/View;F)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 128
    invoke-direct {p0, p1, p2}, Lcom/android/launcher2/Launcher;->setPivotsForZoom(Landroid/view/View;F)V

    return-void
.end method

.method static synthetic access$2600(Lcom/android/launcher2/Launcher;Landroid/view/View;ZZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 128
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    return-void
.end method

.method static synthetic access$2700(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/AppsCustomizePagedView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/android/launcher2/Launcher;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->onAppWidgetReset()V

    return-void
.end method

.method static synthetic access$2900(Lcom/android/launcher2/Launcher;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lcom/android/launcher2/Launcher;->runNewAppsAnimation(Z)V

    return-void
.end method

.method static synthetic access$300(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    invoke-static {p0, p1}, Lcom/android/launcher2/Launcher;->readConfiguration(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V

    return-void
.end method

.method static synthetic access$3000(Lcom/android/launcher2/Launcher;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/android/launcher2/Launcher;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lcom/android/launcher2/Launcher;->roundOrientation(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$3200(Lcom/android/launcher2/Launcher;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget v0, p0, Lcom/android/launcher2/Launcher;->mLastOrientation:I

    return v0
.end method

.method static synthetic access$3202(Lcom/android/launcher2/Launcher;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    iput p1, p0, Lcom/android/launcher2/Launcher;->mLastOrientation:I

    return p1
.end method

.method static synthetic access$3300(Lcom/android/launcher2/Launcher;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lcom/android/launcher2/Launcher;->fireAppRotated(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$402(Lcom/android/launcher2/Launcher$LocaleConfiguration;)Lcom/android/launcher2/Launcher$LocaleConfiguration;
    .locals 0
    .parameter "x0"

    .prologue
    .line 128
    sput-object p0, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/launcher2/Launcher;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->checkForLocaleChange()V

    return-void
.end method

.method static synthetic access$600(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 128
    invoke-static {p0, p1}, Lcom/android/launcher2/Launcher;->writeConfiguration(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V

    return-void
.end method

.method static synthetic access$800(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/ItemInfo;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/launcher2/Launcher;IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 128
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher2/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    return-void
.end method

.method private bindAppsUnreadInfo()V
    .locals 2

    .prologue
    .line 4656
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/launcher2/Launcher$33;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Launcher$33;-><init>(Lcom/android/launcher2/Launcher;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4672
    return-void
.end method

.method private bindWorkspaceUnreadInfo()V
    .locals 2

    .prologue
    .line 4634
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/launcher2/Launcher$32;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Launcher$32;-><init>(Lcom/android/launcher2/Launcher;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4650
    return-void
.end method

.method private canRunNewAppsAnimation()Z
    .locals 6

    .prologue
    .line 3986
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v4}, Lcom/android/launcher2/DragController;->getLastGestureUpTime()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 3987
    .local v0, diff:J
    sget v2, Lcom/android/launcher2/Launcher;->NEW_APPS_ANIMATION_INACTIVE_TIMEOUT_SECONDS:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private cancelLongPressWidgetToAddMessage()V
    .locals 1

    .prologue
    .line 4692
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mLongPressWidgetToAddToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 4693
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mLongPressWidgetToAddToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 4695
    :cond_0
    return-void
.end method

.method private checkForLocaleChange()V
    .locals 12

    .prologue
    const/4 v2, 0x0

    .line 528
    sget-object v9, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    if-nez v9, :cond_1

    .line 529
    new-instance v9, Lcom/android/launcher2/Launcher$2;

    invoke-direct {v9, p0}, Lcom/android/launcher2/Launcher$2;-><init>(Lcom/android/launcher2/Launcher;)V

    new-array v10, v2, [Ljava/lang/Void;

    invoke-virtual {v9, v10}, Lcom/android/launcher2/Launcher$2;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 584
    :cond_0
    :goto_0
    return-void

    .line 546
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 548
    .local v0, configuration:Landroid/content/res/Configuration;
    sget-object v9, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    iget-object v6, v9, Lcom/android/launcher2/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    .line 549
    .local v6, previousLocale:Ljava/lang/String;
    iget-object v9, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v9}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    .line 551
    .local v1, locale:Ljava/lang/String;
    sget-object v9, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    iget v7, v9, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mcc:I

    .line 552
    .local v7, previousMcc:I
    iget v4, v0, Landroid/content/res/Configuration;->mcc:I

    .line 554
    .local v4, mcc:I
    sget-object v9, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    iget v8, v9, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mnc:I

    .line 555
    .local v8, previousMnc:I
    iget v5, v0, Landroid/content/res/Configuration;->mnc:I

    .line 557
    .local v5, mnc:I
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    if-ne v4, v7, :cond_2

    if-eq v5, v8, :cond_3

    :cond_2
    const/4 v2, 0x1

    .line 560
    .local v2, localeChanged:Z
    :cond_3
    const-string v9, "Launcher"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "checkForLocaleChange: previousLocale = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", locale = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", previousMcc = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mcc = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", previousMnc = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mnc = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", localeChanged = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", this = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    if-eqz v2, :cond_0

    .line 567
    sget-object v9, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    iput-object v1, v9, Lcom/android/launcher2/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    .line 568
    sget-object v9, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    iput v4, v9, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mcc:I

    .line 569
    sget-object v9, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    iput v5, v9, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mnc:I

    .line 572
    sput-boolean v2, Lcom/android/launcher2/Launcher;->sLocaleChanged:Z

    .line 573
    iget-object v9, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v9}, Lcom/android/launcher2/LauncherModel;->setFlushCache()V

    .line 574
    iget-object v9, p0, Lcom/android/launcher2/Launcher;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-virtual {v9}, Lcom/android/launcher2/IconCache;->flush()V

    .line 576
    sget-object v3, Lcom/android/launcher2/Launcher;->sLocaleConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;

    .line 577
    .local v3, localeConfiguration:Lcom/android/launcher2/Launcher$LocaleConfiguration;
    new-instance v9, Lcom/android/launcher2/Launcher$3;

    const-string v10, "WriteLocaleConfiguration"

    invoke-direct {v9, p0, v10, v3}, Lcom/android/launcher2/Launcher$3;-><init>(Lcom/android/launcher2/Launcher;Ljava/lang/String;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V

    invoke-virtual {v9}, Lcom/android/launcher2/Launcher$3;->start()V

    goto/16 :goto_0
.end method

.method private clearTypedText()V
    .locals 2

    .prologue
    .line 1007
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 1008
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 1009
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 1010
    return-void
.end method

.method private completeAdd(Lcom/android/launcher2/Launcher$PendingAddArguments;)Z
    .locals 8
    .parameter "args"

    .prologue
    const/4 v5, 0x0

    .line 665
    const/4 v7, 0x0

    .line 666
    .local v7, result:Z
    iget v0, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->requestCode:I

    packed-switch v0, :pswitch_data_0

    .line 691
    :goto_0
    :pswitch_0
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->resetAddInfo()V

    .line 692
    return v7

    .line 668
    :pswitch_1
    iget-object v1, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    iget-wide v2, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->container:J

    iget v4, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->screen:I

    iget v5, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->cellX:I

    iget v6, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->cellY:I

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher2/Launcher;->completeAddApplication(Landroid/content/Intent;JIII)V

    goto :goto_0

    .line 672
    :pswitch_2
    iget-object v0, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->processShortcut(Landroid/content/Intent;)V

    goto :goto_0

    .line 675
    :pswitch_3
    iget-object v1, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    iget-wide v2, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->container:J

    iget v4, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->screen:I

    iget v5, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->cellX:I

    iget v6, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->cellY:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/Launcher;->completeAddShortcut(Landroid/content/Intent;JIII)V

    .line 677
    const/4 v7, 0x1

    .line 678
    goto :goto_0

    .line 680
    :pswitch_4
    iget-object v0, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    const-string v2, "appWidgetId"

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 681
    .local v1, appWidgetId:I
    iget-wide v2, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->container:J

    iget v4, p1, Lcom/android/launcher2/Launcher$PendingAddArguments;->screen:I

    move-object v0, p0

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 682
    const/4 v7, 0x1

    .line 683
    goto :goto_0

    .line 666
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 30
    .parameter "appWidgetId"
    .parameter "container"
    .parameter "screen"
    .parameter "hostView"
    .parameter "appWidgetInfo"

    .prologue
    .line 1310
    if-nez p6, :cond_0

    .line 1311
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    move/from16 v0, p1

    invoke-virtual {v5, v0}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object p6

    .line 1314
    :cond_0
    const-string v5, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "completeAddAppWidget: appWidgetId = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", container = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, p2

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", screen = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1319
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    move/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher2/Launcher;->getCellLayout(JI)Lcom/android/launcher2/CellLayout;

    move-result-object v4

    .line 1322
    .local v4, layout:Lcom/android/launcher2/CellLayout;
    if-nez v4, :cond_1

    .line 1323
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v5}, Lcom/android/launcher2/Workspace;->getCurrentDropLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v4

    .line 1326
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Lcom/android/launcher2/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v26

    .line 1327
    .local v26, minSpanXY:[I
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v28

    .line 1332
    .local v28, spanXY:[I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/launcher2/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 1333
    .local v11, cellXY:[I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-object v0, v5, Lcom/android/launcher2/ItemInfo;->dropPos:[I

    move-object/from16 v29, v0

    .line 1334
    .local v29, touchXY:[I
    const/4 v5, 0x2

    new-array v12, v5, [I

    .line 1335
    .local v12, finalSpan:[I
    const/16 v25, 0x0

    .line 1336
    .local v25, foundCellSpan:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->cellX:I

    if-ltz v5, :cond_3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->cellY:I

    if-ltz v5, :cond_3

    .line 1337
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->cellX:I

    aput v6, v11, v5

    .line 1338
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->cellY:I

    aput v6, v11, v5

    .line 1339
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->spanX:I

    aput v6, v28, v5

    .line 1340
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->spanY:I

    aput v6, v28, v5

    .line 1341
    const/16 v25, 0x1

    .line 1354
    :goto_0
    if-nez v25, :cond_6

    .line 1355
    const/4 v5, -0x1

    move/from16 v0, p1

    if-eq v0, v5, :cond_2

    .line 1358
    new-instance v5, Lcom/android/launcher2/Launcher$6;

    const-string v6, "deleteAppWidgetId"

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v5, v0, v6, v1}, Lcom/android/launcher2/Launcher$6;-><init>(Lcom/android/launcher2/Launcher;Ljava/lang/String;I)V

    invoke-virtual {v5}, Lcom/android/launcher2/Launcher$6;->start()V

    .line 1364
    :cond_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/launcher2/Launcher;->showOutOfSpaceMessage(Z)V

    .line 1404
    :goto_1
    return-void

    .line 1342
    :cond_3
    if-eqz v29, :cond_5

    .line 1344
    const/4 v5, 0x0

    aget v5, v29, v5

    const/4 v6, 0x1

    aget v6, v29, v6

    const/4 v7, 0x0

    aget v7, v26, v7

    const/4 v8, 0x1

    aget v8, v26, v8

    const/4 v9, 0x0

    aget v9, v28, v9

    const/4 v10, 0x1

    aget v10, v28, v10

    invoke-virtual/range {v4 .. v12}, Lcom/android/launcher2/CellLayout;->findNearestVacantArea(IIIIII[I[I)[I

    move-result-object v27

    .line 1347
    .local v27, result:[I
    const/4 v5, 0x0

    const/4 v6, 0x0

    aget v6, v12, v6

    aput v6, v28, v5

    .line 1348
    const/4 v5, 0x1

    const/4 v6, 0x1

    aget v6, v12, v6

    aput v6, v28, v5

    .line 1349
    if-eqz v27, :cond_4

    const/16 v25, 0x1

    .line 1350
    :goto_2
    goto :goto_0

    .line 1349
    :cond_4
    const/16 v25, 0x0

    goto :goto_2

    .line 1351
    .end local v27           #result:[I
    :cond_5
    const/4 v5, 0x0

    aget v5, v26, v5

    const/4 v6, 0x1

    aget v6, v26, v6

    invoke-virtual {v4, v11, v5, v6}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

    move-result v25

    goto :goto_0

    .line 1369
    :cond_6
    new-instance v14, Lcom/android/launcher2/LauncherAppWidgetInfo;

    move-object/from16 v0, p6

    iget-object v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    move/from16 v0, p1

    invoke-direct {v14, v0, v5}, Lcom/android/launcher2/LauncherAppWidgetInfo;-><init>(ILandroid/content/ComponentName;)V

    .line 1371
    .local v14, launcherInfo:Lcom/android/launcher2/LauncherAppWidgetInfo;
    const/4 v5, 0x0

    aget v5, v28, v5

    iput v5, v14, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 1372
    const/4 v5, 0x1

    aget v5, v28, v5

    iput v5, v14, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 1373
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    iput v5, v14, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 1374
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v5, v5, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    iput v5, v14, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    .line 1376
    const/4 v5, 0x0

    aget v18, v11, v5

    const/4 v5, 0x1

    aget v19, v11, v5

    const/16 v20, 0x0

    move-object/from16 v13, p0

    move-wide/from16 v15, p2

    move/from16 v17, p4

    invoke-static/range {v13 .. v20}, Lcom/android/launcher2/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIIIZ)V

    .line 1379
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/android/launcher2/Launcher;->mIsLoadingWorkspace:Z

    if-eqz v5, :cond_7

    .line 1380
    const-string v5, "Launcher"

    const-string v6, "Just Loading Workspace, force reload"

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1381
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v5}, Lcom/android/launcher2/LauncherModel;->forceReload()V

    .line 1384
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    if-nez v5, :cond_8

    .line 1385
    if-nez p5, :cond_9

    .line 1387
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p6

    invoke-virtual {v5, v0, v1, v2}, Lcom/android/launcher2/LauncherAppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    move-result-object v5

    iput-object v5, v14, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 1388
    iget-object v5, v14, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    move/from16 v0, p1

    move-object/from16 v1, p6

    invoke-virtual {v5, v0, v1}, Landroid/appwidget/AppWidgetHostView;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 1394
    :goto_3
    iget-object v5, v14, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {v5, v14}, Landroid/appwidget/AppWidgetHostView;->setTag(Ljava/lang/Object;)V

    .line 1395
    iget-object v5, v14, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/appwidget/AppWidgetHostView;->setVisibility(I)V

    .line 1396
    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Lcom/android/launcher2/LauncherAppWidgetInfo;->notifyWidgetSizeChanged(Lcom/android/launcher2/Launcher;)V

    .line 1398
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v0, v14, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    move-object/from16 v16, v0

    const/4 v5, 0x0

    aget v20, v11, v5

    const/4 v5, 0x1

    aget v21, v11, v5

    iget v0, v14, Lcom/android/launcher2/ItemInfo;->spanX:I

    move/from16 v22, v0

    iget v0, v14, Lcom/android/launcher2/ItemInfo;->spanY:I

    move/from16 v23, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Launcher;->isWorkspaceLocked()Z

    move-result v24

    move-wide/from16 v17, p2

    move/from16 v19, p4

    invoke-virtual/range {v15 .. v24}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 1401
    iget-object v5, v14, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-virtual {v0, v5, v1}, Lcom/android/launcher2/Launcher;->addWidgetToAutoAdvanceIfNeeded(Landroid/view/View;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 1403
    :cond_8
    invoke-direct/range {p0 .. p0}, Lcom/android/launcher2/Launcher;->resetAddInfo()V

    goto/16 :goto_1

    .line 1391
    :cond_9
    move-object/from16 v0, p5

    iput-object v0, v14, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    goto :goto_3
.end method

.method private completeAddShortcut(Landroid/content/Intent;JIII)V
    .locals 26
    .parameter "data"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 1215
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 1216
    .local v9, cellXY:[I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-object v0, v4, Lcom/android/launcher2/ItemInfo;->dropPos:[I

    move-object/from16 v25, v0

    .line 1217
    .local v25, touchXY:[I
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    move/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher2/Launcher;->getCellLayout(JI)Lcom/android/launcher2/CellLayout;

    move-result-object v8

    .line 1219
    .local v8, layout:Lcom/android/launcher2/CellLayout;
    const/16 v22, 0x0

    .line 1221
    .local v22, foundCellSpan:Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v4, v0, v1, v6}, Lcom/android/launcher2/LauncherModel;->infoFromShortcutIntent(Landroid/content/Context;Landroid/content/Intent;Landroid/graphics/Bitmap;)Lcom/android/launcher2/ShortcutInfo;

    move-result-object v23

    .line 1223
    .local v23, info:Lcom/android/launcher2/ShortcutInfo;
    const-string v4, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "completeAddShortcut: info = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v23

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", data = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", container = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, p2

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", screen = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", cellX = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p5

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", cellY = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1228
    if-nez v23, :cond_1

    .line 1273
    :cond_0
    :goto_0
    return-void

    .line 1231
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Launcher;->createShortcut(Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;

    move-result-object v5

    .line 1234
    .local v5, view:Landroid/view/View;
    if-ltz p5, :cond_2

    if-ltz p6, :cond_2

    .line 1235
    const/4 v4, 0x0

    aput p5, v9, v4

    .line 1236
    const/4 v4, 0x1

    aput p6, v9, v4

    .line 1237
    const/16 v22, 0x1

    .line 1240
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-wide/from16 v6, p2

    invoke-virtual/range {v4 .. v13}, Lcom/android/launcher2/Workspace;->createUserFolderIfNecessary(Landroid/view/View;JLcom/android/launcher2/CellLayout;[IFZLcom/android/launcher2/DragView;Ljava/lang/Runnable;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1244
    new-instance v11, Lcom/android/launcher2/DropTarget$DragObject;

    invoke-direct {v11}, Lcom/android/launcher2/DropTarget$DragObject;-><init>()V

    .line 1245
    .local v11, dragObject:Lcom/android/launcher2/DropTarget$DragObject;
    move-object/from16 v0, v23

    iput-object v0, v11, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 1246
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v10, 0x0

    const/4 v12, 0x1

    move-object v7, v5

    invoke-virtual/range {v6 .. v12}, Lcom/android/launcher2/Workspace;->addToExistingFolderIfNecessary(Landroid/view/View;Lcom/android/launcher2/CellLayout;[IFLcom/android/launcher2/DropTarget$DragObject;Z)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1258
    .end local v11           #dragObject:Lcom/android/launcher2/DropTarget$DragObject;
    :goto_1
    if-nez v22, :cond_5

    .line 1259
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/launcher2/Launcher;->showOutOfSpaceMessage(Z)V

    goto :goto_0

    .line 1250
    :cond_2
    if-eqz v25, :cond_4

    .line 1252
    const/4 v4, 0x0

    aget v13, v25, v4

    const/4 v4, 0x1

    aget v14, v25, v4

    const/4 v15, 0x1

    const/16 v16, 0x1

    move-object v12, v8

    move-object/from16 v17, v9

    invoke-virtual/range {v12 .. v17}, Lcom/android/launcher2/CellLayout;->findNearestVacantArea(IIII[I)[I

    move-result-object v24

    .line 1253
    .local v24, result:[I
    if-eqz v24, :cond_3

    const/16 v22, 0x1

    .line 1254
    :goto_2
    goto :goto_1

    .line 1253
    :cond_3
    const/16 v22, 0x0

    goto :goto_2

    .line 1255
    .end local v24           #result:[I
    :cond_4
    const/4 v4, 0x1

    const/4 v6, 0x1

    invoke-virtual {v8, v9, v4, v6}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

    move-result v22

    goto :goto_1

    .line 1263
    :cond_5
    const/4 v4, 0x0

    aget v17, v9, v4

    const/4 v4, 0x1

    aget v18, v9, v4

    const/16 v19, 0x0

    move-object/from16 v12, p0

    move-object/from16 v13, v23

    move-wide/from16 v14, p2

    move/from16 v16, p4

    invoke-static/range {v12 .. v19}, Lcom/android/launcher2/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIIIZ)V

    .line 1265
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/launcher2/Launcher;->mIsLoadingWorkspace:Z

    if-eqz v4, :cond_6

    .line 1266
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v4}, Lcom/android/launcher2/LauncherModel;->forceReload()V

    .line 1269
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    if-nez v4, :cond_0

    .line 1270
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v4, 0x0

    aget v17, v9, v4

    const/4 v4, 0x1

    aget v18, v9, v4

    const/16 v19, 0x1

    const/16 v20, 0x1

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Launcher;->isWorkspaceLocked()Z

    move-result v21

    move-object v13, v5

    move-wide/from16 v14, p2

    move/from16 v16, p4

    invoke-virtual/range {v12 .. v21}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    goto/16 :goto_0
.end method

.method private completeTwoStageWidgetDrop(II)V
    .locals 9
    .parameter "resultCode"
    .parameter "appWidgetId"

    .prologue
    .line 781
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "completeTwoStageWidgetDrop resultCode = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", appWidgetId = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", mPendingAddInfo.screen = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v3, v3, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v1, v1, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout;

    .line 786
    .local v2, cellLayout:Lcom/android/launcher2/CellLayout;
    const/4 v4, 0x0

    .line 787
    .local v4, onCompleteRunnable:Ljava/lang/Runnable;
    const/4 v5, 0x0

    .line 789
    .local v5, animationType:I
    const/4 v6, 0x0

    .line 790
    .local v6, boundWidget:Landroid/appwidget/AppWidgetHostView;
    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    .line 791
    const/4 v5, 0x3

    .line 792
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {v0, p0, p2, v1}, Lcom/android/launcher2/LauncherAppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    move-result-object v8

    .line 794
    .local v8, layout:Landroid/appwidget/AppWidgetHostView;
    move-object v6, v8

    .line 795
    new-instance v4, Lcom/android/launcher2/Launcher$4;

    .end local v4           #onCompleteRunnable:Ljava/lang/Runnable;
    invoke-direct {v4, p0, p2, v8, p1}, Lcom/android/launcher2/Launcher$4;-><init>(Lcom/android/launcher2/Launcher;ILandroid/appwidget/AppWidgetHostView;I)V

    .line 814
    .end local v8           #layout:Landroid/appwidget/AppWidgetHostView;
    .restart local v4       #onCompleteRunnable:Ljava/lang/Runnable;
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v0}, Lcom/android/launcher2/DragLayer;->getAnimatedView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 815
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v3}, Lcom/android/launcher2/DragLayer;->getAnimatedView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/DragView;

    const/4 v7, 0x1

    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher2/Workspace;->animateWidgetDrop(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 822
    :goto_1
    return-void

    .line 804
    :cond_1
    if-nez p1, :cond_0

    .line 805
    const/4 v5, 0x4

    .line 806
    new-instance v4, Lcom/android/launcher2/Launcher$5;

    .end local v4           #onCompleteRunnable:Ljava/lang/Runnable;
    invoke-direct {v4, p0, p1}, Lcom/android/launcher2/Launcher$5;-><init>(Lcom/android/launcher2/Launcher;I)V

    .restart local v4       #onCompleteRunnable:Ljava/lang/Runnable;
    goto :goto_0

    .line 820
    :cond_2
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    goto :goto_1
.end method

.method private copyFolderIconToImage(Lcom/android/launcher2/FolderIcon;)V
    .locals 7
    .parameter "fi"

    .prologue
    .line 2499
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getMeasuredWidth()I

    move-result v3

    .line 2500
    .local v3, width:I
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getMeasuredHeight()I

    move-result v0

    .line 2503
    .local v0, height:I
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    if-nez v4, :cond_0

    .line 2504
    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    .line 2506
    :cond_0
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v4, v3, :cond_1

    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-eq v4, v0, :cond_2

    .line 2508
    :cond_1
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v0, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    .line 2509
    new-instance v4, Landroid/graphics/Canvas;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v4, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconCanvas:Landroid/graphics/Canvas;

    .line 2513
    :cond_2
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    instance-of v4, v4, Lcom/android/launcher2/DragLayer$LayoutParams;

    if-eqz v4, :cond_6

    .line 2514
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/DragLayer$LayoutParams;

    .line 2521
    .local v1, lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    :goto_0
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    invoke-virtual {v4, p1, v5}, Lcom/android/launcher2/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result v2

    .line 2522
    .local v2, scale:F
    const/4 v4, 0x1

    iput-boolean v4, v1, Lcom/android/launcher2/DragLayer$LayoutParams;->customPosition:Z

    .line 2523
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iput v4, v1, Lcom/android/launcher2/DragLayer$LayoutParams;->x:I

    .line 2524
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iput v4, v1, Lcom/android/launcher2/DragLayer$LayoutParams;->y:I

    .line 2525
    int-to-float v4, v3

    mul-float/2addr v4, v2

    float-to-int v4, v4

    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 2526
    int-to-float v4, v0

    mul-float/2addr v4, v2

    float-to-int v4, v4

    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 2528
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconCanvas:Landroid/graphics/Canvas;

    const/4 v5, 0x0

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 2529
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p1, v4}, Lcom/android/launcher2/FolderIcon;->draw(Landroid/graphics/Canvas;)V

    .line 2530
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 2531
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolder()Lcom/android/launcher2/Folder;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 2532
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolder()Lcom/android/launcher2/Folder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/launcher2/Folder;->getPivotXForIconAnimation()F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setPivotX(F)V

    .line 2533
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolder()Lcom/android/launcher2/Folder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/launcher2/Folder;->getPivotYForIconAnimation()F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setPivotY(F)V

    .line 2537
    :cond_3
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v5}, Lcom/android/launcher2/DragLayer;->indexOfChild(Landroid/view/View;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_4

    .line 2538
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v5}, Lcom/android/launcher2/DragLayer;->removeView(Landroid/view/View;)V

    .line 2540
    :cond_4
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v5, v1}, Lcom/android/launcher2/DragLayer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2541
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolder()Lcom/android/launcher2/Folder;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 2542
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolder()Lcom/android/launcher2/Folder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/launcher2/Folder;->bringToFront()V

    .line 2544
    :cond_5
    return-void

    .line 2516
    .end local v1           #lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    .end local v2           #scale:F
    :cond_6
    new-instance v1, Lcom/android/launcher2/DragLayer$LayoutParams;

    invoke-direct {v1, v3, v0}, Lcom/android/launcher2/DragLayer$LayoutParams;-><init>(II)V

    .restart local v1       #lp:Lcom/android/launcher2/DragLayer$LayoutParams;
    goto/16 :goto_0
.end method

.method private disableOrientationListener()V
    .locals 3

    .prologue
    .line 4543
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "landscape_launcher"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4544
    .local v0, cmpName:Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4545
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/launcher2/Launcher;->mLastOrientation:I

    .line 4546
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->disable()V

    .line 4548
    :cond_0
    return-void
.end method

.method private dismissCling(Lcom/android/launcher2/Cling;Ljava/lang/String;I)V
    .locals 5
    .parameter "cling"
    .parameter "flag"
    .parameter "duration"

    .prologue
    .line 4275
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/android/launcher2/Cling;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    .line 4276
    const-string v1, "alpha"

    const/4 v2, 0x1

    new-array v2, v2, [F

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput v4, v2, v3

    invoke-static {p1, v1, v2}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 4277
    .local v0, anim:Landroid/animation/ObjectAnimator;
    int-to-long v1, p3

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 4278
    new-instance v1, Lcom/android/launcher2/Launcher$28;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher2/Launcher$28;-><init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/Cling;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 4292
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 4293
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHideFromAccessibilityHelper:Lcom/android/launcher2/HideFromAccessibilityHelper;

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v1, v2}, Lcom/android/launcher2/HideFromAccessibilityHelper;->restoreImportantForAccessibility(Landroid/view/View;)V

    .line 4295
    .end local v0           #anim:Landroid/animation/ObjectAnimator;
    :cond_0
    return-void
.end method

.method private dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V
    .locals 1
    .parameter "v"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 2811
    instance-of v0, p1, Lcom/android/launcher2/LauncherTransitionable;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 2812
    check-cast v0, Lcom/android/launcher2/LauncherTransitionable;

    invoke-interface {v0, p0, p2, p3}, Lcom/android/launcher2/LauncherTransitionable;->onLauncherTransitionEnd(Lcom/android/launcher2/Launcher;ZZ)V

    .line 2816
    :cond_0
    const/high16 v0, 0x3f80

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V

    .line 2817
    return-void
.end method

.method private dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V
    .locals 1
    .parameter "v"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 2790
    instance-of v0, p1, Lcom/android/launcher2/LauncherTransitionable;

    if-eqz v0, :cond_0

    .line 2791
    check-cast p1, Lcom/android/launcher2/LauncherTransitionable;

    .end local p1
    invoke-interface {p1, p0, p2, p3}, Lcom/android/launcher2/LauncherTransitionable;->onLauncherTransitionPrepare(Lcom/android/launcher2/Launcher;ZZ)V

    .line 2793
    :cond_0
    return-void
.end method

.method private dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V
    .locals 1
    .parameter "v"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 2796
    instance-of v0, p1, Lcom/android/launcher2/LauncherTransitionable;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 2797
    check-cast v0, Lcom/android/launcher2/LauncherTransitionable;

    invoke-interface {v0, p0, p2, p3}, Lcom/android/launcher2/LauncherTransitionable;->onLauncherTransitionStart(Lcom/android/launcher2/Launcher;ZZ)V

    .line 2801
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V

    .line 2802
    return-void
.end method

.method private dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    .locals 1
    .parameter "v"
    .parameter "t"

    .prologue
    .line 2805
    instance-of v0, p1, Lcom/android/launcher2/LauncherTransitionable;

    if-eqz v0, :cond_0

    .line 2806
    check-cast p1, Lcom/android/launcher2/LauncherTransitionable;

    .end local p1
    invoke-interface {p1, p0, p2}, Lcom/android/launcher2/LauncherTransitionable;->onLauncherTransitionStep(Lcom/android/launcher2/Launcher;F)V

    .line 2808
    :cond_0
    return-void
.end method

.method public static dumpDebugLogsToConsole()V
    .locals 4

    .prologue
    .line 4414
    const-string v1, "Launcher"

    const-string v2, ""

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4415
    const-string v1, "Launcher"

    const-string v2, "*********************"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4416
    const-string v1, "Launcher"

    const-string v2, "Launcher debug logs: "

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4417
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget-object v1, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 4418
    const-string v2, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v1, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4417
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 4420
    :cond_0
    const-string v1, "Launcher"

    const-string v2, "*********************"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4421
    const-string v1, "Launcher"

    const-string v2, ""

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4422
    return-void
.end method

.method private enableOrientationListener()V
    .locals 3

    .prologue
    .line 4528
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "landscape_launcher"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4529
    .local v0, cmpName:Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4530
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->canDetectOrientation()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 4531
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->enable()V

    .line 4532
    const/16 v1, 0x10e

    iput v1, p0, Lcom/android/launcher2/Launcher;->mLastOrientation:I

    .line 4537
    :cond_0
    :goto_0
    return-void

    .line 4534
    :cond_1
    const v1, 0x7f0d0001

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private fireAppRotated(Ljava/lang/String;)V
    .locals 6
    .parameter "cmpName"

    .prologue
    const/4 v5, 0x0

    .line 4515
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fireAppRotated: cmpName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4518
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 4519
    .local v1, name:[Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.ROTATED_MAIN"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4520
    .local v0, intent:Landroid/content/Intent;
    new-instance v2, Landroid/content/ComponentName;

    const/4 v3, 0x0

    aget-object v3, v1, v3

    const/4 v4, 0x1

    aget-object v4, v1, v4

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4521
    invoke-virtual {p0, v5, v0, v5}, Lcom/android/launcher2/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 4522
    return-void
.end method

.method private getCurrentOrientationIndexForGlobalIcons()I
    .locals 1

    .prologue
    .line 3429
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    packed-switch v0, :pswitch_data_0

    .line 3433
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 3431
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 3429
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method private getExternalPackageToolbarIcon(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 9
    .parameter "activityName"
    .parameter "resourceName"

    .prologue
    .line 3439
    :try_start_0
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 3441
    .local v4, packageManager:Landroid/content/pm/PackageManager;
    const/16 v6, 0x80

    invoke-virtual {v4, p1, v6}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v6

    iget-object v2, v6, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 3443
    .local v2, metaData:Landroid/os/Bundle;
    if-eqz v2, :cond_0

    .line 3444
    invoke-virtual {v2, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 3445
    .local v1, iconResId:I
    if-eqz v1, :cond_0

    .line 3446
    invoke-virtual {v4, p1}, Landroid/content/pm/PackageManager;->getResourcesForActivity(Landroid/content/ComponentName;)Landroid/content/res/Resources;

    move-result-object v5

    .line 3447
    .local v5, res:Landroid/content/res/Resources;
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v6

    .line 3459
    .end local v1           #iconResId:I
    .end local v2           #metaData:Landroid/os/Bundle;
    .end local v4           #packageManager:Landroid/content/pm/PackageManager;
    .end local v5           #res:Landroid/content/res/Resources;
    :goto_0
    return-object v6

    .line 3450
    :catch_0
    move-exception v0

    .line 3452
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v6, "Launcher"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to load toolbar icon; "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not found"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3459
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    :goto_1
    const/4 v6, 0x0

    goto :goto_0

    .line 3454
    :catch_1
    move-exception v3

    .line 3456
    .local v3, nfe:Landroid/content/res/Resources$NotFoundException;
    const-string v6, "Launcher"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to load toolbar icon from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method static getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I
    .locals 3
    .parameter "context"
    .parameter "info"

    .prologue
    .line 1290
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iget v1, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    iget v2, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

    move-result-object v0

    return-object v0
.end method

.method static getMinSpanForWidget(Landroid/content/Context;Lcom/android/launcher2/PendingAddWidgetInfo;)[I
    .locals 3
    .parameter "context"
    .parameter "info"

    .prologue
    .line 1298
    iget-object v0, p1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeWidth:I

    iget v2, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minResizeHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

    move-result-object v0

    return-object v0
.end method

.method static getScreen()I
    .locals 2

    .prologue
    .line 649
    sget-object v1, Lcom/android/launcher2/Launcher;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 650
    :try_start_0
    sget v0, Lcom/android/launcher2/Launcher;->sScreen:I

    monitor-exit v1

    return v0

    .line 651
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I
    .locals 3
    .parameter "context"
    .parameter "info"

    .prologue
    .line 1286
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iget v1, p1, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    iget v2, p1, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

    move-result-object v0

    return-object v0
.end method

.method static getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I
    .locals 6
    .parameter "context"
    .parameter "component"
    .parameter "minWidth"
    .parameter "minHeight"

    .prologue
    const/4 v5, 0x0

    .line 1277
    invoke-static {p0, p1, v5}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v0

    .line 1280
    .local v0, padding:Landroid/graphics/Rect;
    iget v3, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, p2

    iget v4, v0, Landroid/graphics/Rect;->right:I

    add-int v2, v3, v4

    .line 1281
    .local v2, requiredWidth:I
    iget v3, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v3, p3

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    add-int v1, v3, v4

    .line 1282
    .local v1, requiredHeight:I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v3, v2, v1, v5}, Lcom/android/launcher2/CellLayout;->rectToCell(Landroid/content/res/Resources;II[I)[I

    move-result-object v3

    return-object v3
.end method

.method static getSpanForWidget(Landroid/content/Context;Lcom/android/launcher2/PendingAddWidgetInfo;)[I
    .locals 3
    .parameter "context"
    .parameter "info"

    .prologue
    .line 1294
    iget-object v0, p1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    iget v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minWidth:I

    iget v2, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->minHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

    move-result-object v0

    return-object v0
.end method

.method public static getThemeColor(Landroid/content/res/Resources;I)I
    .locals 1
    .parameter "res"
    .parameter "id"

    .prologue
    .line 4447
    const/4 v0, 0x0

    .line 4449
    .local v0, color:I
    invoke-virtual {p0}, Landroid/content/res/Resources;->getThemeMainColor()I

    move-result v0

    .line 4451
    if-nez v0, :cond_0

    .line 4452
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 4454
    :cond_0
    return v0
.end method

.method private getTypedText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1003
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private growAndFadeOutFolderIcon(Lcom/android/launcher2/FolderIcon;)V
    .locals 13
    .parameter "fi"

    .prologue
    const/high16 v10, 0x3fc0

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 2547
    if-nez p1, :cond_0

    .line 2569
    :goto_0
    return-void

    .line 2550
    :cond_0
    const-string v7, "alpha"

    new-array v8, v12, [F

    const/4 v9, 0x0

    aput v9, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 2551
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v7, "scaleX"

    new-array v8, v12, [F

    aput v10, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    .line 2552
    .local v5, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v7, "scaleY"

    new-array v8, v12, [F

    aput v10, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v6

    .line 2554
    .local v6, scaleY:Landroid/animation/PropertyValuesHolder;
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/FolderInfo;

    .line 2555
    .local v2, info:Lcom/android/launcher2/FolderInfo;
    iget-wide v7, v2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v9, -0x65

    cmp-long v7, v7, v9

    if-nez v7, :cond_1

    .line 2556
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 2557
    .local v1, cl:Lcom/android/launcher2/CellLayout;
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 2558
    .local v3, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iget v7, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v8, v3, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    invoke-virtual {v1, v7, v8}, Lcom/android/launcher2/CellLayout;->setFolderLeaveBehindCell(II)V

    .line 2562
    .end local v1           #cl:Lcom/android/launcher2/CellLayout;
    .end local v3           #lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/launcher2/Launcher;->copyFolderIconToImage(Lcom/android/launcher2/FolderIcon;)V

    .line 2563
    const/4 v7, 0x4

    invoke-virtual {p1, v7}, Lcom/android/launcher2/FolderIcon;->setVisibility(I)V

    .line 2565
    iget-object v7, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    const/4 v8, 0x3

    new-array v8, v8, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v8, v11

    aput-object v5, v8, v12

    const/4 v9, 0x2

    aput-object v6, v8, v9

    invoke-static {v7, v8}, Lcom/android/launcher2/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 2567
    .local v4, oa:Landroid/animation/ObjectAnimator;
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0a0015

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {v4, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 2568
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0
.end method

.method private handleFolderClick(Lcom/android/launcher2/FolderIcon;)V
    .locals 6
    .parameter "folderIcon"

    .prologue
    .line 2461
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolderInfo()Lcom/android/launcher2/FolderInfo;

    move-result-object v1

    .line 2462
    .local v1, info:Lcom/android/launcher2/FolderInfo;
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3, v1}, Lcom/android/launcher2/Workspace;->getFolderForTag(Ljava/lang/Object;)Lcom/android/launcher2/Folder;

    move-result-object v2

    .line 2466
    .local v2, openFolder:Lcom/android/launcher2/Folder;
    iget-boolean v3, v1, Lcom/android/launcher2/FolderInfo;->opened:Z

    if-eqz v3, :cond_0

    if-nez v2, :cond_0

    .line 2467
    const-string v3, "Launcher"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Folder info marked as open, but associated folder is not open. Screen: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Lcom/android/launcher2/ItemInfo;->cellX:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2469
    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/android/launcher2/FolderInfo;->opened:Z

    .line 2472
    :cond_0
    iget-boolean v3, v1, Lcom/android/launcher2/FolderInfo;->opened:Z

    if-nez v3, :cond_2

    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolder()Lcom/android/launcher2/Folder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher2/Folder;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_2

    .line 2474
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->closeFolder()V

    .line 2476
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->openFolder(Lcom/android/launcher2/FolderIcon;)V

    .line 2492
    :cond_1
    :goto_0
    return-void

    .line 2480
    :cond_2
    if-eqz v2, :cond_1

    .line 2481
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3, v2}, Lcom/android/launcher2/Workspace;->getPageForView(Landroid/view/View;)I

    move-result v0

    .line 2483
    .local v0, folderScreen:I
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->closeFolder(Lcom/android/launcher2/Folder;)V

    .line 2484
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 2486
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->closeFolder()V

    .line 2488
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->openFolder(Lcom/android/launcher2/FolderIcon;)V

    goto :goto_0
.end method

.method private hideAppsCustomizeHelper(Lcom/android/launcher2/Launcher$State;ZZLjava/lang/Runnable;)V
    .locals 19
    .parameter "toState"
    .parameter "animated"
    .parameter "springLoaded"
    .parameter "onCompleteRunnable"

    .prologue
    .line 3067
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "hideAppsCustomzieHelper toState = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ", animated = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ", springLoaded = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3071
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    if-eqz v2, :cond_0

    .line 3072
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->cancel()V

    .line 3073
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 3075
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 3077
    .local v11, res:Landroid/content/res/Resources;
    const v2, 0x7f0a0005

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    .line 3078
    .local v9, duration:I
    const v2, 0x7f0a0008

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    .line 3080
    .local v10, fadeOutDuration:I
    const v2, 0x7f0a0006

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v13, v2

    .line 3082
    .local v13, scaleFactor:F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    .line 3083
    .local v4, fromView:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    .line 3084
    .local v6, toView:Landroid/view/View;
    const/16 v16, 0x0

    .line 3086
    .local v16, workspaceAnim:Landroid/animation/Animator;
    sget-object v2, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_5

    .line 3087
    const v2, 0x7f0a000a

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v14

    .line 3088
    .local v14, stagger:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    sget-object v3, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    move/from16 v0, p2

    invoke-virtual {v2, v3, v0, v14}, Lcom/android/launcher2/Workspace;->getChangeStateAnimation(Lcom/android/launcher2/Workspace$State;ZI)Landroid/animation/Animator;

    move-result-object v16

    .line 3095
    .end local v14           #stagger:I
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v13}, Lcom/android/launcher2/Launcher;->setPivotsForZoom(Landroid/view/View;F)V

    .line 3096
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/Launcher;->updateWallpaperVisibility(Z)V

    .line 3097
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Launcher;->showHotseat(Z)V

    .line 3099
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v2, :cond_2

    .line 3100
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 3101
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    if-eqz v2, :cond_3

    .line 3102
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace;->setVisibility(I)V

    .line 3104
    :cond_3
    if-eqz p2, :cond_6

    .line 3105
    new-instance v12, Lcom/android/launcher2/LauncherViewPropertyAnimator;

    invoke-direct {v12, v4}, Lcom/android/launcher2/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 3107
    .local v12, scaleAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    invoke-virtual {v12, v13}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->scaleX(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v13}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->scaleY(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v2

    int-to-long v0, v9

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    invoke-virtual {v2, v0, v1}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v2

    new-instance v3, Lcom/android/launcher2/Workspace$ZoomInInterpolator;

    invoke-direct {v3}, Lcom/android/launcher2/Workspace$ZoomInInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 3112
    const-string v2, "alpha"

    const/4 v3, 0x2

    new-array v3, v3, [F

    fill-array-data v3, :array_0

    invoke-static {v4, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    int-to-long v0, v10

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    invoke-virtual {v2, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v8

    .line 3115
    .local v8, alphaAnim:Landroid/animation/ObjectAnimator;
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v8, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 3116
    new-instance v2, Lcom/android/launcher2/Launcher$16;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v4, v6}, Lcom/android/launcher2/Launcher$16;-><init>(Lcom/android/launcher2/Launcher;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {v8, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 3125
    invoke-static {}, Lcom/android/launcher2/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 3127
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3128
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3129
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v2}, Lcom/android/launcher2/AppsCustomizePagedView;->pauseScrolling()V

    .line 3131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v17, v0

    new-instance v2, Lcom/android/launcher2/Launcher$17;

    move-object/from16 v3, p0

    move/from16 v5, p2

    move-object/from16 v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/android/launcher2/Launcher$17;-><init>(Lcom/android/launcher2/Launcher;Landroid/view/View;ZLandroid/view/View;Ljava/lang/Runnable;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 3149
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/animation/Animator;

    const/4 v5, 0x0

    aput-object v12, v3, v5

    const/4 v5, 0x1

    aput-object v8, v3, v5

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 3150
    if-eqz v16, :cond_4

    .line 3151
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 3153
    :cond_4
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3154
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3155
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 3156
    .local v15, stateAnimation:Landroid/animation/Animator;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    new-instance v3, Lcom/android/launcher2/Launcher$18;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v15}, Lcom/android/launcher2/Launcher$18;-><init>(Lcom/android/launcher2/Launcher;Landroid/animation/Animator;)V

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace;->post(Ljava/lang/Runnable;)Z

    .line 3173
    .end local v8           #alphaAnim:Landroid/animation/ObjectAnimator;
    .end local v12           #scaleAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    .end local v15           #stateAnimation:Landroid/animation/Animator;
    :goto_1
    return-void

    .line 3090
    :cond_5
    sget-object v2, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/android/launcher2/Launcher$State;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_1

    .line 3091
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    sget-object v3, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    move/from16 v0, p2

    invoke-virtual {v2, v3, v0}, Lcom/android/launcher2/Workspace;->getChangeStateAnimation(Lcom/android/launcher2/Workspace$State;Z)Landroid/animation/Animator;

    move-result-object v16

    goto/16 :goto_0

    .line 3164
    :cond_6
    const/16 v2, 0x8

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setVisibility(I)V

    .line 3165
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3166
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3167
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    .line 3168
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3169
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3170
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    .line 3171
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace;->hideScrollingIndicator(Z)V

    goto :goto_1

    .line 3112
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private initCling(I[IZI)Lcom/android/launcher2/Cling;
    .locals 6
    .parameter "clingId"
    .parameter "positionData"
    .parameter "animate"
    .parameter "delay"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v5, 0x3f80

    .line 4242
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Cling;

    .line 4243
    .local v0, cling:Lcom/android/launcher2/Cling;
    if-eqz v0, :cond_0

    .line 4244
    invoke-virtual {v0, p0, p2}, Lcom/android/launcher2/Cling;->init(Lcom/android/launcher2/Launcher;[I)V

    .line 4245
    invoke-virtual {v0, v2}, Lcom/android/launcher2/Cling;->setVisibility(I)V

    .line 4246
    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/android/launcher2/Cling;->setLayerType(ILandroid/graphics/Paint;)V

    .line 4247
    if-eqz p3, :cond_1

    .line 4248
    invoke-virtual {v0}, Lcom/android/launcher2/Cling;->buildLayer()V

    .line 4249
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/android/launcher2/Cling;->setAlpha(F)V

    .line 4250
    invoke-virtual {v0}, Lcom/android/launcher2/Cling;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    const-wide/16 v4, 0x226

    invoke-virtual {v3, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    int-to-long v4, p4

    invoke-virtual {v3, v4, v5}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 4259
    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/launcher2/Cling;->setFocusableInTouchMode(Z)V

    .line 4260
    new-instance v3, Lcom/android/launcher2/Launcher$27;

    invoke-direct {v3, p0, v0}, Lcom/android/launcher2/Launcher$27;-><init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/Cling;)V

    invoke-virtual {v0, v3}, Lcom/android/launcher2/Cling;->post(Ljava/lang/Runnable;)Z

    .line 4266
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mHideFromAccessibilityHelper:Lcom/android/launcher2/HideFromAccessibilityHelper;

    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    const v5, 0x7f07000c

    if-ne p1, v5, :cond_2

    :goto_1
    invoke-virtual {v3, v4, v1}, Lcom/android/launcher2/HideFromAccessibilityHelper;->setImportantForAccessibilityToNo(Landroid/view/View;Z)V

    .line 4269
    :cond_0
    return-object v0

    .line 4257
    :cond_1
    invoke-virtual {v0, v5}, Lcom/android/launcher2/Cling;->setAlpha(F)V

    goto :goto_0

    :cond_2
    move v1, v2

    .line 4266
    goto :goto_1
.end method

.method private static intToState(I)Lcom/android/launcher2/Launcher$State;
    .locals 4
    .parameter "stateOrdinal"

    .prologue
    .line 1017
    sget-object v1, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    .line 1018
    .local v1, state:Lcom/android/launcher2/Launcher$State;
    invoke-static {}, Lcom/android/launcher2/Launcher$State;->values()[Lcom/android/launcher2/Launcher$State;

    move-result-object v2

    .line 1019
    .local v2, stateValues:[Lcom/android/launcher2/Launcher$State;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 1020
    aget-object v3, v2, v0

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher$State;->ordinal()I

    move-result v3

    if-ne v3, p0, :cond_1

    .line 1021
    aget-object v1, v2, v0

    .line 1025
    :cond_0
    return-object v1

    .line 1019
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V
    .locals 3
    .parameter "container"
    .parameter "button"

    .prologue
    .line 3521
    instance-of v2, p1, Lcom/android/launcher2/HolographicLinearLayout;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 3522
    check-cast v0, Lcom/android/launcher2/HolographicLinearLayout;

    .line 3523
    .local v0, layout:Lcom/android/launcher2/HolographicLinearLayout;
    invoke-virtual {v0}, Lcom/android/launcher2/HolographicLinearLayout;->invalidatePressedFocusedStates()V

    .line 3528
    .end local v0           #layout:Lcom/android/launcher2/HolographicLinearLayout;
    :cond_0
    :goto_0
    return-void

    .line 3524
    :cond_1
    instance-of v2, p2, Lcom/android/launcher2/HolographicImageView;

    if-eqz v2, :cond_0

    move-object v1, p2

    .line 3525
    check-cast v1, Lcom/android/launcher2/HolographicImageView;

    .line 3526
    .local v1, view:Lcom/android/launcher2/HolographicImageView;
    invoke-virtual {v1}, Lcom/android/launcher2/HolographicImageView;->invalidatePressedFocusedStates()V

    goto :goto_0
.end method

.method private isClingsEnabled()Z
    .locals 1

    .prologue
    .line 4236
    invoke-static {}, Landroid/app/ActivityManager;->isRunningInTestHarness()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 4238
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static isPropertyEnabled(Ljava/lang/String;)Z
    .locals 1
    .parameter "propertyName"

    .prologue
    .line 345
    const/4 v0, 0x2

    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private mapConfigurationOriActivityInfoOri(I)I
    .locals 6
    .parameter "configOri"

    .prologue
    const/4 v4, 0x2

    .line 4177
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 4178
    .local v0, d:Landroid/view/Display;
    const/4 v2, 0x2

    .line 4179
    .local v2, naturalOri:I
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 4193
    :goto_0
    const/4 v5, 0x4

    new-array v3, v5, [I

    fill-array-data v3, :array_0

    .line 4201
    .local v3, oriMap:[I
    const/4 v1, 0x0

    .line 4202
    .local v1, indexOffset:I
    if-ne v2, v4, :cond_0

    .line 4203
    const/4 v1, 0x1

    .line 4205
    :cond_0
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    add-int/2addr v4, v1

    rem-int/lit8 v4, v4, 0x4

    aget v4, v3, v4

    return v4

    .line 4183
    .end local v1           #indexOffset:I
    .end local v3           #oriMap:[I
    :pswitch_0
    move v2, p1

    .line 4184
    goto :goto_0

    .line 4188
    :pswitch_1
    if-ne p1, v4, :cond_1

    const/4 v2, 0x1

    :goto_1
    goto :goto_0

    :cond_1
    move v2, v4

    goto :goto_1

    .line 4179
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 4193
    :array_0
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x9t 0x0t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private onAppWidgetReset()V
    .locals 2

    .prologue
    .line 2210
    const-string v0, "Launcher"

    const-string v1, "onAppWidgetReset."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2213
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    if-eqz v0, :cond_0

    .line 2214
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    invoke-virtual {v0}, Lcom/android/launcher2/LauncherAppWidgetHost;->startListening()V

    .line 2216
    :cond_0
    return-void
.end method

.method private static readConfiguration(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V
    .locals 6
    .parameter "context"
    .parameter "configuration"

    .prologue
    .line 593
    const/4 v1, 0x0

    .line 595
    .local v1, in:Ljava/io/DataInputStream;
    :try_start_0
    new-instance v2, Ljava/io/DataInputStream;

    const-string v3, "launcher.preferences"

    invoke-virtual {p0, v3}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 596
    .end local v1           #in:Ljava/io/DataInputStream;
    .local v2, in:Ljava/io/DataInputStream;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p1, Lcom/android/launcher2/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    .line 597
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    iput v3, p1, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mcc:I

    .line 598
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    iput v3, p1, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mnc:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    .line 604
    if-eqz v2, :cond_2

    .line 606
    :try_start_2
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v1, v2

    .line 612
    .end local v2           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    :cond_0
    :goto_0
    return-void

    .line 607
    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v2       #in:Ljava/io/DataInputStream;
    :catch_0
    move-exception v0

    .line 608
    .local v0, e:Ljava/io/IOException;
    const-string v3, "Launcher"

    const-string v4, "IOException when close file."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    .line 609
    .end local v2           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    goto :goto_0

    .line 599
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 600
    .local v0, e:Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_3
    const-string v3, "Launcher"

    const-string v4, "FileNotFoundException when read configuration."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 604
    if-eqz v1, :cond_0

    .line 606
    :try_start_4
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 607
    :catch_2
    move-exception v0

    .line 608
    .local v0, e:Ljava/io/IOException;
    const-string v3, "Launcher"

    const-string v4, "IOException when close file."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 601
    .end local v0           #e:Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 602
    .restart local v0       #e:Ljava/io/IOException;
    :goto_2
    :try_start_5
    const-string v3, "Launcher"

    const-string v4, "IOException when read configuration."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 604
    if-eqz v1, :cond_0

    .line 606
    :try_start_6
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_0

    .line 607
    :catch_4
    move-exception v0

    .line 608
    const-string v3, "Launcher"

    const-string v4, "IOException when close file."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 604
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_3
    if-eqz v1, :cond_1

    .line 606
    :try_start_7
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 609
    :cond_1
    :goto_4
    throw v3

    .line 607
    :catch_5
    move-exception v0

    .line 608
    .restart local v0       #e:Ljava/io/IOException;
    const-string v4, "Launcher"

    const-string v5, "IOException when close file."

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 604
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v2       #in:Ljava/io/DataInputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    goto :goto_3

    .line 601
    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v2       #in:Ljava/io/DataInputStream;
    :catch_6
    move-exception v0

    move-object v1, v2

    .end local v2           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    goto :goto_2

    .line 599
    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v2       #in:Ljava/io/DataInputStream;
    :catch_7
    move-exception v0

    move-object v1, v2

    .end local v2           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    goto :goto_1

    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v2       #in:Ljava/io/DataInputStream;
    :cond_2
    move-object v1, v2

    .end local v2           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    goto :goto_0
.end method

.method private registerContentObservers()V
    .locals 4

    .prologue
    .line 2148
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 2149
    .local v0, resolver:Landroid/content/ContentResolver;
    sget-object v1, Lcom/android/launcher2/LauncherProvider;->CONTENT_APPWIDGET_RESET_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWidgetObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 2151
    return-void
.end method

.method private registerOrientationListener()V
    .locals 3

    .prologue
    .line 4470
    new-instance v1, Lcom/android/launcher2/Launcher$30;

    invoke-direct {v1, p0, p0}, Lcom/android/launcher2/Launcher$30;-><init>(Lcom/android/launcher2/Launcher;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 4492
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "landscape_launcher"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4493
    .local v0, cmpName:Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4494
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->enable()V

    .line 4496
    :cond_0
    return-void
.end method

.method private removeCling(I)V
    .locals 4
    .parameter "id"

    .prologue
    .line 4298
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 4299
    .local v0, cling:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 4300
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 4301
    .local v1, parent:Landroid/view/ViewGroup;
    new-instance v2, Lcom/android/launcher2/Launcher$29;

    invoke-direct {v2, p0, v1, v0}, Lcom/android/launcher2/Launcher$29;-><init>(Lcom/android/launcher2/Launcher;Landroid/view/ViewGroup;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 4307
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mHideFromAccessibilityHelper:Lcom/android/launcher2/HideFromAccessibilityHelper;

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/HideFromAccessibilityHelper;->restoreImportantForAccessibility(Landroid/view/View;)V

    .line 4309
    .end local v1           #parent:Landroid/view/ViewGroup;
    :cond_0
    return-void
.end method

.method private resetAddInfo()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 1948
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const-wide/16 v1, -0x1

    iput-wide v1, v0, Lcom/android/launcher2/ItemInfo;->container:J

    .line 1949
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput v3, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 1950
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput v3, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    iput v3, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 1951
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput v3, v1, Lcom/android/launcher2/ItemInfo;->spanY:I

    iput v3, v0, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 1952
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput v3, v1, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    iput v3, v0, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 1953
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/launcher2/ItemInfo;->dropPos:[I

    .line 1954
    return-void
.end method

.method private resetReSyncFlags()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 4734
    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mOrientationChanged:Z

    .line 4735
    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mPagesWereRecreated:Z

    .line 4736
    return-void
.end method

.method private restoreState(Landroid/os/Bundle;)V
    .locals 13
    .parameter "savedState"

    .prologue
    .line 1035
    const-string v10, "Launcher"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "restoreState: savedState = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1038
    if-nez p1, :cond_1

    .line 1088
    :cond_0
    :goto_0
    return-void

    .line 1042
    :cond_1
    const-string v10, "launcher.state"

    sget-object v11, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v11}, Lcom/android/launcher2/Launcher$State;->ordinal()I

    move-result v11

    invoke-virtual {p1, v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v10

    invoke-static {v10}, Lcom/android/launcher2/Launcher;->intToState(I)Lcom/android/launcher2/Launcher$State;

    move-result-object v9

    .line 1043
    .local v9, state:Lcom/android/launcher2/Launcher$State;
    sget-object v10, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    if-ne v9, v10, :cond_2

    .line 1044
    sget-object v10, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    iput-object v10, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    .line 1047
    :cond_2
    const-string v10, "launcher.current_screen"

    const/4 v11, -0x1

    invoke-virtual {p1, v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 1048
    .local v2, currentScreen:I
    const/4 v10, -0x1

    if-le v2, v10, :cond_3

    .line 1049
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v10, v2}, Lcom/android/launcher2/Workspace;->setCurrentPage(I)V

    .line 1052
    :cond_3
    const-string v10, "launcher.add_container"

    const-wide/16 v11, -0x1

    invoke-virtual {p1, v10, v11, v12}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 1053
    .local v5, pendingAddContainer:J
    const-string v10, "launcher.add_screen"

    const/4 v11, -0x1

    invoke-virtual {p1, v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    .line 1055
    .local v7, pendingAddScreen:I
    const-wide/16 v10, -0x1

    cmp-long v10, v5, v10

    if-eqz v10, :cond_4

    const/4 v10, -0x1

    if-le v7, v10, :cond_4

    .line 1056
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput-wide v5, v10, Lcom/android/launcher2/ItemInfo;->container:J

    .line 1057
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput v7, v10, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 1058
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const-string v11, "launcher.add_cell_x"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v10, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 1059
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const-string v11, "launcher.add_cell_y"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v10, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 1060
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const-string v11, "launcher.add_span_x"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v10, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 1061
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const-string v11, "launcher.add_span_y"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v10, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 1062
    const-string v10, "launcher.add_widget_info"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Landroid/appwidget/AppWidgetProviderInfo;

    iput-object v10, p0, Lcom/android/launcher2/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 1063
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    .line 1064
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    .line 1068
    :cond_4
    const-string v10, "launcher.rename_folder"

    const/4 v11, 0x0

    invoke-virtual {p1, v10, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 1069
    .local v8, renameFolder:Z
    if-eqz v8, :cond_5

    .line 1070
    const-string v10, "launcher.rename_folder_id"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 1071
    .local v3, id:J
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    sget-object v11, Lcom/android/launcher2/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v10, p0, v11, v3, v4}, Lcom/android/launcher2/LauncherModel;->getFolderById(Landroid/content/Context;Ljava/util/HashMap;J)Lcom/android/launcher2/FolderInfo;

    move-result-object v10

    iput-object v10, p0, Lcom/android/launcher2/Launcher;->mFolderInfo:Lcom/android/launcher2/FolderInfo;

    .line 1072
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    .line 1076
    .end local v3           #id:J
    :cond_5
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    if-eqz v10, :cond_0

    .line 1077
    const-string v10, "apps_customize_currentTab"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1078
    .local v0, curTab:Ljava/lang/String;
    if-eqz v0, :cond_6

    .line 1079
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    iget-object v11, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v11, v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->getContentTypeForTabTag(Ljava/lang/String;)Lcom/android/launcher2/AppsCustomizePagedView$ContentType;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/android/launcher2/AppsCustomizeTabHost;->setContentTypeImmediate(Lcom/android/launcher2/AppsCustomizePagedView$ContentType;)V

    .line 1081
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    iget-object v11, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v11}, Lcom/android/launcher2/AppsCustomizePagedView;->getCurrentPage()I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/android/launcher2/AppsCustomizePagedView;->loadAssociatedPages(I)V

    .line 1085
    :cond_6
    const-string v10, "apps_customize_currentIndex"

    invoke-virtual {p1, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 1086
    .local v1, currentIndex:I
    iget-object v10, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v10, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->restorePageForIndex(I)V

    goto/16 :goto_0
.end method

.method private roundOrientation(I)I
    .locals 1
    .parameter "orientation"

    .prologue
    .line 4505
    add-int/lit8 v0, p1, 0x2d

    div-int/lit8 v0, v0, 0x5a

    mul-int/lit8 v0, v0, 0x5a

    rem-int/lit16 v0, v0, 0x168

    return v0
.end method

.method private runNewAppsAnimation(Z)V
    .locals 13
    .parameter "immediate"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/high16 v10, 0x3f80

    .line 3997
    invoke-static {}, Lcom/android/launcher2/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 3998
    .local v0, anim:Landroid/animation/AnimatorSet;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 4001
    .local v2, bounceAnims:Ljava/util/Collection;,"Ljava/util/Collection<Landroid/animation/Animator;>;"
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    new-instance v7, Lcom/android/launcher2/Launcher$22;

    invoke-direct {v7, p0}, Lcom/android/launcher2/Launcher$22;-><init>(Lcom/android/launcher2/Launcher;)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 4012
    if-eqz p1, :cond_0

    .line 4013
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 4014
    .local v5, v:Landroid/view/View;
    invoke-virtual {v5, v10}, Landroid/view/View;->setAlpha(F)V

    .line 4015
    invoke-virtual {v5, v10}, Landroid/view/View;->setScaleX(F)V

    .line 4016
    invoke-virtual {v5, v10}, Landroid/view/View;->setScaleY(F)V

    goto :goto_0

    .line 4019
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #v:Landroid/view/View;
    :cond_0
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_1

    .line 4020
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 4021
    .restart local v5       #v:Landroid/view/View;
    const/4 v6, 0x3

    new-array v6, v6, [Landroid/animation/PropertyValuesHolder;

    const-string v7, "alpha"

    new-array v8, v12, [F

    aput v10, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    aput-object v7, v6, v11

    const-string v7, "scaleX"

    new-array v8, v12, [F

    aput v10, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    aput-object v7, v6, v12

    const/4 v7, 0x2

    const-string v8, "scaleY"

    new-array v9, v12, [F

    aput v10, v9, v11

    invoke-static {v8, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 4025
    .local v1, bounceAnim:Landroid/animation/ValueAnimator;
    const-wide/16 v6, 0x1c2

    invoke-virtual {v1, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 4026
    mul-int/lit8 v6, v3, 0x4b

    int-to-long v6, v6

    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 4027
    new-instance v6, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;

    invoke-direct {v6}, Lcom/android/launcher2/SmoothPagedView$OvershootInterpolator;-><init>()V

    invoke-virtual {v1, v6}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 4028
    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 4019
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 4030
    .end local v1           #bounceAnim:Landroid/animation/ValueAnimator;
    .end local v5           #v:Landroid/view/View;
    :cond_1
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 4031
    new-instance v6, Lcom/android/launcher2/Launcher$23;

    invoke-direct {v6, p0}, Lcom/android/launcher2/Launcher$23;-><init>(Lcom/android/launcher2/Launcher;)V

    invoke-virtual {v0, v6}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 4039
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 4043
    .end local v3           #i:I
    :cond_2
    const/4 v6, -0x1

    iput v6, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimatePage:I

    .line 4044
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 4045
    new-instance v6, Lcom/android/launcher2/Launcher$24;

    const-string v7, "clearNewAppsThread"

    invoke-direct {v6, p0, v7}, Lcom/android/launcher2/Launcher$24;-><init>(Lcom/android/launcher2/Launcher;Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/android/launcher2/Launcher$24;->start()V

    .line 4053
    return-void
.end method

.method private sendAdvanceMessage(J)V
    .locals 3
    .parameter "delay"

    .prologue
    const/4 v2, 0x1

    .line 1499
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1500
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1501
    .local v0, msg:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1502
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceSentTime:J

    .line 1503
    return-void
.end method

.method private setClingTitleWithThemeColor(Landroid/view/View;I)V
    .locals 3
    .parameter "cling"
    .parameter "id"

    .prologue
    .line 4431
    if-eqz p1, :cond_0

    .line 4432
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 4433
    .local v0, titleView:Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 4434
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080008

    invoke-static {v1, v2}, Lcom/android/launcher2/Launcher;->getThemeColor(Landroid/content/res/Resources;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4437
    .end local v0           #titleView:Landroid/widget/TextView;
    :cond_0
    return-void
.end method

.method private setPivotsForZoom(Landroid/view/View;F)V
    .locals 2
    .parameter "view"
    .parameter "scaleFactor"

    .prologue
    const/high16 v1, 0x4000

    .line 2755
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotX(F)V

    .line 2756
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 2757
    return-void
.end method

.method static setScreen(I)V
    .locals 2
    .parameter "screen"

    .prologue
    .line 655
    sget-object v1, Lcom/android/launcher2/Launcher;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 656
    :try_start_0
    sput p0, Lcom/android/launcher2/Launcher;->sScreen:I

    .line 657
    monitor-exit v1

    .line 658
    return-void

    .line 657
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private setWorkspaceBackground(Z)V
    .locals 2
    .parameter "workspace"

    .prologue
    .line 2775
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mLauncherView:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspaceBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2777
    return-void

    .line 2775
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mBlackBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method private setupViews()V
    .locals 3

    .prologue
    .line 1094
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    .line 1096
    .local v0, dragController:Lcom/android/launcher2/DragController;
    const v1, 0x7f07001a

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mLauncherView:Landroid/view/View;

    .line 1097
    const v1, 0x7f07001b

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/DragLayer;

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    .line 1098
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    const v2, 0x7f07001c

    invoke-virtual {v1, v2}, Lcom/android/launcher2/DragLayer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/Workspace;

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    .line 1099
    const v1, 0x7f070022

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mQsbDivider:Landroid/view/View;

    .line 1100
    const v1, 0x7f070023

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    .line 1102
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mLauncherView:Landroid/view/View;

    const/16 v2, 0x400

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1103
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020098

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspaceBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 1104
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v2, -0x100

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mBlackBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 1107
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v1, p0, v0}, Lcom/android/launcher2/DragLayer;->setup(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/DragController;)V

    .line 1110
    const v1, 0x7f070024

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/Hotseat;

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    .line 1111
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    if-eqz v1, :cond_0

    .line 1112
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v1, p0}, Lcom/android/launcher2/Hotseat;->setup(Lcom/android/launcher2/Launcher;)V

    .line 1116
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/launcher2/Workspace;->setHapticFeedbackEnabled(Z)V

    .line 1117
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1, p0}, Lcom/android/launcher2/Workspace;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1118
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1, v0}, Lcom/android/launcher2/Workspace;->setup(Lcom/android/launcher2/DragController;)V

    .line 1119
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->addDragListener(Lcom/android/launcher2/DragController$DragListener;)V

    .line 1122
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    const v2, 0x7f070025

    invoke-virtual {v1, v2}, Lcom/android/launcher2/DragLayer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/SearchDropTargetBar;

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    .line 1125
    const v1, 0x7f07002a

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/AppsCustomizeTabHost;

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    .line 1126
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    const v2, 0x7f070009

    invoke-virtual {v1, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/AppsCustomizePagedView;

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    .line 1128
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v1, p0, v0}, Lcom/android/launcher2/AppsCustomizePagedView;->setup(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/DragController;)V

    .line 1131
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->setDragScoller(Lcom/android/launcher2/DragScroller;)V

    .line 1132
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->setScrollView(Landroid/view/View;)V

    .line 1133
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->setMoveTarget(Landroid/view/View;)V

    .line 1134
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->addDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 1135
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v1, :cond_1

    .line 1136
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v1, p0, v0}, Lcom/android/launcher2/SearchDropTargetBar;->setup(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/DragController;)V

    .line 1138
    :cond_1
    return-void
.end method

.method private showAppsCustomizeHelper(ZZ)V
    .locals 23
    .parameter "animated"
    .parameter "springLoaded"

    .prologue
    .line 2866
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "showAppsCustomizeHelper animated = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ", springLoaded = "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2869
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    if-eqz v2, :cond_0

    .line 2870
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->cancel()V

    .line 2871
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2873
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    .line 2875
    .local v19, res:Landroid/content/res/Resources;
    const v2, 0x7f0a0004

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v16

    .line 2876
    .local v16, duration:I
    const v2, 0x7f0a0007

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v17

    .line 2877
    .local v17, fadeDuration:I
    const v2, 0x7f0a0006

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v10, v2

    .line 2878
    .local v10, scale:F
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    .line 2879
    .local v5, fromView:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    .line 2880
    .local v4, toView:Lcom/android/launcher2/AppsCustomizeTabHost;
    const v2, 0x7f0a000b

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v21

    .line 2883
    .local v21, startDelay:I
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v10}, Lcom/android/launcher2/Launcher;->setPivotsForZoom(Landroid/view/View;F)V

    .line 2886
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    sget-object v3, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    move/from16 v0, p1

    invoke-virtual {v2, v3, v0}, Lcom/android/launcher2/Workspace;->getChangeStateAnimation(Lcom/android/launcher2/Workspace$State;Z)Landroid/animation/Animator;

    move-result-object v22

    .line 2889
    .local v22, workspaceAnim:Landroid/animation/Animator;
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/launcher2/Launcher;->hideHotseat(Z)V

    .line 2890
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v2, :cond_1

    .line 2891
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 2892
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    if-eqz v2, :cond_2

    .line 2893
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace;->setVisibility(I)V

    .line 2895
    :cond_2
    if-eqz p1, :cond_7

    .line 2896
    invoke-virtual {v4, v10}, Lcom/android/launcher2/AppsCustomizeTabHost;->setScaleX(F)V

    .line 2897
    invoke-virtual {v4, v10}, Lcom/android/launcher2/AppsCustomizeTabHost;->setScaleY(F)V

    .line 2898
    new-instance v20, Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-object/from16 v0, v20

    invoke-direct {v0, v4}, Lcom/android/launcher2/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 2899
    .local v20, scaleAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    const/high16 v2, 0x3f80

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->scaleX(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v2

    const/high16 v3, 0x3f80

    invoke-virtual {v2, v3}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->scaleY(F)Lcom/android/launcher2/LauncherViewPropertyAnimator;

    move-result-object v2

    move/from16 v0, v16

    int-to-long v11, v0

    invoke-virtual {v2, v11, v12}, Lcom/android/launcher2/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v2

    new-instance v3, Lcom/android/launcher2/Workspace$ZoomOutInterpolator;

    invoke-direct {v3}, Lcom/android/launcher2/Workspace$ZoomOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2904
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setVisibility(I)V

    .line 2905
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setAlpha(F)V

    .line 2906
    const-string v2, "alpha"

    const/4 v3, 0x2

    new-array v3, v3, [F

    fill-array-data v3, :array_0

    invoke-static {v4, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    move/from16 v0, v17

    int-to-long v11, v0

    invoke-virtual {v2, v11, v12}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v13

    .line 2909
    .local v13, alphaAnim:Landroid/animation/ObjectAnimator;
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x3fc0

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v13, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2910
    new-instance v2, Lcom/android/launcher2/Launcher$12;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v5, v4}, Lcom/android/launcher2/Launcher$12;-><init>(Lcom/android/launcher2/Launcher;Landroid/view/View;Lcom/android/launcher2/AppsCustomizeTabHost;)V

    invoke-virtual {v13, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 2924
    invoke-static {}, Lcom/android/launcher2/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2925
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    move/from16 v0, v21

    int-to-long v11, v0

    invoke-virtual {v2, v11, v12}, Landroid/animation/AnimatorSet$Builder;->after(J)Landroid/animation/AnimatorSet$Builder;

    .line 2926
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v2, v13}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    move/from16 v0, v21

    int-to-long v11, v0

    invoke-virtual {v2, v11, v12}, Landroid/animation/AnimatorSet$Builder;->after(J)Landroid/animation/AnimatorSet$Builder;

    .line 2928
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    new-instance v2, Lcom/android/launcher2/Launcher$13;

    move-object/from16 v3, p0

    move/from16 v6, p1

    move/from16 v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/android/launcher2/Launcher$13;-><init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/AppsCustomizeTabHost;Landroid/view/View;ZZ)V

    invoke-virtual {v9, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2972
    if-eqz v22, :cond_3

    .line 2973
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 2976
    :cond_3
    const/4 v14, 0x0

    .line 2979
    .local v14, delayAnim:Z
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 2980
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 2984
    invoke-interface {v4}, Lcom/android/launcher2/LauncherTransitionable;->getContent()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace;->getMeasuredWidth()I

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v4}, Lcom/android/launcher2/AppsCustomizeTabHost;->getMeasuredWidth()I

    move-result v2

    if-nez v2, :cond_5

    .line 2987
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v18

    .line 2988
    .local v18, observer:Landroid/view/ViewTreeObserver;
    const/4 v14, 0x1

    .line 2993
    :goto_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/launcher2/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2994
    .local v8, stateAnimation:Landroid/animation/AnimatorSet;
    new-instance v6, Lcom/android/launcher2/Launcher$14;

    move-object/from16 v7, p0

    move-object v9, v4

    move-object v11, v5

    move/from16 v12, p1

    invoke-direct/range {v6 .. v12}, Lcom/android/launcher2/Launcher$14;-><init>(Lcom/android/launcher2/Launcher;Landroid/animation/AnimatorSet;Lcom/android/launcher2/AppsCustomizeTabHost;FLandroid/view/View;Z)V

    .line 3014
    .local v6, startAnimRunnable:Ljava/lang/Runnable;
    if-eqz v14, :cond_6

    .line 3015
    new-instance v15, Lcom/android/launcher2/Launcher$15;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v15, v0, v4, v6, v1}, Lcom/android/launcher2/Launcher$15;-><init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/AppsCustomizeTabHost;Ljava/lang/Runnable;Landroid/view/ViewTreeObserver;)V

    .line 3021
    .local v15, delayedStart:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 3057
    .end local v6           #startAnimRunnable:Ljava/lang/Runnable;
    .end local v8           #stateAnimation:Landroid/animation/AnimatorSet;
    .end local v13           #alphaAnim:Landroid/animation/ObjectAnimator;
    .end local v14           #delayAnim:Z
    .end local v15           #delayedStart:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .end local v18           #observer:Landroid/view/ViewTreeObserver;
    .end local v20           #scaleAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    :goto_1
    return-void

    .line 2990
    .restart local v13       #alphaAnim:Landroid/animation/ObjectAnimator;
    .restart local v14       #delayAnim:Z
    .restart local v20       #scaleAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    :cond_5
    const/16 v18, 0x0

    .restart local v18       #observer:Landroid/view/ViewTreeObserver;
    goto :goto_0

    .line 3023
    .restart local v6       #startAnimRunnable:Ljava/lang/Runnable;
    .restart local v8       #stateAnimation:Landroid/animation/AnimatorSet;
    :cond_6
    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 3026
    .end local v6           #startAnimRunnable:Ljava/lang/Runnable;
    .end local v8           #stateAnimation:Landroid/animation/AnimatorSet;
    .end local v13           #alphaAnim:Landroid/animation/ObjectAnimator;
    .end local v14           #delayAnim:Z
    .end local v18           #observer:Landroid/view/ViewTreeObserver;
    .end local v20           #scaleAnim:Lcom/android/launcher2/LauncherViewPropertyAnimator;
    :cond_7
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setTranslationX(F)V

    .line 3027
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setTranslationY(F)V

    .line 3028
    const/high16 v2, 0x3f80

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setScaleX(F)V

    .line 3029
    const/high16 v2, 0x3f80

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setScaleY(F)V

    .line 3030
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->setVisibility(I)V

    .line 3031
    invoke-virtual {v4}, Lcom/android/launcher2/AppsCustomizeTabHost;->bringToFront()V

    .line 3033
    if-nez p2, :cond_8

    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v2

    if-nez v2, :cond_8

    .line 3035
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace;->hideScrollingIndicator(Z)V

    .line 3036
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Launcher;->hideDockDivider()V

    .line 3039
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v2, :cond_8

    .line 3040
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/launcher2/SearchDropTargetBar;->hideSearchBar(Z)V

    .line 3043
    :cond_8
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3044
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3045
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    .line 3046
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3047
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3048
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/android/launcher2/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    goto :goto_1

    .line 2906
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private shrinkAndFadeInFolderIcon(Lcom/android/launcher2/FolderIcon;)V
    .locals 10
    .parameter "fi"

    .prologue
    const/high16 v9, 0x3f80

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 2572
    if-nez p1, :cond_0

    .line 2597
    :goto_0
    return-void

    .line 2573
    :cond_0
    const-string v5, "alpha"

    new-array v6, v8, [F

    aput v9, v6, v7

    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 2574
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v5, "scaleX"

    new-array v6, v8, [F

    aput v9, v6, v7

    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 2575
    .local v3, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v5, "scaleY"

    new-array v6, v8, [F

    aput v9, v6, v7

    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    .line 2577
    .local v4, scaleY:Landroid/animation/PropertyValuesHolder;
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 2580
    .local v1, cl:Lcom/android/launcher2/CellLayout;
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v5, v6}, Lcom/android/launcher2/DragLayer;->removeView(Landroid/view/View;)V

    .line 2581
    invoke-direct {p0, p1}, Lcom/android/launcher2/Launcher;->copyFolderIconToImage(Lcom/android/launcher2/FolderIcon;)V

    .line 2582
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    const/4 v6, 0x3

    new-array v6, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v6, v7

    aput-object v3, v6, v8

    const/4 v7, 0x2

    aput-object v4, v6, v7

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 2584
    .local v2, oa:Landroid/animation/ObjectAnimator;
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0a0015

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    int-to-long v5, v5

    invoke-virtual {v2, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 2585
    new-instance v5, Lcom/android/launcher2/Launcher$11;

    invoke-direct {v5, p0, v1, p1}, Lcom/android/launcher2/Launcher$11;-><init>(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/FolderIcon;)V

    invoke-virtual {v2, v5}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2596
    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0
.end method

.method private skipCustomClingIfNoAccounts()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 4312
    const v5, 0x7f070026

    invoke-virtual {p0, v5}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/Cling;

    .line 4313
    .local v2, cling:Lcom/android/launcher2/Cling;
    invoke-virtual {v2}, Lcom/android/launcher2/Cling;->getDrawIdentifier()Ljava/lang/String;

    move-result-object v5

    const-string v6, "workspace_custom"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 4314
    .local v3, customCling:Z
    if-eqz v3, :cond_0

    .line 4315
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 4316
    .local v1, am:Landroid/accounts/AccountManager;
    const-string v5, "com.google"

    invoke-virtual {v1, v5}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    .line 4317
    .local v0, accounts:[Landroid/accounts/Account;
    array-length v5, v0

    if-nez v5, :cond_0

    const/4 v4, 0x1

    .line 4319
    .end local v0           #accounts:[Landroid/accounts/Account;
    .end local v1           #am:Landroid/accounts/AccountManager;
    :cond_0
    return v4
.end method

.method private startWallpaper()V
    .locals 3

    .prologue
    .line 2125
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->showWorkspace(Z)V

    .line 2126
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SET_WALLPAPER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2127
    .local v1, pickWallpaper:Landroid/content/Intent;
    const v2, 0x7f0d0011

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    .line 2140
    .local v0, chooser:Landroid/content/Intent;
    const/16 v2, 0xa

    invoke-virtual {p0, v0, v2}, Lcom/android/launcher2/Launcher;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2141
    return-void
.end method

.method private updateAppMarketIcon()V
    .locals 9

    .prologue
    const v8, 0x7f070008

    const/4 v7, 0x0

    .line 3646
    invoke-virtual {p0, v8}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 3647
    .local v3, marketButton:Landroid/view/View;
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v5, "android.intent.category.APP_MARKET"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 3650
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    .line 3651
    .local v0, activityName:Landroid/content/ComponentName;
    if-eqz v0, :cond_0

    .line 3652
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v1

    .line 3653
    .local v1, coi:I
    iput-object v2, p0, Lcom/android/launcher2/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    .line 3654
    sget-object v4, Lcom/android/launcher2/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const v5, 0x7f020036

    const-string v6, "com.android.launcher.toolbar_icon"

    invoke-direct {p0, v8, v0, v5, v6}, Lcom/android/launcher2/Launcher;->updateTextButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    aput-object v5, v4, v1

    .line 3657
    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 3664
    .end local v1           #coi:I
    :goto_0
    return-void

    .line 3661
    :cond_0
    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 3662
    invoke-virtual {v3, v7}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_0
.end method

.method private updateAppMarketIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 6
    .parameter "d"

    .prologue
    const/4 v5, 0x0

    .line 3668
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 3669
    .local v2, r:Landroid/content/res/Resources;
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 3670
    .local v1, marketIconDrawable:Landroid/graphics/drawable/Drawable;
    const v4, 0x7f0b001e

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 3671
    .local v3, w:I
    const v4, 0x7f0b001f

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 3672
    .local v0, h:I
    invoke-virtual {v1, v5, v5, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 3674
    const v4, 0x7f070008

    invoke-direct {p0, v4, v1}, Lcom/android/launcher2/Launcher;->updateTextButtonWithDrawable(ILandroid/graphics/drawable/Drawable;)V

    .line 3675
    return-void
.end method

.method private updateButtonWithDrawable(ILandroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 2
    .parameter "buttonId"
    .parameter "d"

    .prologue
    .line 3516
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 3517
    .local v0, button:Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3518
    return-void
.end method

.method private updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 3
    .parameter "buttonId"
    .parameter "activityName"
    .parameter "fallbackDrawableId"
    .parameter "toolbarResourceName"

    .prologue
    .line 3493
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 3494
    .local v0, button:Landroid/widget/ImageView;
    invoke-direct {p0, p2, p4}, Lcom/android/launcher2/Launcher;->getExternalPackageToolbarIcon(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 3496
    .local v1, toolbarIcon:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 3499
    if-nez v1, :cond_1

    .line 3500
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3506
    :cond_0
    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v2

    :goto_1
    return-object v2

    .line 3502
    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 3506
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private updateGlobalIcons()V
    .locals 4

    .prologue
    .line 501
    const/4 v1, 0x0

    .line 502
    .local v1, searchVisible:Z
    const/4 v2, 0x0

    .line 504
    .local v2, voiceVisible:Z
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v0

    .line 505
    .local v0, coi:I
    sget-object v3, Lcom/android/launcher2/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_0

    sget-object v3, Lcom/android/launcher2/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_0

    sget-object v3, Lcom/android/launcher2/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-nez v3, :cond_1

    .line 507
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateAppMarketIcon()V

    .line 508
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateGlobalSearchIcon()Z

    move-result v1

    .line 509
    invoke-direct {p0, v1}, Lcom/android/launcher2/Launcher;->updateVoiceSearchIcon(Z)Z

    move-result v2

    .line 511
    :cond_1
    sget-object v3, Lcom/android/launcher2/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_2

    .line 512
    sget-object v3, Lcom/android/launcher2/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    invoke-direct {p0, v3}, Lcom/android/launcher2/Launcher;->updateGlobalSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 513
    const/4 v1, 0x1

    .line 515
    :cond_2
    sget-object v3, Lcom/android/launcher2/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_3

    .line 516
    sget-object v3, Lcom/android/launcher2/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    invoke-direct {p0, v3}, Lcom/android/launcher2/Launcher;->updateVoiceSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 517
    const/4 v2, 0x1

    .line 519
    :cond_3
    sget-object v3, Lcom/android/launcher2/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_4

    .line 520
    sget-object v3, Lcom/android/launcher2/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    invoke-direct {p0, v3}, Lcom/android/launcher2/Launcher;->updateAppMarketIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 522
    :cond_4
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v3, :cond_5

    .line 523
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v3, v1, v2}, Lcom/android/launcher2/SearchDropTargetBar;->onSearchPackagesChanged(ZZ)V

    .line 525
    :cond_5
    return-void
.end method

.method private updateGlobalSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 4
    .parameter "d"

    .prologue
    const v3, 0x7f070032

    .line 3578
    const v2, 0x7f070033

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 3579
    .local v1, searchButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 3580
    .local v0, searchButton:Landroid/view/View;
    invoke-direct {p0, v3, p1}, Lcom/android/launcher2/Launcher;->updateButtonWithDrawable(ILandroid/graphics/drawable/Drawable$ConstantState;)V

    .line 3581
    invoke-direct {p0, v1, v0}, Lcom/android/launcher2/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3582
    return-void
.end method

.method private updateGlobalSearchIcon()Z
    .locals 15

    .prologue
    const v14, 0x7f070032

    const v13, 0x7f02002f

    const/4 v9, 0x0

    const/16 v11, 0x8

    .line 3531
    const v10, 0x7f070033

    invoke-virtual {p0, v10}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 3532
    .local v4, searchButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v14}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 3533
    .local v3, searchButton:Landroid/widget/ImageView;
    const v10, 0x7f070034

    invoke-virtual {p0, v10}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 3534
    .local v7, voiceButtonContainer:Landroid/view/View;
    const v10, 0x7f070029

    invoke-virtual {p0, v10}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 3535
    .local v6, voiceButton:Landroid/view/View;
    const v10, 0x7f070028

    invoke-virtual {p0, v10}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 3537
    .local v8, voiceButtonProxy:Landroid/view/View;
    const-string v10, "search"

    invoke-virtual {p0, v10}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/SearchManager;

    .line 3539
    .local v5, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v5}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v0

    .line 3540
    .local v0, activityName:Landroid/content/ComponentName;
    if-eqz v0, :cond_4

    .line 3542
    invoke-static {p0}, Lcom/android/launcher2/LauncherExtPlugin;->getSearchButtonExt(Landroid/content/Context;)Lcom/mediatek/launcher2/ext/ISearchButtonExt;

    move-result-object v10

    invoke-interface {v10}, Lcom/mediatek/launcher2/ext/ISearchButtonExt;->needUpdateSearchButtonResource()Z

    move-result v2

    .line 3544
    .local v2, needUpdate:Z
    const-string v10, "Launcher"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateGlobalSearchIcon: needUpdate = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ",activityName = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3546
    if-eqz v2, :cond_3

    .line 3547
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v1

    .line 3548
    .local v1, coi:I
    sget-object v10, Lcom/android/launcher2/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v11, "com.android.launcher.toolbar_search_icon"

    invoke-direct {p0, v14, v0, v13, v11}, Lcom/android/launcher2/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v11

    aput-object v11, v10, v1

    .line 3551
    sget-object v10, Lcom/android/launcher2/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v10, v10, v1

    if-nez v10, :cond_0

    .line 3552
    sget-object v10, Lcom/android/launcher2/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v11, "com.android.launcher.toolbar_icon"

    invoke-direct {p0, v14, v0, v13, v11}, Lcom/android/launcher2/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v11

    aput-object v11, v10, v1

    .line 3560
    .end local v1           #coi:I
    :cond_0
    :goto_0
    if-eqz v4, :cond_1

    invoke-virtual {v4, v9}, Landroid/view/View;->setVisibility(I)V

    .line 3561
    :cond_1
    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3562
    invoke-direct {p0, v4, v3}, Lcom/android/launcher2/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3563
    const/4 v9, 0x1

    .line 3573
    .end local v2           #needUpdate:Z
    :cond_2
    :goto_1
    return v9

    .line 3557
    .restart local v2       #needUpdate:Z
    :cond_3
    invoke-virtual {v3, v13}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 3566
    .end local v2           #needUpdate:Z
    :cond_4
    if-eqz v4, :cond_5

    invoke-virtual {v4, v11}, Landroid/view/View;->setVisibility(I)V

    .line 3567
    :cond_5
    if-eqz v7, :cond_6

    invoke-virtual {v7, v11}, Landroid/view/View;->setVisibility(I)V

    .line 3568
    :cond_6
    invoke-virtual {v3, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3569
    invoke-virtual {v6, v11}, Landroid/view/View;->setVisibility(I)V

    .line 3570
    if-eqz v8, :cond_2

    .line 3571
    invoke-virtual {v8, v11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method private updateRunning()V
    .locals 11

    .prologue
    const-wide/16 v1, 0x4e20

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1506
    iget-boolean v5, p0, Lcom/android/launcher2/Launcher;->mVisible:Z

    if-eqz v5, :cond_1

    iget-boolean v5, p0, Lcom/android/launcher2/Launcher;->mUserPresent:Z

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    move v0, v3

    .line 1507
    .local v0, autoAdvanceRunning:Z
    :goto_0
    iget-boolean v5, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceRunning:Z

    if-eq v0, v5, :cond_0

    .line 1508
    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceRunning:Z

    .line 1509
    if-eqz v0, :cond_3

    .line 1510
    iget-wide v3, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceTimeLeft:J

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    .line 1511
    .local v1, delay:J
    :goto_1
    invoke-direct {p0, v1, v2}, Lcom/android/launcher2/Launcher;->sendAdvanceMessage(J)V

    .line 1521
    .end local v1           #delay:J
    :cond_0
    :goto_2
    return-void

    .end local v0           #autoAdvanceRunning:Z
    :cond_1
    move v0, v4

    .line 1506
    goto :goto_0

    .line 1510
    .restart local v0       #autoAdvanceRunning:Z
    :cond_2
    iget-wide v1, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceTimeLeft:J

    goto :goto_1

    .line 1513
    :cond_3
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    .line 1514
    const-wide/16 v5, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iget-wide v9, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceSentTime:J

    sub-long/2addr v7, v9

    sub-long v7, v1, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/launcher2/Launcher;->mAutoAdvanceTimeLeft:J

    .line 1517
    :cond_4
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1518
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_2
.end method

.method private updateTextButtonWithDrawable(ILandroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "buttonId"
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 3511
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 3512
    .local v0, button:Landroid/widget/TextView;
    invoke-virtual {v0, p2, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3513
    return-void
.end method

.method private updateTextButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 8
    .parameter "buttonId"
    .parameter "activityName"
    .parameter "fallbackDrawableId"
    .parameter "toolbarResourceName"

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 3466
    invoke-direct {p0, p2, p4}, Lcom/android/launcher2/Launcher;->getExternalPackageToolbarIcon(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 3467
    .local v3, toolbarIcon:Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 3468
    .local v2, r:Landroid/content/res/Resources;
    const v6, 0x7f0b001e

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 3469
    .local v4, w:I
    const v6, 0x7f0b001f

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 3471
    .local v1, h:I
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 3473
    .local v0, button:Landroid/widget/TextView;
    if-nez v3, :cond_1

    .line 3474
    invoke-virtual {v2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 3475
    invoke-virtual {v3, v7, v7, v4, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 3476
    if-eqz v0, :cond_0

    .line 3477
    invoke-virtual {v0, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3485
    :cond_0
    :goto_0
    return-object v5

    .line 3481
    :cond_1
    invoke-virtual {v3, v7, v7, v4, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 3482
    if-eqz v0, :cond_2

    .line 3483
    invoke-virtual {v0, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3485
    :cond_2
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    goto :goto_0
.end method

.method private updateVoiceSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 4
    .parameter "d"

    .prologue
    const v3, 0x7f070029

    .line 3636
    const v2, 0x7f070034

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 3637
    .local v1, voiceButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 3638
    .local v0, voiceButton:Landroid/view/View;
    invoke-direct {p0, v3, p1}, Lcom/android/launcher2/Launcher;->updateButtonWithDrawable(ILandroid/graphics/drawable/Drawable$ConstantState;)V

    .line 3639
    invoke-direct {p0, v1, v0}, Lcom/android/launcher2/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3640
    return-void
.end method

.method private updateVoiceSearchIcon(Z)Z
    .locals 13
    .parameter "searchVisible"

    .prologue
    const v12, 0x7f020030

    const v11, 0x7f070029

    const/16 v10, 0x8

    const/4 v8, 0x0

    .line 3585
    const v9, 0x7f070034

    invoke-virtual {p0, v9}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 3586
    .local v6, voiceButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v11}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 3587
    .local v5, voiceButton:Landroid/view/View;
    const v9, 0x7f070028

    invoke-virtual {p0, v9}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 3590
    .local v7, voiceButtonProxy:Landroid/view/View;
    const-string v9, "search"

    invoke-virtual {p0, v9}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/SearchManager;

    .line 3592
    .local v4, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v4}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v2

    .line 3594
    .local v2, globalSearchActivity:Landroid/content/ComponentName;
    const/4 v0, 0x0

    .line 3595
    .local v0, activityName:Landroid/content/ComponentName;
    if-eqz v2, :cond_0

    .line 3597
    new-instance v3, Landroid/content/Intent;

    const-string v9, "android.speech.action.WEB_SEARCH"

    invoke-direct {v3, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3598
    .local v3, intent:Landroid/content/Intent;
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 3599
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    .line 3602
    .end local v3           #intent:Landroid/content/Intent;
    :cond_0
    if-nez v0, :cond_1

    .line 3605
    new-instance v3, Landroid/content/Intent;

    const-string v9, "android.speech.action.WEB_SEARCH"

    invoke-direct {v3, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3606
    .restart local v3       #intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    .line 3608
    .end local v3           #intent:Landroid/content/Intent;
    :cond_1
    if-eqz p1, :cond_6

    if-eqz v0, :cond_6

    .line 3609
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v1

    .line 3610
    .local v1, coi:I
    sget-object v9, Lcom/android/launcher2/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v10, "com.android.launcher.toolbar_voice_search_icon"

    invoke-direct {p0, v11, v0, v12, v10}, Lcom/android/launcher2/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v10

    aput-object v10, v9, v1

    .line 3613
    sget-object v9, Lcom/android/launcher2/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v9, v9, v1

    if-nez v9, :cond_2

    .line 3614
    sget-object v9, Lcom/android/launcher2/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v10, "com.android.launcher.toolbar_icon"

    invoke-direct {p0, v11, v0, v12, v10}, Lcom/android/launcher2/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v10

    aput-object v10, v9, v1

    .line 3618
    :cond_2
    if-eqz v6, :cond_3

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3619
    :cond_3
    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3620
    if-eqz v7, :cond_4

    .line 3621
    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3623
    :cond_4
    invoke-direct {p0, v6, v5}, Lcom/android/launcher2/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3624
    const/4 v8, 0x1

    .line 3631
    .end local v1           #coi:I
    :cond_5
    :goto_0
    return v8

    .line 3626
    :cond_6
    if-eqz v6, :cond_7

    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 3627
    :cond_7
    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 3628
    if-eqz v7, :cond_5

    .line 3629
    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private volunteerFreeMemory()V
    .locals 1

    .prologue
    .line 4742
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->onTrimMemory()V

    .line 4745
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-virtual {v0}, Lcom/android/launcher2/IconCache;->flush()V

    .line 4746
    return-void
.end method

.method private static writeConfiguration(Landroid/content/Context;Lcom/android/launcher2/Launcher$LocaleConfiguration;)V
    .locals 6
    .parameter "context"
    .parameter "configuration"

    .prologue
    .line 615
    const/4 v1, 0x0

    .line 617
    .local v1, out:Ljava/io/DataOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/DataOutputStream;

    const-string v3, "launcher.preferences"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 618
    .end local v1           #out:Ljava/io/DataOutputStream;
    .local v2, out:Ljava/io/DataOutputStream;
    :try_start_1
    iget-object v3, p1, Lcom/android/launcher2/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 619
    iget v3, p1, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mcc:I

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 620
    iget v3, p1, Lcom/android/launcher2/Launcher$LocaleConfiguration;->mnc:I

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 621
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    .line 628
    if-eqz v2, :cond_2

    .line 630
    :try_start_2
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v1, v2

    .line 636
    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 631
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catch_0
    move-exception v0

    .line 632
    .local v0, e:Ljava/io/IOException;
    const-string v3, "Launcher"

    const-string v4, "IOException when close file."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    .line 633
    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_0

    .line 622
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 623
    .local v0, e:Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_3
    const-string v3, "Launcher"

    const-string v4, "FileNotFoundException when write configuration."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 628
    if-eqz v1, :cond_0

    .line 630
    :try_start_4
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 631
    :catch_2
    move-exception v0

    .line 632
    .local v0, e:Ljava/io/IOException;
    const-string v3, "Launcher"

    const-string v4, "IOException when close file."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 624
    .end local v0           #e:Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 626
    .restart local v0       #e:Ljava/io/IOException;
    :goto_2
    :try_start_5
    const-string v3, "launcher.preferences"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 628
    if-eqz v1, :cond_0

    .line 630
    :try_start_6
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_0

    .line 631
    :catch_4
    move-exception v0

    .line 632
    const-string v3, "Launcher"

    const-string v4, "IOException when close file."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 628
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_3
    if-eqz v1, :cond_1

    .line 630
    :try_start_7
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 633
    :cond_1
    :goto_4
    throw v3

    .line 631
    :catch_5
    move-exception v0

    .line 632
    .restart local v0       #e:Ljava/io/IOException;
    const-string v4, "Launcher"

    const-string v5, "IOException when close file."

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 628
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_3

    .line 624
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catch_6
    move-exception v0

    move-object v1, v2

    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_2

    .line 622
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catch_7
    move-exception v0

    move-object v1, v2

    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_1

    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :cond_2
    move-object v1, v2

    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_0
.end method


# virtual methods
.method addAppWidgetFromDrop(Lcom/android/launcher2/PendingAddWidgetInfo;JI[I[I[I)V
    .locals 8
    .parameter "info"
    .parameter "container"
    .parameter "screen"
    .parameter "cell"
    .parameter "span"
    .parameter "loc"

    .prologue
    .line 2022
    const-string v5, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "addAppWidgetFromDrop: info = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", container = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", screen = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2026
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->resetAddInfo()V

    .line 2027
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput-wide p2, p1, Lcom/android/launcher2/ItemInfo;->container:J

    iput-wide p2, v5, Lcom/android/launcher2/ItemInfo;->container:J

    .line 2028
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput p4, p1, Lcom/android/launcher2/ItemInfo;->screen:I

    iput p4, v5, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 2029
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput-object p7, v5, Lcom/android/launcher2/ItemInfo;->dropPos:[I

    .line 2030
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, p1, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    iput v6, v5, Lcom/android/launcher2/ItemInfo;->minSpanX:I

    .line 2031
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, p1, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    iput v6, v5, Lcom/android/launcher2/ItemInfo;->minSpanY:I

    .line 2033
    if-eqz p5, :cond_0

    .line 2034
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const/4 v6, 0x0

    aget v6, p5, v6

    iput v6, v5, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 2035
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const/4 v6, 0x1

    aget v6, p5, v6

    iput v6, v5, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 2037
    :cond_0
    if-eqz p6, :cond_1

    .line 2038
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const/4 v6, 0x0

    aget v6, p6, v6

    iput v6, v5, Lcom/android/launcher2/ItemInfo;->spanX:I

    .line 2039
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const/4 v6, 0x1

    aget v6, p6, v6

    iput v6, v5, Lcom/android/launcher2/ItemInfo;->spanY:I

    .line 2042
    :cond_1
    iget-object v1, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    .line 2044
    .local v1, hostView:Landroid/appwidget/AppWidgetHostView;
    if-eqz v1, :cond_2

    .line 2045
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    move-result v0

    .line 2046
    .local v0, appWidgetId:I
    iget-object v5, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p0, v0, p1, v1, v5}, Lcom/android/launcher2/Launcher;->addAppWidgetImpl(ILcom/android/launcher2/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 2073
    :goto_0
    return-void

    .line 2050
    .end local v0           #appWidgetId:I
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getAppWidgetHost()Lcom/android/launcher2/LauncherAppWidgetHost;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/launcher2/LauncherAppWidgetHost;->allocateAppWidgetId()I

    move-result v0

    .line 2051
    .restart local v0       #appWidgetId:I
    iget-object v3, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    .line 2053
    .local v3, options:Landroid/os/Bundle;
    const/4 v4, 0x0

    .line 2054
    .local v4, success:Z
    if-eqz v3, :cond_3

    .line 2055
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    iget-object v6, p1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v5, v0, v6, v3}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;Landroid/os/Bundle;)Z

    move-result v4

    .line 2061
    :goto_1
    if-eqz v4, :cond_4

    .line 2062
    const/4 v5, 0x0

    iget-object v6, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p0, v0, p1, v5, v6}, Lcom/android/launcher2/Launcher;->addAppWidgetImpl(ILcom/android/launcher2/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    goto :goto_0

    .line 2058
    :cond_3
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    iget-object v6, p1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v5, v0, v6}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    move-result v4

    goto :goto_1

    .line 2064
    :cond_4
    iget-object v5, p1, Lcom/android/launcher2/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iput-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 2065
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.appwidget.action.APPWIDGET_BIND"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2066
    .local v2, intent:Landroid/content/Intent;
    const-string v5, "appWidgetId"

    invoke-virtual {v2, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2067
    const-string v5, "appWidgetProvider"

    iget-object v6, p1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2070
    const/16 v5, 0xb

    invoke-virtual {p0, v2, v5}, Lcom/android/launcher2/Launcher;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method addAppWidgetImpl(ILcom/android/launcher2/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 8
    .parameter "appWidgetId"
    .parameter "info"
    .parameter "boundWidget"
    .parameter "appWidgetInfo"

    .prologue
    .line 1959
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addAppWidgetImpl: appWidgetId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", info = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", boundWidget = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", appWidgetInfo = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1964
    iget-object v0, p4, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    if-eqz v0, :cond_0

    .line 1965
    iput-object p4, p0, Lcom/android/launcher2/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 1968
    new-instance v7, Landroid/content/Intent;

    const-string v0, "android.appwidget.action.APPWIDGET_CONFIGURE"

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1969
    .local v7, intent:Landroid/content/Intent;
    iget-object v0, p4, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    invoke-virtual {v7, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1970
    const-string v0, "appWidgetId"

    invoke-virtual {v7, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1971
    const/4 v0, 0x5

    invoke-virtual {p0, v7, v0}, Lcom/android/launcher2/Launcher;->startActivityForResultSafely(Landroid/content/Intent;I)V

    .line 1979
    .end local v7           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 1974
    :cond_0
    iget-wide v2, p2, Lcom/android/launcher2/ItemInfo;->container:J

    iget v4, p2, Lcom/android/launcher2/ItemInfo;->screen:I

    move-object v0, p0

    move v1, p1

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/android/launcher2/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 1977
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    goto :goto_0
.end method

.method addExternalItemToScreen(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;)V
    .locals 3
    .parameter "itemInfo"
    .parameter "layout"

    .prologue
    .line 3418
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addExternalItemToScreen itemInfo = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", layout = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3421
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, p1, p2}, Lcom/android/launcher2/Workspace;->addExternalItemToScreen(Lcom/android/launcher2/ItemInfo;Lcom/android/launcher2/CellLayout;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3422
    invoke-virtual {p0, p2}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->showOutOfSpaceMessage(Z)V

    .line 3424
    :cond_0
    return-void
.end method

.method addFolder(Lcom/android/launcher2/CellLayout;JIII)Lcom/android/launcher2/FolderIcon;
    .locals 12
    .parameter "layout"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 2104
    new-instance v1, Lcom/android/launcher2/FolderInfo;

    invoke-direct {v1}, Lcom/android/launcher2/FolderInfo;-><init>()V

    .line 2105
    .local v1, folderInfo:Lcom/android/launcher2/FolderInfo;
    const v0, 0x7f0d0010

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    .line 2108
    const/4 v7, 0x0

    move-object v0, p0

    move-wide v2, p2

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    invoke-static/range {v0 .. v7}, Lcom/android/launcher2/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/android/launcher2/ItemInfo;JIIIZ)V

    .line 2110
    sget-object v0, Lcom/android/launcher2/Launcher;->sFolders:Ljava/util/HashMap;

    iget-wide v4, v1, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2113
    const v0, 0x7f04000c

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-static {v0, p0, p1, v1, v2}, Lcom/android/launcher2/FolderIcon;->fromXml(ILcom/android/launcher2/Launcher;Landroid/view/ViewGroup;Lcom/android/launcher2/FolderInfo;Lcom/android/launcher2/IconCache;)Lcom/android/launcher2/FolderIcon;

    move-result-object v3

    .line 2115
    .local v3, newFolder:Lcom/android/launcher2/FolderIcon;
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v9, 0x1

    const/4 v10, 0x1

    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isWorkspaceLocked()Z

    move-result v11

    move-wide v4, p2

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    invoke-virtual/range {v2 .. v11}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 2117
    return-object v3
.end method

.method addWidgetToAutoAdvanceIfNeeded(Landroid/view/View;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 4
    .parameter "hostView"
    .parameter "appWidgetInfo"

    .prologue
    .line 1547
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addWidgetToAutoAdvanceIfNeeded hostView = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", appWidgetInfo = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1551
    if-eqz p2, :cond_0

    iget v1, p2, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 1560
    :cond_0
    :goto_0
    return-void

    .line 1554
    :cond_1
    iget v1, p2, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1555
    .local v0, v:Landroid/view/View;
    instance-of v1, v0, Landroid/widget/Advanceable;

    if-eqz v1, :cond_0

    .line 1556
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1557
    check-cast v0, Landroid/widget/Advanceable;

    .end local v0           #v:Landroid/view/View;
    invoke-interface {v0}, Landroid/widget/Advanceable;->fyiWillBeAdvancedByHostKThx()V

    .line 1558
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateRunning()V

    goto :goto_0
.end method

.method public bindAllApplications(Ljava/util/ArrayList;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4071
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bindAllApplications: apps = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4074
    new-instance v1, Lcom/android/launcher2/Launcher$25;

    invoke-direct {v1, p0, p1}, Lcom/android/launcher2/Launcher$25;-><init>(Lcom/android/launcher2/Launcher;Ljava/util/ArrayList;)V

    .line 4083
    .local v1, setAllAppsRunnable:Ljava/lang/Runnable;
    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mUnreadLoadCompleted:Z

    if-eqz v2, :cond_0

    .line 4084
    invoke-static {p1}, Lcom/android/launcher2/AppsCustomizePagedView;->updateUnreadNumInAppInfo(Ljava/util/ArrayList;)V

    .line 4088
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    const v3, 0x7f07000d

    invoke-virtual {v2, v3}, Lcom/android/launcher2/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 4090
    .local v0, progressBar:Landroid/view/View;
    if-eqz v0, :cond_1

    .line 4091
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4096
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v2, v1}, Lcom/android/launcher2/AppsCustomizeTabHost;->post(Ljava/lang/Runnable;)Z

    .line 4102
    :goto_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mBindingAppsFinished:Z

    .line 4103
    return-void

    .line 4100
    :cond_1
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public bindAppWidget(Lcom/android/launcher2/LauncherAppWidgetInfo;)V
    .locals 14
    .parameter "item"

    .prologue
    .line 3874
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->setLoadOnResume()Z

    .line 3876
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    .line 3878
    .local v12, start:J
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bindAppWidget: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3880
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    .line 3882
    .local v0, workspace:Lcom/android/launcher2/Workspace;
    iget v10, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->appWidgetId:I

    .line 3883
    .local v10, appWidgetId:I
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    invoke-virtual {v1, v10}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v11

    .line 3885
    .local v11, appWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;
    const-string v2, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bindAppWidget: id="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->appWidgetId:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " belongs to component "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez v11, :cond_0

    const-string v1, ""

    :goto_0
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3891
    if-nez v11, :cond_1

    .line 3912
    :goto_1
    return-void

    .line 3885
    :cond_0
    iget-object v1, v11, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    goto :goto_0

    .line 3895
    :cond_1
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    invoke-virtual {v1, p0, v10, v11}, Lcom/android/launcher2/LauncherAppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    move-result-object v1

    iput-object v1, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 3897
    iget-object v1, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {v1, p1}, Landroid/appwidget/AppWidgetHostView;->setTag(Ljava/lang/Object;)V

    .line 3898
    invoke-virtual {p1, p0}, Lcom/android/launcher2/LauncherAppWidgetInfo;->onBindAppWidget(Lcom/android/launcher2/Launcher;)V

    .line 3901
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v2, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v3

    invoke-virtual {v1, v2, v3, v10}, Lcom/android/launcher2/Workspace;->setAppWidgetIdAndScreen(Landroid/view/View;II)V

    .line 3903
    iget-object v1, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    iget-wide v2, p1, Lcom/android/launcher2/ItemInfo;->container:J

    iget v4, p1, Lcom/android/launcher2/ItemInfo;->screen:I

    iget v5, p1, Lcom/android/launcher2/ItemInfo;->cellX:I

    iget v6, p1, Lcom/android/launcher2/ItemInfo;->cellY:I

    iget v7, p1, Lcom/android/launcher2/ItemInfo;->spanX:I

    iget v8, p1, Lcom/android/launcher2/ItemInfo;->spanY:I

    const/4 v9, 0x0

    invoke-virtual/range {v0 .. v9}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 3905
    iget-object v1, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {p0, v1, v11}, Lcom/android/launcher2/Launcher;->addWidgetToAutoAdvanceIfNeeded(Landroid/view/View;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 3907
    invoke-virtual {v0}, Lcom/android/launcher2/Workspace;->requestLayout()V

    .line 3910
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bound widget id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->appWidgetId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v12

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public bindAppWidgetRemoved(Ljava/util/ArrayList;Z)V
    .locals 3
    .parameter
    .parameter "permanent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 4704
    .local p1, appWidget:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bindAppWidgetRemoved: appWidget = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", permanent = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4706
    if-eqz p2, :cond_0

    .line 4707
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/Workspace;->removeItems(Ljava/util/ArrayList;)V

    .line 4709
    :cond_0
    return-void
.end method

.method public bindAppsAdded(Ljava/util/ArrayList;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4112
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bindAppsUpdated: apps = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4114
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->setLoadOnResume()Z

    .line 4116
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 4117
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->addApps(Ljava/util/ArrayList;)V

    .line 4119
    :cond_0
    return-void
.end method

.method public bindAppsRemoved(Ljava/util/ArrayList;Z)V
    .locals 3
    .parameter
    .parameter "permanent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 4148
    .local p1, packageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bindAppsRemoved: packageNames = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", permanent = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4151
    if-eqz p2, :cond_0

    .line 4152
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/Workspace;->removeItems(Ljava/util/ArrayList;)V

    .line 4155
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_1

    .line 4156
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->removeApps(Ljava/util/ArrayList;)V

    .line 4160
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v0, p1, p0}, Lcom/android/launcher2/DragController;->onAppsRemoved(Ljava/util/ArrayList;Landroid/content/Context;)V

    .line 4161
    return-void
.end method

.method public bindAppsUpdated(Ljava/util/ArrayList;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4128
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bindAppsUpdated: apps = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4131
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->setLoadOnResume()Z

    .line 4132
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    if-eqz v0, :cond_0

    .line 4133
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/Workspace;->updateShortcuts(Ljava/util/ArrayList;)V

    .line 4136
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_1

    .line 4137
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/AppsCustomizePagedView;->updateApps(Ljava/util/ArrayList;)V

    .line 4139
    :cond_1
    return-void
.end method

.method public bindComponentUnreadChanged(Landroid/content/ComponentName;I)V
    .locals 2
    .parameter "component"
    .parameter "unreadNum"

    .prologue
    .line 4589
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/launcher2/Launcher$31;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher2/Launcher$31;-><init>(Lcom/android/launcher2/Launcher;Landroid/content/ComponentName;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4610
    return-void
.end method

.method public bindFolders(Ljava/util/HashMap;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/android/launcher2/FolderInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3860
    .local p1, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/android/launcher2/FolderInfo;>;"
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->setLoadOnResume()Z

    .line 3862
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bindFolders: this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3864
    sget-object v0, Lcom/android/launcher2/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 3865
    sget-object v0, Lcom/android/launcher2/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 3866
    return-void
.end method

.method public bindItems(Ljava/util/ArrayList;II)V
    .locals 19
    .parameter
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ItemInfo;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 3798
    .local p1, shortcuts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ItemInfo;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/Launcher;->setLoadOnResume()Z

    .line 3801
    new-instance v17, Ljava/util/HashSet;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashSet;-><init>()V

    .line 3802
    .local v17, newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v5, "apps.new.list"

    move-object/from16 v0, v17

    invoke-interface {v3, v5, v0}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v17

    .line 3804
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    .line 3805
    .local v1, workspace:Lcom/android/launcher2/Workspace;
    move/from16 v14, p2

    .local v14, i:I
    :goto_0
    move/from16 v0, p3

    if-ge v14, v0, :cond_3

    .line 3806
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/android/launcher2/ItemInfo;

    .line 3808
    .local v16, item:Lcom/android/launcher2/ItemInfo;
    const-string v3, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bindItems: start = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", end = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p3

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "item = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", this = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3813
    move-object/from16 v0, v16

    iget-wide v5, v0, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v7, -0x65

    cmp-long v3, v5, v7

    if-nez v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    if-nez v3, :cond_1

    .line 3805
    :cond_0
    :goto_1
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 3818
    :cond_1
    move-object/from16 v0, v16

    iget v3, v0, Lcom/android/launcher2/ItemInfo;->itemType:I

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    move-object/from16 v15, v16

    .line 3821
    check-cast v15, Lcom/android/launcher2/ShortcutInfo;

    .line 3822
    .local v15, info:Lcom/android/launcher2/ShortcutInfo;
    iget-object v3, v15, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v18

    .line 3823
    .local v18, uri:Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/launcher2/Launcher;->createShortcut(Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;

    move-result-object v2

    .line 3824
    .local v2, shortcut:Landroid/view/View;
    move-object/from16 v0, v16

    iget-wide v3, v0, Lcom/android/launcher2/ItemInfo;->container:J

    move-object/from16 v0, v16

    iget v5, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    move-object/from16 v0, v16

    iget v6, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    move-object/from16 v0, v16

    iget v7, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-virtual/range {v1 .. v10}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 3826
    const/4 v13, 0x0

    .line 3827
    .local v13, animateIconUp:Z
    monitor-enter v17

    .line 3828
    :try_start_0
    invoke-interface/range {v17 .. v18}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3829
    invoke-interface/range {v17 .. v18}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v13

    .line 3831
    :cond_2
    monitor-exit v17
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3832
    if-eqz v13, :cond_0

    .line 3834
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 3835
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setScaleX(F)V

    .line 3836
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setScaleY(F)V

    .line 3837
    move-object/from16 v0, v16

    iget v3, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimatePage:I

    .line 3838
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 3839
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 3831
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v17
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 3844
    .end local v2           #shortcut:Landroid/view/View;
    .end local v13           #animateIconUp:Z
    .end local v15           #info:Lcom/android/launcher2/ShortcutInfo;
    .end local v18           #uri:Ljava/lang/String;
    :pswitch_1
    const v6, 0x7f04000c

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    move-object/from16 v5, v16

    check-cast v5, Lcom/android/launcher2/FolderInfo;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/launcher2/Launcher;->mIconCache:Lcom/android/launcher2/IconCache;

    move-object/from16 v0, p0

    invoke-static {v6, v0, v3, v5, v7}, Lcom/android/launcher2/FolderIcon;->fromXml(ILcom/android/launcher2/Launcher;Landroid/view/ViewGroup;Lcom/android/launcher2/FolderInfo;Lcom/android/launcher2/IconCache;)Lcom/android/launcher2/FolderIcon;

    move-result-object v4

    .line 3847
    .local v4, newFolder:Lcom/android/launcher2/FolderIcon;
    move-object/from16 v0, v16

    iget-wide v5, v0, Lcom/android/launcher2/ItemInfo;->container:J

    move-object/from16 v0, v16

    iget v7, v0, Lcom/android/launcher2/ItemInfo;->screen:I

    move-object/from16 v0, v16

    iget v8, v0, Lcom/android/launcher2/ItemInfo;->cellX:I

    move-object/from16 v0, v16

    iget v9, v0, Lcom/android/launcher2/ItemInfo;->cellY:I

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object v3, v1

    invoke-virtual/range {v3 .. v12}, Lcom/android/launcher2/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    goto/16 :goto_1

    .line 3853
    .end local v4           #newFolder:Lcom/android/launcher2/FolderIcon;
    .end local v16           #item:Lcom/android/launcher2/ItemInfo;
    :cond_3
    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->requestLayout()V

    .line 3854
    return-void

    .line 3818
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bindPackagesUpdated()V
    .locals 2

    .prologue
    .line 4168
    const-string v0, "Launcher"

    const-string v1, "bindPackagesUpdated."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4171
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 4172
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizePagedView;->onPackagesUpdated()V

    .line 4174
    :cond_0
    return-void
.end method

.method public bindSearchablesChanged()V
    .locals 3

    .prologue
    .line 4057
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateGlobalSearchIcon()Z

    move-result v0

    .line 4058
    .local v0, searchVisible:Z
    invoke-direct {p0, v0}, Lcom/android/launcher2/Launcher;->updateVoiceSearchIcon(Z)Z

    move-result v1

    .line 4059
    .local v1, voiceVisible:Z
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v2, :cond_0

    .line 4060
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v2, v0, v1}, Lcom/android/launcher2/SearchDropTargetBar;->onSearchPackagesChanged(ZZ)V

    .line 4062
    :cond_0
    return-void
.end method

.method public bindUnreadInfoIfNeeded()V
    .locals 1

    .prologue
    .line 4620
    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mBindingWorkspaceFinished:Z

    if-eqz v0, :cond_0

    .line 4621
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->bindWorkspaceUnreadInfo()V

    .line 4624
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mBindingAppsFinished:Z

    if-eqz v0, :cond_1

    .line 4625
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->bindAppsUnreadInfo()V

    .line 4627
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mUnreadLoadCompleted:Z

    .line 4628
    return-void
.end method

.method public closeFolder()V
    .locals 2

    .prologue
    .line 2626
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v0

    .line 2627
    .local v0, folder:Lcom/android/launcher2/Folder;
    if-eqz v0, :cond_1

    .line 2628
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->isEditingName()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2629
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->dismissEditingName()V

    .line 2631
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->closeFolder(Lcom/android/launcher2/Folder;)V

    .line 2634
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->dismissFolderCling(Landroid/view/View;)V

    .line 2636
    :cond_1
    return-void
.end method

.method closeFolder(Lcom/android/launcher2/Folder;)V
    .locals 4
    .parameter "folder"

    .prologue
    .line 2639
    invoke-virtual {p1}, Lcom/android/launcher2/Folder;->getInfo()Lcom/android/launcher2/FolderInfo;

    move-result-object v2

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/android/launcher2/FolderInfo;->opened:Z

    .line 2641
    invoke-virtual {p1}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 2642
    .local v1, parent:Landroid/view/ViewGroup;
    if-eqz v1, :cond_0

    .line 2643
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v3, p1, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace;->getViewForTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/FolderIcon;

    .line 2644
    .local v0, fi:Lcom/android/launcher2/FolderIcon;
    invoke-direct {p0, v0}, Lcom/android/launcher2/Launcher;->shrinkAndFadeInFolderIcon(Lcom/android/launcher2/FolderIcon;)V

    .line 2646
    .end local v0           #fi:Lcom/android/launcher2/FolderIcon;
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher2/Folder;->animateClosed()V

    .line 2647
    return-void
.end method

.method closeSystemDialogs()V
    .locals 1

    .prologue
    .line 1613
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->closeAllPanels()V

    .line 1616
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    .line 1617
    return-void
.end method

.method completeAddApplication(Landroid/content/Intent;JIII)V
    .locals 15
    .parameter "data"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 1177
    const-string v3, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "completeAddApplication: Intent = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", container = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, p2

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", screen = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", cellX = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p5

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", cellY = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1182
    iget-object v14, p0, Lcom/android/launcher2/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 1183
    .local v14, cellXY:[I
    move-wide/from16 v0, p2

    move/from16 v2, p4

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->getCellLayout(JI)Lcom/android/launcher2/CellLayout;

    move-result-object v5

    .line 1186
    .local v5, layout:Lcom/android/launcher2/CellLayout;
    if-ltz p5, :cond_1

    if-ltz p6, :cond_1

    .line 1187
    const/4 v3, 0x0

    aput p5, v14, v3

    .line 1188
    const/4 v3, 0x1

    aput p6, v14, v3

    .line 1194
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v3, v6, v0, p0}, Lcom/android/launcher2/LauncherModel;->getShortcutInfo(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/Context;)Lcom/android/launcher2/ShortcutInfo;

    move-result-object v4

    .line 1196
    .local v4, info:Lcom/android/launcher2/ShortcutInfo;
    if-eqz v4, :cond_2

    .line 1197
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    const/high16 v6, 0x1020

    invoke-virtual {v4, v3, v6}, Lcom/android/launcher2/ShortcutInfo;->setActivity(Landroid/content/ComponentName;I)V

    .line 1199
    const-wide/16 v6, -0x1

    iput-wide v6, v4, Lcom/android/launcher2/ItemInfo;->container:J

    .line 1200
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const/4 v6, 0x0

    aget v9, v14, v6

    const/4 v6, 0x1

    aget v10, v14, v6

    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isWorkspaceLocked()Z

    move-result v11

    move-wide/from16 v6, p2

    move/from16 v8, p4

    move/from16 v12, p5

    move/from16 v13, p6

    invoke-virtual/range {v3 .. v13}, Lcom/android/launcher2/Workspace;->addApplicationShortcut(Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/CellLayout;JIIIZII)V

    .line 1205
    .end local v4           #info:Lcom/android/launcher2/ShortcutInfo;
    :goto_0
    return-void

    .line 1189
    :cond_1
    const/4 v3, 0x1

    const/4 v6, 0x1

    invoke-virtual {v5, v14, v3, v6}, Lcom/android/launcher2/CellLayout;->findCellForSpan([III)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1190
    invoke-virtual {p0, v5}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/android/launcher2/Launcher;->showOutOfSpaceMessage(Z)V

    goto :goto_0

    .line 1203
    .restart local v4       #info:Lcom/android/launcher2/ShortcutInfo;
    :cond_2
    const-string v3, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Couldn\'t find ActivityInfo for selected application: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method createShortcut(ILandroid/view/ViewGroup;Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;
    .locals 3
    .parameter "layoutResId"
    .parameter "parent"
    .parameter "info"

    .prologue
    .line 1162
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mInflater:Landroid/view/LayoutInflater;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/BubbleTextView;

    .line 1163
    .local v0, favorite:Lcom/android/launcher2/BubbleTextView;
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-virtual {v0, p3, v1}, Lcom/android/launcher2/BubbleTextView;->applyFromShortcutInfo(Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/IconCache;)V

    .line 1164
    invoke-virtual {v0, p0}, Lcom/android/launcher2/BubbleTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1165
    invoke-virtual {v0, p0}, Lcom/android/launcher2/BubbleTextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1166
    return-object v0
.end method

.method createShortcut(Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;
    .locals 3
    .parameter "info"

    .prologue
    .line 1148
    const v1, 0x7f040002

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v1, v0, p1}, Lcom/android/launcher2/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/android/launcher2/ShortcutInfo;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method disableWallpaperIfInAllApps()V
    .locals 1

    .prologue
    .line 2761
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2762
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->isTransitioning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2765
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->updateWallpaperVisibility(Z)V

    .line 2772
    :cond_0
    return-void
.end method

.method public dismissAllAppsCling(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 4375
    const v1, 0x7f07000c

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Cling;

    .line 4376
    .local v0, cling:Lcom/android/launcher2/Cling;
    const-string v1, "cling.allapps.dismissed"

    const/16 v2, 0xfa

    invoke-direct {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->dismissCling(Lcom/android/launcher2/Cling;Ljava/lang/String;I)V

    .line 4377
    return-void
.end method

.method public dismissFolderCling(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 4380
    const v1, 0x7f070027

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Cling;

    .line 4381
    .local v0, cling:Lcom/android/launcher2/Cling;
    const-string v1, "cling.folder.dismissed"

    const/16 v2, 0xfa

    invoke-direct {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->dismissCling(Lcom/android/launcher2/Cling;Ljava/lang/String;I)V

    .line 4382
    return-void
.end method

.method public dismissWorkspaceCling(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 4370
    const v1, 0x7f070026

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Cling;

    .line 4371
    .local v0, cling:Lcom/android/launcher2/Cling;
    const-string v1, "cling.workspace.dismissed"

    const/16 v2, 0xfa

    invoke-direct {p0, v0, v1, v2}, Lcom/android/launcher2/Launcher;->dismissCling(Lcom/android/launcher2/Cling;Ljava/lang/String;I)V

    .line 4372
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    .line 2156
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchKeyEvent: keyEvent = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2159
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_1

    .line 2160
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 2177
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    :goto_1
    :pswitch_0
    :sswitch_0
    return v0

    .line 2164
    :sswitch_1
    const-string v1, "launcher_dump_state"

    invoke-static {v1}, Lcom/android/launcher2/Launcher;->isPropertyEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2165
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->dumpState()V

    goto :goto_1

    .line 2170
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 2171
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 2160
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x19 -> :sswitch_1
    .end sparse-switch

    .line 2171
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 4
    .parameter "event"

    .prologue
    .line 3679
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    .line 3680
    .local v0, result:Z
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v1

    .line 3681
    .local v1, text:Ljava/util/List;,"Ljava/util/List<Ljava/lang/CharSequence;>;"
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 3683
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v3, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    if-ne v2, v3, :cond_0

    .line 3684
    const v2, 0x7f0d002e

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3688
    :goto_0
    return v0

    .line 3686
    :cond_0
    const v2, 0x7f0d002f

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 3
    .parameter "prefix"
    .parameter "fd"
    .parameter "writer"
    .parameter "args"

    .prologue
    .line 4405
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 4406
    const-string v1, " "

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4407
    const-string v1, "Debug logs: "

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4408
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget-object v1, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 4409
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v1, Lcom/android/launcher2/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4408
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 4411
    :cond_0
    return-void
.end method

.method public dumpState()V
    .locals 3

    .prologue
    .line 4388
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BEGIN launcher2 dump state for launcher "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4389
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mSavedState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4390
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mWorkspaceLoading="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4391
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mRestoring="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4392
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mWaitingForResult="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4393
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mSavedInstanceState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mSavedInstanceState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4394
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sFolders.size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/android/launcher2/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4395
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v0}, Lcom/android/launcher2/LauncherModel;->dumpState()V

    .line 4397
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 4398
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizePagedView;->dumpState()V

    .line 4400
    :cond_0
    const-string v0, "Launcher"

    const-string v1, "END launcher2 dump state"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4401
    return-void
.end method

.method enterSpringLoadedDragMode()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 3282
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enterSpringLoadedDragMode mState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mOnResumeState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3285
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3286
    sget-object v0, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/android/launcher2/Launcher$State;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v3, v3, v1}, Lcom/android/launcher2/Launcher;->hideAppsCustomizeHelper(Lcom/android/launcher2/Launcher$State;ZZLjava/lang/Runnable;)V

    .line 3287
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->hideDockDivider()V

    .line 3288
    sget-object v0, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/android/launcher2/Launcher$State;

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    .line 3290
    :cond_0
    return-void
.end method

.method exitSpringLoadedDragMode()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 3323
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "exitSpringLoadedDragMode mState = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3326
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v3, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/android/launcher2/Launcher$State;

    if-ne v2, v3, :cond_0

    .line 3327
    const/4 v0, 0x1

    .line 3328
    .local v0, animated:Z
    const/4 v1, 0x1

    .line 3329
    .local v1, springLoaded:Z
    invoke-direct {p0, v5, v5}, Lcom/android/launcher2/Launcher;->showAppsCustomizeHelper(ZZ)V

    .line 3330
    sget-object v2, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    iput-object v2, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    .line 3333
    .end local v0           #animated:Z
    .end local v1           #springLoaded:Z
    :cond_0
    return-void
.end method

.method exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V
    .locals 5
    .parameter "successfulDrop"
    .parameter "extendedDelay"
    .parameter "onCompleteRunnable"

    .prologue
    .line 3295
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exitSpringLoadedDragModeDelayed successfulDrop = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", extendedDelay = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3299
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v1, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/android/launcher2/Launcher$State;

    if-eq v0, v1, :cond_0

    .line 3319
    :goto_0
    return-void

    .line 3303
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/launcher2/Launcher$20;

    invoke-direct {v2, p0, p1, p3}, Lcom/android/launcher2/Launcher$20;-><init>(Lcom/android/launcher2/Launcher;ZLjava/lang/Runnable;)V

    if-eqz p2, :cond_1

    const/16 v0, 0x258

    :goto_1
    int-to-long v3, v0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    const/16 v0, 0x12c

    goto :goto_1
.end method

.method public finishBindingItems()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 3924
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->setLoadOnResume()Z

    .line 3926
    const-string v3, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "finishBindingItems: mSavedState = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/launcher2/Launcher;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", mSavedInstanceState = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/launcher2/Launcher;->mSavedInstanceState:Landroid/os/Bundle;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", this = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3930
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mSavedState:Landroid/os/Bundle;

    if-eqz v3, :cond_1

    .line 3931
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->hasFocus()Z

    move-result v3

    if-nez v3, :cond_0

    .line 3932
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v6}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v6

    invoke-virtual {v3, v6}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 3934
    :cond_0
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mSavedState:Landroid/os/Bundle;

    .line 3937
    :cond_1
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->restoreInstanceStateForRemainingPages()V

    .line 3941
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget-object v3, Lcom/android/launcher2/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 3942
    sget-object v3, Lcom/android/launcher2/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/Launcher$PendingAddArguments;

    invoke-direct {p0, v3}, Lcom/android/launcher2/Launcher;->completeAdd(Lcom/android/launcher2/Launcher$PendingAddArguments;)Z

    .line 3941
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3944
    :cond_2
    sget-object v3, Lcom/android/launcher2/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 3948
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateAppMarketIcon()V

    .line 3951
    iget-boolean v3, p0, Lcom/android/launcher2/Launcher;->mVisible:Z

    if-nez v3, :cond_3

    iget-boolean v3, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    if-eqz v3, :cond_4

    .line 3952
    :cond_3
    new-instance v1, Lcom/android/launcher2/Launcher$21;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Launcher$21;-><init>(Lcom/android/launcher2/Launcher;)V

    .line 3959
    .local v1, newAppsRunnable:Ljava/lang/Runnable;
    iget v3, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimatePage:I

    const/4 v6, -0x1

    if-le v3, v6, :cond_6

    iget v3, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimatePage:I

    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v6}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v6

    if-eq v3, v6, :cond_6

    move v2, v4

    .line 3961
    .local v2, willSnapPage:Z
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->canRunNewAppsAnimation()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 3964
    if-eqz v2, :cond_7

    .line 3965
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget v6, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimatePage:I

    invoke-virtual {v3, v6, v1}, Lcom/android/launcher2/Workspace;->snapToPage(ILjava/lang/Runnable;)V

    .line 3976
    .end local v1           #newAppsRunnable:Ljava/lang/Runnable;
    .end local v2           #willSnapPage:Z
    :cond_4
    :goto_2
    iput-boolean v5, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    .line 3979
    iget-boolean v3, p0, Lcom/android/launcher2/Launcher;->mUnreadLoadCompleted:Z

    if-eqz v3, :cond_5

    .line 3980
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->bindWorkspaceUnreadInfo()V

    .line 3982
    :cond_5
    iput-boolean v4, p0, Lcom/android/launcher2/Launcher;->mBindingWorkspaceFinished:Z

    .line 3983
    return-void

    .restart local v1       #newAppsRunnable:Ljava/lang/Runnable;
    :cond_6
    move v2, v5

    .line 3959
    goto :goto_1

    .line 3967
    .restart local v2       #willSnapPage:Z
    :cond_7
    invoke-direct {p0, v5}, Lcom/android/launcher2/Launcher;->runNewAppsAnimation(Z)V

    goto :goto_2

    .line 3972
    :cond_8
    invoke-direct {p0, v2}, Lcom/android/launcher2/Launcher;->runNewAppsAnimation(Z)V

    goto :goto_2
.end method

.method public getAppWidgetHost()Lcom/android/launcher2/LauncherAppWidgetHost;
    .locals 1

    .prologue
    .line 1605
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    return-object v0
.end method

.method getCellLayout(JI)Lcom/android/launcher2/CellLayout;
    .locals 2
    .parameter "container"
    .parameter "screen"

    .prologue
    .line 2723
    const-wide/16 v0, -0x65

    cmp-long v0, p1, v0

    if-nez v0, :cond_1

    .line 2724
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    if-eqz v0, :cond_0

    .line 2725
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v0}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v0

    .line 2730
    :goto_0
    return-object v0

    .line 2727
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 2730
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0, p3}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    goto :goto_0
.end method

.method getCurrentBounds()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 4463
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mCurrentBounds:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getCurrentWorkspaceScreen()I
    .locals 1

    .prologue
    .line 3746
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    if-eqz v0, :cond_0

    .line 3747
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v0

    .line 3749
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public getDragController()Lcom/android/launcher2/DragController;
    .locals 1

    .prologue
    .line 1793
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    return-object v0
.end method

.method public getDragLayer()Lcom/android/launcher2/DragLayer;
    .locals 1

    .prologue
    .line 639
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    return-object v0
.end method

.method getHotseat()Lcom/android/launcher2/Hotseat;
    .locals 1

    .prologue
    .line 2712
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    return-object v0
.end method

.method public getModel()Lcom/android/launcher2/LauncherModel;
    .locals 1

    .prologue
    .line 1609
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    return-object v0
.end method

.method getSearchBar()Lcom/android/launcher2/SearchDropTargetBar;
    .locals 1

    .prologue
    .line 2716
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    return-object v0
.end method

.method getWorkspace()Lcom/android/launcher2/Workspace;
    .locals 1

    .prologue
    .line 2735
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    return-object v0
.end method

.method hideDockDivider()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 3336
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mQsbDivider:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 3337
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mQsbDivider:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 3338
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 3340
    :cond_0
    return-void
.end method

.method hideHotseat(Z)V
    .locals 4
    .parameter "animated"

    .prologue
    const/4 v2, 0x0

    .line 3397
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3398
    if-eqz p1, :cond_2

    .line 3399
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v1}, Lcom/android/launcher2/Hotseat;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    .line 3400
    const/4 v0, 0x0

    .line 3401
    .local v0, duration:I
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v1, :cond_0

    .line 3402
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/android/launcher2/SearchDropTargetBar;->getTransitionOutDuration()I

    move-result v0

    .line 3404
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v1}, Lcom/android/launcher2/Hotseat;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 3410
    .end local v0           #duration:I
    :cond_1
    :goto_0
    return-void

    .line 3407
    :cond_2
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v1, v2}, Lcom/android/launcher2/Hotseat;->setAlpha(F)V

    goto :goto_0
.end method

.method public isAllAppsButtonRank(I)Z
    .locals 1
    .parameter "rank"

    .prologue
    .line 2746
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/Hotseat;->isAllAppsButtonRank(I)Z

    move-result v0

    return v0
.end method

.method public isAllAppsVisible()Z
    .locals 2

    .prologue
    .line 2741
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v1, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    sget-object v1, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isDraggingEnabled()Z
    .locals 1

    .prologue
    .line 645
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v0}, Lcom/android/launcher2/LauncherModel;->isLoadingWorkspace()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFolderClingVisible()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 4362
    const v2, 0x7f070027

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Cling;

    .line 4363
    .local v0, cling:Lcom/android/launcher2/Cling;
    if-eqz v0, :cond_0

    .line 4364
    invoke-virtual {v0}, Lcom/android/launcher2/Cling;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    .line 4366
    :cond_0
    return v1
.end method

.method isHotseatLayout(Landroid/view/View;)Z
    .locals 1
    .parameter "layout"

    .prologue
    .line 2707
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/android/launcher2/CellLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v0}, Lcom/android/launcher2/Hotseat;->getLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v0

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRotationEnabled()Z
    .locals 3

    .prologue
    .line 4209
    sget-boolean v1, Lcom/android/launcher2/Launcher;->sForceEnableRotation:Z

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090002

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 4211
    .local v0, enableRotation:Z
    :goto_0
    return v0

    .line 4209
    .end local v0           #enableRotation:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWorkspaceLocked()Z
    .locals 1

    .prologue
    .line 1944
    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method lockAllApps()V
    .locals 0

    .prologue
    .line 3368
    return-void
.end method

.method public lockScreenOrientation()V
    .locals 1

    .prologue
    .line 4214
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isRotationEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4215
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-direct {p0, v0}, Lcom/android/launcher2/Launcher;->mapConfigurationOriActivityInfoOri(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->setRequestedOrientation(I)V

    .line 4218
    :cond_0
    return-void
.end method

.method public notifyOrientationChanged()V
    .locals 3

    .prologue
    .line 4717
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "notifyOrientationChanged: mOrientationChanged = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mOrientationChanged:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mPaused = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mPaused:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 4720
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mOrientationChanged:Z

    .line 4721
    return-void
.end method

.method notifyPagesWereRecreated()V
    .locals 1

    .prologue
    .line 4727
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mPagesWereRecreated:Z

    .line 4728
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 11
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v5, 0x1

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v6, -0x1

    .line 698
    const/16 v7, 0xb

    if-ne p1, v7, :cond_3

    .line 699
    if-eqz p3, :cond_1

    const-string v5, "appWidgetId"

    invoke-virtual {p3, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 701
    .local v0, appWidgetId:I
    :goto_0
    if-nez p2, :cond_2

    .line 702
    invoke-direct {p0, v4, v0}, Lcom/android/launcher2/Launcher;->completeTwoStageWidgetDrop(II)V

    .line 756
    .end local v0           #appWidgetId:I
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v6

    .line 699
    goto :goto_0

    .line 703
    .restart local v0       #appWidgetId:I
    :cond_2
    if-ne p2, v6, :cond_0

    .line 704
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p0, v0, v4, v10, v5}, Lcom/android/launcher2/Launcher;->addAppWidgetImpl(ILcom/android/launcher2/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    goto :goto_1

    .line 708
    .end local v0           #appWidgetId:I
    :cond_3
    const/4 v2, 0x0

    .line 709
    .local v2, delayExitSpringLoadedMode:Z
    const/16 v7, 0x9

    if-eq p1, v7, :cond_4

    const/4 v7, 0x5

    if-ne p1, v7, :cond_5

    :cond_4
    move v3, v5

    .line 711
    .local v3, isWidgetDrop:Z
    :goto_2
    iput-boolean v4, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    .line 714
    const-string v7, "Launcher"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onActivityResult: requestCode = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", resultCode = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", data = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", mPendingAddInfo = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    if-eqz v3, :cond_8

    .line 721
    if-eqz p3, :cond_6

    const-string v5, "appWidgetId"

    invoke-virtual {p3, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 723
    .restart local v0       #appWidgetId:I
    :goto_3
    if-gez v0, :cond_7

    .line 724
    const-string v5, "Launcher"

    const-string v6, "Error: appWidgetId (EXTRA_APPWIDGET_ID) was not returned from the \\widget configuration activity."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 726
    invoke-direct {p0, v4, v0}, Lcom/android/launcher2/Launcher;->completeTwoStageWidgetDrop(II)V

    goto :goto_1

    .end local v0           #appWidgetId:I
    .end local v3           #isWidgetDrop:Z
    :cond_5
    move v3, v4

    .line 709
    goto :goto_2

    .restart local v3       #isWidgetDrop:Z
    :cond_6
    move v0, v6

    .line 721
    goto :goto_3

    .line 728
    .restart local v0       #appWidgetId:I
    :cond_7
    invoke-direct {p0, p2, v0}, Lcom/android/launcher2/Launcher;->completeTwoStageWidgetDrop(II)V

    goto :goto_1

    .line 738
    .end local v0           #appWidgetId:I
    :cond_8
    if-ne p2, v6, :cond_9

    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-wide v6, v6, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-eqz v6, :cond_9

    .line 739
    new-instance v1, Lcom/android/launcher2/Launcher$PendingAddArguments;

    invoke-direct {v1, v10}, Lcom/android/launcher2/Launcher$PendingAddArguments;-><init>(Lcom/android/launcher2/Launcher$1;)V

    .line 740
    .local v1, args:Lcom/android/launcher2/Launcher$PendingAddArguments;
    iput p1, v1, Lcom/android/launcher2/Launcher$PendingAddArguments;->requestCode:I

    .line 741
    iput-object p3, v1, Lcom/android/launcher2/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    .line 742
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-wide v6, v6, Lcom/android/launcher2/ItemInfo;->container:J

    iput-wide v6, v1, Lcom/android/launcher2/Launcher$PendingAddArguments;->container:J

    .line 743
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->screen:I

    iput v6, v1, Lcom/android/launcher2/Launcher$PendingAddArguments;->screen:I

    .line 744
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->cellX:I

    iput v6, v1, Lcom/android/launcher2/Launcher$PendingAddArguments;->cellX:I

    .line 745
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v6, v6, Lcom/android/launcher2/ItemInfo;->cellY:I

    iput v6, v1, Lcom/android/launcher2/Launcher$PendingAddArguments;->cellY:I

    .line 746
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isWorkspaceLocked()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 747
    sget-object v6, Lcom/android/launcher2/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 752
    .end local v1           #args:Lcom/android/launcher2/Launcher$PendingAddArguments;
    :cond_9
    :goto_4
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v6}, Lcom/android/launcher2/DragLayer;->clearAnimatedView()V

    .line 754
    if-eqz p2, :cond_b

    :goto_5
    invoke-virtual {p0, v5, v2, v10}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    goto/16 :goto_1

    .line 749
    .restart local v1       #args:Lcom/android/launcher2/Launcher$PendingAddArguments;
    :cond_a
    invoke-direct {p0, v1}, Lcom/android/launcher2/Launcher;->completeAdd(Lcom/android/launcher2/Launcher$PendingAddArguments;)Z

    move-result v2

    goto :goto_4

    .end local v1           #args:Lcom/android/launcher2/Launcher$PendingAddArguments;
    :cond_b
    move v5, v4

    .line 754
    goto :goto_5
.end method

.method public onAttachedToWindow()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1432
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 1434
    const-string v1, "Launcher"

    const-string v2, "onAttachedToWindow."

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1438
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1439
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1440
    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1441
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/launcher2/Launcher;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1443
    iput-boolean v3, p0, Lcom/android/launcher2/Launcher;->mAttached:Z

    .line 1444
    iput-boolean v3, p0, Lcom/android/launcher2/Launcher;->mVisible:Z

    .line 1445
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    .line 2183
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Back key pressed, mState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mOnResumeState = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2186
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2187
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->showWorkspace(Z)V

    .line 2202
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->cancelLongPressWidgetToAddMessage()V

    .line 2203
    return-void

    .line 2188
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2189
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getOpenFolder()Lcom/android/launcher2/Folder;

    move-result-object v0

    .line 2190
    .local v0, openFolder:Lcom/android/launcher2/Folder;
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->isEditingName()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2191
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->dismissEditingName()V

    goto :goto_0

    .line 2193
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->closeFolder()V

    goto :goto_0

    .line 2196
    .end local v0           #openFolder:Lcom/android/launcher2/Folder;
    :cond_2
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->exitWidgetResizeMode()V

    .line 2199
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->showOutlinesTemporarily()V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 14
    .parameter "v"

    .prologue
    const-wide/16 v12, 0x4

    const/4 v8, 0x0

    const/4 v11, 0x1

    .line 2228
    const-string v5, "Launcher.onClick"

    invoke-static {v12, v13, v5}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 2231
    const-string v5, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Click on view "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2234
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v5

    if-nez v5, :cond_0

    .line 2235
    const-string v5, "Launcher"

    const-string v6, "Click on a view with no window token, directly return."

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2274
    .end local p1
    :goto_0
    return-void

    .line 2239
    .restart local p1
    :cond_0
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v5}, Lcom/android/launcher2/Workspace;->isFinishedSwitchingState()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2240
    const-string v5, "Launcher"

    const-string v6, "The workspace is in switching state when clicking on view, directly return."

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2244
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    .line 2245
    .local v4, tag:Ljava/lang/Object;
    instance-of v5, v4, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v5, :cond_3

    move-object v5, v4

    .line 2247
    check-cast v5, Lcom/android/launcher2/ShortcutInfo;

    iget-object v1, v5, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 2248
    .local v1, intent:Landroid/content/Intent;
    const/4 v5, 0x2

    new-array v2, v5, [I

    .line 2249
    .local v2, pos:[I
    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 2250
    new-instance v5, Landroid/graphics/Rect;

    aget v6, v2, v8

    aget v7, v2, v11

    aget v8, v2, v8

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v9

    add-int/2addr v8, v9

    aget v9, v2, v11

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v9, v10

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setSourceBounds(Landroid/graphics/Rect;)V

    .line 2253
    invoke-virtual {p0, p1, v1, v4}, Lcom/android/launcher2/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    move-result v3

    .line 2255
    .local v3, success:Z
    if-eqz v3, :cond_2

    instance-of v5, p1, Lcom/android/launcher2/BubbleTextView;

    if-eqz v5, :cond_2

    .line 2256
    check-cast p1, Lcom/android/launcher2/BubbleTextView;

    .end local p1
    iput-object p1, p0, Lcom/android/launcher2/Launcher;->mWaitingForResume:Lcom/android/launcher2/BubbleTextView;

    .line 2257
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mWaitingForResume:Lcom/android/launcher2/BubbleTextView;

    invoke-virtual {v5, v11}, Lcom/android/launcher2/BubbleTextView;->setStayPressed(Z)V

    .line 2273
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #pos:[I
    .end local v3           #success:Z
    :cond_2
    :goto_1
    invoke-static {v12, v13}, Landroid/os/Trace;->traceEnd(J)V

    goto :goto_0

    .line 2259
    .restart local p1
    :cond_3
    instance-of v5, v4, Lcom/android/launcher2/FolderInfo;

    if-eqz v5, :cond_4

    .line 2260
    instance-of v5, p1, Lcom/android/launcher2/FolderIcon;

    if-eqz v5, :cond_2

    move-object v0, p1

    .line 2261
    check-cast v0, Lcom/android/launcher2/FolderIcon;

    .line 2262
    .local v0, fi:Lcom/android/launcher2/FolderIcon;
    invoke-direct {p0, v0}, Lcom/android/launcher2/Launcher;->handleFolderClick(Lcom/android/launcher2/FolderIcon;)V

    goto :goto_1

    .line 2264
    .end local v0           #fi:Lcom/android/launcher2/FolderIcon;
    :cond_4
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mAllAppsButton:Landroid/view/View;

    if-ne p1, v5, :cond_2

    .line 2265
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 2266
    invoke-virtual {p0, v11}, Lcom/android/launcher2/Launcher;->showWorkspace(Z)V

    goto :goto_1

    .line 2268
    :cond_5
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->onClickAllAppsButton(Landroid/view/View;)V

    goto :goto_1
.end method

.method public onClickAllAppsButton(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 2335
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->showAllApps(Z)V

    .line 2336
    return-void
.end method

.method public onClickAppMarketButton(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 2345
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClickAppMarketButton v = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mAppMarketIntent = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2348
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 2349
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    const-string v1, "app market"

    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher2/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 2353
    :goto_0
    return-void

    .line 2351
    :cond_0
    const-string v0, "Launcher"

    const-string v1, "Invalid app market intent."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onClickSearchButton(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 2290
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClickSearchButton v = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2293
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 2295
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->onSearchRequested()Z

    .line 2296
    return-void
.end method

.method public onClickVoiceButton(Landroid/view/View;)V
    .locals 9
    .parameter "v"

    .prologue
    const/4 v8, 0x0

    const/high16 v7, 0x1000

    .line 2305
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onClickVoiceButton v = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2308
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 2311
    :try_start_0
    const-string v4, "search"

    invoke-virtual {p0, v4}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/SearchManager;

    .line 2313
    .local v3, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v3}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v0

    .line 2314
    .local v0, activityName:Landroid/content/ComponentName;
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.speech.action.WEB_SEARCH"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2315
    .local v2, intent:Landroid/content/Intent;
    const/high16 v4, 0x1000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2316
    if-eqz v0, :cond_0

    .line 2317
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2319
    :cond_0
    const/4 v4, 0x0

    const-string v5, "onClickVoiceButton"

    invoke-virtual {p0, v4, v2, v5}, Lcom/android/launcher2/Launcher;->startActivity(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 2320
    const/high16 v4, 0x7f05

    const v5, 0x7f050001

    invoke-virtual {p0, v4, v5}, Lcom/android/launcher2/Launcher;->overridePendingTransition(II)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2326
    .end local v0           #activityName:Landroid/content/ComponentName;
    .end local v3           #searchManager:Landroid/app/SearchManager;
    :goto_0
    return-void

    .line 2321
    .end local v2           #intent:Landroid/content/Intent;
    :catch_0
    move-exception v1

    .line 2322
    .local v1, e:Landroid/content/ActivityNotFoundException;
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.speech.action.WEB_SEARCH"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2323
    .restart local v2       #intent:Landroid/content/Intent;
    invoke-virtual {v2, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2324
    const-string v4, "onClickVoiceButton"

    invoke-virtual {p0, v8, v2, v4}, Lcom/android/launcher2/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "savedInstanceState"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 402
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 403
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/LauncherApplication;

    .line 404
    .local v0, app:Lcom/android/launcher2/LauncherApplication;
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->getSharedPreferencesKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v7}, Lcom/android/launcher2/Launcher;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 406
    invoke-virtual {v0, p0}, Lcom/android/launcher2/LauncherApplication;->setLauncher(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/LauncherModel;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    .line 409
    invoke-virtual {v0}, Lcom/android/launcher2/LauncherApplication;->getUnreadLoader()Lcom/android/launcher2/MTKUnreadLoader;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    .line 410
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mUnreadLoader:Lcom/android/launcher2/MTKUnreadLoader;

    invoke-virtual {v3}, Lcom/android/launcher2/MTKUnreadLoader;->loadAndInitUnreadShortcuts()V

    .line 412
    invoke-virtual {v0}, Lcom/android/launcher2/LauncherApplication;->getIconCache()Lcom/android/launcher2/IconCache;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mIconCache:Lcom/android/launcher2/IconCache;

    .line 413
    new-instance v3, Lcom/android/launcher2/DragController;

    invoke-direct {v3, p0}, Lcom/android/launcher2/DragController;-><init>(Lcom/android/launcher2/Launcher;)V

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    .line 414
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mInflater:Landroid/view/LayoutInflater;

    .line 417
    const-string v3, "Launcher"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(Launcher)onCreate: savedInstanceState = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", mModel = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", mIconCache = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mIconCache:Lcom/android/launcher2/IconCache;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", this = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", sLocaleChanged = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/android/launcher2/Launcher;->sLocaleChanged:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    .line 422
    new-instance v3, Lcom/android/launcher2/LauncherAppWidgetHost;

    const/16 v4, 0x400

    invoke-direct {v3, p0, v4}, Lcom/android/launcher2/LauncherAppWidgetHost;-><init>(Lcom/android/launcher2/Launcher;I)V

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    .line 423
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    invoke-virtual {v3}, Lcom/android/launcher2/LauncherAppWidgetHost;->startListening()V

    .line 428
    iput-boolean v7, p0, Lcom/android/launcher2/Launcher;->mPaused:Z

    .line 435
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->checkForLocaleChange()V

    .line 436
    const v3, 0x7f04000e

    invoke-virtual {p0, v3}, Lcom/android/launcher2/Launcher;->setContentView(I)V

    .line 437
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->setupViews()V

    .line 438
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->showFirstRunWorkspaceCling()V

    .line 440
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->registerContentObservers()V

    .line 442
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->lockAllApps()V

    .line 444
    iput-object p1, p0, Lcom/android/launcher2/Launcher;->mSavedState:Landroid/os/Bundle;

    .line 445
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mSavedState:Landroid/os/Bundle;

    invoke-direct {p0, v3}, Lcom/android/launcher2/Launcher;->restoreState(Landroid/os/Bundle;)V

    .line 448
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v3, :cond_0

    .line 449
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v3}, Lcom/android/launcher2/AppsCustomizePagedView;->onPackagesUpdated()V

    .line 456
    :cond_0
    iget-boolean v3, p0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    if-nez v3, :cond_2

    .line 458
    sget-boolean v3, Lcom/android/launcher2/Launcher;->sLocaleChanged:Z

    if-eqz v3, :cond_1

    .line 459
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v3, v6, v6}, Lcom/android/launcher2/LauncherModel;->resetLoadedState(ZZ)V

    .line 460
    sput-boolean v7, Lcom/android/launcher2/Launcher;->sLocaleChanged:Z

    .line 462
    :cond_1
    iput-boolean v6, p0, Lcom/android/launcher2/Launcher;->mIsLoadingWorkspace:Z

    .line 463
    sget-boolean v3, Lcom/android/launcher2/Launcher;->sPausedFromUserAction:Z

    if-eqz v3, :cond_4

    .line 466
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    const/4 v4, -0x1

    invoke-virtual {v3, v6, v4}, Lcom/android/launcher2/LauncherModel;->startLoader(ZI)V

    .line 474
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v3}, Lcom/android/launcher2/LauncherModel;->isAllAppsLoaded()Z

    move-result v3

    if-nez v3, :cond_3

    .line 475
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v3}, Lcom/android/launcher2/AppsCustomizePagedView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 476
    .local v1, appsCustomizeContentParent:Landroid/view/ViewGroup;
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mInflater:Landroid/view/LayoutInflater;

    const v4, 0x7f040005

    invoke-virtual {v3, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 480
    .end local v1           #appsCustomizeContentParent:Landroid/view/ViewGroup;
    :cond_3
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v3, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    .line 481
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-static {v3, v7}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 483
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 484
    .local v2, filter:Landroid/content/IntentFilter;
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v2}, Lcom/android/launcher2/Launcher;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 486
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateGlobalIcons()V

    .line 489
    invoke-virtual {p0, v6}, Lcom/android/launcher2/Launcher;->unlockScreenOrientation(Z)V

    .line 492
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->registerOrientationListener()V

    .line 493
    return-void

    .line 470
    .end local v2           #filter:Landroid/content/IntentFilter;
    :cond_4
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v4}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v4

    invoke-virtual {v3, v6, v4}, Lcom/android/launcher2/LauncherModel;->startLoader(ZI)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 9
    .parameter "menu"

    .prologue
    const/high16 v8, 0x1080

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1875
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isWorkspaceLocked()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1909
    :goto_0
    return v4

    .line 1879
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 1881
    new-instance v2, Landroid/content/Intent;

    const-string v6, "android.settings.MANAGE_ALL_APPLICATIONS_SETTINGS"

    invoke-direct {v2, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1882
    .local v2, manageApps:Landroid/content/Intent;
    invoke-virtual {v2, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1884
    new-instance v3, Landroid/content/Intent;

    const-string v6, "android.settings.SETTINGS"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1885
    .local v3, settings:Landroid/content/Intent;
    const/high16 v6, 0x1020

    invoke-virtual {v3, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1887
    const v6, 0x7f0d0041

    invoke-virtual {p0, v6}, Lcom/android/launcher2/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1888
    .local v1, helpUrl:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1889
    .local v0, help:Landroid/content/Intent;
    invoke-virtual {v0, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1892
    const/4 v6, 0x2

    const v7, 0x7f0d003c

    invoke-interface {p1, v5, v6, v4, v7}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v6

    const v7, 0x108003f

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v6

    const/16 v7, 0x57

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1895
    const/4 v6, 0x3

    const v7, 0x7f0d003b

    invoke-interface {p1, v4, v6, v4, v7}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v6

    const v7, 0x1080042

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v2}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v6

    const/16 v7, 0x4d

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1899
    const/4 v6, 0x4

    const v7, 0x7f0d003f

    invoke-interface {p1, v4, v6, v4, v7}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v6

    const v7, 0x1080049

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v3}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v6

    const/16 v7, 0x50

    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1903
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1904
    const/4 v6, 0x5

    const v7, 0x7f0d0040

    invoke-interface {p1, v4, v6, v4, v7}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v4

    const v6, 0x1080040

    invoke-interface {v4, v6}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4, v0}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v4

    const/16 v6, 0x48

    invoke-interface {v4, v6}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    :cond_1
    move v4, v5

    .line 1909
    goto/16 :goto_0
.end method

.method public onDestroy()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 1745
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1747
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(Launcher)onDestroy: this = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1751
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1752
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1753
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Lcom/android/launcher2/Workspace;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1756
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/LauncherApplication;

    .line 1757
    .local v0, app:Lcom/android/launcher2/LauncherApplication;
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v2}, Lcom/android/launcher2/LauncherModel;->stopLoader()V

    .line 1758
    invoke-virtual {v0, v5}, Lcom/android/launcher2/LauncherApplication;->setLauncher(Lcom/android/launcher2/Launcher;)Lcom/android/launcher2/LauncherModel;

    .line 1761
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    invoke-virtual {v2}, Lcom/android/launcher2/LauncherAppWidgetHost;->stopListening()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1765
    :goto_0
    iput-object v5, p0, Lcom/android/launcher2/Launcher;->mAppWidgetHost:Lcom/android/launcher2/LauncherAppWidgetHost;

    .line 1767
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 1769
    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v2

    invoke-virtual {v2}, Landroid/text/method/TextKeyListener;->release()V

    .line 1773
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    if-eqz v2, :cond_0

    .line 1774
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v2}, Lcom/android/launcher2/LauncherModel;->unbindItemInfosAndClearQueuedBindRunnables()V

    .line 1777
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWidgetObserver:Landroid/database/ContentObserver;

    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1778
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1780
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v2}, Lcom/android/launcher2/DragLayer;->clearAllResizeFrames()V

    .line 1781
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1782
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace;->removeAllViews()V

    .line 1783
    iput-object v5, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    .line 1784
    iput-object v5, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    .line 1786
    invoke-static {}, Lcom/android/launcher2/LauncherAnimUtils;->onDestroyActivity()V

    .line 1789
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->disableOrientationListener()V

    .line 1790
    return-void

    .line 1762
    :catch_0
    move-exception v1

    .line 1763
    .local v1, ex:Ljava/lang/NullPointerException;
    const-string v2, "Launcher"

    const-string v3, "problem while stopping AppWidgetHost during Launcher destruction"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onDetachedFromWindow()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1449
    invoke-super {p0}, Landroid/app/Activity;->onDetachedFromWindow()V

    .line 1451
    const-string v0, "Launcher"

    const-string v1, "onDetachedFromWindow."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1454
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mVisible:Z

    .line 1456
    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mAttached:Z

    if-eqz v0, :cond_0

    .line 1457
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1458
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mAttached:Z

    .line 1460
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateRunning()V

    .line 1461
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 9
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/16 v8, 0x52

    const/4 v4, 0x1

    .line 962
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v3

    .line 963
    .local v3, uniChar:I
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    .line 964
    .local v1, handled:Z
    if-lez v3, :cond_1

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v5

    if-nez v5, :cond_1

    move v2, v4

    .line 966
    .local v2, isKeyNotWhitespace:Z
    :goto_0
    const-string v5, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " onKeyDown: KeyCode = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", KeyEvent = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uniChar = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", handled = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", isKeyNotWhitespace = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 971
    if-nez v1, :cond_2

    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->acceptFilter()Z

    move-result v5

    if-eqz v5, :cond_2

    if-eqz v2, :cond_2

    .line 972
    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v5

    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v7, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v5, v6, v7, p1, p2}, Landroid/text/method/TextKeyListener;->onKeyDown(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 974
    .local v0, gotKey:Z
    if-eqz v0, :cond_2

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 981
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->onSearchRequested()Z

    move-result v4

    .line 999
    .end local v0           #gotKey:Z
    :cond_0
    :goto_1
    return v4

    .line 964
    .end local v2           #isKeyNotWhitespace:Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 986
    .restart local v2       #isKeyNotWhitespace:Z
    :cond_2
    if-ne p1, v8, :cond_3

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v5

    if-nez v5, :cond_0

    .line 988
    :cond_3
    if-ne p1, v8, :cond_4

    .line 996
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->invalidateOptionsMenu()V

    :cond_4
    move v4, v1

    .line 999
    goto :goto_1
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 8
    .parameter "v"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2651
    const-string v5, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onLongClick: View = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", v.getTag() = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", mState = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2655
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isDraggingEnabled()Z

    move-result v5

    if-nez v5, :cond_0

    .line 2656
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLongClick: isDraggingEnabled() = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isDraggingEnabled()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2703
    :goto_0
    return v3

    .line 2660
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isWorkspaceLocked()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2661
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLongClick: isWorkspaceLocked() mWorkspaceLoading "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", mWaitingForResult = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2666
    :cond_1
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v6, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    if-eq v5, v6, :cond_2

    .line 2667
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onLongClick: mState != State.WORKSPACE: = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2672
    :cond_2
    :goto_1
    instance-of v5, p1, Lcom/android/launcher2/CellLayout;

    if-nez v5, :cond_3

    .line 2673
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    .end local p1
    check-cast p1, Landroid/view/View;

    .restart local p1
    goto :goto_1

    .line 2676
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->resetAddInfo()V

    .line 2677
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout$CellInfo;

    .line 2679
    .local v2, longClickCellInfo:Lcom/android/launcher2/CellLayout$CellInfo;
    if-nez v2, :cond_4

    move v3, v4

    .line 2680
    goto :goto_0

    .line 2685
    :cond_4
    iget-object v1, v2, Lcom/android/launcher2/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 2686
    .local v1, itemUnderLongClick:Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/android/launcher2/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_5

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v5}, Lcom/android/launcher2/Workspace;->allowLongPress()Z

    move-result v5

    if-eqz v5, :cond_7

    :cond_5
    move v0, v4

    .line 2687
    .local v0, allowLongPress:Z
    :goto_2
    if-eqz v0, :cond_6

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v5}, Lcom/android/launcher2/DragController;->isDragging()Z

    move-result v5

    if-nez v5, :cond_6

    .line 2688
    if-nez v1, :cond_8

    .line 2690
    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v5, v3, v4}, Lcom/android/launcher2/Workspace;->performHapticFeedback(II)Z

    .line 2692
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->startWallpaper()V

    :cond_6
    :goto_3
    move v3, v4

    .line 2703
    goto/16 :goto_0

    .end local v0           #allowLongPress:Z
    :cond_7
    move v0, v3

    .line 2686
    goto :goto_2

    .line 2694
    .restart local v0       #allowLongPress:Z
    :cond_8
    instance-of v3, v1, Lcom/android/launcher2/Folder;

    if-nez v3, :cond_6

    .line 2697
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v5}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/android/launcher2/Workspace;->startDragAppWidget(I)V

    .line 2699
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3, v2}, Lcom/android/launcher2/Workspace;->startDrag(Lcom/android/launcher2/CellLayout$CellInfo;)V

    goto :goto_3
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 6
    .parameter "intent"

    .prologue
    const/high16 v5, 0x40

    .line 1621
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 1623
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onNewIntent: intent = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1627
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1629
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->closeSystemDialogs()V

    .line 1631
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v2

    and-int/2addr v2, v5

    if-eq v2, v5, :cond_1

    const/4 v0, 0x1

    .line 1635
    .local v0, alreadyOnHome:Z
    :goto_0
    new-instance v1, Lcom/android/launcher2/Launcher$10;

    invoke-direct {v1, p0, v0}, Lcom/android/launcher2/Launcher$10;-><init>(Lcom/android/launcher2/Launcher;Z)V

    .line 1677
    .local v1, processIntent:Ljava/lang/Runnable;
    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2}, Lcom/android/launcher2/Workspace;->hasWindowFocus()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1680
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    const-wide/16 v3, 0x15e

    invoke-virtual {v2, v1, v3, v4}, Lcom/android/launcher2/Workspace;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1687
    .end local v0           #alreadyOnHome:Z
    .end local v1           #processIntent:Ljava/lang/Runnable;
    :cond_0
    :goto_1
    return-void

    .line 1631
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1683
    .restart local v0       #alreadyOnHome:Z
    .restart local v1       #processIntent:Ljava/lang/Runnable;
    :cond_2
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 1927
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1933
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 1929
    :pswitch_0
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->startWallpaper()V

    .line 1930
    const/4 v0, 0x1

    goto :goto_0

    .line 1927
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public onPageBoundSynchronously(I)V
    .locals 2
    .parameter "page"

    .prologue
    .line 3915
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mSynchronouslyBoundPages:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3916
    return-void
.end method

.method protected onPause()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 899
    invoke-virtual {p0, v3}, Lcom/android/launcher2/Launcher;->updateWallpaperVisibility(Z)V

    .line 901
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 903
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(Launcher)onPause: this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 907
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->onPauseWhenShown(I)V

    .line 908
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->resetReSyncFlags()V

    .line 910
    iput-boolean v3, p0, Lcom/android/launcher2/Launcher;->mPaused:Z

    .line 911
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v0}, Lcom/android/launcher2/DragController;->cancelDrag()V

    .line 912
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v0}, Lcom/android/launcher2/DragController;->resetLastGestureUpTime()V

    .line 915
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->disableOrientationListener()V

    .line 916
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1914
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 1916
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v3}, Lcom/android/launcher2/AppsCustomizeTabHost;->isTransitioning()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1922
    :goto_0
    return v1

    .line 1919
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v3}, Lcom/android/launcher2/AppsCustomizeTabHost;->getVisibility()I

    move-result v3

    if-nez v3, :cond_2

    move v0, v2

    .line 1920
    .local v0, allAppsVisible:Z
    :goto_1
    if-nez v0, :cond_1

    move v1, v2

    :cond_1
    invoke-interface {p1, v2, v1}, Landroid/view/Menu;->setGroupVisible(IZ)V

    move v1, v2

    .line 1922
    goto :goto_0

    .end local v0           #allAppsVisible:Z
    :cond_2
    move v0, v1

    .line 1919
    goto :goto_1
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 5
    .parameter "state"

    .prologue
    .line 1691
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 1694
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onRestoreInstanceState: state = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mSavedInstanceState = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mSavedInstanceState:Landroid/os/Bundle;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1698
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mSynchronouslyBoundPages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1699
    .local v1, page:I
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2, v1}, Lcom/android/launcher2/Workspace;->restoreInstanceStateForChild(I)V

    goto :goto_0

    .line 1701
    .end local v1           #page:I
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 826
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 828
    const-string v0, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(Launcher)onResume: mRestoring = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mOnResumeNeedsLoad = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/Launcher;->mOnResumeNeedsLoad:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",mOrientationChanged = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/Launcher;->mOrientationChanged:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",mPagesAreRecreated = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/launcher2/Launcher;->mPagesWereRecreated:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", this = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mOrientationChanged:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mPagesWereRecreated:Z

    if-eqz v0, :cond_0

    .line 838
    const-string v0, "Launcher"

    const-string v3, "(Launcher)onResume: mOrientationChanged && mPagesWereRecreated"

    invoke-static {v0, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v3}, Lcom/android/launcher2/AppsCustomizePagedView;->getCurrentPage()I

    move-result v3

    invoke-virtual {v0, v3, v1}, Lcom/android/launcher2/AppsCustomizePagedView;->invalidateAppPages(IZ)V

    .line 841
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->resetReSyncFlags()V

    .line 844
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/launcher2/Workspace;->onResumeWhenShown(I)V

    .line 847
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    sget-object v3, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    if-ne v0, v3, :cond_6

    .line 848
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->showWorkspace(Z)V

    .line 852
    :cond_1
    :goto_0
    sget-object v0, Lcom/android/launcher2/Launcher$State;->NONE:Lcom/android/launcher2/Launcher$State;

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    .line 855
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v3, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    if-ne v0, v3, :cond_7

    move v0, v1

    :goto_1
    invoke-direct {p0, v0}, Lcom/android/launcher2/Launcher;->setWorkspaceBackground(Z)V

    .line 858
    invoke-static {p0}, Lcom/android/launcher2/InstallShortcutReceiver;->flushInstallQueue(Landroid/content/Context;)V

    .line 860
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mPaused:Z

    .line 861
    sput-boolean v2, Lcom/android/launcher2/Launcher;->sPausedFromUserAction:Z

    .line 862
    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/launcher2/Launcher;->mOnResumeNeedsLoad:Z

    if-eqz v0, :cond_3

    .line 863
    :cond_2
    iput-boolean v1, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    .line 864
    iput-boolean v1, p0, Lcom/android/launcher2/Launcher;->mIsLoadingWorkspace:Z

    .line 865
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v3}, Lcom/android/launcher2/LauncherModel;->startLoader(ZI)V

    .line 866
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mRestoring:Z

    .line 867
    iput-boolean v2, p0, Lcom/android/launcher2/Launcher;->mOnResumeNeedsLoad:Z

    .line 872
    :cond_3
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWaitingForResume:Lcom/android/launcher2/BubbleTextView;

    if-eqz v0, :cond_4

    .line 874
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWaitingForResume:Lcom/android/launcher2/BubbleTextView;

    invoke-virtual {v0, v2}, Lcom/android/launcher2/BubbleTextView;->setStayPressed(Z)V

    .line 876
    :cond_4
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_5

    .line 878
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizePagedView;->resetDrawableState()V

    .line 884
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher2/Workspace;->reinflateWidgetsIfNecessary()V

    .line 888
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateGlobalIcons()V

    .line 891
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->enableOrientationListener()V

    .line 892
    return-void

    .line 849
    :cond_6
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mOnResumeState:Lcom/android/launcher2/Launcher$State;

    sget-object v3, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    if-ne v0, v3, :cond_1

    .line 850
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->showAllApps(Z)V

    goto :goto_0

    :cond_7
    move v0, v2

    .line 855
    goto :goto_1
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 921
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onRetainNonConfigurationInstance: mSavedState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mSavedInstanceState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mSavedInstanceState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 926
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mModel:Lcom/android/launcher2/LauncherModel;

    invoke-virtual {v0}, Lcom/android/launcher2/LauncherModel;->stopLoader()V

    .line 927
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 928
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizePagedView;->surrender()V

    .line 930
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 6
    .parameter "outState"

    .prologue
    .line 1705
    const-string v2, "launcher.current_screen"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->getNextPage()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1706
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1708
    const-string v2, "launcher.state"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v3}, Lcom/android/launcher2/Launcher$State;->ordinal()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1711
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->closeFolder()V

    .line 1713
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-wide v2, v2, Lcom/android/launcher2/ItemInfo;->container:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v2, v2, Lcom/android/launcher2/ItemInfo;->screen:I

    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    if-eqz v2, :cond_0

    .line 1715
    const-string v2, "launcher.add_container"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget-wide v3, v3, Lcom/android/launcher2/ItemInfo;->container:J

    invoke-virtual {p1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1716
    const-string v2, "launcher.add_screen"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v3, v3, Lcom/android/launcher2/ItemInfo;->screen:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1717
    const-string v2, "launcher.add_cell_x"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v3, v3, Lcom/android/launcher2/ItemInfo;->cellX:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1718
    const-string v2, "launcher.add_cell_y"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v3, v3, Lcom/android/launcher2/ItemInfo;->cellY:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1719
    const-string v2, "launcher.add_span_x"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v3, v3, Lcom/android/launcher2/ItemInfo;->spanX:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1720
    const-string v2, "launcher.add_span_y"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iget v3, v3, Lcom/android/launcher2/ItemInfo;->spanY:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1721
    const-string v2, "launcher.add_widget_info"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1724
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mFolderInfo:Lcom/android/launcher2/FolderInfo;

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    if-eqz v2, :cond_1

    .line 1725
    const-string v2, "launcher.rename_folder"

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1726
    const-string v2, "launcher.rename_folder_id"

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mFolderInfo:Lcom/android/launcher2/FolderInfo;

    iget-wide v3, v3, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-virtual {p1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1730
    :cond_1
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    if-eqz v2, :cond_3

    .line 1731
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v2}, Lcom/android/launcher2/AppsCustomizeTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v1

    .line 1732
    .local v1, currentTabTag:Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 1733
    const-string v2, "apps_customize_currentTab"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1735
    :cond_2
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeContent:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-virtual {v2}, Lcom/android/launcher2/AppsCustomizePagedView;->getSaveInstanceStateIndex()I

    move-result v0

    .line 1736
    .local v0, currentIndex:I
    const-string v2, "apps_customize_currentIndex"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1739
    .end local v0           #currentIndex:I
    .end local v1           #currentTabTag:Ljava/lang/String;
    :cond_3
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " onSaveInstanceState: outState = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1741
    return-void
.end method

.method public onSearchRequested()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1938
    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0, v2, v1}, Lcom/android/launcher2/Launcher;->startSearch(Ljava/lang/String;ZLandroid/os/Bundle;Z)V

    .line 1940
    return v1
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 760
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 762
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(Launcher)onStart: this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 765
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->getContentVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 767
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/launcher2/AppsCustomizeTabHost;->setContentVisibility(I)V

    .line 769
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 3

    .prologue
    .line 773
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 775
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(Launcher)onStop: this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 777
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "event"

    .prologue
    .line 2279
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->showWorkspace(Z)V

    .line 2280
    const/4 v0, 0x0

    return v0
.end method

.method public onTouchDownAllAppsButton(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 2340
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 2341
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 3
    .parameter "level"

    .prologue
    .line 3177
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 3179
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTrimMemory: level = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3182
    const/16 v0, 0x50

    if-lt p1, v0, :cond_0

    .line 3183
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->volunteerFreeMemory()V

    .line 3185
    :cond_0
    return-void
.end method

.method protected onUserLeaveHint()V
    .locals 1

    .prologue
    .line 496
    invoke-super {p0}, Landroid/app/Activity;->onUserLeaveHint()V

    .line 497
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/launcher2/Launcher;->sPausedFromUserAction:Z

    .line 498
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 4
    .parameter "hasFocus"

    .prologue
    .line 3189
    if-nez p1, :cond_0

    .line 3192
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->updateWallpaperVisibility(Z)V

    .line 3202
    :goto_0
    return-void

    .line 3195
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    new-instance v1, Lcom/android/launcher2/Launcher$19;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Launcher$19;-><init>(Lcom/android/launcher2/Launcher;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher2/Workspace;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public onWindowVisibilityChanged(I)V
    .locals 2
    .parameter "visibility"

    .prologue
    .line 1464
    if-nez p1, :cond_2

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/android/launcher2/Launcher;->mVisible:Z

    .line 1465
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateRunning()V

    .line 1469
    iget-boolean v1, p0, Lcom/android/launcher2/Launcher;->mVisible:Z

    if-eqz v1, :cond_1

    .line 1470
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v1}, Lcom/android/launcher2/AppsCustomizeTabHost;->onWindowVisible()V

    .line 1471
    iget-boolean v1, p0, Lcom/android/launcher2/Launcher;->mWorkspaceLoading:Z

    if-nez v1, :cond_0

    .line 1472
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1477
    .local v0, observer:Landroid/view/ViewTreeObserver;
    new-instance v1, Lcom/android/launcher2/Launcher$8;

    invoke-direct {v1, p0, v0}, Lcom/android/launcher2/Launcher$8;-><init>(Lcom/android/launcher2/Launcher;Landroid/view/ViewTreeObserver;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1493
    .end local v0           #observer:Landroid/view/ViewTreeObserver;
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateAppMarketIcon()V

    .line 1494
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->clearTypedText()V

    .line 1496
    :cond_1
    return-void

    .line 1464
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public openFolder(Lcom/android/launcher2/FolderIcon;)V
    .locals 5
    .parameter "folderIcon"

    .prologue
    .line 2607
    invoke-virtual {p1}, Lcom/android/launcher2/FolderIcon;->getFolder()Lcom/android/launcher2/Folder;

    move-result-object v0

    .line 2608
    .local v0, folder:Lcom/android/launcher2/Folder;
    iget-object v1, v0, Lcom/android/launcher2/Folder;->mInfo:Lcom/android/launcher2/FolderInfo;

    .line 2610
    .local v1, info:Lcom/android/launcher2/FolderInfo;
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/android/launcher2/FolderInfo;->opened:Z

    .line 2614
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_0

    .line 2615
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v2, v0}, Lcom/android/launcher2/DragLayer;->addView(Landroid/view/View;)V

    .line 2616
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v2, v0}, Lcom/android/launcher2/DragController;->addDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 2621
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->animateOpen()V

    .line 2622
    invoke-direct {p0, p1}, Lcom/android/launcher2/Launcher;->growAndFadeOutFolderIcon(Lcom/android/launcher2/FolderIcon;)V

    .line 2623
    return-void

    .line 2618
    :cond_0
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Opening folder ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") which already has a parent ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/android/launcher2/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method processShortcut(Landroid/content/Intent;)V
    .locals 7
    .parameter "intent"

    .prologue
    .line 2077
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d0021

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2078
    .local v0, applicationName:Ljava/lang/String;
    const-string v4, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2081
    .local v3, shortcutName:Ljava/lang/String;
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "processShortcut: applicationName = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", shortcutName = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", intent = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2085
    if-eqz v0, :cond_0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2086
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.MAIN"

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2087
    .local v1, mainIntent:Landroid/content/Intent;
    const-string v4, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2089
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.intent.action.PICK_ACTIVITY"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2090
    .local v2, pickIntent:Landroid/content/Intent;
    const-string v4, "android.intent.extra.INTENT"

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2091
    const-string v4, "android.intent.extra.TITLE"

    const v5, 0x7f0d002d

    invoke-virtual {p0, v5}, Lcom/android/launcher2/Launcher;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 2092
    const/4 v4, 0x6

    invoke-virtual {p0, v2, v4}, Lcom/android/launcher2/Launcher;->startActivityForResultSafely(Landroid/content/Intent;I)V

    .line 2096
    .end local v1           #mainIntent:Landroid/content/Intent;
    .end local v2           #pickIntent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 2094
    :cond_0
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v4}, Lcom/android/launcher2/Launcher;->startActivityForResultSafely(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method processShortcutFromDrop(Landroid/content/ComponentName;JI[I[I)V
    .locals 4
    .parameter "componentName"
    .parameter "container"
    .parameter "screen"
    .parameter "cell"
    .parameter "loc"

    .prologue
    .line 1992
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processShortcutFromDrop componentName = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", container = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", screen = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1996
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->resetAddInfo()V

    .line 1997
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput-wide p2, v1, Lcom/android/launcher2/ItemInfo;->container:J

    .line 1998
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput p4, v1, Lcom/android/launcher2/ItemInfo;->screen:I

    .line 1999
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    iput-object p6, v1, Lcom/android/launcher2/ItemInfo;->dropPos:[I

    .line 2001
    if-eqz p5, :cond_0

    .line 2002
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const/4 v2, 0x0

    aget v2, p5, v2

    iput v2, v1, Lcom/android/launcher2/ItemInfo;->cellX:I

    .line 2003
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mPendingAddInfo:Lcom/android/launcher2/ItemInfo;

    const/4 v2, 0x1

    aget v2, p5, v2

    iput v2, v1, Lcom/android/launcher2/ItemInfo;->cellY:I

    .line 2006
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_SHORTCUT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2007
    .local v0, createShortcutIntent:Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2008
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->processShortcut(Landroid/content/Intent;)V

    .line 2009
    return-void
.end method

.method processWallpaper(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 2099
    const/16 v0, 0xa

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/Launcher;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2100
    return-void
.end method

.method public removeAppWidget(Lcom/android/launcher2/LauncherAppWidgetInfo;)V
    .locals 3
    .parameter "launcherInfo"

    .prologue
    .line 1575
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeAppWidget launcherInfo = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1578
    iget-object v0, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->removeWidgetToAutoAdvance(Landroid/view/View;)V

    .line 1579
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/android/launcher2/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 1580
    return-void
.end method

.method removeFolder(Lcom/android/launcher2/FolderInfo;)V
    .locals 3
    .parameter "folder"

    .prologue
    .line 2121
    sget-object v0, Lcom/android/launcher2/Launcher;->sFolders:Ljava/util/HashMap;

    iget-wide v1, p1, Lcom/android/launcher2/ItemInfo;->id:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2122
    return-void
.end method

.method removeWidgetToAutoAdvance(Landroid/view/View;)V
    .locals 3
    .parameter "hostView"

    .prologue
    .line 1564
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeWidgetToAutoAdvance hostView = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1567
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1568
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1569
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateRunning()V

    .line 1571
    :cond_0
    return-void
.end method

.method public setLoadOnResume()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 3733
    iget-boolean v1, p0, Lcom/android/launcher2/Launcher;->mPaused:Z

    if-eqz v1, :cond_0

    .line 3734
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setLoadOnResume: this = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 3735
    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mOnResumeNeedsLoad:Z

    .line 3738
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method showAllApps(Z)V
    .locals 4
    .parameter "animated"

    .prologue
    const/4 v3, 0x0

    .line 3252
    const-string v0, "Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showAllApps: animated = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mCurrentBounds = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mCurrentBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3255
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v1, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    if-eq v0, v1, :cond_0

    .line 3278
    :goto_0
    return-void

    .line 3258
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    if-eqz v0, :cond_1

    .line 3259
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mDragLayer:Lcom/android/launcher2/DragLayer;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getCurrentDropLayout()Lcom/android/launcher2/CellLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mCurrentBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 3263
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->startCovered(I)V

    .line 3264
    invoke-direct {p0, p1, v3}, Lcom/android/launcher2/Launcher;->showAppsCustomizeHelper(ZZ)V

    .line 3265
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mAppsCustomizeTabHost:Lcom/android/launcher2/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/android/launcher2/AppsCustomizeTabHost;->requestFocus()Z

    .line 3268
    sget-object v0, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE:Lcom/android/launcher2/Launcher$State;

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    .line 3271
    iput-boolean v3, p0, Lcom/android/launcher2/Launcher;->mUserPresent:Z

    .line 3272
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateRunning()V

    .line 3273
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->closeFolder()V

    .line 3276
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    goto :goto_0
.end method

.method showDockDivider(Z)V
    .locals 9
    .parameter "animated"

    .prologue
    const/4 v8, 0x1

    const/high16 v7, 0x3f80

    const/4 v6, 0x0

    .line 3343
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mQsbDivider:Landroid/view/View;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v1, :cond_2

    .line 3344
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mQsbDivider:Landroid/view/View;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 3345
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 3346
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    if-eqz v1, :cond_0

    .line 3347
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 3348
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mQsbDivider:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setAlpha(F)V

    .line 3349
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setAlpha(F)V

    .line 3350
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    .line 3352
    :cond_0
    if-eqz p1, :cond_2

    .line 3353
    invoke-static {}, Lcom/android/launcher2/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    .line 3354
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/animation/Animator;

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mQsbDivider:Landroid/view/View;

    const-string v4, "alpha"

    new-array v5, v8, [F

    aput v7, v5, v6

    invoke-static {v3, v4, v5}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v6

    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mDockDivider:Landroid/view/View;

    const-string v4, "alpha"

    new-array v5, v8, [F

    aput v7, v5, v6

    invoke-static {v3, v4, v5}, Lcom/android/launcher2/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 3356
    const/4 v0, 0x0

    .line 3357
    .local v0, duration:I
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v1, :cond_1

    .line 3358
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/android/launcher2/SearchDropTargetBar;->getTransitionInDuration()I

    move-result v0

    .line 3360
    :cond_1
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 3361
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 3364
    .end local v0           #duration:I
    :cond_2
    return-void
.end method

.method public showFirstRunAllAppsCling([I)V
    .locals 5
    .parameter "position"

    .prologue
    const v4, 0x7f07000c

    const/4 v3, 0x0

    .line 4337
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->isClingsEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "cling.allapps.dismissed"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4340
    const/4 v1, 0x1

    invoke-direct {p0, v4, p1, v1, v3}, Lcom/android/launcher2/Launcher;->initCling(I[IZI)Lcom/android/launcher2/Cling;

    move-result-object v0

    .line 4341
    .local v0, appsCling:Lcom/android/launcher2/Cling;
    const v1, 0x7f070002

    invoke-direct {p0, v0, v1}, Lcom/android/launcher2/Launcher;->setClingTitleWithThemeColor(Landroid/view/View;I)V

    .line 4345
    .end local v0           #appsCling:Lcom/android/launcher2/Cling;
    :goto_0
    return-void

    .line 4343
    :cond_0
    invoke-direct {p0, v4}, Lcom/android/launcher2/Launcher;->removeCling(I)V

    goto :goto_0
.end method

.method public showFirstRunFoldersCling()Lcom/android/launcher2/Cling;
    .locals 5

    .prologue
    const v4, 0x7f070027

    const/4 v3, 0x0

    .line 4350
    const/4 v0, 0x0

    .line 4351
    .local v0, cling:Lcom/android/launcher2/Cling;
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->isClingsEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "cling.folder.dismissed"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4353
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v4, v1, v2, v3}, Lcom/android/launcher2/Launcher;->initCling(I[IZI)Lcom/android/launcher2/Cling;

    move-result-object v0

    .line 4354
    const v1, 0x7f070015

    invoke-direct {p0, v0, v1}, Lcom/android/launcher2/Launcher;->setClingTitleWithThemeColor(Landroid/view/View;I)V

    .line 4358
    :goto_0
    return-object v0

    .line 4356
    :cond_0
    invoke-direct {p0, v4}, Lcom/android/launcher2/Launcher;->removeCling(I)V

    goto :goto_0
.end method

.method public showFirstRunWorkspaceCling()V
    .locals 5

    .prologue
    const v4, 0x7f070026

    const/4 v3, 0x0

    .line 4324
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->isClingsEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "cling.workspace.dismissed"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->skipCustomClingIfNoAccounts()Z

    move-result v1

    if-nez v1, :cond_0

    .line 4328
    const/4 v1, 0x0

    invoke-direct {p0, v4, v1, v3, v3}, Lcom/android/launcher2/Launcher;->initCling(I[IZI)Lcom/android/launcher2/Cling;

    move-result-object v0

    .line 4329
    .local v0, workspaceCling:Lcom/android/launcher2/Cling;
    const v1, 0x7f07003a

    invoke-direct {p0, v0, v1}, Lcom/android/launcher2/Launcher;->setClingTitleWithThemeColor(Landroid/view/View;I)V

    .line 4333
    .end local v0           #workspaceCling:Lcom/android/launcher2/Cling;
    :goto_0
    return-void

    .line 4331
    :cond_0
    invoke-direct {p0, v4}, Lcom/android/launcher2/Launcher;->removeCling(I)V

    goto :goto_0
.end method

.method showHotseat(Z)V
    .locals 4
    .parameter "animated"

    .prologue
    const/high16 v2, 0x3f80

    .line 3378
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3379
    if-eqz p1, :cond_2

    .line 3380
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v1}, Lcom/android/launcher2/Hotseat;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    .line 3381
    const/4 v0, 0x0

    .line 3382
    .local v0, duration:I
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v1, :cond_0

    .line 3383
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/android/launcher2/SearchDropTargetBar;->getTransitionInDuration()I

    move-result v0

    .line 3385
    :cond_0
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v1}, Lcom/android/launcher2/Hotseat;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 3391
    .end local v0           #duration:I
    :cond_1
    :goto_0
    return-void

    .line 3388
    :cond_2
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v1, v2}, Lcom/android/launcher2/Hotseat;->setAlpha(F)V

    goto :goto_0
.end method

.method public showLongPressWidgetToAddMessage()V
    .locals 3

    .prologue
    const v2, 0x7f0d0016

    const/4 v1, 0x0

    .line 4678
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mLongPressWidgetToAddToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 4679
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/Launcher;->mLongPressWidgetToAddToast:Landroid/widget/Toast;

    .line 4685
    :goto_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mLongPressWidgetToAddToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 4686
    return-void

    .line 4682
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mLongPressWidgetToAddToast:Landroid/widget/Toast;

    invoke-virtual {v0, v2}, Landroid/widget/Toast;->setText(I)V

    .line 4683
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mLongPressWidgetToAddToast:Landroid/widget/Toast;

    invoke-virtual {v0, v1}, Landroid/widget/Toast;->setDuration(I)V

    goto :goto_0
.end method

.method showOnlyOneWidgetMessage(Lcom/android/launcher2/PendingAddWidgetInfo;)V
    .locals 7
    .parameter "info"

    .prologue
    const/4 v6, 0x0

    .line 1594
    :try_start_0
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1595
    .local v2, pm:Landroid/content/pm/PackageManager;
    iget-object v3, p1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1596
    .local v1, label:Ljava/lang/String;
    const/high16 v3, 0x7f0d

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {p0, v3, v4}, Lcom/android/launcher2/Launcher;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1601
    .end local v1           #label:Ljava/lang/String;
    .end local v2           #pm:Landroid/content/pm/PackageManager;
    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, v6, v6, v3}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    .line 1602
    return-void

    .line 1597
    :catch_0
    move-exception v0

    .line 1598
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "Launcher"

    const-string v4, "Got NameNotFounceException when showOnlyOneWidgetMessage."

    invoke-static {v3, v4, v0}, Lcom/android/launcher2/LauncherLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method showOutOfSpaceMessage(Z)V
    .locals 3
    .parameter "isHotseatLayout"

    .prologue
    .line 1583
    if-eqz p1, :cond_0

    const v0, 0x7f0d0027

    .line 1584
    .local v0, strId:I
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1585
    return-void

    .line 1583
    .end local v0           #strId:I
    :cond_0
    const v0, 0x7f0d0026

    goto :goto_0
.end method

.method showWorkspace(Z)V
    .locals 2
    .parameter "animated"

    .prologue
    .line 3207
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v1}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/Workspace;->stopCovered(I)V

    .line 3208
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/launcher2/Launcher;->showWorkspace(ZLjava/lang/Runnable;)V

    .line 3209
    return-void
.end method

.method showWorkspace(ZLjava/lang/Runnable;)V
    .locals 6
    .parameter "animated"
    .parameter "onCompleteRunnable"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 3213
    const-string v3, "Launcher"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "showWorkspace: animated = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", mState = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3216
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v4, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    if-eq v3, v4, :cond_2

    .line 3217
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    sget-object v4, Lcom/android/launcher2/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/android/launcher2/Launcher$State;

    if-ne v3, v4, :cond_3

    move v0, v1

    .line 3218
    .local v0, wasInSpringLoadedMode:Z
    :goto_0
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3, v2}, Lcom/android/launcher2/Workspace;->setVisibility(I)V

    .line 3219
    sget-object v3, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    invoke-direct {p0, v3, p1, v2, p2}, Lcom/android/launcher2/Launcher;->hideAppsCustomizeHelper(Lcom/android/launcher2/Launcher$State;ZZLjava/lang/Runnable;)V

    .line 3223
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v3, :cond_0

    .line 3224
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v3, v0}, Lcom/android/launcher2/SearchDropTargetBar;->showSearchBar(Z)V

    .line 3228
    :cond_0
    if-eqz p1, :cond_1

    if-eqz v0, :cond_1

    move v2, v1

    :cond_1
    invoke-virtual {p0, v2}, Lcom/android/launcher2/Launcher;->showDockDivider(Z)V

    .line 3231
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAllAppsButton:Landroid/view/View;

    if-eqz v2, :cond_2

    .line 3232
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mAllAppsButton:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->requestFocus()Z

    .line 3236
    .end local v0           #wasInSpringLoadedMode:Z
    :cond_2
    iget-object v2, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v2, p1}, Lcom/android/launcher2/Workspace;->flashScrollingIndicator(Z)V

    .line 3239
    sget-object v2, Lcom/android/launcher2/Launcher$State;->WORKSPACE:Lcom/android/launcher2/Launcher$State;

    iput-object v2, p0, Lcom/android/launcher2/Launcher;->mState:Lcom/android/launcher2/Launcher$State;

    .line 3242
    iput-boolean v1, p0, Lcom/android/launcher2/Launcher;->mUserPresent:Z

    .line 3243
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->updateRunning()V

    .line 3246
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 3248
    return-void

    :cond_3
    move v0, v2

    .line 3217
    goto :goto_0
.end method

.method startActivity(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z
    .locals 9
    .parameter "v"
    .parameter "intent"
    .parameter "tag"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2390
    const-string v5, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "startActivity v = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", intent = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", tag = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2393
    const/high16 v5, 0x1000

    invoke-virtual {p2, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2398
    if-eqz p1, :cond_0

    :try_start_0
    const-string v5, "com.android.launcher.intent.extra.shortcut.INGORE_LAUNCH_ANIMATION"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    move v2, v4

    .line 2402
    .local v2, useLaunchAnimation:Z
    :goto_0
    const-wide/16 v5, 0x4

    const-string v7, "Launcher.startActivity"

    invoke-static {v5, v6, v7}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 2404
    if-eqz v2, :cond_1

    .line 2405
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-static {p1, v5, v6, v7, v8}, Landroid/app/ActivityOptions;->makeScaleUpAnimation(Landroid/view/View;IIII)Landroid/app/ActivityOptions;

    move-result-object v1

    .line 2408
    .local v1, opts:Landroid/app/ActivityOptions;
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {p0, p2, v5}, Lcom/android/launcher2/Launcher;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 2414
    .end local v1           #opts:Landroid/app/ActivityOptions;
    :goto_1
    const-wide/16 v5, 0x4

    invoke-static {v5, v6}, Landroid/os/Trace;->traceEnd(J)V

    move v3, v4

    .line 2424
    .end local v2           #useLaunchAnimation:Z
    :goto_2
    return v3

    :cond_0
    move v2, v3

    .line 2398
    goto :goto_0

    .line 2410
    .restart local v2       #useLaunchAnimation:Z
    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/launcher2/Launcher;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 2417
    .end local v2           #useLaunchAnimation:Z
    :catch_0
    move-exception v0

    .line 2418
    .local v0, e:Ljava/lang/SecurityException;
    const v4, 0x7f0d0014

    invoke-static {p0, v4, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 2419
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Launcher does not have the permission to launch "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". Make sure to create a MAIN intent-filter for the corresponding activity "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "or use the exported attribute for this activity. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "tag="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " intent="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 1
    .parameter "intent"
    .parameter "requestCode"

    .prologue
    .line 1798
    if-ltz p2, :cond_0

    .line 1799
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/Launcher;->mWaitingForResult:Z

    .line 1801
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1802
    return-void
.end method

.method startActivityForResultSafely(Landroid/content/Intent;I)V
    .locals 6
    .parameter "intent"
    .parameter "requestCode"

    .prologue
    const v5, 0x7f0d0014

    const/4 v4, 0x0

    .line 2444
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startActivityForResultSafely: intent = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", requestCode = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2449
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher2/Launcher;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2458
    :goto_0
    return-void

    .line 2450
    :catch_0
    move-exception v0

    .line 2451
    .local v0, e:Landroid/content/ActivityNotFoundException;
    invoke-static {p0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2452
    .end local v0           #e:Landroid/content/ActivityNotFoundException;
    :catch_1
    move-exception v0

    .line 2453
    .local v0, e:Ljava/lang/SecurityException;
    invoke-static {p0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 2454
    const-string v1, "Launcher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Launcher does not have the permission to launch "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Make sure to create a MAIN intent-filter for the corresponding activity "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "or use the exported attribute for this activity."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z
    .locals 5
    .parameter "v"
    .parameter "intent"
    .parameter "tag"

    .prologue
    .line 2429
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startActivitySafely v = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", intent = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", tag = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2432
    const/4 v1, 0x0

    .line 2434
    .local v1, success:Z
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher2/Launcher;->startActivity(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 2439
    :goto_0
    return v1

    .line 2435
    :catch_0
    move-exception v0

    .line 2436
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const v2, 0x7f0d0014

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 2437
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to launch. tag="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " intent="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method startApplicationDetailsActivity(Landroid/content/ComponentName;)V
    .locals 6
    .parameter "componentName"

    .prologue
    const/4 v5, 0x0

    .line 2357
    const-string v2, "Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startApplicationDetailsActivity: componentName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2360
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 2361
    .local v1, packageName:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    const-string v3, "package"

    invoke-static {v3, v1, v5}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2363
    .local v0, intent:Landroid/content/Intent;
    const/high16 v2, 0x1080

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2364
    const-string v2, "startApplicationDetailsActivity"

    invoke-virtual {p0, v5, v0, v2}, Lcom/android/launcher2/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 2365
    return-void
.end method

.method startApplicationUninstallActivity(Lcom/android/launcher2/ApplicationInfo;)V
    .locals 7
    .parameter "appInfo"

    .prologue
    .line 2369
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startApplicationUninstallActivity: appInfo = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2372
    iget v4, p1, Lcom/android/launcher2/ApplicationInfo;->flags:I

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_0

    .line 2375
    const v2, 0x7f0d0051

    .line 2376
    .local v2, messageId:I
    const/4 v4, 0x0

    invoke-static {p0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 2386
    .end local v2           #messageId:I
    :goto_0
    return-void

    .line 2378
    :cond_0
    iget-object v4, p1, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 2379
    .local v3, packageName:Ljava/lang/String;
    iget-object v4, p1, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 2380
    .local v0, className:Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.DELETE"

    const-string v5, "package"

    invoke-static {v5, v3, v0}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2382
    .local v1, intent:Landroid/content/Intent;
    const/high16 v4, 0x1080

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2384
    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public startBinding()V
    .locals 7

    .prologue
    .line 3760
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startBinding: this = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3764
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    if-eqz v4, :cond_0

    .line 3765
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    invoke-virtual {v4}, Lcom/android/launcher2/DragController;->cancelDrag()V

    .line 3769
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    .line 3771
    .local v3, workspace:Lcom/android/launcher2/Workspace;
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimatePage:I

    .line 3772
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 3773
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v4}, Lcom/android/launcher2/Workspace;->clearDropTargets()V

    .line 3774
    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v0

    .line 3775
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 3777
    invoke-virtual {v3, v1}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/launcher2/CellLayout;

    .line 3778
    .local v2, layoutParent:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->removeAllViewsInLayout()V

    .line 3779
    invoke-virtual {v2}, Lcom/android/launcher2/CellLayout;->requestChildLayout()V

    .line 3775
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3781
    .end local v2           #layoutParent:Lcom/android/launcher2/CellLayout;
    :cond_1
    invoke-virtual {v3}, Lcom/android/launcher2/Workspace;->invalidate()V

    .line 3782
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 3783
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    if-eqz v4, :cond_2

    .line 3784
    iget-object v4, p0, Lcom/android/launcher2/Launcher;->mHotseat:Lcom/android/launcher2/Hotseat;

    invoke-virtual {v4}, Lcom/android/launcher2/Hotseat;->resetLayout()V

    .line 3787
    :cond_2
    const-string v4, "Launcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startBinding: mIsLoadingWorkspace = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/android/launcher2/Launcher;->mIsLoadingWorkspace:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3789
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/android/launcher2/Launcher;->mIsLoadingWorkspace:Z

    .line 3790
    return-void
.end method

.method public startGlobalSearch(Ljava/lang/String;ZLandroid/os/Bundle;Landroid/graphics/Rect;)V
    .locals 8
    .parameter "initialQuery"
    .parameter "selectInitialQuery"
    .parameter "appSearchData"
    .parameter "sourceBounds"

    .prologue
    .line 1838
    const-string v5, "search"

    invoke-virtual {p0, v5}, Lcom/android/launcher2/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/SearchManager;

    .line 1840
    .local v4, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v4}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v2

    .line 1841
    .local v2, globalSearchActivity:Landroid/content/ComponentName;
    if-nez v2, :cond_0

    .line 1842
    const-string v5, "Launcher"

    const-string v6, "No global search activity found."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1871
    :goto_0
    return-void

    .line 1845
    :cond_0
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.search.action.GLOBAL_SEARCH"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1846
    .local v3, intent:Landroid/content/Intent;
    const/high16 v5, 0x1000

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1847
    invoke-virtual {v3, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1849
    if-nez p3, :cond_4

    .line 1850
    new-instance p3, Landroid/os/Bundle;

    .end local p3
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 1855
    .restart local p3
    :goto_1
    const-string v5, "source"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1856
    const-string v5, "source"

    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1858
    :cond_1
    const-string v5, "app_data"

    invoke-virtual {v3, v5, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1859
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1860
    const-string v5, "query"

    invoke-virtual {v3, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1862
    :cond_2
    if-eqz p2, :cond_3

    .line 1863
    const-string v5, "select_query"

    invoke-virtual {v3, v5, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1865
    :cond_3
    invoke-virtual {v3, p4}, Landroid/content/Intent;->setSourceBounds(Landroid/graphics/Rect;)V

    .line 1867
    :try_start_0
    invoke-virtual {p0, v3}, Lcom/android/launcher2/Launcher;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1868
    :catch_0
    move-exception v1

    .line 1869
    .local v1, ex:Landroid/content/ActivityNotFoundException;
    const-string v5, "Launcher"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Global search activity not found: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1852
    .end local v1           #ex:Landroid/content/ActivityNotFoundException;
    :cond_4
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0, p3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .end local p3
    .local v0, appSearchData:Landroid/os/Bundle;
    move-object p3, v0

    .end local v0           #appSearchData:Landroid/os/Bundle;
    .restart local p3
    goto :goto_1
.end method

.method public startSearch(Ljava/lang/String;ZLandroid/os/Bundle;Z)V
    .locals 3
    .parameter "initialQuery"
    .parameter "selectInitialQuery"
    .parameter "appSearchData"
    .parameter "globalSearch"

    .prologue
    .line 1812
    const-string v1, "Launcher"

    const-string v2, "startSearch."

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1814
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/Launcher;->showWorkspace(Z)V

    .line 1816
    if-nez p1, :cond_0

    .line 1818
    invoke-direct {p0}, Lcom/android/launcher2/Launcher;->getTypedText()Ljava/lang/String;

    move-result-object p1

    .line 1820
    :cond_0
    if-nez p3, :cond_1

    .line 1821
    new-instance p3, Landroid/os/Bundle;

    .end local p3
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 1822
    .restart local p3
    const-string v1, "source"

    const-string v2, "launcher-search"

    invoke-virtual {p3, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1824
    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 1825
    .local v0, sourceBounds:Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v1, :cond_2

    .line 1826
    iget-object v1, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/android/launcher2/SearchDropTargetBar;->getSearchBarBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1829
    :cond_2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/launcher2/Launcher;->startGlobalSearch(Ljava/lang/String;ZLandroid/os/Bundle;Landroid/graphics/Rect;)V

    .line 1831
    return-void
.end method

.method public switchScene()V
    .locals 8

    .prologue
    .line 4556
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    const/4 v6, 0x5

    if-ge v4, v6, :cond_0

    .line 4557
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v6, v4}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/CellLayout;

    .line 4558
    .local v1, cellLayout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v1}, Lcom/android/launcher2/CellLayout;->removeAllViews()V

    .line 4556
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 4562
    .end local v1           #cellLayout:Lcom/android/launcher2/CellLayout;
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 4563
    .local v2, context:Landroid/content/Context;
    new-instance v0, Landroid/appwidget/AppWidgetHost;

    const/16 v6, 0x400

    invoke-direct {v0, v2, v6}, Landroid/appwidget/AppWidgetHost;-><init>(Landroid/content/Context;I)V

    .line 4564
    .local v0, appWidgetHost:Landroid/appwidget/AppWidgetHost;
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetHost;->deleteHost()V

    .line 4565
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    .line 4566
    .local v5, resolver:Landroid/content/ContentResolver;
    sget-object v6, Lcom/android/launcher2/LauncherProvider;->CONTENT_APPWIDGET_RESET_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 4568
    iget-object v3, p0, Lcom/android/launcher2/Launcher;->mDragController:Lcom/android/launcher2/DragController;

    .line 4569
    .local v3, dragController:Lcom/android/launcher2/DragController;
    invoke-virtual {v3}, Lcom/android/launcher2/DragController;->resetDropTarget()V

    .line 4571
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mWorkspace:Lcom/android/launcher2/Workspace;

    invoke-virtual {v3, v6}, Lcom/android/launcher2/DragController;->addDropTarget(Lcom/android/launcher2/DropTarget;)V

    .line 4572
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    if-eqz v6, :cond_1

    .line 4573
    iget-object v6, p0, Lcom/android/launcher2/Launcher;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v6, p0, v3}, Lcom/android/launcher2/SearchDropTargetBar;->setup(Lcom/android/launcher2/Launcher;Lcom/android/launcher2/DragController;)V

    .line 4575
    :cond_1
    return-void
.end method

.method unlockAllApps()V
    .locals 0

    .prologue
    .line 3372
    return-void
.end method

.method public unlockScreenOrientation(Z)V
    .locals 4
    .parameter "immediate"

    .prologue
    .line 4220
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->isRotationEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4221
    if-eqz p1, :cond_1

    .line 4222
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Launcher;->setRequestedOrientation(I)V

    .line 4231
    :cond_0
    :goto_0
    return-void

    .line 4224
    :cond_1
    iget-object v0, p0, Lcom/android/launcher2/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/launcher2/Launcher$26;

    invoke-direct {v1, p0}, Lcom/android/launcher2/Launcher$26;-><init>(Lcom/android/launcher2/Launcher;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method updateWallpaperVisibility(Z)V
    .locals 4
    .parameter "visible"

    .prologue
    const/high16 v2, 0x10

    .line 2780
    if-eqz p1, :cond_1

    move v1, v2

    .line 2781
    .local v1, wpflags:I
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int v0, v3, v2

    .line 2783
    .local v0, curflags:I
    if-eq v1, v0, :cond_0

    .line 2784
    invoke-virtual {p0}, Lcom/android/launcher2/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Landroid/view/Window;->setFlags(II)V

    .line 2786
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher2/Launcher;->setWorkspaceBackground(Z)V

    .line 2787
    return-void

    .line 2780
    .end local v0           #curflags:I
    .end local v1           #wpflags:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
