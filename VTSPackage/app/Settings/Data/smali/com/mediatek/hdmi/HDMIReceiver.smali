.class public Lcom/mediatek/hdmi/HDMIReceiver;
.super Landroid/content/BroadcastReceiver;
.source "HDMIReceiver.java"


# static fields
.field private static final ACTION_IPO_BOOT:Ljava/lang/String; = "android.intent.action.ACTION_BOOT_IPO"

.field private static final ACTION_IPO_SHUTDOWN:Ljava/lang/String; = "android.intent.action.ACTION_SHUTDOWN_IPO"

.field private static final TAG:Ljava/lang/String; = "hdmi"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 17
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 18
    .local v0, action:Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/hdmi/HDMILocalService;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 20
    .local v1, serviceIntent:Landroid/content/Intent;
    return-void
.end method
