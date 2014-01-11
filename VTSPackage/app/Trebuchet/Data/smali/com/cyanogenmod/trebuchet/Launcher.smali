.class public final Lcom/cyanogenmod/trebuchet/Launcher;
.super Landroid/app/Activity;
.source "Launcher.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/cyanogenmod/trebuchet/LauncherModel$Callbacks;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/Launcher$AppWidgetResetObserver;,
        Lcom/cyanogenmod/trebuchet/Launcher$CloseSystemDialogsIntentReceiver;,
        Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;,
        Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;,
        Lcom/cyanogenmod/trebuchet/Launcher$State;
    }
.end annotation


# static fields
.field static final APPWIDGET_HOST_ID:I = 0x400

.field static final DEBUG_STRICT_MODE:Z = false

.field static final DEBUG_WIDGETS:Z = false

.field static final DEFAULT_SCREEN:I = 0x2

.field private static final DISMISS_CLING_DURATION:I = 0xfa

.field static final DUMP_STATE_PROPERTY:Ljava/lang/String; = "launcher_dump_state"

.field private static final EXIT_SPRINGLOADED_MODE_LONG_TIMEOUT:I = 0x258

.field private static final EXIT_SPRINGLOADED_MODE_SHORT_TIMEOUT:I = 0x12c

.field static final EXTRA_SHORTCUT_DUPLICATE:Ljava/lang/String; = "duplicate"

.field static final FORCE_ENABLE_ROTATION_PROPERTY:Ljava/lang/String; = "launcher_force_rotate"

.field static final INTENT_EXTRA_IGNORE_LAUNCH_ANIMATION:Ljava/lang/String; = "com.cyanogenmod.trebuchet.intent.extra.shortcut.INGORE_LAUNCH_ANIMATION"

.field static final MAX_HOTSEAT_SCREEN_COUNT:I = 0x3

.field static final MAX_SCREEN_COUNT:I = 0xa

.field static final MAX_WORKSPACE_SCREEN_COUNT:I = 0x7

.field private static final MENU_GROUP_WALLPAPER:I = 0x1

.field private static final MENU_HELP:I = 0x7

.field private static final MENU_LOCK_WORKSPACE:I = 0x3

.field private static final MENU_MANAGE_APPS:I = 0x4

.field private static final MENU_PREFERENCES:I = 0x5

.field private static final MENU_SYSTEM_SETTINGS:I = 0x6

.field private static final MENU_WALLPAPER_SETTINGS:I = 0x2

.field private static final NEW_APPS_ANIMATION_INACTIVE_TIMEOUT_SECONDS:I = 0xa

.field private static final PREFERENCES:Ljava/lang/String; = "launcher.preferences"

.field static final PROFILE_STARTUP:Z = false

.field private static final REQUEST_BIND_APPWIDGET:I = 0xb

.field private static final REQUEST_CREATE_APPWIDGET:I = 0x5

.field private static final REQUEST_CREATE_SHORTCUT:I = 0x1

.field private static final REQUEST_PICK_APPLICATION:I = 0x6

.field private static final REQUEST_PICK_APPWIDGET:I = 0x9

.field private static final REQUEST_PICK_SHORTCUT:I = 0x7

.field private static final REQUEST_PICK_WALLPAPER:I = 0xa

.field private static final RESTORE_SCREEN_ORIENTATION_DELAY:I = 0x1f4

.field private static final RUNTIME_STATE:Ljava/lang/String; = "launcher.state"

.field private static final RUNTIME_STATE_CURRENT_HOTSEAT_SCREEN:Ljava/lang/String; = "launcher.hotseat.current_screen"

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

.field private static final SHOW_CLING_DURATION:I = 0x226

.field private static final TAG:Ljava/lang/String; = "Trebuchet.Launcher"

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
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static sForceEnableRotation:Z

.field private static sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

.field private static sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

.field private static sPausedFromUserAction:Z

.field private static sPendingAddList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;",
            ">;"
        }
    .end annotation
.end field

.field private static sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;


# instance fields
.field private final ADVANCE_MSG:I

.field private final mAdvanceInterval:I

.field private final mAdvanceStagger:I

.field private mAppMarketIntent:Landroid/content/Intent;

.field private mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

.field private mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

.field private mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

.field private mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

.field private mAttached:Z

.field private mAutoAdvanceRunning:Z

.field private mAutoAdvanceSentTime:J

.field private mAutoAdvanceTimeLeft:J

.field private mAutoRotate:Z

.field private mBlackBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mBuildLayersRunnable:Ljava/lang/Runnable;

.field private final mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

.field private mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

.field private mDividerAnimator:Landroid/animation/AnimatorSet;

.field private mDockDivider:Landroid/view/View;

.field private mDragController:Lcom/cyanogenmod/trebuchet/DragController;

.field private mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

.field private mFolderIconBitmap:Landroid/graphics/Bitmap;

.field private mFolderIconCanvas:Landroid/graphics/Canvas;

.field private mFolderIconImageView:Landroid/widget/ImageView;

.field private mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

.field private mFullscreenMode:Z

.field private final mHandler:Landroid/os/Handler;

.field private mHideDockIconLabels:Z

.field private mHideFromAccessibilityHelper:Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;

.field private mHideIconLabels:Z

.field private mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

.field private mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mLauncherView:Landroid/view/View;

.field private mLockWorkspace:Z

.field private mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

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

.field private mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

.field private mPaused:Z

.field private mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

.field private mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

.field private mQsbDivider:Landroid/view/View;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRectForFolderAnimation:Landroid/graphics/Rect;

.field private mRestoring:Z

.field private mSavedState:Landroid/os/Bundle;

.field private mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

.field private mSharedPrefs:Landroid/content/SharedPreferences;

.field private mShowDockDivider:Z

.field private mShowHotseat:Z

.field private mShowSearchBar:Z

.field private mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

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

.field private mUserPresent:Z

.field private mVisible:Z

.field private mWaitingForResult:Z

.field private mWaitingForResume:Lcom/cyanogenmod/trebuchet/BubbleTextView;

.field private mWallpaperVisible:Z

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

.field private mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

.field private mWorkspaceBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mWorkspaceLoading:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 262
    const/4 v0, 0x0

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/Launcher;->sPausedFromUserAction:Z

    .line 270
    const/4 v0, 0x0

    sput-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    .line 272
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sFolders:Ljava/util/HashMap;

    .line 290
    new-array v0, v1, [Landroid/graphics/drawable/Drawable$ConstantState;

    sput-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    .line 291
    new-array v0, v1, [Landroid/graphics/drawable/Drawable$ConstantState;

    sput-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    .line 292
    new-array v0, v1, [Landroid/graphics/drawable/Drawable$ConstantState;

    sput-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    .line 299
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    .line 338
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    .line 341
    const-string v0, "launcher_force_rotate"

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->isPropertyEnabled(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/Launcher;->sForceEnableRotation:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 127
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 203
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 216
    new-instance v0, Lcom/cyanogenmod/trebuchet/Launcher$CloseSystemDialogsIntentReceiver;

    invoke-direct {v0, p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher$CloseSystemDialogsIntentReceiver;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/Launcher$1;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

    .line 218
    new-instance v0, Lcom/cyanogenmod/trebuchet/Launcher$AppWidgetResetObserver;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/Launcher$AppWidgetResetObserver;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetObserver:Landroid/database/ContentObserver;

    .line 232
    new-instance v0, Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 235
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 244
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceRunning:Z

    .line 250
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher$State;->NONE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 252
    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    .line 254
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceLoading:Z

    .line 256
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPaused:Z

    .line 266
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mUserPresent:Z

    .line 267
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mVisible:Z

    .line 268
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAttached:Z

    .line 274
    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    .line 277
    iput v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->ADVANCE_MSG:I

    .line 278
    const/16 v0, 0x4e20

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAdvanceInterval:I

    .line 279
    const/16 v0, 0xfa

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAdvanceStagger:I

    .line 281
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceTimeLeft:J

    .line 282
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    .line 297
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSynchronouslyBoundPages:Ljava/util/ArrayList;

    .line 307
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimatePage:I

    .line 308
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    .line 312
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    .line 316
    new-instance v0, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideFromAccessibilityHelper:Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;

    .line 330
    new-instance v0, Lcom/cyanogenmod/trebuchet/Launcher$1;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/Launcher$1;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;

    .line 1367
    new-instance v0, Lcom/cyanogenmod/trebuchet/Launcher$8;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/Launcher$8;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 1481
    new-instance v0, Lcom/cyanogenmod/trebuchet/Launcher$10;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/Launcher$10;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    .line 3544
    return-void
.end method

.method private acceptFilter()Z
    .locals 2

    .prologue
    .line 819
    const-string v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 821
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

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Workspace;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/cyanogenmod/trebuchet/Launcher;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mUserPresent:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/DragLayer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 127
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateRunning()V

    return-void
.end method

.method static synthetic access$1400(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/cyanogenmod/trebuchet/Launcher;)Ljava/lang/Runnable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/cyanogenmod/trebuchet/Launcher;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/cyanogenmod/trebuchet/Launcher;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Launcher;->sendAdvanceMessage(J)V

    return-void
.end method

.method static synthetic access$1800(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Launcher$State;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/animation/AnimatorSet;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    return-object v0
.end method

.method static synthetic access$1902(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/animation/AnimatorSet;)Landroid/animation/AnimatorSet;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    return-object p1
.end method

.method static synthetic access$2000(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/Hotseat;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/Launcher$State;)Lcom/cyanogenmod/trebuchet/Launcher$State;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->restoreShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;F)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 127
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V

    return-void
.end method

.method static synthetic access$2600(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 127
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    return-void
.end method

.method static synthetic access$2700(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->setPivotsForZoom(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 127
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    return-void
.end method

.method static synthetic access$300(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    invoke-static {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->readConfiguration(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V

    return-void
.end method

.method static synthetic access$3000(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 127
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->onAppWidgetReset()V

    return-void
.end method

.method static synthetic access$3100(Lcom/cyanogenmod/trebuchet/Launcher;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->runNewAppsAnimation(Z)V

    return-void
.end method

.method static synthetic access$3200(Lcom/cyanogenmod/trebuchet/Launcher;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$402(Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;
    .locals 0
    .parameter "x0"

    .prologue
    .line 127
    sput-object p0, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    return-object p0
.end method

.method static synthetic access$500(Lcom/cyanogenmod/trebuchet/Launcher;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 127
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->checkForLocaleChange()V

    return-void
.end method

.method static synthetic access$600(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 127
    invoke-static {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->writeConfiguration(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V

    return-void
.end method

.method static synthetic access$800(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/ItemInfo;
    .locals 1
    .parameter "x0"

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    return-object v0
.end method

.method static synthetic access$900(Lcom/cyanogenmod/trebuchet/Launcher;IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 127
    invoke-direct/range {p0 .. p6}, Lcom/cyanogenmod/trebuchet/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    return-void
.end method

.method private canRunNewAppsAnimation()Z
    .locals 6

    .prologue
    .line 3783
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/DragController;->getLastGestureUpTime()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 3784
    .local v0, diff:J
    const-wide/16 v2, 0x2710

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private checkForLocaleChange()V
    .locals 11

    .prologue
    const/4 v2, 0x0

    .line 498
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    if-nez v9, :cond_1

    .line 499
    new-instance v9, Lcom/cyanogenmod/trebuchet/Launcher$2;

    invoke-direct {v9, p0}, Lcom/cyanogenmod/trebuchet/Launcher$2;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    new-array v10, v2, [Ljava/lang/Void;

    invoke-virtual {v9, v10}, Lcom/cyanogenmod/trebuchet/Launcher$2;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 544
    :cond_0
    :goto_0
    return-void

    .line 516
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 518
    .local v0, configuration:Landroid/content/res/Configuration;
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    iget-object v6, v9, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    .line 519
    .local v6, previousLocale:Ljava/lang/String;
    iget-object v9, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v9}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    .line 521
    .local v1, locale:Ljava/lang/String;
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    iget v7, v9, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mcc:I

    .line 522
    .local v7, previousMcc:I
    iget v4, v0, Landroid/content/res/Configuration;->mcc:I

    .line 524
    .local v4, mcc:I
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    iget v8, v9, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mnc:I

    .line 525
    .local v8, previousMnc:I
    iget v5, v0, Landroid/content/res/Configuration;->mnc:I

    .line 527
    .local v5, mnc:I
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    if-ne v4, v7, :cond_2

    if-eq v5, v8, :cond_3

    :cond_2
    const/4 v2, 0x1

    .line 529
    .local v2, localeChanged:Z
    :cond_3
    if-eqz v2, :cond_0

    .line 530
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    iput-object v1, v9, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    .line 531
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    iput v4, v9, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mcc:I

    .line 532
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    iput v5, v9, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mnc:I

    .line 534
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {v9}, Lcom/cyanogenmod/trebuchet/IconCache;->flush()V

    .line 536
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sLocaleConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;

    .line 537
    .local v3, localeConfiguration:Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;
    new-instance v9, Lcom/cyanogenmod/trebuchet/Launcher$3;

    const-string v10, "WriteLocaleConfiguration"

    invoke-direct {v9, p0, v10, v3}, Lcom/cyanogenmod/trebuchet/Launcher$3;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Ljava/lang/String;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V

    invoke-virtual {v9}, Lcom/cyanogenmod/trebuchet/Launcher$3;->start()V

    goto :goto_0
.end method

.method private clearTypedText()V
    .locals 2

    .prologue
    .line 856
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 857
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 858
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 859
    return-void
.end method

.method private completeAdd(Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;)Z
    .locals 8
    .parameter "args"

    .prologue
    const/4 v5, 0x0

    .line 613
    const/4 v7, 0x0

    .line 614
    .local v7, result:Z
    iget v0, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->requestCode:I

    packed-switch v0, :pswitch_data_0

    .line 640
    :goto_0
    :pswitch_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->resetAddInfo()V

    move v0, v7

    .line 641
    :goto_1
    return v0

    .line 616
    :pswitch_1
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    iget-wide v2, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->container:J

    iget v4, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->screen:I

    iget v5, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->cellX:I

    iget v6, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->cellY:I

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/Launcher;->completeAddApplication(Landroid/content/Intent;JIII)V

    goto :goto_0

    .line 620
    :pswitch_2
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->processShortcut(Landroid/content/Intent;)V

    .line 622
    const/4 v0, 0x0

    goto :goto_1

    .line 624
    :pswitch_3
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    iget-wide v2, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->container:J

    iget v4, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->screen:I

    iget v5, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->cellX:I

    iget v6, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->cellY:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/Launcher;->completeAddShortcut(Landroid/content/Intent;JIII)V

    .line 626
    const/4 v7, 0x1

    .line 627
    goto :goto_0

    .line 629
    :pswitch_4
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    const-string v2, "appWidgetId"

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 630
    .local v1, appWidgetId:I
    iget-wide v2, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->container:J

    iget v4, p1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->screen:I

    move-object v0, p0

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 631
    const/4 v7, 0x1

    .line 632
    goto :goto_0

    .line 614
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
    .line 1285
    if-nez p6, :cond_0

    .line 1286
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    move/from16 v0, p1

    invoke-virtual {v5, v0}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object p6

    .line 1290
    :cond_0
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    move/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getCellLayout(JI)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v4

    .line 1292
    .local v4, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getMinSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v26

    .line 1293
    .local v26, minSpanXY:[I
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I

    move-result-object v28

    .line 1298
    .local v28, spanXY:[I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 1299
    .local v11, cellXY:[I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v0, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    move-object/from16 v29, v0

    .line 1300
    .local v29, touchXY:[I
    const/4 v5, 0x2

    new-array v12, v5, [I

    .line 1302
    .local v12, finalSpan:[I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    if-ltz v5, :cond_2

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    if-ltz v5, :cond_2

    .line 1303
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    aput v6, v11, v5

    .line 1304
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    aput v6, v11, v5

    .line 1305
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    aput v6, v28, v5

    .line 1306
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    aput v6, v28, v5

    .line 1307
    const/16 v25, 0x1

    .line 1320
    .local v25, foundCellSpan:Z
    :goto_0
    if-nez v25, :cond_5

    .line 1321
    const/4 v5, -0x1

    move/from16 v0, p1

    if-eq v0, v5, :cond_1

    .line 1324
    new-instance v5, Lcom/cyanogenmod/trebuchet/Launcher$7;

    const-string v6, "deleteAppWidgetId"

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v5, v0, v6, v1}, Lcom/cyanogenmod/trebuchet/Launcher$7;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Ljava/lang/String;I)V

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Launcher$7;->start()V

    .line 1330
    :cond_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->showOutOfSpaceMessage(Z)V

    .line 1365
    :goto_1
    return-void

    .line 1308
    .end local v25           #foundCellSpan:Z
    :cond_2
    if-eqz v29, :cond_4

    .line 1310
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

    invoke-virtual/range {v4 .. v12}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestVacantArea(IIIIII[I[I)[I

    move-result-object v27

    .line 1313
    .local v27, result:[I
    const/4 v5, 0x0

    const/4 v6, 0x0

    aget v6, v12, v6

    aput v6, v28, v5

    .line 1314
    const/4 v5, 0x1

    const/4 v6, 0x1

    aget v6, v12, v6

    aput v6, v28, v5

    .line 1315
    if-eqz v27, :cond_3

    const/16 v25, 0x1

    .line 1316
    .restart local v25       #foundCellSpan:Z
    :goto_2
    goto :goto_0

    .line 1315
    .end local v25           #foundCellSpan:Z
    :cond_3
    const/16 v25, 0x0

    goto :goto_2

    .line 1317
    .end local v27           #result:[I
    :cond_4
    const/4 v5, 0x0

    aget v5, v26, v5

    const/4 v6, 0x1

    aget v6, v26, v6

    invoke-virtual {v4, v11, v5, v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    move-result v25

    .restart local v25       #foundCellSpan:Z
    goto :goto_0

    .line 1335
    :cond_5
    new-instance v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;

    move-object/from16 v0, p6

    iget-object v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    move/from16 v0, p1

    invoke-direct {v14, v0, v5}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;-><init>(ILandroid/content/ComponentName;)V

    .line 1337
    .local v14, launcherInfo:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;
    const/4 v5, 0x0

    aget v5, v28, v5

    iput v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanX:I

    .line 1338
    const/4 v5, 0x1

    aget v5, v28, v5

    iput v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanY:I

    .line 1339
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    iput v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minSpanX:I

    .line 1340
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    iput v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->minSpanY:I

    .line 1342
    const/4 v5, 0x0

    aget v18, v11, v5

    const/4 v5, 0x1

    aget v19, v11, v5

    const/16 v20, 0x0

    move-object/from16 v13, p0

    move-wide/from16 v15, p2

    move/from16 v17, p4

    invoke-static/range {v13 .. v20}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIZ)V

    .line 1345
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    if-nez v5, :cond_6

    .line 1346
    if-nez p5, :cond_7

    .line 1348
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p6

    invoke-virtual {v5, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    move-result-object v5

    iput-object v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 1349
    iget-object v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    move/from16 v0, p1

    move-object/from16 v1, p6

    invoke-virtual {v5, v0, v1}, Landroid/appwidget/AppWidgetHostView;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 1355
    :goto_3
    iget-object v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {v5, v14}, Landroid/appwidget/AppWidgetHostView;->setTag(Ljava/lang/Object;)V

    .line 1356
    iget-object v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/appwidget/AppWidgetHostView;->setVisibility(I)V

    .line 1357
    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->notifyWidgetSizeChanged(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 1359
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v0, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    move-object/from16 v16, v0

    const/4 v5, 0x0

    aget v20, v11, v5

    const/4 v5, 0x1

    aget v21, v11, v5

    iget v0, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanX:I

    move/from16 v22, v0

    iget v0, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanY:I

    move/from16 v23, v0

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v24

    move-wide/from16 v17, p2

    move/from16 v19, p4

    invoke-virtual/range {v15 .. v24}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 1362
    iget-object v5, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-virtual {v0, v5, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->addWidgetToAutoAdvanceIfNeeded(Landroid/view/View;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 1364
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->resetAddInfo()V

    goto/16 :goto_1

    .line 1352
    :cond_7
    move-object/from16 v0, p5

    iput-object v0, v14, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

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
    .line 1200
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 1201
    .local v9, cellXY:[I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v0, v4, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    move-object/from16 v25, v0

    .line 1202
    .local v25, touchXY:[I
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    move/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getCellLayout(JI)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v8

    .line 1206
    .local v8, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v4, v0, v1, v6}, Lcom/cyanogenmod/trebuchet/LauncherModel;->infoFromShortcutIntent(Landroid/content/Context;Landroid/content/Intent;Landroid/graphics/Bitmap;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v23

    .line 1207
    .local v23, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    if-nez v23, :cond_1

    .line 1248
    :cond_0
    :goto_0
    return-void

    .line 1210
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->createShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v5

    .line 1213
    .local v5, view:Landroid/view/View;
    if-ltz p5, :cond_2

    if-ltz p6, :cond_2

    .line 1214
    const/4 v4, 0x0

    aput p5, v9, v4

    .line 1215
    const/4 v4, 0x1

    aput p6, v9, v4

    .line 1216
    const/16 v22, 0x1

    .line 1219
    .local v22, foundCellSpan:Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-wide/from16 v6, p2

    invoke-virtual/range {v4 .. v13}, Lcom/cyanogenmod/trebuchet/Workspace;->createUserFolderIfNecessary(Landroid/view/View;JLcom/cyanogenmod/trebuchet/CellLayout;[IFZLcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1223
    new-instance v11, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-direct {v11}, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;-><init>()V

    .line 1224
    .local v11, dragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;
    move-object/from16 v0, v23

    iput-object v0, v11, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    .line 1225
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v10, 0x0

    const/4 v12, 0x1

    invoke-virtual/range {v7 .. v12}, Lcom/cyanogenmod/trebuchet/Workspace;->addToExistingFolderIfNecessary(Lcom/cyanogenmod/trebuchet/CellLayout;[IFLcom/cyanogenmod/trebuchet/DropTarget$DragObject;Z)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1237
    .end local v11           #dragObject:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;
    :goto_1
    if-nez v22, :cond_5

    .line 1238
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->showOutOfSpaceMessage(Z)V

    goto :goto_0

    .line 1229
    .end local v22           #foundCellSpan:Z
    :cond_2
    if-eqz v25, :cond_4

    .line 1231
    const/4 v4, 0x0

    aget v13, v25, v4

    const/4 v4, 0x1

    aget v14, v25, v4

    const/4 v15, 0x1

    const/16 v16, 0x1

    move-object v12, v8

    move-object/from16 v17, v9

    invoke-virtual/range {v12 .. v17}, Lcom/cyanogenmod/trebuchet/CellLayout;->findNearestVacantArea(IIII[I)[I

    move-result-object v24

    .line 1232
    .local v24, result:[I
    if-eqz v24, :cond_3

    const/16 v22, 0x1

    .line 1233
    .restart local v22       #foundCellSpan:Z
    :goto_2
    goto :goto_1

    .line 1232
    .end local v22           #foundCellSpan:Z
    :cond_3
    const/16 v22, 0x0

    goto :goto_2

    .line 1234
    .end local v24           #result:[I
    :cond_4
    const/4 v4, 0x1

    const/4 v6, 0x1

    invoke-virtual {v8, v9, v4, v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    move-result v22

    .restart local v22       #foundCellSpan:Z
    goto :goto_1

    .line 1242
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

    invoke-static/range {v12 .. v19}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIZ)V

    .line 1244
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    if-nez v4, :cond_0

    .line 1245
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v4, 0x0

    aget v17, v9, v4

    const/4 v4, 0x1

    aget v18, v9, v4

    const/16 v19, 0x1

    const/16 v20, 0x1

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v21

    move-object v13, v5

    move-wide/from16 v14, p2

    move/from16 v16, p4

    invoke-virtual/range {v12 .. v21}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    goto/16 :goto_0
.end method

.method private completeTwoStageWidgetDrop(II)V
    .locals 9
    .parameter "resultCode"
    .parameter "appWidgetId"

    .prologue
    .line 702
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 704
    .local v2, cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;
    const/4 v4, 0x0

    .line 705
    .local v4, onCompleteRunnable:Ljava/lang/Runnable;
    const/4 v5, 0x0

    .line 707
    .local v5, animationType:I
    const/4 v6, 0x0

    .line 708
    .local v6, boundWidget:Landroid/appwidget/AppWidgetHostView;
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    .line 709
    const/4 v5, 0x3

    .line 710
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {v0, p0, p2, v1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    move-result-object v8

    .line 712
    .local v8, layout:Landroid/appwidget/AppWidgetHostView;
    move-object v6, v8

    .line 713
    new-instance v4, Lcom/cyanogenmod/trebuchet/Launcher$4;

    .end local v4           #onCompleteRunnable:Ljava/lang/Runnable;
    invoke-direct {v4, p0, p2, v8}, Lcom/cyanogenmod/trebuchet/Launcher$4;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;ILandroid/appwidget/AppWidgetHostView;)V

    .line 730
    .end local v8           #layout:Landroid/appwidget/AppWidgetHostView;
    .restart local v4       #onCompleteRunnable:Ljava/lang/Runnable;
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->getAnimatedView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 731
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/DragLayer;->getAnimatedView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/DragView;

    const/4 v7, 0x1

    invoke-virtual/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/Workspace;->animateWidgetDrop(Lcom/cyanogenmod/trebuchet/ItemInfo;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/DragView;Ljava/lang/Runnable;ILandroid/view/View;Z)V

    .line 740
    :cond_1
    :goto_1
    return-void

    .line 721
    :cond_2
    if-nez p1, :cond_0

    .line 722
    const/4 v5, 0x4

    .line 723
    new-instance v4, Lcom/cyanogenmod/trebuchet/Launcher$5;

    .end local v4           #onCompleteRunnable:Ljava/lang/Runnable;
    invoke-direct {v4, p0}, Lcom/cyanogenmod/trebuchet/Launcher$5;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .restart local v4       #onCompleteRunnable:Ljava/lang/Runnable;
    goto :goto_0

    .line 736
    :cond_3
    if-eqz v4, :cond_1

    .line 737
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    goto :goto_1
.end method

.method private copyFolderIconToImage(Lcom/cyanogenmod/trebuchet/FolderIcon;)V
    .locals 7
    .parameter "fi"

    .prologue
    .line 2412
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getMeasuredWidth()I

    move-result v3

    .line 2413
    .local v3, width:I
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getMeasuredHeight()I

    move-result v0

    .line 2416
    .local v0, height:I
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    if-nez v4, :cond_0

    .line 2417
    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    .line 2419
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v4, v3, :cond_1

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-eq v4, v0, :cond_2

    .line 2421
    :cond_1
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v0, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    .line 2422
    new-instance v4, Landroid/graphics/Canvas;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v4, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconCanvas:Landroid/graphics/Canvas;

    .line 2426
    :cond_2
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    instance-of v4, v4, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    if-eqz v4, :cond_6

    .line 2427
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    .line 2434
    .local v1, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    :goto_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    invoke-virtual {v4, p1, v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    move-result v2

    .line 2435
    .local v2, scale:F
    const/4 v4, 0x1

    iput-boolean v4, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->customPosition:Z

    .line 2436
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iput v4, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    .line 2437
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRectForFolderAnimation:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iput v4, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    .line 2438
    int-to-float v4, v3

    mul-float/2addr v4, v2

    float-to-int v4, v4

    iput v4, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->width:I

    .line 2439
    int-to-float v4, v0

    mul-float/2addr v4, v2

    float-to-int v4, v4

    iput v4, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->height:I

    .line 2441
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconCanvas:Landroid/graphics/Canvas;

    const/4 v5, 0x0

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 2442
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p1, v4}, Lcom/cyanogenmod/trebuchet/FolderIcon;->draw(Landroid/graphics/Canvas;)V

    .line 2443
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 2444
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 2445
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Folder;->getPivotXForIconAnimation()F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setPivotX(F)V

    .line 2446
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Folder;->getPivotYForIconAnimation()F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setPivotY(F)V

    .line 2450
    :cond_3
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->indexOfChild(Landroid/view/View;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_4

    .line 2451
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

    .line 2453
    :cond_4
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v5, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2454
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 2455
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Folder;->bringToFront()V

    .line 2457
    :cond_5
    return-void

    .line 2429
    .end local v1           #lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    .end local v2           #scale:F
    :cond_6
    new-instance v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    invoke-direct {v1, v3, v0}, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;-><init>(II)V

    .restart local v1       #lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    goto/16 :goto_0
.end method

.method private dismissCling(Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;I)V
    .locals 5
    .parameter "cling"
    .parameter "flag"
    .parameter "duration"

    .prologue
    .line 4052
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Cling;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    .line 4053
    const-string v1, "alpha"

    const/4 v2, 0x1

    new-array v2, v2, [F

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput v4, v2, v3

    invoke-static {p1, v1, v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 4054
    .local v0, anim:Landroid/animation/ObjectAnimator;
    int-to-long v1, p3

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 4055
    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$31;

    invoke-direct {v1, p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Launcher$31;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 4069
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 4070
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideFromAccessibilityHelper:Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->restoreImportantForAccessibility(Landroid/view/View;)V

    .line 4072
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
    .line 2714
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 2715
    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    invoke-interface {v0, p0, p2, p3}, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;->onLauncherTransitionEnd(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V

    .line 2719
    :cond_0
    const/high16 v0, 0x3f80

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V

    .line 2720
    return-void
.end method

.method private dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V
    .locals 1
    .parameter "v"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 2693
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    if-eqz v0, :cond_0

    .line 2694
    check-cast p1, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    .end local p1
    invoke-interface {p1, p0, p2, p3}, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;->onLauncherTransitionPrepare(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V

    .line 2696
    :cond_0
    return-void
.end method

.method private dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V
    .locals 1
    .parameter "v"
    .parameter "animated"
    .parameter "toWorkspace"

    .prologue
    .line 2699
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 2700
    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    invoke-interface {v0, p0, p2, p3}, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;->onLauncherTransitionStart(Lcom/cyanogenmod/trebuchet/Launcher;ZZ)V

    .line 2704
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStep(Landroid/view/View;F)V

    .line 2705
    return-void
.end method

.method private dispatchOnLauncherTransitionStep(Landroid/view/View;F)V
    .locals 1
    .parameter "v"
    .parameter "t"

    .prologue
    .line 2708
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    if-eqz v0, :cond_0

    .line 2709
    check-cast p1, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;

    .end local p1
    invoke-interface {p1, p0, p2}, Lcom/cyanogenmod/trebuchet/LauncherTransitionable;->onLauncherTransitionStep(Lcom/cyanogenmod/trebuchet/Launcher;F)V

    .line 2711
    :cond_0
    return-void
.end method

.method public static dumpDebugLogsToConsole()V
    .locals 5

    .prologue
    .line 4215
    const-string v2, "Trebuchet.Launcher"

    const-string v3, ""

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4216
    const-string v2, "Trebuchet.Launcher"

    const-string v3, "*********************"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4217
    const-string v2, "Trebuchet.Launcher"

    const-string v3, "Launcher debug logs: "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4218
    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 4219
    .local v0, dumpLog:Ljava/lang/String;
    const-string v2, "Trebuchet.Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 4221
    .end local v0           #dumpLog:Ljava/lang/String;
    :cond_0
    const-string v2, "Trebuchet.Launcher"

    const-string v3, "*********************"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4222
    const-string v2, "Trebuchet.Launcher"

    const-string v3, ""

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4223
    return-void
.end method

.method private getCurrentOrientationIndexForGlobalIcons()I
    .locals 1

    .prologue
    .line 3262
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getCurrentOrientation()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 3266
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 3264
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 3262
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
    .line 3272
    :try_start_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 3274
    .local v4, packageManager:Landroid/content/pm/PackageManager;
    const/16 v6, 0x80

    invoke-virtual {v4, p1, v6}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v6

    iget-object v2, v6, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 3276
    .local v2, metaData:Landroid/os/Bundle;
    if-eqz v2, :cond_0

    .line 3277
    invoke-virtual {v2, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 3278
    .local v1, iconResId:I
    if-eqz v1, :cond_0

    .line 3279
    invoke-virtual {v4, p1}, Landroid/content/pm/PackageManager;->getResourcesForActivity(Landroid/content/ComponentName;)Landroid/content/res/Resources;

    move-result-object v5

    .line 3280
    .local v5, res:Landroid/content/res/Resources;
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v6

    .line 3292
    .end local v1           #iconResId:I
    .end local v2           #metaData:Landroid/os/Bundle;
    .end local v4           #packageManager:Landroid/content/pm/PackageManager;
    .end local v5           #res:Landroid/content/res/Resources;
    :goto_0
    return-object v6

    .line 3283
    :catch_0
    move-exception v0

    .line 3285
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v6, "Trebuchet.Launcher"

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

    .line 3292
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    :goto_1
    const/4 v6, 0x0

    goto :goto_0

    .line 3287
    :catch_1
    move-exception v3

    .line 3289
    .local v3, nfe:Landroid/content/res/Resources$NotFoundException;
    const-string v6, "Trebuchet.Launcher"

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
    .line 1265
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iget v1, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    iget v2, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

    move-result-object v0

    return-object v0
.end method

.method static getMinSpanForWidget(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)[I
    .locals 3
    .parameter "context"
    .parameter "info"

    .prologue
    .line 1273
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    iget v1, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minResizeWidth:I

    iget v2, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minResizeHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

    move-result-object v0

    return-object v0
.end method

.method static getSpanForWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)[I
    .locals 3
    .parameter "context"
    .parameter "info"

    .prologue
    .line 1261
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iget v1, p1, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    iget v2, p1, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

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

    .line 1252
    invoke-static {p0, p1, v5}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v0

    .line 1255
    .local v0, padding:Landroid/graphics/Rect;
    iget v3, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, p2

    iget v4, v0, Landroid/graphics/Rect;->right:I

    add-int v2, v3, v4

    .line 1256
    .local v2, requiredWidth:I
    iget v3, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v3, p3

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    add-int v1, v3, v4

    .line 1257
    .local v1, requiredHeight:I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v3, v2, v1, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->rectToCell(Landroid/content/res/Resources;II[I)[I

    move-result-object v3

    return-object v3
.end method

.method static getSpanForWidget(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)[I
    .locals 3
    .parameter "context"
    .parameter "info"

    .prologue
    .line 1269
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    iget v1, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minWidth:I

    iget v2, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minHeight:I

    invoke-static {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getSpanForWidget(Landroid/content/Context;Landroid/content/ComponentName;II)[I

    move-result-object v0

    return-object v0
.end method

.method private getTypedText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 852
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private growAndFadeOutFolderIcon(Lcom/cyanogenmod/trebuchet/FolderIcon;)V
    .locals 13
    .parameter "fi"

    .prologue
    const/high16 v10, 0x3fc0

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 2460
    if-nez p1, :cond_0

    .line 2480
    :goto_0
    return-void

    .line 2461
    :cond_0
    const-string v7, "alpha"

    new-array v8, v12, [F

    const/4 v9, 0x0

    aput v9, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 2462
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v7, "scaleX"

    new-array v8, v12, [F

    aput v10, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    .line 2463
    .local v5, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v7, "scaleY"

    new-array v8, v12, [F

    aput v10, v8, v11

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v6

    .line 2465
    .local v6, scaleY:Landroid/animation/PropertyValuesHolder;
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 2466
    .local v2, info:Lcom/cyanogenmod/trebuchet/FolderInfo;
    iget-wide v7, v2, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    const-wide/16 v9, -0x65

    cmp-long v7, v7, v9

    if-nez v7, :cond_1

    .line 2467
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2468
    .local v1, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 2469
    .local v3, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    iget v7, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v8, v3, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    invoke-virtual {v1, v7, v8}, Lcom/cyanogenmod/trebuchet/CellLayout;->setFolderLeaveBehindCell(II)V

    .line 2473
    .end local v1           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v3           #lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_1
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->copyFolderIconToImage(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    .line 2474
    const/4 v7, 0x4

    invoke-virtual {p1, v7}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setVisibility(I)V

    .line 2476
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    const/4 v8, 0x3

    new-array v8, v8, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v8, v11

    aput-object v5, v8, v12

    const/4 v9, 0x2

    aput-object v6, v8, v9

    invoke-static {v7, v8}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 2478
    .local v4, oa:Landroid/animation/ObjectAnimator;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0c0013

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {v4, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 2479
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0
.end method

.method private handleFolderClick(Lcom/cyanogenmod/trebuchet/FolderIcon;)V
    .locals 6
    .parameter "folderIcon"

    .prologue
    .line 2374
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolderInfo()Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v1

    .line 2375
    .local v1, info:Lcom/cyanogenmod/trebuchet/FolderInfo;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v3, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getFolderForTag(Ljava/lang/Object;)Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v2

    .line 2379
    .local v2, openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    iget-boolean v3, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    if-eqz v3, :cond_0

    if-nez v2, :cond_0

    .line 2380
    const-string v3, "Trebuchet.Launcher"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Folder info marked as open, but associated folder is not open. Screen: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2382
    const/4 v3, 0x0

    iput-boolean v3, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    .line 2385
    :cond_0
    iget-boolean v3, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    if-nez v3, :cond_2

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Folder;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_2

    .line 2387
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    .line 2389
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->openFolder(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    .line 2405
    :cond_1
    :goto_0
    return-void

    .line 2393
    :cond_2
    if-eqz v2, :cond_1

    .line 2394
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v3, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getPageForView(Landroid/view/View;)I

    move-result v0

    .line 2396
    .local v0, folderScreen:I
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder(Lcom/cyanogenmod/trebuchet/Folder;)V

    .line 2397
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 2399
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    .line 2401
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->openFolder(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    goto :goto_0
.end method

.method private hideAppsCustomizeHelper(Lcom/cyanogenmod/trebuchet/Launcher$State;ZLjava/lang/Runnable;)V
    .locals 19
    .parameter "toState"
    .parameter "animated"
    .parameter "onCompleteRunnable"

    .prologue
    .line 2948
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    if-eqz v2, :cond_0

    .line 2949
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->cancel()V

    .line 2950
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2952
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 2954
    .local v11, res:Landroid/content/res/Resources;
    const v2, 0x7f0c0005

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    .line 2955
    .local v9, duration:I
    const v2, 0x7f0c0008

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    .line 2957
    .local v10, fadeOutDuration:I
    const v2, 0x7f0c0006

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v13, v2

    .line 2959
    .local v13, scaleFactor:F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    .line 2960
    .local v4, fromView:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 2961
    .local v6, toView:Landroid/view/View;
    const/16 v16, 0x0

    .line 2963
    .local v16, workspaceAnim:Landroid/animation/Animator;
    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_3

    .line 2964
    const v2, 0x7f0c000a

    invoke-virtual {v11, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v14

    .line 2965
    .local v14, stagger:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Workspace$State;->NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move/from16 v0, p2

    invoke-virtual {v2, v3, v0, v14}, Lcom/cyanogenmod/trebuchet/Workspace;->getChangeStateAnimation(Lcom/cyanogenmod/trebuchet/Workspace$State;ZI)Landroid/animation/Animator;

    move-result-object v16

    .line 2972
    .end local v14           #stagger:I
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->setPivotsForZoom(Landroid/view/View;)V

    .line 2973
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 2974
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->showHotseat(Z)V

    .line 2975
    if-eqz p2, :cond_4

    .line 2976
    new-instance v12, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    invoke-direct {v12, v4}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 2978
    .local v12, scaleAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    invoke-virtual {v12, v13}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->scaleX(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v13}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->scaleY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v2

    int-to-long v0, v9

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    invoke-virtual {v2, v0, v1}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v2

    new-instance v3, Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;

    invoke-direct {v3}, Lcom/cyanogenmod/trebuchet/Workspace$ZoomInInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2983
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

    .line 2986
    .local v8, alphaAnim:Landroid/animation/ObjectAnimator;
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v8, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2987
    new-instance v2, Lcom/cyanogenmod/trebuchet/Launcher$19;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v4, v6}, Lcom/cyanogenmod/trebuchet/Launcher$19;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {v8, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 2996
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2998
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 2999
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3000
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->pauseScrolling()V

    .line 3002
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v17, v0

    new-instance v2, Lcom/cyanogenmod/trebuchet/Launcher$20;

    move-object/from16 v3, p0

    move/from16 v5, p2

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/Launcher$20;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;ZLandroid/view/View;Ljava/lang/Runnable;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 3020
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/animation/Animator;

    const/4 v5, 0x0

    aput-object v12, v3, v5

    const/4 v5, 0x1

    aput-object v8, v3, v5

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 3021
    if-eqz v16, :cond_2

    .line 3022
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 3024
    :cond_2
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3025
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3026
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 3027
    .local v15, stateAnimation:Landroid/animation/Animator;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    new-instance v3, Lcom/cyanogenmod/trebuchet/Launcher$21;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v15}, Lcom/cyanogenmod/trebuchet/Launcher$21;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/animation/Animator;)V

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->post(Ljava/lang/Runnable;)Z

    .line 3044
    .end local v8           #alphaAnim:Landroid/animation/ObjectAnimator;
    .end local v12           #scaleAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    .end local v15           #stateAnimation:Landroid/animation/Animator;
    :goto_1
    return-void

    .line 2967
    :cond_3
    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Launcher$State;

    move-object/from16 v0, p1

    if-ne v0, v2, :cond_1

    .line 2968
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move/from16 v0, p2

    invoke-virtual {v2, v3, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChangeStateAnimation(Lcom/cyanogenmod/trebuchet/Workspace$State;Z)Landroid/animation/Animator;

    move-result-object v16

    goto/16 :goto_0

    .line 3035
    :cond_4
    const/16 v2, 0x8

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 3036
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3037
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3038
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    .line 3039
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 3040
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 3041
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    .line 3042
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->hideScrollingIndicator(Z)V

    goto :goto_1

    .line 2983
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x80t 0x3ft
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private initCling(I[IZI)Lcom/cyanogenmod/trebuchet/Cling;
    .locals 6
    .parameter "clingId"
    .parameter "positionData"
    .parameter "animate"
    .parameter "delay"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v5, 0x3f80

    .line 4019
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Cling;

    .line 4020
    .local v0, cling:Lcom/cyanogenmod/trebuchet/Cling;
    if-eqz v0, :cond_0

    .line 4021
    invoke-virtual {v0, p0, p2}, Lcom/cyanogenmod/trebuchet/Cling;->init(Lcom/cyanogenmod/trebuchet/Launcher;[I)V

    .line 4022
    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Cling;->setVisibility(I)V

    .line 4023
    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/cyanogenmod/trebuchet/Cling;->setLayerType(ILandroid/graphics/Paint;)V

    .line 4024
    if-eqz p3, :cond_1

    .line 4025
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Cling;->buildLayer()V

    .line 4026
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/Cling;->setAlpha(F)V

    .line 4027
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Cling;->animate()Landroid/view/ViewPropertyAnimator;

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

    .line 4036
    :goto_0
    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Cling;->setFocusableInTouchMode(Z)V

    .line 4037
    new-instance v3, Lcom/cyanogenmod/trebuchet/Launcher$30;

    invoke-direct {v3, p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher$30;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/Cling;)V

    invoke-virtual {v0, v3}, Lcom/cyanogenmod/trebuchet/Cling;->post(Ljava/lang/Runnable;)Z

    .line 4043
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideFromAccessibilityHelper:Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    const v5, 0x7f070012

    if-ne p1, v5, :cond_2

    :goto_1
    invoke-virtual {v3, v4, v1}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->setImportantForAccessibilityToNo(Landroid/view/View;Z)V

    .line 4046
    :cond_0
    return-object v0

    .line 4034
    :cond_1
    invoke-virtual {v0, v5}, Lcom/cyanogenmod/trebuchet/Cling;->setAlpha(F)V

    goto :goto_0

    :cond_2
    move v1, v2

    .line 4043
    goto :goto_1
.end method

.method private static intToState(I)Lcom/cyanogenmod/trebuchet/Launcher$State;
    .locals 7
    .parameter "stateOrdinal"

    .prologue
    .line 866
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 867
    .local v3, state:Lcom/cyanogenmod/trebuchet/Launcher$State;
    invoke-static {}, Lcom/cyanogenmod/trebuchet/Launcher$State;->values()[Lcom/cyanogenmod/trebuchet/Launcher$State;

    move-result-object v5

    .line 868
    .local v5, stateValues:[Lcom/cyanogenmod/trebuchet/Launcher$State;
    move-object v0, v5

    .local v0, arr$:[Lcom/cyanogenmod/trebuchet/Launcher$State;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 869
    .local v4, stateValue:Lcom/cyanogenmod/trebuchet/Launcher$State;
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Launcher$State;->ordinal()I

    move-result v6

    if-ne v6, p0, :cond_1

    .line 870
    move-object v3, v4

    .line 874
    .end local v4           #stateValue:Lcom/cyanogenmod/trebuchet/Launcher$State;
    :cond_0
    return-object v3

    .line 868
    .restart local v4       #stateValue:Lcom/cyanogenmod/trebuchet/Launcher$State;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V
    .locals 3
    .parameter "container"
    .parameter "button"

    .prologue
    .line 3354
    instance-of v2, p1, Lcom/cyanogenmod/trebuchet/HolographicLinearLayout;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 3355
    check-cast v0, Lcom/cyanogenmod/trebuchet/HolographicLinearLayout;

    .line 3356
    .local v0, layout:Lcom/cyanogenmod/trebuchet/HolographicLinearLayout;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/HolographicLinearLayout;->invalidatePressedFocusedStates()V

    .line 3361
    .end local v0           #layout:Lcom/cyanogenmod/trebuchet/HolographicLinearLayout;
    :cond_0
    :goto_0
    return-void

    .line 3357
    :cond_1
    instance-of v2, p2, Lcom/cyanogenmod/trebuchet/HolographicImageView;

    if-eqz v2, :cond_0

    move-object v1, p2

    .line 3358
    check-cast v1, Lcom/cyanogenmod/trebuchet/HolographicImageView;

    .line 3359
    .local v1, view:Lcom/cyanogenmod/trebuchet/HolographicImageView;
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/HolographicImageView;->invalidatePressedFocusedStates()V

    goto :goto_0
.end method

.method private isClingsEnabled()Z
    .locals 1

    .prologue
    .line 4014
    invoke-static {}, Landroid/app/ActivityManager;->isRunningInTestHarness()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isPropertyEnabled(Ljava/lang/String;)Z
    .locals 1
    .parameter "propertyName"

    .prologue
    .line 353
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

    .line 3953
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 3954
    .local v0, d:Landroid/view/Display;
    const/4 v2, 0x2

    .line 3955
    .local v2, naturalOri:I
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 3969
    :goto_0
    const/4 v5, 0x4

    new-array v3, v5, [I

    fill-array-data v3, :array_0

    .line 3977
    .local v3, oriMap:[I
    const/4 v1, 0x0

    .line 3978
    .local v1, indexOffset:I
    if-ne v2, v4, :cond_0

    .line 3979
    const/4 v1, 0x1

    .line 3981
    :cond_0
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    add-int/2addr v4, v1

    rem-int/lit8 v4, v4, 0x4

    aget v4, v3, v4

    return v4

    .line 3959
    .end local v1           #indexOffset:I
    .end local v3           #oriMap:[I
    :pswitch_0
    move v2, p1

    .line 3960
    goto :goto_0

    .line 3964
    :pswitch_1
    if-ne p1, v4, :cond_1

    const/4 v2, 0x1

    :goto_1
    goto :goto_0

    :cond_1
    move v2, v4

    goto :goto_1

    .line 3955
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 3969
    :array_0
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
        0x9t 0x0t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private onAppWidgetReset()V
    .locals 1

    .prologue
    .line 2116
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    if-eqz v0, :cond_0

    .line 2117
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->startListening()V

    .line 2119
    :cond_0
    return-void
.end method

.method private static readConfiguration(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    .locals 4
    .parameter "context"
    .parameter "configuration"

    .prologue
    .line 553
    const/4 v0, 0x0

    .line 555
    .local v0, in:Ljava/io/DataInputStream;
    :try_start_0
    new-instance v1, Ljava/io/DataInputStream;

    const-string v2, "launcher.preferences"

    invoke-virtual {p0, v2}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 556
    .end local v0           #in:Ljava/io/DataInputStream;
    .local v1, in:Ljava/io/DataInputStream;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    .line 557
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    iput v2, p1, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mcc:I

    .line 558
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    iput v2, p1, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mnc:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    .line 564
    if-eqz v1, :cond_2

    .line 566
    :try_start_2
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v0, v1

    .line 572
    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v0       #in:Ljava/io/DataInputStream;
    :cond_0
    :goto_0
    return-void

    .line 567
    .end local v0           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    :catch_0
    move-exception v2

    move-object v0, v1

    .line 569
    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v0       #in:Ljava/io/DataInputStream;
    goto :goto_0

    .line 559
    :catch_1
    move-exception v2

    .line 564
    :goto_1
    if-eqz v0, :cond_0

    .line 566
    :try_start_3
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 567
    :catch_2
    move-exception v2

    goto :goto_0

    .line 561
    :catch_3
    move-exception v2

    .line 564
    :goto_2
    if-eqz v0, :cond_0

    .line 566
    :try_start_4
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_0

    .line 567
    :catch_4
    move-exception v2

    goto :goto_0

    .line 564
    :catchall_0
    move-exception v2

    :goto_3
    if-eqz v0, :cond_1

    .line 566
    :try_start_5
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 569
    :cond_1
    :goto_4
    throw v2

    .line 567
    :catch_5
    move-exception v3

    goto :goto_4

    .line 564
    .end local v0           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v0       #in:Ljava/io/DataInputStream;
    goto :goto_3

    .line 561
    .end local v0           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    :catch_6
    move-exception v2

    move-object v0, v1

    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v0       #in:Ljava/io/DataInputStream;
    goto :goto_2

    .line 559
    .end local v0           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    :catch_7
    move-exception v2

    move-object v0, v1

    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v0       #in:Ljava/io/DataInputStream;
    goto :goto_1

    .end local v0           #in:Ljava/io/DataInputStream;
    .restart local v1       #in:Ljava/io/DataInputStream;
    :cond_2
    move-object v0, v1

    .end local v1           #in:Ljava/io/DataInputStream;
    .restart local v0       #in:Ljava/io/DataInputStream;
    goto :goto_0
.end method

.method private registerContentObservers()V
    .locals 4

    .prologue
    .line 2065
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 2066
    .local v0, resolver:Landroid/content/ContentResolver;
    sget-object v1, Lcom/cyanogenmod/trebuchet/LauncherProvider;->CONTENT_APPWIDGET_RESET_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 2068
    return-void
.end method

.method private removeCling(I)V
    .locals 4
    .parameter "id"

    .prologue
    .line 4075
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 4076
    .local v0, cling:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 4077
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 4078
    .local v1, parent:Landroid/view/ViewGroup;
    new-instance v2, Lcom/cyanogenmod/trebuchet/Launcher$32;

    invoke-direct {v2, p0, v1, v0}, Lcom/cyanogenmod/trebuchet/Launcher$32;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/ViewGroup;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 4084
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideFromAccessibilityHelper:Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/HideFromAccessibilityHelper;->restoreImportantForAccessibility(Landroid/view/View;)V

    .line 4086
    .end local v1           #parent:Landroid/view/ViewGroup;
    :cond_0
    return-void
.end method

.method private resetAddInfo()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 1881
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const-wide/16 v1, -0x1

    iput-wide v1, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 1882
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 1883
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput v3, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 1884
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput v3, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 1885
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput v3, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    .line 1886
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    .line 1887
    return-void
.end method

.method private restoreShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 29
    .parameter "info"

    .prologue
    .line 1112
    invoke-virtual/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/Launcher;->createShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v6

    .line 1113
    .local v6, view:Landroid/view/View;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-object/from16 v19, v0

    .line 1114
    .local v19, folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    move-wide/from16 v25, v0

    const-wide/16 v27, 0x0

    cmp-long v3, v25, v27

    if-ltz v3, :cond_3

    if-eqz v19, :cond_3

    .line 1117
    move-object/from16 v0, v19

    iget-wide v0, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    move-wide/from16 v25, v0

    move-object/from16 v0, v19

    iget v3, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    move-object/from16 v0, p0

    move-wide/from16 v1, v25

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getCellLayout(JI)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v4

    .line 1118
    .local v4, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    move-object/from16 v0, v19

    iget v3, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    move-object/from16 v0, v19

    iget v5, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I

    invoke-virtual {v4, v3, v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildAt(II)Landroid/view/View;

    move-result-object v24

    .line 1119
    .local v24, v:Landroid/view/View;
    if-nez v24, :cond_0

    .line 1190
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v24           #v:Landroid/view/View;
    :goto_0
    return-void

    .line 1123
    .restart local v4       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v24       #v:Landroid/view/View;
    :cond_0
    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v3, :cond_1

    .line 1125
    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 1127
    .local v23, target:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeView(Landroid/view/View;)V

    .line 1130
    move-object/from16 v0, v19

    iget-wide v5, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->container:J

    move-object/from16 v0, v19

    iget v7, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->screen:I

    move-object/from16 v0, v19

    iget v8, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellX:I

    move-object/from16 v0, v19

    iget v9, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->cellY:I

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v9}, Lcom/cyanogenmod/trebuchet/Launcher;->addFolder(Lcom/cyanogenmod/trebuchet/CellLayout;JIII)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v17

    .line 1133
    .local v17, fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    move-object/from16 v0, p1

    iget v10, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 1134
    .local v10, cellX:I
    move-object/from16 v0, p1

    iget v11, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 1135
    .local v11, cellY:I
    const/4 v3, -0x1

    move-object/from16 v0, p1

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 1136
    const/4 v3, -0x1

    move-object/from16 v0, p1

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 1137
    const/4 v3, -0x1

    move-object/from16 v0, v23

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 1138
    const/4 v3, -0x1

    move-object/from16 v0, v23

    iput v3, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 1139
    if-nez v10, :cond_2

    if-nez v11, :cond_2

    .line 1140
    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 1141
    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 1189
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v10           #cellX:I
    .end local v11           #cellY:I
    .end local v17           #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .end local v23           #target:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v24           #v:Landroid/view/View;
    :cond_1
    :goto_1
    const/4 v3, 0x0

    move-object/from16 v0, p1

    iput-object v3, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    goto :goto_0

    .line 1143
    .restart local v4       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v10       #cellX:I
    .restart local v11       #cellY:I
    .restart local v17       #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .restart local v23       #target:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .restart local v24       #v:Landroid/view/View;
    :cond_2
    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 1144
    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    goto :goto_1

    .line 1147
    .end local v4           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v10           #cellX:I
    .end local v11           #cellY:I
    .end local v17           #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .end local v23           #target:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v24           #v:Landroid/view/View;
    :cond_3
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    move-wide/from16 v25, v0

    const-wide/16 v27, 0x0

    cmp-long v3, v25, v27

    if-ltz v3, :cond_8

    .line 1149
    const/16 v18, 0x0

    .line 1153
    .local v18, folderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getAllShortcutAndWidgetContainers()Ljava/util/ArrayList;

    move-result-object v15

    .line 1155
    .local v15, allSwc:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, i$:Ljava/util/Iterator;
    :cond_4
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 1156
    .local v22, swc:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual/range {v22 .. v22}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v16

    .line 1157
    .local v16, cc:I
    const/16 v20, 0x0

    .local v20, i:I
    :goto_2
    move/from16 v0, v20

    move/from16 v1, v16

    if-ge v0, v1, :cond_5

    .line 1158
    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildAt(I)Landroid/view/View;

    move-result-object v24

    .line 1159
    .restart local v24       #v:Landroid/view/View;
    move-object/from16 v0, v24

    instance-of v3, v0, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v3, :cond_7

    .line 1160
    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 1161
    .local v17, fi:Lcom/cyanogenmod/trebuchet/FolderInfo;
    if-eqz v17, :cond_7

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    move-wide/from16 v25, v0

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    move-wide/from16 v27, v0

    cmp-long v3, v25, v27

    if-nez v3, :cond_7

    move-object/from16 v18, v24

    .line 1162
    check-cast v18, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 1167
    .end local v17           #fi:Lcom/cyanogenmod/trebuchet/FolderInfo;
    .end local v24           #v:Landroid/view/View;
    :cond_5
    if-eqz v18, :cond_4

    .line 1172
    .end local v16           #cc:I
    .end local v20           #i:I
    .end local v22           #swc:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_6
    if-eqz v18, :cond_1

    .line 1173
    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->addItem(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    goto :goto_1

    .line 1157
    .restart local v16       #cc:I
    .restart local v20       #i:I
    .restart local v22       #swc:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .restart local v24       #v:Landroid/view/View;
    :cond_7
    add-int/lit8 v20, v20, 0x1

    goto :goto_2

    .line 1178
    .end local v15           #allSwc:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;>;"
    .end local v16           #cc:I
    .end local v18           #folderIcon:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .end local v20           #i:I
    .end local v21           #i$:Ljava/util/Iterator;
    .end local v22           #swc:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .end local v24           #v:Landroid/view/View;
    :cond_8
    move-object/from16 v0, p1

    iget-wide v7, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    .line 1179
    .local v7, container:J
    move-object/from16 v0, p1

    iget v9, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->screen:I

    .line 1180
    .local v9, screen:I
    move-object/from16 v0, p1

    iget v10, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    .line 1181
    .restart local v10       #cellX:I
    move-object/from16 v0, p1

    iget v11, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    .line 1182
    .restart local v11       #cellY:I
    move-object/from16 v0, p1

    iget v12, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanX:I

    .line 1183
    .local v12, spanX:I
    move-object/from16 v0, p1

    iget v13, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanY:I

    .line 1184
    .local v13, spanY:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v14

    invoke-virtual/range {v5 .. v14}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    goto/16 :goto_1
.end method

.method private restoreState(Landroid/os/Bundle;)V
    .locals 14
    .parameter "savedState"

    .prologue
    .line 883
    if-nez p1, :cond_1

    .line 938
    :cond_0
    :goto_0
    return-void

    .line 887
    :cond_1
    const-string v11, "launcher.state"

    sget-object v12, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    invoke-virtual {v12}, Lcom/cyanogenmod/trebuchet/Launcher$State;->ordinal()I

    move-result v12

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v11

    invoke-static {v11}, Lcom/cyanogenmod/trebuchet/Launcher;->intToState(I)Lcom/cyanogenmod/trebuchet/Launcher$State;

    move-result-object v10

    .line 888
    .local v10, state:Lcom/cyanogenmod/trebuchet/Launcher$State;
    sget-object v11, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v10, v11, :cond_2

    .line 889
    sget-object v11, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 892
    :cond_2
    const-string v11, "launcher.current_screen"

    const/4 v12, -0x1

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 893
    .local v3, currentScreen:I
    const/4 v11, -0x1

    if-le v3, v11, :cond_3

    .line 894
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v11, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->setCurrentPage(I)V

    .line 896
    :cond_3
    const-string v11, "launcher.hotseat.current_screen"

    const/4 v12, -0x1

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 897
    .local v1, currentHotseatScreen:I
    const/4 v11, -0x1

    if-le v1, v11, :cond_4

    .line 898
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    iget-object v12, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v12, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/Hotseat;->setCurrentPage(I)V

    .line 901
    :cond_4
    const-string v11, "launcher.add_container"

    const-wide/16 v12, -0x1

    invoke-virtual {p1, v11, v12, v13}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 902
    .local v6, pendingAddContainer:J
    const-string v11, "launcher.add_screen"

    const/4 v12, -0x1

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 904
    .local v8, pendingAddScreen:I
    const-wide/16 v11, -0x1

    cmp-long v11, v6, v11

    if-eqz v11, :cond_5

    const/4 v11, -0x1

    if-le v8, v11, :cond_5

    .line 905
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-wide v6, v11, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 906
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput v8, v11, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 907
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const-string v12, "launcher.add_cell_x"

    invoke-virtual {p1, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    iput v12, v11, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 908
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const-string v12, "launcher.add_cell_y"

    invoke-virtual {p1, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    iput v12, v11, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 909
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const-string v12, "launcher.add_span_x"

    invoke-virtual {p1, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    iput v12, v11, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 910
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const-string v12, "launcher.add_span_y"

    invoke-virtual {p1, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    iput v12, v11, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 911
    const-string v11, "launcher.add_widget_info"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v11

    check-cast v11, Landroid/appwidget/AppWidgetProviderInfo;

    iput-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 912
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

    .line 913
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    .line 917
    :cond_5
    const-string v11, "launcher.rename_folder"

    const/4 v12, 0x0

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    .line 918
    .local v9, renameFolder:Z
    if-eqz v9, :cond_6

    .line 919
    const-string v11, "launcher.rename_folder_id"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 920
    .local v4, id:J
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    sget-object v12, Lcom/cyanogenmod/trebuchet/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v11, p0, v12, v4, v5}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getFolderById(Landroid/content/Context;Ljava/util/HashMap;J)Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v11

    iput-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 921
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    .line 926
    .end local v4           #id:J
    :cond_6
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    if-eqz v11, :cond_0

    .line 927
    const-string v11, "apps_customize_currentTab"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 928
    .local v0, curTab:Ljava/lang/String;
    if-eqz v0, :cond_7

    .line 929
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iget-object v12, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v12, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getContentTypeForTabTag(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setContentTypeImmediate(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;)V

    .line 931
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v12, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v12}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getCurrentPage()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadAssociatedPages(I)V

    .line 935
    :cond_7
    const-string v11, "apps_customize_currentIndex"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 936
    .local v2, currentIndex:I
    iget-object v11, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v11, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->restorePageForIndex(I)V

    goto/16 :goto_0
.end method

.method private runNewAppsAnimation(Z)V
    .locals 13
    .parameter "immediate"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/high16 v10, 0x3f80

    .line 3794
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 3795
    .local v0, anim:Landroid/animation/AnimatorSet;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3798
    .local v2, bounceAnims:Ljava/util/Collection;,"Ljava/util/Collection<Landroid/animation/Animator;>;"
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    new-instance v7, Lcom/cyanogenmod/trebuchet/Launcher$25;

    invoke-direct {v7, p0}, Lcom/cyanogenmod/trebuchet/Launcher$25;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 3809
    if-eqz p1, :cond_0

    .line 3810
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

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

    .line 3811
    .local v5, v:Landroid/view/View;
    invoke-virtual {v5, v10}, Landroid/view/View;->setAlpha(F)V

    .line 3812
    invoke-virtual {v5, v10}, Landroid/view/View;->setScaleX(F)V

    .line 3813
    invoke-virtual {v5, v10}, Landroid/view/View;->setScaleY(F)V

    goto :goto_0

    .line 3816
    .end local v4           #i$:Ljava/util/Iterator;
    .end local v5           #v:Landroid/view/View;
    :cond_0
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_1

    .line 3817
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 3818
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

    invoke-static {v5, v6}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 3822
    .local v1, bounceAnim:Landroid/animation/ValueAnimator;
    const-wide/16 v6, 0x1c2

    invoke-virtual {v1, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 3823
    mul-int/lit8 v6, v3, 0x4b

    int-to-long v6, v6

    invoke-virtual {v1, v6, v7}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 3824
    new-instance v6, Lcom/cyanogenmod/trebuchet/PagedView$OvershootInterpolator;

    invoke-direct {v6}, Lcom/cyanogenmod/trebuchet/PagedView$OvershootInterpolator;-><init>()V

    invoke-virtual {v1, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 3825
    invoke-interface {v2, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 3816
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 3827
    .end local v1           #bounceAnim:Landroid/animation/ValueAnimator;
    .end local v5           #v:Landroid/view/View;
    :cond_1
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 3828
    new-instance v6, Lcom/cyanogenmod/trebuchet/Launcher$26;

    invoke-direct {v6, p0}, Lcom/cyanogenmod/trebuchet/Launcher$26;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    invoke-virtual {v0, v6}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 3836
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 3840
    .end local v3           #i:I
    :cond_2
    const/4 v6, -0x1

    iput v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimatePage:I

    .line 3841
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 3842
    new-instance v6, Lcom/cyanogenmod/trebuchet/Launcher$27;

    const-string v7, "clearNewAppsThread"

    invoke-direct {v6, p0, v7}, Lcom/cyanogenmod/trebuchet/Launcher$27;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Ljava/lang/String;)V

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Launcher$27;->start()V

    .line 3850
    return-void
.end method

.method private sendAdvanceMessage(J)V
    .locals 3
    .parameter "delay"

    .prologue
    const/4 v2, 0x1

    .line 1457
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 1458
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1459
    .local v0, msg:Landroid/os/Message;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1460
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceSentTime:J

    .line 1461
    return-void
.end method

.method private setPivotsForZoom(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    const/high16 v1, 0x4000

    .line 2647
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotX(F)V

    .line 2648
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 2649
    return-void
.end method

.method private setWorkspaceBackground(Z)V
    .locals 2
    .parameter "workspace"

    .prologue
    .line 2667
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLauncherView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2668
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLauncherView:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2671
    :cond_0
    return-void

    .line 2668
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mBlackBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method private setupViews()V
    .locals 9

    .prologue
    const/16 v6, 0x8

    .line 944
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    .line 946
    .local v2, dragController:Lcom/cyanogenmod/trebuchet/DragController;
    const v4, 0x7f07002a

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLauncherView:Landroid/view/View;

    .line 947
    const v4, 0x7f07002b

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/DragLayer;

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    .line 948
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    const v5, 0x7f07002c

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 949
    const v4, 0x7f07002d

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    .line 950
    const v4, 0x7f07002e

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    .line 952
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLauncherView:Landroid/view/View;

    const/16 v5, 0x400

    invoke-virtual {v4, v5}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 953
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020065

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 954
    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v5, -0x100

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mBlackBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 957
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v4, p0, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->setup(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/DragController;)V

    .line 960
    const v4, 0x7f070030

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/Hotseat;

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    .line 963
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/Workspace;->setHapticFeedbackEnabled(Z)V

    .line 964
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v4, p0}, Lcom/cyanogenmod/trebuchet/Workspace;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 965
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->setup(Lcom/cyanogenmod/trebuchet/DragController;)V

    .line 966
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/DragController;->addDragListener(Lcom/cyanogenmod/trebuchet/DragController$DragListener;)V

    .line 969
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    const v5, 0x7f070031

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/DragLayer;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    .line 972
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowSearchBar:Z

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getCurrentOrientation()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 973
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 976
    :cond_0
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowHotseat:Z

    if-nez v4, :cond_1

    .line 977
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v4, v6}, Lcom/cyanogenmod/trebuchet/Hotseat;->setVisibility(I)V

    .line 980
    :cond_1
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowDockDivider:Z

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v4, :cond_2

    .line 981
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 985
    :cond_2
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowHotseat:Z

    if-eqz v4, :cond_5

    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideDockIconLabels:Z

    if-nez v4, :cond_5

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v4

    if-nez v4, :cond_5

    .line 986
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 987
    .local v3, res:Landroid/content/res/Resources;
    const v4, 0x7f0d0029

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 989
    .local v0, bottomMarginWithText:I
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v4, :cond_3

    .line 990
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 993
    :cond_3
    const v4, 0x7f07002f

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 994
    .local v1, dockScrollingIndicator:Landroid/view/View;
    if-eqz v1, :cond_4

    .line 995
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v0, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 998
    :cond_4
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    const v5, 0x7f0d002f

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1001
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->getPaddingLeft()I

    move-result v5

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getPaddingTop()I

    move-result v6

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/Workspace;->getPaddingRight()I

    move-result v7

    const v8, 0x7f0d0054

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->setPadding(IIII)V

    .line 1009
    .end local v0           #bottomMarginWithText:I
    .end local v1           #dockScrollingIndicator:Landroid/view/View;
    .end local v3           #res:Landroid/content/res/Resources;
    :cond_5
    const v4, 0x7f070036

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    .line 1010
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    const v5, 0x7f07000c

    invoke-virtual {v4, v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    .line 1012
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v4, p0, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->setup(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/DragController;)V

    .line 1015
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/DragController;->setDragScoller(Lcom/cyanogenmod/trebuchet/DragScroller;)V

    .line 1016
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/DragController;->setScrollView(Landroid/view/View;)V

    .line 1017
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/DragController;->setMoveTarget(Landroid/view/View;)V

    .line 1018
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2, v4}, Lcom/cyanogenmod/trebuchet/DragController;->addDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 1019
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v4, :cond_6

    .line 1020
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v4, p0, v2}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->setup(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/DragController;)V

    .line 1022
    :cond_6
    return-void
.end method

.method private showAppsCustomizeHelper(ZZ)V
    .locals 23
    .parameter "animated"
    .parameter "springLoaded"

    .prologue
    .line 2768
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    if-eqz v2, :cond_0

    .line 2769
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->cancel()V

    .line 2770
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2772
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    .line 2774
    .local v18, res:Landroid/content/res/Resources;
    const v2, 0x7f0c0004

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v15

    .line 2775
    .local v15, duration:I
    const v2, 0x7f0c0007

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v16

    .line 2776
    .local v16, fadeDuration:I
    const v2, 0x7f0c0006

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-float v0, v2

    move/from16 v19, v0

    .line 2777
    .local v19, scale:F
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 2778
    .local v5, fromView:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    .line 2779
    .local v4, toView:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    const v2, 0x7f0c000b

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v21

    .line 2782
    .local v21, startDelay:I
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->setPivotsForZoom(Landroid/view/View;)V

    .line 2785
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    move/from16 v0, p1

    invoke-virtual {v2, v3, v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getChangeStateAnimation(Lcom/cyanogenmod/trebuchet/Workspace$State;Z)Landroid/animation/Animator;

    move-result-object v22

    .line 2788
    .local v22, workspaceAnim:Landroid/animation/Animator;
    if-eqz p1, :cond_5

    .line 2789
    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setScaleX(F)V

    .line 2790
    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setScaleY(F)V

    .line 2791
    new-instance v20, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-object/from16 v0, v20

    invoke-direct {v0, v4}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;-><init>(Landroid/view/View;)V

    .line 2792
    .local v20, scaleAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    const/high16 v2, 0x3f80

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->scaleX(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v2

    const/high16 v3, 0x3f80

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->scaleY(F)Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;

    move-result-object v2

    int-to-long v9, v15

    invoke-virtual {v2, v9, v10}, Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;->setDuration(J)Landroid/animation/Animator;

    move-result-object v2

    new-instance v3, Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;

    invoke-direct {v3}, Lcom/cyanogenmod/trebuchet/Workspace$ZoomOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2797
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setVisibility(I)V

    .line 2798
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setAlpha(F)V

    .line 2799
    const-string v2, "alpha"

    const/4 v3, 0x2

    new-array v3, v3, [F

    fill-array-data v3, :array_0

    invoke-static {v4, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    move/from16 v0, v16

    int-to-long v9, v0

    invoke-virtual {v2, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v12

    .line 2802
    .local v12, alphaAnim:Landroid/animation/ObjectAnimator;
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v3, 0x3fc0

    invoke-direct {v2, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v12, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2803
    new-instance v2, Lcom/cyanogenmod/trebuchet/Launcher$15;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v5, v4}, Lcom/cyanogenmod/trebuchet/Launcher$15;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/View;Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V

    invoke-virtual {v12, v2}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 2817
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2818
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    move/from16 v0, v21

    int-to-long v9, v0

    invoke-virtual {v2, v9, v10}, Landroid/animation/AnimatorSet$Builder;->after(J)Landroid/animation/AnimatorSet$Builder;

    .line 2819
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v2, v12}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    move/from16 v0, v21

    int-to-long v9, v0

    invoke-virtual {v2, v9, v10}, Landroid/animation/AnimatorSet$Builder;->after(J)Landroid/animation/AnimatorSet$Builder;

    .line 2821
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    new-instance v2, Lcom/cyanogenmod/trebuchet/Launcher$16;

    move-object/from16 v3, p0

    move/from16 v6, p1

    move/from16 v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/cyanogenmod/trebuchet/Launcher$16;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Landroid/view/View;ZZ)V

    invoke-virtual {v9, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2859
    if-eqz v22, :cond_1

    .line 2860
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 2863
    :cond_1
    const/4 v13, 0x0

    .line 2866
    .local v13, delayAnim:Z
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 2867
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 2871
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getContent()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getMeasuredWidth()I

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getMeasuredWidth()I

    move-result v2

    if-nez v2, :cond_3

    .line 2874
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v17

    .line 2875
    .local v17, observer:Landroid/view/ViewTreeObserver;
    const/4 v13, 0x1

    .line 2880
    :goto_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mStateAnimation:Landroid/animation/AnimatorSet;

    .line 2881
    .local v8, stateAnimation:Landroid/animation/AnimatorSet;
    new-instance v6, Lcom/cyanogenmod/trebuchet/Launcher$17;

    move-object/from16 v7, p0

    move-object v9, v4

    move-object v10, v5

    move/from16 v11, p1

    invoke-direct/range {v6 .. v11}, Lcom/cyanogenmod/trebuchet/Launcher$17;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/animation/AnimatorSet;Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Landroid/view/View;Z)V

    .line 2901
    .local v6, startAnimRunnable:Ljava/lang/Runnable;
    if-eqz v13, :cond_4

    .line 2902
    new-instance v14, Lcom/cyanogenmod/trebuchet/Launcher$18;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v14, v0, v4, v6, v1}, Lcom/cyanogenmod/trebuchet/Launcher$18;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Ljava/lang/Runnable;Landroid/view/ViewTreeObserver;)V

    .line 2908
    .local v14, delayedStart:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 2938
    .end local v6           #startAnimRunnable:Ljava/lang/Runnable;
    .end local v8           #stateAnimation:Landroid/animation/AnimatorSet;
    .end local v12           #alphaAnim:Landroid/animation/ObjectAnimator;
    .end local v13           #delayAnim:Z
    .end local v14           #delayedStart:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .end local v17           #observer:Landroid/view/ViewTreeObserver;
    .end local v20           #scaleAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    :goto_1
    return-void

    .line 2877
    .restart local v12       #alphaAnim:Landroid/animation/ObjectAnimator;
    .restart local v13       #delayAnim:Z
    .restart local v20       #scaleAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    :cond_3
    const/16 v17, 0x0

    .restart local v17       #observer:Landroid/view/ViewTreeObserver;
    goto :goto_0

    .line 2910
    .restart local v6       #startAnimRunnable:Ljava/lang/Runnable;
    .restart local v8       #stateAnimation:Landroid/animation/AnimatorSet;
    :cond_4
    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 2913
    .end local v6           #startAnimRunnable:Ljava/lang/Runnable;
    .end local v8           #stateAnimation:Landroid/animation/AnimatorSet;
    .end local v12           #alphaAnim:Landroid/animation/ObjectAnimator;
    .end local v13           #delayAnim:Z
    .end local v17           #observer:Landroid/view/ViewTreeObserver;
    .end local v20           #scaleAnim:Lcom/cyanogenmod/trebuchet/LauncherViewPropertyAnimator;
    :cond_5
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setTranslationX(F)V

    .line 2914
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setTranslationY(F)V

    .line 2915
    const/high16 v2, 0x3f80

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setScaleX(F)V

    .line 2916
    const/high16 v2, 0x3f80

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setScaleY(F)V

    .line 2917
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setVisibility(I)V

    .line 2918
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->bringToFront()V

    .line 2920
    if-nez p2, :cond_6

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v2

    if-nez v2, :cond_6

    .line 2922
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->hideScrollingIndicator(Z)V

    .line 2923
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->hideDockDivider()V

    .line 2926
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v2, :cond_6

    .line 2927
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->hideSearchBar(Z)V

    .line 2930
    :cond_6
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 2931
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 2932
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v5, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    .line 2933
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionPrepare(Landroid/view/View;ZZ)V

    .line 2934
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionStart(Landroid/view/View;ZZ)V

    .line 2935
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-direct {v0, v4, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dispatchOnLauncherTransitionEnd(Landroid/view/View;ZZ)V

    .line 2936
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    goto :goto_1

    .line 2799
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method

.method private shrinkAndFadeInFolderIcon(Lcom/cyanogenmod/trebuchet/FolderIcon;)V
    .locals 10
    .parameter "fi"

    .prologue
    const/high16 v9, 0x3f80

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 2483
    if-nez p1, :cond_0

    .line 2508
    :goto_0
    return-void

    .line 2484
    :cond_0
    const-string v5, "alpha"

    new-array v6, v8, [F

    aput v9, v6, v7

    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 2485
    .local v0, alpha:Landroid/animation/PropertyValuesHolder;
    const-string v5, "scaleX"

    new-array v6, v8, [F

    aput v9, v6, v7

    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    .line 2486
    .local v3, scaleX:Landroid/animation/PropertyValuesHolder;
    const-string v5, "scaleY"

    new-array v6, v8, [F

    aput v9, v6, v7

    invoke-static {v5, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    .line 2488
    .local v4, scaleY:Landroid/animation/PropertyValuesHolder;
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2491
    .local v1, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/DragLayer;->removeView(Landroid/view/View;)V

    .line 2492
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->copyFolderIconToImage(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    .line 2493
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderIconImageView:Landroid/widget/ImageView;

    const/4 v6, 0x3

    new-array v6, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v6, v7

    aput-object v3, v6, v8

    const/4 v7, 0x2

    aput-object v4, v6, v7

    invoke-static {v5, v6}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 2495
    .local v2, oa:Landroid/animation/ObjectAnimator;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0c0013

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    int-to-long v5, v5

    invoke-virtual {v2, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 2496
    new-instance v5, Lcom/cyanogenmod/trebuchet/Launcher$14;

    invoke-direct {v5, p0, v1, p1}, Lcom/cyanogenmod/trebuchet/Launcher$14;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    invoke-virtual {v2, v5}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2507
    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0
.end method

.method private skipCustomClingIfNoAccounts()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 4089
    const v5, 0x7f070032

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/Cling;

    .line 4090
    .local v2, cling:Lcom/cyanogenmod/trebuchet/Cling;
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Cling;->getDrawIdentifier()Ljava/lang/String;

    move-result-object v5

    const-string v6, "workspace_custom"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 4091
    .local v3, customCling:Z
    if-eqz v3, :cond_0

    .line 4092
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 4093
    .local v1, am:Landroid/accounts/AccountManager;
    const-string v5, "com.google"

    invoke-virtual {v1, v5}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    .line 4094
    .local v0, accounts:[Landroid/accounts/Account;
    array-length v5, v0

    if-nez v5, :cond_0

    const/4 v4, 0x1

    .line 4096
    .end local v0           #accounts:[Landroid/accounts/Account;
    .end local v1           #am:Landroid/accounts/AccountManager;
    :cond_0
    return v4
.end method

.method private startWallpaper()V
    .locals 3

    .prologue
    .line 2053
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showWorkspace(Z)V

    .line 2054
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SET_WALLPAPER"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2055
    .local v1, pickWallpaper:Landroid/content/Intent;
    const v2, 0x7f09007f

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    .line 2057
    .local v0, chooser:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->processWallpaper(Landroid/content/Intent;)V

    .line 2058
    return-void
.end method

.method private updateAppMarketIcon()V
    .locals 9

    .prologue
    const v8, 0x7f07000b

    const/4 v7, 0x0

    .line 3470
    invoke-virtual {p0, v8}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 3471
    .local v3, marketButton:Landroid/view/View;
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.MAIN"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v5, "android.intent.category.APP_MARKET"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 3474
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    .line 3475
    .local v0, activityName:Landroid/content/ComponentName;
    if-eqz v0, :cond_0

    .line 3476
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v1

    .line 3477
    .local v1, coi:I
    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    .line 3478
    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const v5, 0x7f020026

    const-string v6, "com.android.launcher.toolbar_icon"

    invoke-direct {p0, v8, v0, v5, v6}, Lcom/cyanogenmod/trebuchet/Launcher;->updateTextButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    aput-object v5, v4, v1

    .line 3481
    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 3488
    .end local v1           #coi:I
    :goto_0
    return-void

    .line 3485
    :cond_0
    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 3486
    invoke-virtual {v3, v7}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_0
.end method

.method private updateAppMarketIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 6
    .parameter "d"

    .prologue
    const/4 v5, 0x0

    .line 3492
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 3493
    .local v2, r:Landroid/content/res/Resources;
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 3494
    .local v1, marketIconDrawable:Landroid/graphics/drawable/Drawable;
    const v4, 0x7f0d001e

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 3495
    .local v3, w:I
    const v4, 0x7f0d001f

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 3496
    .local v0, h:I
    invoke-virtual {v1, v5, v5, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 3498
    const v4, 0x7f07000b

    invoke-direct {p0, v4, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->updateTextButtonWithDrawable(ILandroid/graphics/drawable/Drawable;)V

    .line 3499
    return-void
.end method

.method private updateButtonWithDrawable(ILandroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 2
    .parameter "buttonId"
    .parameter "d"

    .prologue
    .line 3349
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 3350
    .local v0, button:Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3351
    return-void
.end method

.method private updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 3
    .parameter "buttonId"
    .parameter "activityName"
    .parameter "fallbackDrawableId"
    .parameter "toolbarResourceName"

    .prologue
    .line 3326
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 3327
    .local v0, button:Landroid/widget/ImageView;
    invoke-direct {p0, p2, p4}, Lcom/cyanogenmod/trebuchet/Launcher;->getExternalPackageToolbarIcon(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 3329
    .local v1, toolbarIcon:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 3332
    if-nez v1, :cond_1

    .line 3333
    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3339
    :cond_0
    :goto_0
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v2

    :goto_1
    return-object v2

    .line 3335
    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 3339
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private updateFullscreenMode(Z)V
    .locals 4
    .parameter "enable"

    .prologue
    const/16 v2, 0x400

    .line 2684
    if-eqz p1, :cond_1

    move v1, v2

    .line 2685
    .local v1, fsflags:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v3, 0x400

    .line 2687
    .local v0, curflags:I
    if-eq v1, v0, :cond_0

    .line 2688
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Landroid/view/Window;->setFlags(II)V

    .line 2690
    :cond_0
    return-void

    .line 2684
    .end local v0           #curflags:I
    .end local v1           #fsflags:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private updateGlobalIcons()V
    .locals 4

    .prologue
    .line 471
    const/4 v1, 0x0

    .line 472
    .local v1, searchVisible:Z
    const/4 v2, 0x0

    .line 474
    .local v2, voiceVisible:Z
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v0

    .line 475
    .local v0, coi:I
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_0

    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_0

    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-nez v3, :cond_1

    .line 477
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateAppMarketIcon()V

    .line 478
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateGlobalSearchIcon()Z

    move-result v1

    .line 479
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->updateVoiceSearchIcon(Z)Z

    move-result v2

    .line 481
    :cond_1
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_2

    .line 482
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->updateGlobalSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 483
    const/4 v1, 0x1

    .line 485
    :cond_2
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_3

    .line 486
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->updateVoiceSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 487
    const/4 v2, 0x1

    .line 489
    :cond_3
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    if-eqz v3, :cond_4

    .line 490
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher;->sAppMarketIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v3, v3, v0

    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->updateAppMarketIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V

    .line 492
    :cond_4
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v3, :cond_5

    .line 493
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v3, v1, v2}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->onSearchPackagesChanged(ZZ)V

    .line 495
    :cond_5
    return-void
.end method

.method private updateGlobalSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 4
    .parameter "d"

    .prologue
    const v3, 0x7f07003d

    .line 3402
    const v2, 0x7f07003e

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 3403
    .local v1, searchButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 3404
    .local v0, searchButton:Landroid/view/View;
    invoke-direct {p0, v3, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->updateButtonWithDrawable(ILandroid/graphics/drawable/Drawable$ConstantState;)V

    .line 3405
    invoke-direct {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3406
    return-void
.end method

.method private updateGlobalSearchIcon()Z
    .locals 13

    .prologue
    const v12, 0x7f02001e

    const v11, 0x7f07003d

    const/4 v8, 0x0

    const/16 v10, 0x8

    .line 3364
    const v9, 0x7f07003e

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 3365
    .local v3, searchButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 3366
    .local v2, searchButton:Landroid/widget/ImageView;
    const v9, 0x7f07003f

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 3367
    .local v6, voiceButtonContainer:Landroid/view/View;
    const v9, 0x7f070035

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 3368
    .local v5, voiceButton:Landroid/view/View;
    const v9, 0x7f070034

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 3370
    .local v7, voiceButtonProxy:Landroid/view/View;
    const-string v9, "search"

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/SearchManager;

    .line 3372
    .local v4, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v4}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v0

    .line 3373
    .local v0, activityName:Landroid/content/ComponentName;
    if-eqz v0, :cond_3

    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowSearchBar:Z

    if-eqz v9, :cond_3

    .line 3374
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v1

    .line 3375
    .local v1, coi:I
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v10, "com.android.launcher.toolbar_search_icon"

    invoke-direct {p0, v11, v0, v12, v10}, Lcom/cyanogenmod/trebuchet/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v10

    aput-object v10, v9, v1

    .line 3378
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v9, v9, v1

    if-nez v9, :cond_0

    .line 3379
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sGlobalSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v10, "com.android.launcher.toolbar_icon"

    invoke-direct {p0, v11, v0, v12, v10}, Lcom/cyanogenmod/trebuchet/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v10

    aput-object v10, v9, v1

    .line 3384
    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v3, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3385
    :cond_1
    invoke-virtual {v2, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3386
    invoke-direct {p0, v3, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3387
    const/4 v8, 0x1

    .line 3397
    .end local v1           #coi:I
    :cond_2
    :goto_0
    return v8

    .line 3390
    :cond_3
    if-eqz v3, :cond_4

    invoke-virtual {v3, v10}, Landroid/view/View;->setVisibility(I)V

    .line 3391
    :cond_4
    if-eqz v6, :cond_5

    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 3392
    :cond_5
    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3393
    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 3394
    if-eqz v7, :cond_2

    .line 3395
    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private updateOverflowMenuButton()V
    .locals 9

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 3516
    const v7, 0x7f07000a

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 3517
    .local v3, overflowMenuButton:Landroid/view/View;
    new-instance v2, Landroid/content/Intent;

    const-string v7, "android.intent.action.MAIN"

    invoke-direct {v2, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3518
    .local v2, launcherIntent:Landroid/content/Intent;
    const-string v7, "android.intent.category.HOME"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3519
    const-string v7, "android.intent.category.DEFAULT"

    invoke-virtual {v2, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3520
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const/high16 v8, 0x1

    invoke-virtual {v7, v2, v8}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v7

    iget-object v0, v7, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 3523
    .local v0, defaultLauncher:Landroid/content/pm/ActivityInfo;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v8, "com.cyanogenmod.android"

    invoke-virtual {v7, v8}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    :cond_0
    move v4, v6

    .line 3526
    .local v4, preferencesVisible:Z
    :goto_0
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v7

    if-nez v7, :cond_1

    if-nez v4, :cond_3

    :cond_1
    move v1, v6

    .line 3527
    .local v1, disabled:Z
    :goto_1
    if-eqz v1, :cond_4

    const/16 v7, 0x8

    :goto_2
    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    .line 3528
    if-nez v1, :cond_5

    :goto_3
    invoke-virtual {v3, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 3529
    return-void

    .end local v1           #disabled:Z
    .end local v4           #preferencesVisible:Z
    :cond_2
    move v4, v5

    .line 3523
    goto :goto_0

    .restart local v4       #preferencesVisible:Z
    :cond_3
    move v1, v5

    .line 3526
    goto :goto_1

    .restart local v1       #disabled:Z
    :cond_4
    move v7, v5

    .line 3527
    goto :goto_2

    :cond_5
    move v6, v5

    .line 3528
    goto :goto_3
.end method

.method private updateRunning()V
    .locals 11

    .prologue
    const-wide/16 v1, 0x4e20

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1464
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mVisible:Z

    if-eqz v5, :cond_1

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mUserPresent:Z

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    move v0, v3

    .line 1465
    .local v0, autoAdvanceRunning:Z
    :goto_0
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceRunning:Z

    if-eq v0, v5, :cond_0

    .line 1466
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceRunning:Z

    .line 1467
    if-eqz v0, :cond_3

    .line 1468
    iget-wide v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceTimeLeft:J

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    .line 1469
    .local v1, delay:J
    :goto_1
    invoke-direct {p0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->sendAdvanceMessage(J)V

    .line 1479
    .end local v1           #delay:J
    :cond_0
    :goto_2
    return-void

    .end local v0           #autoAdvanceRunning:Z
    :cond_1
    move v0, v4

    .line 1464
    goto :goto_0

    .line 1468
    .restart local v0       #autoAdvanceRunning:Z
    :cond_2
    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceTimeLeft:J

    goto :goto_1

    .line 1471
    :cond_3
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    .line 1472
    const-wide/16 v5, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iget-wide v9, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceSentTime:J

    sub-long/2addr v7, v9

    sub-long v7, v1, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoAdvanceTimeLeft:J

    .line 1475
    :cond_4
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v5, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1476
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_2
.end method

.method private updateTextButtonWithDrawable(ILandroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "buttonId"
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 3344
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 3345
    .local v0, button:Landroid/widget/TextView;
    invoke-virtual {v0, p2, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3346
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

    .line 3299
    invoke-direct {p0, p2, p4}, Lcom/cyanogenmod/trebuchet/Launcher;->getExternalPackageToolbarIcon(Landroid/content/ComponentName;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 3300
    .local v3, toolbarIcon:Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 3301
    .local v2, r:Landroid/content/res/Resources;
    const v6, 0x7f0d001e

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 3302
    .local v4, w:I
    const v6, 0x7f0d001f

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 3304
    .local v1, h:I
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 3306
    .local v0, button:Landroid/widget/TextView;
    if-nez v3, :cond_1

    .line 3307
    invoke-virtual {v2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 3308
    invoke-virtual {v3, v7, v7, v4, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 3309
    if-eqz v0, :cond_0

    .line 3310
    invoke-virtual {v0, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3318
    :cond_0
    :goto_0
    return-object v5

    .line 3314
    :cond_1
    invoke-virtual {v3, v7, v7, v4, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 3315
    if-eqz v0, :cond_2

    .line 3316
    invoke-virtual {v0, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 3318
    :cond_2
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    goto :goto_0
.end method

.method private updateVoiceSearchIcon(Landroid/graphics/drawable/Drawable$ConstantState;)V
    .locals 4
    .parameter "d"

    .prologue
    const v3, 0x7f070035

    .line 3460
    const v2, 0x7f07003f

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 3461
    .local v1, voiceButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 3462
    .local v0, voiceButton:Landroid/view/View;
    invoke-direct {p0, v3, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->updateButtonWithDrawable(ILandroid/graphics/drawable/Drawable$ConstantState;)V

    .line 3463
    invoke-direct {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3464
    return-void
.end method

.method private updateVoiceSearchIcon(Z)Z
    .locals 13
    .parameter "searchVisible"

    .prologue
    const v12, 0x7f02001f

    const v11, 0x7f070035

    const/16 v10, 0x8

    const/4 v8, 0x0

    .line 3409
    const v9, 0x7f07003f

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 3410
    .local v6, voiceButtonContainer:Landroid/view/View;
    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 3411
    .local v5, voiceButton:Landroid/view/View;
    const v9, 0x7f070034

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .line 3414
    .local v7, voiceButtonProxy:Landroid/view/View;
    const-string v9, "search"

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/SearchManager;

    .line 3416
    .local v4, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v4}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v2

    .line 3418
    .local v2, globalSearchActivity:Landroid/content/ComponentName;
    const/4 v0, 0x0

    .line 3419
    .local v0, activityName:Landroid/content/ComponentName;
    if-eqz v2, :cond_0

    .line 3421
    new-instance v3, Landroid/content/Intent;

    const-string v9, "android.speech.action.WEB_SEARCH"

    invoke-direct {v3, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3422
    .local v3, intent:Landroid/content/Intent;
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 3423
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    .line 3426
    .end local v3           #intent:Landroid/content/Intent;
    :cond_0
    if-nez v0, :cond_1

    .line 3429
    new-instance v3, Landroid/content/Intent;

    const-string v9, "android.speech.action.WEB_SEARCH"

    invoke-direct {v3, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3430
    .restart local v3       #intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    .line 3432
    .end local v3           #intent:Landroid/content/Intent;
    :cond_1
    if-eqz p1, :cond_6

    if-eqz v0, :cond_6

    .line 3433
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getCurrentOrientationIndexForGlobalIcons()I

    move-result v1

    .line 3434
    .local v1, coi:I
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v10, "com.android.launcher.toolbar_voice_search_icon"

    invoke-direct {p0, v11, v0, v12, v10}, Lcom/cyanogenmod/trebuchet/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v10

    aput-object v10, v9, v1

    .line 3437
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    aget-object v9, v9, v1

    if-nez v9, :cond_2

    .line 3438
    sget-object v9, Lcom/cyanogenmod/trebuchet/Launcher;->sVoiceSearchIcon:[Landroid/graphics/drawable/Drawable$ConstantState;

    const-string v10, "com.android.launcher.toolbar_icon"

    invoke-direct {p0, v11, v0, v12, v10}, Lcom/cyanogenmod/trebuchet/Launcher;->updateButtonWithIconFromExternalActivity(ILandroid/content/ComponentName;ILjava/lang/String;)Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v10

    aput-object v10, v9, v1

    .line 3442
    :cond_2
    if-eqz v6, :cond_3

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3443
    :cond_3
    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3444
    if-eqz v7, :cond_4

    .line 3445
    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 3447
    :cond_4
    invoke-direct {p0, v6, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->invalidatePressedFocusedStates(Landroid/view/View;Landroid/view/View;)V

    .line 3448
    const/4 v8, 0x1

    .line 3455
    .end local v1           #coi:I
    :cond_5
    :goto_0
    return v8

    .line 3450
    :cond_6
    if-eqz v6, :cond_7

    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 3451
    :cond_7
    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 3452
    if-eqz v7, :cond_5

    .line 3453
    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private static writeConfiguration(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;)V
    .locals 5
    .parameter "context"
    .parameter "configuration"

    .prologue
    .line 575
    const/4 v1, 0x0

    .line 577
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

    .line 578
    .end local v1           #out:Ljava/io/DataOutputStream;
    .local v2, out:Ljava/io/DataOutputStream;
    :try_start_1
    iget-object v3, p1, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->locale:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 579
    iget v3, p1, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mcc:I

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 580
    iget v3, p1, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mnc:I

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 581
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6

    .line 588
    if-eqz v2, :cond_2

    .line 590
    :try_start_2
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v1, v2

    .line 596
    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 591
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catch_0
    move-exception v3

    move-object v1, v2

    .line 593
    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_0

    .line 582
    :catch_1
    move-exception v3

    .line 588
    :goto_1
    if-eqz v1, :cond_0

    .line 590
    :try_start_3
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 591
    :catch_2
    move-exception v3

    goto :goto_0

    .line 584
    :catch_3
    move-exception v0

    .line 586
    .local v0, e:Ljava/io/IOException;
    :goto_2
    :try_start_4
    const-string v3, "launcher.preferences"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 588
    if-eqz v1, :cond_0

    .line 590
    :try_start_5
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_0

    .line 591
    :catch_4
    move-exception v3

    goto :goto_0

    .line 588
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_3
    if-eqz v1, :cond_1

    .line 590
    :try_start_6
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 593
    :cond_1
    :goto_4
    throw v3

    .line 591
    :catch_5
    move-exception v4

    goto :goto_4

    .line 588
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_3

    .line 584
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catch_6
    move-exception v0

    move-object v1, v2

    .end local v2           #out:Ljava/io/DataOutputStream;
    .restart local v1       #out:Ljava/io/DataOutputStream;
    goto :goto_2

    .line 582
    .end local v1           #out:Ljava/io/DataOutputStream;
    .restart local v2       #out:Ljava/io/DataOutputStream;
    :catch_7
    move-exception v3

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
.method addAppWidgetFromDrop(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;JI[I[I[I)V
    .locals 7
    .parameter "info"
    .parameter "container"
    .parameter "screen"
    .parameter "cell"
    .parameter "span"
    .parameter "loc"

    .prologue
    .line 1943
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->resetAddInfo()V

    .line 1944
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-wide p2, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->container:J

    iput-wide p2, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 1945
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput p4, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->screen:I

    iput p4, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 1946
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-object p7, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    .line 1947
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minSpanX:I

    iput v6, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    .line 1948
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->minSpanY:I

    iput v6, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    .line 1950
    if-eqz p5, :cond_0

    .line 1951
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v6, 0x0

    aget v6, p5, v6

    iput v6, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 1952
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v6, 0x1

    aget v6, p5, v6

    iput v6, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 1954
    :cond_0
    if-eqz p6, :cond_1

    .line 1955
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v6, 0x0

    aget v6, p6, v6

    iput v6, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 1956
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v6, 0x1

    aget v6, p6, v6

    iput v6, v5, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 1959
    :cond_1
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    .line 1961
    .local v1, hostView:Landroid/appwidget/AppWidgetHostView;
    if-eqz v1, :cond_2

    .line 1962
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    move-result v0

    .line 1963
    .local v0, appWidgetId:I
    iget-object v5, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p0, v0, p1, v1, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->addAppWidgetImpl(ILcom/cyanogenmod/trebuchet/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 1990
    :goto_0
    return-void

    .line 1967
    .end local v0           #appWidgetId:I
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getAppWidgetHost()Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-result-object v5

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->allocateAppWidgetId()I

    move-result v0

    .line 1968
    .restart local v0       #appWidgetId:I
    iget-object v3, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->bindOptions:Landroid/os/Bundle;

    .line 1971
    .local v3, options:Landroid/os/Bundle;
    if-eqz v3, :cond_3

    .line 1972
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v5, v0, v6, v3}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;Landroid/os/Bundle;)Z

    move-result v4

    .line 1978
    .local v4, success:Z
    :goto_1
    if-eqz v4, :cond_4

    .line 1979
    const/4 v5, 0x0

    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p0, v0, p1, v5, v6}, Lcom/cyanogenmod/trebuchet/Launcher;->addAppWidgetImpl(ILcom/cyanogenmod/trebuchet/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    goto :goto_0

    .line 1975
    .end local v4           #success:Z
    :cond_3
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v5, v0, v6}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    move-result v4

    .restart local v4       #success:Z
    goto :goto_1

    .line 1981
    :cond_4
    iget-object v5, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->info:Landroid/appwidget/AppWidgetProviderInfo;

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 1982
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.appwidget.action.APPWIDGET_BIND"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1983
    .local v2, intent:Landroid/content/Intent;
    const-string v5, "appWidgetId"

    invoke-virtual {v2, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1984
    const-string v5, "appWidgetProvider"

    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1987
    const/16 v5, 0xb

    invoke-virtual {p0, v2, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method addAppWidgetImpl(ILcom/cyanogenmod/trebuchet/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 8
    .parameter "appWidgetId"
    .parameter "info"
    .parameter "boundWidget"
    .parameter "appWidgetInfo"

    .prologue
    .line 1891
    iget-object v0, p4, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    if-eqz v0, :cond_0

    .line 1892
    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    .line 1895
    new-instance v7, Landroid/content/Intent;

    const-string v0, "android.appwidget.action.APPWIDGET_CONFIGURE"

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1896
    .local v7, intent:Landroid/content/Intent;
    iget-object v0, p4, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    invoke-virtual {v7, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1897
    const-string v0, "appWidgetId"

    invoke-virtual {v7, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1898
    const/4 v0, 0x5

    invoke-virtual {p0, v7, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivityForResultSafely(Landroid/content/Intent;I)V

    .line 1906
    .end local v7           #intent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 1901
    :cond_0
    iget-wide v2, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    iget v4, p2, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    move-object v0, p0

    move v1, p1

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/Launcher;->completeAddAppWidget(IJILandroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 1904
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    goto :goto_0
.end method

.method addFolder(Lcom/cyanogenmod/trebuchet/CellLayout;JIII)Lcom/cyanogenmod/trebuchet/FolderIcon;
    .locals 12
    .parameter "layout"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 2016
    new-instance v1, Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-direct {v1}, Lcom/cyanogenmod/trebuchet/FolderInfo;-><init>()V

    .line 2017
    .local v1, folderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;
    const v0, 0x7f09007e

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->title:Ljava/lang/CharSequence;

    .line 2020
    const/4 v7, 0x0

    move-object v0, p0

    move-wide v2, p2

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    invoke-static/range {v0 .. v7}, Lcom/cyanogenmod/trebuchet/LauncherModel;->addItemToDatabase(Landroid/content/Context;Lcom/cyanogenmod/trebuchet/ItemInfo;JIIIZ)V

    .line 2022
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sFolders:Ljava/util/HashMap;

    iget-wide v4, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2025
    const v0, 0x7f04000f

    invoke-static {v0, p0, p1, v1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->fromXml(ILcom/cyanogenmod/trebuchet/Launcher;Landroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/FolderInfo;)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v3

    .line 2027
    .local v3, newFolder:Lcom/cyanogenmod/trebuchet/FolderIcon;
    move/from16 v7, p5

    .local v7, x:I
    move/from16 v8, p6

    .line 2028
    .local v8, y:I
    const-wide/16 v4, -0x65

    cmp-long v0, p2, v4

    if-nez v0, :cond_2

    .line 2029
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideDockIconLabels:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v3, v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    .line 2034
    :goto_1
    const-wide/16 v4, -0x65

    cmp-long v0, p2, v4

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2041
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/cyanogenmod/trebuchet/Hotseat;->getInverterCellXFromOrder(I)I

    move-result v7

    .line 2042
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/cyanogenmod/trebuchet/Hotseat;->getInverterCellYFromOrder(I)I

    move-result v8

    .line 2044
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const/4 v9, 0x1

    const/4 v10, 0x1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v11

    move-wide v4, p2

    move/from16 v6, p4

    invoke-virtual/range {v2 .. v11}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 2045
    return-object v3

    .line 2029
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 2031
    :cond_2
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideIconLabels:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-virtual {v3, v0}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method addWidgetToAutoAdvanceIfNeeded(Landroid/view/View;Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 3
    .parameter "hostView"
    .parameter "appWidgetInfo"

    .prologue
    .line 1504
    if-eqz p2, :cond_0

    iget v1, p2, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 1511
    :cond_0
    :goto_0
    return-void

    .line 1505
    :cond_1
    iget v1, p2, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1506
    .local v0, v:Landroid/view/View;
    instance-of v1, v0, Landroid/widget/Advanceable;

    if-eqz v1, :cond_0

    .line 1507
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1508
    check-cast v0, Landroid/widget/Advanceable;

    .end local v0           #v:Landroid/view/View;
    invoke-interface {v0}, Landroid/widget/Advanceable;->fyiWillBeAdvancedByHostKThx()V

    .line 1509
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateRunning()V

    goto :goto_0
.end method

.method public bindAllApplications(Ljava/util/ArrayList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3867
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$28;

    invoke-direct {v1, p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher$28;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Ljava/util/ArrayList;)V

    .line 3877
    .local v1, setAllAppsRunnable:Ljava/lang/Runnable;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    const v3, 0x7f070014

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 3879
    .local v0, progressBar:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 3880
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 3885
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->post(Ljava/lang/Runnable;)Z

    .line 3893
    :goto_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateOverflowMenuButton()V

    .line 3894
    return-void

    .line 3889
    :cond_0
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public bindAppWidget(Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V
    .locals 14
    .parameter "item"

    .prologue
    .line 3690
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->setLoadOnResume()Z

    .line 3692
    const-wide/16 v12, 0x0

    .line 3696
    .local v12, start:J
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 3698
    .local v0, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    iget v10, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->appWidgetId:I

    .line 3699
    .local v10, appWidgetId:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    invoke-virtual {v1, v10}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object v11

    .line 3704
    .local v11, appWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    invoke-virtual {v1, p0, v10, v11}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    move-result-object v1

    iput-object v1, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 3706
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {v1, p1}, Landroid/appwidget/AppWidgetHostView;->setTag(Ljava/lang/Object;)V

    .line 3707
    invoke-virtual {p1, p0}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->onBindAppWidget(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 3709
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    iget-wide v2, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->container:J

    iget v4, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->screen:I

    iget v5, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->cellX:I

    iget v6, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->cellY:I

    iget v7, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanX:I

    iget v8, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->spanY:I

    const/4 v9, 0x0

    invoke-virtual/range {v0 .. v9}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 3711
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {p0, v1, v11}, Lcom/cyanogenmod/trebuchet/Launcher;->addWidgetToAutoAdvanceIfNeeded(Landroid/view/View;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 3713
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->requestLayout()V

    .line 3719
    return-void
.end method

.method public bindAppsAdded(Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3902
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->setLoadOnResume()Z

    .line 3904
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 3905
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->addApps(Ljava/util/ArrayList;)V

    .line 3907
    :cond_0
    return-void
.end method

.method public bindAppsRemoved(Ljava/util/ArrayList;Z)V
    .locals 1
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
    .line 3931
    .local p1, packageNames:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p2, :cond_0

    .line 3932
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->removeItems(Ljava/util/ArrayList;)V

    .line 3935
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_1

    .line 3936
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->removeApps(Ljava/util/ArrayList;)V

    .line 3940
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/DragController;->onAppsRemoved(Ljava/util/ArrayList;)V

    .line 3941
    return-void
.end method

.method public bindAppsUpdated(Ljava/util/ArrayList;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3915
    .local p1, apps:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->setLoadOnResume()Z

    .line 3916
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    if-eqz v0, :cond_0

    .line 3917
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->updateShortcuts(Ljava/util/ArrayList;)V

    .line 3920
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_1

    .line 3921
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->updateApps(Ljava/util/ArrayList;)V

    .line 3923
    :cond_1
    return-void
.end method

.method public bindFolders(Ljava/util/HashMap;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/cyanogenmod/trebuchet/FolderInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3679
    .local p1, folders:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lcom/cyanogenmod/trebuchet/FolderInfo;>;"
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->setLoadOnResume()Z

    .line 3680
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 3681
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 3682
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
            "Lcom/cyanogenmod/trebuchet/ItemInfo;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 3619
    .local p1, shortcuts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ItemInfo;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/Launcher;->setLoadOnResume()Z

    .line 3622
    new-instance v17, Ljava/util/HashSet;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashSet;-><init>()V

    .line 3623
    .local v17, newApps:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v5, "apps.new.list"

    move-object/from16 v0, v17

    invoke-interface {v3, v5, v0}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v17

    .line 3625
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 3626
    .local v1, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    move/from16 v14, p2

    .local v14, i:I
    :goto_0
    move/from16 v0, p3

    if-ge v14, v0, :cond_5

    .line 3627
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/cyanogenmod/trebuchet/ItemInfo;

    .line 3630
    .local v16, item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    move-object/from16 v0, v16

    iget-wide v5, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v7, -0x65

    cmp-long v3, v5, v7

    if-nez v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    if-nez v3, :cond_1

    .line 3626
    :cond_0
    :goto_1
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 3635
    :cond_1
    move-object/from16 v0, v16

    iget v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    move-object/from16 v15, v16

    .line 3639
    check-cast v15, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 3640
    .local v15, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    iget-object v3, v15, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    if-eqz v3, :cond_3

    iget-object v3, v15, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v18

    .line 3641
    .local v18, uri:Ljava/lang/String;
    :goto_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/cyanogenmod/trebuchet/Launcher;->createShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v2

    .line 3642
    .local v2, shortcut:Landroid/view/View;
    move-object/from16 v0, v16

    iget-wide v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    move-object/from16 v0, v16

    iget v5, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    move-object/from16 v0, v16

    iget v6, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    move-object/from16 v0, v16

    iget v7, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-virtual/range {v1 .. v10}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    .line 3644
    const/4 v13, 0x0

    .line 3645
    .local v13, animateIconUp:Z
    monitor-enter v17

    .line 3646
    :try_start_0
    invoke-interface/range {v17 .. v18}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3647
    invoke-interface/range {v17 .. v18}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v13

    .line 3649
    :cond_2
    monitor-exit v17
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3650
    if-eqz v13, :cond_0

    .line 3652
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 3653
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setScaleX(F)V

    .line 3654
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setScaleY(F)V

    .line 3655
    move-object/from16 v0, v16

    iget v3, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimatePage:I

    .line 3656
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 3657
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 3640
    .end local v2           #shortcut:Landroid/view/View;
    .end local v13           #animateIconUp:Z
    .end local v18           #uri:Ljava/lang/String;
    :cond_3
    const/16 v18, 0x0

    goto :goto_2

    .line 3649
    .restart local v2       #shortcut:Landroid/view/View;
    .restart local v13       #animateIconUp:Z
    .restart local v18       #uri:Ljava/lang/String;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v17
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 3662
    .end local v2           #shortcut:Landroid/view/View;
    .end local v13           #animateIconUp:Z
    .end local v15           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .end local v18           #uri:Ljava/lang/String;
    :pswitch_1
    const v6, 0x7f04000f

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    move-object/from16 v5, v16

    check-cast v5, Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-object/from16 v0, p0

    invoke-static {v6, v0, v3, v5}, Lcom/cyanogenmod/trebuchet/FolderIcon;->fromXml(ILcom/cyanogenmod/trebuchet/Launcher;Landroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/FolderInfo;)Lcom/cyanogenmod/trebuchet/FolderIcon;

    move-result-object v4

    .line 3665
    .local v4, newFolder:Lcom/cyanogenmod/trebuchet/FolderIcon;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideIconLabels:Z

    if-nez v3, :cond_4

    const/4 v3, 0x1

    :goto_3
    invoke-virtual {v4, v3}, Lcom/cyanogenmod/trebuchet/FolderIcon;->setTextVisible(Z)V

    .line 3666
    move-object/from16 v0, v16

    iget-wide v5, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    move-object/from16 v0, v16

    iget v7, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    move-object/from16 v0, v16

    iget v8, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    move-object/from16 v0, v16

    iget v9, v0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object v3, v1

    invoke-virtual/range {v3 .. v12}, Lcom/cyanogenmod/trebuchet/Workspace;->addInScreen(Landroid/view/View;JIIIIIZ)V

    goto/16 :goto_1

    .line 3665
    :cond_4
    const/4 v3, 0x0

    goto :goto_3

    .line 3672
    .end local v4           #newFolder:Lcom/cyanogenmod/trebuchet/FolderIcon;
    .end local v16           #item:Lcom/cyanogenmod/trebuchet/ItemInfo;
    :cond_5
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->requestLayout()V

    .line 3673
    return-void

    .line 3635
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bindPackagesUpdated()V
    .locals 1

    .prologue
    .line 3947
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 3948
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onPackagesUpdated()V

    .line 3950
    :cond_0
    return-void
.end method

.method public bindSearchablesChanged()V
    .locals 3

    .prologue
    .line 3854
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateGlobalSearchIcon()Z

    move-result v0

    .line 3855
    .local v0, searchVisible:Z
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateVoiceSearchIcon(Z)Z

    move-result v1

    .line 3856
    .local v1, voiceVisible:Z
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v2, :cond_0

    .line 3857
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v2, v0, v1}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->onSearchPackagesChanged(ZZ)V

    .line 3859
    :cond_0
    return-void
.end method

.method public closeFolder()V
    .locals 2

    .prologue
    .line 2537
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v0

    .line 2538
    .local v0, folder:Lcom/cyanogenmod/trebuchet/Folder;
    if-eqz v0, :cond_1

    .line 2539
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->isEditingName()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2540
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->dismissEditingName()V

    .line 2542
    :cond_0
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder(Lcom/cyanogenmod/trebuchet/Folder;)V

    .line 2545
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissFolderCling(Landroid/view/View;)V

    .line 2547
    :cond_1
    return-void
.end method

.method closeFolder(Lcom/cyanogenmod/trebuchet/Folder;)V
    .locals 4
    .parameter "folder"

    .prologue
    .line 2550
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Folder;->getInfo()Lcom/cyanogenmod/trebuchet/FolderInfo;

    move-result-object v2

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    .line 2552
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 2553
    .local v1, parent:Landroid/view/ViewGroup;
    if-eqz v1, :cond_0

    .line 2554
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v3, p1, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getViewForTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 2555
    .local v0, fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->shrinkAndFadeInFolderIcon(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    .line 2557
    .end local v0           #fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    :cond_0
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/Folder;->animateClosed()V

    .line 2558
    return-void
.end method

.method closeSystemDialogs()V
    .locals 1

    .prologue
    .line 1539
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->closeAllPanels()V

    .line 1542
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

    .line 1543
    return-void
.end method

.method completeAddApplication(Landroid/content/Intent;JIII)V
    .locals 10
    .parameter "data"
    .parameter "container"
    .parameter "screen"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 1086
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mTmpAddItemCellCoordinates:[I

    .line 1087
    .local v9, cellXY:[I
    invoke-virtual {p0, p2, p3, p4}, Lcom/cyanogenmod/trebuchet/Launcher;->getCellLayout(JI)Lcom/cyanogenmod/trebuchet/CellLayout;

    move-result-object v2

    .line 1090
    .local v2, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    if-ltz p5, :cond_1

    if-ltz p6, :cond_1

    .line 1091
    const/4 v0, 0x0

    aput p5, v9, v0

    .line 1092
    const/4 v0, 0x1

    aput p6, v9, v0

    .line 1098
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v0, v3, p1, p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getShortcutInfo(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/Context;)Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    move-result-object v1

    .line 1100
    .local v1, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    if-eqz v1, :cond_2

    .line 1101
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    const/high16 v3, 0x1020

    invoke-virtual {v1, v0, v3}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->setActivity(Landroid/content/ComponentName;I)V

    .line 1103
    const-wide/16 v3, -0x1

    iput-wide v3, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    .line 1104
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v6

    move-wide v3, p2

    move v5, p4

    move v7, p5

    move/from16 v8, p6

    invoke-virtual/range {v0 .. v8}, Lcom/cyanogenmod/trebuchet/Workspace;->addApplicationShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/CellLayout;JIZII)V

    .line 1109
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :goto_0
    return-void

    .line 1093
    :cond_1
    const/4 v0, 0x1

    const/4 v3, 0x1

    invoke-virtual {v2, v9, v0, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->findCellForSpan([III)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1094
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->showOutOfSpaceMessage(Z)V

    goto :goto_0

    .line 1107
    .restart local v1       #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_2
    const-string v0, "Trebuchet.Launcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Couldn\'t find ActivityInfo for selected application: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method createShortcut(ILandroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;
    .locals 3
    .parameter "layoutResId"
    .parameter "parent"
    .parameter "info"

    .prologue
    const/4 v1, 0x0

    .line 1071
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mInflater:Landroid/view/LayoutInflater;

    invoke-virtual {v2, p1, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 1072
    .local v0, favorite:Lcom/cyanogenmod/trebuchet/BubbleTextView;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {v0, p3, v2}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->applyFromShortcutInfo(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/IconCache;)V

    .line 1073
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideIconLabels:Z

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setTextVisible(Z)V

    .line 1074
    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1075
    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1076
    return-object v0
.end method

.method createShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;
    .locals 3
    .parameter "info"

    .prologue
    .line 1057
    const v1, 0x7f040003

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v1, v0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->createShortcut(ILandroid/view/ViewGroup;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method disableWallpaperIfInAllApps()V
    .locals 1

    .prologue
    .line 2653
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2654
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->isTransitioning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2656
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 2659
    :cond_0
    return-void
.end method

.method public dismissAllAppsCling(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 4161
    const v1, 0x7f070012

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Cling;

    .line 4162
    .local v0, cling:Lcom/cyanogenmod/trebuchet/Cling;
    const-string v1, "cling.allapps.dismissed"

    const/16 v2, 0xfa

    invoke-direct {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissCling(Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;I)V

    .line 4163
    return-void
.end method

.method public dismissAllAppsSortCling(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 4165
    const v1, 0x7f070013

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Cling;

    .line 4166
    .local v0, cling:Lcom/cyanogenmod/trebuchet/Cling;
    const-string v1, "cling.allappssort.dismissed"

    const/16 v2, 0xfa

    invoke-direct {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissCling(Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;I)V

    .line 4167
    return-void
.end method

.method public dismissFolderCling(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 4169
    const v1, 0x7f070033

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Cling;

    .line 4170
    .local v0, cling:Lcom/cyanogenmod/trebuchet/Cling;
    const-string v1, "cling.folder.dismissed"

    const/16 v2, 0xfa

    invoke-direct {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissCling(Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;I)V

    .line 4171
    return-void
.end method

.method public dismissWorkspaceCling(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 4157
    const v1, 0x7f070032

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Cling;

    .line 4158
    .local v0, cling:Lcom/cyanogenmod/trebuchet/Cling;
    const-string v1, "cling.workspace.dismissed"

    const/16 v2, 0xfa

    invoke-direct {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissCling(Lcom/cyanogenmod/trebuchet/Cling;Ljava/lang/String;I)V

    .line 4159
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    .line 2072
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_1

    .line 2073
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 2090
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    :goto_1
    :pswitch_0
    :sswitch_0
    return v0

    .line 2077
    :sswitch_1
    const-string v1, "launcher_dump_state"

    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->isPropertyEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2078
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->dumpState()V

    goto :goto_1

    .line 2083
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 2084
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 2073
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x19 -> :sswitch_1
    .end sparse-switch

    .line 2084
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 4
    .parameter "event"

    .prologue
    .line 3503
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v0

    .line 3504
    .local v0, result:Z
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v1

    .line 3505
    .local v1, text:Ljava/util/List;,"Ljava/util/List<Ljava/lang/CharSequence;>;"
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 3507
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v2, v3, :cond_0

    .line 3508
    const v2, 0x7f09009c

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3512
    :goto_0
    return v0

    .line 3510
    :cond_0
    const v2, 0x7f09009d

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 4
    .parameter "prefix"
    .parameter "fd"
    .parameter "writer"
    .parameter "args"

    .prologue
    .line 4206
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 4207
    const-string v2, " "

    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4208
    const-string v2, "Debug logs: "

    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 4209
    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher;->sDumpLogs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 4210
    .local v0, dumpLog:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 4212
    .end local v0           #dumpLog:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public dumpState()V
    .locals 3

    .prologue
    .line 4189
    const-string v0, "Trebuchet.Launcher"

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

    .line 4190
    const-string v0, "Trebuchet.Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mSavedState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4191
    const-string v0, "Trebuchet.Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mWorkspaceLoading="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceLoading:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4192
    const-string v0, "Trebuchet.Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mRestoring="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4193
    const-string v0, "Trebuchet.Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mWaitingForResult="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4194
    const-string v0, "Trebuchet.Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mSavedInstanceState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSavedState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4195
    const-string v0, "Trebuchet.Launcher"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sFolders.size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher;->sFolders:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4196
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->dumpState()V

    .line 4198
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 4199
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->dumpState()V

    .line 4201
    :cond_0
    const-string v0, "Trebuchet.Launcher"

    const-string v1, "END launcher2 dump state"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4202
    return-void
.end method

.method enterSpringLoadedDragMode()V
    .locals 3

    .prologue
    .line 3129
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3130
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Launcher$State;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->hideAppsCustomizeHelper(Lcom/cyanogenmod/trebuchet/Launcher$State;ZLjava/lang/Runnable;)V

    .line 3131
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->hideDockDivider()V

    .line 3132
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 3134
    :cond_0
    return-void
.end method

.method exitSpringLoadedDragMode()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 3159
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v2, v3, :cond_0

    .line 3160
    const/4 v0, 0x1

    .line 3161
    .local v0, animated:Z
    const/4 v1, 0x1

    .line 3162
    .local v1, springLoaded:Z
    invoke-direct {p0, v4, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->showAppsCustomizeHelper(ZZ)V

    .line 3163
    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 3166
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
    .line 3138
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-eq v0, v1, :cond_0

    .line 3156
    :goto_0
    return-void

    .line 3140
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/cyanogenmod/trebuchet/Launcher$23;

    invoke-direct {v2, p0, p1, p3}, Lcom/cyanogenmod/trebuchet/Launcher$23;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;ZLjava/lang/Runnable;)V

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
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 3731
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->setLoadOnResume()Z

    .line 3733
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSavedState:Landroid/os/Bundle;

    if-eqz v5, :cond_1

    .line 3734
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->hasFocus()Z

    move-result v5

    if-nez v5, :cond_0

    .line 3735
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 3737
    :cond_0
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSavedState:Landroid/os/Bundle;

    .line 3740
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->restoreInstanceStateForRemainingPages()V

    .line 3744
    sget-object v5, Lcom/cyanogenmod/trebuchet/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;

    .line 3745
    .local v2, pendingAdd:Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;
    invoke-direct {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->completeAdd(Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;)Z

    goto :goto_0

    .line 3747
    .end local v2           #pendingAdd:Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;
    :cond_2
    sget-object v5, Lcom/cyanogenmod/trebuchet/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 3751
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateAppMarketIcon()V

    .line 3754
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mVisible:Z

    if-nez v5, :cond_3

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceLoading:Z

    if-eqz v5, :cond_4

    .line 3755
    :cond_3
    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$24;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Launcher$24;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    .line 3762
    .local v1, newAppsRunnable:Ljava/lang/Runnable;
    iget v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimatePage:I

    const/4 v6, -0x1

    if-le v5, v6, :cond_5

    iget v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimatePage:I

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v6

    if-eq v5, v6, :cond_5

    const/4 v3, 0x1

    .line 3764
    .local v3, willSnapPage:Z
    :goto_1
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->canRunNewAppsAnimation()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 3767
    if-eqz v3, :cond_6

    .line 3768
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimatePage:I

    invoke-virtual {v5, v6, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(ILjava/lang/Runnable;)V

    .line 3779
    .end local v1           #newAppsRunnable:Ljava/lang/Runnable;
    .end local v3           #willSnapPage:Z
    :cond_4
    :goto_2
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceLoading:Z

    .line 3780
    return-void

    .restart local v1       #newAppsRunnable:Ljava/lang/Runnable;
    :cond_5
    move v3, v4

    .line 3762
    goto :goto_1

    .line 3770
    .restart local v3       #willSnapPage:Z
    :cond_6
    invoke-direct {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->runNewAppsAnimation(Z)V

    goto :goto_2

    .line 3775
    :cond_7
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->runNewAppsAnimation(Z)V

    goto :goto_2
.end method

.method public getAppWidgetHost()Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;
    .locals 1

    .prologue
    .line 1531
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    return-object v0
.end method

.method getCellLayout(JI)Lcom/cyanogenmod/trebuchet/CellLayout;
    .locals 2
    .parameter "container"
    .parameter "screen"

    .prologue
    .line 2620
    const-wide/16 v0, -0x65

    cmp-long v0, p1, v0

    if-nez v0, :cond_1

    .line 2621
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    if-eqz v0, :cond_0

    .line 2622
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v0, p3}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 2627
    :goto_0
    return-object v0

    .line 2624
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 2627
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v0, p3}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    goto :goto_0
.end method

.method public getCurrentOrientation()I
    .locals 1

    .prologue
    .line 3256
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    return v0
.end method

.method public getCurrentWorkspaceScreen()I
    .locals 1

    .prologue
    .line 3583
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    if-eqz v0, :cond_0

    .line 3584
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v0

    .line 3586
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public getDragController()Lcom/cyanogenmod/trebuchet/DragController;
    .locals 1

    .prologue
    .line 1703
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    return-object v0
.end method

.method public getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;
    .locals 1

    .prologue
    .line 599
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    return-object v0
.end method

.method getHotseat()Lcom/cyanogenmod/trebuchet/Hotseat;
    .locals 1

    .prologue
    .line 2606
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    return-object v0
.end method

.method getLockWorkspace()Z
    .locals 1

    .prologue
    .line 2613
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    return v0
.end method

.method public getModel()Lcom/cyanogenmod/trebuchet/LauncherModel;
    .locals 1

    .prologue
    .line 1535
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    return-object v0
.end method

.method getSearchBar()Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;
    .locals 1

    .prologue
    .line 2609
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    return-object v0
.end method

.method getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;
    .locals 1

    .prologue
    .line 2632
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    return-object v0
.end method

.method hideDockDivider()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 3169
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 3170
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowSearchBar:Z

    if-eqz v0, :cond_0

    .line 3171
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 3173
    :cond_0
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowDockDivider:Z

    if-eqz v0, :cond_1

    .line 3174
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 3177
    :cond_1
    return-void
.end method

.method hideHotseat(Z)V
    .locals 4
    .parameter "animated"

    .prologue
    const/4 v2, 0x0

    .line 3240
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowHotseat:Z

    if-eqz v1, :cond_1

    .line 3241
    if-eqz p1, :cond_2

    .line 3242
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    .line 3243
    const/4 v0, 0x0

    .line 3244
    .local v0, duration:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v1, :cond_0

    .line 3245
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->getTransitionOutDuration()I

    move-result v0

    .line 3247
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 3253
    .end local v0           #duration:I
    :cond_1
    :goto_0
    return-void

    .line 3250
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Hotseat;->setAlpha(F)V

    goto :goto_0
.end method

.method public isAllAppsVisible()Z
    .locals 2

    .prologue
    .line 2638
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

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
    .line 605
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->isLoadingWorkspace()Z

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
    .locals 2

    .prologue
    .line 4153
    const v1, 0x7f070033

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Cling;

    .line 4154
    .local v0, cling:Lcom/cyanogenmod/trebuchet/Cling;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Cling;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isHotseatLayout(Landroid/view/View;)Z
    .locals 1
    .parameter "layout"

    .prologue
    .line 2602
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/CellLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasPage(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

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
    .line 3985
    sget-boolean v1, Lcom/cyanogenmod/trebuchet/Launcher;->sForceEnableRotation:Z

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b0002

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 3987
    .local v0, enableRotation:Z
    :goto_0
    return v0

    .line 3985
    .end local v0           #enableRotation:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWorkspaceLocked()Z
    .locals 1

    .prologue
    .line 1877
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceLoading:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

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
    .line 3211
    return-void
.end method

.method public lockScreenOrientation()V
    .locals 1

    .prologue
    .line 3990
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoRotate:Z

    if-eqz v0, :cond_0

    .line 3991
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->mapConfigurationOriActivityInfoOri(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->setRequestedOrientation(I)V

    .line 3994
    :cond_0
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

    .line 647
    const/16 v7, 0xb

    if-ne p1, v7, :cond_3

    .line 648
    if-eqz p3, :cond_1

    const-string v5, "appWidgetId"

    invoke-virtual {p3, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 650
    .local v0, appWidgetId:I
    :goto_0
    if-nez p2, :cond_2

    .line 651
    invoke-direct {p0, v4, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->completeTwoStageWidgetDrop(II)V

    .line 699
    .end local v0           #appWidgetId:I
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v6

    .line 648
    goto :goto_0

    .line 652
    .restart local v0       #appWidgetId:I
    :cond_2
    if-ne p2, v6, :cond_0

    .line 653
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p0, v0, v4, v10, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->addAppWidgetImpl(ILcom/cyanogenmod/trebuchet/ItemInfo;Landroid/appwidget/AppWidgetHostView;Landroid/appwidget/AppWidgetProviderInfo;)V

    goto :goto_1

    .line 657
    .end local v0           #appWidgetId:I
    :cond_3
    const/4 v2, 0x0

    .line 658
    .local v2, delayExitSpringLoadedMode:Z
    const/16 v7, 0x9

    if-eq p1, v7, :cond_4

    const/4 v7, 0x5

    if-ne p1, v7, :cond_5

    :cond_4
    move v3, v5

    .line 660
    .local v3, isWidgetDrop:Z
    :goto_2
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

    .line 663
    if-eqz v3, :cond_8

    .line 664
    if-eqz p3, :cond_6

    const-string v5, "appWidgetId"

    invoke-virtual {p3, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 666
    .restart local v0       #appWidgetId:I
    :goto_3
    if-gez v0, :cond_7

    .line 667
    const-string v5, "Trebuchet.Launcher"

    const-string v6, "Error: appWidgetId (EXTRA_APPWIDGET_ID) was not returned from the \\widget configuration activity."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    invoke-direct {p0, v4, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->completeTwoStageWidgetDrop(II)V

    goto :goto_1

    .end local v0           #appWidgetId:I
    .end local v3           #isWidgetDrop:Z
    :cond_5
    move v3, v4

    .line 658
    goto :goto_2

    .restart local v3       #isWidgetDrop:Z
    :cond_6
    move v0, v6

    .line 664
    goto :goto_3

    .line 671
    .restart local v0       #appWidgetId:I
    :cond_7
    invoke-direct {p0, p2, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->completeTwoStageWidgetDrop(II)V

    goto :goto_1

    .line 681
    .end local v0           #appWidgetId:I
    :cond_8
    if-ne p2, v6, :cond_9

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-eqz v6, :cond_9

    .line 682
    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;

    invoke-direct {v1, v10}, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;-><init>(Lcom/cyanogenmod/trebuchet/Launcher$1;)V

    .line 683
    .local v1, args:Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;
    iput p1, v1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->requestCode:I

    .line 684
    iput-object p3, v1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->intent:Landroid/content/Intent;

    .line 685
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    iput-wide v6, v1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->container:J

    .line 686
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    iput v6, v1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->screen:I

    .line 687
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iput v6, v1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->cellX:I

    .line 688
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v6, v6, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    iput v6, v1, Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;->cellY:I

    .line 689
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 690
    sget-object v6, Lcom/cyanogenmod/trebuchet/Launcher;->sPendingAddList:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 695
    .end local v1           #args:Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;
    :cond_9
    :goto_4
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/DragLayer;->clearAnimatedView()V

    .line 697
    if-eqz p2, :cond_b

    :goto_5
    invoke-virtual {p0, v5, v2, v10}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V

    goto :goto_1

    .line 692
    .restart local v1       #args:Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;
    :cond_a
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->completeAdd(Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;)Z

    move-result v2

    goto :goto_4

    .end local v1           #args:Lcom/cyanogenmod/trebuchet/Launcher$PendingAddArguments;
    :cond_b
    move v5, v4

    .line 697
    goto :goto_5
.end method

.method public onAttachedToWindow()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1393
    invoke-super {p0}, Landroid/app/Activity;->onAttachedToWindow()V

    .line 1396
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1397
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1398
    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1399
    const-string v1, "android.intent.action.SET_WALLPAPER"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1400
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1402
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAttached:Z

    .line 1403
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mVisible:Z

    .line 1404
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 2095
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2096
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->showWorkspace(Z)V

    .line 2110
    :goto_0
    return-void

    .line 2097
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2098
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getOpenFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v0

    .line 2099
    .local v0, openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->isEditingName()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2100
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->dismissEditingName()V

    goto :goto_0

    .line 2102
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    goto :goto_0

    .line 2105
    .end local v0           #openFolder:Lcom/cyanogenmod/trebuchet/Folder;
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->exitWidgetResizeMode()V

    .line 2108
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->showOutlinesTemporarily()V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 12
    .parameter "v"

    .prologue
    const/4 v8, 0x0

    const/4 v11, 0x1

    .line 2129
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v5

    if-nez v5, :cond_1

    .line 2162
    .end local p1
    :cond_0
    :goto_0
    return-void

    .line 2133
    .restart local p1
    :cond_1
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->isFinishedSwitchingState()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2137
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    .line 2138
    .local v4, tag:Ljava/lang/Object;
    instance-of v5, v4, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v5, :cond_3

    move-object v5, v4

    .line 2139
    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    const/4 v6, 0x3

    if-ne v5, v6, :cond_2

    .line 2140
    invoke-virtual {p0, v11}, Lcom/cyanogenmod/trebuchet/Launcher;->showAllApps(Z)V

    goto :goto_0

    :cond_2
    move-object v5, v4

    .line 2143
    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    iget-object v1, v5, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 2144
    .local v1, intent:Landroid/content/Intent;
    const/4 v5, 0x2

    new-array v2, v5, [I

    .line 2145
    .local v2, pos:[I
    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 2146
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

    .line 2149
    invoke-virtual {p0, p1, v1, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    move-result v3

    .line 2151
    .local v3, success:Z
    if-eqz v3, :cond_0

    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v5, :cond_0

    .line 2152
    check-cast p1, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .end local p1
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResume:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    .line 2153
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResume:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    invoke-virtual {v5, v11}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setStayPressed(Z)V

    goto :goto_0

    .line 2156
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #pos:[I
    .end local v3           #success:Z
    .restart local p1
    :cond_3
    instance-of v5, v4, Lcom/cyanogenmod/trebuchet/FolderInfo;

    if-eqz v5, :cond_0

    .line 2157
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v5, :cond_0

    move-object v0, p1

    .line 2158
    check-cast v0, Lcom/cyanogenmod/trebuchet/FolderIcon;

    .line 2159
    .local v0, fi:Lcom/cyanogenmod/trebuchet/FolderIcon;
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->handleFolderClick(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    goto :goto_0
.end method

.method public onClickAppMarketButton(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 2214
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 2215
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppMarketIntent:Landroid/content/Intent;

    const-string v1, "app market"

    invoke-virtual {p0, p1, v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 2219
    :goto_0
    return-void

    .line 2217
    :cond_0
    const-string v0, "Trebuchet.Launcher"

    const-string v1, "Invalid app market intent."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onClickOverflowMenuButton(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 2259
    new-instance v1, Landroid/widget/PopupMenu;

    invoke-direct {v1, p0, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 2260
    .local v1, popupMenu:Landroid/widget/PopupMenu;
    invoke-virtual {v1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 2261
    .local v0, menu:Landroid/view/Menu;
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 2262
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 2263
    invoke-virtual {v1}, Landroid/widget/PopupMenu;->show()V

    .line 2264
    return-void
.end method

.method public onClickSearchButton(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 2183
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 2185
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->onSearchRequested()Z

    .line 2186
    return-void
.end method

.method public onClickVoiceButton(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    const/4 v7, 0x0

    const/high16 v6, 0x1000

    .line 2194
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 2197
    :try_start_0
    const-string v4, "search"

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/SearchManager;

    .line 2199
    .local v3, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v3}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v0

    .line 2200
    .local v0, activityName:Landroid/content/ComponentName;
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.speech.action.WEB_SEARCH"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2201
    .local v2, intent:Landroid/content/Intent;
    const/high16 v4, 0x1000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2202
    if-eqz v0, :cond_0

    .line 2203
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2205
    :cond_0
    const/4 v4, 0x0

    const-string v5, "onClickVoiceButton"

    invoke-virtual {p0, v4, v2, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivity(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2211
    .end local v0           #activityName:Landroid/content/ComponentName;
    .end local v3           #searchManager:Landroid/app/SearchManager;
    :goto_0
    return-void

    .line 2206
    .end local v2           #intent:Landroid/content/Intent;
    :catch_0
    move-exception v1

    .line 2207
    .local v1, e:Landroid/content/ActivityNotFoundException;
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.speech.action.WEB_SEARCH"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2208
    .restart local v2       #intent:Landroid/content/Intent;
    invoke-virtual {v2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2209
    const-string v4, "onClickVoiceButton"

    invoke-virtual {p0, v7, v2, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 373
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 374
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    .line 375
    .local v0, app:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getSharedPreferencesKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 377
    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->setLauncher(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/LauncherModel;

    move-result-object v5

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    .line 378
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->getIconCache()Lcom/cyanogenmod/trebuchet/IconCache;

    move-result-object v5

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    .line 379
    new-instance v5, Lcom/cyanogenmod/trebuchet/DragController;

    invoke-direct {v5, p0}, Lcom/cyanogenmod/trebuchet/DragController;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    .line 380
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mInflater:Landroid/view/LayoutInflater;

    .line 381
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 384
    .local v3, res:Landroid/content/res/Resources;
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider;->load(Landroid/content/Context;)V

    .line 386
    invoke-static {p0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v5

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetManager:Landroid/appwidget/AppWidgetManager;

    .line 387
    new-instance v5, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    const/16 v8, 0x400

    invoke-direct {v5, p0, v8}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;I)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    .line 388
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->startListening()V

    .line 393
    iput-boolean v7, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPaused:Z

    .line 395
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getShowSearchBar()Z

    move-result v5

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowSearchBar:Z

    .line 396
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getShowDock()Z

    move-result v5

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowHotseat:Z

    .line 397
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getShowDivider()Z

    move-result v5

    if-eqz v5, :cond_4

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowHotseat:Z

    if-eqz v5, :cond_4

    move v5, v6

    :goto_0
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowDockDivider:Z

    .line 398
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Homescreen;->getHideIconLabels()Z

    move-result v5

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideIconLabels:Z

    .line 399
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getHideIconLabels()Z

    move-result v5

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideDockIconLabels:Z

    .line 400
    const v5, 0x7f0b000a

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->orientation:I

    const/4 v8, 0x2

    if-ne v5, v8, :cond_5

    move v4, v6

    .line 403
    .local v4, verticalHotseat:Z
    :goto_1
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getHideIconLabels()Z

    move-result v5

    if-nez v5, :cond_0

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowHotseat:Z

    if-eqz v5, :cond_0

    if-eqz v4, :cond_6

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v5

    if-nez v5, :cond_6

    :cond_0
    move v5, v6

    :goto_2
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHideDockIconLabels:Z

    .line 405
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0b0002

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$General;->getAutoRotate(Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoRotate:Z

    .line 406
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0b0003

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$General;->getLockWorkspace(Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    .line 407
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$General;->getFullscreenMode()Z

    move-result v5

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFullscreenMode:Z

    .line 414
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->checkForLocaleChange()V

    .line 415
    const v5, 0x7f040014

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->setContentView(I)V

    .line 416
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->setupViews()V

    .line 417
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->showFirstRunWorkspaceCling()V

    .line 419
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->registerContentObservers()V

    .line 421
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->lockAllApps()V

    .line 423
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSavedState:Landroid/os/Bundle;

    .line 424
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSavedState:Landroid/os/Bundle;

    invoke-direct {p0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->restoreState(Landroid/os/Bundle;)V

    .line 427
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v5, :cond_1

    .line 428
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onPackagesUpdated()V

    .line 435
    :cond_1
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    if-nez v5, :cond_2

    .line 436
    sget-boolean v5, Lcom/cyanogenmod/trebuchet/Launcher;->sPausedFromUserAction:Z

    if-eqz v5, :cond_7

    .line 439
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v8, -0x1

    invoke-virtual {v5, v6, v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->startLoader(ZI)V

    .line 447
    :cond_2
    :goto_3
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/LauncherModel;->isAllAppsLoaded()Z

    move-result v5

    if-nez v5, :cond_3

    .line 448
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 449
    .local v1, appsCustomizeContentParent:Landroid/view/ViewGroup;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mInflater:Landroid/view/LayoutInflater;

    const v8, 0x7f040006

    invoke-virtual {v5, v8, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 453
    .end local v1           #appsCustomizeContentParent:Landroid/view/ViewGroup;
    :cond_3
    new-instance v5, Landroid/text/SpannableStringBuilder;

    invoke-direct {v5}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    .line 454
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-static {v5, v7}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 456
    new-instance v2, Landroid/content/IntentFilter;

    const-string v5, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v2, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 457
    .local v2, filter:Landroid/content/IntentFilter;
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v5, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 459
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateGlobalIcons()V

    .line 462
    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/Launcher;->unlockScreenOrientation(Z)V

    .line 463
    return-void

    .end local v2           #filter:Landroid/content/IntentFilter;
    .end local v4           #verticalHotseat:Z
    :cond_4
    move v5, v7

    .line 397
    goto/16 :goto_0

    :cond_5
    move v4, v7

    .line 400
    goto/16 :goto_1

    .restart local v4       #verticalHotseat:Z
    :cond_6
    move v5, v7

    .line 403
    goto/16 :goto_2

    .line 443
    :cond_7
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v8

    invoke-virtual {v5, v6, v8}, Lcom/cyanogenmod/trebuchet/LauncherModel;->startLoader(ZI)V

    goto :goto_3
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 11
    .parameter "menu"

    .prologue
    const v10, 0x1080049

    const/4 v7, 0x1

    const/high16 v9, 0x1080

    const/4 v6, 0x0

    .line 1781
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v6

    .line 1826
    :goto_0
    return v5

    .line 1785
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 1787
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.settings.MANAGE_ALL_APPLICATIONS_SETTINGS"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1788
    .local v2, manageApps:Landroid/content/Intent;
    invoke-virtual {v2, v9}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1790
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    const-class v8, Lcom/cyanogenmod/trebuchet/preference/Preferences;

    invoke-virtual {v5, p0, v8}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v3

    .line 1791
    .local v3, preferences:Landroid/content/Intent;
    invoke-virtual {v3, v9}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1793
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.settings.SETTINGS"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1794
    .local v4, settings:Landroid/content/Intent;
    const/high16 v5, 0x1020

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1796
    const v5, 0x7f0900af

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1797
    .local v1, helpUrl:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v0, v5, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1798
    .local v0, help:Landroid/content/Intent;
    invoke-virtual {v0, v9}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1801
    const/4 v5, 0x2

    const v8, 0x7f0900aa

    invoke-interface {p1, v7, v5, v6, v8}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v5

    const v8, 0x108003f

    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v5

    const/16 v8, 0x57

    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1804
    const/4 v8, 0x3

    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    if-nez v5, :cond_2

    const v5, 0x7f090005

    :goto_1
    invoke-interface {p1, v6, v8, v6, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v5

    const/16 v8, 0x4c

    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1806
    const/4 v5, 0x4

    const v8, 0x7f0900a9

    invoke-interface {p1, v6, v5, v6, v8}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v5

    const v8, 0x1080042

    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v2}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v5

    const/16 v8, 0x41

    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1811
    const/4 v5, 0x5

    const v8, 0x7f090007

    invoke-interface {p1, v6, v5, v6, v8}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v10}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v5

    const/16 v8, 0x50

    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1816
    const/4 v5, 0x6

    const v8, 0x7f0900ad

    invoke-interface {p1, v6, v5, v6, v8}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v10}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v5

    const/16 v8, 0x53

    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 1820
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 1821
    const/4 v5, 0x7

    const v8, 0x7f0900ae

    invoke-interface {p1, v6, v5, v6, v8}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v5

    const v6, 0x1080040

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v0}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v5

    const/16 v6, 0x48

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    :cond_1
    move v5, v7

    .line 1826
    goto/16 :goto_0

    .line 1804
    :cond_2
    const v5, 0x7f090006

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1661
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1664
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1665
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 1666
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mBuildLayersRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1669
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/LauncherApplication;

    .line 1670
    .local v0, app:Lcom/cyanogenmod/trebuchet/LauncherApplication;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->stopLoader()V

    .line 1671
    invoke-virtual {v0, v4}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->setLauncher(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/LauncherModel;

    .line 1674
    :try_start_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->stopListening()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1678
    :goto_0
    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppWidgetHost:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    .line 1680
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 1682
    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v2

    invoke-virtual {v2}, Landroid/text/method/TextKeyListener;->release()V

    .line 1686
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    if-eqz v2, :cond_0

    .line 1687
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/LauncherModel;->unbindItemInfosAndClearQueuedBindRunnables()V

    .line 1690
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetObserver:Landroid/database/ContentObserver;

    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1691
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mCloseSystemDialogsReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1693
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->clearAllResizeFrames()V

    .line 1694
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1695
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->removeAllViews()V

    .line 1696
    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 1697
    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    .line 1699
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->onDestroyActivity()V

    .line 1700
    return-void

    .line 1675
    :catch_0
    move-exception v1

    .line 1676
    .local v1, ex:Ljava/lang/NullPointerException;
    const-string v2, "Trebuchet.Launcher"

    const-string v3, "problem while stopping AppWidgetHost during Launcher destruction"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1408
    invoke-super {p0}, Landroid/app/Activity;->onDetachedFromWindow()V

    .line 1409
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mVisible:Z

    .line 1411
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAttached:Z

    if-eqz v0, :cond_0

    .line 1412
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1413
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAttached:Z

    .line 1415
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateRunning()V

    .line 1416
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 8
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v4, 0x1

    .line 826
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result v3

    .line 827
    .local v3, uniChar:I
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    .line 828
    .local v1, handled:Z
    if-lez v3, :cond_1

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v5

    if-nez v5, :cond_1

    move v2, v4

    .line 829
    .local v2, isKeyNotWhitespace:Z
    :goto_0
    if-nez v1, :cond_2

    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->acceptFilter()Z

    move-result v5

    if-eqz v5, :cond_2

    if-eqz v2, :cond_2

    .line 830
    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v5

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v5, v6, v7, p1, p2}, Landroid/text/method/TextKeyListener;->onKeyDown(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 832
    .local v0, gotKey:Z
    if-eqz v0, :cond_2

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDefaultKeySsb:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v5}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 839
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->onSearchRequested()Z

    move-result v1

    .line 848
    .end local v0           #gotKey:Z
    .end local v1           #handled:Z
    :cond_0
    :goto_1
    return v1

    .line 828
    .end local v2           #isKeyNotWhitespace:Z
    .restart local v1       #handled:Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 844
    .restart local v2       #isKeyNotWhitespace:Z
    :cond_2
    const/16 v5, 0x52

    if-ne p1, v5, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v5

    if-eqz v5, :cond_0

    move v1, v4

    .line 845
    goto :goto_1
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 7
    .parameter "v"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2561
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isDraggingEnabled()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2598
    :cond_0
    :goto_0
    return v3

    .line 2562
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isWorkspaceLocked()Z

    move-result v5

    if-nez v5, :cond_0

    .line 2563
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v6, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v5, v6, :cond_0

    .line 2565
    instance-of v5, p1, Lcom/cyanogenmod/trebuchet/CellLayout;

    if-nez v5, :cond_2

    .line 2566
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    .end local p1
    check-cast p1, Landroid/view/View;

    .line 2569
    .restart local p1
    :cond_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->resetAddInfo()V

    .line 2570
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;

    .line 2572
    .local v2, longClickCellInfo:Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;
    if-nez v2, :cond_3

    move v3, v4

    .line 2573
    goto :goto_0

    .line 2578
    :cond_3
    iget-object v1, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;->cell:Landroid/view/View;

    .line 2579
    .local v1, itemUnderLongClick:Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->isHotseatLayout(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/Workspace;->allowLongPress()Z

    move-result v5

    if-eqz v5, :cond_6

    :cond_4
    move v0, v4

    .line 2580
    .local v0, allowLongPress:Z
    :goto_1
    if-eqz v0, :cond_5

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/DragController;->isDragging()Z

    move-result v5

    if-nez v5, :cond_5

    .line 2581
    if-nez v1, :cond_7

    .line 2583
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v5, v3, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->performHapticFeedback(II)Z

    .line 2586
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->startWallpaper()V

    :cond_5
    :goto_2
    move v3, v4

    .line 2598
    goto :goto_0

    .end local v0           #allowLongPress:Z
    :cond_6
    move v0, v3

    .line 2579
    goto :goto_1

    .line 2588
    .restart local v0       #allowLongPress:Z
    :cond_7
    instance-of v5, v1, Lcom/cyanogenmod/trebuchet/Folder;

    if-nez v5, :cond_5

    .line 2590
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    if-eqz v5, :cond_8

    .line 2591
    const v4, 0x7f090010

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2594
    :cond_8
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v3, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->startDrag(Lcom/cyanogenmod/trebuchet/CellLayout$CellInfo;)V

    goto :goto_2
.end method

.method public onLongClickAppsTab(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    const/4 v6, 0x1

    .line 2222
    new-instance v1, Landroid/widget/PopupMenu;

    invoke-direct {v1, p0, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 2223
    .local v1, popupMenu:Landroid/widget/PopupMenu;
    invoke-virtual {v1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 2224
    .local v0, menu:Landroid/view/Menu;
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissAllAppsSortCling(Landroid/view/View;)V

    .line 2225
    const/high16 v5, 0x7f0f

    invoke-virtual {v1, v5}, Landroid/widget/PopupMenu;->inflate(I)V

    .line 2226
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getSortMode()Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    move-result-object v4

    .line 2227
    .local v4, sortMode:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;
    sget-object v5, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;->Title:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    if-ne v4, v5, :cond_1

    .line 2228
    const v5, 0x7f07004d

    invoke-interface {v0, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 2232
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getShowSystemApps()Z

    move-result v3

    .line 2233
    .local v3, showSystemApps:Z
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getShowDownloadedApps()Z

    move-result v2

    .line 2234
    .local v2, showDownloadedApps:Z
    const v5, 0x7f07004f

    invoke-interface {v0, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2235
    const v5, 0x7f070050

    invoke-interface {v0, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 2236
    new-instance v5, Lcom/cyanogenmod/trebuchet/Launcher$12;

    invoke-direct {v5, p0}, Lcom/cyanogenmod/trebuchet/Launcher$12;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    invoke-virtual {v1, v5}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 2255
    invoke-virtual {v1}, Landroid/widget/PopupMenu;->show()V

    .line 2256
    return-void

    .line 2229
    .end local v2           #showDownloadedApps:Z
    .end local v3           #showSystemApps:Z
    :cond_1
    sget-object v5, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;->InstallDate:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$SortMode;

    if-ne v4, v5, :cond_0

    .line 2230
    const v5, 0x7f07004e

    invoke-interface {v0, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 5
    .parameter "intent"

    .prologue
    const/high16 v4, 0x40

    .line 1547
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 1550
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1552
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeSystemDialogs()V

    .line 1554
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v2

    and-int/2addr v2, v4

    if-eq v2, v4, :cond_1

    const/4 v0, 0x1

    .line 1558
    .local v0, alreadyOnHome:Z
    :goto_0
    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$11;

    invoke-direct {v1, p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher$11;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Z)V

    .line 1601
    .local v1, processIntent:Ljava/lang/Runnable;
    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/Workspace;->hasWindowFocus()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1604
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    const-wide/16 v3, 0x15e

    invoke-virtual {v2, v1, v3, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1611
    .end local v0           #alreadyOnHome:Z
    .end local v1           #processIntent:Ljava/lang/Runnable;
    :cond_0
    :goto_1
    return-void

    .line 1554
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1607
    .restart local v0       #alreadyOnHome:Z
    .restart local v1       #processIntent:Ljava/lang/Runnable;
    :cond_2
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    .line 1855
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1866
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 1857
    :pswitch_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->startWallpaper()V

    goto :goto_0

    .line 1860
    :pswitch_1
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    .line 1861
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    invoke-static {p0, v0}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$General;->setLockWorkspace(Landroid/content/Context;Z)V

    goto :goto_0

    .line 1860
    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 1855
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onPageBoundSynchronously(I)V
    .locals 2
    .parameter "page"

    .prologue
    .line 3722
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSynchronouslyBoundPages:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3723
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 800
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 802
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 803
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPaused:Z

    .line 804
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->cancelDrag()V

    .line 805
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->resetLastGestureUpTime()V

    .line 806
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 8
    .parameter "menu"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 1831
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 1833
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->isTransitioning()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1850
    :goto_0
    return v6

    .line 1836
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2

    move v0, v5

    .line 1837
    .local v0, allAppsVisible:Z
    :goto_1
    if-nez v0, :cond_3

    move v4, v5

    :goto_2
    invoke-interface {p1, v5, v4}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 1839
    const/4 v4, 0x3

    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mLockWorkspace:Z

    if-nez v4, :cond_4

    const v4, 0x7f090005

    :goto_3
    invoke-interface {v7, v4}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1841
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.intent.action.MAIN"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1842
    .local v2, launcherIntent:Landroid/content/Intent;
    const-string v4, "android.intent.category.HOME"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1843
    const-string v4, "android.intent.category.DEFAULT"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1844
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/high16 v7, 0x1

    invoke-virtual {v4, v2, v7}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v4

    iget-object v1, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 1847
    .local v1, defaultLauncher:Landroid/content/pm/ActivityInfo;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v7, "com.cyanogenmod.android"

    invoke-virtual {v4, v7}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    :cond_1
    move v3, v5

    .line 1849
    .local v3, preferencesVisible:Z
    :goto_4
    const/4 v4, 0x5

    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    move v6, v5

    .line 1850
    goto :goto_0

    .end local v0           #allAppsVisible:Z
    .end local v1           #defaultLauncher:Landroid/content/pm/ActivityInfo;
    .end local v2           #launcherIntent:Landroid/content/Intent;
    .end local v3           #preferencesVisible:Z
    :cond_2
    move v0, v6

    .line 1836
    goto :goto_1

    .restart local v0       #allAppsVisible:Z
    :cond_3
    move v4, v6

    .line 1837
    goto :goto_2

    .line 1839
    :cond_4
    const v4, 0x7f090006

    goto :goto_3

    .restart local v1       #defaultLauncher:Landroid/content/pm/ActivityInfo;
    .restart local v2       #launcherIntent:Landroid/content/Intent;
    :cond_5
    move v3, v6

    .line 1847
    goto :goto_4
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .parameter "state"

    .prologue
    .line 1615
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 1616
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSynchronouslyBoundPages:Ljava/util/ArrayList;

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

    .line 1617
    .local v1, page:I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->restoreInstanceStateForChild(I)V

    goto :goto_0

    .line 1619
    .end local v1           #page:I
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 744
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 747
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v0, v3, :cond_6

    .line 748
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showWorkspace(Z)V

    .line 752
    :cond_0
    :goto_0
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher$State;->NONE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 755
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v0, v3, :cond_7

    move v0, v1

    :goto_1
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->setWorkspaceBackground(Z)V

    .line 758
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;->flushInstallQueue(Landroid/content/Context;)V

    .line 760
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPaused:Z

    .line 761
    sput-boolean v2, Lcom/cyanogenmod/trebuchet/Launcher;->sPausedFromUserAction:Z

    .line 763
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->preferencesChanged()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 764
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 766
    :cond_1
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeNeedsLoad:Z

    if-eqz v0, :cond_3

    .line 767
    :cond_2
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceLoading:Z

    .line 768
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v3}, Lcom/cyanogenmod/trebuchet/LauncherModel;->startLoader(ZI)V

    .line 769
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mRestoring:Z

    .line 770
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeNeedsLoad:Z

    .line 775
    :cond_3
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResume:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-eqz v0, :cond_4

    .line 777
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResume:Lcom/cyanogenmod/trebuchet/BubbleTextView;

    invoke-virtual {v0, v2}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setStayPressed(Z)V

    .line 779
    :cond_4
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_5

    .line 781
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->resetDrawableState()V

    .line 787
    :cond_5
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->reinflateWidgetsIfNecessary()V

    .line 788
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->checkWallpaper()V

    .line 792
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateGlobalIcons()V

    .line 793
    return-void

    .line 749
    :cond_6
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v0, v3, :cond_0

    .line 750
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showAllApps(Z)V

    goto :goto_0

    :cond_7
    move v0, v2

    .line 755
    goto :goto_1
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 811
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mModel:Lcom/cyanogenmod/trebuchet/LauncherModel;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->stopLoader()V

    .line 812
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    if-eqz v0, :cond_0

    .line 813
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->surrender()V

    .line 815
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 6
    .parameter "outState"

    .prologue
    .line 1623
    const-string v2, "launcher.current_screen"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getNextPage()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1624
    const-string v2, "launcher.hotseat.current_screen"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->getCurrentPage()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScreenFromOrder(I)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1625
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 1627
    const-string v2, "launcher.state"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher$State;->ordinal()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1630
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    .line 1632
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v2, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v2, v2, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

    if-eqz v2, :cond_0

    .line 1634
    const-string v2, "launcher.add_container"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget-wide v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-virtual {p1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1635
    const-string v2, "launcher.add_screen"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1636
    const-string v2, "launcher.add_cell_x"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1637
    const-string v2, "launcher.add_cell_y"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1638
    const-string v2, "launcher.add_span_x"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1639
    const-string v2, "launcher.add_span_y"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1640
    const-string v2, "launcher.add_widget_info"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddWidgetInfo:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1643
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

    if-eqz v2, :cond_1

    .line 1644
    const-string v2, "launcher.rename_folder"

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1645
    const-string v2, "launcher.rename_folder_id"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    iget-wide v3, v3, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    invoke-virtual {p1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1649
    :cond_1
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    if-eqz v2, :cond_3

    .line 1650
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v1

    .line 1651
    .local v1, currentTabTag:Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 1652
    const-string v2, "apps_customize_currentTab"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1654
    :cond_2
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeContent:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getSaveInstanceStateIndex()I

    move-result v0

    .line 1655
    .local v0, currentIndex:I
    const-string v2, "apps_customize_currentIndex"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1657
    .end local v0           #currentIndex:I
    .end local v1           #currentTabTag:Ljava/lang/String;
    :cond_3
    return-void
.end method

.method public onSearchRequested()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1871
    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0, v2, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->startSearch(Ljava/lang/String;ZLandroid/os/Bundle;Z)V

    .line 1873
    return v1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v3, 0x1

    .line 2166
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    if-nez v1, :cond_0

    .line 2167
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 2168
    .local v0, tag:Ljava/lang/Object;
    instance-of v1, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .end local v0           #tag:Ljava/lang/Object;
    iget v1, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 2170
    invoke-virtual {p1, v3, v3}, Landroid/view/View;->performHapticFeedback(II)Z

    .line 2174
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public onTrimMemory(I)V
    .locals 1
    .parameter "level"

    .prologue
    .line 3048
    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 3049
    const/16 v0, 0x3c

    if-lt p1, v0, :cond_0

    .line 3050
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onTrimMemory()V

    .line 3052
    :cond_0
    return-void
.end method

.method protected onUserLeaveHint()V
    .locals 1

    .prologue
    .line 466
    invoke-super {p0}, Landroid/app/Activity;->onUserLeaveHint()V

    .line 467
    const/4 v0, 0x1

    sput-boolean v0, Lcom/cyanogenmod/trebuchet/Launcher;->sPausedFromUserAction:Z

    .line 468
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 5
    .parameter "hasFocus"

    .prologue
    const/4 v4, 0x1

    .line 3056
    if-nez p1, :cond_1

    .line 3059
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 3073
    :cond_0
    :goto_0
    return-void

    .line 3062
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$22;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Launcher$22;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/Workspace;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 3069
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mFullscreenMode:Z

    if-eqz v0, :cond_0

    .line 3070
    invoke-direct {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->updateFullscreenMode(Z)V

    goto :goto_0
.end method

.method public onWindowVisibilityChanged(I)V
    .locals 2
    .parameter "visibility"

    .prologue
    .line 1419
    if-nez p1, :cond_2

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mVisible:Z

    .line 1420
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateRunning()V

    .line 1424
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mVisible:Z

    if-eqz v1, :cond_1

    .line 1425
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onWindowVisible()V

    .line 1426
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspaceLoading:Z

    if-nez v1, :cond_0

    .line 1427
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1432
    .local v0, observer:Landroid/view/ViewTreeObserver;
    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$9;

    invoke-direct {v1, p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher$9;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/view/ViewTreeObserver;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1448
    .end local v0           #observer:Landroid/view/ViewTreeObserver;
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateAppMarketIcon()V

    .line 1451
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateOverflowMenuButton()V

    .line 1452
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->clearTypedText()V

    .line 1454
    :cond_1
    return-void

    .line 1419
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public openFolder(Lcom/cyanogenmod/trebuchet/FolderIcon;)V
    .locals 5
    .parameter "folderIcon"

    .prologue
    .line 2518
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/FolderIcon;->getFolder()Lcom/cyanogenmod/trebuchet/Folder;

    move-result-object v0

    .line 2519
    .local v0, folder:Lcom/cyanogenmod/trebuchet/Folder;
    iget-object v1, v0, Lcom/cyanogenmod/trebuchet/Folder;->mInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 2521
    .local v1, info:Lcom/cyanogenmod/trebuchet/FolderInfo;
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/cyanogenmod/trebuchet/FolderInfo;->opened:Z

    .line 2525
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_0

    .line 2526
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->addView(Landroid/view/View;)V

    .line 2527
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v2, v0}, Lcom/cyanogenmod/trebuchet/DragController;->addDropTarget(Lcom/cyanogenmod/trebuchet/DropTarget;)V

    .line 2532
    :goto_0
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->animateOpen()V

    .line 2533
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->growAndFadeOutFolderIcon(Lcom/cyanogenmod/trebuchet/FolderIcon;)V

    .line 2534
    return-void

    .line 2529
    :cond_0
    const-string v2, "Trebuchet.Launcher"

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

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Folder;->getParent()Landroid/view/ViewParent;

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

.method public preferencesChanged()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 4174
    const-string v3, "com.cyanogenmod.trebuchet_preferences"

    invoke-virtual {p0, v3, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 4176
    .local v2, prefs:Landroid/content/SharedPreferences;
    const-string v3, "preferences_changed"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 4177
    .local v1, preferencesChanged:Z
    if-eqz v1, :cond_0

    .line 4178
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 4179
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v3, "preferences_changed"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 4180
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4182
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_0
    return v1
.end method

.method processShortcut(Landroid/content/Intent;)V
    .locals 6
    .parameter "intent"

    .prologue
    .line 1994
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f09008f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1995
    .local v0, applicationName:Ljava/lang/String;
    const-string v4, "android.intent.extra.shortcut.NAME"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1997
    .local v3, shortcutName:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1998
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.MAIN"

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1999
    .local v1, mainIntent:Landroid/content/Intent;
    const-string v4, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2001
    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.intent.action.PICK_ACTIVITY"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2002
    .local v2, pickIntent:Landroid/content/Intent;
    const-string v4, "android.intent.extra.INTENT"

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2003
    const-string v4, "android.intent.extra.TITLE"

    const v5, 0x7f09009b

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 2004
    const/4 v4, 0x6

    invoke-virtual {p0, v2, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivityForResultSafely(Landroid/content/Intent;I)V

    .line 2008
    .end local v1           #mainIntent:Landroid/content/Intent;
    .end local v2           #pickIntent:Landroid/content/Intent;
    :goto_0
    return-void

    .line 2006
    :cond_0
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivityForResultSafely(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method processShortcutFromDrop(Landroid/content/ComponentName;JI[I[I)V
    .locals 3
    .parameter "componentName"
    .parameter "container"
    .parameter "screen"
    .parameter "cell"
    .parameter "loc"

    .prologue
    .line 1918
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->resetAddInfo()V

    .line 1919
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-wide p2, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 1920
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput p4, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 1921
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    iput-object p6, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    .line 1923
    if-eqz p5, :cond_0

    .line 1924
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v2, 0x0

    aget v2, p5, v2

    iput v2, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 1925
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPendingAddInfo:Lcom/cyanogenmod/trebuchet/ItemInfo;

    const/4 v2, 0x1

    aget v2, p5, v2

    iput v2, v1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 1928
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_SHORTCUT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1929
    .local v0, createShortcutIntent:Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1930
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->processShortcut(Landroid/content/Intent;)V

    .line 1931
    return-void
.end method

.method processWallpaper(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 2011
    const/16 v0, 0xa

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2012
    return-void
.end method

.method public removeAppWidget(Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;)V
    .locals 1
    .parameter "launcherInfo"

    .prologue
    .line 1521
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->removeWidgetToAutoAdvance(Landroid/view/View;)V

    .line 1522
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetInfo;->hostView:Landroid/appwidget/AppWidgetHostView;

    .line 1523
    return-void
.end method

.method removeFolder(Lcom/cyanogenmod/trebuchet/FolderInfo;)V
    .locals 3
    .parameter "folder"

    .prologue
    .line 2049
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher;->sFolders:Ljava/util/HashMap;

    iget-wide v1, p1, Lcom/cyanogenmod/trebuchet/FolderInfo;->id:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2050
    return-void
.end method

.method removeWidgetToAutoAdvance(Landroid/view/View;)V
    .locals 1
    .parameter "hostView"

    .prologue
    .line 1514
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1515
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1516
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateRunning()V

    .line 1518
    :cond_0
    return-void
.end method

.method public setLoadOnResume()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 3570
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mPaused:Z

    if-eqz v1, :cond_0

    .line 3571
    const-string v1, "Trebuchet.Launcher"

    const-string v2, "setLoadOnResume"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3572
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mOnResumeNeedsLoad:Z

    .line 3575
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method setWallpaperVisibility(Z)V
    .locals 0
    .parameter "visible"

    .prologue
    .line 2662
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWallpaperVisible:Z

    .line 2663
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->updateWallpaperVisibility(Z)V

    .line 2664
    return-void
.end method

.method showAllApps(Z)V
    .locals 3
    .parameter "animated"

    .prologue
    const/4 v2, 0x0

    .line 3110
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-eq v0, v1, :cond_0

    .line 3126
    :goto_0
    return-void

    .line 3112
    :cond_0
    invoke-direct {p0, p1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showAppsCustomizeHelper(ZZ)V

    .line 3113
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->requestFocus()Z

    .line 3116
    sget-object v0, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 3119
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mUserPresent:Z

    .line 3120
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateRunning()V

    .line 3121
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->closeFolder()V

    .line 3124
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

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

    .line 3180
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    if-eqz v1, :cond_5

    .line 3181
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowSearchBar:Z

    if-eqz v1, :cond_0

    .line 3182
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 3184
    :cond_0
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowDockDivider:Z

    if-eqz v1, :cond_1

    .line 3185
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 3187
    :cond_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    if-eqz v1, :cond_2

    .line 3188
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    .line 3189
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setAlpha(F)V

    .line 3190
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setAlpha(F)V

    .line 3191
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    .line 3193
    :cond_2
    if-eqz p1, :cond_5

    .line 3194
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    .line 3195
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowSearchBar:Z

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowDockDivider:Z

    if-eqz v1, :cond_3

    .line 3196
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/animation/Animator;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mQsbDivider:Landroid/view/View;

    const-string v4, "alpha"

    new-array v5, v8, [F

    aput v7, v5, v6

    invoke-static {v3, v4, v5}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v6

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDockDivider:Landroid/view/View;

    const-string v4, "alpha"

    new-array v5, v8, [F

    aput v7, v5, v6

    invoke-static {v3, v4, v5}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 3199
    :cond_3
    const/4 v0, 0x0

    .line 3200
    .local v0, duration:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v1, :cond_4

    .line 3201
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->getTransitionInDuration()I

    move-result v0

    .line 3203
    :cond_4
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 3204
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mDividerAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 3207
    .end local v0           #duration:I
    :cond_5
    return-void
.end method

.method public showFirstRunAllAppsCling([I)V
    .locals 4
    .parameter "position"

    .prologue
    const v3, 0x7f070012

    const/4 v2, 0x0

    .line 4125
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isClingsEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "cling.allapps.dismissed"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4127
    const/4 v0, 0x1

    invoke-direct {p0, v3, p1, v0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->initCling(I[IZI)Lcom/cyanogenmod/trebuchet/Cling;

    .line 4131
    :goto_0
    return-void

    .line 4129
    :cond_0
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->removeCling(I)V

    goto :goto_0
.end method

.method public showFirstRunAllAppsSortCling([I)V
    .locals 4
    .parameter "position"

    .prologue
    const v3, 0x7f070013

    const/4 v2, 0x0

    .line 4134
    const-string v1, "com.cyanogenmod.trebuchet_preferences"

    invoke-virtual {p0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 4136
    .local v0, prefs:Landroid/content/SharedPreferences;
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isClingsEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "cling.allappssort.dismissed"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4137
    const/4 v1, 0x1

    invoke-direct {p0, v3, p1, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->initCling(I[IZI)Lcom/cyanogenmod/trebuchet/Cling;

    .line 4141
    :goto_0
    return-void

    .line 4139
    :cond_0
    invoke-direct {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->removeCling(I)V

    goto :goto_0
.end method

.method public showFirstRunFoldersCling()Lcom/cyanogenmod/trebuchet/Cling;
    .locals 5

    .prologue
    const/4 v0, 0x0

    const v4, 0x7f070033

    const/4 v3, 0x0

    .line 4144
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isClingsEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "cling.folder.dismissed"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4146
    const/4 v1, 0x1

    invoke-direct {p0, v4, v0, v1, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->initCling(I[IZI)Lcom/cyanogenmod/trebuchet/Cling;

    move-result-object v0

    .line 4149
    :goto_0
    return-object v0

    .line 4148
    :cond_0
    invoke-direct {p0, v4}, Lcom/cyanogenmod/trebuchet/Launcher;->removeCling(I)V

    goto :goto_0
.end method

.method public showFirstRunWorkspaceCling()V
    .locals 8

    .prologue
    const v7, 0x7f070032

    const/4 v6, 0x0

    .line 4101
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->isClingsEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v5, "cling.workspace.dismissed"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->skipCustomClingIfNoAccounts()Z

    move-result v4

    if-nez v4, :cond_1

    .line 4107
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v5, "DEFAULT_WORKSPACE_RESOURCE_ID"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0008

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 4110
    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 4111
    .local v0, cling:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 4112
    .local v2, clingParent:Landroid/view/ViewGroup;
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 4113
    .local v1, clingIndex:I
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 4114
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mInflater:Landroid/view/LayoutInflater;

    const v5, 0x7f040009

    invoke-virtual {v4, v5, v2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 4115
    .local v3, customCling:Landroid/view/View;
    invoke-virtual {v2, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 4116
    invoke-virtual {v3, v7}, Landroid/view/View;->setId(I)V

    .line 4118
    .end local v0           #cling:Landroid/view/View;
    .end local v1           #clingIndex:I
    .end local v2           #clingParent:Landroid/view/ViewGroup;
    .end local v3           #customCling:Landroid/view/View;
    :cond_0
    const/4 v4, 0x0

    invoke-direct {p0, v7, v4, v6, v6}, Lcom/cyanogenmod/trebuchet/Launcher;->initCling(I[IZI)Lcom/cyanogenmod/trebuchet/Cling;

    .line 4122
    :goto_0
    return-void

    .line 4120
    :cond_1
    invoke-direct {p0, v7}, Lcom/cyanogenmod/trebuchet/Launcher;->removeCling(I)V

    goto :goto_0
.end method

.method showHotseat(Z)V
    .locals 4
    .parameter "animated"

    .prologue
    const/high16 v2, 0x3f80

    .line 3221
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mShowHotseat:Z

    if-eqz v1, :cond_1

    .line 3222
    if-eqz p1, :cond_2

    .line 3223
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getAlpha()F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    .line 3224
    const/4 v0, 0x0

    .line 3225
    .local v0, duration:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v1, :cond_0

    .line 3226
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->getTransitionInDuration()I

    move-result v0

    .line 3228
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 3234
    .end local v0           #duration:I
    :cond_1
    :goto_0
    return-void

    .line 3231
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/Hotseat;->setAlpha(F)V

    goto :goto_0
.end method

.method showOutOfSpaceMessage(Z)V
    .locals 3
    .parameter "isHotseatLayout"

    .prologue
    .line 1526
    if-eqz p1, :cond_0

    const v0, 0x7f090095

    .line 1527
    .local v0, strId:I
    :goto_0
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1528
    return-void

    .line 1526
    .end local v0           #strId:I
    :cond_0
    const v0, 0x7f090094

    goto :goto_0
.end method

.method showWorkspace(Z)V
    .locals 1
    .parameter "animated"

    .prologue
    .line 3076
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->showWorkspace(ZLjava/lang/Runnable;)V

    .line 3077
    return-void
.end method

.method showWorkspace(ZLjava/lang/Runnable;)V
    .locals 5
    .parameter "animated"
    .parameter "onCompleteRunnable"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 3080
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-eq v3, v4, :cond_2

    .line 3081
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    sget-object v4, Lcom/cyanogenmod/trebuchet/Launcher$State;->APPS_CUSTOMIZE_SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Launcher$State;

    if-ne v3, v4, :cond_3

    move v0, v1

    .line 3082
    .local v0, wasInSpringLoadedMode:Z
    :goto_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v3, v2}, Lcom/cyanogenmod/trebuchet/Workspace;->setVisibility(I)V

    .line 3083
    sget-object v3, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    invoke-direct {p0, v3, p1, p2}, Lcom/cyanogenmod/trebuchet/Launcher;->hideAppsCustomizeHelper(Lcom/cyanogenmod/trebuchet/Launcher$State;ZLjava/lang/Runnable;)V

    .line 3087
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v3, :cond_0

    .line 3088
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v3, v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->showSearchBar(Z)V

    .line 3092
    :cond_0
    if-eqz p1, :cond_1

    if-eqz v0, :cond_1

    move v2, v1

    :cond_1
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showDockDivider(Z)V

    .line 3095
    .end local v0           #wasInSpringLoadedMode:Z
    :cond_2
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v2, p1}, Lcom/cyanogenmod/trebuchet/Workspace;->flashScrollingIndicator(Z)V

    .line 3098
    sget-object v2, Lcom/cyanogenmod/trebuchet/Launcher$State;->WORKSPACE:Lcom/cyanogenmod/trebuchet/Launcher$State;

    iput-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mState:Lcom/cyanogenmod/trebuchet/Launcher$State;

    .line 3101
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mUserPresent:Z

    .line 3102
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateRunning()V

    .line 3105
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 3107
    return-void

    :cond_3
    move v0, v2

    .line 3081
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

    .line 2323
    const/high16 v5, 0x1000

    invoke-virtual {p2, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2328
    if-eqz p1, :cond_0

    :try_start_0
    const-string v5, "com.cyanogenmod.trebuchet.intent.extra.shortcut.INGORE_LAUNCH_ANIMATION"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    move v2, v4

    .line 2330
    .local v2, useLaunchAnimation:Z
    :goto_0
    if-eqz v2, :cond_1

    .line 2331
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-static {p1, v5, v6, v7, v8}, Landroid/app/ActivityOptions;->makeScaleUpAnimation(Landroid/view/View;IIII)Landroid/app/ActivityOptions;

    move-result-object v1

    .line 2334
    .local v1, opts:Landroid/app/ActivityOptions;
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {p0, p2, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .end local v1           #opts:Landroid/app/ActivityOptions;
    :goto_1
    move v3, v4

    .line 2346
    .end local v2           #useLaunchAnimation:Z
    :goto_2
    return v3

    :cond_0
    move v2, v3

    .line 2328
    goto :goto_0

    .line 2336
    .restart local v2       #useLaunchAnimation:Z
    :cond_1
    invoke-virtual {p0, p2}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 2339
    .end local v2           #useLaunchAnimation:Z
    :catch_0
    move-exception v0

    .line 2340
    .local v0, e:Ljava/lang/SecurityException;
    const v4, 0x7f090082

    invoke-static {p0, v4, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 2341
    const-string v4, "Trebuchet.Launcher"

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
    .line 1708
    if-ltz p2, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWaitingForResult:Z

    .line 1709
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1710
    return-void
.end method

.method startActivityForResultSafely(Landroid/content/Intent;I)V
    .locals 4
    .parameter "intent"
    .parameter "requestCode"

    .prologue
    const v2, 0x7f090082

    const/4 v1, 0x0

    .line 2362
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2371
    :goto_0
    return-void

    .line 2363
    :catch_0
    move-exception v0

    .line 2364
    .local v0, e:Landroid/content/ActivityNotFoundException;
    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2365
    .end local v0           #e:Landroid/content/ActivityNotFoundException;
    :catch_1
    move-exception v0

    .line 2366
    .local v0, e:Ljava/lang/SecurityException;
    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 2367
    const-string v1, "Trebuchet.Launcher"

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
    .line 2350
    const/4 v1, 0x0

    .line 2352
    .local v1, success:Z
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivity(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 2357
    :goto_0
    return v1

    .line 2353
    :catch_0
    move-exception v0

    .line 2354
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const v2, 0x7f090082

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 2355
    const-string v2, "Trebuchet.Launcher"

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
    .locals 5
    .parameter "componentName"

    .prologue
    const/4 v4, 0x0

    .line 2268
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 2269
    .local v1, packageName:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    const-string v3, "package"

    invoke-static {v3, v1, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2271
    .local v0, intent:Landroid/content/Intent;
    const/high16 v2, 0x1080

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2272
    const-string v2, "startApplicationDetailsActivity"

    invoke-virtual {p0, v4, v0, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Ljava/lang/Object;)Z

    .line 2273
    return-void
.end method

.method startApplicationUninstallActivity(Lcom/cyanogenmod/trebuchet/ApplicationInfo;)V
    .locals 6
    .parameter "appInfo"

    .prologue
    .line 2276
    iget v4, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_0

    .line 2279
    const v2, 0x7f0900bf

    .line 2280
    .local v2, messageId:I
    const/4 v4, 0x0

    invoke-static {p0, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 2290
    .end local v2           #messageId:I
    :goto_0
    return-void

    .line 2282
    :cond_0
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 2283
    .local v3, packageName:Ljava/lang/String;
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 2284
    .local v0, className:Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.DELETE"

    const-string v5, "package"

    invoke-static {v5, v3, v0}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2286
    .local v1, intent:Landroid/content/Intent;
    const/high16 v4, 0x1080

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2288
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public startBinding()V
    .locals 5

    .prologue
    .line 3596
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    .line 3598
    .local v3, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    const/4 v4, -0x1

    iput v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimatePage:I

    .line 3599
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mNewShortcutAnimateViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 3600
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWorkspace:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Workspace;->clearDropTargets()V

    .line 3601
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v0

    .line 3602
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 3604
    invoke-virtual {v3, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 3605
    .local v2, layoutParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeAllViewsInLayout()V

    .line 3602
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3607
    .end local v2           #layoutParent:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWidgetsToAdvance:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 3608
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    if-eqz v4, :cond_1

    .line 3609
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHotseat:Lcom/cyanogenmod/trebuchet/Hotseat;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->resetLayout()V

    .line 3611
    :cond_1
    return-void
.end method

.method public startGlobalSearch(Ljava/lang/String;ZLandroid/os/Bundle;Landroid/graphics/Rect;)V
    .locals 8
    .parameter "initialQuery"
    .parameter "selectInitialQuery"
    .parameter "appSearchData"
    .parameter "sourceBounds"

    .prologue
    .line 1744
    const-string v5, "search"

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/SearchManager;

    .line 1746
    .local v4, searchManager:Landroid/app/SearchManager;
    invoke-virtual {v4}, Landroid/app/SearchManager;->getGlobalSearchActivity()Landroid/content/ComponentName;

    move-result-object v2

    .line 1747
    .local v2, globalSearchActivity:Landroid/content/ComponentName;
    if-nez v2, :cond_0

    .line 1748
    const-string v5, "Trebuchet.Launcher"

    const-string v6, "No global search activity found."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1777
    :goto_0
    return-void

    .line 1751
    :cond_0
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.search.action.GLOBAL_SEARCH"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1752
    .local v3, intent:Landroid/content/Intent;
    const/high16 v5, 0x1000

    invoke-virtual {v3, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1753
    invoke-virtual {v3, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1755
    if-nez p3, :cond_4

    .line 1756
    new-instance p3, Landroid/os/Bundle;

    .end local p3
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 1761
    .restart local p3
    :goto_1
    const-string v5, "source"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1762
    const-string v5, "source"

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1764
    :cond_1
    const-string v5, "app_data"

    invoke-virtual {v3, v5, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1765
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1766
    const-string v5, "query"

    invoke-virtual {v3, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1768
    :cond_2
    if-eqz p2, :cond_3

    .line 1769
    const-string v5, "select_query"

    invoke-virtual {v3, v5, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1771
    :cond_3
    invoke-virtual {v3, p4}, Landroid/content/Intent;->setSourceBounds(Landroid/graphics/Rect;)V

    .line 1773
    :try_start_0
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1774
    :catch_0
    move-exception v1

    .line 1775
    .local v1, ex:Landroid/content/ActivityNotFoundException;
    const-string v5, "Trebuchet.Launcher"

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

    .line 1758
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
    .line 1720
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->showWorkspace(Z)V

    .line 1722
    if-nez p1, :cond_0

    .line 1724
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getTypedText()Ljava/lang/String;

    move-result-object p1

    .line 1726
    :cond_0
    if-nez p3, :cond_1

    .line 1727
    new-instance p3, Landroid/os/Bundle;

    .end local p3
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 1728
    .restart local p3
    const-string v1, "source"

    const-string v2, "launcher-search"

    invoke-virtual {p3, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1730
    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 1731
    .local v0, sourceBounds:Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    if-eqz v1, :cond_2

    .line 1732
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->getSearchBarBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1735
    :cond_2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->startGlobalSearch(Ljava/lang/String;ZLandroid/os/Bundle;Landroid/graphics/Rect;)V

    .line 1737
    return-void
.end method

.method startShortcutUninstallActivity(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 8
    .parameter "shortcutInfo"

    .prologue
    const/4 v7, 0x0

    .line 2293
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 2294
    .local v4, pm:Landroid/content/pm/PackageManager;
    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v4, v6, v7}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v5

    .line 2295
    .local v5, resolveInfo:Landroid/content/pm/ResolveInfo;
    iget-object v6, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_0

    .line 2299
    const v2, 0x7f0900bf

    .line 2300
    .local v2, messageId:I
    invoke-static {p0, v2, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 2314
    .end local v2           #messageId:I
    :goto_0
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v7, Lcom/cyanogenmod/trebuchet/Launcher$13;

    invoke-direct {v7, p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher$13;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2320
    return-void

    .line 2302
    :cond_0
    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 2303
    .local v3, packageName:Ljava/lang/String;
    iget-object v6, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 2304
    .local v0, className:Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v6, "android.intent.action.DELETE"

    const-string v7, "package"

    invoke-static {v7, v3, v0}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v1, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2306
    .local v1, intent:Landroid/content/Intent;
    const/high16 v6, 0x1080

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2308
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method unlockAllApps()V
    .locals 0

    .prologue
    .line 3215
    return-void
.end method

.method public unlockScreenOrientation(Z)V
    .locals 4
    .parameter "immediate"

    .prologue
    .line 3996
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mAutoRotate:Z

    if-eqz v0, :cond_1

    .line 3997
    if-eqz p1, :cond_0

    .line 3998
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->setRequestedOrientation(I)V

    .line 4009
    :goto_0
    return-void

    .line 4000
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/cyanogenmod/trebuchet/Launcher$29;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/Launcher$29;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 4007
    :cond_1
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->setRequestedOrientation(I)V

    goto :goto_0
.end method

.method updateShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 8
    .parameter "info"

    .prologue
    const/4 v7, 0x0

    .line 1030
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1031
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mInflater:Landroid/view/LayoutInflater;

    const v5, 0x7f04000a

    invoke-virtual {v4, v5, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 1032
    .local v2, layout:Landroid/view/View;
    const v4, 0x7f070018

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 1033
    .local v1, icon:Landroid/widget/ImageView;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mIconCache:Lcom/cyanogenmod/trebuchet/IconCache;

    invoke-virtual {p1, v4}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->getIcon(Lcom/cyanogenmod/trebuchet/IconCache;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1034
    const v4, 0x7f070019

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 1035
    .local v3, title:Landroid/widget/EditText;
    iget-object v4, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1036
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    iget-object v5, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x104000a

    new-instance v6, Lcom/cyanogenmod/trebuchet/Launcher$6;

    invoke-direct {v6, p0, p1, v3}, Lcom/cyanogenmod/trebuchet/Launcher$6;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Lcom/cyanogenmod/trebuchet/ShortcutInfo;Landroid/widget/EditText;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/high16 v5, 0x104

    invoke-virtual {v4, v5, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1046
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1047
    return-void
.end method

.method updateWallpaperVisibility(Z)V
    .locals 4
    .parameter "visible"

    .prologue
    const/high16 v2, 0x10

    .line 2674
    if-eqz p1, :cond_1

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/Launcher;->mWallpaperVisible:Z

    if-eqz v3, :cond_1

    move v1, v2

    .line 2675
    .local v1, wpflags:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int v0, v3, v2

    .line 2677
    .local v0, curflags:I
    if-eq v1, v0, :cond_0

    .line 2678
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Launcher;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Landroid/view/Window;->setFlags(II)V

    .line 2680
    :cond_0
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->setWorkspaceBackground(Z)V

    .line 2681
    return-void

    .line 2674
    .end local v0           #curflags:I
    .end local v1           #wpflags:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
