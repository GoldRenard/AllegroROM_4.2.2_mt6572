.class Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$PendingUninstallShortcutInfo;
.super Ljava/lang/Object;
.source "UninstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PendingUninstallShortcutInfo"
.end annotation


# instance fields
.field data:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Intent;)V
    .locals 0
    .parameter "rawData"

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/UninstallShortcutReceiver$PendingUninstallShortcutInfo;->data:Landroid/content/Intent;

    .line 53
    return-void
.end method
