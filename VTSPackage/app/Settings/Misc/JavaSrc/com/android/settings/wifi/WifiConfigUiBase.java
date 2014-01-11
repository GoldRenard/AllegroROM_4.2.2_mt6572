// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.wifi;

import android.content.Context;
import android.view.LayoutInflater;
import android.widget.Button;

// Referenced classes of package com.android.settings.wifi:
//            WifiConfigController

public interface WifiConfigUiBase
{

    public abstract Button getCancelButton();

    public abstract Context getContext();

    public abstract WifiConfigController getController();

    public abstract Button getForgetButton();

    public abstract LayoutInflater getLayoutInflater();

    public abstract Button getSubmitButton();

    public abstract boolean isEdit();

    public abstract void setCancelButton(CharSequence charsequence);

    public abstract void setForgetButton(CharSequence charsequence);

    public abstract void setSubmitButton(CharSequence charsequence);

    public abstract void setTitle(int i);

    public abstract void setTitle(CharSequence charsequence);
}
