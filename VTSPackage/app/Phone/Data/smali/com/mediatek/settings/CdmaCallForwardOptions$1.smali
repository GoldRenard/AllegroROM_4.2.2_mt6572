.class Lcom/mediatek/settings/CdmaCallForwardOptions$1;
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


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CdmaCallForwardOptions;)V
    .locals 0
    .parameter

    .prologue
    .line 163
    iput-object p1, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$1;->this$0:Lcom/mediatek/settings/CdmaCallForwardOptions;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 166
    iget-object v0, p0, Lcom/mediatek/settings/CdmaCallForwardOptions$1;->this$0:Lcom/mediatek/settings/CdmaCallForwardOptions;

    #calls: Lcom/mediatek/settings/CdmaCallForwardOptions;->startContacts()V
    invoke-static {v0}, Lcom/mediatek/settings/CdmaCallForwardOptions;->access$000(Lcom/mediatek/settings/CdmaCallForwardOptions;)V

    .line 167
    return-void
.end method
