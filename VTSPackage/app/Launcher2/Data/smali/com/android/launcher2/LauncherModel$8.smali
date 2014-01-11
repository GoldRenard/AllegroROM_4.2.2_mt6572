.class final Lcom/android/launcher2/LauncherModel$8;
.super Ljava/lang/Object;
.source "LauncherModel.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/LauncherModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/android/launcher2/ApplicationInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 2709
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Lcom/android/launcher2/ApplicationInfo;Lcom/android/launcher2/ApplicationInfo;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 2711
    iget-wide v0, p1, Lcom/android/launcher2/ApplicationInfo;->firstInstallTime:J

    iget-wide v2, p2, Lcom/android/launcher2/ApplicationInfo;->firstInstallTime:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    .line 2713
    :goto_0
    return v0

    .line 2712
    :cond_0
    iget-wide v0, p1, Lcom/android/launcher2/ApplicationInfo;->firstInstallTime:J

    iget-wide v2, p2, Lcom/android/launcher2/ApplicationInfo;->firstInstallTime:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    .line 2713
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2709
    check-cast p1, Lcom/android/launcher2/ApplicationInfo;

    .end local p1
    check-cast p2, Lcom/android/launcher2/ApplicationInfo;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher2/LauncherModel$8;->compare(Lcom/android/launcher2/ApplicationInfo;Lcom/android/launcher2/ApplicationInfo;)I

    move-result v0

    return v0
.end method
