.class public Lcom/mediatek/phone/provider/CallHistoryAsync;
.super Ljava/lang/Object;
.source "CallHistoryAsync.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/provider/CallHistoryAsync$1;,
        Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;,
        Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;,
        Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;,
        Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;,
        Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;,
        Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CallHistoryAsync"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 173
    return-void
.end method

.method private assertUiThread()V
    .locals 2

    .prologue
    .line 193
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 194
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not on the UI thread!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 196
    :cond_0
    return-void
.end method


# virtual methods
.method public addCall(Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;)Landroid/os/AsyncTask;
    .locals 3
    .parameter "args"

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/mediatek/phone/provider/CallHistoryAsync;->assertUiThread()V

    .line 125
    new-instance v0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;-><init>(Lcom/mediatek/phone/provider/CallHistoryAsync;Lcom/mediatek/phone/provider/CallHistoryAsync$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    return-object v0
.end method

.method public deleteCall(Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;)Landroid/os/AsyncTask;
    .locals 3
    .parameter "args"

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/mediatek/phone/provider/CallHistoryAsync;->assertUiThread()V

    .line 78
    new-instance v0, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;-><init>(Lcom/mediatek/phone/provider/CallHistoryAsync;Lcom/mediatek/phone/provider/CallHistoryAsync$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    return-object v0
.end method

.method public updateConfirmFlag(Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;)Landroid/os/AsyncTask;
    .locals 3
    .parameter "args"

    .prologue
    .line 166
    invoke-direct {p0}, Lcom/mediatek/phone/provider/CallHistoryAsync;->assertUiThread()V

    .line 167
    new-instance v0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;-><init>(Lcom/mediatek/phone/provider/CallHistoryAsync;Lcom/mediatek/phone/provider/CallHistoryAsync$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    return-object v0
.end method
