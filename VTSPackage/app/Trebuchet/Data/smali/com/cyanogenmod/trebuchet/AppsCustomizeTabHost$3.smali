.class Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$3;
.super Ljava/lang/Object;
.source "AppsCustomizeTabHost.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;)V
    .locals 0
    .parameter

    .prologue
    .line 135
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .parameter "v"

    .prologue
    .line 137
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/Launcher;->onLongClickAppsTab(Landroid/view/View;)V

    .line 138
    const/4 v0, 0x1

    return v0
.end method
