.class Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;
.super Landroid/os/Handler;
.source "SimAssociateHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/calloption/SimAssociateHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/calloption/SimAssociateHandler;


# direct methods
.method public constructor <init>(Lcom/mediatek/calloption/SimAssociateHandler;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    .line 133
    iput-object p1, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    .line 134
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 135
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 13
    .parameter "msg"

    .prologue
    .line 139
    const/4 v11, 0x0

    .line 140
    .local v11, number:Ljava/lang/String;
    const/4 v10, -0x1

    .line 141
    .local v10, id:I
    const/4 v6, 0x0

    .line 142
    .local v6, associateSims:Ljava/util/ArrayList;
    const/4 v8, 0x0

    .line 143
    .local v8, exist:Z
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 203
    :goto_0
    return-void

    .line 145
    :pswitch_0
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    const-string v1, "+MSG_LOAD"

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    iget-object v0, v0, Lcom/mediatek/calloption/SimAssociateHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "data1"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "sim_id"

    aput-object v4, v2, v3

    const-string v3, "mimetype=\'vnd.android.cursor.item/phone_v2\' AND (sim_id>0)"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 153
    .local v7, cursor:Landroid/database/Cursor;
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    iget-object v0, v0, Lcom/mediatek/calloption/SimAssociateHandler;->mSimAssociationMaps:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 154
    if-eqz v7, :cond_5

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 156
    :cond_0
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 157
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 158
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "number = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    .line 159
    invoke-static {v11}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 160
    .local v12, strNumber:Ljava/lang/String;
    if-eqz v12, :cond_1

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x7

    if-le v0, v1, :cond_1

    .line 161
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x7

    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    .line 163
    :cond_1
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "strNumber = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    .line 164
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    iget-object v0, v0, Lcom/mediatek/calloption/SimAssociateHandler;->mSimAssociationMaps:Ljava/util/HashMap;

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #associateSims:Ljava/util/ArrayList;
    check-cast v6, Ljava/util/ArrayList;

    .line 165
    .restart local v6       #associateSims:Ljava/util/ArrayList;
    if-nez v6, :cond_2

    .line 166
    new-instance v6, Ljava/util/ArrayList;

    .end local v6           #associateSims:Ljava/util/ArrayList;
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 167
    .restart local v6       #associateSims:Ljava/util/ArrayList;
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    iget-object v0, v0, Lcom/mediatek/calloption/SimAssociateHandler;->mSimAssociationMaps:Ljava/util/HashMap;

    invoke-virtual {v0, v12, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    :cond_2
    const/4 v8, 0x0

    .line 170
    const/4 v9, 0x0

    .local v9, i:I
    :goto_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v9, v0, :cond_3

    .line 171
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v10, :cond_7

    .line 172
    const/4 v8, 0x1

    .line 176
    :cond_3
    if-nez v8, :cond_4

    .line 177
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    :cond_4
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "associateSims = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    .line 180
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    .end local v9           #i:I
    .end local v12           #strNumber:Ljava/lang/String;
    :cond_5
    if-eqz v7, :cond_6

    .line 183
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 185
    :cond_6
    monitor-enter p0

    .line 186
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/calloption/SimAssociateHandler;->mLoading:Z
    invoke-static {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->access$102(Lcom/mediatek/calloption/SimAssociateHandler;Z)Z

    .line 187
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/calloption/SimAssociateHandler;->mCacheDirty:Z
    invoke-static {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->access$002(Lcom/mediatek/calloption/SimAssociateHandler;Z)Z

    .line 191
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    const-string v1, "-MSG_LOADs"

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 170
    .restart local v9       #i:I
    .restart local v12       #strNumber:Ljava/lang/String;
    :cond_7
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 187
    .end local v9           #i:I
    .end local v12           #strNumber:Ljava/lang/String;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 194
    .end local v7           #cursor:Landroid/database/Cursor;
    :pswitch_1
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    const-string v1, "MSG_EXIT"

    invoke-virtual {v0, v1}, Lcom/mediatek/calloption/SimAssociateHandler;->log(Ljava/lang/String;)V

    .line 195
    invoke-virtual {p0}, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    goto/16 :goto_0

    .line 198
    :pswitch_2
    iget-object v0, p0, Lcom/mediatek/calloption/SimAssociateHandler$MyHandler;->this$0:Lcom/mediatek/calloption/SimAssociateHandler;

    invoke-virtual {v0}, Lcom/mediatek/calloption/SimAssociateHandler;->load()V

    goto/16 :goto_0

    .line 143
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
