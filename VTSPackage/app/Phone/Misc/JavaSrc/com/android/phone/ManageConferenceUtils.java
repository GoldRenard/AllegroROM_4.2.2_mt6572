// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.os.SystemProperties;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.*;
import com.mediatek.phone.DualTalkUtils;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneUtils, InCallScreen, PhoneGlobals

public class ManageConferenceUtils
{
    private final class QueryCompleteListener
        implements com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener
    {

        private final int mConferencCallListIndex;
        final ManageConferenceUtils this$0;

        public void onQueryComplete(int i, Object obj, CallerInfo callerinfo)
        {
            if (ManageConferenceUtils.DBG)
                log((new StringBuilder()).append("callerinfo query complete, updating UI.").append(callerinfo).toString());
            int j = ((Connection)obj).getNumberPresentation();
            ViewGroup viewgroup = mConferenceCallList[mConferencCallListIndex];
            viewgroup.setVisibility(0);
            displayCallerInfoForConferenceRow(callerinfo, j, (TextView)viewgroup.findViewById(0x7f080022), (TextView)viewgroup.findViewById(0x7f080024), (TextView)viewgroup.findViewById(0x7f080023));
        }

        public QueryCompleteListener(int i)
        {
            this$0 = ManageConferenceUtils.this;
            super();
            mConferencCallListIndex = i;
        }
    }


    private static final boolean DBG = false;
    private static final String LOG_TAG = "ManageConferenceUtils";
    private static final int MAX_CALLERS_IN_CONFERENCE = 5;
    static boolean sLocalChanged = false;
    private Button mButtonHangupAll;
    private Button mButtonManageConferenceDone;
    private CallManager mCM;
    private ViewGroup mCallerContainer;
    private ViewGroup mConferenceCallList[];
    private int mConferenceCallListSize;
    private Chronometer mConferenceTime;
    private InCallScreen mInCallScreen;
    private ViewGroup mManageConferenceHeader;
    private ViewGroup mManageConferencePanel;
    private int mNumCallersInConference;

    public ManageConferenceUtils(InCallScreen incallscreen, CallManager callmanager)
    {
        if (DBG)
            log("ManageConferenceUtils constructor...");
        mInCallScreen = incallscreen;
        mCM = callmanager;
    }

    private void log(String s)
    {
        Log.d("ManageConferenceUtils", s);
    }

    public final void displayCallerInfoForConferenceRow(CallerInfo callerinfo, int i, TextView textview, TextView textview1, TextView textview2)
    {
        String s = "";
        String s1 = "";
        String s2 = "";
        if (callerinfo != null)
        {
            s = callerinfo.name;
            if (TextUtils.isEmpty(s))
            {
                if (TextUtils.isEmpty(callerinfo.phoneNumber))
                    s = PhoneUtils.getPresentationString(mInCallScreen, i);
                else
                if (!TextUtils.isEmpty(callerinfo.cnapName))
                    s = callerinfo.cnapName;
                else
                    s = callerinfo.phoneNumber;
            } else
            {
                s1 = callerinfo.phoneNumber;
                s2 = callerinfo.phoneLabel;
            }
        }
        textview.setText(s);
        if (TextUtils.isEmpty(s1))
        {
            textview2.setVisibility(8);
            textview1.setVisibility(8);
            return;
        } else
        {
            textview2.setVisibility(0);
            textview2.setText(s1);
            textview1.setVisibility(0);
            textview1.setText(s2);
            return;
        }
    }

    public void endConferenceConnection(int i, Connection connection)
    {
        if (DBG)
            log((new StringBuilder()).append("===> ENDING conference connection ").append(i).append(": Connection ").append(connection).toString());
        PhoneUtils.hangup(connection);
    }

    public int getNumCallersInConference()
    {
        return mNumCallersInConference;
    }

    public void initManageConferencePanel()
    {
        if (DBG)
            log("initManageConferencePanel()...");
        if (mManageConferencePanel == null)
        {
            if (DBG)
                log("initManageConferencePanel: first-time initialization!");
            ((ViewStub)mInCallScreen.findViewById(0x7f080071)).inflate();
            mManageConferencePanel = (ViewGroup)mInCallScreen.findViewById(0x7f0800a2);
            if (mManageConferencePanel == null)
                throw new IllegalStateException("Couldn't find manageConferencePanel!");
            mManageConferenceHeader = (ViewGroup)mInCallScreen.findViewById(0x7f0800a5);
            mManageConferenceHeader.setVisibility(8);
            mCallerContainer = (ViewGroup)mInCallScreen.findViewById(0x7f0800a7);
            mConferenceTime = (Chronometer)mInCallScreen.findViewById(0x7f0800a3);
            mConferenceTime.setFormat(mInCallScreen.getString(0x7f0d02b6));
            mConferenceCallList = new ViewGroup[5];
            int ai[] = {
                0x7f0800a8, 0x7f0800a9, 0x7f0800aa, 0x7f0800ab, 0x7f0800ac
            };
            for (int i = 0; i < 5; i++)
                mConferenceCallList[i] = (ViewGroup)mInCallScreen.findViewById(ai[i]);

            mConferenceCallListSize = 5;
            mButtonManageConferenceDone = (Button)mInCallScreen.findViewById(0x7f0800ad);
            mButtonManageConferenceDone.setOnClickListener(mInCallScreen);
        }
    }

    public void separateConferenceConnection(int i, Connection connection)
    {
        if (DBG)
            log((new StringBuilder()).append("===> SEPARATING conference connection ").append(i).append(": Connection ").append(connection).toString());
        PhoneUtils.separateCall(connection);
    }

    public void setPanelVisible(boolean flag)
    {
        if (mManageConferencePanel != null)
        {
            ViewGroup viewgroup = mManageConferencePanel;
            byte byte0;
            if (flag)
                byte0 = 0;
            else
                byte0 = 8;
            viewgroup.setVisibility(byte0);
        }
    }

    public void startConferenceTime(long l)
    {
        if (mConferenceTime != null)
        {
            mConferenceTime.setBase(l);
            mConferenceTime.start();
        }
    }

    public void stopConferenceTime()
    {
        if (mConferenceTime != null)
            mConferenceTime.stop();
    }

    public void updateManageConferencePanel(List list)
    {
        mNumCallersInConference = list.size();
        if (DBG)
            log((new StringBuilder()).append("updateManageConferencePanel()... num connections in conference = ").append(mNumCallersInConference).toString());
        boolean flag = mCM.hasActiveFgCall();
        boolean flag1 = mCM.hasActiveBgCall();
        boolean flag2;
        if (flag && flag1)
            flag2 = false;
        else
            flag2 = true;
        if (DualTalkUtils.isSupportDualTalk() && !flag2)
            flag2 = mInCallScreen.mDualTalk.canSplitCallFromConference();
        if (mNumCallersInConference > mConferenceCallListSize)
        {
            ViewGroup aviewgroup[] = mConferenceCallList;
            LayoutInflater layoutinflater = LayoutInflater.from(mInCallScreen);
            mConferenceCallList = new ViewGroup[mNumCallersInConference];
            int j = aviewgroup.length;
            int k = 0;
            int l;
            int j1;
            for (l = 0; k < j; l = j1)
            {
                ViewGroup viewgroup = aviewgroup[k];
                ViewGroup aviewgroup1[] = mConferenceCallList;
                j1 = l + 1;
                aviewgroup1[l] = viewgroup;
                k++;
            }

            for (int i1 = l; i1 < mNumCallersInConference; i1++)
            {
                mConferenceCallList[i1] = (ViewGroup)layoutinflater.inflate(0x7f04000b, null);
                mCallerContainer.addView(mConferenceCallList[i1]);
            }

            mCallerContainer.requestLayout();
            mConferenceCallListSize = mNumCallersInConference;
            log((new StringBuilder()).append("mConferenceCallList = ").append(mConferenceCallList).toString());
        }
        for (int i = 0; i < mConferenceCallListSize; i++)
            if (i < mNumCallersInConference)
            {
                Connection connection = (Connection)list.get(i);
                if (sLocalChanged)
                    connection.clearUserData();
                updateManageConferenceRow(i, connection, flag2);
            } else
            {
                updateManageConferenceRow(i, null, false);
            }

        if (sLocalChanged)
            sLocalChanged = false;
    }

    public void updateManageConferenceRow(final int i, final Connection connection, boolean flag)
    {
        if (DBG)
            log((new StringBuilder()).append("updateManageConferenceRow(").append(i).append(")...  connection = ").append(connection).toString());
        if (connection != null)
        {
            mConferenceCallList[i].setVisibility(0);
            View view = mConferenceCallList[i].findViewById(0x7f080025);
            View view1 = mConferenceCallList[i].findViewById(0x7f080020);
            TextView textview = (TextView)mConferenceCallList[i].findViewById(0x7f080022);
            TextView textview1 = (TextView)mConferenceCallList[i].findViewById(0x7f080023);
            TextView textview2 = (TextView)mConferenceCallList[i].findViewById(0x7f080024);
            ImageView imageview = (ImageView)mConferenceCallList[i].findViewById(0x7f080021);
            if (DBG)
                log((new StringBuilder()).append("- button: ").append(view).append(", nameTextView: ").append(textview).toString());
            view.setOnClickListener(new android.view.View.OnClickListener() {

                final ManageConferenceUtils this$0;
                final Connection val$connection;
                final int val$i;

                public void onClick(View view2)
                {
                    endConferenceConnection(i, connection);
                    PhoneGlobals.getInstance().pokeUserActivity();
                }

            
            {
                this$0 = ManageConferenceUtils.this;
                i = j;
                connection = connection1;
                super();
            }
            }
);
            if (flag)
            {
                android.view.View.OnClickListener onclicklistener = new android.view.View.OnClickListener() {

                    final ManageConferenceUtils this$0;
                    final Connection val$connection;
                    final int val$i;

                    public void onClick(View view2)
                    {
                        separateConferenceConnection(i, connection);
                        PhoneGlobals.getInstance().pokeUserActivity();
                    }

            
            {
                this$0 = ManageConferenceUtils.this;
                i = j;
                connection = connection1;
                super();
            }
                }
;
                view1.setClickable(true);
                view1.setOnClickListener(onclicklistener);
                view1.setVisibility(0);
                imageview.setEnabled(true);
            } else
            {
                view1.setClickable(false);
                imageview.setEnabled(false);
            }
            QueryCompleteListener querycompletelistener = new QueryCompleteListener(i);
            PhoneUtils.CallerInfoToken callerinfotoken = PhoneUtils.startGetCallerInfo(mInCallScreen, connection, querycompletelistener, connection);
            if (DBG)
                log((new StringBuilder()).append("  - got info from startGetCallerInfo(): ").append(callerinfotoken).toString());
            displayCallerInfoForConferenceRow(callerinfotoken.currentInfo, connection.getNumberPresentation(), textview, textview2, textview1);
            return;
        } else
        {
            mConferenceCallList[i].setVisibility(8);
            return;
        }
    }

    static 
    {
        boolean flag = true;
        if (SystemProperties.getInt("ro.debuggable", 0) != flag)
            flag = false;
        DBG = flag;
    }



}
