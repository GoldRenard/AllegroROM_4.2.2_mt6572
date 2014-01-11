.class Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;
.super Landroid/database/AbstractCursor;
.source "BrowserProvider2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/provider/BrowserProvider2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SuggestionsCursor"
.end annotation


# static fields
.field private static final COLUMNS:[Ljava/lang/String; = null

.field private static final ICON_INDEX:I = 0x3

.field private static final ID_INDEX:I = 0x0

.field private static final LAST_ACCESS_TIME_INDEX:I = 0x4

.field private static final SUGGEST_COLUMN_ICON_1_ID:I = 0x6

.field private static final SUGGEST_COLUMN_INTENT_ACTION_ID:I = 0x1

.field private static final SUGGEST_COLUMN_INTENT_DATA_ID:I = 0x2

.field private static final SUGGEST_COLUMN_LAST_ACCESS_HINT_ID:I = 0x7

.field private static final SUGGEST_COLUMN_TEXT_1_ID:I = 0x3

.field private static final SUGGEST_COLUMN_TEXT_2_TEXT_ID:I = 0x4

.field private static final SUGGEST_COLUMN_TEXT_2_URL_ID:I = 0x5

.field private static final TITLE_INDEX:I = 0x2

.field private static final URL_INDEX:I = 0x1


# instance fields
.field private final mSource:Landroid/database/Cursor;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 2403
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "suggest_intent_action"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "suggest_intent_data"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "suggest_text_1"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "suggest_text_2"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "suggest_text_2_url"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "suggest_icon_1"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "suggest_last_access_hint"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0
    .parameter "cursor"

    .prologue
    .line 2415
    invoke-direct {p0}, Landroid/database/AbstractCursor;-><init>()V

    .line 2416
    iput-object p1, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    .line 2417
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 2493
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 2494
    invoke-super {p0}, Landroid/database/AbstractCursor;->close()V

    .line 2495
    return-void
.end method

.method public deactivate()V
    .locals 1

    .prologue
    .line 2498
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->deactivate()V

    .line 2499
    invoke-super {p0}, Landroid/database/AbstractCursor;->deactivate()V

    .line 2500
    return-void
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 2421
    sget-object v0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 2448
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    return v0
.end method

.method public getDouble(I)D
    .locals 1
    .parameter "column"

    .prologue
    .line 2453
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getFloat(I)F
    .locals 1
    .parameter "column"

    .prologue
    .line 2458
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getInt(I)I
    .locals 1
    .parameter "column"

    .prologue
    .line 2463
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getLong(I)J
    .locals 2
    .parameter "column"

    .prologue
    .line 2468
    sparse-switch p1, :sswitch_data_0

    .line 2474
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 2470
    :sswitch_0
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 2472
    :goto_0
    return-wide v0

    :sswitch_1
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    goto :goto_0

    .line 2468
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x7 -> :sswitch_1
    .end sparse-switch
.end method

.method public getShort(I)S
    .locals 1
    .parameter "column"

    .prologue
    .line 2479
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2
    .parameter "columnIndex"

    .prologue
    const/4 v1, 0x1

    .line 2426
    packed-switch p1, :pswitch_data_0

    .line 2443
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 2428
    :pswitch_0
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2430
    :pswitch_1
    const-string v0, "android.intent.action.VIEW"

    goto :goto_0

    .line 2432
    :pswitch_2
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2435
    :pswitch_3
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/browser/UrlUtils;->stripUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2437
    :pswitch_4
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2439
    :pswitch_5
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2441
    :pswitch_6
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2426
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 2502
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    return v0
.end method

.method public isNull(I)Z
    .locals 1
    .parameter "column"

    .prologue
    .line 2484
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    return v0
.end method

.method public onMove(II)Z
    .locals 1
    .parameter "oldPosition"
    .parameter "newPosition"

    .prologue
    .line 2489
    iget-object v0, p0, Lcom/android/browser/provider/BrowserProvider2$SuggestionsCursor;->mSource:Landroid/database/Cursor;

    invoke-interface {v0, p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    return v0
.end method
