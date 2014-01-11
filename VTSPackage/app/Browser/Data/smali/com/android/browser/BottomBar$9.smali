.class Lcom/android/browser/BottomBar$9;
.super Ljava/lang/Object;
.source "BottomBar.java"

# interfaces
.implements Lcom/android/browser/TabControl$OnTabCountChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/BottomBar;->initLayout(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BottomBar;


# direct methods
.method constructor <init>(Lcom/android/browser/BottomBar;)V
    .locals 0
    .parameter

    .prologue
    .line 160
    iput-object p1, p0, Lcom/android/browser/BottomBar$9;->this$0:Lcom/android/browser/BottomBar;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTabCountChanged()V
    .locals 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/android/browser/BottomBar$9;->this$0:Lcom/android/browser/BottomBar;

    iget-object v0, v0, Lcom/android/browser/BottomBar;->mBottomBarTabCount:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/browser/BottomBar$9;->this$0:Lcom/android/browser/BottomBar;

    #getter for: Lcom/android/browser/BottomBar;->mTabControl:Lcom/android/browser/TabControl;
    invoke-static {v1}, Lcom/android/browser/BottomBar;->access$200(Lcom/android/browser/BottomBar;)Lcom/android/browser/TabControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    return-void
.end method
