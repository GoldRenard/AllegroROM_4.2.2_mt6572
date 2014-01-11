.class public Lcom/mediatek/settings/CallRejectListItem;
.super Ljava/lang/Object;
.source "CallRejectListItem.java"


# instance fields
.field private mId:Ljava/lang/String;

.field private mIsChecked:Z

.field private mName:Ljava/lang/String;

.field private mPhoneNum:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mName:Ljava/lang/String;

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mPhoneNum:Ljava/lang/String;

    .line 16
    const-string v0, ""

    iput-object v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mId:Ljava/lang/String;

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mIsChecked:Z

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .parameter "name"
    .parameter "phoneNum"
    .parameter "id"
    .parameter "isChecked"

    .prologue
    .line 20
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListItem;->mName:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lcom/mediatek/settings/CallRejectListItem;->mPhoneNum:Ljava/lang/String;

    .line 23
    iput-object p3, p0, Lcom/mediatek/settings/CallRejectListItem;->mId:Ljava/lang/String;

    .line 24
    iput-boolean p4, p0, Lcom/mediatek/settings/CallRejectListItem;->mIsChecked:Z

    .line 25
    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getIsChecked()Z
    .locals 1

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mIsChecked:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListItem;->mPhoneNum:Ljava/lang/String;

    return-object v0
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 31
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListItem;->mId:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setIsChecked(Z)V
    .locals 0
    .parameter "isChecked"

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/mediatek/settings/CallRejectListItem;->mIsChecked:Z

    .line 56
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListItem;->mName:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setPhoneNum(Ljava/lang/String;)V
    .locals 0
    .parameter "phoneNum"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListItem;->mPhoneNum:Ljava/lang/String;

    .line 48
    return-void
.end method
