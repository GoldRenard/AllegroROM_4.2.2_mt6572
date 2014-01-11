.class Landroid/widget/AppSecurityPermissions$MyPermissionInfo;
.super Landroid/content/pm/PermissionInfo;
.source "AppSecurityPermissions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/AppSecurityPermissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MyPermissionInfo"
.end annotation


# instance fields
.field mExistingReqFlags:I

.field mLabel:Ljava/lang/CharSequence;

.field mNew:Z

.field mNewReqFlags:I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 135
    invoke-direct {p0}, Landroid/content/pm/PermissionInfo;-><init>()V

    .line 136
    return-void
.end method

.method constructor <init>(Landroid/content/pm/PermissionInfo;)V
    .locals 0
    .parameter "info"

    .prologue
    .line 139
    invoke-direct {p0, p1}, Landroid/content/pm/PermissionInfo;-><init>(Landroid/content/pm/PermissionInfo;)V

    .line 140
    return-void
.end method

.method constructor <init>(Landroid/widget/AppSecurityPermissions$MyPermissionInfo;)V
    .locals 1
    .parameter "info"

    .prologue
    .line 143
    invoke-direct {p0, p1}, Landroid/content/pm/PermissionInfo;-><init>(Landroid/content/pm/PermissionInfo;)V

    .line 144
    iget v0, p1, Landroid/widget/AppSecurityPermissions$MyPermissionInfo;->mNewReqFlags:I

    iput v0, p0, Landroid/widget/AppSecurityPermissions$MyPermissionInfo;->mNewReqFlags:I

    .line 145
    iget v0, p1, Landroid/widget/AppSecurityPermissions$MyPermissionInfo;->mExistingReqFlags:I

    iput v0, p0, Landroid/widget/AppSecurityPermissions$MyPermissionInfo;->mExistingReqFlags:I

    .line 146
    iget-boolean v0, p1, Landroid/widget/AppSecurityPermissions$MyPermissionInfo;->mNew:Z

    iput-boolean v0, p0, Landroid/widget/AppSecurityPermissions$MyPermissionInfo;->mNew:Z

    .line 147
    return-void
.end method
