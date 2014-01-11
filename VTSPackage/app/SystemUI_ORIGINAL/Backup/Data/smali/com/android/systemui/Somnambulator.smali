.class public Lcom/android/systemui/Somnambulator;
.super Landroid/app/Activity;
.source "Somnambulator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 32
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 7

    .prologue
    .line 36
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 38
    invoke-virtual {p0}, Lcom/android/systemui/Somnambulator;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 39
    .local v2, launchIntent:Landroid/content/Intent;
    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, action:Ljava/lang/String;
    const-string v5, "android.intent.action.CREATE_SHORTCUT"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 41
    new-instance v4, Landroid/content/Intent;

    const-class v5, Lcom/android/systemui/Somnambulator;

    invoke-direct {v4, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 42
    .local v4, shortcutIntent:Landroid/content/Intent;
    const/high16 v5, 0x1080

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 44
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 45
    .local v3, resultIntent:Landroid/content/Intent;
    const-string v5, "android.intent.extra.shortcut.ICON_RESOURCE"

    const v6, 0x7f030001

    invoke-static {p0, v6}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 47
    const-string v5, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 48
    const-string v5, "android.intent.extra.shortcut.NAME"

    const v6, 0x7f0b00d0

    invoke-virtual {p0, v6}, Lcom/android/systemui/Somnambulator;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    const/4 v5, -0x1

    invoke-virtual {p0, v5, v3}, Lcom/android/systemui/Somnambulator;->setResult(ILandroid/content/Intent;)V

    .line 58
    .end local v3           #resultIntent:Landroid/content/Intent;
    .end local v4           #shortcutIntent:Landroid/content/Intent;
    :goto_0
    invoke-virtual {p0}, Lcom/android/systemui/Somnambulator;->finish()V

    .line 59
    return-void

    .line 51
    :cond_0
    const-string v5, "android.intent.category.DESK_DOCK"

    invoke-virtual {v2, v5}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v1

    .line 52
    .local v1, docked:Z
    if-eqz v1, :cond_1

    .line 53
    invoke-static {p0}, Landroid/service/dreams/Sandman;->startDreamWhenDockedIfAppropriate(Landroid/content/Context;)V

    goto :goto_0

    .line 55
    :cond_1
    invoke-static {p0}, Landroid/service/dreams/Sandman;->startDreamByUserRequest(Landroid/content/Context;)V

    goto :goto_0
.end method
