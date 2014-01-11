.class Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;
.super Landroid/os/AsyncTask;
.source "CallHistoryAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistoryAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeleteCallTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;",
        "Ljava/lang/Void;",
        "[",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/provider/CallHistoryAsync;


# direct methods
.method private constructor <init>(Lcom/mediatek/phone/provider/CallHistoryAsync;)V
    .locals 0
    .parameter

    .prologue
    .line 84
    iput-object p1, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;->this$0:Lcom/mediatek/phone/provider/CallHistoryAsync;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/phone/provider/CallHistoryAsync;Lcom/mediatek/phone/provider/CallHistoryAsync$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;-><init>(Lcom/mediatek/phone/provider/CallHistoryAsync;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 84
    check-cast p1, [Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallTask;->doInBackground([Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;)[Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;)[Ljava/lang/Integer;
    .locals 8
    .parameter "numberList"

    .prologue
    .line 87
    array-length v1, p1

    .line 88
    .local v1, count:I
    new-array v4, v1, [Ljava/lang/Integer;

    .line 89
    .local v4, result:[Ljava/lang/Integer;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 90
    aget-object v0, p1, v3

    .line 93
    .local v0, c:Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;
    :try_start_0
    iget-object v5, v0, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;->mContext:Landroid/content/Context;

    iget-object v6, v0, Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;->mNumber:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/mediatek/phone/provider/CallHistory$Calls;->deleteNumber(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 94
    :catch_0
    move-exception v2

    .line 95
    .local v2, e:Ljava/lang/Exception;
    const-string v5, "CallHistoryAsync"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception raised during delete call entry: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    const/4 v5, 0x0

    aput-object v5, v4, v3

    goto :goto_1

    .line 99
    .end local v0           #c:Lcom/mediatek/phone/provider/CallHistoryAsync$DeleteCallArgs;
    .end local v2           #e:Ljava/lang/Exception;
    :cond_0
    return-object v4
.end method
