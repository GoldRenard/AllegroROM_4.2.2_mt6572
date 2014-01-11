.class public Lcom/cyanogenmod/trebuchet/WallpaperChooser;
.super Landroid/app/Activity;
.source "WallpaperChooser.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Trebuchet.WallpaperChooser"


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
    .locals 4
    .parameter "icicle"

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    const v2, 0x7f040021

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/WallpaperChooser;->setContentView(I)V

    .line 35
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/WallpaperChooser;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const v3, 0x7f070045

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v1

    .line 39
    .local v1, fragmentView:Landroid/app/Fragment;
    if-nez v1, :cond_0

    .line 43
    invoke-static {}, Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;->newInstance()Lcom/cyanogenmod/trebuchet/WallpaperChooserDialogFragment;

    move-result-object v0

    .line 44
    .local v0, fragment:Landroid/app/DialogFragment;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/WallpaperChooser;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const-string v3, "dialog"

    invoke-virtual {v0, v2, v3}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 46
    .end local v0           #fragment:Landroid/app/DialogFragment;
    :cond_0
    return-void
.end method
