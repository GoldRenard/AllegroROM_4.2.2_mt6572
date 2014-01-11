.class Lcom/mediatek/FMRadio/FMRadioEMActivity$1;
.super Ljava/lang/Object;
.source "FMRadioEMActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioEMActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 213
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 219
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 274
    const-string v5, "FmRx/EM"

    const-string v6, "invalid view id"

    invoke-static {v5, v6}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    :goto_0
    :sswitch_0
    return-void

    .line 221
    :sswitch_1
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v5, v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->switchAntenna(I)V

    goto :goto_0

    .line 224
    :sswitch_2
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v5, v7}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->switchAntenna(I)V

    goto :goto_0

    .line 230
    :sswitch_3
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v5, v7}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->setStereoMono(Z)V

    goto :goto_0

    .line 236
    :sswitch_4
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v5, v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->setStereoMono(Z)V

    goto :goto_0

    .line 239
    :sswitch_5
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 240
    .local v4, s:Ljava/lang/String;
    const/4 v2, 0x0

    .line 242
    .local v2, freq:F
    :try_start_0
    invoke-static {v4}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 250
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mButtonTune:Landroid/widget/Button;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 251
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v6

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->tuneToStation(I)V
    invoke-static {v5, v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1100(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)V

    goto :goto_0

    .line 243
    :catch_0
    move-exception v0

    .line 244
    .local v0, e:Ljava/lang/NumberFormatException;
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const-string v6, "bad float format."

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 245
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/EditText;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)I

    move-result v6

    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 258
    .end local v0           #e:Ljava/lang/NumberFormatException;
    .end local v2           #freq:F
    .end local v4           #s:Ljava/lang/String;
    :sswitch_6
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditText:Landroid/widget/EditText;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1200(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 259
    .local v1, fr:Ljava/lang/String;
    const/4 v3, 0x0

    .line 261
    .local v3, freq1:F
    :try_start_1
    invoke-static {v1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v3

    .line 270
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v6

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->tuneToStation(I)V
    invoke-static {v5, v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1100(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)V

    goto/16 :goto_0

    .line 262
    :catch_1
    move-exception v0

    .line 263
    .restart local v0       #e:Ljava/lang/NumberFormatException;
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const-string v6, "bad float format."

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 264
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/EditText;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$1;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I
    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)I

    move-result v6

    invoke-static {v6}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 219
    :sswitch_data_0
    .sparse-switch
        0x7f060010 -> :sswitch_0
        0x7f060011 -> :sswitch_6
        0x7f060024 -> :sswitch_5
        0x7f060027 -> :sswitch_1
        0x7f060028 -> :sswitch_2
        0x7f06002b -> :sswitch_3
        0x7f06002c -> :sswitch_4
    .end sparse-switch
.end method
