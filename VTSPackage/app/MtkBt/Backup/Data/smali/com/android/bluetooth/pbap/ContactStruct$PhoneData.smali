.class public Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;
.super Ljava/lang/Object;
.source "ContactStruct.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/bluetooth/pbap/ContactStruct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PhoneData"
.end annotation


# instance fields
.field public final data:Ljava/lang/String;

.field public isPrimary:Z

.field public final label:Ljava/lang/String;

.field public final type:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .parameter "phoneDataType"
    .parameter "phoneDataData"
    .parameter "phoneDataLabel"
    .parameter "isPhoneDataPrimary"

    .prologue
    .line 124
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 125
    iput p1, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->type:I

    .line 126
    iput-object p2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    .line 127
    iput-object p3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    .line 128
    iput-boolean p4, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->isPrimary:Z

    .line 129
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 154
    if-ne p0, p1, :cond_1

    .line 184
    :cond_0
    :goto_0
    return v1

    .line 157
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 158
    goto :goto_0

    .line 160
    :cond_2
    instance-of v3, p1, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;

    if-nez v3, :cond_3

    move v1, v2

    .line 161
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 163
    check-cast v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;

    .line 164
    .local v0, other:Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 165
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 166
    goto :goto_0

    .line 168
    :cond_4
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 169
    goto :goto_0

    .line 171
    :cond_5
    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->isPrimary:Z

    iget-boolean v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->isPrimary:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 172
    goto :goto_0

    .line 174
    :cond_6
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    if-nez v3, :cond_7

    .line 175
    iget-object v3, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    if-eqz v3, :cond_8

    move v1, v2

    .line 176
    goto :goto_0

    .line 178
    :cond_7
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    move v1, v2

    .line 179
    goto :goto_0

    .line 181
    :cond_8
    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->type:I

    iget v4, v0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->type:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 182
    goto :goto_0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 143
    const/16 v0, 0x1f

    .line 144
    .local v0, prime:I
    const/4 v1, 0x1

    .line 145
    .local v1, result:I
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 146
    mul-int/lit8 v4, v1, 0x1f

    iget-boolean v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->isPrimary:Z

    if-eqz v2, :cond_1

    const/16 v2, 0x4cf

    :goto_1
    add-int v1, v4, v2

    .line 147
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    if-nez v4, :cond_2

    :goto_2
    add-int v1, v2, v3

    .line 148
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->type:I

    add-int v1, v2, v3

    .line 149
    return v1

    .line 145
    :cond_0
    iget-object v2, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 146
    :cond_1
    const/16 v2, 0x4d5

    goto :goto_1

    .line 147
    :cond_2
    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 189
    const-string v0, "type: %d, data: %s, label: %s, isPrimary: %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->type:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->data:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->label:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-boolean v3, p0, Lcom/android/bluetooth/pbap/ContactStruct$PhoneData;->isPrimary:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
