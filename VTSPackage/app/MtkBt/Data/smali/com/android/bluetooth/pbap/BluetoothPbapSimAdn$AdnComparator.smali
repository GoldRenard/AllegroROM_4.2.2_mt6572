.class public Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn$AdnComparator;
.super Ljava/lang/Object;
.source "BluetoothPbapSimAdn.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AdnComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/android/internal/telephony/AdnRecord;",
        ">;"
    }
.end annotation


# instance fields
.field private final mEmpty:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;


# direct methods
.method public constructor <init>(Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;)V
    .locals 1
    .parameter

    .prologue
    .line 105
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn$AdnComparator;->this$0:Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const-string v0, ""

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn$AdnComparator;->mEmpty:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public compare(Lcom/android/internal/telephony/AdnRecord;Lcom/android/internal/telephony/AdnRecord;)I
    .locals 3
    .parameter "adn1"
    .parameter "adn2"

    .prologue
    .line 109
    invoke-virtual {p1}, Lcom/android/internal/telephony/AdnRecord;->getAlphaTag()Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, name1:Ljava/lang/String;
    invoke-virtual {p2}, Lcom/android/internal/telephony/AdnRecord;->getAlphaTag()Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, name2:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 112
    const-string v0, ""

    .line 114
    :cond_0
    if-nez v1, :cond_1

    .line 115
    const-string v1, ""

    .line 117
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v2

    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 105
    check-cast p1, Lcom/android/internal/telephony/AdnRecord;

    .end local p1
    check-cast p2, Lcom/android/internal/telephony/AdnRecord;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/android/bluetooth/pbap/BluetoothPbapSimAdn$AdnComparator;->compare(Lcom/android/internal/telephony/AdnRecord;Lcom/android/internal/telephony/AdnRecord;)I

    move-result v0

    return v0
.end method
