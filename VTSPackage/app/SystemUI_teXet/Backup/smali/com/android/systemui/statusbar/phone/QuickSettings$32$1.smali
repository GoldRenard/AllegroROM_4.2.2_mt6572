.class Lcom/android/systemui/statusbar/phone/QuickSettings$32$1;
.super Ljava/lang/Object;
.source "QuickSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/QuickSettings$32;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/systemui/statusbar/phone/QuickSettings$32;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/QuickSettings$32;)V
    .registers 2
    .parameter

    .prologue
    .line 950
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/QuickSettings$32$1;->this$1:Lcom/android/systemui/statusbar/phone/QuickSettings$32;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 953
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/app/IActivityManager;->requestBugReport()V
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_7} :catch_8

    .line 957
    :goto_7
    return-void

    .line 955
    :catch_8
    move-exception v0

    goto :goto_7
.end method
