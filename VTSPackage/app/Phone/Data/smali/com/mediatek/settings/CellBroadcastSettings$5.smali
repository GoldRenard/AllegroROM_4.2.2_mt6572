.class Lcom/mediatek/settings/CellBroadcastSettings$5;
.super Ljava/lang/Object;
.source "CellBroadcastSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/settings/CellBroadcastSettings;->showLanguageSelectDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CellBroadcastSettings;

.field final synthetic val$temp:[Z

.field final synthetic val$temp2:[Z


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CellBroadcastSettings;[Z[Z)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 745
    iput-object p1, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->this$0:Lcom/mediatek/settings/CellBroadcastSettings;

    iput-object p2, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp:[Z

    iput-object p3, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp2:[Z

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 747
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp:[Z

    array-length v3, v4

    .line 749
    .local v3, tLength:I
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp:[Z

    const/4 v5, 0x0

    aget-boolean v4, v4, v5

    if-eqz v4, :cond_0

    .line 750
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 751
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp:[Z

    const/4 v5, 0x1

    aput-boolean v5, v4, v1

    .line 750
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 755
    .end local v1           #i:I
    :cond_0
    const/4 v0, 0x0

    .line 756
    .local v0, flag:Z
    const/4 v1, 0x0

    .restart local v1       #i:I
    :goto_1
    if-ge v1, v3, :cond_2

    .line 757
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->this$0:Lcom/mediatek/settings/CellBroadcastSettings;

    #getter for: Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/mediatek/settings/CellBroadcastSettings;->access$2400(Lcom/mediatek/settings/CellBroadcastSettings;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mediatek/settings/CellBroadcastLanguage;

    iget-object v5, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp:[Z

    aget-boolean v5, v5, v1

    invoke-virtual {v4, v5}, Lcom/mediatek/settings/CellBroadcastLanguage;->setLanguageState(Z)V

    .line 758
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp:[Z

    aget-boolean v4, v4, v1

    if-eqz v4, :cond_1

    .line 759
    const/4 v0, 0x1

    .line 756
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 763
    :cond_2
    if-eqz v0, :cond_4

    .line 764
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->this$0:Lcom/mediatek/settings/CellBroadcastSettings;

    #calls: Lcom/mediatek/settings/CellBroadcastSettings;->makeLanguageConfigArray()[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    invoke-static {v4}, Lcom/mediatek/settings/CellBroadcastSettings;->access$2500(Lcom/mediatek/settings/CellBroadcastSettings;)[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;

    move-result-object v2

    .line 765
    .local v2, langList:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->this$0:Lcom/mediatek/settings/CellBroadcastSettings;

    #calls: Lcom/mediatek/settings/CellBroadcastSettings;->setCellBroadcastConfig([Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V
    invoke-static {v4, v2}, Lcom/mediatek/settings/CellBroadcastSettings;->access$1100(Lcom/mediatek/settings/CellBroadcastSettings;[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;)V

    .line 772
    .end local v2           #langList:[Lcom/android/internal/telephony/gsm/SmsBroadcastConfigInfo;
    :cond_3
    return-void

    .line 767
    :cond_4
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->this$0:Lcom/mediatek/settings/CellBroadcastSettings;

    const v5, 0x7f0d00db

    #calls: Lcom/mediatek/settings/CellBroadcastSettings;->displayMessage(I)V
    invoke-static {v4, v5}, Lcom/mediatek/settings/CellBroadcastSettings;->access$1300(Lcom/mediatek/settings/CellBroadcastSettings;I)V

    .line 768
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v3, :cond_3

    .line 769
    iget-object v4, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->this$0:Lcom/mediatek/settings/CellBroadcastSettings;

    #getter for: Lcom/mediatek/settings/CellBroadcastSettings;->mLanguageList:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/mediatek/settings/CellBroadcastSettings;->access$2400(Lcom/mediatek/settings/CellBroadcastSettings;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mediatek/settings/CellBroadcastLanguage;

    iget-object v5, p0, Lcom/mediatek/settings/CellBroadcastSettings$5;->val$temp2:[Z

    aget-boolean v5, v5, v1

    invoke-virtual {v4, v5}, Lcom/mediatek/settings/CellBroadcastLanguage;->setLanguageState(Z)V

    .line 768
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method
