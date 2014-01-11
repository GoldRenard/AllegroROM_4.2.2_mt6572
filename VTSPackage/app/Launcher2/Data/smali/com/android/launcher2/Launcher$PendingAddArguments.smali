.class Lcom/android/launcher2/Launcher$PendingAddArguments;
.super Ljava/lang/Object;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Launcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PendingAddArguments"
.end annotation


# instance fields
.field cellX:I

.field cellY:I

.field container:J

.field intent:Landroid/content/Intent;

.field requestCode:I

.field screen:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 335
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher2/Launcher$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 335
    invoke-direct {p0}, Lcom/android/launcher2/Launcher$PendingAddArguments;-><init>()V

    return-void
.end method
