.class public Lcom/android/bluetooth/pbap/ContactStruct$ImData;
.super Ljava/lang/Object;
.source "ContactStruct.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/ContactStruct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImData"
.end annotation


# instance fields
.field public final data:Ljava/lang/String;

.field public final isPrimary:Z

.field public final label:Ljava/lang/String;

.field public final type:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .parameter "dataType"
    .parameter "imDataData"
    .parameter "imDataLabel"
    .parameter "isDataPrimary"

    .prologue
    .line 596
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 597
    iput p1, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->type:I

    .line 598
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    .line 599
    iput-object p3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    .line 600
    iput-boolean p4, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->isPrimary:Z

    .line 601
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 626
    if-ne p0, p1, :cond_1

    .line 656
    :cond_0
    :goto_0
    return v1

    .line 629
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 630
    goto :goto_0

    .line 632
    :cond_2
    instance-of v3, p1, Lcom/android/bluetooth/pbap/ContactStruct$ImData;

    if-nez v3, :cond_3

    move v1, v2

    .line 633
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 635
    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;

    .line 636
    .local v0, other:Lcom/android/bluetooth/pbap/ContactStruct$ImData;
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 637
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 638
    goto :goto_0

    .line 640
    :cond_4
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 641
    goto :goto_0

    .line 643
    :cond_5
    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->isPrimary:Z

    iget-boolean v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->isPrimary:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 644
    goto :goto_0

    .line 646
    :cond_6
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    if-nez v3, :cond_7

    .line 647
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    if-eqz v3, :cond_8

    move v1, v2

    .line 648
    goto :goto_0

    .line 650
    :cond_7
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    move v1, v2

    .line 651
    goto :goto_0

    .line 653
    :cond_8
    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->type:I

    iget v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->type:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 654
    goto :goto_0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 615
    const/16 v0, 0x1f

    .line 616
    .local v0, prime:I
    const/4 v1, 0x1

    .line 617
    .local v1, result:I
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 618
    mul-int/lit8 v4, v1, 0x1f

    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->isPrimary:Z

    if-eqz v2, :cond_1

    const/16 v2, 0x4cf

    :goto_1
    add-int v1, v4, v2

    .line 619
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    if-nez v4, :cond_2

    :goto_2
    add-int v1, v2, v3

    .line 620
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->type:I

    add-int v1, v2, v3

    .line 621
    return v1

    .line 617
    :cond_0
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 618
    :cond_1
    const/16 v2, 0x4d5

    goto :goto_1

    .line 619
    :cond_2
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 661
    const-string v0, "type: %d, data: %s, label: %s, isPrimary: %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->data:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->label:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$ImData;->isPrimary:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
