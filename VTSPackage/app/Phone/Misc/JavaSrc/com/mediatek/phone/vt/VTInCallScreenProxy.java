// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.util.Log;
import android.view.*;
import com.android.internal.telephony.Connection;
import com.android.phone.DTMFTwelveKeyDialer;
import com.android.phone.InCallScreen;

// Referenced classes of package com.mediatek.phone.vt:
//            IVTInCallScreen, VTInCallScreen, VTInCallScreenFlags

public class VTInCallScreenProxy
    implements IVTInCallScreen
{

    private static final boolean DBG = true;
    private static final String LOG_TAG = "VTInCallScreenProxy";
    private DTMFTwelveKeyDialer mDialer;
    private InCallScreen mInCallScreen;
    private boolean mIsInflate;
    private boolean mIsLocaleChanged;
    private VTInCallScreen mVTInCallScreen;

    public VTInCallScreenProxy(InCallScreen incallscreen, DTMFTwelveKeyDialer dtmftwelvekeydialer)
    {
        mInCallScreen = incallscreen;
        mDialer = dtmftwelvekeydialer;
    }

    private boolean isInflated()
    {
        return mVTInCallScreen != null && mIsInflate;
    }

    private void log(String s)
    {
        Log.d("VTInCallScreenProxy", s);
    }

    public void dismissVTDialogs()
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.dismissVTDialogs();
            return;
        }
    }

    public com.android.phone.Constants.VTScreenMode getVTScreenMode()
    {
        if (!isInflated())
            return com.android.phone.Constants.VTScreenMode.VT_SCREEN_CLOSE;
        else
            return mVTInCallScreen.getVTScreenMode();
    }

    public boolean handleOnScreenMenuItemClick(MenuItem menuitem)
    {
        if (!isInflated())
            return false;
        else
            return mVTInCallScreen.handleOnScreenMenuItemClick(menuitem);
    }

    public void initCommonVTState()
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.initCommonVTState();
            return;
        }
    }

    public void initDialingSuccessVTState()
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.initDialingSuccessVTState();
            return;
        }
    }

    public void initDialingVTState()
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.initDialingVTState();
            return;
        }
    }

    public void initVTInCallScreen()
    {
        if (mInCallScreen == null)
        {
            log("mInCallScreen is null, just return");
            return;
        }
        if (mIsInflate)
        {
            log("already inflate, just return");
            return;
        }
        ((ViewStub)mInCallScreen.findViewById(0x7f080072)).inflate();
        mVTInCallScreen = (VTInCallScreen)mInCallScreen.findViewById(0x7f08010e);
        mVTInCallScreen.setInCallScreenInstance(mInCallScreen);
        mVTInCallScreen.setDialer(mDialer);
        mVTInCallScreen.initVTInCallScreen();
        if (mIsLocaleChanged)
        {
            mVTInCallScreen.notifyLocaleChange();
            mIsLocaleChanged = false;
        }
        mVTInCallScreen.registerForVTPhoneStates();
        mIsInflate = true;
        VTInCallScreenFlags.getInstance().mVTIsInflate = true;
    }

    public void internalAnswerVTCallPre()
    {
        initVTInCallScreen();
        if (!isInflated())
        {
            log("inflate failed");
            return;
        } else
        {
            mVTInCallScreen.internalAnswerVTCallPre();
            return;
        }
    }

    public void notifyLocaleChange()
    {
        log("NotifyLocaleChange");
        if (!isInflated())
        {
            mIsLocaleChanged = true;
            return;
        } else
        {
            mVTInCallScreen.notifyLocaleChange();
            return;
        }
    }

    public void onDestroy()
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.onDestroy();
            return;
        }
    }

    public boolean onDisconnectVT(Connection connection, int i, boolean flag)
    {
        if (!isInflated())
            return false;
        else
            return mVTInCallScreen.onDisconnectVT(connection, i, flag);
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        log("onKeyDown");
        if (!isInflated())
            return false;
        else
            return mVTInCallScreen.onKeyDown(i, keyevent);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (!isInflated())
            return false;
        else
            return mVTInCallScreen.onOptionsItemSelected(menuitem);
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        log("onPrepareOptionsMenu");
        if (!isInflated())
            return false;
        else
            return mVTInCallScreen.onPrepareOptionsMenu(menu);
    }

    public void onReceiveVTManagerStartCounter()
    {
        log("onReceiveVTManagerStartCounter");
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.onReceiveVTManagerStartCounter();
            return;
        }
    }

    public void onStop()
    {
        log("onStop");
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.onStop();
            return;
        }
    }

    public void refreshAudioModePopup()
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.refreshAudioModePopup();
            return;
        }
    }

    public void resetVTFlags()
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.resetVTFlags();
            return;
        }
    }

    public void setVTScreenMode(com.android.phone.Constants.VTScreenMode vtscreenmode)
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.setVTScreenMode(vtscreenmode);
            return;
        }
    }

    public void setVTVisible(boolean flag)
    {
        if (mVTInCallScreen != null && mIsInflate)
        {
            mVTInCallScreen.setVTVisible(flag);
            return;
        } else
        {
            return;
        }
    }

    public void setupMenuItems(Menu menu)
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.setupMenuItems(menu);
            return;
        }
    }

    public void showReCallDialog(int i, String s, int j)
    {
        log("showReCallDialog");
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.showReCallDialog(i, s, j);
            return;
        }
    }

    public void stopRecord()
    {
        log("stopRecord");
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.stopRecord();
            return;
        }
    }

    public void updateElapsedTime(long l)
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.updateElapsedTime(l);
            return;
        }
    }

    public void updateVTScreen(com.android.phone.Constants.VTScreenMode vtscreenmode)
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.updateVTScreen(vtscreenmode);
            return;
        }
    }

    public void updateVideoCallRecordState(int i)
    {
        if (!isInflated())
        {
            return;
        } else
        {
            mVTInCallScreen.updateVideoCallRecordState(i);
            return;
        }
    }
}
