.class public Lcom/android/browser/BrowserActivity;
.super Landroid/app/Activity;
.source "BrowserActivity.java"


# static fields
.field public static final ACTION_NOTIFICATIONS:Ljava/lang/String; = "notifications"

.field public static final ACTION_RESTART:Ljava/lang/String; = "--restart--"

.field public static final ACTION_SHOW_BOOKMARKS:Ljava/lang/String; = "show_bookmarks"

.field public static final ACTION_SHOW_BROWSER:Ljava/lang/String; = "show_browser"

.field public static final EXTRA_BODY:Ljava/lang/String; = "BODY"

.field public static final EXTRA_COUNTER:Ljava/lang/String; = "COUNTER"

.field public static final EXTRA_DISABLE_URL_OVERRIDE:Ljava/lang/String; = "disable_url_override"

.field public static final EXTRA_POSITION:Ljava/lang/String; = "Position"

.field public static final EXTRA_SHOWN:Ljava/lang/String; = "Shown"

.field private static final EXTRA_STATE:Ljava/lang/String; = "state"

.field public static final EXTRA_TITLE:Ljava/lang/String; = "TITLE"

.field private static final LOGTAG:Ljava/lang/String; = "browser"

.field private static final LOGV_ENABLED:Z = false

.field private static final XLOGTAG:Ljava/lang/String; = "browser/BrowserActivity"


# instance fields
.field private mController:Lcom/android/browser/ActivityController;

.field private mKeyguardManager:Landroid/app/KeyguardManager;

.field private mPowerManager:Landroid/os/PowerManager;

.field private mUi:Lcom/android/browser/UI;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 71
    sget-object v0, Lcom/android/browser/stub/NullController;->INSTANCE:Lcom/android/browser/stub/NullController;

    iput-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    return-void
.end method

.method private createController()Lcom/android/browser/Controller;
    .locals 3

    .prologue
    .line 119
    new-instance v0, Lcom/android/browser/Controller;

    invoke-direct {v0, p0}, Lcom/android/browser/Controller;-><init>(Landroid/app/Activity;)V

    .line 120
    .local v0, controller:Lcom/android/browser/Controller;
    invoke-static {p0}, Lcom/android/browser/BrowserActivity;->isTablet(Landroid/content/Context;)Z

    move-result v2

    .line 121
    .local v2, xlarge:Z
    const/4 v1, 0x0

    .line 122
    .local v1, ui:Lcom/android/browser/UI;
    if-eqz v2, :cond_0

    .line 123
    new-instance v1, Lcom/android/browser/XLargeUi;

    .end local v1           #ui:Lcom/android/browser/UI;
    invoke-direct {v1, p0, v0}, Lcom/android/browser/XLargeUi;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;)V

    .line 127
    .restart local v1       #ui:Lcom/android/browser/UI;
    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/browser/Controller;->setUi(Lcom/android/browser/UI;)V

    .line 128
    return-object v0

    .line 125
    :cond_0
    new-instance v1, Lcom/android/browser/PhoneUi;

    .end local v1           #ui:Lcom/android/browser/UI;
    invoke-direct {v1, p0, v0}, Lcom/android/browser/PhoneUi;-><init>(Landroid/app/Activity;Lcom/android/browser/UiController;)V

    .restart local v1       #ui:Lcom/android/browser/UI;
    goto :goto_0
.end method

.method public static isTablet(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 115
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f09

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    return v0
.end method

.method private shouldIgnoreIntents()Z
    .locals 2

    .prologue
    .line 196
    iget-object v1, p0, Lcom/android/browser/BrowserActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-nez v1, :cond_0

    .line 197
    const-string v1, "keyguard"

    invoke-virtual {p0, v1}, Lcom/android/browser/BrowserActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/KeyguardManager;

    iput-object v1, p0, Lcom/android/browser/BrowserActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 199
    :cond_0
    iget-object v1, p0, Lcom/android/browser/BrowserActivity;->mPowerManager:Landroid/os/PowerManager;

    if-nez v1, :cond_1

    .line 200
    const-string v1, "power"

    invoke-virtual {p0, v1}, Lcom/android/browser/BrowserActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    iput-object v1, p0, Lcom/android/browser/BrowserActivity;->mPowerManager:Landroid/os/PowerManager;

    .line 202
    :cond_1
    iget-object v1, p0, Lcom/android/browser/BrowserActivity;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v1}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v0, 0x1

    .line 203
    .local v0, ignore:Z
    :goto_0
    iget-object v1, p0, Lcom/android/browser/BrowserActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    invoke-virtual {v1}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v1

    or-int/2addr v0, v1

    .line 207
    return v0

    .line 202
    .end local v0           #ignore:Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 377
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 353
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 359
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 365
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 371
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getController()Lcom/android/browser/Controller;
    .locals 1
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    check-cast v0, Lcom/android/browser/Controller;

    return-object v0
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 336
    invoke-super {p0, p1}, Landroid/app/Activity;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 337
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 338
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 330
    invoke-super {p0, p1}, Landroid/app/Activity;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 331
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 332
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    .line 343
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/browser/ActivityController;->onActivityResult(IILandroid/content/Intent;)V

    .line 344
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .parameter "newConfig"

    .prologue
    .line 269
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 270
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onConfgurationChanged(Landroid/content/res/Configuration;)V

    .line 271
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 307
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onContextMenuClosed(Landroid/view/Menu;)V
    .locals 1
    .parameter "menu"

    .prologue
    .line 234
    invoke-super {p0, p1}, Landroid/app/Activity;->onContextMenuClosed(Landroid/view/Menu;)V

    .line 235
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onContextMenuClosed(Landroid/view/Menu;)V

    .line 236
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "icicle"

    .prologue
    const/4 v0, 0x0

    .line 89
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 92
    invoke-static {p0}, Lcom/android/browser/BrowserActivity;->isTablet(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 97
    :cond_0
    invoke-direct {p0}, Lcom/android/browser/BrowserActivity;->shouldIgnoreIntents()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 98
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->finish()V

    .line 112
    :goto_0
    return-void

    .line 104
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/android/browser/IntentHandler;->handleWebSearchIntent(Landroid/app/Activity;Lcom/android/browser/Controller;Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 105
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->finish()V

    goto :goto_0

    .line 108
    :cond_2
    invoke-direct {p0}, Lcom/android/browser/BrowserActivity;->createController()Lcom/android/browser/Controller;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    .line 110
    if-nez p1, :cond_3

    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 111
    .local v0, intent:Landroid/content/Intent;
    :cond_3
    iget-object v1, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v1, v0}, Lcom/android/browser/ActivityController;->start(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 1
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    .line 302
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/browser/ActivityController;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 303
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 281
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 282
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 262
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 263
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0}, Lcom/android/browser/ActivityController;->onDestroy()V

    .line 264
    sget-object v0, Lcom/android/browser/stub/NullController;->INSTANCE:Lcom/android/browser/stub/NullController;

    iput-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    .line 265
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 312
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1, p2}, Lcom/android/browser/ActivityController;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 318
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1, p2}, Lcom/android/browser/ActivityController;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 324
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1, p2}, Lcom/android/browser/ActivityController;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 1

    .prologue
    .line 275
    invoke-super {p0}, Landroid/app/Activity;->onLowMemory()V

    .line 276
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0}, Lcom/android/browser/ActivityController;->onLowMemory()V

    .line 277
    return-void
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1
    .parameter "featureId"
    .parameter "menu"

    .prologue
    .line 221
    if-nez p1, :cond_0

    .line 222
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1, p2}, Lcom/android/browser/ActivityController;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 224
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 12
    .parameter "intent"

    .prologue
    const/4 v10, -0x1

    .line 138
    invoke-direct {p0}, Lcom/android/browser/BrowserActivity;->shouldIgnoreIntents()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 189
    :cond_0
    :goto_0
    return-void

    .line 144
    :cond_1
    iget-object v8, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    sget-object v9, Lcom/android/browser/stub/NullController;->INSTANCE:Lcom/android/browser/stub/NullController;

    if-ne v8, v9, :cond_2

    .line 145
    const-string v8, "browser/BrowserActivity"

    const-string v9, "onNewIntent for Action_Search Intent reached before finish(), so enter onNewIntent instead of on create"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    invoke-virtual {p0, p1}, Lcom/android/browser/BrowserActivity;->startActivity(Landroid/content/Intent;)V

    .line 148
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->finish()V

    goto :goto_0

    .line 154
    :cond_2
    const-string v8, "notifications"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 156
    const-string v8, "browser/BrowserActivity"

    const-string v9, "ACTION_NOTIFICATIONS.equals(intent.getAction())"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 158
    .local v2, localEditor:Landroid/content/SharedPreferences$Editor;
    const-string v8, "Shown"

    const/4 v9, 0x0

    invoke-interface {v2, v8, v9}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 159
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 160
    const-string v8, "TITLE"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 161
    .local v7, title:Ljava/lang/String;
    const-string v8, "BODY"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, body:Ljava/lang/String;
    const-string v8, "Position"

    invoke-virtual {p1, v8, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 163
    .local v6, position:I
    const-string v8, "COUNTER"

    invoke-virtual {p1, v8, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 164
    .local v1, counter:I
    iget-object v8, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    if-eqz v8, :cond_3

    .line 165
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->getController()Lcom/android/browser/Controller;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/browser/Controller;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v4

    .line 166
    .local v4, localTabControl:Lcom/android/browser/TabControl;
    if-eqz v4, :cond_3

    .line 167
    invoke-virtual {v4, v6}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v3

    .line 168
    .local v3, localTab:Lcom/android/browser/Tab;
    if-eqz v3, :cond_0

    .line 171
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->getController()Lcom/android/browser/Controller;

    move-result-object v8

    invoke-virtual {v8, v3}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    .line 172
    invoke-virtual {v3, v7, v0, v1}, Lcom/android/browser/Tab;->onTest(Ljava/lang/String;Ljava/lang/String;I)V

    .line 178
    .end local v0           #body:Ljava/lang/String;
    .end local v1           #counter:I
    .end local v2           #localEditor:Landroid/content/SharedPreferences$Editor;
    .end local v3           #localTab:Lcom/android/browser/Tab;
    .end local v4           #localTabControl:Lcom/android/browser/TabControl;
    .end local v6           #position:I
    .end local v7           #title:Ljava/lang/String;
    :cond_3
    const-string v8, "--restart--"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 179
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 180
    .local v5, outState:Landroid/os/Bundle;
    iget-object v8, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v8, v5}, Lcom/android/browser/ActivityController;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 181
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->finish()V

    .line 182
    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    new-instance v9, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/android/browser/BrowserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    const-class v11, Lcom/android/browser/BrowserActivity;

    invoke-direct {v9, v10, v11}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v10, 0x1000

    invoke-virtual {v9, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v9

    const-string v10, "state"

    invoke-virtual {v9, v10, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 188
    .end local v5           #outState:Landroid/os/Bundle;
    :cond_4
    iget-object v8, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v8, p1}, Lcom/android/browser/ActivityController;->handleNewIntent(Landroid/content/Intent;)V

    goto/16 :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 293
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 294
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 296
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onOptionsMenuClosed(Landroid/view/Menu;)V
    .locals 1
    .parameter "menu"

    .prologue
    .line 229
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onOptionsMenuClosed(Landroid/view/Menu;)V

    .line 230
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0}, Lcom/android/browser/ActivityController;->onPause()V

    .line 254
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 255
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 287
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 288
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 212
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 216
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0}, Lcom/android/browser/ActivityController;->onResume()V

    .line 217
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .parameter "outState"

    .prologue
    .line 248
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0, p1}, Lcom/android/browser/ActivityController;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 249
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .prologue
    .line 348
    iget-object v0, p0, Lcom/android/browser/BrowserActivity;->mController:Lcom/android/browser/ActivityController;

    invoke-interface {v0}, Lcom/android/browser/ActivityController;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 76
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 77
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 80
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 81
    return-void
.end method
