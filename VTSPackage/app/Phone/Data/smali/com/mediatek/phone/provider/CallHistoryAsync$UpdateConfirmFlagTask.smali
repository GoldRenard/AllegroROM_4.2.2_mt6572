.class Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;
.super Landroid/os/AsyncTask;
.source "CallHistoryAsync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/provider/CallHistoryAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateConfirmFlagTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;",
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
    .line 173
    iput-object p1, p0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;->this$0:Lcom/mediatek/phone/provider/CallHistoryAsync;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/phone/provider/CallHistoryAsync;Lcom/mediatek/phone/provider/CallHistoryAsync$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 173
    invoke-direct {p0, p1}, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;-><init>(Lcom/mediatek/phone/provider/CallHistoryAsync;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 173
    check-cast p1, [Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagTask;->doInBackground([Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;)[Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;)[Ljava/lang/Integer;
    .locals 9
    .parameter "numberList"

    .prologue
    .line 176
    array-length v1, p1

    .line 177
    .local v1, count:I
    new-array v4, v1, [Ljava/lang/Integer;

    .line 178
    .local v4, result:[Ljava/lang/Integer;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 179
    aget-object v0, p1, v3

    .line 182
    .local v0, c:Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;
    :try_start_0
    iget-object v5, v0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;->mContext:Landroid/content/Context;

    iget-object v6, v0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;->mNumber:Ljava/lang/String;

    iget-wide v7, v0, Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;->mConfirm:J

    invoke-static {v5, v6, v7, v8}, Lcom/mediatek/phone/provider/CallHistory$Calls;->updateConfirmFlag(Landroid/content/Context;Ljava/lang/String;J)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 183
    :catch_0
    move-exception v2

    .line 184
    .local v2, e:Ljava/lang/Exception;
    const-string v5, "CallHistoryAsync"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception raised during update confirm flag entry: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    const/4 v5, 0x0

    aput-object v5, v4, v3

    goto :goto_1

    .line 188
    .end local v0           #c:Lcom/mediatek/phone/provider/CallHistoryAsync$UpdateConfirmFlagArgs;
    .end local v2           #e:Ljava/lang/Exception;
    :cond_0
    return-object v4
.end method
