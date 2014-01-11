.class public Lcom/android/launcher2/WallpaperChooser;
.super Landroid/app/Activity;
.source "WallpaperChooser.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WallpaperChooser"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "icicle"

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    const v2, 0x7f040018

    invoke-virtual {p0, v2}, Lcom/android/launcher2/WallpaperChooser;->setContentView(I)V

    .line 35
    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooser;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const v3, 0x7f070038

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v1

    .line 38
    .local v1, fragmentView:Landroid/app/Fragment;
    const-string v2, "WallpaperChooser"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCreate: fragmentView = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", this = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    if-nez v1, :cond_0

    .line 47
    invoke-static {}, Lcom/android/launcher2/WallpaperChooserDialogFragment;->newInstance()Lcom/android/launcher2/WallpaperChooserDialogFragment;

    move-result-object v0

    .line 48
    .local v0, fragment:Landroid/app/DialogFragment;
    invoke-virtual {p0}, Lcom/android/launcher2/WallpaperChooser;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const-string v3, "dialog"

    invoke-virtual {v0, v2, v3}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 50
    .end local v0           #fragment:Landroid/app/DialogFragment;
    :cond_0
    return-void
.end method
