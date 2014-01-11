.class Lcom/mediatek/settings/NetworkSettingList$3;
.super Ljava/lang/Object;
.source "NetworkSettingList.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NetworkSettingList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NetworkSettingList;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NetworkSettingList;)V
    .locals 0
    .parameter

    .prologue
    .line 263
    iput-object p1, p0, Lcom/mediatek/settings/NetworkSettingList$3;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "className"
    .parameter "service"

    .prologue
    .line 268
    iget-object v0, p0, Lcom/mediatek/settings/NetworkSettingList$3;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    const-string v1, "connection created, binding local service."

    #calls: Lcom/mediatek/settings/NetworkSettingList;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/NetworkSettingList;->access$100(Lcom/mediatek/settings/NetworkSettingList;Ljava/lang/String;)V

    .line 270
    iget-object v0, p0, Lcom/mediatek/settings/NetworkSettingList$3;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    check-cast p2, Lcom/android/phone/NetworkQueryService$LocalBinder;

    .end local p2
    invoke-virtual {p2}, Lcom/android/phone/NetworkQueryService$LocalBinder;->getService()Lcom/android/phone/INetworkQueryService;

    move-result-object v1

    #setter for: Lcom/mediatek/settings/NetworkSettingList;->mNetworkQueryService:Lcom/android/phone/INetworkQueryService;
    invoke-static {v0, v1}, Lcom/mediatek/settings/NetworkSettingList;->access$802(Lcom/mediatek/settings/NetworkSettingList;Lcom/android/phone/INetworkQueryService;)Lcom/android/phone/INetworkQueryService;

    .line 272
    iget-object v0, p0, Lcom/mediatek/settings/NetworkSettingList$3;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #calls: Lcom/mediatek/settings/NetworkSettingList;->loadNetworksList()V
    invoke-static {v0}, Lcom/mediatek/settings/NetworkSettingList;->access$900(Lcom/mediatek/settings/NetworkSettingList;)V

    .line 273
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 278
    iget-object v0, p0, Lcom/mediatek/settings/NetworkSettingList$3;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    const-string v1, "connection disconnected, cleaning local binding."

    #calls: Lcom/mediatek/settings/NetworkSettingList;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/NetworkSettingList;->access$100(Lcom/mediatek/settings/NetworkSettingList;Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lcom/mediatek/settings/NetworkSettingList$3;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/settings/NetworkSettingList;->mNetworkQueryService:Lcom/android/phone/INetworkQueryService;
    invoke-static {v0, v1}, Lcom/mediatek/settings/NetworkSettingList;->access$802(Lcom/mediatek/settings/NetworkSettingList;Lcom/android/phone/INetworkQueryService;)Lcom/android/phone/INetworkQueryService;

    .line 281
    return-void
.end method
