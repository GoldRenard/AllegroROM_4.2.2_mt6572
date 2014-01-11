.class public interface abstract Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$OnItemSelectedListener;
.super Ljava/lang/Object;
.source "CustomAdapterView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnItemSelectedListener"
.end annotation


# virtual methods
.method public abstract onItemSelected(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;Landroid/view/View;IJ)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation
.end method

.method public abstract onNothingSelected(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView",
            "<*>;)V"
        }
    .end annotation
.end method
