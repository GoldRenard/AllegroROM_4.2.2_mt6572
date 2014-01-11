.class Lcom/mediatek/settings/FdnSetting2$2;
.super Ljava/lang/Object;
.source "FdnSetting2.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/FdnSetting2;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mEndPos:I

.field mStartPos:I

.field mTempStr:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/mediatek/settings/FdnSetting2;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/FdnSetting2;)V
    .locals 0
    .parameter

    .prologue
    .line 462
    iput-object p1, p0, Lcom/mediatek/settings/FdnSetting2$2;->this$0:Lcom/mediatek/settings/FdnSetting2;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 467
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #getter for: Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;
    invoke-static {v0}, Lcom/mediatek/settings/FdnSetting2;->access$500(Lcom/mediatek/settings/FdnSetting2;)Lcom/android/phone/EditPinPreference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/EditPinPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->mStartPos:I

    .line 468
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #getter for: Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;
    invoke-static {v0}, Lcom/mediatek/settings/FdnSetting2;->access$500(Lcom/mediatek/settings/FdnSetting2;)Lcom/android/phone/EditPinPreference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/EditPinPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v0

    iput v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->mEndPos:I

    .line 469
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->mTempStr:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0x8

    if-le v0, v1, :cond_0

    .line 470
    iget v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->mStartPos:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Lcom/mediatek/settings/FdnSetting2$2;->mEndPos:I

    invoke-interface {p1, v0, v1}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 471
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #getter for: Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;
    invoke-static {v0}, Lcom/mediatek/settings/FdnSetting2;->access$500(Lcom/mediatek/settings/FdnSetting2;)Lcom/android/phone/EditPinPreference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/EditPinPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 472
    iget-object v0, p0, Lcom/mediatek/settings/FdnSetting2$2;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #getter for: Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;
    invoke-static {v0}, Lcom/mediatek/settings/FdnSetting2;->access$500(Lcom/mediatek/settings/FdnSetting2;)Lcom/android/phone/EditPinPreference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/EditPinPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 474
    :cond_0
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 477
    iput-object p1, p0, Lcom/mediatek/settings/FdnSetting2$2;->mTempStr:Ljava/lang/CharSequence;

    .line 478
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 481
    return-void
.end method
