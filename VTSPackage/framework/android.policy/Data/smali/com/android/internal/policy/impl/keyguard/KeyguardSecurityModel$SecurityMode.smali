.class final enum Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;
.super Ljava/lang/Enum;
.source "KeyguardSecurityModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "SecurityMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum Account:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum AlarmBoot:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum Biometric:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum Invalid:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum None:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum PIN:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum Password:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum Pattern:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum SimPinPukMe1:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum SimPinPukMe2:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum SimPinPukMe3:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum SimPinPukMe4:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

.field public static final enum Voice:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 34
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "Invalid"

    invoke-direct {v0, v1, v3}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Invalid:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 35
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "None"

    invoke-direct {v0, v1, v4}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->None:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 36
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "Pattern"

    invoke-direct {v0, v1, v5}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Pattern:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 37
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "Password"

    invoke-direct {v0, v1, v6}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Password:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 38
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "PIN"

    invoke-direct {v0, v1, v7}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->PIN:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 39
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "Biometric"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Biometric:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 40
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "Account"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Account:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 41
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "AlarmBoot"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->AlarmBoot:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 42
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "SimPinPukMe1"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe1:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 43
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "SimPinPukMe2"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe2:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 45
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "SimPinPukMe3"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe3:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 46
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "SimPinPukMe4"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe4:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 47
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    const-string v1, "Voice"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Voice:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    .line 33
    const/16 v0, 0xd

    new-array v0, v0, [Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Invalid:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->None:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Pattern:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Password:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->PIN:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Biometric:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Account:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->AlarmBoot:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe1:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe2:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe3:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->SimPinPukMe4:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->Voice:Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->$VALUES:[Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

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
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 33
    const-class v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->$VALUES:[Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    invoke-virtual {v0}, [Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode;

    return-object v0
.end method
