.class public interface abstract Lcom/mediatek/beam/BeamShareTask$BeamShareTaskMetaData;
.super Ljava/lang/Object;
.source "BeamShareTask.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/beam/BeamShareTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BeamShareTaskMetaData"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/vnd.mtkbeam.share.task"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.mtkbeam.share.task"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "modified DESC"

.field public static final TABLE_NAME:Ljava/lang/String; = "share_tasks"

.field public static final TASK_DONE_BYTES:Ljava/lang/String; = "done"

.field public static final TASK_MIMETYPE:Ljava/lang/String; = "mime"

.field public static final TASK_MODIFIED_DATE:Ljava/lang/String; = "modified"

.field public static final TASK_OBJECT_FILE:Ljava/lang/String; = "data"

.field public static final TASK_STATE:Ljava/lang/String; = "state"

.field public static final TASK_TOTAL_BYTES:Ljava/lang/String; = "total"

.field public static final TASK_TYPE:Ljava/lang/String; = "type"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 79
    const-string v0, "content://com.android.settings.provider.beam.share/share_tasks"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mediatek/beam/BeamShareTask$BeamShareTaskMetaData;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method
