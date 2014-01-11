.class public interface abstract Lcom/android/systemui/ExpandHelper$Callback;
.super Ljava/lang/Object;
.source "ExpandHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/ExpandHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract canChildBeExpanded(Landroid/view/View;)Z
.end method

.method public abstract getChildAtPosition(FF)Landroid/view/View;
.end method

.method public abstract getChildAtRawPosition(FF)Landroid/view/View;
.end method

.method public abstract setUserExpandedChild(Landroid/view/View;Z)Z
.end method

.method public abstract setUserLockedChild(Landroid/view/View;Z)Z
.end method
