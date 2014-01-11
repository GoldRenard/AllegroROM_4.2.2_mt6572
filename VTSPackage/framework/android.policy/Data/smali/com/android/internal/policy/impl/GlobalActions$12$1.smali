.class Lcom/android/internal/policy/impl/GlobalActions$12$1;
.super Ljava/lang/Object;
.source "GlobalActions.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/GlobalActions$12;->onPress()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/internal/policy/impl/GlobalActions$12;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/GlobalActions$12;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/internal/policy/impl/GlobalActions$12$1;->this$1:Lcom/android/internal/policy/impl/GlobalActions$12;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 38
    iget-object v0, p0, Lcom/android/internal/policy/impl/GlobalActions$12$1;->this$1:Lcom/android/internal/policy/impl/GlobalActions$12;

    check-cast p1, Landroid/app/AlertDialog;

    .end local p1
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ListView;->getCheckedItemPosition()I

    move-result v1

    iput v1, v0, Lcom/android/internal/policy/impl/GlobalActions$12;->mSel:I

    .line 39
    return-void
.end method
