.class Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;
.super Landroid/os/Handler;
.source "WifiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/wifi/WifiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Scanner"
.end annotation


# instance fields
.field private mRetry:I

.field final synthetic this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;


# direct methods
.method private constructor <init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V
    .locals 1
    .parameter

    .prologue
    .line 949
    iput-object p1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 950
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->mRetry:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;Lcom/mediatek/oobe/basic/wifi/WifiSettings$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 949
    invoke-direct {p0, p1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;-><init>(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "message"

    .prologue
    const/4 v3, 0x0

    .line 965
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    #getter for: Lcom/mediatek/oobe/basic/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;
    invoke-static {v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->access$200(Lcom/mediatek/oobe/basic/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->startScanActive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 966
    iput v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->mRetry:I

    .line 976
    :cond_0
    const-wide/16 v1, 0x1770

    invoke-virtual {p0, v3, v1, v2}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->sendEmptyMessageDelayed(IJ)Z

    .line 977
    :cond_1
    :goto_0
    return-void

    .line 967
    :cond_2
    iget v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->mRetry:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->mRetry:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    .line 968
    iput v3, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->mRetry:I

    .line 969
    iget-object v1, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->this$0:Lcom/mediatek/oobe/basic/wifi/WifiSettings;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 970
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_1

    .line 971
    const v1, 0x7f0900a6

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method pause()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 959
    iput v0, p0, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->mRetry:I

    .line 960
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->removeMessages(I)V

    .line 961
    return-void
.end method

.method resume()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 953
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 954
    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/wifi/WifiSettings$Scanner;->sendEmptyMessage(I)Z

    .line 956
    :cond_0
    return-void
.end method
