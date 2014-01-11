.class Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;
.super Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;
.source "PendingAddItemInfo.java"


# instance fields
.field shortcutActivityInfo:Landroid/content/pm/ActivityInfo;


# direct methods
.method public constructor <init>(Landroid/content/pm/ActivityInfo;)V
    .locals 0
    .parameter "activityInfo"

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;->shortcutActivityInfo:Landroid/content/pm/ActivityInfo;

    .line 43
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Shortcut: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PendingAddShortcutInfo;->shortcutActivityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
