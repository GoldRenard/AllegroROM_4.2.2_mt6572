.class Lcom/mediatek/settings/CdmaCallWaitingOptions$1;
.super Ljava/lang/Object;
.source "CdmaCallWaitingOptions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/CdmaCallWaitingOptions;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CdmaCallWaitingOptions;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$id:I

.field final synthetic val$radioGroup:Landroid/widget/RadioGroup;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CdmaCallWaitingOptions;Landroid/widget/RadioGroup;Landroid/app/Dialog;I)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 120
    iput-object p1, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->this$0:Lcom/mediatek/settings/CdmaCallWaitingOptions;

    iput-object p2, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$radioGroup:Landroid/widget/RadioGroup;

    iput-object p3, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$dialog:Landroid/app/Dialog;

    iput p4, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$id:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 123
    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$radioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v3}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 124
    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->dismiss()V

    .line 132
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$radioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v3}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v3

    const v4, 0x1010002

    if-ne v3, v4, :cond_1

    const/4 v2, 0x0

    .line 128
    .local v2, radioSel:I
    :goto_1
    iget v3, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$id:I

    mul-int/lit8 v3, v3, 0x2

    add-int v1, v3, v2

    .line 129
    .local v1, cfType:I
    invoke-static {}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->access$000()[Ljava/lang/String;

    move-result-object v3

    aget-object v0, v3, v1

    .line 130
    .local v0, cf:Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->dismiss()V

    .line 131
    iget-object v3, p0, Lcom/mediatek/settings/CdmaCallWaitingOptions$1;->this$0:Lcom/mediatek/settings/CdmaCallWaitingOptions;

    #calls: Lcom/mediatek/settings/CdmaCallWaitingOptions;->setCallForward(Ljava/lang/String;)V
    invoke-static {v3, v0}, Lcom/mediatek/settings/CdmaCallWaitingOptions;->access$100(Lcom/mediatek/settings/CdmaCallWaitingOptions;Ljava/lang/String;)V

    goto :goto_0

    .line 127
    .end local v0           #cf:Ljava/lang/String;
    .end local v1           #cfType:I
    .end local v2           #radioSel:I
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method
