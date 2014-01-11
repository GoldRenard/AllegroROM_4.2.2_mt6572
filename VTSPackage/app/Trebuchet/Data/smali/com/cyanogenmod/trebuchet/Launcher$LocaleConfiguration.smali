.class Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;
.super Ljava/lang/Object;
.source "Launcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Launcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocaleConfiguration"
.end annotation


# instance fields
.field public locale:Ljava/lang/String;

.field public mcc:I

.field public mnc:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 546
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 548
    iput v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mcc:I

    .line 549
    iput v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;->mnc:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 546
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/Launcher$LocaleConfiguration;-><init>()V

    return-void
.end method
