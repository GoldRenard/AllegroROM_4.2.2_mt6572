.class Lcom/mediatek/oobe/basic/wifi/WifiConfigController$1;
.super Ljava/lang/Object;
.source "WifiConfigController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->afterTextChanged(Landroid/text/Editable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/wifi/WifiConfigController;)V
    .locals 0
    .parameter

    .prologue
    .line 1205
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController$1;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1208
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiConfigController$1;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiConfigController;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiConfigController;->enableSubmitIfAppropriate()V

    .line 1209
    return-void
.end method
