.class public interface abstract Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;
.super Ljava/lang/Object;
.source "BluetoothShareTask.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/share/BluetoothShareTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BluetoothShareTaskMetaData"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/vnd.mtkbt.share.task"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.mtkbt.share.task"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "modified DESC"

.field public static final TABLE_NAME:Ljava/lang/String; = "share_tasks"

.field public static final TASK_CREATION_DATE:Ljava/lang/String; = "creation"

.field public static final TASK_DONE_BYTES:Ljava/lang/String; = "done"

.field public static final TASK_IS_HANDOVER:Ljava/lang/String; = "ishandover"

.field public static final TASK_MIMETYPE:Ljava/lang/String; = "mime"

.field public static final TASK_MODIFIED_DATE:Ljava/lang/String; = "modified"

.field public static final TASK_OBJECT_FILE:Ljava/lang/String; = "data"

.field public static final TASK_OBJECT_NAME:Ljava/lang/String; = "name"

.field public static final TASK_OBJECT_URI:Ljava/lang/String; = "uri"

.field public static final TASK_PEER_ADDR:Ljava/lang/String; = "peer_addr"

.field public static final TASK_PEER_NAME:Ljava/lang/String; = "peer_name"

.field public static final TASK_RESULT:Ljava/lang/String; = "result"

.field public static final TASK_STATE:Ljava/lang/String; = "state"

.field public static final TASK_TOTAL_BYTES:Ljava/lang/String; = "total"

.field public static final TASK_TYPE:Ljava/lang/String; = "type"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 125
    const-string v0, "content://com.mediatek.provider.bluetooth.share/share_tasks"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/bluetooth/share/BluetoothShareTask$BluetoothShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method
