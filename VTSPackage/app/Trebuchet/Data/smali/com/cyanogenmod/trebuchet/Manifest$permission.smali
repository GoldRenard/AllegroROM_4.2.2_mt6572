.class public final Lcom/cyanogenmod/trebuchet/Manifest$permission;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/Manifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "permission"
.end annotation


# static fields
.field public static final INSTALL_SHORTCUT:Ljava/lang/String; = "com.android.launcher.permission.INSTALL_SHORTCUT"

.field public static final PRELOAD_WORKSPACE:Ljava/lang/String; = "com.android.launcher.permission.PRELOAD_WORKSPACE"

.field public static final READ_SETTINGS:Ljava/lang/String; = "com.android.launcher.permission.READ_SETTINGS"

.field public static final UNINSTALL_SHORTCUT:Ljava/lang/String; = "com.android.launcher.permission.UNINSTALL_SHORTCUT"

.field public static final WRITE_SETTINGS:Ljava/lang/String; = "com.android.launcher.permission.WRITE_SETTINGS"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
