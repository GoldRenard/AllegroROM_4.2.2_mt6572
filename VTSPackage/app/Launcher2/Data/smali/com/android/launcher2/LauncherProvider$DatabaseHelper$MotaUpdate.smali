.class Lcom/android/launcher2/LauncherProvider$DatabaseHelper$MotaUpdate;
.super Ljava/lang/Object;
.source "LauncherProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/LauncherProvider$DatabaseHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MotaUpdate"
.end annotation


# instance fields
.field mNewComponent:Landroid/content/ComponentName;

.field mOldComponent:Landroid/content/ComponentName;

.field final synthetic this$0:Lcom/android/launcher2/LauncherProvider$DatabaseHelper;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/LauncherProvider$DatabaseHelper;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "oldPkgName"
    .parameter "oldClsName"
    .parameter "newPkgName"
    .parameter "newClsName"

    .prologue
    .line 270
    iput-object p1, p0, Lcom/android/launcher2/LauncherProvider$DatabaseHelper$MotaUpdate;->this$0:Lcom/android/launcher2/LauncherProvider$DatabaseHelper;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 271
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p2, p3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/launcher2/LauncherProvider$DatabaseHelper$MotaUpdate;->mOldComponent:Landroid/content/ComponentName;

    .line 272
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p4, p5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/launcher2/LauncherProvider$DatabaseHelper$MotaUpdate;->mNewComponent:Landroid/content/ComponentName;

    .line 273
    return-void
.end method
