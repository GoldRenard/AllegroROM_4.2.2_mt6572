.class public Lcom/mediatek/bluetooth/opp/adp/OppEvent;
.super Ljava/lang/Object;
.source "OppEvent.java"


# static fields
.field public static final BT_OPPC_CONNECTED:I = 0x5

.field public static final BT_OPPC_DISABLE_FAIL:I = 0x4

.field public static final BT_OPPC_DISABLE_SUCCESS:I = 0x3

.field public static final BT_OPPC_DISCONNECT:I = 0x10

.field public static final BT_OPPC_ENABLE_FAIL:I = 0x2

.field public static final BT_OPPC_ENABLE_SUCCESS:I = 0x1

.field public static final BT_OPPC_EXCH_FAIL:I = 0xf

.field public static final BT_OPPC_EXCH_START:I = 0xd

.field public static final BT_OPPC_EXCH_SUCCESS:I = 0xe

.field public static final BT_OPPC_GROUP_END:I = 0x1e

.field public static final BT_OPPC_GROUP_START:I = 0x0

.field public static final BT_OPPC_PROGRESS_UPDATE:I = 0x6

.field public static final BT_OPPC_PULL_FAIL:I = 0xc

.field public static final BT_OPPC_PULL_START:I = 0xa

.field public static final BT_OPPC_PULL_SUCCESS:I = 0xb

.field public static final BT_OPPC_PUSH_FAIL:I = 0x9

.field public static final BT_OPPC_PUSH_START:I = 0x7

.field public static final BT_OPPC_PUSH_SUCCESS:I = 0x8

.field public static final BT_OPPS_DISABLE_FAIL:I = 0x68

.field public static final BT_OPPS_DISABLE_SUCCESS:I = 0x67

.field public static final BT_OPPS_DISCONNECT:I = 0x70

.field public static final BT_OPPS_ENABLE_FAIL:I = 0x66

.field public static final BT_OPPS_ENABLE_SUCCESS:I = 0x65

.field public static final BT_OPPS_GROUP_END:I = 0x82

.field public static final BT_OPPS_GROUP_START:I = 0x64

.field public static final BT_OPPS_PROGRESS_UPDATE:I = 0x69

.field public static final BT_OPPS_PULL_ACCESS_REQUEST:I = 0x72

.field public static final BT_OPPS_PULL_FAIL:I = 0x6f

.field public static final BT_OPPS_PULL_START:I = 0x6d

.field public static final BT_OPPS_PULL_SUCCESS:I = 0x6e

.field public static final BT_OPPS_PUSH_ACCESS_REQUEST:I = 0x71

.field public static final BT_OPPS_PUSH_FAIL:I = 0x6c

.field public static final BT_OPPS_PUSH_START:I = 0x6a

.field public static final BT_OPPS_PUSH_SUCCESS:I = 0x6b


# instance fields
.field public event:I

.field public parameters:[Ljava/lang/String;


# direct methods
.method public constructor <init>(I[Ljava/lang/String;)V
    .locals 0
    .parameter "eventData"
    .parameter "parametersData"

    .prologue
    .line 198
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 200
    iput p1, p0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    .line 201
    iput-object p2, p0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .line 202
    return-void
.end method

.method public static getEventName(I)Ljava/lang/String;
    .locals 2
    .parameter "event"

    .prologue
    .line 128
    sparse-switch p0, :sswitch_data_0

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknow event: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 130
    :sswitch_0
    const-string v0, "BT_OPPC_ENABLE_SUCCESS"

    goto :goto_0

    .line 132
    :sswitch_1
    const-string v0, "BT_OPPC_ENABLE_FAIL"

    goto :goto_0

    .line 134
    :sswitch_2
    const-string v0, "BT_OPPC_DISABLE_SUCCESS"

    goto :goto_0

    .line 136
    :sswitch_3
    const-string v0, "BT_OPPC_DISABLE_FAIL"

    goto :goto_0

    .line 138
    :sswitch_4
    const-string v0, "BT_OPPC_PROGRESS_UPDATE"

    goto :goto_0

    .line 140
    :sswitch_5
    const-string v0, "BT_OPPC_PUSH_START"

    goto :goto_0

    .line 142
    :sswitch_6
    const-string v0, "BT_OPPC_PUSH_SUCCESS"

    goto :goto_0

    .line 144
    :sswitch_7
    const-string v0, "BT_OPPC_PUSH_FAIL"

    goto :goto_0

    .line 146
    :sswitch_8
    const-string v0, "BT_OPPC_PULL_START"

    goto :goto_0

    .line 148
    :sswitch_9
    const-string v0, "BT_OPPC_PULL_SUCCESS"

    goto :goto_0

    .line 150
    :sswitch_a
    const-string v0, "BT_OPPC_PULL_FAIL"

    goto :goto_0

    .line 152
    :sswitch_b
    const-string v0, "BT_OPPC_EXCH_START"

    goto :goto_0

    .line 154
    :sswitch_c
    const-string v0, "BT_OPPC_EXCH_SUCCESS"

    goto :goto_0

    .line 156
    :sswitch_d
    const-string v0, "BT_OPPC_EXCH_FAIL"

    goto :goto_0

    .line 158
    :sswitch_e
    const-string v0, "BT_OPPC_DISCONNECT"

    goto :goto_0

    .line 160
    :sswitch_f
    const-string v0, "BT_OPPS_ENABLE_SUCCESS"

    goto :goto_0

    .line 162
    :sswitch_10
    const-string v0, "BT_OPPS_ENABLE_FAIL"

    goto :goto_0

    .line 164
    :sswitch_11
    const-string v0, "BT_OPPS_DISABLE_SUCCESS"

    goto :goto_0

    .line 166
    :sswitch_12
    const-string v0, "BT_OPPS_DISABLE_FAIL"

    goto :goto_0

    .line 168
    :sswitch_13
    const-string v0, "BT_OPPS_PROGRESS_UPDATE"

    goto :goto_0

    .line 170
    :sswitch_14
    const-string v0, "BT_OPPS_PUSH_START"

    goto :goto_0

    .line 172
    :sswitch_15
    const-string v0, "BT_OPPS_PUSH_SUCCESS"

    goto :goto_0

    .line 174
    :sswitch_16
    const-string v0, "BT_OPPS_PUSH_FAIL"

    goto :goto_0

    .line 176
    :sswitch_17
    const-string v0, "BT_OPPS_PULL_START"

    goto :goto_0

    .line 178
    :sswitch_18
    const-string v0, "BT_OPPS_PULL_SUCCESS"

    goto :goto_0

    .line 180
    :sswitch_19
    const-string v0, "BT_OPPS_PULL_FAIL"

    goto :goto_0

    .line 182
    :sswitch_1a
    const-string v0, "BT_OPPS_DISCONNECT"

    goto :goto_0

    .line 184
    :sswitch_1b
    const-string v0, "BT_OPPS_PUSH_ACCESS_REQUEST"

    goto :goto_0

    .line 186
    :sswitch_1c
    const-string v0, "BT_OPPS_PULL_ACCESS_REQUEST"

    goto :goto_0

    .line 128
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0x6 -> :sswitch_4
        0x7 -> :sswitch_5
        0x8 -> :sswitch_6
        0x9 -> :sswitch_7
        0xa -> :sswitch_8
        0xb -> :sswitch_9
        0xc -> :sswitch_a
        0xd -> :sswitch_b
        0xe -> :sswitch_c
        0xf -> :sswitch_d
        0x10 -> :sswitch_e
        0x65 -> :sswitch_f
        0x66 -> :sswitch_10
        0x67 -> :sswitch_11
        0x68 -> :sswitch_12
        0x69 -> :sswitch_13
        0x6a -> :sswitch_14
        0x6b -> :sswitch_15
        0x6c -> :sswitch_16
        0x6d -> :sswitch_17
        0x6e -> :sswitch_18
        0x6f -> :sswitch_19
        0x70 -> :sswitch_1a
        0x71 -> :sswitch_1b
        0x72 -> :sswitch_1c
    .end sparse-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 222
    if-ne p0, p1, :cond_1

    .line 235
    :cond_0
    :goto_0
    return v1

    .line 225
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 226
    goto :goto_0

    .line 228
    :cond_2
    instance-of v3, p1, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    if-nez v3, :cond_3

    move v1, v2

    .line 229
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 231
    check-cast v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;

    .line 232
    .local v0, other:Lcom/mediatek/bluetooth/opp/adp/OppEvent;
    iget v3, p0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    iget v4, v0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 233
    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 214
    const/16 v0, 0x1f

    .line 215
    .local v0, prime:I
    const/4 v1, 0x1

    .line 216
    .local v1, result:I
    iget v2, p0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    add-int/lit8 v1, v2, 0x1f

    .line 217
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 241
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->event:I

    invoke-static {v6}, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->getEventName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 242
    .local v4, res:Ljava/lang/StringBuilder;
    iget-object v5, p0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 244
    iget-object v0, p0, Lcom/mediatek/bluetooth/opp/adp/OppEvent;->parameters:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 246
    .local v3, p:Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 249
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #p:Ljava/lang/String;
    :cond_0
    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
