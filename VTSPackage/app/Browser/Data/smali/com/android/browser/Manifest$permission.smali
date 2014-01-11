.class public final Lcom/android/browser/Manifest$permission;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/Manifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "permission"
.end annotation


# static fields
.field public static final PRELOAD:Ljava/lang/String; = "com.android.browser.permission.PRELOAD"

.field public static final READ_HOMEPAGE:Ljava/lang/String; = "com.android.browser.permission.READ_HOMEPAGE"

.field public static final WRITE_HOMEPAGE:Ljava/lang/String; = "com.android.browser.permission.WRITE_HOMEPAGE"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
