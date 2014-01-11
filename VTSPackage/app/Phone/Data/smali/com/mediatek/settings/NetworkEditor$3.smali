.class Lcom/mediatek/settings/NetworkEditor$3;
.super Ljava/lang/Object;
.source "NetworkEditor.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NetworkEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NetworkEditor;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NetworkEditor;)V
    .locals 0
    .parameter

    .prologue
    .line 125
    iput-object p1, p0, Lcom/mediatek/settings/NetworkEditor$3;->this$0:Lcom/mediatek/settings/NetworkEditor;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 128
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 129
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor$3;->this$0:Lcom/mediatek/settings/NetworkEditor;

    iget-object v2, p0, Lcom/mediatek/settings/NetworkEditor$3;->this$0:Lcom/mediatek/settings/NetworkEditor;

    #getter for: Lcom/mediatek/settings/NetworkEditor;->mNetworkIdText:Landroid/widget/EditText;
    invoke-static {v2}, Lcom/mediatek/settings/NetworkEditor;->access$400(Lcom/mediatek/settings/NetworkEditor;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/settings/NetworkEditor;->checkNull(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/mediatek/settings/NetworkEditor;->access$500(Lcom/mediatek/settings/NetworkEditor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, summary:Ljava/lang/String;
    const-string v1, "NetworkEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "input network id is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    iget-object v1, p0, Lcom/mediatek/settings/NetworkEditor$3;->this$0:Lcom/mediatek/settings/NetworkEditor;

    #getter for: Lcom/mediatek/settings/NetworkEditor;->mNetworkId:Landroid/preference/Preference;
    invoke-static {v1}, Lcom/mediatek/settings/NetworkEditor;->access$600(Lcom/mediatek/settings/NetworkEditor;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 133
    .end local v0           #summary:Ljava/lang/String;
    :cond_0
    return-void
.end method
