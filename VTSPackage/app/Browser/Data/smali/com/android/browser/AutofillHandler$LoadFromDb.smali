.class Lcom/android/browser/AutofillHandler$LoadFromDb;
.super Ljava/lang/Thread;
.source "AutofillHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/AutofillHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadFromDb"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/AutofillHandler;


# direct methods
.method private constructor <init>(Lcom/android/browser/AutofillHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 76
    iput-object p1, p0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/browser/AutofillHandler;Lcom/android/browser/AutofillHandler$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/android/browser/AutofillHandler$LoadFromDb;-><init>(Lcom/android/browser/AutofillHandler;)V

    return-void
.end method

.method private getContactField(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "uri"
    .parameter "field"
    .parameter "itemType"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 177
    const/4 v7, 0x0

    .line 179
    .local v7, result:Ljava/lang/String;
    iget-object v0, p0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/android/browser/AutofillHandler;->access$100(Lcom/android/browser/AutofillHandler;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-array v2, v4, [Ljava/lang/String;

    aput-object p2, v2, v1

    const-string v3, "mimetype=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object p3, v4, v1

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 182
    .local v6, c:Landroid/database/Cursor;
    if-nez v6, :cond_0

    .line 194
    :goto_0
    return-object v5

    .line 188
    :cond_0
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 189
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 192
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v5, v7

    .line 194
    goto :goto_0

    .line 192
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method


# virtual methods
.method public run()V
    .locals 30

    .prologue
    .line 85
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/browser/AutofillHandler;->access$100(Lcom/android/browser/AutofillHandler;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v28

    .line 88
    .local v28, p:Landroid/content/SharedPreferences;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    const-string v3, "autofill_active_profile_id"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mAutoFillActiveProfileId:I
    invoke-static {v14}, Lcom/android/browser/AutofillHandler;->access$200(Lcom/android/browser/AutofillHandler;)I

    move-result v14

    move-object/from16 v0, v28

    invoke-interface {v0, v3, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    #setter for: Lcom/android/browser/AutofillHandler;->mAutoFillActiveProfileId:I
    invoke-static {v2, v3}, Lcom/android/browser/AutofillHandler;->access$202(Lcom/android/browser/AutofillHandler;I)I

    .line 97
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/browser/AutofillHandler;->access$100(Lcom/android/browser/AutofillHandler;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/browser/AutoFillProfileDatabase;->getInstance(Landroid/content/Context;)Lcom/android/browser/AutoFillProfileDatabase;

    move-result-object v26

    .line 98
    .local v26, autoFillDb:Lcom/android/browser/AutoFillProfileDatabase;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mAutoFillActiveProfileId:I
    invoke-static {v2}, Lcom/android/browser/AutofillHandler;->access$200(Lcom/android/browser/AutofillHandler;)I

    move-result v2

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Lcom/android/browser/AutoFillProfileDatabase;->getProfile(I)Landroid/database/Cursor;

    move-result-object v27

    .line 100
    .local v27, c:Landroid/database/Cursor;
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 101
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->moveToFirst()Z

    .line 103
    const-string v2, "fullname"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, fullName:Ljava/lang/String;
    const-string v2, "email"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 107
    .local v5, email:Ljava/lang/String;
    const-string v2, "companyname"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 109
    .local v6, company:Ljava/lang/String;
    const-string v2, "addressline1"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 111
    .local v7, addressLine1:Ljava/lang/String;
    const-string v2, "addressline2"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 113
    .local v8, addressLine2:Ljava/lang/String;
    const-string v2, "city"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 115
    .local v9, city:Ljava/lang/String;
    const-string v2, "state"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 117
    .local v10, state:Ljava/lang/String;
    const-string v2, "zipcode"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 119
    .local v11, zip:Ljava/lang/String;
    const-string v2, "country"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 121
    .local v12, country:Ljava/lang/String;
    const-string v2, "phone"

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 123
    .local v13, phone:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    new-instance v2, Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mAutoFillActiveProfileId:I
    invoke-static {v3}, Lcom/android/browser/AutofillHandler;->access$200(Lcom/android/browser/AutofillHandler;)I

    move-result v3

    invoke-direct/range {v2 .. v13}, Landroid/webkit/WebSettingsClassic$AutoFillProfile;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    #setter for: Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    invoke-static {v14, v2}, Lcom/android/browser/AutofillHandler;->access$302(Lcom/android/browser/AutofillHandler;Landroid/webkit/WebSettingsClassic$AutoFillProfile;)Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    .line 127
    .end local v4           #fullName:Ljava/lang/String;
    .end local v5           #email:Ljava/lang/String;
    .end local v6           #company:Ljava/lang/String;
    .end local v7           #addressLine1:Ljava/lang/String;
    .end local v8           #addressLine2:Ljava/lang/String;
    .end local v9           #city:Ljava/lang/String;
    .end local v10           #state:Ljava/lang/String;
    .end local v11           #zip:Ljava/lang/String;
    .end local v12           #country:Ljava/lang/String;
    .end local v13           #phone:Ljava/lang/String;
    :cond_0
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->close()V

    .line 128
    invoke-virtual/range {v26 .. v26}, Lcom/android/browser/AutoFillProfileDatabase;->close()V

    .line 132
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mLoaded:Ljava/util/concurrent/CountDownLatch;
    invoke-static {v2}, Lcom/android/browser/AutofillHandler;->access$400(Lcom/android/browser/AutofillHandler;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 138
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    invoke-static {v2}, Lcom/android/browser/AutofillHandler;->access$300(Lcom/android/browser/AutofillHandler;)Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    move-result-object v2

    if-nez v2, :cond_2

    .line 141
    sget-object v2, Landroid/provider/ContactsContract$Profile;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "data"

    invoke-static {v2, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v29

    .line 143
    .local v29, profileUri:Landroid/net/Uri;
    const-string v2, "data1"

    const-string v3, "vnd.android.cursor.item/name"

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/AutofillHandler$LoadFromDb;->getContactField(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 148
    .local v16, name:Ljava/lang/String;
    if-eqz v16, :cond_2

    .line 149
    const-string v2, "data1"

    const-string v3, "vnd.android.cursor.item/email_v2"

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/AutofillHandler$LoadFromDb;->getContactField(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 152
    .restart local v5       #email:Ljava/lang/String;
    const-string v2, "data1"

    const-string v3, "vnd.android.cursor.item/phone_v2"

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/AutofillHandler$LoadFromDb;->getContactField(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 155
    .restart local v13       #phone:Ljava/lang/String;
    const-string v2, "data1"

    const-string v3, "vnd.android.cursor.item/organization"

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1, v2, v3}, Lcom/android/browser/AutofillHandler$LoadFromDb;->getContactField(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 164
    .restart local v6       #company:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    monitor-enter v3

    .line 167
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    #getter for: Lcom/android/browser/AutofillHandler;->mAutoFillProfile:Landroid/webkit/WebSettingsClassic$AutoFillProfile;
    invoke-static {v2}, Lcom/android/browser/AutofillHandler;->access$300(Lcom/android/browser/AutofillHandler;)Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    move-result-object v2

    if-nez v2, :cond_1

    .line 168
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/browser/AutofillHandler$LoadFromDb;->this$0:Lcom/android/browser/AutofillHandler;

    new-instance v14, Landroid/webkit/WebSettingsClassic$AutoFillProfile;

    const/4 v15, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v25, v13

    invoke-direct/range {v14 .. v25}, Landroid/webkit/WebSettingsClassic$AutoFillProfile;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v15, 0x0

    invoke-virtual {v2, v14, v15}, Lcom/android/browser/AutofillHandler;->setAutoFillProfile(Landroid/webkit/WebSettingsClassic$AutoFillProfile;Landroid/os/Message;)V

    .line 171
    :cond_1
    monitor-exit v3

    .line 174
    .end local v5           #email:Ljava/lang/String;
    .end local v6           #company:Ljava/lang/String;
    .end local v13           #phone:Ljava/lang/String;
    .end local v16           #name:Ljava/lang/String;
    .end local v29           #profileUri:Landroid/net/Uri;
    :cond_2
    return-void

    .line 171
    .restart local v5       #email:Ljava/lang/String;
    .restart local v6       #company:Ljava/lang/String;
    .restart local v13       #phone:Ljava/lang/String;
    .restart local v16       #name:Ljava/lang/String;
    .restart local v29       #profileUri:Landroid/net/Uri;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
