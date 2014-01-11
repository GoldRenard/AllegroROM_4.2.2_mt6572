.class public Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;
.super Ljava/lang/Object;
.source "BluetoothPbapPath.java"


# static fields
.field private static final DEBUG:Z = true

.field public static final FOLDER_TYPE_CCH:I = 0x4

.field public static final FOLDER_TYPE_ICH:I = 0x1

.field public static final FOLDER_TYPE_MCH:I = 0x3

.field public static final FOLDER_TYPE_OCH:I = 0x2

.field public static final FOLDER_TYPE_PB:I = 0x0

.field public static final FOLDER_TYPE_SIM1_CCH:I = 0x9

.field public static final FOLDER_TYPE_SIM1_ICH:I = 0x6

.field public static final FOLDER_TYPE_SIM1_MCH:I = 0x8

.field public static final FOLDER_TYPE_SIM1_OCH:I = 0x7

.field public static final FOLDER_TYPE_SIM1_PB:I = 0x5

.field public static final FOLDER_TYPE_UNKNOWN:I = -0x1

.field public static final PBAP_PATH_BACKWARD:I = 0x1

.field public static final PBAP_PATH_FORWARD:I = 0x0

.field public static final PBAP_PATH_TO_ROOT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "BluetoothPbapPath"

.field public static final VALID_PATH:[Ljava/lang/String;


# instance fields
.field private mCurrentPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 78
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "telecom/pb"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "telecom/ich"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "telecom/och"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "telecom/mch"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "telecom/cch"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "SIM1/telecom/pb"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->VALID_PATH:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 87
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 88
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    .line 89
    return-void
.end method

.method private errorLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 201
    const-string v0, "BluetoothPbapPath"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    return-void
.end method

.method private formatPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 166
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    const/4 v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 169
    :cond_0
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 170
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 172
    :cond_1
    return-object p1
.end method

.method private isValidPath(Ljava/lang/String;)Z
    .locals 7
    .parameter "path"

    .prologue
    const/4 v4, 0x0

    .line 177
    sget-object v5, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->VALID_PATH:[Ljava/lang/String;

    array-length v2, v5

    .line 178
    .local v2, size:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 179
    .local v1, length:I
    const/4 v3, 0x0

    .line 181
    .local v3, vp:Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->formatPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 182
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_2

    .line 183
    sget-object v5, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->VALID_PATH:[Ljava/lang/String;

    aget-object v3, v5, v0

    .line 184
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v1, v5, :cond_1

    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-eq v5, v1, :cond_0

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2f

    if-ne v5, v6, :cond_1

    .line 186
    :cond_0
    const/4 v4, 0x1

    .line 190
    :goto_1
    return v4

    .line 182
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 189
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[ERR] invalid path : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->errorLog(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private printLog(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 196
    const-string v0, "BluetoothPbapPath"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    return-void
.end method


# virtual methods
.method public getCurrentPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPathType(Ljava/lang/String;Z)I
    .locals 4
    .parameter "path"
    .parameter "relative"

    .prologue
    .line 102
    sget-object v2, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->VALID_PATH:[Ljava/lang/String;

    array-length v1, v2

    .line 105
    .local v1, size:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getPathType("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->printLog(Ljava/lang/String;)V

    .line 106
    if-eqz p1, :cond_0

    .line 107
    invoke-direct {p0, p1}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->formatPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 109
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "path formatted="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->printLog(Ljava/lang/String;)V

    .line 110
    if-eqz p2, :cond_1

    .line 111
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 112
    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 119
    :cond_1
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "absolute path is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->printLog(Ljava/lang/String;)V

    .line 120
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_4

    .line 121
    sget-object v2, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->VALID_PATH:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 125
    .end local v0           #i:I
    :goto_2
    return v0

    .line 116
    :cond_2
    iget-object p1, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    goto :goto_0

    .line 120
    .restart local v0       #i:I
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 125
    :cond_4
    const/4 v0, -0x1

    goto :goto_2
.end method

.method public setPath(ILjava/lang/String;)Z
    .locals 6
    .parameter "op"
    .parameter "path"

    .prologue
    .line 129
    const/4 v1, 0x1

    .line 131
    .local v1, ret:Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[API] setPath("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->printLog(Ljava/lang/String;)V

    .line 132
    packed-switch p1, :pswitch_data_0

    .line 158
    const-string v2, "Unknown set path operation"

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->errorLog(Ljava/lang/String;)V

    .line 161
    :goto_0
    return v1

    .line 134
    :pswitch_0
    const-string v2, ""

    iput-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    goto :goto_0

    .line 137
    :pswitch_1
    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 138
    .local v0, idx:I
    if-gtz v0, :cond_0

    .line 140
    const-string v2, ""

    iput-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    goto :goto_0

    .line 142
    :cond_0
    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    goto :goto_0

    .line 146
    .end local v0           #idx:I
    :pswitch_2
    invoke-direct {p0, p2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->formatPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 147
    iget-object v2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 148
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 150
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PBAP_PATH_FORWARD : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->printLog(Ljava/lang/String;)V

    .line 151
    invoke-direct {p0, p2}, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->isValidPath(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 152
    iput-object p2, p0, Lcom/mediatek/bluetooth/pbap/BluetoothPbapPath;->mCurrentPath:Ljava/lang/String;

    goto :goto_0

    .line 154
    :cond_2
    const/4 v1, 0x0

    .line 156
    goto :goto_0

    .line 132
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
