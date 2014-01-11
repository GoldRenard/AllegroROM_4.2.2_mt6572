.class Lcom/mediatek/oobe/basic/gemini/SimManagement$3;
.super Landroid/content/BroadcastReceiver;
.source "SimManagement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/oobe/basic/gemini/SimManagement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;


# direct methods
.method constructor <init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter

    .prologue
    .line 285
    iput-object p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 23
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 290
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    .line 291
    .local v4, action:Ljava/lang/String;
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "receiver:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    const-string v20, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 294
    const-string v20, "simid"

    const-wide/16 v21, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move-wide/from16 v2, v21

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v13

    .line 295
    .local v13, simid:J
    const-string v20, "type"

    const/16 v21, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v19

    .line 296
    .local v19, type:I
    const-string v20, "SimManagementSettings"

    const-string v21, "receiver: Intent.SIM_SETTINGS_INFO_CHANGED"

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "type is "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " simid is "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v0, v13, v14, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateSimInfo(JI)V

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v13, v14}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSimInfo(J)V

    .line 429
    .end local v13           #simid:J
    .end local v19           #type:I
    :cond_0
    :goto_0
    return-void

    .line 301
    :cond_1
    const-string v20, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 302
    const-string v20, "slotId"

    const/16 v21, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v16

    .line 303
    .local v16, slotId:I
    const-string v20, "state"

    const/16 v21, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v12

    .line 304
    .local v12, simStatus:I
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "slotid is "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "status is "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    if-ltz v16, :cond_0

    if-ltz v12, :cond_0

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move/from16 v1, v16

    invoke-virtual {v0, v1, v12}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateSimState(II)V

    .line 308
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move/from16 v1, v16

    invoke-virtual {v0, v1, v12}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSimState(II)V

    goto :goto_0

    .line 311
    .end local v12           #simStatus:I
    .end local v16           #slotId:I
    :cond_2
    const-string v20, "android.intent.action.SIM_INFO_UPDATE"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->disableSimPrefs()V

    goto/16 :goto_0

    .line 314
    :cond_3
    const-string v20, "android.intent.action.SIM_NAME_UPDATE"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_4

    .line 315
    const-string v20, "simId"

    const/16 v21, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .line 317
    .local v17, slotid:I
    if-ltz v17, :cond_0

    .line 321
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v15

    .line 322
    .local v15, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v15, :cond_0

    .line 323
    iget-wide v9, v15, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    .line 324
    .local v9, simID:J
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "slotid is "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v9, v10, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateSimInfo(JI)V

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v9, v10}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSimInfo(J)V

    goto/16 :goto_0

    .line 329
    .end local v9           #simID:J
    .end local v15           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v17           #slotid:I
    :cond_4
    const-string v20, "com.android.mms.transaction.START"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_6

    .line 330
    const-string v20, "SimManagementSettings"

    const-string v21, "receiver: TRANSACTION_START"

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    const/16 v20, 0x0

    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$102(Z)Z

    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-result-object v21

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$200()Z

    move-result v20

    if-nez v20, :cond_5

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$100()Z

    move-result v20

    if-eqz v20, :cond_5

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$300()Z

    move-result v20

    if-eqz v20, :cond_5

    const/16 v20, 0x1

    :goto_1
    move-object/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    .line 334
    .local v6, dlg:Landroid/app/Dialog;
    if-eqz v6, :cond_0

    .line 335
    invoke-virtual {v6}, Landroid/app/Dialog;->isShowing()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 336
    invoke-virtual {v6}, Landroid/app/Dialog;->dismiss()V

    goto/16 :goto_0

    .line 332
    .end local v6           #dlg:Landroid/app/Dialog;
    :cond_5
    const/16 v20, 0x0

    goto :goto_1

    .line 339
    :cond_6
    const-string v20, "com.android.mms.transaction.STOP"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_8

    .line 340
    const-string v20, "SimManagementSettings"

    const-string v21, "receiver: TRANSACTION_STOP"

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    const/16 v20, 0x1

    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$102(Z)Z

    .line 342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-result-object v21

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$200()Z

    move-result v20

    if-nez v20, :cond_7

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$100()Z

    move-result v20

    if-eqz v20, :cond_7

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$300()Z

    move-result v20

    if-eqz v20, :cond_7

    const/16 v20, 0x1

    :goto_2
    move-object/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 343
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    .line 344
    .restart local v6       #dlg:Landroid/app/Dialog;
    if-eqz v6, :cond_0

    .line 345
    invoke-virtual {v6}, Landroid/app/Dialog;->isShowing()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 346
    invoke-virtual {v6}, Landroid/app/Dialog;->dismiss()V

    goto/16 :goto_0

    .line 342
    .end local v6           #dlg:Landroid/app/Dialog;
    :cond_7
    const/16 v20, 0x0

    goto :goto_2

    .line 349
    :cond_8
    const-string v20, "android.intent.action.AIRPLANE_MODE"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_b

    .line 351
    const-string v20, "state"

    const/16 v21, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v20

    if-nez v20, :cond_9

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v20

    const-string v21, "dual_sim_mode_setting"

    const/16 v22, -0x1

    invoke-static/range {v20 .. v22}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v20

    if-nez v20, :cond_a

    :cond_9
    const/16 v20, 0x1

    :goto_3
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$202(Z)Z

    .line 354
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "airplane mode changed to "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$200()Z

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->initDefaultSimPreference()V

    goto/16 :goto_0

    .line 351
    :cond_a
    const/16 v20, 0x0

    goto :goto_3

    .line 356
    :cond_b
    sget-object v20, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_3G_SWITCH_DONE:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_e

    .line 358
    const-string v20, "SimManagementSettings"

    const-string v21, "receiver: GeminiPhone.EVENT_3G_SWITCH_DONE"

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v20

    const/16 v21, 0x44f

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_c

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, -0x1

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$502(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)I

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->isResumed()Z

    move-result v20

    if-eqz v20, :cond_c

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, 0x3ee

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$600(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V

    .line 368
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mStatusBarManager:Landroid/app/StatusBarManager;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/app/StatusBarManager;

    move-result-object v20

    if-eqz v20, :cond_d

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mStatusBarManager:Landroid/app/StatusBarManager;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/app/StatusBarManager;

    move-result-object v20

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/app/StatusBarManager;->disable(I)V

    .line 373
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateVideoCallDefaultSIM()V
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$800(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    goto/16 :goto_0

    .line 375
    :cond_e
    sget-object v20, Lcom/android/internal/telephony/gemini/GeminiPhone;->EVENT_3G_SWITCH_LOCK_CHANGED:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_10

    .line 377
    const-string v20, "SimManagementSettings"

    const-string v21, "receiver: GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED"

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    sget-object v20, Lcom/android/internal/telephony/gemini/GeminiPhone;->EXTRA_3G_SWITCH_LOCKED:Ljava/lang/String;

    const/16 v21, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    .line 380
    .local v7, lockState:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1000(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIs3gOff:Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$900(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Z

    move-result v20

    if-nez v20, :cond_f

    if-nez v7, :cond_f

    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$300()Z

    move-result v20

    if-eqz v20, :cond_f

    const/16 v20, 0x1

    :goto_4
    move-object/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    goto/16 :goto_0

    :cond_f
    const/16 v20, 0x0

    goto :goto_4

    .line 381
    .end local v7           #lockState:Z
    :cond_10
    const-string v20, "android.intent.action.ANY_DATA_STATE"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 383
    const-string v20, "reason"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 384
    .local v8, reason:Ljava/lang/String;
    const-string v20, "apnType"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 385
    .local v5, apnTypeList:Ljava/lang/String;
    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    invoke-static/range {p2 .. p2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1100(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v18

    .line 387
    .local v18, state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    const-string v20, "simId"

    const/16 v21, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 388
    .local v11, simId:I
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "mDataConnectionReceiver simId is : "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "mDataConnectionReceiver state is : "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "mDataConnectionReceiver reason is : "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    const-string v20, "SimManagementSettings"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "mDataConnectionReceiver apn type is : "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    if-eqz v8, :cond_0

    const-string v20, "default"

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 397
    const-string v20, "dataAttached"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_12

    sget-object v20, Lcom/android/internal/telephony/PhoneConstants$DataState;->CONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1200(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Z

    move-result v20

    if-eqz v20, :cond_12

    .line 399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1300(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/os/Handler;

    move-result-object v20

    const/16 v21, 0x7d1

    invoke-virtual/range {v20 .. v21}, Landroid/os/Handler;->removeMessages(I)V

    .line 401
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v20

    const/16 v21, 0x44e

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_11

    .line 402
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, -0x1

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$502(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)I

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->isResumed()Z

    move-result v20

    if-eqz v20, :cond_11

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, 0x3ec

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1400(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V

    .line 408
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateGprsSettings()V

    .line 409
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1202(Lcom/mediatek/oobe/basic/gemini/SimManagement;Z)Z

    goto/16 :goto_0

    .line 411
    :cond_12
    const-string v20, "dataDetached"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_0

    sget-object v20, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1200(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 414
    invoke-static {}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1500()Z

    move-result v20

    if-nez v20, :cond_0

    .line 415
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1300(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/os/Handler;

    move-result-object v20

    const/16 v21, 0x7d0

    invoke-virtual/range {v20 .. v21}, Landroid/os/Handler;->removeMessages(I)V

    .line 416
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    #getter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I

    move-result v20

    const/16 v21, 0x44e

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_13

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, -0x1

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$502(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)I

    .line 418
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->isResumed()Z

    move-result v20

    if-eqz v20, :cond_13

    .line 419
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, 0x3ec

    #calls: Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1600(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V

    .line 422
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateGprsSettings()V

    .line 423
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;->this$0:Lcom/mediatek/oobe/basic/gemini/SimManagement;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    #setter for: Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z
    invoke-static/range {v20 .. v21}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->access$1202(Lcom/mediatek/oobe/basic/gemini/SimManagement;Z)Z

    goto/16 :goto_0
.end method
