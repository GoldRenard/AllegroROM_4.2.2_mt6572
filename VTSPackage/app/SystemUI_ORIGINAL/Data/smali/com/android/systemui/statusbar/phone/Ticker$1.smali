.class Lcom/android/systemui/statusbar/phone/Ticker$1;
.super Ljava/lang/Object;
.source "Ticker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/Ticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/Ticker;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/Ticker;)V
    .locals 0
    .parameter

    .prologue
    .line 263
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 265
    :goto_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    #getter for: Lcom/android/systemui/statusbar/phone/Ticker;->mSegments:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->access$200(Lcom/android/systemui/statusbar/phone/Ticker;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 266
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    #getter for: Lcom/android/systemui/statusbar/phone/Ticker;->mSegments:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->access$200(Lcom/android/systemui/statusbar/phone/Ticker;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/statusbar/phone/Ticker$Segment;

    .line 268
    .local v0, seg:Lcom/android/systemui/statusbar/phone/Ticker$Segment;
    iget-boolean v2, v0, Lcom/android/systemui/statusbar/phone/Ticker$Segment;->first:Z

    if-eqz v2, :cond_0

    .line 272
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    #getter for: Lcom/android/systemui/statusbar/phone/Ticker;->mIconSwitcher:Landroid/widget/ImageSwitcher;
    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->access$300(Lcom/android/systemui/statusbar/phone/Ticker;)Landroid/widget/ImageSwitcher;

    move-result-object v2

    iget-object v3, v0, Lcom/android/systemui/statusbar/phone/Ticker$Segment;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v3}, Landroid/widget/ImageSwitcher;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 274
    :cond_0
    invoke-virtual {v0}, Lcom/android/systemui/statusbar/phone/Ticker$Segment;->advance()Ljava/lang/CharSequence;

    move-result-object v1

    .line 275
    .local v1, text:Ljava/lang/CharSequence;
    if-nez v1, :cond_1

    .line 276
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    #getter for: Lcom/android/systemui/statusbar/phone/Ticker;->mSegments:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->access$200(Lcom/android/systemui/statusbar/phone/Ticker;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 279
    :cond_1
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    #getter for: Lcom/android/systemui/statusbar/phone/Ticker;->mTextSwitcher:Landroid/widget/TextSwitcher;
    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->access$000(Lcom/android/systemui/statusbar/phone/Ticker;)Landroid/widget/TextSwitcher;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 281
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    #calls: Lcom/android/systemui/statusbar/phone/Ticker;->scheduleAdvance()V
    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->access$400(Lcom/android/systemui/statusbar/phone/Ticker;)V

    .line 284
    .end local v0           #seg:Lcom/android/systemui/statusbar/phone/Ticker$Segment;
    .end local v1           #text:Ljava/lang/CharSequence;
    :cond_2
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    #getter for: Lcom/android/systemui/statusbar/phone/Ticker;->mSegments:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->access$200(Lcom/android/systemui/statusbar/phone/Ticker;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_3

    .line 285
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/Ticker$1;->this$0:Lcom/android/systemui/statusbar/phone/Ticker;

    invoke-virtual {v2}, Lcom/android/systemui/statusbar/phone/Ticker;->tickerDone()V

    .line 287
    :cond_3
    return-void
.end method
