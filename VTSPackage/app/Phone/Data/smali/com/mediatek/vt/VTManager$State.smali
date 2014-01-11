.class public final enum Lcom/mediatek/vt/VTManager$State;
.super Ljava/lang/Enum;
.source "VTManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/vt/VTManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mediatek/vt/VTManager$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mediatek/vt/VTManager$State;

.field public static final enum CLOSE:Lcom/mediatek/vt/VTManager$State;

.field public static final enum CONNECTED:Lcom/mediatek/vt/VTManager$State;

.field public static final enum OPEN:Lcom/mediatek/vt/VTManager$State;

.field public static final enum READY:Lcom/mediatek/vt/VTManager$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 68
    new-instance v0, Lcom/mediatek/vt/VTManager$State;

    const-string v1, "CLOSE"

    invoke-direct {v0, v1, v2}, Lcom/mediatek/vt/VTManager$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    new-instance v0, Lcom/mediatek/vt/VTManager$State;

    const-string v1, "OPEN"

    invoke-direct {v0, v1, v3}, Lcom/mediatek/vt/VTManager$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/vt/VTManager$State;->OPEN:Lcom/mediatek/vt/VTManager$State;

    new-instance v0, Lcom/mediatek/vt/VTManager$State;

    const-string v1, "READY"

    invoke-direct {v0, v1, v4}, Lcom/mediatek/vt/VTManager$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/vt/VTManager$State;->READY:Lcom/mediatek/vt/VTManager$State;

    new-instance v0, Lcom/mediatek/vt/VTManager$State;

    const-string v1, "CONNECTED"

    invoke-direct {v0, v1, v5}, Lcom/mediatek/vt/VTManager$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    .line 67
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mediatek/vt/VTManager$State;

    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CLOSE:Lcom/mediatek/vt/VTManager$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mediatek/vt/VTManager$State;->OPEN:Lcom/mediatek/vt/VTManager$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mediatek/vt/VTManager$State;->READY:Lcom/mediatek/vt/VTManager$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mediatek/vt/VTManager$State;->CONNECTED:Lcom/mediatek/vt/VTManager$State;

    aput-object v1, v0, v5

    sput-object v0, Lcom/mediatek/vt/VTManager$State;->$VALUES:[Lcom/mediatek/vt/VTManager$State;

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
    .line 67
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mediatek/vt/VTManager$State;
    .locals 1
    .parameter "name"

    .prologue
    .line 67
    const-class v0, Lcom/mediatek/vt/VTManager$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mediatek/vt/VTManager$State;

    return-object v0
.end method

.method public static values()[Lcom/mediatek/vt/VTManager$State;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lcom/mediatek/vt/VTManager$State;->$VALUES:[Lcom/mediatek/vt/VTManager$State;

    invoke-virtual {v0}, [Lcom/mediatek/vt/VTManager$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mediatek/vt/VTManager$State;

    return-object v0
.end method
