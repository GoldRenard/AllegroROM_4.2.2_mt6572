.class Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;
.super Ljava/lang/Object;
.source "PhoneInterfaceManagerEx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/PhoneInterfaceManagerEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScAddrGemini"
.end annotation


# instance fields
.field public scAddr:Ljava/lang/String;

.field public simId:I

.field final synthetic this$0:Lcom/android/phone/PhoneInterfaceManagerEx;


# direct methods
.method public constructor <init>(Lcom/android/phone/PhoneInterfaceManagerEx;Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter "addr"
    .parameter "id"

    .prologue
    .line 163
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;->this$0:Lcom/android/phone/PhoneInterfaceManagerEx;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput-object p2, p0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;->scAddr:Ljava/lang/String;

    .line 165
    if-eqz p3, :cond_0

    const/4 v0, 0x1

    if-eq p3, v0, :cond_0

    const/4 v0, 0x2

    if-eq p3, v0, :cond_0

    const/4 v0, 0x3

    if-ne p3, v0, :cond_1

    .line 169
    :cond_0
    iput p3, p0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;->simId:I

    .line 173
    :goto_0
    return-void

    .line 171
    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/phone/PhoneInterfaceManagerEx$ScAddrGemini;->simId:I

    goto :goto_0
.end method
