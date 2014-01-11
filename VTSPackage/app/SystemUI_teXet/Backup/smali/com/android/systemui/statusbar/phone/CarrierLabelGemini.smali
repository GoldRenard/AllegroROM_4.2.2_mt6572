.class public Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;
.super Landroid/widget/TextView;
.source "CarrierLabelGemini.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CarrierLabelGemini"


# instance fields
.field private mNetworkNameSeparator:Ljava/lang/String;

.field private mSlotId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .parameter "context"

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->mSlotId:I

    .line 44
    invoke-virtual {p0, v1, v2, v1, v2}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->updateNetworkName(ZLjava/lang/String;ZLjava/lang/String;)V

    .line 45
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0b005c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->mNetworkNameSeparator:Ljava/lang/String;

    .line 46
    return-void
.end method


# virtual methods
.method public getSlotId()I
    .registers 2

    .prologue
    .line 53
    iget v0, p0, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->mSlotId:I

    return v0
.end method

.method public setSlotId(I)V
    .registers 2
    .parameter "slotId"

    .prologue
    .line 49
    iput p1, p0, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->mSlotId:I

    .line 50
    return-void
.end method

.method updateNetworkName(ZLjava/lang/String;ZLjava/lang/String;)V
    .registers 10
    .parameter "showSpn"
    .parameter "spn"
    .parameter "showPlmn"
    .parameter "plmn"

    .prologue
    .line 57
    const-string v2, "CarrierLabelGemini"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateNetworkName, showSpn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " spn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " showPlmn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " plmn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .local v1, str:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 60
    .local v0, something:Z
    if-eqz p3, :cond_44

    if-eqz p4, :cond_44

    .line 61
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    const/4 v0, 0x1

    .line 64
    :cond_44
    if-eqz p1, :cond_53

    if-eqz p2, :cond_53

    .line 65
    if-eqz v0, :cond_4f

    .line 66
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->mNetworkNameSeparator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    :cond_4f
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    const/4 v0, 0x1

    .line 71
    :cond_53
    if-eqz v0, :cond_5d

    .line 72
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setText(Ljava/lang/CharSequence;)V

    .line 76
    :goto_5c
    return-void

    .line 74
    :cond_5d
    const v2, 0x10402e6

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/phone/CarrierLabelGemini;->setText(I)V

    goto :goto_5c
.end method
