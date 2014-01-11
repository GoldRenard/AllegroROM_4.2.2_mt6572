.class final enum Lcom/android/launcher2/Workspace$State;
.super Ljava/lang/Enum;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/launcher2/Workspace$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/launcher2/Workspace$State;

.field public static final enum NORMAL:Lcom/android/launcher2/Workspace$State;

.field public static final enum SMALL:Lcom/android/launcher2/Workspace$State;

.field public static final enum SPRING_LOADED:Lcom/android/launcher2/Workspace$State;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 168
    new-instance v0, Lcom/android/launcher2/Workspace$State;

    const-string v1, "NORMAL"

    invoke-direct {v0, v1, v2}, Lcom/android/launcher2/Workspace$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    new-instance v0, Lcom/android/launcher2/Workspace$State;

    const-string v1, "SPRING_LOADED"

    invoke-direct {v0, v1, v3}, Lcom/android/launcher2/Workspace$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    new-instance v0, Lcom/android/launcher2/Workspace$State;

    const-string v1, "SMALL"

    invoke-direct {v0, v1, v4}, Lcom/android/launcher2/Workspace$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/launcher2/Workspace$State;

    sget-object v1, Lcom/android/launcher2/Workspace$State;->NORMAL:Lcom/android/launcher2/Workspace$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/launcher2/Workspace$State;->SPRING_LOADED:Lcom/android/launcher2/Workspace$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/launcher2/Workspace$State;->SMALL:Lcom/android/launcher2/Workspace$State;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/launcher2/Workspace$State;->$VALUES:[Lcom/android/launcher2/Workspace$State;

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
    .line 168
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/launcher2/Workspace$State;
    .locals 1
    .parameter "name"

    .prologue
    .line 168
    const-class v0, Lcom/android/launcher2/Workspace$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/Workspace$State;

    return-object v0
.end method

.method public static values()[Lcom/android/launcher2/Workspace$State;
    .locals 1

    .prologue
    .line 168
    sget-object v0, Lcom/android/launcher2/Workspace$State;->$VALUES:[Lcom/android/launcher2/Workspace$State;

    invoke-virtual {v0}, [Lcom/android/launcher2/Workspace$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/launcher2/Workspace$State;

    return-object v0
.end method
