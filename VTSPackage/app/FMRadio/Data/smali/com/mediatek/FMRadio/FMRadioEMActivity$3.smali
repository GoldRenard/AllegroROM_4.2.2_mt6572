.class Lcom/mediatek/FMRadio/FMRadioEMActivity$3;
.super Ljava/lang/Object;
.source "FMRadioEMActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRadioEMActivity;->AdapterFmStation()V
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
    .line 418
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter "arg1"
    .parameter "arg2"
    .parameter "arg3"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 420
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v1, 0x0

    .line 422
    .local v1, freq:F
    :try_start_0
    invoke-static {}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1600()[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, p3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 423
    const-string v2, "FmRx/EM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "freq="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 429
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v3

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->tuneToStation(I)V
    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1100(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)V

    .line 430
    :goto_0
    return-void

    .line 424
    :catch_0
    move-exception v0

    .line 425
    .local v0, e:Ljava/lang/NumberFormatException;
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const-string v3, "bad float format."

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 426
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mEditFreq:Landroid/widget/EditText;
    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)I

    move-result v3

    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioUtils;->formatStation(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
