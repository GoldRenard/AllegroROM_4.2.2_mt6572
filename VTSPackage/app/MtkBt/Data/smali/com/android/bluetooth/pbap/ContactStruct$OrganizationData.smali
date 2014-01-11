.class public Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;
.super Ljava/lang/Object;
.source "ContactStruct.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/ContactStruct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OrganizationData"
.end annotation


# instance fields
.field public final companyName:Ljava/lang/String;

.field public isPrimary:Z

.field public positionName:Ljava/lang/String;

.field public final type:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .parameter "dataType"
    .parameter "companyNameOfOrganization"
    .parameter "positionNameOfOrganization"
    .parameter "isDataPrimary"

    .prologue
    .line 515
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 516
    iput p1, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->type:I

    .line 517
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    .line 518
    iput-object p3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    .line 519
    iput-boolean p4, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->isPrimary:Z

    .line 520
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 545
    if-ne p0, p1, :cond_1

    .line 575
    :cond_0
    :goto_0
    return v1

    .line 548
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 549
    goto :goto_0

    .line 551
    :cond_2
    instance-of v3, p1, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;

    if-nez v3, :cond_3

    move v1, v2

    .line 552
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 554
    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;

    .line 555
    .local v0, other:Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 556
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 557
    goto :goto_0

    .line 559
    :cond_4
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 560
    goto :goto_0

    .line 562
    :cond_5
    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->isPrimary:Z

    iget-boolean v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->isPrimary:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 563
    goto :goto_0

    .line 565
    :cond_6
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    if-nez v3, :cond_7

    .line 566
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    if-eqz v3, :cond_8

    move v1, v2

    .line 567
    goto :goto_0

    .line 569
    :cond_7
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    move v1, v2

    .line 570
    goto :goto_0

    .line 572
    :cond_8
    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->type:I

    iget v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->type:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 573
    goto :goto_0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 534
    const/16 v0, 0x1f

    .line 535
    .local v0, prime:I
    const/4 v1, 0x1

    .line 536
    .local v1, result:I
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 537
    mul-int/lit8 v4, v1, 0x1f

    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->isPrimary:Z

    if-eqz v2, :cond_1

    const/16 v2, 0x4cf

    :goto_1
    add-int v1, v4, v2

    .line 538
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    if-nez v4, :cond_2

    :goto_2
    add-int v1, v2, v3

    .line 539
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->type:I

    add-int v1, v2, v3

    .line 540
    return v1

    .line 536
    :cond_0
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 537
    :cond_1
    const/16 v2, 0x4d5

    goto :goto_1

    .line 538
    :cond_2
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 580
    const-string v0, "type: %d, company: %s, position: %s, isPrimary: %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->companyName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->positionName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$OrganizationData;->isPrimary:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
