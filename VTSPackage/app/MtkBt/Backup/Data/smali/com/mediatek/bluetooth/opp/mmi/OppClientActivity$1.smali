.class Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;
.super Ljava/lang/Thread;
.source "OppClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mHasAny:Z

.field final synthetic this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;)V
    .locals 1
    .parameter

    .prologue
    .line 157
    iput-object p1, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 159
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->mHasAny:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v7, 0x1

    .line 164
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v5, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mUris:Ljava/util/ArrayList;

    if-eqz v5, :cond_5

    .line 166
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "share multi-object: mime-type["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v6, v6, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mIntentType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/bluetooth/util/BtLog;->i(Ljava/lang/String;)V

    .line 168
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v5, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mUris:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    .line 172
    .local v3, uri:Landroid/net/Uri;
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    invoke-virtual {v5}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, type:Ljava/lang/String;
    if-nez v2, :cond_1

    if-eqz v3, :cond_1

    .line 174
    invoke-virtual {v3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/bluetooth/util/MimeUtils;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 176
    :cond_1
    if-nez v2, :cond_2

    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v2, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mIntentType:Ljava/lang/String;

    .line 180
    :cond_2
    if-eqz v2, :cond_3

    if-nez v3, :cond_4

    .line 181
    :cond_3
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    const v6, 0x7f050039

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    invoke-virtual {v5, v6, v7}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 184
    .local v4, uriStr:Ljava/lang/String;
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    new-instance v6, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$1;

    invoke-direct {v6, p0, v4}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$1;-><init>(Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 250
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v2           #type:Ljava/lang/String;
    .end local v3           #uri:Landroid/net/Uri;
    .end local v4           #uriStr:Ljava/lang/String;
    :goto_1
    return-void

    .line 197
    .restart local v0       #i$:Ljava/util/Iterator;
    .restart local v2       #type:Ljava/lang/String;
    .restart local v3       #uri:Landroid/net/Uri;
    :cond_4
    new-instance v1, Lcom/mediatek/bluetooth/share/BluetoothShareTask;

    invoke-direct {v1, v7}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;-><init>(I)V

    .line 199
    .local v1, newTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    invoke-virtual {v1, v2}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setMimeType(Ljava/lang/String;)V

    .line 200
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setObjectUri(Ljava/lang/String;)V

    .line 201
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-boolean v5, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mIsHandover:Z

    invoke-virtual {v1, v5}, Lcom/mediatek/bluetooth/share/BluetoothShareTask;->setHandover(Z)V

    .line 203
    if-eqz v1, :cond_0

    .line 208
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v5, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->oppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    invoke-virtual {v5, v1}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppcCacheTask(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V

    .line 209
    iput-boolean v7, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->mHasAny:Z

    goto :goto_0

    .line 213
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #newTask:Lcom/mediatek/bluetooth/share/BluetoothShareTask;
    .end local v2           #type:Ljava/lang/String;
    .end local v3           #uri:Landroid/net/Uri;
    :cond_5
    iget-boolean v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->mHasAny:Z

    if-nez v5, :cond_6

    .line 215
    const-string v5, "no valid oppc task => finish activity"

    invoke-static {v5}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->i(Ljava/lang/String;)V

    goto :goto_1

    .line 220
    :cond_6
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v5, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v5, :cond_7

    .line 223
    const-string v5, "null remote-device in SEND intent => cann\'t send object via bluetooth(OPP)"

    invoke-static {v5}, Lcom/mediatek/bluetooth/opp/mmi/OppLog;->e(Ljava/lang/String;)V

    goto :goto_1

    .line 227
    :cond_7
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v5, v5, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->oppManager:Lcom/mediatek/bluetooth/opp/adp/OppManager;

    iget-object v6, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    iget-object v6, v6, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->mRemoteDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5, v6}, Lcom/mediatek/bluetooth/opp/adp/OppManager;->oppcSubmitTask(Landroid/bluetooth/BluetoothDevice;)V

    .line 230
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;->this$0:Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;

    new-instance v6, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;

    invoke-direct {v6, p0}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1$2;-><init>(Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity$1;)V

    invoke-virtual {v5, v6}, Lcom/mediatek/bluetooth/opp/mmi/OppClientActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1
.end method
