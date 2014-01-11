.class final enum Lcom/android/launcher2/AsyncTaskPageData$Type;
.super Ljava/lang/Enum;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/AsyncTaskPageData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/launcher2/AsyncTaskPageData$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/launcher2/AsyncTaskPageData$Type;

.field public static final enum LoadWidgetPreviewData:Lcom/android/launcher2/AsyncTaskPageData$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 89
    new-instance v0, Lcom/android/launcher2/AsyncTaskPageData$Type;

    const-string v1, "LoadWidgetPreviewData"

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/AsyncTaskPageData$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/launcher2/AsyncTaskPageData$Type;->LoadWidgetPreviewData:Lcom/android/launcher2/AsyncTaskPageData$Type;

    .line 88
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/android/launcher2/AsyncTaskPageData$Type;

    sget-object v1, Lcom/android/launcher2/AsyncTaskPageData$Type;->LoadWidgetPreviewData:Lcom/android/launcher2/AsyncTaskPageData$Type;

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/launcher2/AsyncTaskPageData$Type;->$VALUES:[Lcom/android/launcher2/AsyncTaskPageData$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher2/AsyncTaskPageData$Type;
    .locals 1
    .parameter "name"

    .prologue
    .line 88
    const-class v0, Lcom/android/launcher2/AsyncTaskPageData$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/AsyncTaskPageData$Type;

    return-object v0
.end method

.method public static values()[Lcom/android/launcher2/AsyncTaskPageData$Type;
    .locals 1

    .prologue
    .line 88
    sget-object v0, Lcom/android/launcher2/AsyncTaskPageData$Type;->$VALUES:[Lcom/android/launcher2/AsyncTaskPageData$Type;

    invoke-virtual {v0}, [Lcom/android/launcher2/AsyncTaskPageData$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/launcher2/AsyncTaskPageData$Type;

    return-object v0
.end method
