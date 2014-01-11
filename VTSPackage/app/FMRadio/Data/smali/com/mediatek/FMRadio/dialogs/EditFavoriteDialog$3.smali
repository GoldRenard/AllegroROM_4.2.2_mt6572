.class Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;
.super Ljava/lang/Object;
.source "EditFavoriteDialog.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 182
    iput-object p1, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;->this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 230
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 222
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 11
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    const/4 v10, 0x0

    .line 185
    iget-object v8, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;->this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    invoke-virtual {v8}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v8

    if-nez v8, :cond_1

    .line 215
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    iget-object v8, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;->this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    #getter for: Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->mEditTextFrequency:Landroid/widget/EditText;
    invoke-static {v8}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->access$100(Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;)Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    .line 189
    .local v3, cs:Ljava/lang/CharSequence;
    const/4 v5, 0x0

    .line 191
    .local v5, frequency:F
    :try_start_0
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 196
    :goto_1
    const/16 v2, 0x64

    .line 197
    .local v2, convertData:I
    const/high16 v8, 0x42c8

    mul-float/2addr v8, v5

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 198
    .local v7, station:I
    iget-object v8, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;->this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    invoke-virtual {v8}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v8

    check-cast v8, Landroid/app/AlertDialog;

    const/4 v9, -0x1

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v6

    .line 200
    .local v6, positiveButton:Landroid/widget/Button;
    const/4 v0, 0x5

    .line 202
    .local v0, checkNumber:I
    rem-int/lit8 v8, v7, 0x5

    if-nez v8, :cond_2

    .line 203
    if-eqz v6, :cond_0

    .line 204
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 192
    .end local v0           #checkNumber:I
    .end local v2           #convertData:I
    .end local v6           #positiveButton:Landroid/widget/Button;
    .end local v7           #station:I
    :catch_0
    move-exception v4

    .line 193
    .local v4, e:Ljava/lang/NumberFormatException;
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_1

    .line 208
    .end local v4           #e:Ljava/lang/NumberFormatException;
    .restart local v0       #checkNumber:I
    .restart local v2       #convertData:I
    .restart local v6       #positiveButton:Landroid/widget/Button;
    .restart local v7       #station:I
    :cond_2
    if-eqz v6, :cond_3

    .line 209
    invoke-virtual {v6, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 211
    :cond_3
    iget-object v8, p0, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog$3;->this$0:Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;

    invoke-virtual {v8}, Lcom/mediatek/FMRadio/dialogs/EditFavoriteDialog;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 212
    .local v1, context:Landroid/content/Context;
    const v8, 0x7f040025

    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
