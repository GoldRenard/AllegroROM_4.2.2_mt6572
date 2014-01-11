.class final enum Lcom/cyanogenmod/trebuchet/Workspace$State;
.super Ljava/lang/Enum;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/cyanogenmod/trebuchet/Workspace$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/cyanogenmod/trebuchet/Workspace$State;

.field public static final enum NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

.field public static final enum SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

.field public static final enum SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 176
    new-instance v0, Lcom/cyanogenmod/trebuchet/Workspace$State;

    const-string v1, "NORMAL"

    invoke-direct {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Workspace$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace$State;->NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    new-instance v0, Lcom/cyanogenmod/trebuchet/Workspace$State;

    const-string v1, "SPRING_LOADED"

    invoke-direct {v0, v1, v3}, Lcom/cyanogenmod/trebuchet/Workspace$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    new-instance v0, Lcom/cyanogenmod/trebuchet/Workspace$State;

    const-string v1, "SMALL"

    invoke-direct {v0, v1, v4}, Lcom/cyanogenmod/trebuchet/Workspace$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/cyanogenmod/trebuchet/Workspace$State;

    sget-object v1, Lcom/cyanogenmod/trebuchet/Workspace$State;->NORMAL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/cyanogenmod/trebuchet/Workspace$State;->SPRING_LOADED:Lcom/cyanogenmod/trebuchet/Workspace$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/cyanogenmod/trebuchet/Workspace$State;->SMALL:Lcom/cyanogenmod/trebuchet/Workspace$State;

    aput-object v1, v0, v4

    sput-object v0, Lcom/cyanogenmod/trebuchet/Workspace$State;->$VALUES:[Lcom/cyanogenmod/trebuchet/Workspace$State;

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
    .line 176
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/cyanogenmod/trebuchet/Workspace$State;
    .locals 1
    .parameter "name"

    .prologue
    .line 176
    const-class v0, Lcom/cyanogenmod/trebuchet/Workspace$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Workspace$State;

    return-object v0
.end method

.method public static values()[Lcom/cyanogenmod/trebuchet/Workspace$State;
    .locals 1

    .prologue
    .line 176
    sget-object v0, Lcom/cyanogenmod/trebuchet/Workspace$State;->$VALUES:[Lcom/cyanogenmod/trebuchet/Workspace$State;

    invoke-virtual {v0}, [Lcom/cyanogenmod/trebuchet/Workspace$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/cyanogenmod/trebuchet/Workspace$State;

    return-object v0
.end method
