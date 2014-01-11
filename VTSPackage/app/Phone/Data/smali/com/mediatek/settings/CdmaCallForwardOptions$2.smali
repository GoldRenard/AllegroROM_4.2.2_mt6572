.class Lcom/mediatek/settings/CdmaCallForwardOptions$2;
.super Ljava/lang/Object;
.source "CdmaCallForwardOptions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/CdmaCallForwardOptions;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CdmaCallForwardOptions;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$id:I

.field final synthetic val$radioGroup:Landroid/widget/RadioGroup;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CdmaCallForwardOptions;Landroid/widget/RadioGroup;ILandroid/app/Dialog;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 173
    iput-object p1, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->this$0:Lcom/mediatek/settings/CdmaCallForwardOptions;

    iput-object p2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$radioGroup:Landroid/widget/RadioGroup;

    iput p3, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$id:I

    iput-object p4, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$dialog:Landroid/app/Dialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 176
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$radioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v2}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 189
    :goto_0
    return-void

    .line 180
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$radioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v2}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v2

    const v3, 0x1010002

    if-ne v2, v3, :cond_1

    .line 181
    iget v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$id:I

    mul-int/lit8 v1, v2, 0x2

    .line 182
    .local v1, cfType:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/mediatek/settings/CdmaCallForwardOptions;->access$100()[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->this$0:Lcom/mediatek/settings/CdmaCallForwardOptions;

    #getter for: Lcom/mediatek/settings/CdmaCallForwardOptions;->mEditNumber:Landroid/widget/EditText;
    invoke-static {v3}, Lcom/mediatek/settings/CdmaCallForwardOptions;->access$200(Lcom/mediatek/settings/CdmaCallForwardOptions;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, cf:Ljava/lang/String;
    :goto_1
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 188
    iget-object v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->this$0:Lcom/mediatek/settings/CdmaCallForwardOptions;

    #calls: Lcom/mediatek/settings/CdmaCallForwardOptions;->setCallForward(Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->access$300(Lcom/mediatek/settings/CdmaCallForwardOptions;Ljava/lang/String;)V

    goto :goto_0

    .line 184
    .end local v0           #cf:Ljava/lang/String;
    .end local v1           #cfType:I
    :cond_1
    iget v2, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$2;->val$id:I

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v1, v2, 0x1

    .line 185
    .restart local v1       #cfType:I
    invoke-static {}, Lcom/mediatek/settings/CdmaCallForwardOptions;->access$100()[Ljava/lang/String;

    move-result-object v2

    aget-object v0, v2, v1

    .restart local v0       #cf:Ljava/lang/String;
    goto :goto_1
.end method
