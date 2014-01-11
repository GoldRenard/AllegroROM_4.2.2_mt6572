.class Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;
.super Ljava/lang/Object;
.source "InstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PendingInstallShortcutInfo"
.end annotation


# instance fields
.field data:Landroid/content/Intent;

.field launchIntent:Landroid/content/Intent;

.field name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Intent;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 0
    .parameter "rawData"
    .parameter "shortcutName"
    .parameter "shortcutIntent"

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;->data:Landroid/content/Intent;

    .line 67
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;->name:Ljava/lang/String;

    .line 68
    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/InstallShortcutReceiver$PendingInstallShortcutInfo;->launchIntent:Landroid/content/Intent;

    .line 69
    return-void
.end method
