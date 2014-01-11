// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.view.*;
import com.android.internal.telephony.Connection;

public interface IVTInCallScreen
{

    public abstract void dismissVTDialogs();

    public abstract com.android.phone.Constants.VTScreenMode getVTScreenMode();

    public abstract boolean handleOnScreenMenuItemClick(MenuItem menuitem);

    public abstract void initCommonVTState();

    public abstract void initDialingSuccessVTState();

    public abstract void initDialingVTState();

    public abstract void initVTInCallScreen();

    public abstract void internalAnswerVTCallPre();

    public abstract void notifyLocaleChange();

    public abstract void onDestroy();

    public abstract boolean onDisconnectVT(Connection connection, int i, boolean flag);

    public abstract boolean onKeyDown(int i, KeyEvent keyevent);

    public abstract boolean onOptionsItemSelected(MenuItem menuitem);

    public abstract boolean onPrepareOptionsMenu(Menu menu);

    public abstract void onReceiveVTManagerStartCounter();

    public abstract void onStop();

    public abstract void refreshAudioModePopup();

    public abstract void resetVTFlags();

    public abstract void setVTScreenMode(com.android.phone.Constants.VTScreenMode vtscreenmode);

    public abstract void setVTVisible(boolean flag);

    public abstract void setupMenuItems(Menu menu);

    public abstract void showReCallDialog(int i, String s, int j);

    public abstract void stopRecord();

    public abstract void updateElapsedTime(long l);

    public abstract void updateVTScreen(com.android.phone.Constants.VTScreenMode vtscreenmode);

    public abstract void updateVideoCallRecordState(int i);
}
