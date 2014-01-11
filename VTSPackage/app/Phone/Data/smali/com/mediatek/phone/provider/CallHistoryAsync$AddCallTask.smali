.class Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;
.super Landroid/os/AsyncTask;
.source "CallHistoryAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistoryAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AddCallTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
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
    .line 131
    iput-object p1, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;->this$0:Lcom/mediatek/phone/provider/CallHistoryAsync;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/phone/provider/CallHistoryAsync;Lcom/mediatek/phone/provider/CallHistoryAsync$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 131
    invoke-direct {p0, p1}, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;-><init>(Lcom/mediatek/phone/provider/CallHistoryAsync;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 131
    check-cast p1, [Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallTask;->doInBackground([Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;)Ljava/lang/Void;
    .locals 11
    .parameter "numberList"

    .prologue
    .line 135
    array-length v8, p1

    .line 136
    .local v8, count:I
    const/4 v10, 0x0

    .local v10, i:I
    :goto_0
    if-ge v10, v8, :cond_0

    .line 137
    aget-object v7, p1, v10

    .line 140
    .local v7, c:Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;
    :try_start_0
    iget-object v0, v7, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mContext:Landroid/content/Context;

    iget-object v1, v7, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mNumber:Ljava/lang/String;

    iget-object v2, v7, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mCountryISO:Ljava/lang/String;

    iget-wide v3, v7, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mStart:J

    iget v5, v7, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mSlotId:I

    iget-boolean v6, v7, Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;->mIsMultiSim:Z

    invoke-static/range {v0 .. v6}, Lcom/mediatek/phone/provider/CallHistory$Calls;->addCallNumber(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;JIZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 142
    :catch_0
    move-exception v9

    .line 143
    .local v9, e:Ljava/lang/Exception;
    const-string v0, "CallHistoryAsync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception raised during adding CallLog entry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 147
    .end local v7           #c:Lcom/mediatek/phone/provider/CallHistoryAsync$AddCallArgs;
    .end local v9           #e:Ljava/lang/Exception;
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
