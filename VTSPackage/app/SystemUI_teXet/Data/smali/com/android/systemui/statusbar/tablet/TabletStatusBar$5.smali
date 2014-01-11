.class Lcom/android/systemui/statusbar/tablet/TabletStatusBar$5;
.super Ljava/lang/Object;
.source "TabletStatusBar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->showCompatibilityHelp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V
    .registers 2
    .parameter

    .prologue
    .line 1123
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$5;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .parameter "v"

    .prologue
    .line 1126
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$5;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-static {v1}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->access$1900(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V

    .line 1127
    iget-object v1, p0, Lcom/android/systemui/statusbar/tablet/TabletStatusBar$5;->this$0:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    iget-object v1, v1, Lcom/android/systemui/SystemUI;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/systemui/statusbar/policy/Prefs;->edit(Landroid/content/Context;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1128
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "shown_compat_mode_help"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1129
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1130
    return-void
.end method
