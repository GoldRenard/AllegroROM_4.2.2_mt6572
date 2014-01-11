.class Lcom/mediatek/oobe/utils/ButtonPreference$1;
.super Ljava/lang/Object;
.source "ButtonPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/utils/ButtonPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/utils/ButtonPreference;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/utils/ButtonPreference;)V
    .locals 0
    .parameter

    .prologue
    .line 61
    iput-object p1, p0, Lcom/mediatek/oobe/utils/ButtonPreference$1;->this$0:Lcom/mediatek/oobe/utils/ButtonPreference;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference$1;->this$0:Lcom/mediatek/oobe/utils/ButtonPreference;

    #getter for: Lcom/mediatek/oobe/utils/ButtonPreference;->mAddNetworkButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/mediatek/oobe/utils/ButtonPreference;->access$000(Lcom/mediatek/oobe/utils/ButtonPreference;)Landroid/widget/Button;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference$1;->this$0:Lcom/mediatek/oobe/utils/ButtonPreference;

    #getter for: Lcom/mediatek/oobe/utils/ButtonPreference;->mPrefButtonClickedListener:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;
    invoke-static {v0}, Lcom/mediatek/oobe/utils/ButtonPreference;->access$100(Lcom/mediatek/oobe/utils/ButtonPreference;)Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/mediatek/oobe/utils/ButtonPreference$1;->this$0:Lcom/mediatek/oobe/utils/ButtonPreference;

    #getter for: Lcom/mediatek/oobe/utils/ButtonPreference;->mPrefButtonClickedListener:Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;
    invoke-static {v0}, Lcom/mediatek/oobe/utils/ButtonPreference;->access$100(Lcom/mediatek/oobe/utils/ButtonPreference;)Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/mediatek/oobe/utils/ButtonPreference$PrefButtonClickedListener;->onPreButtonClicked()V

    .line 69
    :cond_0
    return-void
.end method
