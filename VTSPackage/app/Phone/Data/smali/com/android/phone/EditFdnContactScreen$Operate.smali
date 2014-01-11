.class public final enum Lcom/android/phone/EditFdnContactScreen$Operate;
.super Ljava/lang/Enum;
.source "EditFdnContactScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/EditFdnContactScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Operate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/phone/EditFdnContactScreen$Operate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/phone/EditFdnContactScreen$Operate;

.field public static final enum DELETE:Lcom/android/phone/EditFdnContactScreen$Operate;

.field public static final enum INSERT:Lcom/android/phone/EditFdnContactScreen$Operate;

.field public static final enum UPDATE:Lcom/android/phone/EditFdnContactScreen$Operate;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 541
    new-instance v0, Lcom/android/phone/EditFdnContactScreen$Operate;

    const-string v1, "INSERT"

    invoke-direct {v0, v1, v2}, Lcom/android/phone/EditFdnContactScreen$Operate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/phone/EditFdnContactScreen$Operate;->INSERT:Lcom/android/phone/EditFdnContactScreen$Operate;

    .line 542
    new-instance v0, Lcom/android/phone/EditFdnContactScreen$Operate;

    const-string v1, "UPDATE"

    invoke-direct {v0, v1, v3}, Lcom/android/phone/EditFdnContactScreen$Operate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/phone/EditFdnContactScreen$Operate;->UPDATE:Lcom/android/phone/EditFdnContactScreen$Operate;

    .line 543
    new-instance v0, Lcom/android/phone/EditFdnContactScreen$Operate;

    const-string v1, "DELETE"

    invoke-direct {v0, v1, v4}, Lcom/android/phone/EditFdnContactScreen$Operate;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/phone/EditFdnContactScreen$Operate;->DELETE:Lcom/android/phone/EditFdnContactScreen$Operate;

    .line 540
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/phone/EditFdnContactScreen$Operate;

    sget-object v1, Lcom/android/phone/EditFdnContactScreen$Operate;->INSERT:Lcom/android/phone/EditFdnContactScreen$Operate;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/phone/EditFdnContactScreen$Operate;->UPDATE:Lcom/android/phone/EditFdnContactScreen$Operate;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/phone/EditFdnContactScreen$Operate;->DELETE:Lcom/android/phone/EditFdnContactScreen$Operate;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/phone/EditFdnContactScreen$Operate;->$VALUES:[Lcom/android/phone/EditFdnContactScreen$Operate;

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
    .line 540
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/phone/EditFdnContactScreen$Operate;
    .locals 1
    .parameter "name"

    .prologue
    .line 540
    const-class v0, Lcom/android/phone/EditFdnContactScreen$Operate;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/phone/EditFdnContactScreen$Operate;

    return-object v0
.end method

.method public static values()[Lcom/android/phone/EditFdnContactScreen$Operate;
    .locals 1

    .prologue
    .line 540
    sget-object v0, Lcom/android/phone/EditFdnContactScreen$Operate;->$VALUES:[Lcom/android/phone/EditFdnContactScreen$Operate;

    invoke-virtual {v0}, [Lcom/android/phone/EditFdnContactScreen$Operate;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/phone/EditFdnContactScreen$Operate;

    return-object v0
.end method
