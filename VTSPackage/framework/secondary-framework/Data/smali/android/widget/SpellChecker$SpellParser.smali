.class Landroid/widget/SpellChecker$SpellParser;
.super Ljava/lang/Object;
.source "SpellChecker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/SpellChecker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SpellParser"
.end annotation


# instance fields
.field private mRange:Ljava/lang/Object;

.field final synthetic this$0:Landroid/widget/SpellChecker;


# direct methods
.method private constructor <init>(Landroid/widget/SpellChecker;)V
    .locals 1
    .parameter

    .prologue
    .line 503
    iput-object p1, p0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 504
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/widget/SpellChecker$SpellParser;->mRange:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Landroid/widget/SpellChecker;Landroid/widget/SpellChecker$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 503
    invoke-direct {p0, p1}, Landroid/widget/SpellChecker$SpellParser;-><init>(Landroid/widget/SpellChecker;)V

    return-void
.end method

.method private removeRangeSpan(Landroid/text/Editable;)V
    .locals 1
    .parameter "editable"

    .prologue
    .line 541
    iget-object v0, p0, Landroid/widget/SpellChecker$SpellParser;->mRange:Ljava/lang/Object;

    invoke-interface {p1, v0}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 542
    return-void
.end method

.method private removeSpansAt(Landroid/text/Editable;I[Ljava/lang/Object;)V
    .locals 5
    .parameter "editable"
    .parameter "offset"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/text/Editable;",
            "I[TT;)V"
        }
    .end annotation

    .prologue
    .line 745
    .local p3, spans:[Ljava/lang/Object;,"[TT;"
    array-length v2, p3

    .line 746
    .local v2, length:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 747
    aget-object v3, p3, v1

    .line 748
    .local v3, span:Ljava/lang/Object;,"TT;"
    invoke-interface {p1, v3}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    .line 749
    .local v4, start:I
    if-le v4, p2, :cond_1

    .line 746
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 750
    :cond_1
    invoke-interface {p1, v3}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v0

    .line 751
    .local v0, end:I
    if-lt v0, p2, :cond_0

    .line 752
    invoke-interface {p1, v3}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    goto :goto_1

    .line 754
    .end local v0           #end:I
    .end local v3           #span:Ljava/lang/Object;,"TT;"
    .end local v4           #start:I
    :cond_2
    return-void
.end method

.method private setRangeSpan(Landroid/text/Editable;II)V
    .locals 2
    .parameter "editable"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 533
    iget-object v0, p0, Landroid/widget/SpellChecker$SpellParser;->mRange:Ljava/lang/Object;

    const/16 v1, 0x21

    invoke-interface {p1, v0, p2, p3, v1}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 534
    return-void
.end method


# virtual methods
.method public isFinished()Z
    .locals 2

    .prologue
    .line 522
    iget-object v0, p0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    #getter for: Landroid/widget/SpellChecker;->mTextView:Landroid/widget/TextView;
    invoke-static {v0}, Landroid/widget/SpellChecker;->access$200(Landroid/widget/SpellChecker;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/Editable;

    iget-object v1, p0, Landroid/widget/SpellChecker$SpellParser;->mRange:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public parse()V
    .locals 26

    .prologue
    .line 545
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mTextView:Landroid/widget/TextView;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$200(Landroid/widget/SpellChecker;)Landroid/widget/TextView;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    check-cast v6, Landroid/text/Editable;

    .line 548
    .local v6, editable:Landroid/text/Editable;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mIsSentenceSpellCheckSupported:Z
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$400(Landroid/widget/SpellChecker;)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 551
    const/16 v23, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->mRange:Ljava/lang/Object;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-interface {v6, v0}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v24

    add-int/lit8 v24, v24, -0x32

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->max(II)I

    move-result v17

    .line 557
    .local v17, start:I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->mRange:Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v6, v0}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v7

    .line 559
    .local v7, end:I
    move/from16 v0, v17

    add-int/lit16 v0, v0, 0x15e

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v21

    .line 560
    .local v21, wordIteratorWindowEnd:I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v17

    move/from16 v2, v21

    invoke-virtual {v0, v6, v1, v2}, Landroid/text/method/WordIterator;->setCharSequence(Ljava/lang/CharSequence;II)V

    .line 563
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/text/method/WordIterator;->preceding(I)I

    move-result v22

    .line 565
    .local v22, wordStart:I
    const/16 v23, -0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_2

    .line 566
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/text/method/WordIterator;->following(I)I

    move-result v20

    .line 567
    .local v20, wordEnd:I
    const/16 v23, -0x1

    move/from16 v0, v20

    move/from16 v1, v23

    if-eq v0, v1, :cond_0

    .line 568
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/text/method/WordIterator;->getBeginning(I)I

    move-result v22

    .line 573
    :cond_0
    :goto_1
    const/16 v23, -0x1

    move/from16 v0, v20

    move/from16 v1, v23

    if-ne v0, v1, :cond_3

    .line 577
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Landroid/widget/SpellChecker$SpellParser;->removeRangeSpan(Landroid/text/Editable;)V

    .line 742
    :goto_2
    return-void

    .line 554
    .end local v7           #end:I
    .end local v17           #start:I
    .end local v20           #wordEnd:I
    .end local v21           #wordIteratorWindowEnd:I
    .end local v22           #wordStart:I
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->mRange:Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v6, v0}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v17

    .restart local v17       #start:I
    goto/16 :goto_0

    .line 571
    .restart local v7       #end:I
    .restart local v21       #wordIteratorWindowEnd:I
    .restart local v22       #wordStart:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/text/method/WordIterator;->getEnd(I)I

    move-result v20

    .restart local v20       #wordEnd:I
    goto :goto_1

    .line 583
    :cond_3
    add-int/lit8 v23, v17, -0x1

    add-int/lit8 v24, v7, 0x1

    const-class v25, Landroid/text/style/SpellCheckSpan;

    move/from16 v0, v23

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v6, v0, v1, v2}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [Landroid/text/style/SpellCheckSpan;

    .line 585
    .local v15, spellCheckSpans:[Landroid/text/style/SpellCheckSpan;
    add-int/lit8 v23, v17, -0x1

    add-int/lit8 v24, v7, 0x1

    const-class v25, Landroid/text/style/SuggestionSpan;

    move/from16 v0, v23

    move/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v6, v0, v1, v2}, Landroid/text/Editable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v18

    check-cast v18, [Landroid/text/style/SuggestionSpan;

    .line 588
    .local v18, suggestionSpans:[Landroid/text/style/SuggestionSpan;
    const/16 v19, 0x0

    .line 589
    .local v19, wordCount:I
    const/4 v10, 0x0

    .line 591
    .local v10, scheduleOtherSpellCheck:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mIsSentenceSpellCheckSupported:Z
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$400(Landroid/widget/SpellChecker;)Z

    move-result v23

    if-eqz v23, :cond_11

    .line 592
    move/from16 v0, v21

    if-ge v0, v7, :cond_4

    .line 597
    const/4 v10, 0x1

    .line 599
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/text/method/WordIterator;->preceding(I)I

    move-result v13

    .line 600
    .local v13, spellCheckEnd:I
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v13, v0, :cond_6

    const/4 v4, 0x1

    .line 601
    .local v4, correct:Z
    :goto_3
    if-eqz v4, :cond_5

    .line 602
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Landroid/text/method/WordIterator;->getEnd(I)I

    move-result v13

    .line 603
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v13, v0, :cond_7

    const/4 v4, 0x1

    .line 605
    :cond_5
    :goto_4
    if-nez v4, :cond_8

    .line 609
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Landroid/widget/SpellChecker$SpellParser;->removeRangeSpan(Landroid/text/Editable;)V

    goto/16 :goto_2

    .line 600
    .end local v4           #correct:Z
    :cond_6
    const/4 v4, 0x0

    goto :goto_3

    .line 603
    .restart local v4       #correct:Z
    :cond_7
    const/4 v4, 0x0

    goto :goto_4

    .line 614
    :cond_8
    move/from16 v16, v22

    .line 615
    .local v16, spellCheckStart:I
    const/4 v5, 0x1

    .line 617
    .local v5, createSpellCheckSpan:Z
    const/4 v8, 0x0

    .local v8, i:I
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mLength:I
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$600(Landroid/widget/SpellChecker;)I

    move-result v23

    move/from16 v0, v23

    if-ge v8, v0, :cond_b

    .line 618
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mSpellCheckSpans:[Landroid/text/style/SpellCheckSpan;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$700(Landroid/widget/SpellChecker;)[Landroid/text/style/SpellCheckSpan;

    move-result-object v23

    aget-object v14, v23, v8

    .line 619
    .local v14, spellCheckSpan:Landroid/text/style/SpellCheckSpan;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mIds:[I
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$800(Landroid/widget/SpellChecker;)[I

    move-result-object v23

    aget v23, v23, v8

    if-ltz v23, :cond_9

    invoke-virtual {v14}, Landroid/text/style/SpellCheckSpan;->isSpellCheckInProgress()Z

    move-result v23

    if-eqz v23, :cond_a

    .line 617
    :cond_9
    :goto_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 622
    :cond_a
    invoke-interface {v6, v14}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v12

    .line 623
    .local v12, spanStart:I
    invoke-interface {v6, v14}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v11

    .line 624
    .local v11, spanEnd:I
    move/from16 v0, v16

    if-lt v11, v0, :cond_9

    if-lt v13, v12, :cond_9

    .line 628
    move/from16 v0, v16

    if-gt v12, v0, :cond_e

    if-gt v13, v11, :cond_e

    .line 631
    const/4 v5, 0x0

    .line 651
    .end local v11           #spanEnd:I
    .end local v12           #spanStart:I
    .end local v14           #spellCheckSpan:Landroid/text/style/SpellCheckSpan;
    :cond_b
    move/from16 v0, v17

    if-ge v13, v0, :cond_f

    .line 663
    :cond_c
    :goto_7
    move/from16 v22, v13

    .line 731
    .end local v4           #correct:Z
    .end local v5           #createSpellCheckSpan:Z
    .end local v8           #i:I
    .end local v13           #spellCheckEnd:I
    .end local v16           #spellCheckStart:I
    :cond_d
    :goto_8
    if-eqz v10, :cond_1e

    .line 733
    move/from16 v0, v22

    if-le v0, v7, :cond_1d

    move/from16 v3, v22

    .line 735
    .local v3, adjustEnd:I
    :goto_9
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v6, v1, v3}, Landroid/widget/SpellChecker$SpellParser;->setRangeSpan(Landroid/text/Editable;II)V

    .line 741
    .end local v3           #adjustEnd:I
    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #calls: Landroid/widget/SpellChecker;->spellCheck()V
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$1000(Landroid/widget/SpellChecker;)V

    goto/16 :goto_2

    .line 638
    .restart local v4       #correct:Z
    .restart local v5       #createSpellCheckSpan:Z
    .restart local v8       #i:I
    .restart local v11       #spanEnd:I
    .restart local v12       #spanStart:I
    .restart local v13       #spellCheckEnd:I
    .restart local v14       #spellCheckSpan:Landroid/text/style/SpellCheckSpan;
    .restart local v16       #spellCheckStart:I
    :cond_e
    invoke-interface {v6, v14}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 639
    move/from16 v0, v16

    invoke-static {v12, v0}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 640
    invoke-static {v11, v13}, Ljava/lang/Math;->max(II)I

    move-result v13

    goto :goto_6

    .line 654
    .end local v11           #spanEnd:I
    .end local v12           #spanStart:I
    .end local v14           #spellCheckSpan:Landroid/text/style/SpellCheckSpan;
    :cond_f
    move/from16 v0, v16

    if-gt v13, v0, :cond_10

    .line 655
    invoke-static {}, Landroid/widget/SpellChecker;->access$300()Ljava/lang/String;

    move-result-object v23

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Trying to spellcheck invalid region, from "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " to "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 659
    :cond_10
    if-eqz v5, :cond_c

    .line 660
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, v16

    #calls: Landroid/widget/SpellChecker;->addSpellCheckSpan(Landroid/text/Editable;II)V
    invoke-static {v0, v6, v1, v13}, Landroid/widget/SpellChecker;->access$900(Landroid/widget/SpellChecker;Landroid/text/Editable;II)V

    goto :goto_7

    .line 665
    .end local v4           #correct:Z
    .end local v5           #createSpellCheckSpan:Z
    .end local v8           #i:I
    .end local v13           #spellCheckEnd:I
    .end local v16           #spellCheckStart:I
    :cond_11
    move/from16 v0, v22

    if-gt v0, v7, :cond_d

    .line 666
    move/from16 v0, v20

    move/from16 v1, v17

    if-lt v0, v1, :cond_18

    move/from16 v0, v20

    move/from16 v1, v22

    if-le v0, v1, :cond_18

    .line 667
    const/16 v23, 0x32

    move/from16 v0, v19

    move/from16 v1, v23

    if-lt v0, v1, :cond_12

    .line 668
    const/4 v10, 0x1

    .line 669
    goto :goto_8

    .line 674
    :cond_12
    move/from16 v0, v22

    move/from16 v1, v17

    if-ge v0, v1, :cond_13

    move/from16 v0, v20

    move/from16 v1, v17

    if-le v0, v1, :cond_13

    .line 675
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v6, v1, v15}, Landroid/widget/SpellChecker$SpellParser;->removeSpansAt(Landroid/text/Editable;I[Ljava/lang/Object;)V

    .line 676
    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v6, v1, v2}, Landroid/widget/SpellChecker$SpellParser;->removeSpansAt(Landroid/text/Editable;I[Ljava/lang/Object;)V

    .line 679
    :cond_13
    move/from16 v0, v22

    if-ge v0, v7, :cond_14

    move/from16 v0, v20

    if-le v0, v7, :cond_14

    .line 680
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v7, v15}, Landroid/widget/SpellChecker$SpellParser;->removeSpansAt(Landroid/text/Editable;I[Ljava/lang/Object;)V

    .line 681
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v6, v7, v1}, Landroid/widget/SpellChecker$SpellParser;->removeSpansAt(Landroid/text/Editable;I[Ljava/lang/Object;)V

    .line 685
    :cond_14
    const/4 v5, 0x1

    .line 686
    .restart local v5       #createSpellCheckSpan:Z
    move/from16 v0, v20

    move/from16 v1, v17

    if-ne v0, v1, :cond_15

    .line 687
    const/4 v8, 0x0

    .restart local v8       #i:I
    :goto_b
    array-length v0, v15

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v8, v0, :cond_15

    .line 688
    aget-object v23, v15, v8

    move-object/from16 v0, v23

    invoke-interface {v6, v0}, Landroid/text/Editable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v11

    .line 689
    .restart local v11       #spanEnd:I
    move/from16 v0, v17

    if-ne v11, v0, :cond_1b

    .line 690
    const/4 v5, 0x0

    .line 696
    .end local v8           #i:I
    .end local v11           #spanEnd:I
    :cond_15
    move/from16 v0, v22

    if-ne v0, v7, :cond_16

    .line 697
    const/4 v8, 0x0

    .restart local v8       #i:I
    :goto_c
    array-length v0, v15

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v8, v0, :cond_16

    .line 698
    aget-object v23, v15, v8

    move-object/from16 v0, v23

    invoke-interface {v6, v0}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v12

    .line 699
    .restart local v12       #spanStart:I
    if-ne v12, v7, :cond_1c

    .line 700
    const/4 v5, 0x0

    .line 706
    .end local v8           #i:I
    .end local v12           #spanStart:I
    :cond_16
    if-eqz v5, :cond_17

    .line 707
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, v22

    move/from16 v2, v20

    #calls: Landroid/widget/SpellChecker;->addSpellCheckSpan(Landroid/text/Editable;II)V
    invoke-static {v0, v6, v1, v2}, Landroid/widget/SpellChecker;->access$900(Landroid/widget/SpellChecker;Landroid/text/Editable;II)V

    .line 709
    :cond_17
    add-int/lit8 v19, v19, 0x1

    .line 713
    .end local v5           #createSpellCheckSpan:Z
    :cond_18
    move/from16 v9, v20

    .line 714
    .local v9, originalWordEnd:I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/text/method/WordIterator;->following(I)I

    move-result v20

    .line 715
    move/from16 v0, v21

    if-ge v0, v7, :cond_1a

    const/16 v23, -0x1

    move/from16 v0, v20

    move/from16 v1, v23

    if-eq v0, v1, :cond_19

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_1a

    .line 717
    :cond_19
    add-int/lit16 v0, v9, 0x15e

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v21

    .line 719
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v6, v9, v1}, Landroid/text/method/WordIterator;->setCharSequence(Ljava/lang/CharSequence;II)V

    .line 721
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Landroid/text/method/WordIterator;->following(I)I

    move-result v20

    .line 723
    :cond_1a
    const/16 v23, -0x1

    move/from16 v0, v20

    move/from16 v1, v23

    if-eq v0, v1, :cond_d

    .line 724
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    move-object/from16 v23, v0

    #getter for: Landroid/widget/SpellChecker;->mWordIterator:Landroid/text/method/WordIterator;
    invoke-static/range {v23 .. v23}, Landroid/widget/SpellChecker;->access$500(Landroid/widget/SpellChecker;)Landroid/text/method/WordIterator;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/text/method/WordIterator;->getBeginning(I)I

    move-result v22

    .line 725
    const/16 v23, -0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_11

    goto/16 :goto_8

    .line 687
    .end local v9           #originalWordEnd:I
    .restart local v5       #createSpellCheckSpan:Z
    .restart local v8       #i:I
    .restart local v11       #spanEnd:I
    :cond_1b
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_b

    .line 697
    .end local v11           #spanEnd:I
    .restart local v12       #spanStart:I
    :cond_1c
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_c

    .end local v5           #createSpellCheckSpan:Z
    .end local v8           #i:I
    .end local v12           #spanStart:I
    :cond_1d
    move v3, v7

    .line 733
    goto/16 :goto_9

    .line 738
    :cond_1e
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Landroid/widget/SpellChecker$SpellParser;->removeRangeSpan(Landroid/text/Editable;)V

    goto/16 :goto_a
.end method

.method public parse(II)V
    .locals 5
    .parameter "start"
    .parameter "end"

    .prologue
    .line 507
    iget-object v2, p0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    #getter for: Landroid/widget/SpellChecker;->mTextView:Landroid/widget/TextView;
    invoke-static {v2}, Landroid/widget/SpellChecker;->access$200(Landroid/widget/SpellChecker;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->length()I

    move-result v0

    .line 509
    .local v0, max:I
    if-le p2, v0, :cond_1

    .line 510
    invoke-static {}, Landroid/widget/SpellChecker;->access$300()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Parse invalid region, from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    move v1, v0

    .line 515
    .local v1, parseEnd:I
    :goto_0
    if-le v1, p1, :cond_0

    .line 516
    iget-object v2, p0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    #getter for: Landroid/widget/SpellChecker;->mTextView:Landroid/widget/TextView;
    invoke-static {v2}, Landroid/widget/SpellChecker;->access$200(Landroid/widget/SpellChecker;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    check-cast v2, Landroid/text/Editable;

    invoke-direct {p0, v2, p1, v1}, Landroid/widget/SpellChecker$SpellParser;->setRangeSpan(Landroid/text/Editable;II)V

    .line 517
    invoke-virtual {p0}, Landroid/widget/SpellChecker$SpellParser;->parse()V

    .line 519
    :cond_0
    return-void

    .line 513
    .end local v1           #parseEnd:I
    :cond_1
    move v1, p2

    .restart local v1       #parseEnd:I
    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 526
    iget-object v0, p0, Landroid/widget/SpellChecker$SpellParser;->this$0:Landroid/widget/SpellChecker;

    #getter for: Landroid/widget/SpellChecker;->mTextView:Landroid/widget/TextView;
    invoke-static {v0}, Landroid/widget/SpellChecker;->access$200(Landroid/widget/SpellChecker;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/Editable;

    invoke-direct {p0, v0}, Landroid/widget/SpellChecker$SpellParser;->removeRangeSpan(Landroid/text/Editable;)V

    .line 527
    return-void
.end method
