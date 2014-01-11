.class Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$2;
.super Ljava/lang/Object;
.source "AppsCustomizeTabHost.java"

# interfaces
.implements Landroid/widget/TabHost$TabContentFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

.field final synthetic val$appsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 121
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$2;->val$appsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createTabContent(Ljava/lang/String;)Landroid/view/View;
    .locals 1
    .parameter "tag"

    .prologue
    .line 123
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$2;->val$appsCustomizePane:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    return-object v0
.end method
