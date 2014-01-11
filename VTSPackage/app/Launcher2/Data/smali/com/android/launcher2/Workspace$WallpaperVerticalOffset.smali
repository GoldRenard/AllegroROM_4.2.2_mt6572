.class final enum Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;
.super Ljava/lang/Enum;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "WallpaperVerticalOffset"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

.field public static final enum BOTTOM:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

.field public static final enum MIDDLE:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

.field public static final enum TOP:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 189
    new-instance v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    const-string v1, "TOP"

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->TOP:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    new-instance v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    const-string v1, "MIDDLE"

    invoke-direct {v0, v1, v3}, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->MIDDLE:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    new-instance v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    const-string v1, "BOTTOM"

    invoke-direct {v0, v1, v4}, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->BOTTOM:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    sget-object v1, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->TOP:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->MIDDLE:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->BOTTOM:Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->$VALUES:[Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

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
    .line 189
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;
    .locals 1
    .parameter "name"

    .prologue
    .line 189
    const-class v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    return-object v0
.end method

.method public static values()[Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;
    .locals 1

    .prologue
    .line 189
    sget-object v0, Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->$VALUES:[Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    invoke-virtual {v0}, [Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/launcher2/Workspace$WallpaperVerticalOffset;

    return-object v0
.end method
