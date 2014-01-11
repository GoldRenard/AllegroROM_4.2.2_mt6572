.class final enum Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;
.super Ljava/lang/Enum;
.source "OppServiceNative.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/opp/adp/OppServiceNative;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "TaskState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

.field public static final enum Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

.field public static final enum Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

.field public static final enum Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

.field public static final enum Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1018
    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    const-string v1, "Running"

    invoke-direct {v0, v1, v2}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    const-string v1, "Aborting"

    invoke-direct {v0, v1, v3}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    const-string v1, "Aborted"

    invoke-direct {v0, v1, v4}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    new-instance v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    const-string v1, "Idle"

    invoke-direct {v0, v1, v5}, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    .line 1017
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Running:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborting:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Aborted:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->Idle:Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->$VALUES:[Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

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
    .line 1017
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;
    .locals 1
    .parameter "name"

    .prologue
    .line 1017
    const-class v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    return-object v0
.end method

.method public static values()[Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;
    .locals 1

    .prologue
    .line 1017
    sget-object v0, Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->$VALUES:[Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    invoke-virtual {v0}, [Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState;

    return-object v0
.end method
