.class Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;
.super Ljava/lang/Object;
.source "CustomAdapterView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SelectionNotifier"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;


# direct methods
.method private constructor <init>(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;)V
    .locals 0
    .parameter

    .prologue
    .line 816
    .local p0, this:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;,"Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView<TT;>.SelectionNotifier;"
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 816
    .local p0, this:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;,"Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView<TT;>.SelectionNotifier;"
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;-><init>(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 818
    .local p0, this:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;,"Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView<TT;>.SelectionNotifier;"
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    iget-boolean v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->mDataChanged:Z

    if-eqz v0, :cond_1

    .line 822
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 823
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->post(Ljava/lang/Runnable;)Z

    .line 828
    :cond_0
    :goto_0
    return-void

    .line 826
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$SelectionNotifier;->this$0:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;

    #calls: Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->fireOnSelected()V
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->access$200(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;)V

    goto :goto_0
.end method
