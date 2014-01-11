.class Lcom/mediatek/FMRadio/FMRadioFavorite$1;
.super Ljava/lang/Object;
.source "FMRadioFavorite.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRadioFavorite;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioFavorite;)V
    .locals 0
    .parameter

    .prologue
    .line 136
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$1;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
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
    .line 146
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const v4, 0x7f060052

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 147
    .local v3, textView:Landroid/widget/TextView;
    const/4 v1, 0x0

    .line 149
    .local v1, frequency:F
    :try_start_0
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 153
    :goto_0
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 154
    .local v2, intentResult:Landroid/content/Intent;
    const-string v4, "ACTIVITY_RESULT"

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 155
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$1;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    const/4 v5, -0x1

    invoke-virtual {v4, v5, v2}, Lcom/mediatek/FMRadio/FMRadioFavorite;->setResult(ILandroid/content/Intent;)V

    .line 156
    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioFavorite$1;->this$0:Lcom/mediatek/FMRadio/FMRadioFavorite;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRadioFavorite;->finish()V

    .line 157
    return-void

    .line 150
    .end local v2           #intentResult:Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 151
    .local v0, e:Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method
