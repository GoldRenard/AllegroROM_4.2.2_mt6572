.class public Lcom/mediatek/bluetooth/util/NotificationFactory;
.super Ljava/lang/Object;
.source "NotificationFactory.java"


# static fields
.field public static final NID_SHARE_MGMT_NOTIFICATION:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 49
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mediatek/bluetooth/util/NotificationFactory;->getProfileNotificationId(II)I

    move-result v0

    sput v0, Lcom/mediatek/bluetooth/util/NotificationFactory;->NID_SHARE_MGMT_NOTIFICATION:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getProfileNotificationId(II)I
    .locals 1
    .parameter "profileId"
    .parameter "notificationId"

    .prologue
    .line 63
    invoke-static {p0}, Lcom/mediatek/bluetooth/BluetoothProfile;->getProfileStart(I)I

    move-result v0

    add-int/2addr v0, p1

    return v0
.end method
