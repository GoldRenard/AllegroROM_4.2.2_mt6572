// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ActivityManager;
import android.content.*;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.*;
import android.telephony.*;
import android.text.TextUtils;
import android.util.Log;
import android.util.Slog;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.phone.DualTalkUtils;
import java.util.*;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, InCallScreen, PhoneUtils, CallNotifier, 
//            NotificationMgr

public class PhoneInterfaceManager extends com.android.internal.telephony.ITelephony.Stub
{
    private static final class IccAPDUArgument
    {

        public int channel;
        public int cla;
        public int command;
        public String data;
        public int p1;
        public int p2;
        public int p3;

        public IccAPDUArgument(int i, int j, int k, int l, int i1, int j1, String s)
        {
            channel = k;
            cla = i;
            command = j;
            p1 = l;
            p2 = i1;
            p3 = j1;
            data = s;
        }
    }

    private final class MainThreadHandler extends Handler
    {

        final PhoneInterfaceManager this$0;

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 1 49: default 216
        //                       1 245
        //                       2 359
        //                       3 431
        //                       4 511
        //                       5 527
        //                       6 519
        //                       7 646
        //                       8 853
        //                       9 1787
        //                       10 1871
        //                       11 2406
        //                       12 2453
        //                       13 3011
        //                       14 3061
        //                       15 1183
        //                       16 1262
        //                       17 3506
        //                       18 3541
        //                       19 2021
        //                       20 2107
        //                       21 2641
        //                       22 2690
        //                       23 3200
        //                       24 3252
        //                       25 1412
        //                       26 1493
        //                       27 3626
        //                       28 3663
        //                       29 2193
        //                       30 2193
        //                       31 861
        //                       32 927
        //                       33 1033
        //                       34 1105
        //                       35 216
        //                       36 2739
        //                       37 2739
        //                       38 3304
        //                       39 3304
        //                       40 1574
        //                       41 1574
        //                       42 3700
        //                       43 3700
        //                       44 3827
        //                       45 3989
        //                       46 4045
        //                       47 3881
        //                       48 4101
        //                       49 4101;
               goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L19 _L20 _L21 _L22 _L23 _L24 _L25 _L26 _L27 _L28 _L29 _L30 _L30 _L31 _L32 _L33 _L34 _L1 _L35 _L35 _L36 _L36 _L37 _L37 _L38 _L38 _L39 _L40 _L41 _L42 _L43 _L43
_L1:
            Log.w("PhoneInterfaceManager", (new StringBuilder()).append("MainThreadHandler: unexpected message code: ").append(message.what).toString());
_L45:
            return;
_L2:
            MainThreadRequest mainthreadrequest35 = (MainThreadRequest)message.obj;
            PinMmiGemini pinmmigemini = (PinMmiGemini)mainthreadrequest35.argument;
            Exception exception17;
            if (pinmmigemini.simId.intValue() != -1)
                mainthreadrequest35.result = Boolean.valueOf(((GeminiPhone)mPhone).handlePinMmiGemini(pinmmigemini.dialString, pinmmigemini.simId.intValue()));
            else
                mainthreadrequest35.result = Boolean.valueOf(((GeminiPhone)mPhone).handlePinMmi(pinmmigemini.dialString));
            mainthreadrequest35;
            JVM INSTR monitorenter ;
            mainthreadrequest35.notifyAll();
            mainthreadrequest35;
            JVM INSTR monitorexit ;
            return;
            exception17;
            mainthreadrequest35;
            JVM INSTR monitorexit ;
            throw exception17;
_L3:
            MainThreadRequest mainthreadrequest34 = (MainThreadRequest)message.obj;
            Message message21 = obtainMessage(3, mainthreadrequest34);
            if (mainthreadrequest34.argument == null)
            {
                mPhone.getNeighboringCids(message21);
                return;
            } else
            {
                Integer integer = (Integer)mainthreadrequest34.argument;
                ((GeminiPhone)mPhone).getNeighboringCidsGemini(message21, integer.intValue());
                return;
            }
_L4:
            AsyncResult asyncresult14 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest33 = (MainThreadRequest)asyncresult14.userObj;
            Exception exception16;
            if (asyncresult14.exception == null && asyncresult14.result != null)
                mainthreadrequest33.result = asyncresult14.result;
            else
                mainthreadrequest33.result = new ArrayList();
            mainthreadrequest33;
            JVM INSTR monitorenter ;
            mainthreadrequest33.notifyAll();
            mainthreadrequest33;
            JVM INSTR monitorexit ;
            return;
            exception16;
            mainthreadrequest33;
            JVM INSTR monitorexit ;
            throw exception16;
_L5:
            answerRingingCallInternal();
            return;
_L7:
            silenceRingerInternal();
            return;
_L6:
            MainThreadRequest mainthreadrequest32 = (MainThreadRequest)message.obj;
            CallManager callmanager = mCM;
            boolean flag1 = false;
            if (callmanager != null)
            {
                flag1 = PhoneUtils.hangup(mCM);
                PhoneInterfaceManager phoneinterfacemanager1 = PhoneInterfaceManager.this;
                StringBuilder stringbuilder1 = (new StringBuilder()).append("CMD_END_CALL: ");
                Exception exception15;
                String s1;
                if (flag1)
                    s1 = "hung up!";
                else
                    s1 = "no call to hang up";
                phoneinterfacemanager1.log(stringbuilder1.append(s1).toString());
            }
            mainthreadrequest32.result = Boolean.valueOf(flag1);
            mainthreadrequest32;
            JVM INSTR monitorenter ;
            mainthreadrequest32.notifyAll();
            mainthreadrequest32;
            JVM INSTR monitorexit ;
            return;
            exception15;
            mainthreadrequest32;
            JVM INSTR monitorexit ;
            throw exception15;
_L8:
            MainThreadRequest mainthreadrequest31 = (MainThreadRequest)message.obj;
            int j = message.arg1;
            log((new StringBuilder()).append("CMD_END_CALL_GEMINI: msg.arg1").append(j).toString());
            int k = ((GeminiPhone)mPhone).getPhoneTypeGemini(j);
            boolean flag;
            PhoneInterfaceManager phoneinterfacemanager;
            StringBuilder stringbuilder;
            String s;
            Exception exception14;
            if (k == 2)
                flag = PhoneUtils.hangupRingingAndActive(mPhone);
            else
            if (k == 1)
                flag = PhoneUtils.hangup(mCM);
            else
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(k).toString());
            phoneinterfacemanager = PhoneInterfaceManager.this;
            stringbuilder = (new StringBuilder()).append("CMD_END_CALL_GEMINI: ");
            if (flag)
                s = "hung up!";
            else
                s = "no call to hang up";
            phoneinterfacemanager.log(stringbuilder.append(s).toString());
            mainthreadrequest31.result = Boolean.valueOf(flag);
            mainthreadrequest31;
            JVM INSTR monitorenter ;
            mainthreadrequest31.notifyAll();
            mainthreadrequest31;
            JVM INSTR monitorexit ;
            return;
            exception14;
            mainthreadrequest31;
            JVM INSTR monitorexit ;
            throw exception14;
_L9:
            answerRingingCallInternal();
            return;
_L31:
            MainThreadRequest mainthreadrequest30;
            Message message20;
            mainthreadrequest30 = (MainThreadRequest)message.obj;
            message20 = obtainMessage(32, mainthreadrequest30);
            if (mainthreadrequest30.argument == null) goto _L45; else goto _L44
_L44:
            int i = ((ScAddrGemini)mainthreadrequest30.argument).simId;
            Log.d("PhoneInterfaceManager", "[sca get sc gemini");
            ((GeminiPhone)mPhone).getSmscAddressGemini(message20, i);
            return;
_L32:
            AsyncResult asyncresult13;
            MainThreadRequest mainthreadrequest29;
            asyncresult13 = (AsyncResult)message.obj;
            mainthreadrequest29 = (MainThreadRequest)asyncresult13.userObj;
            if (asyncresult13.exception != null || asyncresult13.result == null) goto _L47; else goto _L46
_L46:
            Log.d("PhoneInterfaceManager", "[sca get result");
            mainthreadrequest29.result = asyncresult13.result;
_L48:
            mainthreadrequest29;
            JVM INSTR monitorenter ;
            Log.d("PhoneInterfaceManager", "[sca notify sleep thread");
            mainthreadrequest29.notifyAll();
            mainthreadrequest29;
            JVM INSTR monitorexit ;
            return;
            Exception exception13;
            exception13;
            mainthreadrequest29;
            JVM INSTR monitorexit ;
            throw exception13;
_L47:
            Log.d("PhoneInterfaceManager", "[sca Fail to get sc address");
            mainthreadrequest29.result = new String("");
              goto _L48
_L33:
            Message message19;
            ScAddrGemini scaddrgemini;
            MainThreadRequest mainthreadrequest28 = (MainThreadRequest)message.obj;
            message19 = obtainMessage(34, mainthreadrequest28);
            scaddrgemini = (ScAddrGemini)mainthreadrequest28.argument;
            if (scaddrgemini.simId == -1) goto _L45; else goto _L49
_L49:
            Log.d("PhoneInterfaceManager", "[sca set sc gemini");
            ((GeminiPhone)mPhone).setSmscAddressGemini(scaddrgemini.scAddr, message19, scaddrgemini.simId);
            return;
_L34:
            AsyncResult asyncresult12 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest27 = (MainThreadRequest)asyncresult12.userObj;
            Exception exception12;
            if (asyncresult12.exception != null)
                Log.d("PhoneInterfaceManager", "[sca Fail: set sc address");
            else
                Log.d("PhoneInterfaceManager", "[sca Done: set sc address");
            mainthreadrequest27.result = new Object();
            mainthreadrequest27;
            JVM INSTR monitorenter ;
            mainthreadrequest27.notifyAll();
            mainthreadrequest27;
            JVM INSTR monitorexit ;
            return;
            exception12;
            mainthreadrequest27;
            JVM INSTR monitorexit ;
            throw exception12;
_L16:
            MainThreadRequest mainthreadrequest26 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument8 = (IccAPDUArgument)mainthreadrequest26.argument;
            Message message18 = obtainMessage(16, mainthreadrequest26);
            mPhone.getIccCard().exchangeSimIO(iccapduargument8.cla, iccapduargument8.command, iccapduargument8.p1, iccapduargument8.p2, iccapduargument8.p3, iccapduargument8.data, message18);
            return;
_L17:
            AsyncResult asyncresult11 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest25 = (MainThreadRequest)asyncresult11.userObj;
            Exception exception11;
            if (asyncresult11.exception == null && asyncresult11.result != null)
            {
                mainthreadrequest25.result = asyncresult11.result;
                lastError = 0;
            } else
            {
                mainthreadrequest25.result = new IccIoResult(111, 0, (byte[])null);
                lastError = 1;
                if (asyncresult11.exception != null && (asyncresult11.exception instanceof CommandException) && ((CommandException)asyncresult11.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.INVALID_PARAMETER)
                    lastError = 5;
            }
            mainthreadrequest25;
            JVM INSTR monitorenter ;
            mainthreadrequest25.notifyAll();
            mainthreadrequest25;
            JVM INSTR monitorexit ;
            return;
            exception11;
            mainthreadrequest25;
            JVM INSTR monitorexit ;
            throw exception11;
_L26:
            MainThreadRequest mainthreadrequest24 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument7 = (IccAPDUArgument)mainthreadrequest24.argument;
            Message message17 = obtainMessage(40, mainthreadrequest24);
            ((GeminiPhone)mPhone).getIccCardGemini(0).exchangeSimIO(iccapduargument7.cla, iccapduargument7.command, iccapduargument7.p1, iccapduargument7.p2, iccapduargument7.p3, iccapduargument7.data, message17);
            return;
_L27:
            MainThreadRequest mainthreadrequest23 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument6 = (IccAPDUArgument)mainthreadrequest23.argument;
            Message message16 = obtainMessage(41, mainthreadrequest23);
            ((GeminiPhone)mPhone).getIccCardGemini(1).exchangeSimIO(iccapduargument6.cla, iccapduargument6.command, iccapduargument6.p1, iccapduargument6.p2, iccapduargument6.p3, iccapduargument6.data, message16);
            return;
_L37:
            AsyncResult asyncresult10 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest22 = (MainThreadRequest)asyncresult10.userObj;
            if (asyncresult10.exception == null && asyncresult10.result != null)
            {
                mainthreadrequest22.result = asyncresult10.result;
                Exception exception10;
                if (message.what == 40)
                    lastError1 = 0;
                else
                    lastError2 = 0;
            } else
            {
                mainthreadrequest22.result = new IccIoResult(111, 0, (byte[])null);
                if (message.what == 40)
                    lastError1 = 1;
                else
                    lastError2 = 1;
                if (asyncresult10.exception != null && (asyncresult10.exception instanceof CommandException) && ((CommandException)asyncresult10.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.INVALID_PARAMETER)
                    if (message.what == 40)
                        lastError1 = 5;
                    else
                        lastError2 = 5;
            }
            mainthreadrequest22;
            JVM INSTR monitorenter ;
            mainthreadrequest22.notifyAll();
            mainthreadrequest22;
            JVM INSTR monitorexit ;
            return;
            exception10;
            mainthreadrequest22;
            JVM INSTR monitorexit ;
            throw exception10;
_L10:
            MainThreadRequest mainthreadrequest21 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument5 = (IccAPDUArgument)mainthreadrequest21.argument;
            Message message15 = obtainMessage(10, mainthreadrequest21);
            mPhone.getIccCard().exchangeAPDU(iccapduargument5.cla, iccapduargument5.command, iccapduargument5.channel, iccapduargument5.p1, iccapduargument5.p2, iccapduargument5.p3, iccapduargument5.data, message15);
            return;
_L11:
            AsyncResult asyncresult9 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest20 = (MainThreadRequest)asyncresult9.userObj;
            Exception exception9;
            if (asyncresult9.exception == null && asyncresult9.result != null)
            {
                mainthreadrequest20.result = asyncresult9.result;
                lastError = 0;
            } else
            {
                mainthreadrequest20.result = new IccIoResult(111, 0, (byte[])null);
                lastError = 1;
                if (asyncresult9.exception != null && (asyncresult9.exception instanceof CommandException) && ((CommandException)asyncresult9.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.INVALID_PARAMETER)
                    lastError = 5;
            }
            mainthreadrequest20;
            JVM INSTR monitorenter ;
            mainthreadrequest20.notifyAll();
            mainthreadrequest20;
            JVM INSTR monitorexit ;
            return;
            exception9;
            mainthreadrequest20;
            JVM INSTR monitorexit ;
            throw exception9;
_L20:
            MainThreadRequest mainthreadrequest19 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument4 = (IccAPDUArgument)mainthreadrequest19.argument;
            Message message14 = obtainMessage(29, mainthreadrequest19);
            ((GeminiPhone)mPhone).getIccCardGemini(0).exchangeAPDU(iccapduargument4.cla, iccapduargument4.command, iccapduargument4.channel, iccapduargument4.p1, iccapduargument4.p2, iccapduargument4.p3, iccapduargument4.data, message14);
            return;
_L21:
            MainThreadRequest mainthreadrequest18 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument3 = (IccAPDUArgument)mainthreadrequest18.argument;
            Message message13 = obtainMessage(30, mainthreadrequest18);
            ((GeminiPhone)mPhone).getIccCardGemini(1).exchangeAPDU(iccapduargument3.cla, iccapduargument3.command, iccapduargument3.channel, iccapduargument3.p1, iccapduargument3.p2, iccapduargument3.p3, iccapduargument3.data, message13);
            return;
_L30:
            AsyncResult asyncresult8 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest17 = (MainThreadRequest)asyncresult8.userObj;
            if (asyncresult8.exception == null && asyncresult8.result != null)
            {
                mainthreadrequest17.result = asyncresult8.result;
                Exception exception8;
                if (message.what == 29)
                    lastError1 = 0;
                else
                    lastError2 = 0;
            } else
            {
                mainthreadrequest17.result = new IccIoResult(111, 0, (byte[])null);
                if (message.what == 29)
                    lastError1 = 1;
                else
                    lastError2 = 1;
                if (asyncresult8.exception != null && (asyncresult8.exception instanceof CommandException) && ((CommandException)asyncresult8.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.INVALID_PARAMETER)
                    if (message.what == 29)
                        lastError1 = 5;
                    else
                        lastError2 = 5;
            }
            mainthreadrequest17;
            JVM INSTR monitorenter ;
            mainthreadrequest17.notifyAll();
            mainthreadrequest17;
            JVM INSTR monitorexit ;
            return;
            exception8;
            mainthreadrequest17;
            JVM INSTR monitorexit ;
            throw exception8;
_L12:
            MainThreadRequest mainthreadrequest16 = (MainThreadRequest)message.obj;
            Message message12 = obtainMessage(12, mainthreadrequest16);
            mPhone.getIccCard().openLogicalChannel((String)mainthreadrequest16.argument, message12);
            return;
_L13:
            AsyncResult asyncresult7 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest15 = (MainThreadRequest)asyncresult7.userObj;
            Exception exception7;
            if (asyncresult7.exception == null && asyncresult7.result != null)
            {
                mainthreadrequest15.result = new Integer(((int[])(int[])asyncresult7.result)[0]);
                lastError = 0;
            } else
            {
                mainthreadrequest15.result = new Integer(0);
                lastError = 1;
                if (asyncresult7.exception != null && (asyncresult7.exception instanceof CommandException))
                    if (((CommandException)asyncresult7.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.MISSING_RESOURCE)
                        lastError = 2;
                    else
                    if (((CommandException)asyncresult7.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.NO_SUCH_ELEMENT)
                        lastError = 3;
            }
            mainthreadrequest15;
            JVM INSTR monitorenter ;
            mainthreadrequest15.notifyAll();
            mainthreadrequest15;
            JVM INSTR monitorexit ;
            return;
            exception7;
            mainthreadrequest15;
            JVM INSTR monitorexit ;
            throw exception7;
_L22:
            MainThreadRequest mainthreadrequest14 = (MainThreadRequest)message.obj;
            Message message11 = obtainMessage(36, mainthreadrequest14);
            ((GeminiPhone)mPhone).getIccCardGemini(0).openLogicalChannel((String)mainthreadrequest14.argument, message11);
            return;
_L23:
            MainThreadRequest mainthreadrequest13 = (MainThreadRequest)message.obj;
            Message message10 = obtainMessage(37, mainthreadrequest13);
            ((GeminiPhone)mPhone).getIccCardGemini(1).openLogicalChannel((String)mainthreadrequest13.argument, message10);
            return;
_L35:
            AsyncResult asyncresult6 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest12 = (MainThreadRequest)asyncresult6.userObj;
            if (asyncresult6.exception == null && asyncresult6.result != null)
            {
                mainthreadrequest12.result = new Integer(((int[])(int[])asyncresult6.result)[0]);
                Exception exception6;
                if (message.what == 36)
                    lastError1 = 0;
                else
                    lastError2 = 0;
            } else
            {
                mainthreadrequest12.result = new Integer(0);
                if (message.what == 36)
                    lastError1 = 1;
                else
                    lastError2 = 1;
                if (asyncresult6.exception != null && (asyncresult6.exception instanceof CommandException))
                    if (((CommandException)asyncresult6.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.MISSING_RESOURCE)
                    {
                        if (message.what == 36)
                            lastError1 = 2;
                        else
                            lastError2 = 2;
                    } else
                    if (((CommandException)asyncresult6.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.NO_SUCH_ELEMENT)
                        if (message.what == 36)
                            lastError1 = 3;
                        else
                            lastError2 = 3;
            }
            mainthreadrequest12;
            JVM INSTR monitorenter ;
            mainthreadrequest12.notifyAll();
            mainthreadrequest12;
            JVM INSTR monitorexit ;
            return;
            exception6;
            mainthreadrequest12;
            JVM INSTR monitorexit ;
            throw exception6;
_L14:
            MainThreadRequest mainthreadrequest11 = (MainThreadRequest)message.obj;
            Message message9 = obtainMessage(14, mainthreadrequest11);
            mPhone.getIccCard().closeLogicalChannel(((Integer)mainthreadrequest11.argument).intValue(), message9);
            return;
_L15:
            AsyncResult asyncresult5 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest10 = (MainThreadRequest)asyncresult5.userObj;
            Exception exception5;
            if (asyncresult5.exception == null)
            {
                mainthreadrequest10.result = new Integer(0);
                lastError = 0;
            } else
            {
                mainthreadrequest10.result = new Integer(-1);
                lastError = 1;
                if (asyncresult5.exception != null && (asyncresult5.exception instanceof CommandException) && ((CommandException)asyncresult5.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.INVALID_PARAMETER)
                    lastError = 5;
            }
            mainthreadrequest10;
            JVM INSTR monitorenter ;
            mainthreadrequest10.notifyAll();
            mainthreadrequest10;
            JVM INSTR monitorexit ;
            return;
            exception5;
            mainthreadrequest10;
            JVM INSTR monitorexit ;
            throw exception5;
_L24:
            MainThreadRequest mainthreadrequest9 = (MainThreadRequest)message.obj;
            Message message8 = obtainMessage(38, mainthreadrequest9);
            ((GeminiPhone)mPhone).getIccCardGemini(0).closeLogicalChannel(((Integer)mainthreadrequest9.argument).intValue(), message8);
            return;
_L25:
            MainThreadRequest mainthreadrequest8 = (MainThreadRequest)message.obj;
            Message message7 = obtainMessage(39, mainthreadrequest8);
            ((GeminiPhone)mPhone).getIccCardGemini(1).closeLogicalChannel(((Integer)mainthreadrequest8.argument).intValue(), message7);
            return;
_L36:
            AsyncResult asyncresult4 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest7 = (MainThreadRequest)asyncresult4.userObj;
            if (asyncresult4.exception == null)
            {
                mainthreadrequest7.result = new Integer(0);
                Exception exception4;
                if (message.what == 38)
                    lastError1 = 0;
                else
                    lastError2 = 0;
            } else
            {
                mainthreadrequest7.result = new Integer(-1);
                if (message.what == 38)
                    lastError1 = 1;
                else
                    lastError2 = 1;
                if (asyncresult4.exception != null && (asyncresult4.exception instanceof CommandException) && ((CommandException)asyncresult4.exception).getCommandError() == com.android.internal.telephony.CommandException.Error.INVALID_PARAMETER)
                    if (message.what == 38)
                        lastError1 = 5;
                    else
                        lastError2 = 5;
            }
            mainthreadrequest7;
            JVM INSTR monitorenter ;
            mainthreadrequest7.notifyAll();
            mainthreadrequest7;
            JVM INSTR monitorexit ;
            return;
            exception4;
            mainthreadrequest7;
            JVM INSTR monitorexit ;
            throw exception4;
_L18:
            Message message6 = obtainMessage(18, (MainThreadRequest)message.obj);
            mPhone.getIccCard().iccGetATR(message6);
            return;
_L19:
            AsyncResult asyncresult3 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest6 = (MainThreadRequest)asyncresult3.userObj;
            Exception exception3;
            if (asyncresult3.exception == null)
            {
                mainthreadrequest6.result = asyncresult3.result;
                lastError = 0;
            } else
            {
                mainthreadrequest6.result = "";
                lastError = 1;
            }
            mainthreadrequest6;
            JVM INSTR monitorenter ;
            mainthreadrequest6.notifyAll();
            mainthreadrequest6;
            JVM INSTR monitorexit ;
            return;
            exception3;
            mainthreadrequest6;
            JVM INSTR monitorexit ;
            throw exception3;
_L28:
            Message message5 = obtainMessage(42, (MainThreadRequest)message.obj);
            ((GeminiPhone)mPhone).getIccCardGemini(0).iccGetATR(message5);
            return;
_L29:
            Message message4 = obtainMessage(43, (MainThreadRequest)message.obj);
            ((GeminiPhone)mPhone).getIccCardGemini(1).iccGetATR(message4);
            return;
_L38:
            AsyncResult asyncresult2 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest5 = (MainThreadRequest)asyncresult2.userObj;
            if (asyncresult2.exception == null)
            {
                mainthreadrequest5.result = asyncresult2.result;
                Exception exception2;
                if (message.what == 42)
                    lastError1 = 0;
                else
                    lastError2 = 0;
            } else
            {
                mainthreadrequest5.result = "";
                if (message.what == 42)
                    lastError1 = 1;
                else
                    lastError2 = 1;
            }
            mainthreadrequest5;
            JVM INSTR monitorenter ;
            mainthreadrequest5.notifyAll();
            mainthreadrequest5;
            JVM INSTR monitorexit ;
            return;
            exception2;
            mainthreadrequest5;
            JVM INSTR monitorexit ;
            throw exception2;
_L39:
            MainThreadRequest mainthreadrequest4 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument2 = (IccAPDUArgument)mainthreadrequest4.argument;
            Message message3 = obtainMessage(47, mainthreadrequest4);
            mPhone.getIccCard().openLogicalChannelWithSw(iccapduargument2.data, message3);
            return;
_L42:
            AsyncResult asyncresult1 = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest3 = (MainThreadRequest)asyncresult1.userObj;
            mainthreadrequest3.result = asyncresult1.result;
            Exception exception1;
            if (asyncresult1.exception == null && asyncresult1.result != null)
            {
                lastError = 0;
            } else
            {
                mainthreadrequest3.result = new IccIoResult(255, 255, (byte[])null);
                lastError = 1;
            }
            mainthreadrequest3;
            JVM INSTR monitorenter ;
            mainthreadrequest3.notifyAll();
            mainthreadrequest3;
            JVM INSTR monitorexit ;
            return;
            exception1;
            mainthreadrequest3;
            JVM INSTR monitorexit ;
            throw exception1;
_L40:
            MainThreadRequest mainthreadrequest2 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument1 = (IccAPDUArgument)mainthreadrequest2.argument;
            Message message2 = obtainMessage(48, mainthreadrequest2);
            ((GeminiPhone)mPhone).getIccCardGemini(0).openLogicalChannelWithSw(iccapduargument1.data, message2);
            return;
_L41:
            MainThreadRequest mainthreadrequest1 = (MainThreadRequest)message.obj;
            IccAPDUArgument iccapduargument = (IccAPDUArgument)mainthreadrequest1.argument;
            Message message1 = obtainMessage(49, mainthreadrequest1);
            ((GeminiPhone)mPhone).getIccCardGemini(1).openLogicalChannelWithSw(iccapduargument.data, message1);
            return;
_L43:
            AsyncResult asyncresult = (AsyncResult)message.obj;
            MainThreadRequest mainthreadrequest = (MainThreadRequest)asyncresult.userObj;
            mainthreadrequest.result = asyncresult.result;
            Exception exception;
            if (asyncresult.exception == null && asyncresult.result != null)
            {
                if (message.what == 48)
                    lastError1 = 0;
                else
                    lastError2 = 0;
            } else
            {
                mainthreadrequest.result = new IccIoResult(255, 255, (byte[])null);
                if (message.what == 48)
                    lastError1 = 1;
                else
                    lastError2 = 1;
            }
            mainthreadrequest;
            JVM INSTR monitorenter ;
            mainthreadrequest.notifyAll();
            mainthreadrequest;
            JVM INSTR monitorexit ;
            return;
            exception;
            mainthreadrequest;
            JVM INSTR monitorexit ;
            throw exception;
        }

        private MainThreadHandler()
        {
            this$0 = PhoneInterfaceManager.this;
            super();
        }

    }

    private static final class MainThreadRequest
    {

        public Object argument;
        public Object result;

        public MainThreadRequest(Object obj)
        {
            argument = obj;
        }
    }

    private class MessengerWrapper
    {

        private Handler mInternalHandler;
        private Messenger mMessenger;
        final PhoneInterfaceManager this$0;

        public Handler getHandler()
        {
            return mInternalHandler;
        }

        public Messenger getMessenger()
        {
            return mMessenger;
        }


        public MessengerWrapper(IBinder ibinder)
        {
            this$0 = PhoneInterfaceManager.this;
            super();
            mInternalHandler = new _cls1(mMainThreadHandler.getLooper());
            mMessenger = new Messenger(ibinder);
        }
    }

    private class PinMmiGemini
    {

        public String dialString;
        public Integer simId;
        final PhoneInterfaceManager this$0;

        public PinMmiGemini(String s, Integer integer)
        {
            this$0 = PhoneInterfaceManager.this;
            super();
            dialString = s;
            simId = integer;
        }
    }

    private static class QueryAdnInfoThread extends Thread
    {

        private static final int EVENT_QUERY_PHB_ADN_INFO = 100;
        private boolean mDone;
        private Handler mHandler;
        private int mSimId;
        Phone myPhone;
        private int recordSize[];

        public int[] GetAdnStorageInfo()
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_34;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            Message message;
            IccFileHandler iccfilehandler;
            message = Message.obtain(mHandler, 100);
            iccfilehandler = ((GeminiPhone)myPhone).getIccFileHandlerGemini(mSimId);
            if (iccfilehandler == null)
                break MISSING_BLOCK_LABEL_108;
            iccfilehandler.getPhbRecordInfo(message);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_120;
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            Log.d("PhoneInterfaceManager", "GetAdnStorageInfo: filehandle is null.");
            this;
            JVM INSTR monitorexit ;
            return null;
            int ai[];
            Log.d("PhoneInterfaceManager", "done");
            ai = recordSize;
            this;
            JVM INSTR monitorexit ;
            return ai;
        }

        public void run()
        {
            Looper.prepare();
            this;
            JVM INSTR monitorenter ;
            mHandler = new Handler() {

                final QueryAdnInfoThread this$0;

                public void handleMessage(Message message)
                {
                    AsyncResult asyncresult;
                    asyncresult = (AsyncResult)message.obj;
                    switch (message.what)
                    {
                    default:
                        return;

                    case 100: // 'd'
                        Log.d("PhoneInterfaceManager", "EVENT_QUERY_PHB_ADN_INFO");
                        break;
                    }
                    QueryAdnInfoThread queryadninfothread = QueryAdnInfoThread.this;
                    queryadninfothread;
                    JVM INSTR monitorenter ;
                    int ai[];
                    mDone = true;
                    ai = (int[])(int[])asyncresult.result;
                    if (ai == null)
                        break MISSING_BLOCK_LABEL_242;
                    recordSize = new int[4];
                    recordSize[0] = ai[0];
                    recordSize[1] = ai[1];
                    recordSize[2] = ai[2];
                    recordSize[3] = ai[3];
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("recordSize[0]=").append(recordSize[0]).append(",recordSize[1]=").append(recordSize[1]).append("recordSize[2]=").append(recordSize[2]).append(",recordSize[3]=").append(recordSize[3]).toString());
_L1:
                    notifyAll();
                    queryadninfothread;
                    JVM INSTR monitorexit ;
                    return;
                    Exception exception;
                    exception;
                    queryadninfothread;
                    JVM INSTR monitorexit ;
                    throw exception;
                    recordSize = new int[4];
                    recordSize[0] = 0;
                    recordSize[1] = 0;
                    recordSize[2] = 0;
                    recordSize[3] = 0;
                      goto _L1
                }

            
            {
                this$0 = QueryAdnInfoThread.this;
                super();
            }
            }
;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            Looper.loop();
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void setSimId(int i)
        {
            mSimId = i;
            mDone = false;
        }


/*
        static boolean access$1602(QueryAdnInfoThread queryadninfothread, boolean flag)
        {
            queryadninfothread.mDone = flag;
            return flag;
        }

*/



/*
        static int[] access$1702(QueryAdnInfoThread queryadninfothread, int ai[])
        {
            queryadninfothread.recordSize = ai;
            return ai;
        }

*/

        public QueryAdnInfoThread(int i, Phone phone)
        {
            mDone = false;
            mSimId = i;
            myPhone = phone;
        }
    }

    private class ScAddrGemini
    {

        public String scAddr;
        public int simId;
        final PhoneInterfaceManager this$0;

        public ScAddrGemini(String s, int i)
        {
            this$0 = PhoneInterfaceManager.this;
            super();
            scAddr = s;
            if (i != 0 && i != 1 && i != 2 && i != 3)
            {
                simId = 0;
                return;
            } else
            {
                simId = i;
                return;
            }
        }
    }

    private static class SendBtSimapProfile extends Thread
    {

        private static final int BTSAP_CONNECT_COMPLETE = 300;
        private static final int BTSAP_DISCONNECT_COMPLETE = 301;
        private static final int BTSAP_POWEROFF_COMPLETE = 303;
        private static final int BTSAP_POWERON_COMPLETE = 302;
        private static final int BTSAP_RESETSIM_COMPLETE = 304;
        private static final int BTSAP_TRANSFER_APDU_COMPLETE = 305;
        static final Object sInstSync = new Object();
        private static SendBtSimapProfile sInstance;
        private BtSimapOperResponse mBtRsp;
        private Phone mBtSapPhone;
        private boolean mDone;
        private Handler mHandler;
        private ArrayList mResult;
        private int mRet;
        private String mStrResult;

        public static SendBtSimapProfile getInstance(Phone phone)
        {
            synchronized (sInstSync)
            {
                if (sInstance == null)
                    sInstance = new SendBtSimapProfile(phone);
            }
            return sInstance;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        int btSimapApduRequest(int i, String s)
        {
            this;
            JVM INSTR monitorenter ;
            int j = 0;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_40;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message;
            int k;
            mDone = false;
            message = Message.obtain(mHandler, 305);
            k = ((GeminiPhone)mBtSapPhone).getBtConnectedSimId();
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapApduRequest GEMINI connect Sim is ").append(k).toString());
            if (k != 0 && k != 1) goto _L3; else goto _L2
_L2:
            ((GeminiPhone)mBtSapPhone).sendBTSIMProfileGemini(5, i, s, message, k);
_L6:
            boolean flag = mDone;
            if (flag) goto _L5; else goto _L4
_L4:
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L6
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L6
_L3:
            int l = 7;
_L7:
            this;
            JVM INSTR monitorexit ;
            return l;
_L5:
            Log.d("PhoneInterfaceManager", "done");
            if (mRet != 0)
                break MISSING_BLOCK_LABEL_246;
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("btSimapApduRequest APDU ").append(mBtRsp.getApduString()).toString());
_L8:
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapApduRequest ret ").append(j).toString());
            l = j;
              goto _L7
            j = mRet;
              goto _L8
        }

        int btSimapConnectSIM(int i)
        {
            this;
            JVM INSTR monitorenter ;
            int j = 0;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_38;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            mDone = false;
            Message message = Message.obtain(mHandler, 300);
            ((GeminiPhone)mBtSapPhone).sendBTSIMProfileGemini(0, 0, null, message, i);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_108;
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            Log.d("PhoneInterfaceManager", "done");
            if (mRet != 0)
                break MISSING_BLOCK_LABEL_258;
            ((GeminiPhone)mBtSapPhone).setBtConnectedSimId(i);
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapConnectSIM GEMINI connect Sim is ").append(((GeminiPhone)mBtSapPhone).getBtConnectedSimId()).toString());
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("btSimapConnectSIM curType ").append(mBtRsp.getCurType()).append(" SupType ").append(mBtRsp.getSupportType()).append(" ATR ").append(mBtRsp.getAtrString()).toString());
_L3:
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapConnectSIM ret ").append(j).toString());
            this;
            JVM INSTR monitorexit ;
            return j;
            j = mRet;
              goto _L3
        }

        int btSimapDisconnectSIM()
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_34;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message;
            int i;
            Log.d("PhoneInterfaceManager", "synchronized btSimapDisconnectSIM");
            mDone = false;
            message = Message.obtain(mHandler, 301);
            i = ((GeminiPhone)mBtSapPhone).getBtConnectedSimId();
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapDisconnectSIM GEMINI connect Sim is ").append(i).toString());
            if (i != 0 && i != 1) goto _L3; else goto _L2
_L2:
            ((GeminiPhone)mBtSapPhone).sendBTSIMProfileGemini(1, 0, null, message, i);
_L6:
            boolean flag = mDone;
            if (flag) goto _L5; else goto _L4
_L4:
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L6
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L6
_L3:
            int k = 7;
_L8:
            this;
            JVM INSTR monitorexit ;
            return k;
_L5:
            int j;
            Log.d("PhoneInterfaceManager", "done");
            if (mRet == 0)
                ((GeminiPhone)mBtSapPhone).setBtConnectedSimId(-1);
            j = mRet;
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapDisconnectSIM ret ").append(j).toString());
            k = j;
            if (true) goto _L8; else goto _L7
_L7:
        }

        int btSimapPowerOffSIM()
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_34;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message;
            int i;
            mDone = false;
            message = Message.obtain(mHandler, 303);
            i = ((GeminiPhone)mBtSapPhone).getBtConnectedSimId();
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapPowerOffSIM GEMINI connect Sim is ").append(i).toString());
            if (i != 0 && i != 1) goto _L3; else goto _L2
_L2:
            ((GeminiPhone)mBtSapPhone).sendBTSIMProfileGemini(3, 0, null, message, i);
_L6:
            boolean flag = mDone;
            if (flag) goto _L5; else goto _L4
_L4:
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L6
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L6
_L3:
            int k = 7;
_L8:
            this;
            JVM INSTR monitorexit ;
            return k;
_L5:
            int j;
            Log.d("PhoneInterfaceManager", "done");
            j = mRet;
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapPowerOffSIM ret ").append(j).toString());
            k = j;
            if (true) goto _L8; else goto _L7
_L7:
        }

        int btSimapPowerOnSIM(int i)
        {
            this;
            JVM INSTR monitorenter ;
            int j = 0;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_38;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message;
            int k;
            mDone = false;
            message = Message.obtain(mHandler, 302);
            k = ((GeminiPhone)mBtSapPhone).getBtConnectedSimId();
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapPowerOnSIM GEMINI connect Sim is ").append(k).toString());
            if (k != 0 && k != 1) goto _L3; else goto _L2
_L2:
            ((GeminiPhone)mBtSapPhone).sendBTSIMProfileGemini(2, i, null, message, k);
_L6:
            boolean flag = mDone;
            if (flag) goto _L5; else goto _L4
_L4:
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L6
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L6
_L3:
            int l = 7;
_L7:
            this;
            JVM INSTR monitorexit ;
            return l;
_L5:
            Log.d("PhoneInterfaceManager", "done");
            if (mRet != 0)
                break MISSING_BLOCK_LABEL_259;
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("btSimapPowerOnSIM curType ").append(mBtRsp.getCurType()).append(" ATR ").append(mBtRsp.getAtrString()).toString());
_L8:
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapPowerOnSIM ret ").append(j).toString());
            l = j;
              goto _L7
            j = mRet;
              goto _L8
        }

        int btSimapResetSIM(int i)
        {
            this;
            JVM INSTR monitorenter ;
            int j = 0;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_38;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message;
            int k;
            mDone = false;
            message = Message.obtain(mHandler, 304);
            k = ((GeminiPhone)mBtSapPhone).getBtConnectedSimId();
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapResetSIM GEMINI connect Sim is ").append(k).toString());
            if (k != 0 && k != 1) goto _L3; else goto _L2
_L2:
            ((GeminiPhone)mBtSapPhone).sendBTSIMProfileGemini(4, i, null, message, k);
_L6:
            boolean flag = mDone;
            if (flag) goto _L5; else goto _L4
_L4:
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L6
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L6
_L3:
            int l = 7;
_L7:
            this;
            JVM INSTR monitorexit ;
            return l;
_L5:
            Log.d("PhoneInterfaceManager", "done");
            if (mRet != 0)
                break MISSING_BLOCK_LABEL_259;
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("btSimapResetSIM curType ").append(mBtRsp.getCurType()).append(" ATR ").append(mBtRsp.getAtrString()).toString());
_L8:
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("synchronized btSimapResetSIM ret ").append(j).toString());
            l = j;
              goto _L7
            j = mRet;
              goto _L8
        }

        public void run()
        {
            Looper.prepare();
            this;
            JVM INSTR monitorenter ;
            mHandler = new Handler() {

                final SendBtSimapProfile this$0;

                public void handleMessage(Message message)
                {
                    AsyncResult asyncresult = (AsyncResult)message.obj;
                    message.what;
                    JVM INSTR tableswitch 300 305: default 52
                //                               300 53
                //                               301 409
                //                               302 596
                //                               303 914
                //                               304 1101
                //                               305 1419;
                       goto _L1 _L2 _L3 _L4 _L5 _L6 _L7
_L1:
                    return;
_L2:
                    Log.d("PhoneInterfaceManager", "BTSAP_CONNECT_COMPLETE");
                    SendBtSimapProfile sendbtsimapprofile5 = SendBtSimapProfile.this;
                    sendbtsimapprofile5;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null) goto _L9; else goto _L8
_L8:
                    CommandException commandexception5 = (CommandException)asyncresult.exception;
                    if (commandexception5.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_CARD_REMOVED) goto _L11; else goto _L10
_L10:
                    mRet = 4;
_L14:
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("Exception BTSAP_CONNECT, Exception:").append(asyncresult.exception).toString());
_L15:
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception5;
                    exception5;
                    sendbtsimapprofile5;
                    JVM INSTR monitorexit ;
                    throw exception5;
_L11:
                    if (commandexception5.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_NOT_ACCESSIBLE) goto _L13; else goto _L12
_L12:
                    mRet = 2;
                      goto _L14
_L13:
                    mRet = 1;
                      goto _L14
_L9:
                    String as2[];
                    mStrResult = (String)(String)asyncresult.result;
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_CONNECT_COMPLETE  mStrResult ").append(mStrResult).toString());
                    as2 = mStrResult.split(",");
                    mBtRsp.setCurType(Integer.parseInt(as2[0].trim()));
                    mBtRsp.setSupportType(Integer.parseInt(as2[1].trim()));
                    mBtRsp.setAtrString(as2[2]);
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_CONNECT_COMPLETE curType ").append(mBtRsp.getCurType()).append(" SupType ").append(mBtRsp.getSupportType()).append(" ATR ").append(mBtRsp.getAtrString()).toString());
_L16:
                    mRet = 0;
                      goto _L15
                    NumberFormatException numberformatexception2;
                    numberformatexception2;
                    Log.d("PhoneInterfaceManager", "NumberFormatException");
                      goto _L16
_L3:
                    Log.d("PhoneInterfaceManager", "BTSAP_DISCONNECT_COMPLETE");
                    SendBtSimapProfile sendbtsimapprofile4 = SendBtSimapProfile.this;
                    sendbtsimapprofile4;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null) goto _L18; else goto _L17
_L17:
                    CommandException commandexception4 = (CommandException)asyncresult.exception;
                    if (commandexception4.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_CARD_REMOVED) goto _L20; else goto _L19
_L19:
                    mRet = 4;
_L23:
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("Exception BTSAP_DISCONNECT, Exception:").append(asyncresult.exception).toString());
_L24:
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_DISCONNECT_COMPLETE result is ").append(mRet).toString());
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception4;
                    exception4;
                    sendbtsimapprofile4;
                    JVM INSTR monitorexit ;
                    throw exception4;
_L20:
                    if (commandexception4.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_NOT_ACCESSIBLE) goto _L22; else goto _L21
_L21:
                    mRet = 2;
                      goto _L23
_L22:
                    mRet = 1;
                      goto _L23
_L18:
                    mRet = 0;
                      goto _L24
_L4:
                    Log.d("PhoneInterfaceManager", "BTSAP_POWERON_COMPLETE");
                    SendBtSimapProfile sendbtsimapprofile3 = SendBtSimapProfile.this;
                    sendbtsimapprofile3;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null) goto _L26; else goto _L25
_L25:
                    CommandException commandexception3 = (CommandException)asyncresult.exception;
                    if (commandexception3.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_CARD_REMOVED) goto _L28; else goto _L27
_L27:
                    mRet = 4;
_L31:
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("Exception POWERON_COMPLETE, Exception:").append(asyncresult.exception).toString());
_L32:
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception3;
                    exception3;
                    sendbtsimapprofile3;
                    JVM INSTR monitorexit ;
                    throw exception3;
_L28:
                    if (commandexception3.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_NOT_ACCESSIBLE) goto _L30; else goto _L29
_L29:
                    mRet = 2;
                      goto _L31
_L30:
                    mRet = 1;
                      goto _L31
_L26:
                    String as1[];
                    mStrResult = (String)(String)asyncresult.result;
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_POWERON_COMPLETE  mStrResult ").append(mStrResult).toString());
                    as1 = mStrResult.split(",");
                    mBtRsp.setCurType(Integer.parseInt(as1[0].trim()));
                    mBtRsp.setAtrString(as1[1]);
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_POWERON_COMPLETE curType ").append(mBtRsp.getCurType()).append(" ATR ").append(mBtRsp.getAtrString()).toString());
_L33:
                    mRet = 0;
                      goto _L32
                    NumberFormatException numberformatexception1;
                    numberformatexception1;
                    Log.d("PhoneInterfaceManager", "NumberFormatException");
                      goto _L33
_L5:
                    Log.d("PhoneInterfaceManager", "BTSAP_POWEROFF_COMPLETE");
                    SendBtSimapProfile sendbtsimapprofile2 = SendBtSimapProfile.this;
                    sendbtsimapprofile2;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null) goto _L35; else goto _L34
_L34:
                    CommandException commandexception2 = (CommandException)asyncresult.exception;
                    if (commandexception2.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_CARD_REMOVED) goto _L37; else goto _L36
_L36:
                    mRet = 4;
_L40:
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("Exception BTSAP_POWEROFF, Exception:").append(asyncresult.exception).toString());
_L41:
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_POWEROFF_COMPLETE result is ").append(mRet).toString());
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception2;
                    exception2;
                    sendbtsimapprofile2;
                    JVM INSTR monitorexit ;
                    throw exception2;
_L37:
                    if (commandexception2.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_NOT_ACCESSIBLE) goto _L39; else goto _L38
_L38:
                    mRet = 2;
                      goto _L40
_L39:
                    mRet = 1;
                      goto _L40
_L35:
                    mRet = 0;
                      goto _L41
_L6:
                    Log.d("PhoneInterfaceManager", "BTSAP_RESETSIM_COMPLETE");
                    SendBtSimapProfile sendbtsimapprofile1 = SendBtSimapProfile.this;
                    sendbtsimapprofile1;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null) goto _L43; else goto _L42
_L42:
                    CommandException commandexception1 = (CommandException)asyncresult.exception;
                    if (commandexception1.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_CARD_REMOVED) goto _L45; else goto _L44
_L44:
                    mRet = 4;
_L48:
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("Exception BTSAP_RESETSIM, Exception:").append(asyncresult.exception).toString());
_L49:
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception1;
                    exception1;
                    sendbtsimapprofile1;
                    JVM INSTR monitorexit ;
                    throw exception1;
_L45:
                    if (commandexception1.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_NOT_ACCESSIBLE) goto _L47; else goto _L46
_L46:
                    mRet = 2;
                      goto _L48
_L47:
                    mRet = 1;
                      goto _L48
_L43:
                    String as[];
                    mStrResult = (String)(String)asyncresult.result;
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_RESETSIM_COMPLETE  mStrResult ").append(mStrResult).toString());
                    as = mStrResult.split(",");
                    mBtRsp.setCurType(Integer.parseInt(as[0].trim()));
                    mBtRsp.setAtrString(as[1]);
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_RESETSIM_COMPLETE curType ").append(mBtRsp.getCurType()).append(" ATR ").append(mBtRsp.getAtrString()).toString());
_L50:
                    mRet = 0;
                      goto _L49
                    NumberFormatException numberformatexception;
                    numberformatexception;
                    Log.d("PhoneInterfaceManager", "NumberFormatException");
                      goto _L50
_L7:
                    Log.d("PhoneInterfaceManager", "BTSAP_TRANSFER_APDU_COMPLETE");
                    SendBtSimapProfile sendbtsimapprofile = SendBtSimapProfile.this;
                    sendbtsimapprofile;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null) goto _L52; else goto _L51
_L51:
                    CommandException commandexception = (CommandException)asyncresult.exception;
                    if (commandexception.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_CARD_REMOVED) goto _L54; else goto _L53
_L53:
                    mRet = 4;
_L57:
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("Exception BTSAP_TRANSFER_APDU, Exception:").append(asyncresult.exception).toString());
_L58:
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception;
                    exception;
                    sendbtsimapprofile;
                    JVM INSTR monitorexit ;
                    throw exception;
_L54:
                    if (commandexception.getCommandError() != com.android.internal.telephony.CommandException.Error.BT_SAP_NOT_ACCESSIBLE) goto _L56; else goto _L55
_L55:
                    mRet = 2;
                      goto _L57
_L56:
                    mRet = 1;
                      goto _L57
_L52:
                    mBtRsp.setApduString((String)(String)asyncresult.result);
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("BTSAP_TRANSFER_APDU_COMPLETE result is ").append(mBtRsp.getApduString()).toString());
                    mRet = 0;
                      goto _L58
                }

            
            {
                this$0 = SendBtSimapProfile.this;
                super();
            }
            }
;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            Looper.loop();
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void setBtOperResponse(BtSimapOperResponse btsimapoperresponse)
        {
            mBtRsp = btsimapoperresponse;
        }




/*
        static String access$1002(SendBtSimapProfile sendbtsimapprofile, String s)
        {
            sendbtsimapprofile.mStrResult = s;
            return s;
        }

*/



/*
        static boolean access$1202(SendBtSimapProfile sendbtsimapprofile, boolean flag)
        {
            sendbtsimapprofile.mDone = flag;
            return flag;
        }

*/



/*
        static int access$902(SendBtSimapProfile sendbtsimapprofile, int i)
        {
            sendbtsimapprofile.mRet = i;
            return i;
        }

*/

        private SendBtSimapProfile(Phone phone)
        {
            mDone = false;
            mStrResult = null;
            mRet = 1;
            mBtSapPhone = phone;
            mBtRsp = null;
        }
    }

    private static class SimAuth extends Thread
    {

        private static final int SIM_AUTH_COMPLETE = 200;
        private static final int USIM_AUTH_COMPLETE = 201;
        private boolean mDone;
        private Handler mHandler;
        private String mResult;
        private Phone mSAPhone;

        String doSimAuth(String s)
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_34;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message = Message.obtain(mHandler, 200);
            mSAPhone.doSimAuthentication(s, message);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_95;
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            String s1;
            Log.d("PhoneInterfaceManager", "done");
            s1 = mResult;
            this;
            JVM INSTR monitorexit ;
            return s1;
        }

        String doSimAuthGemini(String s, int i)
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_36;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message = Message.obtain(mHandler, 200);
            ((GeminiPhone)mSAPhone).doSimAuthenticationGemini(s, message, i);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_99;
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            String s1;
            Log.d("PhoneInterfaceManager", "done");
            s1 = mResult;
            this;
            JVM INSTR monitorexit ;
            return s1;
        }

        String doUSimAuth(String s, String s1)
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_36;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message = Message.obtain(mHandler, 201);
            mSAPhone.doUSimAuthentication(s, s1, message);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_98;
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            String s2;
            Log.d("PhoneInterfaceManager", "done");
            s2 = mResult;
            this;
            JVM INSTR monitorexit ;
            return s2;
        }

        String doUSimAuthGemini(String s, String s1, int i)
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_38;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message = Message.obtain(mHandler, 201);
            ((GeminiPhone)mSAPhone).doUSimAuthenticationGemini(s, s1, message, i);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_102;
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            String s2;
            Log.d("PhoneInterfaceManager", "done");
            s2 = mResult;
            this;
            JVM INSTR monitorexit ;
            return s2;
        }

        public void run()
        {
            Looper.prepare();
            this;
            JVM INSTR monitorenter ;
            mHandler = new Handler() {

                final SimAuth this$0;

                public void handleMessage(Message message)
                {
                    AsyncResult asyncresult;
                    asyncresult = (AsyncResult)message.obj;
                    switch (message.what)
                    {
                    default:
                        return;

                    case 200: 
                    case 201: 
                        Log.d("PhoneInterfaceManager", "SIM_AUTH_COMPLETE");
                        break;
                    }
                    SimAuth simauth = SimAuth.this;
                    simauth;
                    JVM INSTR monitorenter ;
                    if (asyncresult.exception == null)
                        break MISSING_BLOCK_LABEL_129;
                    mResult = null;
_L1:
                    Log.d("PhoneInterfaceManager", (new StringBuilder()).append("SIM_AUTH_COMPLETE result is ").append(mResult).toString());
                    mDone = true;
                    notifyAll();
                    return;
                    Exception exception;
                    exception;
                    simauth;
                    JVM INSTR monitorexit ;
                    throw exception;
                    mResult = (String)(String)asyncresult.result;
                      goto _L1
                }

            
            {
                this$0 = SimAuth.this;
                super();
            }
            }
;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            Looper.loop();
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }



/*
        static String access$1302(SimAuth simauth, String s)
        {
            simauth.mResult = s;
            return s;
        }

*/


/*
        static boolean access$1402(SimAuth simauth, boolean flag)
        {
            simauth.mDone = flag;
            return flag;
        }

*/

        public SimAuth(Phone phone)
        {
            mDone = false;
            mResult = null;
            mSAPhone = phone;
        }
    }

    private static class UnlockSim extends Thread
    {

        private static final int SUPPLY_PIN_COMPLETE = 100;
        private static final int SUPPLY_PUK_COMPLETE = 101;
        private boolean mDone;
        private Handler mHandler;
        private boolean mResult;
        private final IccCard mSimCard;

        public void run()
        {
            Looper.prepare();
            this;
            JVM INSTR monitorenter ;
            mHandler = new Handler() {

                final UnlockSim this$0;

                public void handleMessage(Message message)
                {
                    boolean flag;
                    AsyncResult asyncresult;
                    flag = true;
                    asyncresult = (AsyncResult)message.obj;
                    switch (message.what)
                    {
                    default:
                        return;

                    case 100: // 'd'
                    case 101: // 'e'
                        Log.d("PhoneInterfaceManager", "SUPPLY_PIN_COMPLETE");
                        break;
                    }
                    UnlockSim unlocksim = UnlockSim.this;
                    unlocksim;
                    JVM INSTR monitorenter ;
                    UnlockSim unlocksim1 = UnlockSim.this;
                    Exception exception;
                    if (asyncresult.exception != null)
                        flag = false;
                    unlocksim1.mResult = flag;
                    mDone = true;
                    notifyAll();
                    return;
                    exception;
                    unlocksim;
                    JVM INSTR monitorexit ;
                    throw exception;
                }

            
            {
                this$0 = UnlockSim.this;
                super();
            }
            }
;
            notifyAll();
            this;
            JVM INSTR monitorexit ;
            Looper.loop();
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        boolean unlockSim(String s, String s1)
        {
            this;
            JVM INSTR monitorenter ;
_L1:
            Handler handler = mHandler;
            if (handler != null)
                break MISSING_BLOCK_LABEL_36;
            wait();
              goto _L1
            InterruptedException interruptedexception1;
            interruptedexception1;
            Thread.currentThread().interrupt();
              goto _L1
            Exception exception;
            exception;
            throw exception;
            Message message = Message.obtain(mHandler, 100);
            if (s != null)
                break MISSING_BLOCK_LABEL_100;
            mSimCard.supplyPin(s1, message);
_L2:
            boolean flag = mDone;
            if (flag)
                break MISSING_BLOCK_LABEL_116;
            Log.d("PhoneInterfaceManager", "wait for done");
            wait();
              goto _L2
            InterruptedException interruptedexception;
            interruptedexception;
            Thread.currentThread().interrupt();
              goto _L2
            mSimCard.supplyPuk(s, s1, message);
              goto _L2
            boolean flag1;
            Log.d("PhoneInterfaceManager", "done");
            flag1 = mResult;
            this;
            JVM INSTR monitorexit ;
            return flag1;
        }


/*
        static boolean access$702(UnlockSim unlocksim, boolean flag)
        {
            unlocksim.mResult = flag;
            return flag;
        }

*/


/*
        static boolean access$802(UnlockSim unlocksim, boolean flag)
        {
            unlocksim.mDone = flag;
            return flag;
        }

*/

        public UnlockSim(IccCard icccard)
        {
            mDone = false;
            mResult = false;
            mSimCard = icccard;
        }
    }


    private static final int CMD_ADJUST_MODEM_RADIO_POWER = 35;
    private static final int CMD_ANSWER_RINGING_CALL = 4;
    private static final int CMD_ANSWER_RINGING_CALL_GEMINI = 8;
    private static final int CMD_CLOSE_CHANNEL = 13;
    private static final int CMD_CLOSE_CHANNEL_1 = 23;
    private static final int CMD_CLOSE_CHANNEL_2 = 24;
    private static final int CMD_END_CALL = 5;
    private static final int CMD_END_CALL_GEMINI = 7;
    private static final int CMD_EXCHANGE_APDU = 9;
    private static final int CMD_EXCHANGE_APDU_1 = 19;
    private static final int CMD_EXCHANGE_APDU_2 = 20;
    private static final int CMD_GET_ATR = 17;
    private static final int CMD_GET_ATR_1 = 27;
    private static final int CMD_GET_ATR_2 = 28;
    private static final int CMD_GET_SCA_DONE = 32;
    private static final int CMD_HANDLE_GET_SCA = 31;
    private static final int CMD_HANDLE_NEIGHBORING_CELL = 2;
    private static final int CMD_HANDLE_PIN_MMI = 1;
    private static final int CMD_HANDLE_SET_SCA = 33;
    private static final int CMD_OPEN_CHANNEL = 11;
    private static final int CMD_OPEN_CHANNEL_1 = 21;
    private static final int CMD_OPEN_CHANNEL_2 = 22;
    private static final int CMD_OPEN_CHANNEL_WITH_SW = 44;
    private static final int CMD_OPEN_CHANNEL_WITH_SW_1 = 45;
    private static final int CMD_OPEN_CHANNEL_WITH_SW_2 = 46;
    private static final int CMD_SET_SCA_DONE = 34;
    private static final int CMD_SILENCE_RINGER = 6;
    private static final int CMD_SIM_IO = 15;
    private static final int CMD_SIM_IO_1 = 25;
    private static final int CMD_SIM_IO_2 = 26;
    private static final boolean DBG = true;
    private static final boolean DBG_LOC = false;
    private static final int EVENT_CLOSE_CHANNEL_1_DONE = 38;
    private static final int EVENT_CLOSE_CHANNEL_2_DONE = 39;
    private static final int EVENT_CLOSE_CHANNEL_DONE = 14;
    private static final int EVENT_EXCHANGE_APDU_1_DONE = 29;
    private static final int EVENT_EXCHANGE_APDU_2_DONE = 30;
    private static final int EVENT_EXCHANGE_APDU_DONE = 10;
    private static final int EVENT_GET_ATR_1_DONE = 42;
    private static final int EVENT_GET_ATR_2_DONE = 43;
    private static final int EVENT_GET_ATR_DONE = 18;
    private static final int EVENT_NEIGHBORING_CELL_DONE = 3;
    private static final int EVENT_OPEN_CHANNEL_1_DONE = 36;
    private static final int EVENT_OPEN_CHANNEL_2_DONE = 37;
    private static final int EVENT_OPEN_CHANNEL_DONE = 12;
    private static final int EVENT_OPEN_CHANNEL_WITH_SW_1_DONE = 48;
    private static final int EVENT_OPEN_CHANNEL_WITH_SW_2_DONE = 49;
    private static final int EVENT_OPEN_CHANNEL_WITH_SW_DONE = 47;
    private static final int EVENT_SIM_IO_1_DONE = 40;
    private static final int EVENT_SIM_IO_2_DONE = 41;
    private static final int EVENT_SIM_IO_DONE = 16;
    private static final String LOG_TAG = "PhoneInterfaceManager";
    private static int m3GSwitchLockCounter;
    private static PhoneInterfaceManager sInstance;
    private String ITEL_PROPERTY_ICC_OPERATOR_ALPHA[] = {
        "gsm.sim.operator.alpha", "gsm.sim.operator.alpha.2", "gsm.sim.operator.alpha.3", "gsm.sim.operator.alpha.4"
    };
    private String ITEL_PROPERTY_ICC_OPERATOR_ISO_COUNTRY[] = {
        "gsm.sim.operator.iso-country", "gsm.sim.operator.iso-country.2", "gsm.sim.operator.iso-country.3", "gsm.sim.operator.iso-country.4"
    };
    private String ITEL_PROPERTY_ICC_OPERATOR_NUMERIC[] = {
        "gsm.sim.operator.numeric", "gsm.sim.operator.numeric.2", "gsm.sim.operator.numeric.3", "gsm.sim.operator.numeric.4"
    };
    private String ITEL_PROPERTY_SIM_STATE[] = {
        "gsm.sim.state", "gsm.sim.state.2", "gsm.sim.state.3", "gsm.sim.state.4"
    };
    private String PHONE_SUBINFO_SERVICE[] = {
        "iphonesubinfo", "iphonesubinfo2", "iphonesubinfo3", "iphonesubinfo4"
    };
    private int lastError;
    private int lastError1;
    private int lastError2;
    private ArrayList m3GSwitchLocks;
    private QueryAdnInfoThread mAdnInfoThread;
    PhoneGlobals mApp;
    CallManager mCM;
    MainThreadHandler mMainThreadHandler;
    private ArrayList mMessengerWrapperList;
    Phone mPhone;

    private PhoneInterfaceManager(PhoneGlobals phoneglobals, Phone phone)
    {
        m3GSwitchLocks = new ArrayList();
        mAdnInfoThread = null;
        mMessengerWrapperList = new ArrayList();
        mApp = phoneglobals;
        mPhone = phone;
        mCM = PhoneGlobals.getInstance().mCM;
        mMainThreadHandler = new MainThreadHandler();
        publish();
    }

    private void answerRingingCallInternal()
    {
        if (DualTalkUtils.isSupportDualTalk())
        {
            PhoneGlobals.getInstance().getInCallScreenInstance().internalAnswerCall();
        } else
        {
            boolean flag;
            if (!((GeminiPhone)mPhone).getRingingCall().isIdle())
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (!((GeminiPhone)mPhone).getForegroundCall().isIdle())
                flag1 = true;
            else
                flag1 = false;
            boolean flag2;
            if (!((GeminiPhone)mPhone).getBackgroundCall().isIdle())
                flag2 = true;
            else
                flag2 = false;
            Call call1 = mCM.getFirstActiveRingingCall();
            if (flag)
                if (flag1 && flag2)
                {
                    PhoneUtils.answerAndEndActive(mCM, call1);
                    return;
                } else
                {
                    PhoneUtils.answerCall(call1);
                    return;
                }
            if (mCM.hasActiveRingingCall() && mCM.getRingingPhone().getPhoneType() == 3)
            {
                log("answerRingingCallInternal: answering (SIP)...");
                if (mCM.hasActiveFgCall() && mCM.getFgPhone().getPhoneType() == 2)
                {
                    log("answerRingingCallInternal: answer SIP incoming and end CDMA ongoing");
                    PhoneUtils.answerAndEndActive(mCM, call1);
                    return;
                }
                if (mCM.hasActiveFgCall() && mCM.getFgPhone().getPhoneType() != 2 && mCM.hasActiveBgCall())
                {
                    PhoneUtils.answerAndEndActive(mCM, call1);
                    return;
                } else
                {
                    PhoneUtils.answerCall(call1);
                    return;
                }
            }
        }
    }

    private boolean checkIfCallerIsSelfOrForegoundUser()
    {
        boolean flag;
        long l;
        flag = true;
        boolean flag1;
        int i;
        int j;
        if (Binder.getCallingUid() == Process.myUid())
            flag1 = flag;
        else
            flag1 = false;
        if (flag1)
            break MISSING_BLOCK_LABEL_73;
        i = UserHandle.getCallingUserId();
        l = Binder.clearCallingIdentity();
        try
        {
            j = ActivityManager.getCurrentUser();
        }
        catch (Exception exception1)
        {
            Binder.restoreCallingIdentity(l);
            return false;
        }
        if (j != i)
            flag = false;
        Binder.restoreCallingIdentity(l);
        return flag;
        Exception exception;
        exception;
        Binder.restoreCallingIdentity(l);
        throw exception;
        return true;
    }

    private String createTelUrl(String s)
    {
        if (TextUtils.isEmpty(s))
        {
            return null;
        } else
        {
            StringBuilder stringbuilder = new StringBuilder("tel:");
            stringbuilder.append(s);
            return stringbuilder.toString();
        }
    }

    private void enforceCallPermission()
    {
        mApp.enforceCallingOrSelfPermission("android.permission.CALL_PHONE", null);
    }

    private void enforceModifyPermission()
    {
        mApp.enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
    }

    private void enforceReadPermission()
    {
        mApp.enforceCallingOrSelfPermission("android.permission.READ_PHONE_STATE", null);
    }

    private String exchangeIccAPDU(int i, int j, int k, int l, int i1, int j1, String s)
    {
        log("NFC test for exchangeIccAPDU");
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("> exchangeAPDU ").append(k).append(" ").append(i).append(" ").append(j).append(" ").append(l).append(" ").append(i1).append(" ").append(j1).append(" ").append(s).toString());
        IccIoResult iccioresult = (IccIoResult)sendRequest(9, new IccAPDUArgument(i, j, k, l, i1, j1, s));
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("< exchangeAPDU ").append(iccioresult).toString());
        String s1 = Integer.toHexString(0x10000 + ((iccioresult.sw1 << 8) + iccioresult.sw2)).substring(1);
        if (iccioresult.payload != null)
            s1 = (new StringBuilder()).append(IccUtils.bytesToHexString(iccioresult.payload)).append(s1).toString();
        return s1;
    }

    private String exchangeIccAPDUGemini(int i, int j, int k, int l, int i1, int j1, String s, 
            int k1)
    {
        String s1;
        if (k1 != 0 && k1 != 1)
        {
            log((new StringBuilder()).append("exchangeIccAPDUGemini: simId ").append(k1).append(" error").toString());
            s1 = null;
        } else
        {
            byte byte0 = 19;
            if (k1 == 1)
                byte0 = 20;
            log((new StringBuilder()).append("> exchangeAPDUGemini ").append(k).append(" ").append(i).append(" ").append(j).append(" ").append(l).append(" ").append(i1).append(" ").append(j1).append(" ").append(s).append(", ").append(k1).toString());
            IccIoResult iccioresult = (IccIoResult)sendRequest(byte0, new IccAPDUArgument(i, j, k, l, i1, j1, s));
            log((new StringBuilder()).append("< exchangeAPDUGemini ").append(iccioresult).toString());
            s1 = Integer.toHexString(0x10000 + ((iccioresult.sw1 << 8) + iccioresult.sw2)).substring(1);
            if (iccioresult.payload != null)
                return (new StringBuilder()).append(IccUtils.bytesToHexString(iccioresult.payload)).append(s1).toString();
        }
        return s1;
    }

    static PhoneInterfaceManager init(PhoneGlobals phoneglobals, Phone phone)
    {
        com/android/phone/PhoneInterfaceManager;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_32;
        sInstance = new PhoneInterfaceManager(phoneglobals, phone);
_L1:
        PhoneInterfaceManager phoneinterfacemanager = sInstance;
        com/android/phone/PhoneInterfaceManager;
        JVM INSTR monitorexit ;
        return phoneinterfacemanager;
        Log.wtf("PhoneInterfaceManager", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/PhoneInterfaceManager;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void log(String s)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("[PhoneIntfMgr] ").append(s).toString());
    }

    private void loge(String s)
    {
        Log.e("PhoneInterfaceManager", (new StringBuilder()).append("[PhoneIntfMgr] ").append(s).toString());
    }

    private void publish()
    {
        log((new StringBuilder()).append("publish: ").append(this).toString());
        ServiceManager.addService("phone", this);
    }

    private Object sendRequest(int i, Object obj)
    {
        MainThreadRequest mainthreadrequest;
        if (Looper.myLooper() == mMainThreadHandler.getLooper())
            throw new RuntimeException("This method will deadlock if called from the main thread.");
        mainthreadrequest = new MainThreadRequest(obj);
        mMainThreadHandler.obtainMessage(i, mainthreadrequest).sendToTarget();
        mainthreadrequest;
        JVM INSTR monitorenter ;
_L2:
        Object obj1 = mainthreadrequest.result;
        if (obj1 != null)
            break; /* Loop/switch isn't completed */
        try
        {
            mainthreadrequest.wait();
        }
        catch (InterruptedException interruptedexception) { }
        if (true) goto _L2; else goto _L1
_L1:
        mainthreadrequest;
        JVM INSTR monitorexit ;
        return mainthreadrequest.result;
        Exception exception;
        exception;
        mainthreadrequest;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void sendRequestAsync(int i)
    {
        mMainThreadHandler.sendEmptyMessage(i);
    }

    private boolean showCallScreenInternal(boolean flag, boolean flag1)
    {
        long l;
        while (!PhoneGlobals.sVoiceCapable || isIdle()) 
            return false;
        l = Binder.clearCallingIdentity();
        if (!flag) goto _L2; else goto _L1
_L1:
        Intent intent1 = PhoneGlobals.createInCallIntent(flag1);
        Intent intent = intent1;
_L6:
        mApp.startActivity(intent);
_L4:
        Binder.restoreCallingIdentity(l);
        return true;
_L2:
        intent = PhoneGlobals.createInCallIntent();
        continue; /* Loop/switch isn't completed */
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Log.w("PhoneInterfaceManager", (new StringBuilder()).append("showCallScreenInternal: transition to InCallScreen failed; intent = ").append(intent).toString());
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        Binder.restoreCallingIdentity(l);
        throw exception;
        if (true) goto _L6; else goto _L5
_L5:
    }

    private boolean showCallScreenInternalGemini(boolean flag, boolean flag1, int i)
    {
        long l;
        if (isIdleGemini(i))
            return false;
        l = Binder.clearCallingIdentity();
        if (!flag) goto _L2; else goto _L1
_L1:
        Intent intent1 = PhoneGlobals.createInCallIntent(flag1);
_L3:
        intent1.putExtra("simId", i);
        mApp.startActivity(intent1);
        Binder.restoreCallingIdentity(l);
        return true;
_L2:
        Intent intent = PhoneGlobals.createInCallIntent();
        intent1 = intent;
          goto _L3
        Exception exception;
        exception;
        Binder.restoreCallingIdentity(l);
        throw exception;
    }

    private void silenceRingerInternal()
    {
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING && mApp.notifier.isRinging())
        {
            log("silenceRingerInternal: silencing...");
            mApp.notifier.silenceRinger();
        }
    }

    public boolean adjustModemRadioPower(int i, int j)
    {
        boolean flag;
        if (i >= 0 && i <= 255 && j >= 0 && j <= 255)
            flag = true;
        else
            flag = false;
        Log.d("PhoneInterfaceManager", "adjustModemRadioPower");
        if (flag)
        {
            String as[] = {
                "AT+ERFTX=1,", ""
            };
            as[0] = (new StringBuilder()).append(as[0]).append(i).append(",").append(j).toString();
            mPhone.invokeOemRilRequestStrings(as, mMainThreadHandler.obtainMessage(35));
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append(as[0]).append(" ").toString());
        }
        return flag;
    }

    public boolean adjustModemRadioPowerByBand(int i, int j, int k)
    {
        byte byte0;
        if (i == 1)
            byte0 = 8;
        else
            byte0 = 2;
        byte byte1;
        if (i == 1)
            byte1 = 32;
        else
            byte1 = 40;
        String as[] = {
            "AT+ERFTX=3,", ""
        };
        int l = byte0 * j;
        int i1 = byte1 - l - byte0;
        as[0] = (new StringBuilder()).append(as[0]).append(i).toString();
        for (int j1 = 0; j1 < l; j1++)
            as[0] = (new StringBuilder()).append(as[0]).append(",").toString();

        for (int k1 = 0; k1 < byte0; k1++)
            as[0] = (new StringBuilder()).append(as[0]).append(",").append(k).toString();

        for (int l1 = 0; l1 < i1; l1++)
            as[0] = (new StringBuilder()).append(as[0]).append(",").toString();

        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("adjustModemRadioPowerByBand - ").append(as[0]).toString());
        mPhone.invokeOemRilRequestStrings(as, mMainThreadHandler.obtainMessage(35));
        return true;
    }

    public void answerRingingCall()
    {
        log("answerRingingCall...");
        enforceModifyPermission();
        sendRequestAsync(4);
    }

    public void answerRingingCallGemini(int i)
    {
        log((new StringBuilder()).append("answerRingingCallGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
            return;
        } else
        {
            enforceModifyPermission();
            sendRequestAsync(8);
            return;
        }
    }

    public int aquire3GSwitchLock()
    {
        int i = m3GSwitchLockCounter;
        m3GSwitchLockCounter = i + 1;
        Integer integer = new Integer(i);
        m3GSwitchLocks.add(integer);
        Intent intent = new Intent(GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED);
        intent.putExtra(GeminiPhone.EXTRA_3G_SWITCH_LOCKED, true);
        mApp.getApplicationContext().sendBroadcast(intent);
        Log.i("PhoneInterfaceManager", (new StringBuilder()).append("aquire 3G lock: ").append(integer).toString());
        return integer.intValue();
    }

    public int btSimapApduRequest(int i, String s, BtSimapOperResponse btsimapoperresponse)
    {
        SendBtSimapProfile sendbtsimapprofile = SendBtSimapProfile.getInstance(mPhone);
        sendbtsimapprofile.setBtOperResponse(btsimapoperresponse);
        if (sendbtsimapprofile.getState() == Thread.State.NEW)
            sendbtsimapprofile.start();
        return sendbtsimapprofile.btSimapApduRequest(i, s);
    }

    public int btSimapConnectSIM(int i, BtSimapOperResponse btsimapoperresponse)
    {
        SendBtSimapProfile sendbtsimapprofile = SendBtSimapProfile.getInstance(mPhone);
        sendbtsimapprofile.setBtOperResponse(btsimapoperresponse);
        if (sendbtsimapprofile.getState() == Thread.State.NEW)
            sendbtsimapprofile.start();
        int j = sendbtsimapprofile.btSimapConnectSIM(i);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("btSimapConnectSIM ret is ").append(j).append(" btRsp.curType ").append(btsimapoperresponse.getCurType()).append(" suptype ").append(btsimapoperresponse.getSupportType()).append(" atr ").append(btsimapoperresponse.getAtrString()).toString());
        return j;
    }

    public int btSimapDisconnectSIM()
    {
        Log.d("PhoneInterfaceManager", "btSimapDisconnectSIM");
        SendBtSimapProfile sendbtsimapprofile = SendBtSimapProfile.getInstance(mPhone);
        if (sendbtsimapprofile.getState() == Thread.State.NEW)
            sendbtsimapprofile.start();
        return sendbtsimapprofile.btSimapDisconnectSIM();
    }

    public int btSimapPowerOffSIM()
    {
        SendBtSimapProfile sendbtsimapprofile = SendBtSimapProfile.getInstance(mPhone);
        if (sendbtsimapprofile.getState() == Thread.State.NEW)
            sendbtsimapprofile.start();
        return sendbtsimapprofile.btSimapPowerOffSIM();
    }

    public int btSimapPowerOnSIM(int i, BtSimapOperResponse btsimapoperresponse)
    {
        SendBtSimapProfile sendbtsimapprofile = SendBtSimapProfile.getInstance(mPhone);
        sendbtsimapprofile.setBtOperResponse(btsimapoperresponse);
        if (sendbtsimapprofile.getState() == Thread.State.NEW)
            sendbtsimapprofile.start();
        return sendbtsimapprofile.btSimapPowerOnSIM(i);
    }

    public int btSimapResetSIM(int i, BtSimapOperResponse btsimapoperresponse)
    {
        SendBtSimapProfile sendbtsimapprofile = SendBtSimapProfile.getInstance(mPhone);
        sendbtsimapprofile.setBtOperResponse(btsimapoperresponse);
        if (sendbtsimapprofile.getState() == Thread.State.NEW)
            sendbtsimapprofile.start();
        return sendbtsimapprofile.btSimapResetSIM(i);
    }

    public void call(String s)
    {
        log((new StringBuilder()).append("call: ").append(s).toString());
        enforceCallPermission();
        String s1 = createTelUrl(s);
        if (s1 == null)
        {
            return;
        } else
        {
            Intent intent = new Intent("android.intent.action.CALL", Uri.parse(s1));
            intent.addFlags(0x10000000);
            mApp.startActivity(intent);
            return;
        }
    }

    public void callGemini(String s, int i)
    {
        log((new StringBuilder()).append("callGemini: ").append(s).toString());
        log((new StringBuilder()).append("callGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
        } else
        {
            enforceCallPermission();
            String s1 = createTelUrl(s);
            if (s1 != null)
            {
                Intent intent = new Intent("android.intent.action.CALL", Uri.parse(s1));
                intent.addFlags(0x10000000);
                intent.putExtra("simId", i);
                mApp.startActivity(intent);
                return;
            }
        }
    }

    public void cancelMissedCallsNotification()
    {
        enforceModifyPermission();
        mApp.notificationMgr.cancelMissedCallNotification();
    }

    public void cancelMissedCallsNotificationGemini(int i)
    {
        log((new StringBuilder()).append("cancelMissedCallsNotificationGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
            return;
        } else
        {
            enforceModifyPermission();
            mApp.notificationMgr.cancelMissedCallNotification();
            return;
        }
    }

    public int cleanupApnTypeGemini(String s, int i)
    {
        enforceModifyPermission();
        return ((GeminiPhone)mPhone).cleanupApnTypeGemini(s, i);
    }

    public boolean closeIccLogicalChannel(int i)
    {
        log("NFC test for closeIccLogicalChannel");
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("> closeIccLogicalChannel ").append(i).toString());
        Integer integer = (Integer)sendRequest(13, new Integer(i));
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("< closeIccLogicalChannel ").append(integer).append(", ").append(integer.intValue()).toString());
        String s = integer.toString();
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("< closeIccLogicalChannel2 ").append(s).toString());
        return integer.intValue() == 0;
    }

    public boolean closeIccLogicalChannelGemini(int i, int j)
    {
        if (j != 0 && j != 1)
        {
            log((new StringBuilder()).append("closeIccLogicalChannelGemini: simId ").append(j).append(" error").toString());
        } else
        {
            byte byte0 = 23;
            if (j == 1)
                byte0 = 24;
            log((new StringBuilder()).append("> closeIccLogicalChannelGemini ").append(i).append(", ").append(j).toString());
            Integer integer = (Integer)sendRequest(byte0, new Integer(i));
            log((new StringBuilder()).append("< closeIccLogicalChannelGemini ").append(integer).toString());
            if (integer.intValue() == 0)
                return true;
        }
        return false;
    }

    public void dial(String s)
    {
        log((new StringBuilder()).append("dial: ").append(s).toString());
        String s1 = createTelUrl(s);
        if (s1 != null)
        {
            com.android.internal.telephony.PhoneConstants.State state = ((GeminiPhone)mPhone).getState();
            if (state != com.android.internal.telephony.PhoneConstants.State.OFFHOOK && state != com.android.internal.telephony.PhoneConstants.State.RINGING)
            {
                Intent intent = new Intent("android.intent.action.DIAL", Uri.parse(s1));
                intent.addFlags(0x10000000);
                mApp.startActivity(intent);
                return;
            }
        }
    }

    public void dialGemini(String s, int i)
    {
        log((new StringBuilder()).append("dialGemini: ").append(s).toString());
        log((new StringBuilder()).append("dialGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
        } else
        {
            String s1 = createTelUrl(s);
            if (s1 != null)
            {
                com.android.internal.telephony.PhoneConstants.State state;
                if (i == 0)
                    state = ((GeminiPhone)mPhone).getStateGemini(0);
                else
                    state = ((GeminiPhone)mPhone).getStateGemini(1);
                if (state != com.android.internal.telephony.PhoneConstants.State.OFFHOOK && state != com.android.internal.telephony.PhoneConstants.State.RINGING)
                {
                    Intent intent = new Intent("android.intent.action.DIAL", Uri.parse(s1));
                    intent.addFlags(0x10000000);
                    intent.putExtra("simId", i);
                    mApp.startActivity(intent);
                    return;
                }
            }
        }
    }

    public int disableApnType(String s)
    {
        enforceModifyPermission();
        return mPhone.disableApnType(s);
    }

    public int disableApnTypeGemini(String s, int i)
    {
        enforceModifyPermission();
        return ((GeminiPhone)mPhone).disableApnTypeGemini(s, i);
    }

    public boolean disableDataConnectivity()
    {
        enforceModifyPermission();
        ((ConnectivityManager)mApp.getSystemService("connectivity")).setMobileDataEnabled(false);
        return true;
    }

    public int disableDataConnectivityGemini(int i)
    {
        enforceModifyPermission();
        return ((GeminiPhone)mPhone).disableDataConnectivityGemini(i);
    }

    public void disableLocationUpdates()
    {
        mApp.enforceCallingOrSelfPermission("android.permission.CONTROL_LOCATION_UPDATES", null);
        mPhone.disableLocationUpdates();
    }

    public void disableLocationUpdatesGemini(int i)
    {
        mApp.enforceCallingOrSelfPermission("android.permission.CONTROL_LOCATION_UPDATES", null);
        ((GeminiPhone)mPhone).disableLocationUpdatesGemini(i);
    }

    public int enableApnType(String s)
    {
        enforceModifyPermission();
        return mPhone.enableApnType(s);
    }

    public int enableApnTypeGemini(String s, int i)
    {
        enforceModifyPermission();
        return ((GeminiPhone)mPhone).enableApnTypeGemini(s, i);
    }

    public boolean enableDataConnectivity()
    {
        enforceModifyPermission();
        ((ConnectivityManager)mApp.getSystemService("connectivity")).setMobileDataEnabled(true);
        return true;
    }

    public int enableDataConnectivityGemini(int i)
    {
        enforceModifyPermission();
        return ((GeminiPhone)mPhone).enableDataConnectivityGemini(i);
    }

    public void enableLocationUpdates()
    {
        mApp.enforceCallingOrSelfPermission("android.permission.CONTROL_LOCATION_UPDATES", null);
        mPhone.enableLocationUpdates();
    }

    public void enableLocationUpdatesGemini(int i)
    {
        mApp.enforceCallingOrSelfPermission("android.permission.CONTROL_LOCATION_UPDATES", null);
        ((GeminiPhone)mPhone).enableLocationUpdatesGemini(i);
    }

    public boolean endCall()
    {
        enforceCallPermission();
        return ((Boolean)sendRequest(5, null)).booleanValue();
    }

    public boolean endCallGemini(int i)
    {
        MainThreadRequest mainthreadrequest;
        log((new StringBuilder()).append("endCallGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
            return false;
        }
        enforceCallPermission();
        if (Looper.myLooper() == mMainThreadHandler.getLooper())
            throw new RuntimeException("This method will deadlock if called from the main thread.");
        mainthreadrequest = new MainThreadRequest(null);
        mMainThreadHandler.obtainMessage(7, i, 0, mainthreadrequest).sendToTarget();
        mainthreadrequest;
        JVM INSTR monitorenter ;
_L2:
        Object obj = mainthreadrequest.result;
        if (obj != null)
            break; /* Loop/switch isn't completed */
        try
        {
            mainthreadrequest.wait();
        }
        catch (InterruptedException interruptedexception) { }
        if (true) goto _L2; else goto _L1
_L1:
        mainthreadrequest;
        JVM INSTR monitorexit ;
        return ((Boolean)(Boolean)mainthreadrequest.result).booleanValue();
        Exception exception;
        exception;
        mainthreadrequest;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public String execRuimEsnOp(boolean flag)
    {
        return null;
    }

    public int get3GCapabilitySIM()
    {
        return ((GeminiPhone)mPhone).get3GCapabilitySIM();
    }

    public int getActivePhoneType()
    {
        return mPhone.getPhoneType();
    }

    public int getActivePhoneTypeGemini(int i)
    {
        log((new StringBuilder()).append("getActivePhoneTypeGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
            return 0;
        }
        if (i == 0)
            return ((GeminiPhone)mPhone).getPhoneTypeGemini(0);
        else
            return ((GeminiPhone)mPhone).getPhoneTypeGemini(1);
    }

    public int[] getAdnStorageInfo(int i)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getAdnStorageInfo ").append(i).toString());
        if (mAdnInfoThread == null)
        {
            Log.d("PhoneInterfaceManager", "getAdnStorageInfo new thread ");
            mAdnInfoThread = new QueryAdnInfoThread(i, mPhone);
            mAdnInfoThread.start();
        } else
        {
            mAdnInfoThread.setSimId(i);
            Log.d("PhoneInterfaceManager", "getAdnStorageInfo old thread ");
        }
        return mAdnInfoThread.GetAdnStorageInfo();
    }

    public List getAllCellInfo()
    {
        boolean flag;
        List list;
        try
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION", null);
        }
        catch (SecurityException securityexception)
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION", null);
        }
        flag = checkIfCallerIsSelfOrForegoundUser();
        list = null;
        if (flag)
            list = mPhone.getAllCellInfo();
        return list;
    }

    public int getCallState()
    {
        return DefaultPhoneNotifier.convertCallState(mCM.getState());
    }

    public int getCallStateGemini(int i)
    {
        log((new StringBuilder()).append("getCallStateGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
            return 0;
        }
        if (i == 0)
            return DefaultPhoneNotifier.convertCallState(((GeminiPhone)mPhone).getStateGemini(0));
        else
            return DefaultPhoneNotifier.convertCallState(((GeminiPhone)mPhone).getStateGemini(1));
    }

    public int getCdmaEriIconIndex()
    {
        return mPhone.getCdmaEriIconIndex();
    }

    public int getCdmaEriIconMode()
    {
        return mPhone.getCdmaEriIconMode();
    }

    public String getCdmaEriText()
    {
        return mPhone.getCdmaEriText();
    }

    public Bundle getCellLocation()
    {
        boolean flag;
        Bundle bundle;
        try
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION", null);
        }
        catch (SecurityException securityexception)
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION", null);
        }
        flag = checkIfCallerIsSelfOrForegoundUser();
        bundle = null;
        if (flag)
        {
            bundle = new Bundle();
            mPhone.getCellLocation().fillInNotifierBundle(bundle);
        }
        return bundle;
    }

    public Bundle getCellLocationGemini(int i)
    {
        Bundle bundle;
        try
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION", null);
        }
        catch (SecurityException securityexception)
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION", null);
        }
        bundle = new Bundle();
        ((GeminiPhone)mPhone).getCellLocationGemini(i).fillInNotifierBundle(bundle);
        return bundle;
    }

    public int getDataActivity()
    {
        return DefaultPhoneNotifier.convertDataActivityState(mPhone.getDataActivityState());
    }

    public int getDataActivityGemini(int i)
    {
        return DefaultPhoneNotifier.convertDataActivityState(((GeminiPhone)mPhone).getDataActivityStateGemini(i));
    }

    public int getDataState()
    {
        return DefaultPhoneNotifier.convertDataState(mPhone.getDataConnectionState());
    }

    public int getDataStateGemini(int i)
    {
        return DefaultPhoneNotifier.convertDataState(((GeminiPhone)mPhone).getDataConnectionStateGemini(i));
    }

    public String getGateway(String s)
    {
        return mPhone.getGateway(s);
    }

    public String getGatewayGemini(String s, int i)
    {
        return ((GeminiPhone)mPhone).getGatewayGemini(s, i);
    }

    public String getIccATR()
    {
        log("NFC test for getIccATR");
        Log.d("PhoneInterfaceManager", "> getIccATR ");
        String s = (String)sendRequest(17, null);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("< getIccATR: ").append(s).toString());
        return s;
    }

    public String getIccATRGemini(int i)
    {
        if (i != 0 && i != 1)
        {
            log((new StringBuilder()).append("getIccATRGemini: simId ").append(i).append(" error").toString());
            return null;
        }
        byte byte0 = 27;
        if (i == 1)
            byte0 = 28;
        log((new StringBuilder()).append("> getIccATRGemini , ").append(i).toString());
        String s = (String)sendRequest(byte0, null);
        log((new StringBuilder()).append("< getIccATRGemini: ").append(s).toString());
        return s;
    }

    public String getIccCardType()
    {
        return mPhone.getIccCard().getIccCardType();
    }

    public String getIccCardTypeGemini(int i)
    {
        return ((GeminiPhone)mPhone).getIccCardGemini(i).getIccCardType();
    }

    public String getInterfaceName(String s)
    {
        return mPhone.getInterfaceName(s);
    }

    public String getInterfaceNameGemini(String s, int i)
    {
        return ((GeminiPhone)mPhone).getInterfaceNameGemini(s, i);
    }

    public String getIpAddress(String s)
    {
        return mPhone.getIpAddress(s);
    }

    public String getIpAddressGemini(String s, int i)
    {
        return ((GeminiPhone)mPhone).getIpAddressGemini(s, i);
    }

    public int getLastError()
    {
        log("NFC test for getLastError");
        return lastError;
    }

    public int getLastErrorGemini(int i)
    {
        if (i == 0)
            return lastError1;
        if (i == 1)
        {
            return lastError2;
        } else
        {
            log((new StringBuilder()).append("getLastErrorGemini parameter ").append(i).append(" error").toString());
            return 1;
        }
    }

    public String getLine1AlphaTag(int i)
    {
        String s;
        try
        {
            s = getSubscriberInfo(i).getLine1AlphaTag();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        catch (NullPointerException nullpointerexception)
        {
            return null;
        }
        return s;
    }

    public String getLine1Number(int i)
    {
        Log.d("PhoneInterfaceManager", "getLine1Number");
        String s;
        try
        {
            s = getSubscriberInfo(i).getLine1Number();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        catch (NullPointerException nullpointerexception)
        {
            return null;
        }
        return s;
    }

    public int getLteOnCdmaMode()
    {
        return mPhone.getLteOnCdmaMode();
    }

    public int getMissedCallCount()
    {
        return mApp.notificationMgr.getMissedCallCount();
    }

    public void getMobileRevisionAndIMEI(int i, Message message)
    {
        mPhone.getMobileRevisionAndIMEI(i, message);
    }

    public List getNeighboringCellInfo()
    {
        boolean flag;
        ArrayList arraylist;
        try
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION", null);
        }
        catch (SecurityException securityexception)
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION", null);
        }
        flag = checkIfCallerIsSelfOrForegoundUser();
        arraylist = null;
        if (flag)
            try
            {
                arraylist = (ArrayList)sendRequest(2, null);
            }
            catch (RuntimeException runtimeexception)
            {
                Log.e("PhoneInterfaceManager", (new StringBuilder()).append("getNeighboringCellInfo ").append(runtimeexception).toString());
                return null;
            }
        return arraylist;
    }

    public List getNeighboringCellInfoGemini(int i)
    {
        ArrayList arraylist;
        try
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION", null);
        }
        catch (SecurityException securityexception)
        {
            mApp.enforceCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION", null);
        }
        try
        {
            arraylist = (ArrayList)sendRequest(2, new Integer(i));
        }
        catch (RuntimeException runtimeexception)
        {
            Log.e("PhoneInterfaceManager", (new StringBuilder()).append("getNeighboringCellInfo ").append(runtimeexception).toString());
            return null;
        }
        return arraylist;
    }

    public String getNetworkCountryIsoGemini(int i)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getNetworkCountryIso simId=").append(i).toString());
        if (i == 3)
            return SystemProperties.get("gsm.operator.iso-country.4");
        if (i == 2)
            return SystemProperties.get("gsm.operator.iso-country.3");
        if (i == 1)
            return SystemProperties.get("gsm.operator.iso-country.2");
        else
            return SystemProperties.get("gsm.operator.iso-country");
    }

    public String getNetworkOperatorGemini(int i)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getNetworkOperator simId=").append(i).toString());
        if (i == 3)
            return SystemProperties.get("gsm.operator.numeric.4");
        if (i == 2)
            return SystemProperties.get("gsm.operator.numeric.3");
        if (i == 1)
            return SystemProperties.get("gsm.operator.numeric.2");
        else
            return SystemProperties.get("gsm.operator.numeric");
    }

    public String getNetworkOperatorNameGemini(int i)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getNetworkOperatorName simId=").append(i).toString());
        if (i == 3)
            return SystemProperties.get("gsm.operator.alpha.4");
        if (i == 2)
            return SystemProperties.get("gsm.operator.alpha.3");
        if (i == 1)
            return SystemProperties.get("gsm.operator.alpha.2");
        else
            return SystemProperties.get("gsm.operator.alpha");
    }

    public int getNetworkType()
    {
        return mPhone.getServiceState().getNetworkType();
    }

    public int getNetworkTypeGemini(int i)
    {
        return ((GeminiPhone)mPhone).getServiceStateGemini(i).getNetworkType();
    }

    public int getPendingMmiCodesGemini(int i)
    {
        return ((GeminiPhone)mPhone).getPendingMmiCodesGemini(i).size();
    }

    public int getPreciseCallState()
    {
        return DefaultPhoneNotifier.convertCallState(mCM.getState());
    }

    public String getSN()
    {
        return SystemProperties.get("gsm.serial");
    }

    public String getScAddressGemini(int i)
    {
        Log.d("PhoneInterfaceManager", "getScAddressGemini: enter");
        if (i != 0 && i != 1 && i != 2 && i != 3)
        {
            Log.d("PhoneInterfaceManager", "[sca Invalid sim id");
            return null;
        }
        final ScAddrGemini addr = new ScAddrGemini(null, i);
        Thread thread = new Thread() {

            final PhoneInterfaceManager this$0;
            final ScAddrGemini val$addr;

            public void run()
            {
                try
                {
                    addr.scAddr = (String)sendRequest(31, addr);
                    return;
                }
                catch (RuntimeException runtimeexception)
                {
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("[sca getScAddressGemini ").append(runtimeexception).toString());
                }
            }

            
            {
                this$0 = PhoneInterfaceManager.this;
                addr = scaddrgemini;
                super();
            }
        }
;
        thread.start();
        try
        {
            Log.d("PhoneInterfaceManager", "[sca thread join");
            thread.join();
        }
        catch (InterruptedException interruptedexception)
        {
            Log.d("PhoneInterfaceManager", "[sca throw interrupted exception");
        }
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getScAddressGemini: exit with ").append(addr.scAddr).toString());
        return addr.scAddr;
    }

    public Bundle getServiceState()
    {
        Bundle bundle = new Bundle();
        mPhone.getServiceState().fillInNotifierBundle(bundle);
        return bundle;
    }

    public Bundle getServiceStateGemini(int i)
    {
        Bundle bundle = new Bundle();
        ((GeminiPhone)mPhone).getServiceStateGemini(i).fillInNotifierBundle(bundle);
        return bundle;
    }

    public String getSimCountryIso(int i)
    {
        String s = SystemProperties.get(ITEL_PROPERTY_ICC_OPERATOR_ISO_COUNTRY[i]);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getSimCountryIso simId = ").append(i).append("prop = ").append(s).toString());
        return s;
    }

    public int getSimIndicatorState()
    {
        return mPhone.getSimIndicateState();
    }

    public int getSimIndicatorStateGemini(int i)
    {
        return ((GeminiPhone)mPhone).getSimIndicateStateGemini(i);
    }

    public String getSimOperator(int i)
    {
        String s = SystemProperties.get(ITEL_PROPERTY_ICC_OPERATOR_NUMERIC[i]);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getSimOperator simId = ").append(i).append("getSimOperator = ").append(s).toString());
        return s;
    }

    public String getSimOperatorName(int i)
    {
        String s = SystemProperties.get(ITEL_PROPERTY_ICC_OPERATOR_ALPHA[i]);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getSimOperatorName simId = ").append(i).append("prop = ").append(s).toString());
        return s;
    }

    public String getSimSerialNumber(int i)
    {
        Log.d("PhoneInterfaceManager", "getSimSerialNumber");
        String s;
        try
        {
            s = getSubscriberInfo(i).getIccSerialNumber();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        catch (NullPointerException nullpointerexception)
        {
            return null;
        }
        return s;
    }

    public int getSimState(int i)
    {
        String s = SystemProperties.get(ITEL_PROPERTY_SIM_STATE[i]);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getSimState simId = ").append(i).append("prop = ").append(s).toString());
        if ("ABSENT".equals(s))
            return 1;
        if ("PIN_REQUIRED".equals(s))
            return 2;
        if ("PUK_REQUIRED".equals(s))
            return 3;
        if ("NETWORK_LOCKED".equals(s))
            return 4;
        return !"READY".equals(s) ? 0 : 5;
    }

    public int getSmsDefaultSim()
    {
        return ((GeminiPhone)mPhone).getSmsDefaultSim();
    }

    public String getSpNameInEfSpn()
    {
        Log.d("PhoneInterfaceManager", "PhoneInterfaceManager: getSpNameInEfSpn() not Single-Card");
        return null;
    }

    public String getSpNameInEfSpnGemini(int i)
    {
        return mPhone.getSpNameInEfSpn(i);
    }

    public String getSubscriberId(int i)
    {
        Log.d("PhoneInterfaceManager", "getSubscriberId");
        String s;
        try
        {
            s = getSubscriberInfo(i).getSubscriberId();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        catch (NullPointerException nullpointerexception)
        {
            return null;
        }
        return s;
    }

    public IPhoneSubInfo getSubscriberInfo(int i)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("getSubscriberInfo simId = ").append(i).toString());
        return com.android.internal.telephony.IPhoneSubInfo.Stub.asInterface(ServiceManager.getService(PHONE_SUBINFO_SERVICE[i]));
    }

    public String getVoiceMailAlphaTag(int i)
    {
        Log.d("PhoneInterfaceManager", "getVoiceMailAlphaTag");
        String s;
        try
        {
            s = getSubscriberInfo(i).getVoiceMailAlphaTag();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        catch (NullPointerException nullpointerexception)
        {
            return null;
        }
        return s;
    }

    public String getVoiceMailNumber(int i)
    {
        Log.d("PhoneInterfaceManager", "getVoiceMailNumber");
        String s;
        try
        {
            s = getSubscriberInfo(i).getVoiceMailNumber();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        catch (NullPointerException nullpointerexception)
        {
            return null;
        }
        return s;
    }

    public int getVoiceMessageCount()
    {
        return mPhone.getVoiceMessageCount();
    }

    public int getVoiceMessageCountGemini(int i)
    {
        return mPhone.getVoiceMessageCount();
    }

    public boolean handlePinMmi(String s)
    {
        enforceModifyPermission();
        return ((Boolean)sendRequest(1, new PinMmiGemini(s, Integer.valueOf(-1)))).booleanValue();
    }

    public boolean handlePinMmiGemini(String s, int i)
    {
        enforceModifyPermission();
        return ((Boolean)sendRequest(1, new PinMmiGemini(s, Integer.valueOf(i)))).booleanValue();
    }

    public boolean hasIccCard()
    {
        return mPhone.getIccCard().hasIccCard();
    }

    public boolean hasIccCardGemini(int i)
    {
        return ((GeminiPhone)mPhone).getIccCardGemini(i).hasIccCard();
    }

    public boolean is3GSwitchLocked()
    {
        return !m3GSwitchLocks.isEmpty();
    }

    public boolean isDataConnectivityPossible()
    {
        return mPhone.isDataConnectivityPossible();
    }

    public boolean isDataConnectivityPossibleGemini(int i)
    {
        return ((GeminiPhone)mPhone).isDataConnectivityPossibleGemini(i);
    }

    public boolean isFDNEnabled()
    {
        return ((GeminiPhone)mPhone).getIccCard().getIccFdnEnabled();
    }

    public boolean isFDNEnabledGemini(int i)
    {
        log((new StringBuilder()).append("isFDNEnabledGemini  simId=").append(i).toString());
        return ((GeminiPhone)mPhone).getIccCardGemini(i).getIccFdnEnabled();
    }

    public boolean isIccCardProviderAsMvno()
    {
        log("isIccCardProviderAsMvno(: not Single-Card");
        return false;
    }

    public boolean isIccCardProviderAsMvnoGemini(int i)
    {
        return mPhone.isIccCardProviderAsMvno(i);
    }

    public boolean isIdle()
    {
        com.android.internal.telephony.PhoneConstants.State state = ((GeminiPhone)mPhone).getState();
        if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
            state = mCM.getState();
        return state == com.android.internal.telephony.PhoneConstants.State.IDLE;
    }

    public boolean isIdleGemini(int i)
    {
        boolean flag = true;
        log((new StringBuilder()).append("isIdleGemini simId: ").append(i).toString());
        if (i != 0 && i != flag)
        {
            log("dialGemini: wrong sim id");
            return false;
        }
        if (i == 0)
        {
            boolean flag1;
            if (((GeminiPhone)mPhone).getStateGemini(0) == com.android.internal.telephony.PhoneConstants.State.IDLE)
                flag1 = flag;
            else
                flag1 = false;
            return flag1;
        }
        if (((GeminiPhone)mPhone).getStateGemini(flag) != com.android.internal.telephony.PhoneConstants.State.IDLE)
            flag = false;
        return flag;
    }

    public boolean isNetworkRoamingGemini(int i)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("isNetworkRoaming simId=").append(i).toString());
        if (i == 3)
            return "true".equals(SystemProperties.get("gsm.operator.isroaming.4"));
        if (i == 2)
            return "true".equals(SystemProperties.get("gsm.operator.isroaming.3"));
        if (i == 1)
            return "true".equals(SystemProperties.get("gsm.operator.isroaming.2"));
        else
            return "true".equals(SystemProperties.get("gsm.operator.isroaming"));
    }

    public boolean isOffhook()
    {
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("state = ").append(state).toString());
        return state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK;
    }

    public boolean isOffhookGemini(int i)
    {
        boolean flag = true;
        log((new StringBuilder()).append("isOffhookGemini simId: ").append(i).toString());
        if (i != 0 && i != flag)
        {
            log("dialGemini: wrong sim id");
            return false;
        }
        if (i == 0)
        {
            boolean flag1;
            if (((GeminiPhone)mPhone).getStateGemini(0) == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
                flag1 = flag;
            else
                flag1 = false;
            return flag1;
        }
        if (((GeminiPhone)mPhone).getStateGemini(flag) != com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
            flag = false;
        return flag;
    }

    public String isOperatorMvnoForEfPnn()
    {
        Log.d("PhoneInterfaceManager", "PhoneInterfaceManager: isOperatorMvnoForEfPnn() not Single-Card");
        return null;
    }

    public String isOperatorMvnoForEfPnnGemini(int i)
    {
        return mPhone.isOperatorMvnoForEfPnn(i);
    }

    public String isOperatorMvnoForImsi()
    {
        Log.d("PhoneInterfaceManager", "PhoneInterfaceManager: isOperatorMvnoForImsi() not Single-Card");
        return null;
    }

    public String isOperatorMvnoForImsiGemini(int i)
    {
        return mPhone.isOperatorMvnoForImsi(i);
    }

    public boolean isPhbReady()
    {
        return isPhbReadyGemini(mPhone.getMySimId());
    }

    public boolean isPhbReadyGemini(int i)
    {
        String s;
        if (1 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.2", "false");
        else
        if (2 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.3", "false");
        else
        if (3 == i)
            s = SystemProperties.get("gsm.sim.ril.phbready.4", "false");
        else
            s = SystemProperties.get("gsm.sim.ril.phbready", "false");
        log((new StringBuilder()).append("[isPhbReady] sim id:").append(i).append(", isPhbReady: ").append(s).toString());
        return s.equals("true");
    }

    public boolean isRadioOn()
    {
        return ((GeminiPhone)mPhone).getServiceStateGemini(0).getState() != 3 || ((GeminiPhone)mPhone).getServiceStateGemini(1).getState() != 3;
    }

    public boolean isRadioOnGemini(int i)
    {
        return ((GeminiPhone)mPhone).isRadioOnGemini(i);
    }

    public boolean isRinging()
    {
        return mCM.getState() == com.android.internal.telephony.PhoneConstants.State.RINGING;
    }

    public boolean isRingingGemini(int i)
    {
        boolean flag = true;
        log((new StringBuilder()).append("isRingingGemini simId: ").append(i).toString());
        if (i != 0 && i != flag)
        {
            log("dialGemini: wrong sim id");
            return false;
        }
        if (i == 0)
        {
            boolean flag1;
            if (((GeminiPhone)mPhone).getStateGemini(0) == com.android.internal.telephony.PhoneConstants.State.RINGING)
                flag1 = flag;
            else
                flag1 = false;
            return flag1;
        }
        if (((GeminiPhone)mPhone).getStateGemini(flag) != com.android.internal.telephony.PhoneConstants.State.RINGING)
            flag = false;
        return flag;
    }

    public boolean isSimInsert(int i)
    {
        return ((GeminiPhone)mPhone).isSimInsert(i);
    }

    public boolean isSimPinEnabled()
    {
        enforceReadPermission();
        return PhoneGlobals.getInstance().isSimPinEnabled();
    }

    public boolean isTestIccCard()
    {
        String s = ((GeminiPhone)mPhone).getSubscriberIdGemini(0);
        String s1 = ((GeminiPhone)mPhone).getSubscriberIdGemini(1);
        boolean flag = false;
        if (s != null)
            flag = s.substring(0, 5).equals("00101");
        boolean flag1 = false;
        if (s1 != null)
            flag1 = s1.substring(0, 5).equals("00101");
        return flag || flag1;
    }

    public boolean isTestIccCardGemini(int i)
    {
        return ((GeminiPhone)mPhone).getSubscriberIdGemini(i).substring(0, 5).equals("00101");
    }

    public boolean isVTIdle()
    {
        return true;
    }

    public boolean isVoiceIdle()
    {
        return ((GeminiPhone)mPhone).getState() == com.android.internal.telephony.PhoneConstants.State.IDLE;
    }

    public boolean needsOtaServiceProvisioning()
    {
        return mPhone.needsOtaServiceProvisioning();
    }

    public int openIccLogicalChannel(String s)
    {
        log("NFC test for openIccLogicalChannel");
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("> openIccLogicalChannel ").append(s).toString());
        Integer integer = (Integer)sendRequest(11, s);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("< openIccLogicalChannel ").append(integer).toString());
        return integer.intValue();
    }

    public int openIccLogicalChannelGemini(String s, int i)
    {
        if (i != 0 && i != 1)
        {
            log((new StringBuilder()).append("openIccLogicalChannelGemini: simId ").append(i).append(" error").toString());
            return 0;
        }
        byte byte0 = 21;
        if (i == 1)
            byte0 = 22;
        log((new StringBuilder()).append("> openIccLogicalChannelGemini ").append(s).append(", ").append(i).toString());
        Integer integer = (Integer)sendRequest(byte0, s);
        log((new StringBuilder()).append("< openIccLogicalChannelGemini ").append(integer).toString());
        return integer.intValue();
    }

    public byte[] openIccLogicalChannelWithSw(String s)
    {
        log("NFC test for openIccLogicalChannelWithSw");
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("> openIccLogicalChannelWithSw ").append(s).toString());
        IccIoResult iccioresult = (IccIoResult)sendRequest(44, new IccAPDUArgument(0, 0, 0, 0, 0, 0, s));
        if (iccioresult.sw1 == 144 && iccioresult.sw2 == 0)
            lastError = 0;
        else
        if (iccioresult.sw1 == 106 && iccioresult.sw2 == 132)
            lastError = 2;
        else
        if (iccioresult.sw1 == 106 && iccioresult.sw2 == 130)
            lastError = 3;
        else
            lastError = 1;
        int i = 2;
        if ((byte)iccioresult.sw1 == -1 && (byte)iccioresult.sw2 == -1)
        {
            byte abyte1[] = {
                0
            };
            log("< openIccLogicalChannelWithSw 0");
            return abyte1;
        }
        byte abyte0[];
        if (iccioresult.payload != null)
        {
            i = 2 + iccioresult.payload.length;
            abyte0 = new byte[i];
            System.arraycopy(iccioresult.payload, 0, abyte0, 0, iccioresult.payload.length);
        } else
        {
            abyte0 = new byte[i];
        }
        abyte0[i - 1] = (byte)iccioresult.sw2;
        abyte0[i - 2] = (byte)iccioresult.sw1;
        String s1 = "";
        for (int j = 0; j < abyte0.length; j++)
            s1 = (new StringBuilder()).append(s1).append(0xff & abyte0[j]).append(" ").toString();

        log((new StringBuilder()).append("< openIccLogicalChannelWithSw ").append(s1).toString());
        return abyte0;
    }

    public byte[] openIccLogicalChannelWithSwGemini(String s, int i)
    {
        if (i != 0 && i != 1)
        {
            log((new StringBuilder()).append("openIccLogicalChannelWithSwGemini: simId ").append(i).append(" error").toString());
            return null;
        }
        byte byte0 = 45;
        if (i == 1)
            byte0 = 46;
        log((new StringBuilder()).append("> openIccLogicalChannelWithSwGemini ").append(s).append(", ").append(i).toString());
        IccIoResult iccioresult = (IccIoResult)sendRequest(byte0, new IccAPDUArgument(0, 0, 0, 0, 0, 0, s));
        if (iccioresult.sw1 == 144 && iccioresult.sw2 == 0)
        {
            if (i == 0)
                lastError1 = 0;
            else
                lastError2 = 0;
        } else
        if (iccioresult.sw1 == 106 && iccioresult.sw2 == 132)
        {
            if (i == 0)
                lastError1 = 2;
            else
                lastError2 = 2;
        } else
        if (iccioresult.sw1 == 106 && iccioresult.sw2 == 130)
        {
            if (i == 0)
                lastError1 = 3;
            else
                lastError2 = 3;
        } else
        if (i == 0)
            lastError1 = 1;
        else
            lastError2 = 1;
        int j = 2;
        if ((byte)iccioresult.sw1 == -1 && (byte)iccioresult.sw2 == -1)
        {
            byte abyte1[] = {
                0
            };
            log("< openIccLogicalChannelWithSwGemini 0");
            return abyte1;
        }
        byte abyte0[];
        if (iccioresult.payload != null)
        {
            j = 2 + iccioresult.payload.length;
            abyte0 = new byte[j];
            System.arraycopy(iccioresult.payload, 0, abyte0, 0, iccioresult.payload.length);
        } else
        {
            abyte0 = new byte[j];
        }
        abyte0[j - 1] = (byte)iccioresult.sw2;
        abyte0[j - 2] = (byte)iccioresult.sw1;
        String s1 = "";
        for (int k = 0; k < abyte0.length; k++)
            s1 = (new StringBuilder()).append(s1).append(0xff & abyte0[k]).append(" ").toString();

        log((new StringBuilder()).append("< openIccLogicalChannelWithSwGemini ").append(s1).toString());
        return abyte0;
    }

    public void registerForSimModeChange(IBinder ibinder, int i)
    {
        if (ibinder != null)
        {
            Log.d("PhoneInterfaceManager", (new StringBuilder()).append("registerForSimModeChange: ").append(ibinder).append(", ").append(i).toString());
            MessengerWrapper messengerwrapper = new MessengerWrapper(ibinder);
            mMessengerWrapperList.add(messengerwrapper);
            ((GeminiPhone)mPhone).registerForSimModeChange(messengerwrapper.getHandler(), i, null);
        }
    }

    public boolean release3GSwitchLock(int i)
    {
        boolean flag = true;
        int j = 0;
        Iterator iterator = m3GSwitchLocks.iterator();
        do
        {
label0:
            {
                boolean flag1 = iterator.hasNext();
                boolean flag2 = false;
                if (flag1)
                {
                    if (((Integer)iterator.next()).intValue() != i)
                        break label0;
                    int k = ((Integer)m3GSwitchLocks.remove(j)).intValue();
                    if (i == k)
                        flag2 = flag;
                    else
                        flag2 = false;
                    Log.i("PhoneInterfaceManager", (new StringBuilder()).append("removed 3G lockId: ").append(k).append("[").append(i).append("]").toString());
                    Intent intent = new Intent(GeminiPhone.EVENT_3G_SWITCH_LOCK_CHANGED);
                    String s = GeminiPhone.EXTRA_3G_SWITCH_LOCKED;
                    if (m3GSwitchLocks.isEmpty())
                        flag = false;
                    intent.putExtra(s, flag);
                    mApp.getApplicationContext().sendBroadcast(intent);
                }
                return flag2;
            }
            j++;
        } while (true);
    }

    public boolean set3GCapabilitySIM(int i)
    {
        if (m3GSwitchLocks.isEmpty())
        {
            com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
            if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                return ((GeminiPhone)mPhone).set3GCapabilitySIM(i);
            } else
            {
                Log.w("PhoneInterfaceManager", (new StringBuilder()).append("Phone is not idle, cannot 3G switch [").append(state).append("]").toString());
                return false;
            }
        } else
        {
            Log.w("PhoneInterfaceManager", (new StringBuilder()).append("3G switch locked, cannot 3G switch [").append(m3GSwitchLocks).append("]").toString());
            return false;
        }
    }

    public void setDataRoamingEnabledGemini(boolean flag, int i)
    {
        ((GeminiPhone)mPhone).setDataRoamingEnabledGemini(flag, i);
    }

    public void setDefaultPhone(int i)
    {
        log((new StringBuilder()).append("setDefaultPhone to SIM").append(i + 1).toString());
        ((GeminiPhone)mPhone).setDefaultPhone(i);
    }

    public void setGprsConnType(int i, int j)
    {
        ((GeminiPhone)mPhone).setGprsConnType(i, j);
    }

    public void setGprsTransferType(int i)
    {
        mPhone.setGprsTransferType(i, null);
    }

    public void setGprsTransferTypeGemini(int i, int j)
    {
        ((GeminiPhone)mPhone).setGprsTransferTypeGemini(i, null, j);
    }

    public boolean setRadio(boolean flag)
    {
        enforceModifyPermission();
        boolean flag1;
        if (mPhone.getServiceState().getState() != 3)
            flag1 = true;
        else
            flag1 = false;
        if (flag1 != flag)
            toggleRadioOnOff();
        return true;
    }

    public boolean setRadioOff()
    {
        enforceModifyPermission();
        ((GeminiPhone)mPhone).setRadioMode(-1);
        return true;
    }

    public void setRoamingIndicatorNeddedProperty(boolean flag, boolean flag1)
    {
        String s;
        if (flag)
            s = "true";
        else
            s = "false";
        SystemProperties.set("gsm.roaming.indicator.needed", s);
        String s1;
        if (flag1)
            s1 = "true";
        else
            s1 = "false";
        SystemProperties.set("gsm.roaming.indicator.needed.2", s1);
    }

    public void setScAddressGemini(String s, int i)
    {
        Log.d("PhoneInterfaceManager", "setScAddressGemini: enter");
        if (i != 0 && i != 1 && i != 2 && i != 3)
        {
            Log.d("PhoneInterfaceManager", "[sca Invalid sim id");
            return;
        }
        Thread thread = new Thread() {

            final PhoneInterfaceManager this$0;
            final ScAddrGemini val$addr;

            public void run()
            {
                try
                {
                    addr.scAddr = (String)sendRequest(33, addr);
                    return;
                }
                catch (RuntimeException runtimeexception)
                {
                    Log.e("PhoneInterfaceManager", (new StringBuilder()).append("[sca setScAddressGemini ").append(runtimeexception).toString());
                }
            }

            
            {
                this$0 = PhoneInterfaceManager.this;
                addr = scaddrgemini;
                super();
            }
        }
;
        thread.start();
        try
        {
            Log.d("PhoneInterfaceManager", "[sca thread join");
            thread.join();
        }
        catch (InterruptedException interruptedexception)
        {
            Log.d("PhoneInterfaceManager", "[sca throw interrupted exception");
        }
        Log.d("PhoneInterfaceManager", "setScAddressGemini: exit");
    }

    public boolean showCallScreen()
    {
        return showCallScreenInternal(false, false);
    }

    public boolean showCallScreenGemini(int i)
    {
        log((new StringBuilder()).append("showCallScreenGemini simId: ").append(i).toString());
        return true;
    }

    public boolean showCallScreenWithDialpad(boolean flag)
    {
        return showCallScreenInternal(true, flag);
    }

    public boolean showCallScreenWithDialpadGemini(boolean flag, int i)
    {
        log((new StringBuilder()).append("showCallScreenWithDialpadGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
            return false;
        } else
        {
            showCallScreenInternalGemini(true, flag, i);
            return true;
        }
    }

    public void silenceRinger()
    {
        log("silenceRinger...");
        enforceModifyPermission();
        sendRequestAsync(6);
    }

    public void silenceRingerGemini(int i)
    {
        log((new StringBuilder()).append("silenceRingerGemini simId: ").append(i).toString());
        if (i != 0 && i != 1)
        {
            log("dialGemini: wrong sim id");
            return;
        } else
        {
            enforceModifyPermission();
            sendRequestAsync(6);
            return;
        }
    }

    public String simAuth(String s)
    {
        SimAuth simauth = new SimAuth(mPhone);
        simauth.start();
        return simauth.doSimAuth(s);
    }

    public String simAuthGemini(String s, int i)
    {
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("simAuthGemini  strRand is ").append(s).append(" simId ").append(i).toString());
        SimAuth simauth = new SimAuth(mPhone);
        simauth.start();
        String s1 = simauth.doSimAuthGemini(s, i);
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("simAuthGemini Result is ").append(s1).toString());
        return s1;
    }

    public boolean supplyPin(String s)
    {
        enforceModifyPermission();
        UnlockSim unlocksim = new UnlockSim(mPhone.getIccCard());
        unlocksim.start();
        return unlocksim.unlockSim(null, s);
    }

    public boolean supplyPinGemini(String s, int i)
    {
        enforceModifyPermission();
        UnlockSim unlocksim = new UnlockSim(((GeminiPhone)mPhone).getIccCardGemini(i));
        unlocksim.start();
        return unlocksim.unlockSim(null, s);
    }

    public boolean supplyPuk(String s, String s1)
    {
        enforceModifyPermission();
        UnlockSim unlocksim = new UnlockSim(mPhone.getIccCard());
        unlocksim.start();
        return unlocksim.unlockSim(s, s1);
    }

    public boolean supplyPukGemini(String s, String s1, int i)
    {
        enforceModifyPermission();
        UnlockSim unlocksim = new UnlockSim(((GeminiPhone)mPhone).getIccCardGemini(i));
        unlocksim.start();
        return unlocksim.unlockSim(s, s1);
    }

    public void toggleRadioOnOff()
    {
        enforceModifyPermission();
        GeminiPhone geminiphone = (GeminiPhone)mPhone;
        byte byte0;
        if (isRadioOn())
            byte0 = 0;
        else
            byte0 = 3;
        geminiphone.setRadioMode(byte0);
    }

    public String transmitIccBasicChannel(int i, int j, int k, int l, int i1, String s)
    {
        log("NFC test for transmitIccBasicChannel");
        return exchangeIccAPDU(i, j, 0, k, l, i1, s);
    }

    public String transmitIccBasicChannelGemini(int i, int j, int k, int l, int i1, String s, int j1)
    {
        if (j1 != 0 && j1 != 1)
        {
            log((new StringBuilder()).append("transmitIccBasicChannelGemini: simId ").append(j1).append(" error").toString());
            return null;
        } else
        {
            return exchangeIccAPDUGemini(i, j, 0, k, l, i1, s, j1);
        }
    }

    public String transmitIccLogicalChannel(int i, int j, int k, int l, int i1, int j1, String s)
    {
        log("NFC test for transmitIccLogicalChannel");
        return exchangeIccAPDU(i, j, k, l, i1, j1, s);
    }

    public String transmitIccLogicalChannelGemini(int i, int j, int k, int l, int i1, int j1, String s, 
            int k1)
    {
        if (k1 != 0 && k1 != 1)
        {
            log((new StringBuilder()).append("transmitIccLogicalChannelGemini: simId ").append(k1).append(" error").toString());
            return null;
        } else
        {
            return exchangeIccAPDUGemini(i, j, k, l, i1, j1, s, k1);
        }
    }

    public byte[] transmitIccSimIO(int i, int j, int k, int l, int i1, String s)
    {
        log("NFC test for transmitIccSimIO");
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("Exchange SIM_IO ").append(i).append(":").append(j).append(" ").append(k).append(" ").append(l).append(" ").append(i1).append(":").append(s).toString());
        IccIoResult iccioresult = (IccIoResult)sendRequest(15, new IccAPDUArgument(i, j, -1, k, l, i1, s));
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("Exchange SIM_IO [R]").append(iccioresult).toString());
        int j1 = 2;
        byte abyte0[];
        if (iccioresult.payload != null)
        {
            j1 = 2 + iccioresult.payload.length;
            abyte0 = new byte[j1];
            System.arraycopy(iccioresult.payload, 0, abyte0, 0, iccioresult.payload.length);
        } else
        {
            abyte0 = new byte[j1];
        }
        Log.d("PhoneInterfaceManager", (new StringBuilder()).append("Exchange SIM_IO [L] ").append(j1).toString());
        abyte0[j1 - 1] = (byte)iccioresult.sw2;
        abyte0[j1 - 2] = (byte)iccioresult.sw1;
        return abyte0;
    }

    public byte[] transmitIccSimIOGemini(int i, int j, int k, int l, int i1, String s, int j1)
    {
        if (j1 != 0 && j1 != 1)
        {
            log((new StringBuilder()).append("transmitIccSimIOGemini: simId ").append(j1).append(" error").toString());
            return null;
        }
        byte byte0 = 25;
        if (j1 == 1)
            byte0 = 26;
        log((new StringBuilder()).append("Exchange SIM_IO Gemini ").append(i).append(":").append(j).append(" ").append(k).append(" ").append(l).append(" ").append(i1).append(":").append(s).append(", ").append(j1).toString());
        IccIoResult iccioresult = (IccIoResult)sendRequest(byte0, new IccAPDUArgument(i, j, -1, k, l, i1, s));
        log((new StringBuilder()).append("Exchange SIM_IO Gemini [R]").append(iccioresult).toString());
        int k1 = 2;
        byte abyte0[];
        if (iccioresult.payload != null)
        {
            k1 = 2 + iccioresult.payload.length;
            abyte0 = new byte[k1];
            System.arraycopy(iccioresult.payload, 0, abyte0, 0, iccioresult.payload.length);
        } else
        {
            abyte0 = new byte[k1];
        }
        log((new StringBuilder()).append("Exchange SIM_IO Gemini [L] ").append(k1).toString());
        abyte0[k1 - 1] = (byte)iccioresult.sw2;
        abyte0[k1 - 2] = (byte)iccioresult.sw1;
        return abyte0;
    }

    public String uSimAuth(String s, String s1)
    {
        SimAuth simauth = new SimAuth(mPhone);
        simauth.start();
        return simauth.doUSimAuth(s, s1);
    }

    public String uSimAuthGemini(String s, String s1, int i)
    {
        SimAuth simauth = new SimAuth(mPhone);
        simauth.start();
        return simauth.doUSimAuthGemini(s, s1, i);
    }

    public void unregisterForSimModeChange(IBinder ibinder)
    {
        Iterator iterator = mMessengerWrapperList.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            MessengerWrapper messengerwrapper = (MessengerWrapper)iterator.next();
            if (messengerwrapper.getMessenger().getBinder() != ibinder)
                continue;
            ((GeminiPhone)mPhone).unregisterForSimModeChange(messengerwrapper.getHandler());
            mMessengerWrapperList.remove(messengerwrapper);
            break;
        } while (true);
    }

    public void updateServiceLocation()
    {
        mPhone.updateServiceLocation();
    }

    public void updateServiceLocationGemini(int i)
    {
        Slog.w("PhoneInterfaceManager", "Warning,updateServiceLocationGemini", new Throwable("tst"));
        ((GeminiPhone)mPhone).updateServiceLocationGemini(i);
    }






/*
    static int access$302(PhoneInterfaceManager phoneinterfacemanager, int i)
    {
        phoneinterfacemanager.lastError = i;
        return i;
    }

*/


/*
    static int access$402(PhoneInterfaceManager phoneinterfacemanager, int i)
    {
        phoneinterfacemanager.lastError1 = i;
        return i;
    }

*/


/*
    static int access$502(PhoneInterfaceManager phoneinterfacemanager, int i)
    {
        phoneinterfacemanager.lastError2 = i;
        return i;
    }

*/

    // Unreferenced inner class com/android/phone/PhoneInterfaceManager$MessengerWrapper$1

/* anonymous class */
    class MessengerWrapper._cls1 extends Handler
    {

        final MessengerWrapper this$1;

        public void handleMessage(Message message)
        {
            try
            {
                Log.d("PhoneInterfaceManager", (new StringBuilder()).append("MessengerWrapper callback triggered: ").append(message.what).toString());
                mMessenger.send(Message.obtain(this, message.what));
                return;
            }
            catch (RemoteException remoteexception)
            {
                remoteexception.printStackTrace();
            }
        }

            
            {
                this$1 = MessengerWrapper.this;
                super(looper);
            }
    }

}
