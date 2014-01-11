.class public Lcom/android/browser/AutofillHandler;
.super Ljava/lang/Object;
.source "AutofillHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/AutofillHandler$1;,
        Lcom/android/browser/AutofillHandler$DeleteProfileFromDbTask;,
        Lcom/android/browser/AutofillHandler$SaveProfileToDbTask;,
        Lcom/android/browser/AutofillHandler$AutoFillProfileDbTask;,
        Lcom/android/browser/AutofillHandler$LoadFromDb;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "AutofillHandler"

.field private static final NO_AUTOFILL_PROFILE_SET:I


# instance fields
.field private mAutoFillActiveProfileId:I

.field private mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;

.field private mContext:Landroid/content/Context;

.field private mLoaded:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 49
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/android/browser/AutofillHandler;->mLoaded:Ljava/util/concurrent/CountDownLatch;

    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/AutofillHandler;->mContext:Landroid/content/Context;

    .line 51
    return-void
.end method

.method static synthetic access$100(Lcom/android/browser/AutofillHandler;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/browser/AutofillHandler;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/browser/AutofillHandler;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget v0, p0, Lcom/android/browser/AutofillHandler;->mAutoFillActiveProfileId:I

    return v0
.end method

.method static synthetic access$202(Lcom/android/browser/AutofillHandler;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput p1, p0, Lcom/android/browser/AutofillHandler;->mAutoFillActiveProfileId:I

    return p1
.end method

.method static synthetic access$300(Lcom/android/browser/AutofillHandler;)Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/browser/AutofillHandler;Landroid/webkit/WebSettingsClassic$AutoFillProfile;)Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/browser/AutofillHandler;)Ljava/util/concurrent/CountDownLatch;
    .locals 1
    .parameter "x0"

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/browser/AutofillHandler;->mLoaded:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method

.method private declared-synchronized setActiveAutoFillProfileId(I)V
    .locals 2
    .parameter "activeProfileId"

    .prologue
    .line 224
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/android/browser/AutofillHandler;->mAutoFillActiveProfileId:I

    .line 225
    iget-object v1, p0, Lcom/android/browser/AutofillHandler;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 227
    .local v0, ed:Landroid/content/SharedPreferences$Editor;
    const-string v1, "autofill_active_profile_id"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 228
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    monitor-exit p0

    return-void

    .line 224
    .end local v0           #ed:Landroid/content/SharedPreferences$Editor;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private waitForLoad()V
    .locals 3

    .prologue
    .line 70
    :try_start_0
    iget-object v1, p0, Lcom/android/browser/AutofillHandler;->mLoaded:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_0
    return-void

    .line 71
    :catch_0
    move-exception v0

    .line 72
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v1, "AutofillHandler"

    const-string v2, "Caught exception while waiting for AutofillProfile to load."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public asyncLoadFromDb()V
    .locals 2

    .prologue
    .line 65
    new-instance v0, Lcom/android/browser/AutofillHandler$LoadFromDb;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/browser/AutofillHandler$LoadFromDb;-><init>(Lcom/android/browser/AutofillHandler;Lcom/android/browser/AutofillHandler$1;)V

    invoke-virtual {v0}, Lcom/android/browser/AutofillHandler$LoadFromDb;->start()V

    .line 66
    return-void
.end method

.method public declared-synchronized getAutoFillProfile()Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    .locals 1

    .prologue
    .line 219
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/browser/AutofillHandler;->waitForLoad()V

    .line 220
    iget-object v0, p0, Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 219
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAutoFillProfile(Landroid/webkit/WebSettingsClassic$AutoFillProfile;Landroid/os/Message;)V
    .locals 5
    .parameter "profile"
    .parameter "msg"

    .prologue
    .line 199
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/browser/AutofillHandler;->waitForLoad()V

    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, profileId:I
    if-eqz p1, :cond_1

    .line 202
    invoke-virtual {p1}, Landroid/webkit/WebSettingsClassic$AutoFillProfile;->getUniqueId()I

    move-result v0

    .line 204
    new-instance v1, Lcom/android/browser/AutofillHandler$SaveProfileToDbTask;

    invoke-direct {v1, p0, p2}, Lcom/android/browser/AutofillHandler$SaveProfileToDbTask;-><init>(Lcom/android/browser/AutofillHandler;Landroid/os/Message;)V

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v1, v2}, Lcom/android/browser/AutofillHandler$SaveProfileToDbTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 214
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    .line 215
    invoke-direct {p0, v0}, Lcom/android/browser/AutofillHandler;->setActiveAutoFillProfileId(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    monitor-exit p0

    return-void

    .line 207
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    if-eqz v1, :cond_0

    .line 208
    new-instance v1, Lcom/android/browser/AutofillHandler$DeleteProfileFromDbTask;

    invoke-direct {v1, p0, p2}, Lcom/android/browser/AutofillHandler$DeleteProfileFromDbTask;-><init>(Lcom/android/browser/AutofillHandler;Landroid/os/Message;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Integer;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    invoke-virtual {v4}, Landroid/webkit/WebSettingsClassic$AutoFillProfile;->getUniqueId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/android/browser/AutofillHandler$DeleteProfileFromDbTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 199
    .end local v0           #profileId:I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
