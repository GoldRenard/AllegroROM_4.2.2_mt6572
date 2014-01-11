.class Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$3;
.super Ljava/lang/Object;
.source "AdvanceSettingsEntrance.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;)V
    .locals 0
    .parameter

    .prologue
    .line 128
    iput-object p1, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$3;->this$0:Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 131
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$3;->this$0:Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->setResult(I)V

    .line 132
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$3;->this$0:Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;

    invoke-virtual {v0}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->finish()V

    .line 133
    return-void
.end method
