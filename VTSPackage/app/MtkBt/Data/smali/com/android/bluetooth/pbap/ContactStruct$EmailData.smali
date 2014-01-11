.class public Lcom/android/bluetooth/pbap/ContactStruct$EmailData;
.super Ljava/lang/Object;
.source "ContactStruct.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/ContactStruct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EmailData"
.end annotation


# instance fields
.field public final data:Ljava/lang/String;

.field public isPrimary:Z

.field public final label:Ljava/lang/String;

.field public final type:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .parameter "emailDataType"
    .parameter "emailDataData"
    .parameter "emailDataLabel"
    .parameter "isEmailDataPrimary"

    .prologue
    .line 210
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput p1, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->type:I

    .line 212
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    .line 213
    iput-object p3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    .line 214
    iput-boolean p4, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->isPrimary:Z

    .line 215
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 240
    if-ne p0, p1, :cond_1

    .line 270
    :cond_0
    :goto_0
    return v1

    .line 243
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 244
    goto :goto_0

    .line 246
    :cond_2
    instance-of v3, p1, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;

    if-nez v3, :cond_3

    move v1, v2

    .line 247
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 249
    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;

    .line 250
    .local v0, other:Lcom/android/bluetooth/pbap/ContactStruct$EmailData;
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 251
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 252
    goto :goto_0

    .line 254
    :cond_4
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 255
    goto :goto_0

    .line 257
    :cond_5
    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->isPrimary:Z

    iget-boolean v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->isPrimary:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 258
    goto :goto_0

    .line 260
    :cond_6
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    if-nez v3, :cond_7

    .line 261
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    if-eqz v3, :cond_8

    move v1, v2

    .line 262
    goto :goto_0

    .line 264
    :cond_7
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    move v1, v2

    .line 265
    goto :goto_0

    .line 267
    :cond_8
    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->type:I

    iget v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->type:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 268
    goto :goto_0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 229
    const/16 v0, 0x1f

    .line 230
    .local v0, prime:I
    const/4 v1, 0x1

    .line 231
    .local v1, result:I
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 232
    mul-int/lit8 v4, v1, 0x1f

    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->isPrimary:Z

    if-eqz v2, :cond_1

    const/16 v2, 0x4cf

    :goto_1
    add-int v1, v4, v2

    .line 233
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    if-nez v4, :cond_2

    :goto_2
    add-int v1, v2, v3

    .line 234
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->type:I

    add-int v1, v2, v3

    .line 235
    return v1

    .line 231
    :cond_0
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 232
    :cond_1
    const/16 v2, 0x4d5

    goto :goto_1

    .line 233
    :cond_2
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 275
    const-string v0, "type: %d, data: %s, label: %s, isPrimary: %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->data:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->label:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$EmailData;->isPrimary:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
