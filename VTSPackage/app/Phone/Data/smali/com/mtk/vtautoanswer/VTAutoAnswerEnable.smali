.class public Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;
.super Landroid/app/Activity;
.source "VTAutoAnswerEnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mtk/vtautoanswer/VTAutoAnswerEnable$CustomTimerTask;
    }
.end annotation


# static fields
.field private static final AUTO_ANSWER_FLAG:Ljava/lang/String; = "auto_answer"

.field private static final AUTO_ANSWER_TIMER_FLAG:Ljava/lang/String; = "auto_answer_time"

.field private static final SHREDPRE_NAME:Ljava/lang/String; = "engineermode_vt_preferences"

.field private static final TAG:Ljava/lang/String; = "VTAutoAnswerEnable"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 49
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    const/high16 v6, 0x7f03

    invoke-virtual {p0, v6}, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;->setContentView(I)V

    .line 25
    :try_start_0
    const-string v6, "com.mediatek.engineermode"

    const/4 v7, 0x2

    invoke-virtual {p0, v6, v7}, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v4

    .line 26
    .local v4, friendContext:Landroid/content/Context;
    const-string v6, "engineermode_vt_preferences"

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 27
    .local v0, autoAnswerSh:Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 29
    .local v2, editor:Landroid/content/SharedPreferences$Editor;
    const-string v6, "auto_answer"

    const/4 v7, 0x1

    invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 30
    const-string v6, "auto_answer_time"

    const-string v7, "1000"

    invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 32
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .end local v0           #autoAnswerSh:Landroid/content/SharedPreferences;
    .end local v2           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v4           #friendContext:Landroid/content/Context;
    :goto_0
    new-instance v5, Ljava/util/Timer;

    invoke-direct {v5}, Ljava/util/Timer;-><init>()V

    .line 38
    .local v5, timer:Ljava/util/Timer;
    new-instance v3, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable$CustomTimerTask;

    invoke-direct {v3, p0, p0}, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable$CustomTimerTask;-><init>(Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;Landroid/app/Activity;)V

    .line 39
    .local v3, finishTask:Ljava/util/TimerTask;
    const-wide/16 v6, 0x7d0

    invoke-virtual {v5, v3, v6, v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 40
    return-void

    .line 33
    .end local v3           #finishTask:Ljava/util/TimerTask;
    .end local v5           #timer:Ljava/util/Timer;
    :catch_0
    move-exception v1

    .line 34
    .local v1, e:Ljava/lang/Exception;
    const-string v6, "VTAutoAnswerEnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception object: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/mtk/vtautoanswer/VTAutoAnswerEnable;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f06

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 46
    const/4 v0, 0x1

    return v0
.end method
