.class Lcom/mediatek/oobe/basic/wifi/WifiSettings$11;
.super Ljava/lang/Object;
.source "WifiSettings.java"

# interfaces
.implements Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/wifi/WifiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 1114
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$11;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreButtonClicked()V
    .locals 1

    .prologue
    .line 1117
    iget-object v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$11;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->onAddNetworkPressed()V

    .line 1118
    return-void
.end method
