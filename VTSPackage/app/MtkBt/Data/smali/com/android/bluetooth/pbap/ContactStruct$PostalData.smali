.class public Lcom/android/bluetooth/pbap/ContactStruct$PostalData;
.super Ljava/lang/Object;
.source "ContactStruct.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/ContactStruct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PostalData"
.end annotation


# static fields
.field public static final ADDR_MAX_DATA_SIZE:I = 0x7


# instance fields
.field public final country:Ljava/lang/String;

.field public final extendedAddress:Ljava/lang/String;

.field public isPrimary:Z

.field public final label:Ljava/lang/String;

.field public final localty:Ljava/lang/String;

.field private final mDataArray:[Ljava/lang/String;

.field public final pobox:Ljava/lang/String;

.field public final postalCode:Ljava/lang/String;

.field public final region:Ljava/lang/String;

.field public final street:Ljava/lang/String;

.field public final type:I


# direct methods
.method public constructor <init>(ILjava/util/List;Ljava/lang/String;Z)V
    .locals 8
    .parameter "postalDataType"
    .parameter
    .parameter "postalDataLabel"
    .parameter "isPostalDataPrimary"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .local p2, propValueList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x7

    .line 313
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 314
    iput p1, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->type:I

    .line 315
    new-array v5, v7, [Ljava/lang/String;

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    .line 317
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    .line 318
    .local v4, size:I
    if-le v4, v7, :cond_0

    .line 319
    const/4 v4, 0x7

    .line 329
    :cond_0
    const/4 v1, 0x0

    .line 330
    .local v1, i:I
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 331
    .local v0, addressElement:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    aput-object v0, v5, v1

    .line 332
    add-int/lit8 v1, v1, 0x1

    if-lt v1, v4, :cond_1

    move v2, v1

    .line 336
    .end local v0           #addressElement:Ljava/lang/String;
    .end local v1           #i:I
    .local v2, i:I
    :goto_0
    if-ge v2, v7, :cond_2

    .line 337
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    const/4 v6, 0x0

    aput-object v6, v5, v2

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_0

    .line 340
    :cond_2
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    .line 341
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    const/4 v6, 0x1

    aget-object v5, v5, v6

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->extendedAddress:Ljava/lang/String;

    .line 342
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    const/4 v6, 0x2

    aget-object v5, v5, v6

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    .line 343
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    const/4 v6, 0x3

    aget-object v5, v5, v6

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    .line 344
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    const/4 v6, 0x4

    aget-object v5, v5, v6

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    .line 345
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    const/4 v6, 0x5

    aget-object v5, v5, v6

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    .line 346
    iget-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    const/4 v6, 0x6

    aget-object v5, v5, v6

    iput-object v5, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    .line 348
    iput-object p3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    .line 349
    iput-boolean p4, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->isPrimary:Z

    .line 350
    return-void

    .end local v2           #i:I
    .restart local v1       #i:I
    :cond_3
    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 383
    if-ne p0, p1, :cond_1

    .line 458
    :cond_0
    :goto_0
    return v1

    .line 386
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 387
    goto :goto_0

    .line 389
    :cond_2
    instance-of v3, p1, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;

    if-nez v3, :cond_3

    move v1, v2

    .line 390
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 392
    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;

    .line 393
    .local v0, other:Lcom/android/bluetooth/pbap/ContactStruct$PostalData;
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 394
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 395
    goto :goto_0

    .line 397
    :cond_4
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 398
    goto :goto_0

    .line 400
    :cond_5
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->extendedAddress:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 401
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->extendedAddress:Ljava/lang/String;

    if-eqz v3, :cond_7

    move v1, v2

    .line 402
    goto :goto_0

    .line 404
    :cond_6
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->extendedAddress:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->extendedAddress:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    move v1, v2

    .line 405
    goto :goto_0

    .line 407
    :cond_7
    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->isPrimary:Z

    iget-boolean v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->isPrimary:Z

    if-eq v3, v4, :cond_8

    move v1, v2

    .line 408
    goto :goto_0

    .line 410
    :cond_8
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    if-nez v3, :cond_9

    .line 411
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    if-eqz v3, :cond_a

    move v1, v2

    .line 412
    goto :goto_0

    .line 414
    :cond_9
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    move v1, v2

    .line 415
    goto :goto_0

    .line 417
    :cond_a
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    if-nez v3, :cond_b

    .line 418
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    if-eqz v3, :cond_c

    move v1, v2

    .line 419
    goto :goto_0

    .line 421
    :cond_b
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    move v1, v2

    .line 422
    goto :goto_0

    .line 424
    :cond_c
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    move v1, v2

    .line 425
    goto :goto_0

    .line 427
    :cond_d
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    if-nez v3, :cond_e

    .line 428
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    if-eqz v3, :cond_f

    move v1, v2

    .line 429
    goto/16 :goto_0

    .line 431
    :cond_e
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    move v1, v2

    .line 432
    goto/16 :goto_0

    .line 434
    :cond_f
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    if-nez v3, :cond_10

    .line 435
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    if-eqz v3, :cond_11

    move v1, v2

    .line 436
    goto/16 :goto_0

    .line 438
    :cond_10
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    move v1, v2

    .line 439
    goto/16 :goto_0

    .line 441
    :cond_11
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    if-nez v3, :cond_12

    .line 442
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    if-eqz v3, :cond_13

    move v1, v2

    .line 443
    goto/16 :goto_0

    .line 445
    :cond_12
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    move v1, v2

    .line 446
    goto/16 :goto_0

    .line 448
    :cond_13
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    if-nez v3, :cond_14

    .line 449
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    if-eqz v3, :cond_15

    move v1, v2

    .line 450
    goto/16 :goto_0

    .line 452
    :cond_14
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    move v1, v2

    .line 453
    goto/16 :goto_0

    .line 455
    :cond_15
    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->type:I

    iget v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->type:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 456
    goto/16 :goto_0
.end method

.method public getFormattedAddress(I)Ljava/lang/String;
    .locals 6
    .parameter "vcardType"

    .prologue
    const/16 v5, 0x20

    .line 462
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 463
    .local v1, builder:Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    .line 464
    .local v2, empty:Z
    invoke-static {p1}, Lcom/android/bluetooth/pbap/VCardConfig;->isJapaneseDevice(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 466
    const/4 v3, 0x6

    .local v3, i:I
    :goto_0
    if-ltz v3, :cond_5

    .line 467
    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    aget-object v0, v4, v3

    .line 468
    .local v0, addressPart:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 469
    if-nez v2, :cond_0

    .line 470
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 472
    :cond_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    const/4 v2, 0x0

    .line 466
    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 477
    .end local v0           #addressPart:Ljava/lang/String;
    .end local v3           #i:I
    :cond_2
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_1
    const/4 v4, 0x7

    if-ge v3, v4, :cond_5

    .line 478
    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    aget-object v0, v4, v3

    .line 479
    .restart local v0       #addressPart:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 480
    if-nez v2, :cond_3

    .line 481
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 483
    :cond_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    const/4 v2, 0x0

    .line 477
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 489
    .end local v0           #addressPart:Ljava/lang/String;
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 365
    const/16 v0, 0x1f

    .line 366
    .local v0, prime:I
    const/4 v1, 0x1

    .line 367
    .local v1, result:I
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 368
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->extendedAddress:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v3

    :goto_1
    add-int v1, v4, v2

    .line 369
    mul-int/lit8 v4, v1, 0x1f

    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->isPrimary:Z

    if-eqz v2, :cond_2

    const/16 v2, 0x4cf

    :goto_2
    add-int v1, v4, v2

    .line 370
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    if-nez v2, :cond_3

    move v2, v3

    :goto_3
    add-int v1, v4, v2

    .line 371
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    if-nez v2, :cond_4

    move v2, v3

    :goto_4
    add-int v1, v4, v2

    .line 372
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->mDataArray:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v4

    add-int v1, v2, v4

    .line 373
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    if-nez v2, :cond_5

    move v2, v3

    :goto_5
    add-int v1, v4, v2

    .line 374
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    if-nez v2, :cond_6

    move v2, v3

    :goto_6
    add-int v1, v4, v2

    .line 375
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    if-nez v2, :cond_7

    move v2, v3

    :goto_7
    add-int v1, v4, v2

    .line 376
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    if-nez v4, :cond_8

    :goto_8
    add-int v1, v2, v3

    .line 377
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->type:I

    add-int v1, v2, v3

    .line 378
    return v1

    .line 367
    :cond_0
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->country:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 368
    :cond_1
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->extendedAddress:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_1

    .line 369
    :cond_2
    const/16 v2, 0x4d5

    goto :goto_2

    .line 370
    :cond_3
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_3

    .line 371
    :cond_4
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->localty:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_4

    .line 373
    :cond_5
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->pobox:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_5

    .line 374
    :cond_6
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->postalCode:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_6

    .line 375
    :cond_7
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->region:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_7

    .line 376
    :cond_8
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->street:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_8
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 494
    const-string v0, "type: %d, label: %s, isPrimary: %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->label:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PostalData;->isPrimary:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
