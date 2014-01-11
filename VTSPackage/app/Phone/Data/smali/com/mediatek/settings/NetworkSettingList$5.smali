.class Lcom/mediatek/settings/NetworkSettingList$5;
.super Ljava/lang/Object;
.source "NetworkSettingList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/NetworkSettingList;->displayNetworkSelectionSucceeded()V
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
    .line 539
    iput-object p1, p0, Lcom/mediatek/settings/NetworkSettingList$5;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 541
    iget-object v0, p0, Lcom/mediatek/settings/NetworkSettingList$5;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-virtual {v0}, Lcom/mediatek/settings/NetworkSettingList;->finish()V

    .line 542
    return-void
.end method
