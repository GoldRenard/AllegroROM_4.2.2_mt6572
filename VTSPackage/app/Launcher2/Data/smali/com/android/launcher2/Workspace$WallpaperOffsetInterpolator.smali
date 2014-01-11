.class Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;
.super Ljava/lang/Object;
.source "Workspace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WallpaperOffsetInterpolator"
.end annotation


# instance fields
.field mFinalHorizontalWallpaperOffset:F

.field mFinalVerticalWallpaperOffset:F

.field mHorizontalCatchupConstant:F

.field mHorizontalWallpaperOffset:F

.field mIsMovingFast:Z

.field mLastWallpaperOffsetUpdateTime:J

.field mOverrideHorizontalCatchupConstant:Z

.field mVerticalCatchupConstant:F

.field mVerticalWallpaperOffset:F

.field final synthetic this$0:Lcom/android/launcher2/Workspace;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/Workspace;)V
    .locals 3
    .parameter

    .prologue
    const/high16 v2, 0x3f00

    const v1, 0x3eb33333

    const/4 v0, 0x0

    .line 1044
    iput-object p1, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->this$0:Lcom/android/launcher2/Workspace;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1034
    iput v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    .line 1035
    iput v2, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalVerticalWallpaperOffset:F

    .line 1036
    iput v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    .line 1037
    iput v2, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    .line 1041
    iput v1, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalCatchupConstant:F

    .line 1042
    iput v1, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalCatchupConstant:F

    .line 1045
    return-void
.end method


# virtual methods
.method public computeScrollOffset()Z
    .locals 21

    .prologue
    .line 1060
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    move/from16 v18, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Float;->compare(FF)I

    move-result v17

    if-nez v17, :cond_0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalVerticalWallpaperOffset:F

    move/from16 v18, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Float;->compare(FF)I

    move-result v17

    if-nez v17, :cond_0

    .line 1062
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mIsMovingFast:Z

    .line 1063
    const/16 v17, 0x0

    .line 1111
    :goto_0
    return v17

    .line 1065
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v17, v0

    #getter for: Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;
    invoke-static/range {v17 .. v17}, Lcom/android/launcher2/Workspace;->access$200(Lcom/android/launcher2/Workspace;)Landroid/graphics/Point;

    move-result-object v17

    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->this$0:Lcom/android/launcher2/Workspace;

    move-object/from16 v18, v0

    #getter for: Lcom/android/launcher2/Workspace;->mDisplaySize:Landroid/graphics/Point;
    invoke-static/range {v18 .. v18}, Lcom/android/launcher2/Workspace;->access$200(Lcom/android/launcher2/Workspace;)Landroid/graphics/Point;

    move-result-object v18

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->y:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_3

    const/4 v9, 0x1

    .line 1067
    .local v9, isLandscape:Z
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1068
    .local v4, currentTime:J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mLastWallpaperOffsetUpdateTime:J

    move-wide/from16 v17, v0

    sub-long v13, v4, v17

    .line 1069
    .local v13, timeSinceLastUpdate:J
    const-wide/16 v17, 0x21

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v13, v14}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v13

    .line 1070
    const-wide/16 v17, 0x1

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    .line 1072
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    move/from16 v18, v0

    sub-float v17, v17, v18

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 1073
    .local v16, xdiff:F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mIsMovingFast:Z

    move/from16 v17, v0

    if-nez v17, :cond_1

    move/from16 v0, v16

    float-to-double v0, v0

    move-wide/from16 v17, v0

    const-wide v19, 0x3fb1eb851eb851ecL

    cmpl-double v17, v17, v19

    if-lez v17, :cond_1

    .line 1074
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mIsMovingFast:Z

    .line 1078
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mOverrideHorizontalCatchupConstant:Z

    move/from16 v17, v0

    if-eqz v17, :cond_4

    .line 1079
    move-object/from16 v0, p0

    iget v6, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalCatchupConstant:F

    .line 1086
    .local v6, fractionToCatchUpIn1MsHorizontal:F
    :goto_2
    move-object/from16 v0, p0

    iget v7, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalCatchupConstant:F

    .line 1088
    .local v7, fractionToCatchUpIn1MsVertical:F
    const/high16 v17, 0x4204

    div-float v6, v6, v17

    .line 1089
    const/high16 v17, 0x4204

    div-float v7, v7, v17

    .line 1091
    const v3, 0x3727c5ac

    .line 1092
    .local v3, UPDATE_THRESHOLD:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    move/from16 v18, v0

    sub-float v8, v17, v18

    .line 1093
    .local v8, hOffsetDelta:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalVerticalWallpaperOffset:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    move/from16 v18, v0

    sub-float v15, v17, v18

    .line 1094
    .local v15, vOffsetDelta:F
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v17

    const v18, 0x3727c5ac

    cmpg-float v17, v17, v18

    if-gez v17, :cond_8

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v17

    const v18, 0x3727c5ac

    cmpg-float v17, v17, v18

    if-gez v17, :cond_8

    const/4 v10, 0x1

    .line 1098
    .local v10, jumpToFinalValue:Z
    :goto_3
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v17

    if-eqz v17, :cond_2

    if-eqz v10, :cond_9

    .line 1099
    :cond_2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    .line 1100
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalVerticalWallpaperOffset:F

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    .line 1110
    :goto_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    move-wide/from16 v0, v17

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mLastWallpaperOffsetUpdateTime:J

    .line 1111
    const/16 v17, 0x1

    goto/16 :goto_0

    .line 1065
    .end local v3           #UPDATE_THRESHOLD:F
    .end local v4           #currentTime:J
    .end local v6           #fractionToCatchUpIn1MsHorizontal:F
    .end local v7           #fractionToCatchUpIn1MsVertical:F
    .end local v8           #hOffsetDelta:F
    .end local v9           #isLandscape:Z
    .end local v10           #jumpToFinalValue:Z
    .end local v13           #timeSinceLastUpdate:J
    .end local v15           #vOffsetDelta:F
    .end local v16           #xdiff:F
    :cond_3
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 1080
    .restart local v4       #currentTime:J
    .restart local v9       #isLandscape:Z
    .restart local v13       #timeSinceLastUpdate:J
    .restart local v16       #xdiff:F
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mIsMovingFast:Z

    move/from16 v17, v0

    if-eqz v17, :cond_6

    .line 1081
    if-eqz v9, :cond_5

    const/high16 v6, 0x3f00

    .restart local v6       #fractionToCatchUpIn1MsHorizontal:F
    :goto_5
    goto :goto_2

    .end local v6           #fractionToCatchUpIn1MsHorizontal:F
    :cond_5
    const/high16 v6, 0x3f40

    goto :goto_5

    .line 1084
    :cond_6
    if-eqz v9, :cond_7

    const v6, 0x3e8a3d71

    .restart local v6       #fractionToCatchUpIn1MsHorizontal:F
    :goto_6
    goto/16 :goto_2

    .end local v6           #fractionToCatchUpIn1MsHorizontal:F
    :cond_7
    const/high16 v6, 0x3f00

    goto :goto_6

    .line 1094
    .restart local v3       #UPDATE_THRESHOLD:F
    .restart local v6       #fractionToCatchUpIn1MsHorizontal:F
    .restart local v7       #fractionToCatchUpIn1MsVertical:F
    .restart local v8       #hOffsetDelta:F
    .restart local v15       #vOffsetDelta:F
    :cond_8
    const/4 v10, 0x0

    goto :goto_3

    .line 1102
    .restart local v10       #jumpToFinalValue:Z
    :cond_9
    const/high16 v17, 0x3f80

    long-to-float v0, v13

    move/from16 v18, v0

    mul-float v18, v18, v7

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(FF)F

    move-result v12

    .line 1104
    .local v12, percentToCatchUpVertical:F
    const/high16 v17, 0x3f80

    long-to-float v0, v13

    move/from16 v18, v0

    mul-float v18, v18, v6

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 1106
    .local v11, percentToCatchUpHorizontal:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    move/from16 v17, v0

    mul-float v18, v11, v8

    add-float v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    .line 1107
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    move/from16 v17, v0

    mul-float v18, v12, v15

    add-float v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    goto :goto_4
.end method

.method public getCurrX()F
    .locals 1

    .prologue
    .line 1115
    iget v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    return v0
.end method

.method public getCurrY()F
    .locals 1

    .prologue
    .line 1123
    iget v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    return v0
.end method

.method public getFinalX()F
    .locals 1

    .prologue
    .line 1119
    iget v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    return v0
.end method

.method public getFinalY()F
    .locals 1

    .prologue
    .line 1127
    iget v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalVerticalWallpaperOffset:F

    return v0
.end method

.method public jumpToFinal()V
    .locals 1

    .prologue
    .line 1139
    iget v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    iput v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalWallpaperOffset:F

    .line 1140
    iget v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalVerticalWallpaperOffset:F

    iput v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalWallpaperOffset:F

    .line 1141
    return-void
.end method

.method public setFinalX(F)V
    .locals 2
    .parameter "x"

    .prologue
    .line 1131
    const/4 v0, 0x0

    const/high16 v1, 0x3f80

    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalHorizontalWallpaperOffset:F

    .line 1132
    return-void
.end method

.method public setFinalY(F)V
    .locals 2
    .parameter "y"

    .prologue
    .line 1135
    const/4 v0, 0x0

    const/high16 v1, 0x3f80

    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mFinalVerticalWallpaperOffset:F

    .line 1136
    return-void
.end method

.method public setHorizontalCatchupConstant(F)V
    .locals 0
    .parameter "f"

    .prologue
    .line 1052
    iput p1, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mHorizontalCatchupConstant:F

    .line 1053
    return-void
.end method

.method public setOverrideHorizontalCatchupConstant(Z)V
    .locals 0
    .parameter "override"

    .prologue
    .line 1048
    iput-boolean p1, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mOverrideHorizontalCatchupConstant:Z

    .line 1049
    return-void
.end method

.method public setVerticalCatchupConstant(F)V
    .locals 0
    .parameter "f"

    .prologue
    .line 1056
    iput p1, p0, Lcom/android/launcher2/Workspace$WallpaperOffsetInterpolator;->mVerticalCatchupConstant:F

    .line 1057
    return-void
.end method
