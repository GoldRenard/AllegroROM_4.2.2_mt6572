// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActionBar;
import android.content.Intent;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemProperties;
import android.util.Log;
import android.view.*;
import android.widget.ListView;
import android.widget.Toast;
import com.android.internal.telephony.IccCard;
import com.android.internal.telephony.gemini.GeminiPhone;

// Referenced classes of package com.android.phone:
//            ADNList, EditFdnContactScreen, PhoneGlobals, DeleteFdnContactScreen

public class FdnList extends ADNList
{

    private static final String INTENT_EXTRA_ADD = "addcontact";
    private static final String INTENT_EXTRA_INDEX = "index";
    private static final String INTENT_EXTRA_NAME = "name";
    private static final String INTENT_EXTRA_NUMBER = "number";
    private static final int MENU_ADD = 1;
    private static final int MENU_DELETE = 3;
    private static final int MENU_EDIT = 2;


    private void addContact()
    {
        Intent intent = new Intent();
        intent.setClass(this, com/android/phone/EditFdnContactScreen);
        intent.putExtra("addcontact", true);
        intent.putExtra("simId", super.mSimId);
        startActivity(intent);
    }

    private void checkPhoneBookState()
    {
        if (!((GeminiPhone)PhoneGlobals.getPhone()).getIccCardGemini(super.mSimId).isPhbReady())
        {
            showTipToast(getString(0x7f0d00cc), getString(0x7f0d0086));
            finish();
        }
    }

    private void deleteSelected()
    {
        if (super.mCursor.moveToPosition(getSelectedItemPosition()))
        {
            String s = super.mCursor.getString(0);
            String s1 = super.mCursor.getString(1);
            String s2 = super.mCursor.getString(2);
            Intent intent = new Intent();
            intent.setClass(this, com/android/phone/DeleteFdnContactScreen);
            intent.putExtra("index", s);
            intent.putExtra("name", s1);
            intent.putExtra("number", s2);
            intent.putExtra("simId", super.mSimId);
            startActivity(intent);
        }
    }

    private void editSelected()
    {
        editSelected(getSelectedItemPosition());
    }

    private void editSelected(int i)
    {
        if (super.mCursor.moveToPosition(i))
        {
            String s = super.mCursor.getString(0);
            String s1 = super.mCursor.getString(1);
            String s2 = super.mCursor.getString(2);
            Intent intent = new Intent();
            intent.setClass(this, com/android/phone/EditFdnContactScreen);
            intent.putExtra("index", s);
            intent.putExtra("name", s1);
            intent.putExtra("number", s2);
            intent.putExtra("addcontact", false);
            intent.putExtra("simId", super.mSimId);
            startActivity(intent);
        }
    }

    private int getRetryPin2()
    {
        String s;
        switch (super.mSimId)
        {
        case 3: // '\003'
            s = "gsm.sim.retry.pin2.4";
            break;

        case 2: // '\002'
            s = "gsm.sim.retry.pin2.3";
            break;

        case 1: // '\001'
            s = "gsm.sim.retry.pin2.2";
            break;

        case 0: // '\0'
            s = "gsm.sim.retry.pin2";
            break;

        default:
            Log.d("FdnList", (new StringBuilder()).append("Error happened mSimId=").append(super.mSimId).toString());
            s = "gsm.sim.retry.pin2";
            break;
        }
        return SystemProperties.getInt(s, -1);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
        super.mSimId = getIntent().getIntExtra("simId", -1);
        Log.i("FdnList", (new StringBuilder()).append("Sim id ").append(super.mSimId).toString());
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        super.onCreateOptionsMenu(menu);
        Resources resources = getResources();
        menu.add(0, 1, 0, resources.getString(0x7f0d0280)).setIcon(0x1080033);
        menu.add(0, 2, 0, resources.getString(0x7f0d0281)).setIcon(0x108003e);
        menu.add(0, 3, 0, resources.getString(0x7f0d0282)).setIcon(0x108003c);
        return true;
    }

    public void onListItemClick(ListView listview, View view, int i, long l)
    {
        editSelected(i);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 3: // '\003'
            deleteSelected();
            return true;

        case 2: // '\002'
            editSelected();
            return true;

        case 1: // '\001'
            addContact();
            return true;

        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        super.onPrepareOptionsMenu(menu);
        boolean flag;
        if (getSelectedItemPosition() >= 0)
            flag = true;
        else
            flag = false;
        menu.findItem(1).setVisible(true);
        menu.findItem(2).setVisible(flag);
        menu.findItem(3).setVisible(flag);
        return true;
    }

    protected void onResume()
    {
        super.onResume();
        checkPhoneBookState();
        if (getRetryPin2() == 0)
            finish();
    }

    protected Uri resolveIntent()
    {
        Intent intent = getIntent();
        String s;
        switch (super.mSimId)
        {
        case 3: // '\003'
            s = "content://icc/fdn4";
            break;

        case 2: // '\002'
            s = "content://icc/fdn3";
            break;

        case 1: // '\001'
            s = "content://icc/fdn2";
            break;

        case 0: // '\0'
            s = "content://icc/fdn1";
            break;

        default:
            Log.d("FdnList", (new StringBuilder()).append("Error happened mSimId=").append(super.mSimId).toString());
            s = "content://icc/fdn1";
            break;
        }
        intent.setData(Uri.parse(s));
        return intent.getData();
    }

    public void showTipToast(String s, String s1)
    {
        Toast.makeText(this, s1, 1).show();
    }
}
