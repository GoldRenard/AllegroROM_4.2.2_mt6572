.class Lcom/mediatek/FMRadio/FMRecordDialogFragment$1;
.super Ljava/lang/Object;
.source "FMRecordDialogFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRecordDialogFragment;->setTextChangedCallback()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 236
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$1;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 240
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 244
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    const/4 v2, 0x1

    .line 251
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$1;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #setter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mIsNeedCheckFilenameExist:Z
    invoke-static {v1, v2}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$002(Lcom/mediatek/FMRadio/FMRecordDialogFragment;Z)Z

    .line 252
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, recordName:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".*[/\\\\:*?\"<>|].*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 257
    :cond_0
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$1;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$100(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Landroid/widget/Button;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 261
    :goto_0
    return-void

    .line 259
    :cond_1
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRecordDialogFragment$1;->this$0:Lcom/mediatek/FMRadio/FMRecordDialogFragment;

    #getter for: Lcom/mediatek/FMRadio/FMRecordDialogFragment;->mButtonSave:Landroid/widget/Button;
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRecordDialogFragment;->access$100(Lcom/mediatek/FMRadio/FMRecordDialogFragment;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0
.end method
