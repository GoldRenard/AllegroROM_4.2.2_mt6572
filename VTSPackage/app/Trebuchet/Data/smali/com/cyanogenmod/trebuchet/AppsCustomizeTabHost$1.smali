.class Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$1;
.super Ljava/lang/Object;
.source "AppsCustomizeTabHost.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V
    .locals 0
    .parameter

    .prologue
    .line 67
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$1;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$1;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabs:Landroid/view/ViewGroup;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 70
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$1;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->mTabsContainer:Landroid/view/ViewGroup;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->access$100(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)Landroid/view/ViewGroup;

    move-result-object v0

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 71
    return-void
.end method
