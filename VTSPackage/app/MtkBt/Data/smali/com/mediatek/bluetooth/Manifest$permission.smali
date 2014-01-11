.class public final Lcom/mediatek/bluetooth/Manifest$permission;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/Manifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "permission"
.end annotation


# static fields
.field public static final HANDOVER_STATUS:Ljava/lang/String; = "com.android.permission.HANDOVER_STATUS"

.field public static final WHITELIST_BLUETOOTH_DEVICE:Ljava/lang/String; = "com.android.permission.WHITELIST_BLUETOOTH_DEVICE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
