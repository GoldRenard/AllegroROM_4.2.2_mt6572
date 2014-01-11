.class Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$1;
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
    .line 115
    iput-object p1, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$1;->this$0:Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 118
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$1;->this$0:Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->mCurrentIndex:I
    invoke-static {v0, v1}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->access$002(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;I)I

    .line 119
    iget-object v0, p0, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance$1;->this$0:Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;

    const/4 v1, 0x1

    #calls: Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->goToNextSettings(Z)V
    invoke-static {v0, v1}, Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;->access$100(Lcom/mediatek/oobe/advanced/AdvanceSettingsEntrance;Z)V

    .line 120
    return-void
.end method
