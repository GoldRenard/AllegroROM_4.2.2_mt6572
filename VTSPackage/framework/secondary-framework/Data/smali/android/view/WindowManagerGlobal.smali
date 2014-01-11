.class public final Landroid/view/WindowManagerGlobal;
.super Ljava/lang/Object;
.source "WindowManagerGlobal.java"


# static fields
.field public static final ADD_APP_EXITING:I = -0x4

.field public static final ADD_BAD_APP_TOKEN:I = -0x1

.field public static final ADD_BAD_SUBWINDOW_TOKEN:I = -0x2

.field public static final ADD_DUPLICATE_ADD:I = -0x5

.field public static final ADD_FLAG_APP_VISIBLE:I = 0x2

.field public static final ADD_FLAG_IN_TOUCH_MODE:I = 0x1

.field public static final ADD_INPUTCHANNEL_NOT_ALLOWED:I = -0xa

.field public static final ADD_INVALID_DISPLAY:I = -0x9

.field public static final ADD_MULTIPLE_SINGLETON:I = -0x7

.field public static final ADD_NOT_APP_TOKEN:I = -0x3

.field public static final ADD_OKAY:I = 0x0

.field public static final ADD_PERMISSION_DENIED:I = -0x8

.field public static final ADD_STARTING_NOT_NEEDED:I = -0x6

.field public static final RELAYOUT_DEFER_SURFACE_DESTROY:I = 0x2

.field public static final RELAYOUT_INSETS_PENDING:I = 0x1

.field public static final RELAYOUT_RES_ANIMATING:I = 0x8

.field public static final RELAYOUT_RES_FIRST_TIME:I = 0x2

.field public static final RELAYOUT_RES_IN_TOUCH_MODE:I = 0x1

.field public static final RELAYOUT_RES_SURFACE_CHANGED:I = 0x4

.field private static final TAG:Ljava/lang/String; = "WindowManager"

.field private static sDefaultWindowManager:Landroid/view/WindowManagerGlobal;

.field private static sWindowManagerService:Landroid/view/IWindowManager;

.field private static sWindowSession:Landroid/view/IWindowSession;


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private mNeedsEglTerminate:Z

.field private mParams:[Landroid/view/WindowManager$LayoutParams;

.field private mRoots:[Landroid/view/ViewRootImpl;

.field private mSystemPropertyUpdater:Ljava/lang/Runnable;

.field private mViews:[Landroid/view/View;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 119
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 110
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    .line 120
    return-void
.end method

.method static synthetic access$000(Landroid/view/WindowManagerGlobal;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Landroid/view/WindowManagerGlobal;)[Landroid/view/ViewRootImpl;
    .locals 1
    .parameter "x0"

    .prologue
    .line 49
    iget-object v0, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    return-object v0
.end method

.method private findViewLocked(Landroid/view/View;Z)I
    .locals 4
    .parameter "view"
    .parameter "required"

    .prologue
    .line 376
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-eqz v2, :cond_1

    .line 377
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v0, v2

    .line 378
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 379
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    aget-object v2, v2, v1

    if-ne v2, p1, :cond_0

    .line 387
    .end local v0           #count:I
    .end local v1           #i:I
    :goto_1
    return v1

    .line 378
    .restart local v0       #count:I
    .restart local v1       #i:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 384
    .end local v0           #count:I
    .end local v1           #i:I
    :cond_1
    if-eqz p2, :cond_2

    .line 385
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "View not attached to window manager"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 387
    :cond_2
    const/4 v1, -0x1

    goto :goto_1
.end method

.method public static getInstance()Landroid/view/WindowManagerGlobal;
    .locals 2

    .prologue
    .line 123
    const-class v1, Landroid/view/WindowManagerGlobal;

    monitor-enter v1

    .line 124
    :try_start_0
    sget-object v0, Landroid/view/WindowManagerGlobal;->sDefaultWindowManager:Landroid/view/WindowManagerGlobal;

    if-nez v0, :cond_0

    .line 125
    new-instance v0, Landroid/view/WindowManagerGlobal;

    invoke-direct {v0}, Landroid/view/WindowManagerGlobal;-><init>()V

    sput-object v0, Landroid/view/WindowManagerGlobal;->sDefaultWindowManager:Landroid/view/WindowManagerGlobal;

    .line 127
    :cond_0
    sget-object v0, Landroid/view/WindowManagerGlobal;->sDefaultWindowManager:Landroid/view/WindowManagerGlobal;

    monitor-exit v1

    return-object v0

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getWindowManagerService()Landroid/view/IWindowManager;
    .locals 2

    .prologue
    .line 132
    const-class v1, Landroid/view/WindowManagerGlobal;

    monitor-enter v1

    .line 133
    :try_start_0
    sget-object v0, Landroid/view/WindowManagerGlobal;->sWindowManagerService:Landroid/view/IWindowManager;

    if-nez v0, :cond_0

    .line 134
    const-string v0, "window"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v0

    sput-object v0, Landroid/view/WindowManagerGlobal;->sWindowManagerService:Landroid/view/IWindowManager;

    .line 137
    :cond_0
    sget-object v0, Landroid/view/WindowManagerGlobal;->sWindowManagerService:Landroid/view/IWindowManager;

    monitor-exit v1

    return-object v0

    .line 138
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static getWindowName(Landroid/view/ViewRootImpl;)Ljava/lang/String;
    .locals 2
    .parameter "root"

    .prologue
    .line 492
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/view/ViewRootImpl;->mWindowAttributes:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v1}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getWindowSession(Landroid/os/Looper;)Landroid/view/IWindowSession;
    .locals 7
    .parameter "mainLooper"

    .prologue
    .line 142
    const-class v5, Landroid/view/WindowManagerGlobal;

    monitor-enter v5

    .line 143
    :try_start_0
    sget-object v4, Landroid/view/WindowManagerGlobal;->sWindowSession:Landroid/view/IWindowSession;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_0

    .line 145
    :try_start_1
    invoke-static {p0}, Landroid/view/inputmethod/InputMethodManager;->getInstance(Landroid/os/Looper;)Landroid/view/inputmethod/InputMethodManager;

    move-result-object v2

    .line 146
    .local v2, imm:Landroid/view/inputmethod/InputMethodManager;
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    move-result-object v3

    .line 147
    .local v3, windowManager:Landroid/view/IWindowManager;
    invoke-virtual {v2}, Landroid/view/inputmethod/InputMethodManager;->getClient()Lcom/android/internal/view/IInputMethodClient;

    move-result-object v4

    invoke-virtual {v2}, Landroid/view/inputmethod/InputMethodManager;->getInputContext()Lcom/android/internal/view/IInputContext;

    move-result-object v6

    invoke-interface {v3, v4, v6}, Landroid/view/IWindowManager;->openSession(Lcom/android/internal/view/IInputMethodClient;Lcom/android/internal/view/IInputContext;)Landroid/view/IWindowSession;

    move-result-object v4

    sput-object v4, Landroid/view/WindowManagerGlobal;->sWindowSession:Landroid/view/IWindowSession;

    .line 149
    const/4 v4, 0x2

    invoke-interface {v3, v4}, Landroid/view/IWindowManager;->getAnimationScale(I)F

    move-result v0

    .line 150
    .local v0, animatorScale:F
    invoke-static {v0}, Landroid/animation/ValueAnimator;->setDurationScale(F)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 155
    .end local v0           #animatorScale:F
    .end local v2           #imm:Landroid/view/inputmethod/InputMethodManager;
    .end local v3           #windowManager:Landroid/view/IWindowManager;
    :cond_0
    :goto_0
    :try_start_2
    sget-object v4, Landroid/view/WindowManagerGlobal;->sWindowSession:Landroid/view/IWindowSession;

    monitor-exit v5

    return-object v4

    .line 151
    :catch_0
    move-exception v1

    .line 152
    .local v1, e:Landroid/os/RemoteException;
    const-string v4, "WindowManager"

    const-string v6, "Failed to open window session"

    invoke-static {v4, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 156
    .end local v1           #e:Landroid/os/RemoteException;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4
.end method

.method public static peekWindowSession()Landroid/view/IWindowSession;
    .locals 2

    .prologue
    .line 160
    const-class v1, Landroid/view/WindowManagerGlobal;

    monitor-enter v1

    .line 161
    :try_start_0
    sget-object v0, Landroid/view/WindowManagerGlobal;->sWindowSession:Landroid/view/IWindowSession;

    monitor-exit v1

    return-object v0

    .line 162
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static removeItem([Ljava/lang/Object;[Ljava/lang/Object;I)V
    .locals 2
    .parameter "dst"
    .parameter "src"
    .parameter "index"

    .prologue
    const/4 v1, 0x0

    .line 365
    array-length v0, p0

    if-lez v0, :cond_1

    .line 366
    if-lez p2, :cond_0

    .line 367
    invoke-static {p1, v1, p0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 369
    :cond_0
    array-length v0, p0

    if-ge p2, v0, :cond_1

    .line 370
    add-int/lit8 v0, p2, 0x1

    array-length v1, p1

    sub-int/2addr v1, p2

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v0, p0, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 373
    :cond_1
    return-void
.end method

.method private removeViewLocked(IZ)Landroid/view/View;
    .locals 8
    .parameter "index"
    .parameter "immediate"

    .prologue
    .line 329
    iget-object v7, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v2, v7, p1

    .line 330
    .local v2, root:Landroid/view/ViewRootImpl;
    invoke-virtual {v2}, Landroid/view/ViewRootImpl;->getView()Landroid/view/View;

    move-result-object v6

    .line 332
    .local v6, view:Landroid/view/View;
    if-eqz v6, :cond_0

    .line 333
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Landroid/view/inputmethod/InputMethodManager;->getInstance(Landroid/content/Context;)Landroid/view/inputmethod/InputMethodManager;

    move-result-object v1

    .line 334
    .local v1, imm:Landroid/view/inputmethod/InputMethodManager;
    if-eqz v1, :cond_0

    .line 335
    iget-object v7, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    aget-object v7, v7, p1

    invoke-virtual {v7}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/view/inputmethod/InputMethodManager;->windowDismissed(Landroid/os/IBinder;)V

    .line 338
    .end local v1           #imm:Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    invoke-virtual {v2, p2}, Landroid/view/ViewRootImpl;->die(Z)V

    .line 340
    iget-object v7, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v0, v7

    .line 343
    .local v0, count:I
    add-int/lit8 v7, v0, -0x1

    new-array v5, v7, [Landroid/view/View;

    .line 344
    .local v5, tmpViews:[Landroid/view/View;
    iget-object v7, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    invoke-static {v5, v7, p1}, Landroid/view/WindowManagerGlobal;->removeItem([Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 345
    iput-object v5, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    .line 347
    add-int/lit8 v7, v0, -0x1

    new-array v4, v7, [Landroid/view/ViewRootImpl;

    .line 348
    .local v4, tmpRoots:[Landroid/view/ViewRootImpl;
    iget-object v7, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    invoke-static {v4, v7, p1}, Landroid/view/WindowManagerGlobal;->removeItem([Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 349
    iput-object v4, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    .line 351
    add-int/lit8 v7, v0, -0x1

    new-array v3, v7, [Landroid/view/WindowManager$LayoutParams;

    .line 353
    .local v3, tmpParams:[Landroid/view/WindowManager$LayoutParams;
    iget-object v7, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    invoke-static {v3, v7, p1}, Landroid/view/WindowManagerGlobal;->removeItem([Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 354
    iput-object v3, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    .line 356
    if-eqz v6, :cond_1

    .line 357
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/view/View;->assignParent(Landroid/view/ViewParent;)V

    .line 361
    :cond_1
    return-object v6
.end method


# virtual methods
.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;Landroid/view/Display;Landroid/view/Window;)V
    .locals 14
    .parameter "view"
    .parameter "params"
    .parameter "display"
    .parameter "parentWindow"

    .prologue
    .line 167
    if-nez p1, :cond_0

    .line 168
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "view must not be null"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 170
    :cond_0
    if-nez p3, :cond_1

    .line 171
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "display must not be null"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 173
    :cond_1
    move-object/from16 v0, p2

    instance-of v9, v0, Landroid/view/WindowManager$LayoutParams;

    if-nez v9, :cond_2

    .line 174
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "Params must be WindowManager.LayoutParams"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    :cond_2
    move-object/from16 v8, p2

    .line 177
    check-cast v8, Landroid/view/WindowManager$LayoutParams;

    .line 178
    .local v8, wparams:Landroid/view/WindowManager$LayoutParams;
    if-eqz p4, :cond_3

    .line 179
    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Landroid/view/Window;->adjustLayoutParamsForSubWindow(Landroid/view/WindowManager$LayoutParams;)V

    .line 183
    :cond_3
    const/4 v6, 0x0

    .line 185
    .local v6, panelParentView:Landroid/view/View;
    iget-object v10, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v10

    .line 187
    :try_start_0
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mSystemPropertyUpdater:Ljava/lang/Runnable;

    if-nez v9, :cond_4

    .line 188
    new-instance v9, Landroid/view/WindowManagerGlobal$1;

    invoke-direct {v9, p0}, Landroid/view/WindowManagerGlobal$1;-><init>(Landroid/view/WindowManagerGlobal;)V

    iput-object v9, p0, Landroid/view/WindowManagerGlobal;->mSystemPropertyUpdater:Ljava/lang/Runnable;

    .line 197
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mSystemPropertyUpdater:Ljava/lang/Runnable;

    invoke-static {v9}, Landroid/os/SystemProperties;->addChangeCallback(Ljava/lang/Runnable;)V

    .line 200
    :cond_4
    const/4 v9, 0x0

    invoke-direct {p0, p1, v9}, Landroid/view/WindowManagerGlobal;->findViewLocked(Landroid/view/View;Z)I

    move-result v4

    .line 201
    .local v4, index:I
    if-ltz v4, :cond_5

    .line 202
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "View "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " has already been added to the window manager."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 244
    .end local v4           #index:I
    :catchall_0
    move-exception v9

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v9

    .line 208
    .restart local v4       #index:I
    :cond_5
    :try_start_1
    iget v9, v8, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v11, 0x3e8

    if-lt v9, v11, :cond_8

    iget v9, v8, Landroid/view/WindowManager$LayoutParams;->type:I

    const/16 v11, 0x7cf

    if-gt v9, v11, :cond_8

    .line 210
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-eqz v9, :cond_7

    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v1, v9

    .line 211
    .local v1, count:I
    :goto_0
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v1, :cond_8

    .line 212
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v9, v9, v3

    iget-object v9, v9, Landroid/view/ViewRootImpl;->mWindow:Landroid/view/ViewRootImpl$W;

    invoke-virtual {v9}, Landroid/view/ViewRootImpl$W;->asBinder()Landroid/os/IBinder;

    move-result-object v9

    iget-object v11, v8, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-ne v9, v11, :cond_6

    .line 213
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    aget-object v6, v9, v3

    .line 211
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 210
    .end local v1           #count:I
    .end local v3           #i:I
    :cond_7
    const/4 v1, 0x0

    goto :goto_0

    .line 218
    :cond_8
    new-instance v7, Landroid/view/ViewRootImpl;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    move-object/from16 v0, p3

    invoke-direct {v7, v9, v0}, Landroid/view/ViewRootImpl;-><init>(Landroid/content/Context;Landroid/view/Display;)V

    .line 220
    .local v7, root:Landroid/view/ViewRootImpl;
    invoke-virtual {p1, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 222
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-nez v9, :cond_9

    .line 223
    const/4 v4, 0x1

    .line 224
    const/4 v9, 0x1

    new-array v9, v9, [Landroid/view/View;

    iput-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    .line 225
    const/4 v9, 0x1

    new-array v9, v9, [Landroid/view/ViewRootImpl;

    iput-object v9, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    .line 226
    const/4 v9, 0x1

    new-array v9, v9, [Landroid/view/WindowManager$LayoutParams;

    iput-object v9, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    .line 239
    :goto_2
    add-int/lit8 v4, v4, -0x1

    .line 241
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    aput-object p1, v9, v4

    .line 242
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aput-object v7, v9, v4

    .line 243
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    aput-object v8, v9, v4

    .line 244
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    :try_start_2
    invoke-virtual {v7, p1, v8, v6}, Landroid/view/ViewRootImpl;->setView(Landroid/view/View;Landroid/view/WindowManager$LayoutParams;Landroid/view/View;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 259
    return-void

    .line 228
    :cond_9
    :try_start_3
    iget-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v9, v9

    add-int/lit8 v4, v9, 0x1

    .line 229
    iget-object v5, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    .line 230
    .local v5, old:[Ljava/lang/Object;
    new-array v9, v4, [Landroid/view/View;

    iput-object v9, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    .line 231
    const/4 v9, 0x0

    iget-object v11, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    const/4 v12, 0x0

    add-int/lit8 v13, v4, -0x1

    invoke-static {v5, v9, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    iget-object v5, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    .line 233
    new-array v9, v4, [Landroid/view/ViewRootImpl;

    iput-object v9, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    .line 234
    const/4 v9, 0x0

    iget-object v11, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    const/4 v12, 0x0

    add-int/lit8 v13, v4, -0x1

    invoke-static {v5, v9, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 235
    iget-object v5, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    .line 236
    new-array v9, v4, [Landroid/view/WindowManager$LayoutParams;

    iput-object v9, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    .line 237
    const/4 v9, 0x0

    iget-object v11, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    const/4 v12, 0x0

    add-int/lit8 v13, v4, -0x1

    invoke-static {v5, v9, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 249
    .end local v5           #old:[Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 251
    .local v2, e:Ljava/lang/RuntimeException;
    iget-object v10, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v10

    .line 252
    const/4 v9, 0x0

    :try_start_4
    invoke-direct {p0, p1, v9}, Landroid/view/WindowManagerGlobal;->findViewLocked(Landroid/view/View;Z)I

    move-result v4

    .line 253
    if-ltz v4, :cond_a

    .line 254
    const/4 v9, 0x1

    invoke-direct {p0, v4, v9}, Landroid/view/WindowManagerGlobal;->removeViewLocked(IZ)Landroid/view/View;

    .line 256
    :cond_a
    monitor-exit v10
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 257
    throw v2

    .line 256
    :catchall_1
    move-exception v9

    :try_start_5
    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v9
.end method

.method public closeAll(Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "token"
    .parameter "who"
    .parameter "what"

    .prologue
    .line 299
    iget-object v5, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 300
    :try_start_0
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-nez v4, :cond_0

    .line 301
    monitor-exit v5

    .line 326
    :goto_0
    return-void

    .line 303
    :cond_0
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v0, v4

    .line 305
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_4

    .line 308
    if-eqz p1, :cond_1

    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    aget-object v4, v4, v1

    iget-object v4, v4, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-ne v4, p1, :cond_3

    .line 309
    :cond_1
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v3, v4, v1

    .line 312
    .local v3, root:Landroid/view/ViewRootImpl;
    if-eqz p2, :cond_2

    .line 313
    new-instance v2, Landroid/view/WindowLeaked;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " has leaked window "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Landroid/view/ViewRootImpl;->getView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " that was originally added here"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/view/WindowLeaked;-><init>(Ljava/lang/String;)V

    .line 316
    .local v2, leak:Landroid/view/WindowLeaked;
    invoke-virtual {v3}, Landroid/view/ViewRootImpl;->getLocation()Landroid/view/WindowLeaked;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/WindowLeaked;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/view/WindowLeaked;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 317
    const-string v4, "WindowManager"

    invoke-virtual {v2}, Landroid/view/WindowLeaked;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 320
    .end local v2           #leak:Landroid/view/WindowLeaked;
    :cond_2
    const/4 v4, 0x0

    invoke-direct {p0, v1, v4}, Landroid/view/WindowManagerGlobal;->removeViewLocked(IZ)Landroid/view/View;

    .line 321
    add-int/lit8 v1, v1, -0x1

    .line 322
    add-int/lit8 v0, v0, -0x1

    .line 305
    .end local v3           #root:Landroid/view/ViewRootImpl;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 325
    :cond_4
    monitor-exit v5

    goto :goto_0

    .end local v0           #count:I
    .end local v1           #i:I
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public dumpGfxInfo(Ljava/io/FileDescriptor;)V
    .locals 17
    .parameter "fd"

    .prologue
    .line 436
    new-instance v3, Ljava/io/FileOutputStream;

    move-object/from16 v0, p1

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 437
    .local v3, fout:Ljava/io/FileOutputStream;
    new-instance v7, Ljava/io/PrintWriter;

    invoke-direct {v7, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 439
    .local v7, pw:Ljava/io/PrintWriter;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 440
    :try_start_1
    move-object/from16 v0, p0

    iget-object v11, v0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-eqz v11, :cond_4

    .line 441
    move-object/from16 v0, p0

    iget-object v11, v0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v1, v11

    .line 443
    .local v1, count:I
    const-string v11, "Profile data in ms:"

    invoke-virtual {v7, v11}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 445
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v1, :cond_1

    .line 446
    move-object/from16 v0, p0

    iget-object v11, v0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v9, v11, v4

    .line 447
    .local v9, root:Landroid/view/ViewRootImpl;
    invoke-static {v9}, Landroid/view/WindowManagerGlobal;->getWindowName(Landroid/view/ViewRootImpl;)Ljava/lang/String;

    move-result-object v6

    .line 448
    .local v6, name:Ljava/lang/String;
    const-string v11, "\n\t%s"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v6, v13, v14

    invoke-virtual {v7, v11, v13}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 450
    invoke-virtual {v9}, Landroid/view/ViewRootImpl;->getView()Landroid/view/View;

    move-result-object v11

    iget-object v11, v11, Landroid/view/View;->mAttachInfo:Landroid/view/View$AttachInfo;

    iget-object v8, v11, Landroid/view/View$AttachInfo;->mHardwareRenderer:Landroid/view/HardwareRenderer;

    .line 452
    .local v8, renderer:Landroid/view/HardwareRenderer;
    if-eqz v8, :cond_0

    .line 453
    invoke-virtual {v8, v7}, Landroid/view/HardwareRenderer;->dumpGfxInfo(Ljava/io/PrintWriter;)V

    .line 445
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 457
    .end local v6           #name:Ljava/lang/String;
    .end local v8           #renderer:Landroid/view/HardwareRenderer;
    .end local v9           #root:Landroid/view/ViewRootImpl;
    :cond_1
    const-string v11, "\nView hierarchy:\n"

    invoke-virtual {v7, v11}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 459
    const/4 v10, 0x0

    .line 460
    .local v10, viewsCount:I
    const/4 v2, 0x0

    .line 461
    .local v2, displayListsSize:I
    const/4 v11, 0x2

    new-array v5, v11, [I

    .line 463
    .local v5, info:[I
    const/4 v4, 0x0

    :goto_1
    if-ge v4, v1, :cond_3

    .line 464
    move-object/from16 v0, p0

    iget-object v11, v0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v9, v11, v4

    .line 465
    .restart local v9       #root:Landroid/view/ViewRootImpl;
    invoke-virtual {v9, v5}, Landroid/view/ViewRootImpl;->dumpGfxInfo([I)V

    .line 467
    invoke-static {v9}, Landroid/view/WindowManagerGlobal;->getWindowName(Landroid/view/ViewRootImpl;)Ljava/lang/String;

    move-result-object v6

    .line 468
    .restart local v6       #name:Ljava/lang/String;
    const-string v11, "  %s\n  %d views, %.2f kB of display lists"

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v6, v13, v14

    const/4 v14, 0x1

    const/4 v15, 0x0

    aget v15, v5, v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    const/4 v15, 0x1

    aget v15, v5, v15

    int-to-float v15, v15

    const/high16 v16, 0x4480

    div-float v15, v15, v16

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v7, v11, v13}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 470
    invoke-virtual {v9}, Landroid/view/ViewRootImpl;->getView()Landroid/view/View;

    move-result-object v11

    iget-object v11, v11, Landroid/view/View;->mAttachInfo:Landroid/view/View$AttachInfo;

    iget-object v8, v11, Landroid/view/View$AttachInfo;->mHardwareRenderer:Landroid/view/HardwareRenderer;

    .line 472
    .restart local v8       #renderer:Landroid/view/HardwareRenderer;
    if-eqz v8, :cond_2

    .line 473
    const-string v11, ", %d frames rendered"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-virtual {v8}, Landroid/view/HardwareRenderer;->getFrameCount()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v7, v11, v13}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 475
    :cond_2
    const-string v11, "\n\n"

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Object;

    invoke-virtual {v7, v11, v13}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 477
    const/4 v11, 0x0

    aget v11, v5, v11

    add-int/2addr v10, v11

    .line 478
    const/4 v11, 0x1

    aget v11, v5, v11

    add-int/2addr v2, v11

    .line 463
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 481
    .end local v6           #name:Ljava/lang/String;
    .end local v8           #renderer:Landroid/view/HardwareRenderer;
    .end local v9           #root:Landroid/view/ViewRootImpl;
    :cond_3
    const-string v11, "\nTotal ViewRootImpl: %d\n"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v7, v11, v13}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 482
    const-string v11, "Total Views:        %d\n"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v7, v11, v13}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 483
    const-string v11, "Total DisplayList:  %.2f kB\n\n"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    int-to-float v15, v2

    const/high16 v16, 0x4480

    div-float v15, v15, v16

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v7, v11, v13}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 485
    .end local v1           #count:I
    .end local v2           #displayListsSize:I
    .end local v4           #i:I
    .end local v5           #info:[I
    .end local v10           #viewsCount:I
    :cond_4
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 487
    invoke-virtual {v7}, Ljava/io/PrintWriter;->flush()V

    .line 489
    return-void

    .line 485
    :catchall_0
    move-exception v11

    :try_start_2
    monitor-exit v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 487
    :catchall_1
    move-exception v11

    invoke-virtual {v7}, Ljava/io/PrintWriter;->flush()V

    throw v11
.end method

.method public endTrimMemory()V
    .locals 1

    .prologue
    .line 417
    invoke-static {}, Landroid/view/HardwareRenderer;->endTrimMemory()V

    .line 419
    iget-boolean v0, p0, Landroid/view/WindowManagerGlobal;->mNeedsEglTerminate:Z

    if-eqz v0, :cond_0

    .line 420
    invoke-static {}, Landroid/opengl/ManagedEGLContext;->doTerminate()Z

    .line 421
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/view/WindowManagerGlobal;->mNeedsEglTerminate:Z

    .line 423
    :cond_0
    return-void
.end method

.method public removeView(Landroid/view/View;Z)V
    .locals 6
    .parameter "view"
    .parameter "immediate"

    .prologue
    .line 282
    if-nez p1, :cond_0

    .line 283
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "view must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 286
    :cond_0
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 287
    const/4 v2, 0x1

    :try_start_0
    invoke-direct {p0, p1, v2}, Landroid/view/WindowManagerGlobal;->findViewLocked(Landroid/view/View;Z)I

    move-result v1

    .line 288
    .local v1, index:I
    invoke-direct {p0, v1, p2}, Landroid/view/WindowManagerGlobal;->removeViewLocked(IZ)Landroid/view/View;

    move-result-object v0

    .line 289
    .local v0, curView:Landroid/view/View;
    if-ne v0, p1, :cond_1

    .line 290
    monitor-exit v3

    return-void

    .line 293
    :cond_1
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Calling with view "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " but the ViewAncestor is attached to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 295
    .end local v0           #curView:Landroid/view/View;
    .end local v1           #index:I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public reportNewConfiguration(Landroid/content/res/Configuration;)V
    .locals 6
    .parameter "config"

    .prologue
    .line 511
    iget-object v5, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 512
    :try_start_0
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-eqz v4, :cond_1

    .line 513
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v1, v4

    .line 514
    .local v1, count:I
    new-instance v0, Landroid/content/res/Configuration;

    invoke-direct {v0, p1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 515
    .end local p1
    .local v0, config:Landroid/content/res/Configuration;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 516
    :try_start_1
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v3, v4, v2

    .line 517
    .local v3, root:Landroid/view/ViewRootImpl;
    invoke-virtual {v3, v0}, Landroid/view/ViewRootImpl;->requestUpdateConfiguration(Landroid/content/res/Configuration;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 515
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v3           #root:Landroid/view/ViewRootImpl;
    :cond_0
    move-object p1, v0

    .line 520
    .end local v0           #config:Landroid/content/res/Configuration;
    .end local v1           #count:I
    .end local v2           #i:I
    .restart local p1
    :cond_1
    :try_start_2
    monitor-exit v5

    .line 521
    return-void

    .line 520
    :catchall_0
    move-exception v4

    :goto_1
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .end local p1
    .restart local v0       #config:Landroid/content/res/Configuration;
    .restart local v1       #count:I
    .restart local v2       #i:I
    :catchall_1
    move-exception v4

    move-object p1, v0

    .end local v0           #config:Landroid/content/res/Configuration;
    .restart local p1
    goto :goto_1
.end method

.method public setStoppedState(Landroid/os/IBinder;Z)V
    .locals 5
    .parameter "token"
    .parameter "stopped"

    .prologue
    .line 497
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 498
    :try_start_0
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-eqz v3, :cond_2

    .line 499
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v0, v3

    .line 500
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 501
    if-eqz p1, :cond_0

    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    aget-object v3, v3, v1

    iget-object v3, v3, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    if-ne v3, p1, :cond_1

    .line 502
    :cond_0
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v2, v3, v1

    .line 503
    .local v2, root:Landroid/view/ViewRootImpl;
    invoke-virtual {v2, p2}, Landroid/view/ViewRootImpl;->setStopped(Z)V

    .line 500
    .end local v2           #root:Landroid/view/ViewRootImpl;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 507
    .end local v0           #count:I
    .end local v1           #i:I
    :cond_2
    monitor-exit v4

    .line 508
    return-void

    .line 507
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public startTrimMemory(I)V
    .locals 5
    .parameter "level"

    .prologue
    const/16 v4, 0x50

    .line 391
    invoke-static {}, Landroid/view/HardwareRenderer;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 394
    if-ge p1, v4, :cond_0

    const/16 v2, 0x3c

    if-lt p1, v2, :cond_4

    invoke-static {}, Landroid/app/ActivityManager;->isHighEndGfx()Z

    move-result v2

    if-nez v2, :cond_4

    .line 399
    :cond_0
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 400
    :try_start_0
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-nez v2, :cond_2

    monitor-exit v3

    .line 414
    :cond_1
    :goto_0
    return-void

    .line 401
    :cond_2
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v0, v2

    .line 402
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_3

    .line 403
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/view/ViewRootImpl;->terminateHardwareResources()V

    .line 402
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 405
    :cond_3
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 407
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/view/WindowManagerGlobal;->mNeedsEglTerminate:Z

    .line 408
    invoke-static {v4}, Landroid/view/HardwareRenderer;->startTrimMemory(I)V

    goto :goto_0

    .line 405
    .end local v0           #count:I
    .end local v1           #i:I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 412
    :cond_4
    invoke-static {p1}, Landroid/view/HardwareRenderer;->startTrimMemory(I)V

    goto :goto_0
.end method

.method public trimLocalMemory()V
    .locals 4

    .prologue
    .line 426
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 427
    :try_start_0
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    if-nez v2, :cond_0

    monitor-exit v3

    .line 433
    :goto_0
    return-void

    .line 428
    :cond_0
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mViews:[Landroid/view/View;

    array-length v0, v2

    .line 429
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 430
    iget-object v2, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/view/ViewRootImpl;->destroyHardwareLayers()V

    .line 429
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 432
    :cond_1
    monitor-exit v3

    goto :goto_0

    .end local v0           #count:I
    .end local v1           #i:I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 5
    .parameter "view"
    .parameter "params"

    .prologue
    .line 262
    if-nez p1, :cond_0

    .line 263
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "view must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 265
    :cond_0
    instance-of v3, p2, Landroid/view/WindowManager$LayoutParams;

    if-nez v3, :cond_1

    .line 266
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Params must be WindowManager.LayoutParams"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    move-object v2, p2

    .line 269
    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    .line 271
    .local v2, wparams:Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 273
    iget-object v4, p0, Landroid/view/WindowManagerGlobal;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 274
    const/4 v3, 0x1

    :try_start_0
    invoke-direct {p0, p1, v3}, Landroid/view/WindowManagerGlobal;->findViewLocked(Landroid/view/View;Z)I

    move-result v0

    .line 275
    .local v0, index:I
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mRoots:[Landroid/view/ViewRootImpl;

    aget-object v1, v3, v0

    .line 276
    .local v1, root:Landroid/view/ViewRootImpl;
    iget-object v3, p0, Landroid/view/WindowManagerGlobal;->mParams:[Landroid/view/WindowManager$LayoutParams;

    aput-object v2, v3, v0

    .line 277
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewRootImpl;->setLayoutParams(Landroid/view/WindowManager$LayoutParams;Z)V

    .line 278
    monitor-exit v4

    .line 279
    return-void

    .line 278
    .end local v0           #index:I
    .end local v1           #root:Landroid/view/ViewRootImpl;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method
