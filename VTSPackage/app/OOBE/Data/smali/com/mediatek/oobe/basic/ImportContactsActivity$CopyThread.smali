.class Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;
.super Ljava/lang/Thread;
.source "ImportContactsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/ImportContactsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CopyThread"
.end annotation


# instance fields
.field private mResolver:Landroid/content/ContentResolver;

.field mWakeLock:Landroid/os/PowerManager$WakeLock;

.field final synthetic this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;


# direct methods
.method public constructor <init>(Lcom/mediatek/oobe/basic/ImportContactsActivity;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 1043
    iput-object p1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    .line 1044
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1041
    iget-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-virtual {v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->mResolver:Landroid/content/ContentResolver;

    .line 1046
    const-string v1, "power"

    invoke-virtual {p1, v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 1047
    .local v0, powerManager:Landroid/os/PowerManager;
    const v1, 0x20000006

    const-string v2, "OOBE"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 1048
    return-void
.end method

.method private insertToDb(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 11
    .parameter "name"
    .parameter "number"
    .parameter "type"

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x2

    const/4 v9, 0x0

    .line 1265
    const-string v5, "OOBE"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "name is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " number is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1266
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 1267
    .local v4, values:Landroid/content/ContentValues;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1270
    .local v3, operationList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v5, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v5}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1271
    .local v0, builder:Landroid/content/ContentProviderOperation$Builder;
    const-string v5, "indicate_phone_or_sim_contact"

    const/4 v6, -0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1273
    const/4 v2, 0x0

    .line 1274
    .local v2, myGroupsId:Ljava/lang/String;
    invoke-virtual {v0, v4}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    .line 1275
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1278
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1279
    const-string v5, "OOBE"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "PhoneNumberFormatUtilEx.formatNumber(number) is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1280
    invoke-static {p2}, Lcom/mediatek/telephony/PhoneNumberFormatUtilEx;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1281
    sget-object v5, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v5}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1282
    const-string v5, "raw_contact_id"

    invoke-virtual {v0, v5, v9}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1283
    const-string v5, "mimetype"

    const-string v6, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1284
    const-string v5, "data1"

    invoke-virtual {v0, v5, p2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1288
    const-string v5, "data2"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1290
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1294
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1295
    sget-object v5, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v5}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    .line 1296
    const-string v5, "raw_contact_id"

    invoke-virtual {v0, v5, v9}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1297
    const-string v5, "mimetype"

    const-string v6, "vnd.android.cursor.item/name"

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1298
    const-string v5, "data2"

    invoke-virtual {v0, v5, p1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1299
    invoke-virtual {v0}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1303
    :cond_1
    :try_start_0
    iget-object v5, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->mResolver:Landroid/content/ContentResolver;

    const-string v6, "com.android.contacts"

    invoke-virtual {v5, v6, v3}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/OperationApplicationException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1309
    :goto_0
    return-void

    .line 1304
    :catch_0
    move-exception v1

    .line 1305
    .local v1, e:Landroid/os/RemoteException;
    const-string v5, "OOBE"

    const-string v6, "%s: %s"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1306
    .end local v1           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v1

    .line 1307
    .local v1, e:Landroid/content/OperationApplicationException;
    const-string v5, "OOBE"

    const-string v6, "%s: %s"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/content/OperationApplicationException;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {v1}, Landroid/content/OperationApplicationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private queryPhoneNumbers(J)Landroid/database/Cursor;
    .locals 10
    .parameter "contactId"

    .prologue
    const/4 v5, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1248
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v6

    .line 1249
    .local v6, baseUri:Landroid/net/Uri;
    const-string v0, "data"

    invoke-static {v6, v0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 1250
    .local v1, dataUri:Landroid/net/Uri;
    iget-object v0, p0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-virtual {v0}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v9

    const-string v3, "data1"

    aput-object v3, v2, v8

    const/4 v3, 0x2

    const-string v4, "is_super_primary"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "account_type"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "data2"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "data3"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "data15"

    aput-object v4, v2, v3

    const-string v3, "mimetype=?"

    new-array v4, v8, [Ljava/lang/String;

    const-string v8, "vnd.android.cursor.item/phone_v2"

    aput-object v8, v4, v9

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1255
    .local v7, c:Landroid/database/Cursor;
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1261
    .end local v7           #c:Landroid/database/Cursor;
    :goto_0
    return-object v7

    .line 1258
    .restart local v7       #c:Landroid/database/Cursor;
    :cond_0
    if-eqz v7, :cond_1

    .line 1259
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_1
    move-object v7, v5

    .line 1261
    goto :goto_0
.end method


# virtual methods
.method public insertToDB(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentResolver;JLjava/lang/String;)V
    .locals 13
    .parameter "name"
    .parameter "number"
    .parameter "email"
    .parameter "additionalNumber"
    .parameter "resolver"
    .parameter "indicate"
    .parameter "simType"

    .prologue
    .line 1313
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1314
    .local v5, operationList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v8, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v8}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 1315
    .local v1, builder:Landroid/content/ContentProviderOperation$Builder;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 1316
    .local v2, contactvalues:Landroid/content/ContentValues;
    const-string v8, "indicate_phone_or_sim_contact"

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1317
    const-string v8, "aggregation_mode"

    const/4 v9, 0x3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v2, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1318
    invoke-virtual {v1, v2}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    .line 1320
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1322
    const/4 v6, 0x7

    .line 1323
    .local v6, phoneType:I
    const-string v7, ""

    .line 1325
    .local v7, phoneTypeSuffix:Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1326
    new-instance v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;

    invoke-direct {v4, p1}, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;-><init>(Ljava/lang/String;)V

    .line 1327
    .local v4, namePhoneTypePair:Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;
    iget-object p1, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mName:Ljava/lang/String;

    .line 1328
    iget v6, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneType:I

    .line 1329
    iget-object v7, v4, Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;->mPhoneTypeSuffix:Ljava/lang/String;

    .line 1333
    .end local v4           #namePhoneTypePair:Lcom/mediatek/oobe/basic/ImportContactsActivity$NamePhoneTypePair;
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 1334
    invoke-static {p2}, Lcom/mediatek/telephony/PhoneNumberFormatUtilEx;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1335
    sget-object v8, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v8}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 1336
    const-string v8, "raw_contact_id"

    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1337
    const-string v8, "mimetype"

    const-string v9, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1338
    const-string v8, "data1"

    invoke-virtual {v1, v8, p2}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1341
    const-string v8, "data2"

    const/4 v9, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1342
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 1343
    const-string v8, "data15"

    invoke-virtual {v1, v8, v7}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1345
    :cond_1
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1349
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 1350
    sget-object v8, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v8}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 1351
    const-string v8, "raw_contact_id"

    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1352
    const-string v8, "mimetype"

    const-string v9, "vnd.android.cursor.item/name"

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1353
    const-string v8, "data2"

    invoke-virtual {v1, v8, p1}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1354
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1358
    :cond_3
    const-string v8, "USIM"

    move-object/from16 v0, p8

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 1360
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 1362
    const-string v8, "OOBE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "In actuallyImportOneSimContact email is "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p3

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1363
    sget-object v8, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v8}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 1364
    const-string v8, "raw_contact_id"

    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1365
    const-string v8, "mimetype"

    const-string v9, "vnd.android.cursor.item/email_v2"

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1366
    const-string v8, "data2"

    const/4 v9, 0x4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1367
    const-string v8, "data1"

    move-object/from16 v0, p3

    invoke-virtual {v1, v8, v0}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1368
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1371
    :cond_4
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 1372
    invoke-static/range {p4 .. p4}, Lcom/mediatek/telephony/PhoneNumberFormatUtilEx;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 1373
    const-string v8, "OOBE"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "additionalNumber is "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p4

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1374
    sget-object v8, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v8}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 1375
    const-string v8, "raw_contact_id"

    const/4 v9, 0x0

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    .line 1376
    const-string v8, "mimetype"

    const-string v9, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1378
    const-string v8, "data2"

    const/4 v9, 0x7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1379
    const-string v8, "data1"

    move-object/from16 v0, p4

    invoke-virtual {v1, v8, v0}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1380
    const-string v8, "is_additional_number"

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    .line 1381
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1386
    :cond_5
    :try_start_0
    const-string v8, "com.android.contacts"

    move-object/from16 v0, p5

    invoke-virtual {v0, v8, v5}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/OperationApplicationException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1394
    :goto_0
    return-void

    .line 1389
    :catch_0
    move-exception v3

    .line 1390
    .local v3, e:Landroid/os/RemoteException;
    const-string v8, "OOBE"

    const-string v9, "%s: %s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v3}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-virtual {v3}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1391
    .end local v3           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v3

    .line 1392
    .local v3, e:Landroid/content/OperationApplicationException;
    const-string v8, "OOBE"

    const-string v9, "%s: %s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v3}, Landroid/content/OperationApplicationException;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-virtual {v3}, Landroid/content/OperationApplicationException;->getMessage()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public queryForRawContactId(Landroid/content/ContentResolver;J)J
    .locals 9
    .parameter "cr"
    .parameter "contactId"

    .prologue
    .line 1397
    const/4 v8, 0x0

    .line 1398
    .local v8, rawContactIdCursor:Landroid/database/Cursor;
    const-wide/16 v6, -0x1

    .line 1400
    .local v6, rawContactId:J
    :try_start_0
    sget-object v1, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "contact_id="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1402
    if-eqz v8, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1404
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v6

    .line 1407
    :cond_0
    if-eqz v8, :cond_1

    .line 1408
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1411
    :cond_1
    return-wide v6

    .line 1407
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_2

    .line 1408
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method public run()V
    .locals 29

    .prologue
    .line 1052
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingCopied:Z
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1700(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1245
    :goto_0
    return-void

    .line 1056
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1057
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1802(Z)Z

    .line 1058
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    const/4 v7, 0x1

    #setter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingCopied:Z
    invoke-static {v2, v7}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1702(Lcom/mediatek/oobe/basic/ImportContactsActivity;Z)Z

    .line 1060
    const/16 v24, 0x0

    .line 1061
    .local v24, sameNameCount:I
    const/4 v3, 0x0

    .line 1062
    .local v3, name:Ljava/lang/String;
    const/4 v4, 0x0

    .line 1063
    .local v4, number:Ljava/lang/String;
    const/16 v25, 0x0

    .line 1064
    .local v25, simCursor:Landroid/database/Cursor;
    const/16 v21, 0x0

    .line 1065
    .local v21, phoneCursor:Landroid/database/Cursor;
    const/16 v27, -0x1

    .line 1066
    .local v27, type:I
    const-string v2, "OOBE"

    const-string v7, "copy from sim to phone"

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1067
    const/16 v17, 0x0

    .local v17, i:I
    :goto_1
    invoke-static {}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1100()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_18

    invoke-static {}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1800()Z

    move-result v2

    if-nez v2, :cond_18

    .line 1068
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "copy thread, mSimSlotStatus[i].mIsSelected="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v8}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v8

    aget-object v8, v8, v17

    iget-boolean v8, v8, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1069
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v2

    aget-object v2, v2, v17

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSelected:Z

    if-nez v2, :cond_2

    .line 1070
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SIM in slot "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is not selected for contact import"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1067
    :cond_1
    :goto_2
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 1073
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v2

    aget-object v2, v2, v17

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mCopyFinished:Z

    if-eqz v2, :cond_3

    .line 1074
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-virtual {v8}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getStepSpecialTag()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "contact in SIM "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " have already been imported, ignore"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 1093
    :cond_3
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCursorQuerySims:[Landroid/database/Cursor;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1000(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Landroid/database/Cursor;

    move-result-object v2

    aget-object v25, v2, v17

    .line 1094
    if-eqz v25, :cond_4

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1095
    :cond_4
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "simCursor==null, simIndex="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1231
    if-eqz v25, :cond_1

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1232
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .line 1098
    :cond_5
    :try_start_1
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-nez v2, :cond_6

    .line 1099
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Get 0 contacts from SIM "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1100
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1231
    if-eqz v25, :cond_1

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1232
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    goto/16 :goto_2

    .line 1104
    :cond_6
    :try_start_2
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1105
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v2

    aget-object v2, v2, v17

    iget-boolean v2, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mIsSrcSimUSIM:Z

    if-nez v2, :cond_1c

    .line 1106
    :goto_3
    invoke-static {}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1800()Z

    move-result v2

    if-nez v2, :cond_a

    .line 1107
    const/4 v2, 0x0

    move-object/from16 v0, v25

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    .line 1108
    .local v13, contactId:J
    const/4 v2, 0x1

    move-object/from16 v0, v25

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1109
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Name is: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1111
    :try_start_3
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->queryPhoneNumbers(J)Landroid/database/Cursor;

    move-result-object v21

    .line 1112
    const-string v4, ""

    .line 1113
    const/16 v27, -0x1

    .line 1114
    if-eqz v21, :cond_7

    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1115
    const-string v2, "data1"

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1116
    const-string v2, "data2"

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v27

    .line 1119
    :cond_7
    if-eqz v21, :cond_8

    .line 1120
    :try_start_4
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->close()V

    .line 1123
    :cond_8
    new-instance v28, Landroid/content/ContentValues;

    invoke-direct/range {v28 .. v28}, Landroid/content/ContentValues;-><init>()V

    .line 1124
    .local v28, values:Landroid/content/ContentValues;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 1125
    const-string v2, "-"

    const-string v7, ""

    invoke-virtual {v4, v2, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1127
    :cond_9
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 1128
    const-string v2, "tag"

    const-string v7, ""

    move-object/from16 v0, v28

    invoke-virtual {v0, v2, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1129
    const-string v2, "number"

    move-object/from16 v0, v28

    invoke-virtual {v0, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1130
    const/4 v3, 0x0

    .line 1136
    :goto_4
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v3, v4, v1}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->insertToDb(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1137
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v2

    aget-object v2, v2, v17

    iget v7, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    .line 1138
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v18

    .line 1139
    .local v18, msg:Landroid/os/Message;
    const/4 v2, 0x0

    move-object/from16 v0, v18

    iput v2, v0, Landroid/os/Message;->what:I

    .line 1140
    move/from16 v0, v17

    move-object/from16 v1, v18

    iput v0, v1, Landroid/os/Message;->arg1:I

    .line 1141
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyHandler:Landroid/os/Handler;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1900(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/os/Handler;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1143
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v2

    if-nez v2, :cond_f

    .line 1231
    .end local v13           #contactId:J
    .end local v18           #msg:Landroid/os/Message;
    .end local v28           #values:Landroid/content/ContentValues;
    :cond_a
    :goto_5
    if-eqz v25, :cond_1

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1232
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    goto/16 :goto_2

    .line 1119
    .restart local v13       #contactId:J
    :catchall_0
    move-exception v2

    if-eqz v21, :cond_b

    .line 1120
    :try_start_5
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->close()V

    :cond_b
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1231
    .end local v13           #contactId:J
    :catchall_1
    move-exception v2

    :goto_6
    if-eqz v25, :cond_c

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->isClosed()Z

    move-result v7

    if-nez v7, :cond_c

    .line 1232
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    :cond_c
    throw v2

    .line 1132
    .restart local v13       #contactId:J
    .restart local v28       #values:Landroid/content/ContentValues;
    :cond_d
    :try_start_6
    const-string v7, "tag"

    if-lez v24, :cond_e

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_7
    move-object/from16 v0, v28

    invoke-virtual {v0, v7, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1133
    const-string v2, "number"

    move-object/from16 v0, v28

    invoke-virtual {v0, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_e
    move-object v2, v3

    .line 1132
    goto :goto_7

    .line 1148
    .restart local v18       #msg:Landroid/os/Message;
    :cond_f
    const-string v2, "dwz"

    const-string v7, "wait a few second for import"

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 1150
    const/16 v26, 0x7d0

    .line 1151
    .local v26, sleepTime:I
    const-wide/16 v7, 0x7d0

    :try_start_7
    invoke-static {v7, v8}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->sleep(J)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_0

    goto/16 :goto_3

    .line 1152
    :catch_0
    move-exception v15

    .line 1153
    .local v15, e:Ljava/lang/InterruptedException;
    :try_start_8
    invoke-virtual {v15}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto/16 :goto_3

    .end local v15           #e:Ljava/lang/InterruptedException;
    .end local v26           #sleepTime:I
    .end local v28           #values:Landroid/content/ContentValues;
    .local v5, email:Ljava/lang/String;
    .local v6, additionalNumber:Ljava/lang/String;
    .local v12, c:Landroid/database/Cursor;
    .local v22, rawContactId:J
    :cond_10
    move-object/from16 v20, v4

    .end local v4           #number:Ljava/lang/String;
    .local v20, number:Ljava/lang/String;
    move-object/from16 v19, v3

    .line 1157
    .end local v3           #name:Ljava/lang/String;
    .end local v5           #email:Ljava/lang/String;
    .end local v6           #additionalNumber:Ljava/lang/String;
    .end local v12           #c:Landroid/database/Cursor;
    .end local v13           #contactId:J
    .end local v18           #msg:Landroid/os/Message;
    .end local v22           #rawContactId:J
    .local v19, name:Ljava/lang/String;
    :goto_8
    :try_start_9
    invoke-static {}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1800()Z

    move-result v2

    if-nez v2, :cond_1b

    .line 1158
    const/16 v16, 0x0

    .line 1159
    .local v16, email:Ljava/lang/String;
    const/4 v11, 0x0

    .line 1160
    .local v11, additionalNumber:Ljava/lang/String;
    const/4 v2, 0x0

    move-object/from16 v0, v25

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    .line 1164
    .restart local v13       #contactId:J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v13, v14}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->queryForRawContactId(Landroid/content/ContentResolver;J)J

    move-result-wide v22

    .line 1165
    .restart local v22       #rawContactId:J
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "copy from usim to phone rawContactId is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, v22

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1166
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    invoke-virtual {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x3

    new-array v4, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "mimetype"

    aput-object v8, v4, v7

    const/4 v7, 0x1

    const-string v8, "data1"

    aput-object v8, v4, v7

    const/4 v7, 0x2

    const-string v8, "is_additional_number"

    aput-object v8, v4, v7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "raw_contact_id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, v22

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    move-result-object v12

    .line 1169
    .restart local v12       #c:Landroid/database/Cursor;
    if-eqz v12, :cond_1a

    move-object v6, v11

    .end local v11           #additionalNumber:Ljava/lang/String;
    .restart local v6       #additionalNumber:Ljava/lang/String;
    move-object/from16 v5, v16

    .end local v16           #email:Ljava/lang/String;
    .restart local v5       #email:Ljava/lang/String;
    move-object/from16 v3, v19

    .line 1170
    .end local v19           #name:Ljava/lang/String;
    .restart local v3       #name:Ljava/lang/String;
    :cond_11
    :goto_9
    :try_start_a
    invoke-interface {v12}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 1171
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "copy from usim to phone c.getCount() is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mimeType is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v12, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " data1 is"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    invoke-interface {v12, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is_additional_number is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x2

    invoke-interface {v12, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1184
    const/4 v2, 0x0

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v7, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    const/4 v2, 0x2

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v7, "1"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1187
    const/4 v2, 0x1

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1188
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "copy from usim to phone additionalNumber is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1190
    :cond_12
    const/4 v2, 0x0

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v7, "vnd.android.cursor.item/name"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 1191
    const/4 v2, 0x1

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1192
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "In run name is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1194
    :cond_13
    const/4 v2, 0x0

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v7, "vnd.android.cursor.item/email_v2"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 1195
    const/4 v2, 0x1

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 1196
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "copy from usim to phone email is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_9

    .line 1231
    :catchall_2
    move-exception v2

    move-object/from16 v4, v20

    .end local v20           #number:Ljava/lang/String;
    .restart local v4       #number:Ljava/lang/String;
    goto/16 :goto_6

    .line 1200
    .end local v4           #number:Ljava/lang/String;
    .restart local v20       #number:Ljava/lang/String;
    :cond_14
    invoke-interface {v12}, Landroid/database/Cursor;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 1203
    :goto_a
    :try_start_b
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->queryPhoneNumbers(J)Landroid/database/Cursor;

    move-result-object v21

    .line 1204
    const-string v4, ""
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 1205
    .end local v20           #number:Ljava/lang/String;
    .restart local v4       #number:Ljava/lang/String;
    const/16 v27, -0x1

    .line 1206
    if-eqz v21, :cond_15

    :try_start_c
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1207
    const-string v2, "data1"

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1208
    const-string v2, "data2"

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    move-result v27

    .line 1211
    :cond_15
    if-eqz v21, :cond_16

    .line 1212
    :try_start_d
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->close()V

    .line 1215
    :cond_16
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "copy from usim to phone name is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1216
    const-string v2, "OOBE"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "copy from usim to phone number is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1217
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->mResolver:Landroid/content/ContentResolver;

    const-wide/16 v8, -0x1

    const-string v10, "USIM"

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v10}, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->insertToDB(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentResolver;JLjava/lang/String;)V

    .line 1219
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mSimSlotStatus:[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$600(Lcom/mediatek/oobe/basic/ImportContactsActivity;)[Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;

    move-result-object v2

    aget-object v2, v2, v17

    iget v7, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v2, Lcom/mediatek/oobe/basic/ImportContactsActivity$SIMSlotStatus;->mSuccessCount:I

    .line 1220
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v18

    .line 1221
    .restart local v18       #msg:Landroid/os/Message;
    const/4 v2, 0x0

    move-object/from16 v0, v18

    iput v2, v0, Landroid/os/Message;->what:I

    .line 1222
    move/from16 v0, v17

    move-object/from16 v1, v18

    iput v0, v1, Landroid/os/Message;->arg1:I

    .line 1223
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyHandler:Landroid/os/Handler;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1900(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/os/Handler;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1225
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_10

    goto/16 :goto_5

    .line 1211
    .end local v4           #number:Ljava/lang/String;
    .end local v18           #msg:Landroid/os/Message;
    .restart local v20       #number:Ljava/lang/String;
    :catchall_3
    move-exception v2

    move-object/from16 v4, v20

    .end local v20           #number:Ljava/lang/String;
    .restart local v4       #number:Ljava/lang/String;
    :goto_b
    if-eqz v21, :cond_17

    .line 1212
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->close()V

    :cond_17
    throw v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 1237
    .end local v5           #email:Ljava/lang/String;
    .end local v6           #additionalNumber:Ljava/lang/String;
    .end local v12           #c:Landroid/database/Cursor;
    .end local v13           #contactId:J
    .end local v22           #rawContactId:J
    :cond_18
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    const/4 v7, 0x0

    #setter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mBeingCopied:Z
    invoke-static {v2, v7}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1702(Lcom/mediatek/oobe/basic/ImportContactsActivity;Z)Z

    .line 1238
    invoke-static {}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1800()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 1239
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyHandler:Landroid/os/Handler;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1900(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/os/Handler;

    move-result-object v2

    const/4 v7, 0x2

    invoke-virtual {v2, v7}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1244
    :goto_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    .line 1241
    :cond_19
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/ImportContactsActivity$CopyThread;->this$0:Lcom/mediatek/oobe/basic/ImportContactsActivity;

    #getter for: Lcom/mediatek/oobe/basic/ImportContactsActivity;->mCopyHandler:Landroid/os/Handler;
    invoke-static {v2}, Lcom/mediatek/oobe/basic/ImportContactsActivity;->access$1900(Lcom/mediatek/oobe/basic/ImportContactsActivity;)Landroid/os/Handler;

    move-result-object v2

    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_c

    .line 1231
    .end local v3           #name:Ljava/lang/String;
    .end local v4           #number:Ljava/lang/String;
    .restart local v19       #name:Ljava/lang/String;
    .restart local v20       #number:Ljava/lang/String;
    :catchall_4
    move-exception v2

    move-object/from16 v4, v20

    .end local v20           #number:Ljava/lang/String;
    .restart local v4       #number:Ljava/lang/String;
    move-object/from16 v3, v19

    .end local v19           #name:Ljava/lang/String;
    .restart local v3       #name:Ljava/lang/String;
    goto/16 :goto_6

    .line 1211
    .restart local v5       #email:Ljava/lang/String;
    .restart local v6       #additionalNumber:Ljava/lang/String;
    .restart local v12       #c:Landroid/database/Cursor;
    .restart local v13       #contactId:J
    .restart local v22       #rawContactId:J
    :catchall_5
    move-exception v2

    goto :goto_b

    .end local v3           #name:Ljava/lang/String;
    .end local v4           #number:Ljava/lang/String;
    .end local v5           #email:Ljava/lang/String;
    .end local v6           #additionalNumber:Ljava/lang/String;
    .restart local v11       #additionalNumber:Ljava/lang/String;
    .restart local v16       #email:Ljava/lang/String;
    .restart local v19       #name:Ljava/lang/String;
    .restart local v20       #number:Ljava/lang/String;
    :cond_1a
    move-object v6, v11

    .end local v11           #additionalNumber:Ljava/lang/String;
    .restart local v6       #additionalNumber:Ljava/lang/String;
    move-object/from16 v5, v16

    .end local v16           #email:Ljava/lang/String;
    .restart local v5       #email:Ljava/lang/String;
    move-object/from16 v3, v19

    .end local v19           #name:Ljava/lang/String;
    .restart local v3       #name:Ljava/lang/String;
    goto/16 :goto_a

    .end local v3           #name:Ljava/lang/String;
    .end local v5           #email:Ljava/lang/String;
    .end local v6           #additionalNumber:Ljava/lang/String;
    .end local v12           #c:Landroid/database/Cursor;
    .end local v13           #contactId:J
    .end local v22           #rawContactId:J
    .restart local v19       #name:Ljava/lang/String;
    :cond_1b
    move-object/from16 v4, v20

    .end local v20           #number:Ljava/lang/String;
    .restart local v4       #number:Ljava/lang/String;
    move-object/from16 v3, v19

    .end local v19           #name:Ljava/lang/String;
    .restart local v3       #name:Ljava/lang/String;
    goto/16 :goto_5

    :cond_1c
    move-object/from16 v20, v4

    .end local v4           #number:Ljava/lang/String;
    .restart local v20       #number:Ljava/lang/String;
    move-object/from16 v19, v3

    .end local v3           #name:Ljava/lang/String;
    .restart local v19       #name:Ljava/lang/String;
    goto/16 :goto_8
.end method
