.class public final Lcom/mediatek/calloption/SimAssociateHandler;
.super Landroid/os/HandlerThread;
.source "SimAssociateHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;,
        Lcom/mediatek/calloption/SimAssociateHandler$ContactContentObserver;
    }
.end annotation


# static fields
.field public static final ASSOCIATE_CHANGED:Ljava/lang/String; = "com.android.contacts.associate_changed"

.field private static final MIN_MATCH:I = 0x7

.field private static final MSG_LOAD:I = 0x0

.field private static final MSG_QUIT:I = 0x1

.field private static final MSG_REFRESH:I = 0x2

.field private static final TAG:Ljava/lang/String; = "SimAssociateHandler"

.field private static sMe:Lcom/mediatek/calloption/SimAssociateHandler;


# instance fields
.field private mCacheDirty:Z

.field mContactContentObserver:Lcom/mediatek/calloption/SimAssociateHandler$ContactContentObserver;

.field protected mContext:Landroid/content/Context;

.field private mLoading:Z

.field protected mMyHandler:Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;

.field protected mMyReceiver:Landroid/content/BroadcastReceiver;

.field protected mSimAssociationMaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList;",
            ">;"
        }
    .end annotation
.end field

.field private mStarted:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    const/4 v4, 0x1

    .line 72
    const-string v1, "SimAssociateHandler"

    invoke-direct {p0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 39
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mSimAssociationMaps:Ljava/util/HashMap;

    .line 46
    new-instance v1, Lcom/mediatek/calloption/SimAssociateHandler$1;

    invoke-direct {v1, p0}, Lcom/mediatek/calloption/SimAssociateHandler$1;-><init>(Lcom/mediatek/calloption/SimAssociateHandler;)V

    iput-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyReceiver:Landroid/content/BroadcastReceiver;

    .line 73
    iput-object p1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContext:Landroid/content/Context;

    .line 74
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.android.contacts.associate_changed"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 75
    .local v0, filter:Landroid/content/IntentFilter;
    new-instance v1, Lcom/mediatek/calloption/SimAssociateHandler$ContactContentObserver;

    invoke-direct {v1, p0}, Lcom/mediatek/calloption/SimAssociateHandler$ContactContentObserver;-><init>(Lcom/mediatek/calloption/SimAssociateHandler;)V

    iput-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContactContentObserver:Lcom/mediatek/calloption/SimAssociateHandler$ContactContentObserver;

    .line 76
    iget-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 77
    iget-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    iget-object v3, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContactContentObserver:Lcom/mediatek/calloption/SimAssociateHandler$ContactContentObserver;

    invoke-virtual {v1, v2, v4, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 80
    iput-boolean v4, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mCacheDirty:Z

    .line 81
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/calloption/SimAssociateHandler;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-boolean v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mCacheDirty:Z

    return v0
.end method

.method static synthetic access$002(Lcom/mediatek/calloption/SimAssociateHandler;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 21
    iput-boolean p1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mCacheDirty:Z

    return p1
.end method

.method static synthetic access$102(Lcom/mediatek/calloption/SimAssociateHandler;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 21
    iput-boolean p1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mLoading:Z

    return p1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/mediatek/calloption/SimAssociateHandler;
    .locals 2
    .parameter "context"

    .prologue
    .line 88
    const-class v1, Lcom/mediatek/calloption/SimAssociateHandler;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/mediatek/calloption/SimAssociateHandler;->sMe:Lcom/mediatek/calloption/SimAssociateHandler;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Lcom/mediatek/calloption/SimAssociateHandler;

    invoke-direct {v0, p0}, Lcom/mediatek/calloption/SimAssociateHandler;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/mediatek/calloption/SimAssociateHandler;->sMe:Lcom/mediatek/calloption/SimAssociateHandler;

    .line 91
    :cond_0
    sget-object v0, Lcom/mediatek/calloption/SimAssociateHandler;->sMe:Lcom/mediatek/calloption/SimAssociateHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public load()V
    .locals 2

    .prologue
    .line 116
    monitor-enter p0

    .line 117
    :try_start_0
    const-string v0, "load"

    invoke-virtual {p0, v0}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    .line 118
    iget-boolean v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mLoading:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mCacheDirty:Z

    if-nez v0, :cond_1

    .line 119
    :cond_0
    monitor-exit p0

    .line 129
    :goto_0
    return-void

    .line 121
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mLoading:Z

    .line 122
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyHandler:Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 123
    const-string v0, "duplicate MSG_LOAD"

    invoke-virtual {p0, v0}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    .line 128
    :goto_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 125
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyHandler:Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->sendEmptyMessage(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 84
    const-string v0, "SimAssociateHandler"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    return-void
.end method

.method public prepair()V
    .locals 2

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/mediatek/calloption/SimAssociateHandler;->start()V

    .line 96
    new-instance v0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;

    invoke-virtual {p0}, Lcom/mediatek/calloption/SimAssociateHandler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;-><init>(Lcom/mediatek/calloption/SimAssociateHandler;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyHandler:Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;

    .line 97
    return-void
.end method

.method public query(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .parameter "number"

    .prologue
    .line 108
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, strNumber:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x7

    if-le v1, v2, :cond_0

    .line 110
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x7

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 112
    :cond_0
    iget-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mSimAssociationMaps:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    return-object v1
.end method

.method public relase()V
    .locals 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyHandler:Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyHandler:Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->sendEmptyMessage(I)Z

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mMyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 104
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/calloption/SimAssociateHandler;->mContactContentObserver:Lcom/mediatek/calloption/SimAssociateHandler$ContactContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 105
    return-void
.end method
