.class Lcom/android/launcher2/AllAppsList$TopPackage;
.super Ljava/lang/Object;
.source "AllAppsList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/AllAppsList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TopPackage"
.end annotation


# instance fields
.field className:Ljava/lang/String;

.field order:I

.field packageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .parameter "pkgName"
    .parameter "clsName"
    .parameter "index"

    .prologue
    .line 83
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lcom/android/launcher2/AllAppsList$TopPackage;->packageName:Ljava/lang/String;

    .line 85
    iput-object p2, p0, Lcom/android/launcher2/AllAppsList$TopPackage;->className:Ljava/lang/String;

    .line 86
    iput p3, p0, Lcom/android/launcher2/AllAppsList$TopPackage;->order:I

    .line 87
    return-void
.end method
