.class Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OOBEStepActivityInfo"
.end annotation


# instance fields
.field private mActionName:Ljava/lang/String;

.field private mActivityId:I

.field private mActivityInfo:Ljava/lang/String;

.field private mIntent:Landroid/content/Intent;

.field final synthetic this$0:Lcom/mediatek/oobe/basic/MainActivity;


# direct methods
.method public constructor <init>(Lcom/mediatek/oobe/basic/MainActivity;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "infoString"

    .prologue
    .line 613
    iput-object p1, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 609
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActivityId:I

    .line 614
    iput-object p2, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActivityInfo:Ljava/lang/String;

    .line 615
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mIntent:Landroid/content/Intent;

    .line 616
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActivityInfo:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->parseActivityInfo(Ljava/lang/String;)V

    .line 617
    return-void
.end method


# virtual methods
.method public getActionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 650
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActionName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 646
    iget v0, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActivityId:I

    return v0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 642
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public parseActivityInfo(Ljava/lang/String;)V
    .locals 4
    .parameter "paramString"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 623
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 624
    .local v0, arrayOfString:[Ljava/lang/String;
    aget-object v1, v0, v2

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 625
    aget-object v1, v0, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActivityId:I

    .line 627
    :cond_0
    aget-object v1, v0, v3

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 628
    aget-object v1, v0, v3

    iput-object v1, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActionName:Ljava/lang/String;

    .line 633
    :cond_1
    iget-object v1, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mIntent:Landroid/content/Intent;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 634
    return-void
.end method

.method public startStepActivity()V
    .locals 3

    .prologue
    .line 637
    const-string v0, "OOBE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OOBEStepActivityInfo.execute(), mActivityId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActivityId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 638
    iget-object v0, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->this$0:Lcom/mediatek/oobe/basic/MainActivity;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mIntent:Landroid/content/Intent;

    iget v2, p0, Lcom/mediatek/oobe/basic/MainActivity$OOBEStepActivityInfo;->mActivityId:I

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/oobe/basic/MainActivity;->startNextActivity(Landroid/content/Intent;I)V

    .line 639
    return-void
.end method
