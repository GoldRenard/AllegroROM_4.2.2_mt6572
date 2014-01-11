.class Lcom/android/launcher2/InstallShortcutReceiver$PendingInstallShortcutInfo;
.super Ljava/lang/Object;
.source "InstallShortcutReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/InstallShortcutReceiver;
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
    .line 84
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Lcom/android/launcher2/InstallShortcutReceiver$PendingInstallShortcutInfo;->data:Landroid/content/Intent;

    .line 86
    iput-object p2, p0, Lcom/android/launcher2/InstallShortcutReceiver$PendingInstallShortcutInfo;->name:Ljava/lang/String;

    .line 87
    iput-object p3, p0, Lcom/android/launcher2/InstallShortcutReceiver$PendingInstallShortcutInfo;->launchIntent:Landroid/content/Intent;

    .line 88
    return-void
.end method
