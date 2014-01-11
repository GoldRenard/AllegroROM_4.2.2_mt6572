.class Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;
.super Landroid/text/method/DialerKeyListener;
.source "EditFdnContactScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/EditFdnContactScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FdnKeyListener"
.end annotation


# static fields
.field public static final CHARACTERS:[C

.field private static sKeyListener:Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 314
    const/16 v0, 0xf

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;->CHARACTERS:[C

    return-void

    :array_0
    .array-data 0x2
        0x30t 0x0t
        0x31t 0x0t
        0x32t 0x0t
        0x33t 0x0t
        0x34t 0x0t
        0x35t 0x0t
        0x36t 0x0t
        0x37t 0x0t
        0x38t 0x0t
        0x39t 0x0t
        0x23t 0x0t
        0x2at 0x0t
        0x2bt 0x0t
        0x2ct 0x0t
        0x4et 0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 306
    invoke-direct {p0}, Landroid/text/method/DialerKeyListener;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;
    .locals 1

    .prologue
    .line 334
    sget-object v0, Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;->sKeyListener:Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;

    if-nez v0, :cond_0

    .line 335
    new-instance v0, Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;

    invoke-direct {v0}, Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;-><init>()V

    sput-object v0, Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;->sKeyListener:Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;

    .line 337
    :cond_0
    sget-object v0, Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;->sKeyListener:Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;

    return-object v0
.end method


# virtual methods
.method protected getAcceptedChars()[C
    .locals 1

    .prologue
    .line 319
    sget-object v0, Lcom/android/phone/EditFdnContactScreen$FdnKeyListener;->CHARACTERS:[C

    return-object v0
.end method
