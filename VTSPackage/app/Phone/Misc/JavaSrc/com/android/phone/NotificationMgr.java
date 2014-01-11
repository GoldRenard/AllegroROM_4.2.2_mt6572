// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.net.Uri;
import android.os.PowerManager;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import com.android.internal.telephony.*;
import com.mediatek.notification.NotificationManagerPlus;
import com.mediatek.phone.SIMInfoWrapper;
import com.mediatek.phone.gemini.GeminiUtils;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, ClearMissedCallsService, NetworkSetting, InCallScreen, 
//            CallNotifier, PhoneUtils, MobileNetworkSettings, CallFeaturesSetting, 
//            ContactsAsyncHelper

public class NotificationMgr
    implements com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener
{
    private class QueryHandler extends AsyncQueryHandler
        implements ContactsAsyncHelper.OnImageLoadCompleteListener
    {

        final NotificationMgr this$0;

        private void dealWithMissedCall(Cursor cursor)
        {
            if (cursor != null)
            {
                if (cursor.getCount() == 1 && cursor.moveToNext())
                {
                    NotificationInfo notificationinfo1 = getNotificationInfo(cursor);
                    log((new StringBuilder()).append("query contacts for number: ").append(notificationinfo1.number).toString());
                    mQueryHandler.startQuery(-2, notificationinfo1, Uri.withAppendedPath(android.provider.ContactsContract.PhoneLookup.CONTENT_FILTER_URI, notificationinfo1.number), NotificationMgr.PHONES_PROJECTION, null, null, "number");
                } else
                {
                    NotificationInfo notificationinfo;
                    for (; cursor.moveToNext(); notifyMissedCall(notificationinfo.name, notificationinfo.number, notificationinfo.type, null, null, notificationinfo.date, notificationinfo.callVideo))
                    {
                        notificationinfo = getNotificationInfo(cursor);
                        log((new StringBuilder()).append("query contacts for number: ").append(notificationinfo.number).toString());
                    }

                }
                log("closing call log cursor.");
                cursor.close();
            }
        }

        private final NotificationInfo getNotificationInfo(Cursor cursor)
        {
            NotificationInfo notificationinfo = new NotificationInfo();
            notificationinfo.name = null;
            notificationinfo.number = cursor.getString(cursor.getColumnIndexOrThrow("number"));
            notificationinfo.type = cursor.getString(cursor.getColumnIndexOrThrow("type"));
            notificationinfo.date = cursor.getLong(cursor.getColumnIndexOrThrow("date"));
            notificationinfo.callVideo = cursor.getInt(cursor.getColumnIndexOrThrow("vtcall"));
            if (notificationinfo.number.equals("-1") || notificationinfo.number.equals("-2") || notificationinfo.number.equals("-3"))
                notificationinfo.number = null;
            log((new StringBuilder()).append("NotificationInfo constructed for number: ").append(notificationinfo.number).toString());
            return notificationinfo;
        }

        public void onImageLoadComplete(int i, Drawable drawable, Bitmap bitmap, Object obj)
        {
            log((new StringBuilder()).append("Finished loading image: ").append(drawable).toString());
            NotificationInfo notificationinfo = (NotificationInfo)obj;
            notifyMissedCall(notificationinfo.name, notificationinfo.number, notificationinfo.type, drawable, bitmap, notificationinfo.date, notificationinfo.callVideo);
        }

        protected void onQueryComplete(int i, Object obj, Cursor cursor)
        {
            switch (i)
            {
            case -2: 
                log("contact query complete.");
                if (cursor != null && obj != null)
                {
                    NotificationInfo notificationinfo = (NotificationInfo)obj;
                    boolean flag = cursor.moveToFirst();
                    Uri uri = null;
                    if (flag)
                    {
                        notificationinfo.name = cursor.getString(cursor.getColumnIndexOrThrow("display_name"));
                        long l = cursor.getLong(cursor.getColumnIndexOrThrow("_id"));
                        log((new StringBuilder()).append("contact :").append(notificationinfo.name).append(" found for phone: ").append(notificationinfo.number).append(". id : ").append(l).toString());
                        uri = ContentUris.withAppendedId(android.provider.ContactsContract.Contacts.CONTENT_URI, l);
                    }
                    if (uri != null)
                    {
                        log((new StringBuilder()).append("Start obtaining picture for the missed call. Uri: ").append(uri).toString());
                        ContactsAsyncHelper.startObtainPhotoAsync(0, mContext, uri, this, notificationinfo);
                    } else
                    {
                        log("Failed to find Uri for obtaining photo. Just send notification without it.");
                        notifyMissedCall(notificationinfo.name, notificationinfo.number, notificationinfo.type, null, null, notificationinfo.date, notificationinfo.callVideo);
                    }
                    log("closing contact cursor.");
                    cursor.close();
                    return;
                }
                // fall through

            default:
                return;

            case -1: 
                log("call log query complete.");
                dealWithMissedCall(cursor);
                return;
            }
        }

        public QueryHandler(ContentResolver contentresolver)
        {
            this$0 = NotificationMgr.this;
            super(contentresolver);
        }
    }

    private class QueryHandler.NotificationInfo
    {

        public int callVideo;
        public long date;
        public String name;
        public String number;
        final QueryHandler this$1;
        public String type;

        private QueryHandler.NotificationInfo()
        {
            this$1 = QueryHandler.this;
            super();
        }

    }

    public class StatusBarHelper
    {

        private boolean mIsExpandedViewEnabled;
        private boolean mIsNotificationEnabled;
        private boolean mIsSystemBarNavigationEnabled;
        final NotificationMgr this$0;

        private void updateStatusBar()
        {
            boolean flag = mIsExpandedViewEnabled;
            int i = 0;
            if (!flag)
                i = 0 | 0x10000;
            if (!mIsNotificationEnabled)
                i |= 0x40000;
            if (!mIsSystemBarNavigationEnabled)
                i = 0x400000 | (0x1000000 | (i | 0x200000));
            log((new StringBuilder()).append("updateStatusBar: state = 0x").append(Integer.toHexString(i)).toString());
            mStatusBarManager.disable(i);
        }

        public void enableExpandedView(boolean flag)
        {
            if (mIsExpandedViewEnabled != flag)
            {
                mIsExpandedViewEnabled = flag;
                updateStatusBar();
            }
        }

        public void enableNotificationAlerts(boolean flag)
        {
            if (mIsNotificationEnabled != flag)
            {
                mIsNotificationEnabled = flag;
                updateStatusBar();
            }
        }

        public void enableSystemBarNavigation(boolean flag)
        {
            if (mIsSystemBarNavigationEnabled != flag)
            {
                mIsSystemBarNavigationEnabled = flag;
                updateStatusBar();
            }
        }

        private StatusBarHelper()
        {
            this$0 = NotificationMgr.this;
            super();
            mIsNotificationEnabled = true;
            mIsExpandedViewEnabled = true;
            mIsSystemBarNavigationEnabled = true;
        }

    }


    static final int CALL_FORWARD_NOTIFICATION = 6;
    static final int CALL_FORWARD_NOTIFICATION_2 = 106;
    static final int CALL_FORWARD_NOTIFICATION_3 = 206;
    static final int CALL_FORWARD_NOTIFICATION_4 = 306;
    static final int CALL_FORWARD_NOTIFICATION_GEMINI[] = {
        6, 106, 206, 306
    };
    private static final String CALL_LOG_PROJECTION[] = {
        "_id", "number", "date", "duration", "type", "vtcall"
    };
    private static final int CALL_LOG_TOKEN = -1;
    private static final int CONTACT_TOKEN = -2;
    static final int DATA_DISCONNECTED_ROAMING_NOTIFICATION = 7;
    private static final boolean DBG = true;
    private static final String INTENTFORSIM1 = "com.android.notifysim1";
    private static final String INTENTFORSIM2 = "com.android.notifysim2";
    private static final String INTENTFORSIM3 = "com.android.notifysim3";
    private static final String INTENTFORSIM4 = "com.android.notifysim4";
    private static final String INTENTFORSIM_GEMINI[] = {
        "com.android.notifysim1", "com.android.notifysim2", "com.android.notifysim3", "com.android.notifysim4"
    };
    static final int IN_CALL_NOTIFICATION = 2;
    private static final String LOG_TAG = "NotificationMgr";
    private static final int MAX_VM_NUMBER_RETRIES = 5;
    private static final String MISSECALL_EXTRA = "MissedCallNumber";
    private static final String MISSEDCALL_INTENT = "com.android.phone.NotificationMgr.MissedCall_intent";
    static final int MISSED_CALL_NOTIFICATION = 1;
    static final int MMI_NOTIFICATION = 3;
    private static final String NETWORK_SELECTION_KEY_GEMINI[] = {
        "network_selection_key", "network_selection_key_2", "network_selection_key_2", "network_selection_key_2"
    };
    private static final String NETWORK_SELECTION_NAME_KEY_GEMINI[] = {
        "network_selection_name_key", "network_selection_name_key_2", "network_selection_name_key_2", "network_selection_name_key_2"
    };
    public static final int NETWORK_SELECTION_NOTIFICATION = 4;
    static final String PHONES_PROJECTION[] = {
        "number", "display_name", "_id"
    };
    static final int SELECTED_OPERATOR_FAIL_NOTIFICATION = 8;
    static final int SELECTED_OPERATOR_FAIL_NOTIFICATION_2 = 108;
    static final int SELECTED_OPERATOR_FAIL_NOTIFICATION_3 = 208;
    static final int SELECTED_OPERATOR_FAIL_NOTIFICATION_4 = 308;
    static final int SELECTED_OPERATOR_FAIL_NOTIFICATION_GEMINI[] = {
        8, 108, 208, 308
    };
    private static final int UNAVAILABLE_NOTIFY_SIM1 = 1;
    private static final int UNAVAILABLE_NOTIFY_SIM2 = 2;
    private static final int UNAVAILABLE_NOTIFY_SIM3 = 4;
    private static final int UNAVAILABLE_NOTIFY_SIM4 = 8;
    private static final int UNAVAILABLE_NOTIFY_SIM_GEMINI[] = {
        1, 2, 4, 8
    };
    private static final int VM_NUMBER_RETRY_DELAY_MILLIS = 10000;
    static final int VOICEMAIL_NOTIFICATION = 5;
    static final int VOICEMAIL_NOTIFICATION_2 = 105;
    static final int VOICEMAIL_NOTIFICATION_3 = 205;
    static final int VOICEMAIL_NOTIFICATION_4 = 305;
    static final int VOICEMAIL_NOTIFICATION_GEMINI[] = {
        5, 105, 205, 305
    };
    private static final int VOICE_COMMAND_INCOMING_CALL_NOTIFICATION = 110;
    static final String VOICE_MAIL_ACTION_GEMINI[] = {
        "VoiceMailSIM", "VoiceMailSIM", "VoiceMailSIM", "VoiceMailSIM"
    };
    private static NotificationMgr sInstance;
    private boolean CALL_FORWARD_INDICATOR_SIM2;
    private PhoneGlobals mApp;
    private CallManager mCM;
    private int mCfiIconMap[] = {
        0x7f0200ab, 0x7f0200ad, 0x7f0200ac, 0x7f0200ae, 0x7f0200aa
    };
    private Context mContext;
    private int mInCallResId;
    private NotificationManager mNotificationManager;
    private int mNumberMissedCalls;
    private Phone mPhone;
    private PowerManager mPowerManager;
    private QueryHandler mQueryHandler;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NotificationMgr this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("com.android.notifysim1") || s.equals("com.android.notifysim2") || s.equals("com.android.notifysim3") || s.equals("com.android.notifysim4"))
            {
                Intent intent1 = new Intent("android.intent.action.MAIN");
                intent1.setFlags(0x10200000);
                intent1.setComponent(new ComponentName("com.android.phone", com/android/phone/NetworkSetting.getName()));
                android.os.Bundle bundle = intent.getExtras();
                if (bundle != null)
                {
                    intent1.putExtras(bundle);
                    context.startActivity(intent1);
                }
            }
        }

            
            {
                this$0 = NotificationMgr.this;
                super();
            }
    }
;
    private int mSelectedUnavailableNotify;
    private boolean mShowingMuteIcon;
    private boolean mShowingSpeakerphoneIcon;
    private StatusBarManager mStatusBarManager;
    private Toast mToast;
    private int mVmNumberRetriesRemaining;
    public StatusBarHelper statusBarHelper;

    private NotificationMgr(PhoneGlobals phoneglobals)
    {
        mNumberMissedCalls = 0;
        mSelectedUnavailableNotify = 0;
        mVmNumberRetriesRemaining = 5;
        mQueryHandler = null;
        CALL_FORWARD_INDICATOR_SIM2 = false;
        mApp = phoneglobals;
        mContext = phoneglobals;
        mNotificationManager = (NotificationManager)phoneglobals.getSystemService("notification");
        mStatusBarManager = (StatusBarManager)phoneglobals.getSystemService("statusbar");
        mPowerManager = (PowerManager)phoneglobals.getSystemService("power");
        mPhone = phoneglobals.phone;
        mCM = phoneglobals.mCM;
        statusBarHelper = new StatusBarHelper();
        registerReceiverForNetworkSetting();
    }

    private void cancelInCall()
    {
        log("cancelInCall()...");
        mNotificationManager.cancel(2);
        mInCallResId = 0;
    }

    private void cancelMute()
    {
        if (mShowingMuteIcon)
        {
            mStatusBarManager.removeIcon("mute");
            mShowingMuteIcon = false;
        }
    }

    private void cancelNetworkSelection(int i)
    {
        int j = GeminiUtils.getIndexInArray(i, GeminiUtils.getSlots());
        if (j != -1)
            mNotificationManager.cancel(SELECTED_OPERATOR_FAIL_NOTIFICATION_GEMINI[j]);
        log((new StringBuilder()).append("cancelNetworkSelection(). index=").append(j).toString());
    }

    private void cancelSpeakerphone()
    {
        if (mShowingSpeakerphoneIcon)
        {
            mStatusBarManager.removeIcon("speakerphone");
            mShowingSpeakerphoneIcon = false;
        }
    }

    private static void configureLedNotification(Notification notification)
    {
        notification.flags = 1 | notification.flags;
        notification.defaults = 4 | notification.defaults;
    }

    private PendingIntent createClearMissedCallsIntent()
    {
        Intent intent = new Intent(mContext, com/android/phone/ClearMissedCallsService);
        intent.setAction("com.android.phone.intent.CLEAR_MISSED_CALLS");
        return PendingIntent.getService(mContext, 0, intent, 0);
    }

    private long getSimId(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(i);
        if (siminfo != null)
            return siminfo.mSimId;
        else
            return -1L;
    }

    static NotificationMgr init(PhoneGlobals phoneglobals)
    {
        com/android/phone/NotificationMgr;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_35;
        sInstance = new NotificationMgr(phoneglobals);
        sInstance.updateNotificationsAtStartup();
_L1:
        NotificationMgr notificationmgr = sInstance;
        com/android/phone/NotificationMgr;
        JVM INSTR monitorexit ;
        return notificationmgr;
        Log.wtf("NotificationMgr", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/NotificationMgr;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void log(String s)
    {
        Log.d("NotificationMgr", s);
    }

    private void notifyMute()
    {
        if (!mShowingMuteIcon)
        {
            mStatusBarManager.setIcon("mute", 0x1080076, 0, mContext.getString(0x7f0d0390));
            mShowingMuteIcon = true;
        }
    }

    private void notifySpeakerphone()
    {
        if (!mShowingSpeakerphoneIcon)
        {
            mStatusBarManager.setIcon("speakerphone", 0x1080087, 0, mContext.getString(0x7f0d038f));
            mShowingSpeakerphoneIcon = true;
        }
    }

    private void registerReceiverForNetworkSetting()
    {
        if (GeminiUtils.isGeminiSupport())
        {
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("com.android.notifysim1");
            intentfilter.addAction("com.android.notifysim2");
            intentfilter.addAction("com.android.notifysim3");
            intentfilter.addAction("com.android.notifysim4");
            mContext.registerReceiver(mReceiver, intentfilter);
        }
    }

    private void resetNewCallsFlag()
    {
        StringBuilder stringbuilder = new StringBuilder("type=");
        stringbuilder.append(3);
        stringbuilder.append(" AND new=1");
        ContentValues contentvalues = new ContentValues(1);
        contentvalues.put("new", "0");
        mContext.getContentResolver().update(android.provider.CallLog.Calls.CONTENT_URI, contentvalues, stringbuilder.toString(), null);
    }

    private void showNetworkSelection(String s, int i)
    {
        log((new StringBuilder()).append(" showNetworkSelection(").append(s).append(", ").append(i).append(")").toString());
        int j = 8;
        String s1 = mContext.getString(0x7f0d02cf);
        String s2 = mContext.getString(0x7f0d02d0, new Object[] {
            s
        });
        Notification notification = new Notification();
        notification.icon = 0x108008a;
        notification.when = 0L;
        notification.flags = 2;
        notification.tickerText = null;
        Intent intent = new Intent();
        PendingIntent pendingintent;
        if (GeminiUtils.isGeminiSupport())
        {
            int k = GeminiUtils.getIndexInArray(i, GeminiUtils.getSlots());
            log((new StringBuilder()).append("showNetworkSelection(), index=").append(k).append(" simId=").append(i).toString());
            pendingintent = null;
            if (k != -1)
            {
                j = SELECTED_OPERATOR_FAIL_NOTIFICATION_GEMINI[k];
                intent.setAction(INTENTFORSIM_GEMINI[k]);
                intent.putExtra("simId", i);
                pendingintent = PendingIntent.getBroadcast(mContext, 0, intent, 0x8000000);
            }
        } else
        {
            intent.setAction("android.intent.action.MAIN");
            intent.setFlags(0x10200000);
            intent.setComponent(new ComponentName("com.android.phone", com/android/phone/NetworkSetting.getName()));
            intent.putExtra("simId", i);
            pendingintent = PendingIntent.getActivity(mContext, 0, intent, 0x8000000);
        }
        notification.simId = getSimId(i);
        notification.simInfoType = 3;
        notification.setLatestEventInfo(mContext, s1, s2, pendingintent);
        mNotificationManager.notify(j, notification);
    }

    private void updateInCallNotification(boolean flag)
    {
        log((new StringBuilder()).append("updateInCallNotification(allowFullScreenIntent = ").append(flag).append(")...").toString());
        if (!PhoneGlobals.sVoiceCapable)
        {
            log("- non-voice-capable device; suppressing notification.");
            return;
        }
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            cancelInCall();
            cancelMute();
            cancelSpeakerphone();
            return;
        }
        boolean flag1 = mCM.hasActiveRingingCall();
        boolean flag2 = mCM.hasActiveFgCall();
        boolean flag3 = mCM.hasActiveBgCall();
        log((new StringBuilder()).append("  - hasRingingCall = ").append(flag1).toString());
        log((new StringBuilder()).append("  - hasActiveCall = ").append(flag2).toString());
        log((new StringBuilder()).append("  - hasHoldingCall = ").append(flag3).toString());
        boolean flag4 = mApp.isShowingCallScreen();
        InCallScreen incallscreen = mApp.getInCallScreenInstance();
        if (incallscreen != null)
            if (!incallscreen.isNeedToUpdateInCallNotification())
                flag4 = true;
            else
                flag4 = false;
        if (flag1)
            flag4 = false;
        boolean flag5 = mApp.notifier.getVoicePrivacyState();
        if (flag5)
            flag4 = false;
        if (flag4)
        {
            log("- suppressNotification = true; reducing clutter in status bar...");
            cancelInCall();
            cancelSpeakerphone();
            cancelMute();
            return;
        }
        int i;
        if (flag1)
            i = 0x7f0200a8;
        else
        if (!flag2 && flag3)
        {
            if (flag5)
                i = 0x7f0200b1;
            else
                i = 0x7f0200af;
        } else
        if (flag5)
            i = 0x7f0200b0;
        else
            i = 0x7f0200a8;
        log((new StringBuilder()).append("- Updating status bar icon: resId = ").append(i).toString());
        mInCallResId = i;
        Call call = mCM.getFirstActiveRingingCall();
        Call call1 = mCM.getActiveFgCall();
        Call call2 = mCM.getFirstActiveBgCall();
        Call call3;
        if (flag1)
            call3 = call;
        else
        if (flag2)
            call3 = call1;
        else
            call3 = call2;
        Connection connection = call3.getEarliestConnection();
        android.app.Notification.Builder builder = new android.app.Notification.Builder(mContext);
        builder.setSmallIcon(mInCallResId).setOngoing(true);
        Intent intent = PhoneGlobals.createInCallIntent();
        intent.putExtra("com.android.phone.extra.notification", true);
        PendingIntent pendingintent = PendingIntent.getActivity(mContext, 0, PhoneGlobals.createInCallIntent(), 0);
        builder.setContentIntent(pendingintent);
        CallerInfo callerinfo = null;
        if (connection != null)
        {
            Object obj = connection.getUserData();
            if (obj instanceof CallerInfo)
                callerinfo = (CallerInfo)obj;
            else
            if (obj instanceof PhoneUtils.CallerInfoToken)
            {
                callerinfo = ((PhoneUtils.CallerInfoToken)obj).currentInfo;
            } else
            {
                Log.w("NotificationMgr", "CallerInfo isn't available while Call object is available.");
                callerinfo = null;
            }
        }
        boolean flag6;
        if (callerinfo != null)
        {
            boolean flag7 = callerinfo.isCachedPhotoCurrent;
            flag6 = false;
            if (flag7)
                if (callerinfo.cachedPhotoIcon != null)
                {
                    builder.setLargeIcon(callerinfo.cachedPhotoIcon);
                    flag6 = true;
                } else
                if (callerinfo.cachedPhoto instanceof BitmapDrawable)
                {
                    log("- BitmapDrawable found for large icon");
                    builder.setLargeIcon(((BitmapDrawable)callerinfo.cachedPhoto).getBitmap());
                    flag6 = true;
                } else
                {
                    log((new StringBuilder()).append("- Failed to fetch icon from CallerInfo's cached photo. (cachedPhotoIcon: ").append(callerinfo.cachedPhotoIcon).append(", cachedPhoto: ").append(callerinfo.cachedPhoto).append(").").append(" Ignore it.").toString());
                    flag6 = false;
                }
            if (!flag6 && callerinfo.photoResource > 0)
            {
                log((new StringBuilder()).append("- BitmapDrawable nor person Id not found for large icon. Use photoResource: ").append(callerinfo.photoResource).toString());
                Drawable drawable = mContext.getResources().getDrawable(callerinfo.photoResource);
                if (drawable instanceof BitmapDrawable)
                {
                    builder.setLargeIcon(((BitmapDrawable)drawable).getBitmap());
                    flag6 = true;
                } else
                {
                    log("- PhotoResource was found but it didn't return BitmapDrawable. Ignore it");
                }
            }
        } else
        {
            log("- CallerInfo not found. Use the same icon as in the status bar.");
            flag6 = false;
        }
        if (!flag6)
            log("- No useful Bitmap was found for the photo. Use the same icon as in the status bar.");
        if (connection != null)
        {
            log("- Updating context text and chronometer.");
            if (flag1)
            {
                builder.setContentText(mContext.getString(0x7f0d02ca));
                builder.setUsesChronometer(false);
            } else
            if (flag3 && !flag2)
            {
                builder.setContentText(mContext.getString(0x7f0d02c9));
                builder.setUsesChronometer(false);
            } else
            {
                long l = connection.getDurationMillis();
                log((new StringBuilder()).append("callDurationMsec: ").append(l).toString());
                if (l > 0L)
                {
                    builder.setUsesChronometer(true);
                    builder.setWhen(System.currentTimeMillis() - l);
                }
                int j = 0x7f0d02c8;
                Call call4 = mCM.getActiveFgCall();
                if (TelephonyCapabilities.canDistinguishDialingAndConnected(call4.getPhone().getPhoneType()) && call4.isDialingOrAlerting())
                    j = 0x7f0d02c3;
                builder.setContentText(mContext.getString(j));
            }
        } else
        {
            Log.w("NotificationMgr", "updateInCallNotification: null connection, can't set exp view line 1.");
        }
        String s = "";
        if (call3 != null && PhoneUtils.isConferenceCall(call3))
            s = mContext.getString(0x7f0d02bc);
        else
        if (call3 != null)
            s = PhoneUtils.getCompactNameFromCallerInfo(PhoneUtils.startGetCallerInfo(mContext, call3, this, this).currentInfo, mContext);
        log("- Updating expanded view: line 2 'xxxxxxx'");
        builder.setContentTitle(s);
        if (flag1)
        {
            log("- Using hi-pri notification for ringing call!");
            builder.setPriority(1);
            builder.setTicker(s);
            if (flag)
            {
                log((new StringBuilder()).append("- Setting fullScreenIntent: ").append(pendingintent).toString());
                if (!mApp.isShowingCallScreen())
                {
                    Log.i("NotificationMgr", "updateInCallNotification: call-waiting! force relaunch...");
                    mNotificationManager.cancel(2);
                }
                mApp.startActivity(intent);
            }
        } else
        {
            builder.setPriority(1);
            log("Will show \"hang-up\" action in the ongoing active call Notification");
            builder.addAction(0x7f0200a9, mContext.getText(0x7f0d02d1), PhoneGlobals.createHangUpOngoingCallPendingIntent(mContext));
        }
        Notification notification = builder.getNotification();
        log((new StringBuilder()).append("Notifying IN_CALL_NOTIFICATION: ").append(notification).toString());
        mNotificationManager.notify(2, notification);
        updateSpeakerNotification();
        updateMuteNotification();
    }

    private void updateNotificationsAtStartup()
    {
        log("updateNotificationsAtStartup()...");
        mQueryHandler = new QueryHandler(mContext.getContentResolver());
        StringBuilder stringbuilder = new StringBuilder("type=");
        stringbuilder.append(3);
        stringbuilder.append(" AND new=1");
        log("- start call log query...");
        mQueryHandler.startQuery(-1, null, android.provider.CallLog.Calls.CONTENT_URI, CALL_LOG_PROJECTION, stringbuilder.toString(), null, "date DESC");
        if (mCM.getState() != com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
        {
            log("Phone is idle, canceling notification.");
            cancelInCall();
            return;
        } else
        {
            log("Phone is offhook, updating notification.");
            updateInCallNotification();
            return;
        }
    }

    void cancelCallInProgressNotifications()
    {
        log("cancelCallInProgressNotifications()...");
        if (mInCallResId == 0)
        {
            return;
        } else
        {
            log((new StringBuilder()).append("cancelCallInProgressNotifications: ").append(mInCallResId).toString());
            cancelInCall();
            cancelMute();
            cancelSpeakerphone();
            return;
        }
    }

    void cancelMissedCallNotification()
    {
        mNumberMissedCalls = 0;
        mNotificationManager.cancel(1);
    }

    public void cancelVoiceCommandNotification()
    {
        mNotificationManager.cancel(110);
    }

    public int getMissedCallCount()
    {
        return mNumberMissedCalls;
    }

    void hideDataDisconnectedRoaming()
    {
        log("hideDataDisconnectedRoaming()...");
        mNotificationManager.cancel(7);
    }

    void notifyMissedCall(String s, String s1, String s2, Drawable drawable, Bitmap bitmap, long l, 
            int i)
    {
        Intent intent = PhoneGlobals.createCallLogIntent();
        if (!PhoneGlobals.sVoiceCapable)
        {
            log("notifyMissedCall: non-voice-capable device, not posting notification");
            return;
        }
        log((new StringBuilder()).append("notifyMissedCall(). name: ").append(s).append(", number: ").append(s1).append(", label: ").append(s2).append(", photo: ").append(drawable).append(", photoIcon: ").append(bitmap).append(", date: ").append(l).toString());
        mNumberMissedCalls = 1 + mNumberMissedCalls;
        String s3;
        if (s != null && TextUtils.isGraphic(s))
            s3 = s;
        else
        if (!TextUtils.isEmpty(s1))
            s3 = s1;
        else
            s3 = mContext.getString(0x7f0d0176);
        int j;
        String s4;
        if (mNumberMissedCalls == 1)
        {
            j = 0x7f0d02c4;
            s4 = s3;
        } else
        {
            j = 0x7f0d02c5;
            Context context = mContext;
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(mNumberMissedCalls);
            s4 = context.getString(0x7f0d02c6, aobj);
        }
        int k;
        if (1 == i)
            k = 0x7f020088;
        else
            k = 0x108007f;
        android.app.Notification.Builder builder = new android.app.Notification.Builder(mContext);
        builder.setSmallIcon(k).setTicker(mContext.getString(0x7f0d02c7, new Object[] {
            s3
        })).setWhen(l).setContentTitle(mContext.getText(j)).setContentText(s4).setContentIntent(PendingIntent.getActivity(mContext, 0, intent, 0)).setAutoCancel(true);
        if (mNumberMissedCalls == 1 && !TextUtils.isEmpty(s1) && !TextUtils.equals(s1, mContext.getString(0x7f0d0177)) && !TextUtils.equals(s1, mContext.getString(0x7f0d0176)))
        {
            log((new StringBuilder()).append("Add actions with the number ").append(s1).toString());
            builder.addAction(0x7f0200a8, mContext.getString(0x7f0d02d2), PhoneGlobals.getCallBackPendingIntent(mContext, s1));
            builder.addAction(0x7f02008a, mContext.getString(0x7f0d02d3), PhoneGlobals.getSendSmsFromNotificationPendingIntent(mContext, s1));
            if (bitmap != null)
                builder.setLargeIcon(bitmap);
            else
            if (drawable instanceof BitmapDrawable)
                builder.setLargeIcon(((BitmapDrawable)drawable).getBitmap());
        } else
        {
            log((new StringBuilder()).append("Suppress actions. number: ").append(s1).append(", missedCalls: ").append(mNumberMissedCalls).toString());
        }
        PendingIntent pendingintent = PendingIntent.getBroadcast(mContext, 0, intent, 0);
        NotificationManagerPlus.notify(1, (new com.mediatek.notification.NotificationPlus.Builder(mContext)).setTitle(mContext.getString(j)).setMessage(mContext.getString(0x7f0d02c7, new Object[] {
            s3
        })).setPositiveButton(mContext.getString(0x7f0d0192), pendingintent).create());
        Notification notification = builder.getNotification();
        configureLedNotification(notification);
        mNotificationManager.notify(1, notification);
    }

    public void onQueryComplete(int i, Object obj, CallerInfo callerinfo)
    {
        log("CallerInfo query complete (for NotificationMgr), updating in-call notification..");
        log((new StringBuilder()).append("- cookie: ").append(obj).toString());
        log((new StringBuilder()).append("- ci: ").append(callerinfo).toString());
        if (obj == this)
        {
            log((new StringBuilder()).append("- compactName is now: ").append(PhoneUtils.getCompactNameFromCallerInfo(callerinfo, mContext)).toString());
            log("- updating notification after query complete...");
            updateInCallNotification();
            return;
        } else
        {
            Log.w("NotificationMgr", (new StringBuilder()).append("onQueryComplete: caller-id query from unknown source! cookie = ").append(obj).toString());
            return;
        }
    }

    public void postTransientNotification(int i, CharSequence charsequence)
    {
        if (mToast != null)
            mToast.cancel();
        mToast = Toast.makeText(mContext, charsequence, 1);
        mToast.show();
    }

    void resetMissedCallNumber()
    {
        mNumberMissedCalls = 0;
        resetNewCallsFlag();
    }

    void showDataDisconnectedRoaming(int i)
    {
        log("showDataDisconnectedRoaming()...");
        Intent intent;
        if (GeminiUtils.isGeminiSupport())
        {
            intent = new Intent();
            intent.setComponent(new ComponentName("com.android.settings", "com.android.settings.gemini.SimDataRoamingSettings"));
        } else
        {
            intent = new Intent(mContext, com/android/phone/MobileNetworkSettings);
        }
        Notification notification = new Notification(0x108008a, null, System.currentTimeMillis());
        notification.setLatestEventInfo(mContext, mContext.getString(0x7f0d020f), mContext.getString(0x7f0d0212), PendingIntent.getActivity(mContext, 0, intent, 0));
        mNotificationManager.notify(7, notification);
    }

    public void showVoiceCommandNotification(String s, String s1)
    {
        Notification notification = (new android.app.Notification.Builder(mContext)).setContentTitle(mContext.getString(0x7f0d013c)).setTicker(mContext.getString(0x7f0d013b, new Object[] {
            s, s1
        })).setContentText(mContext.getString(0x7f0d013d)).setSmallIcon(0x2020137).build();
        mNotificationManager.notify(110, notification);
    }

    void updateCfi(boolean flag, int i)
    {
        log((new StringBuilder()).append("updateCfi(): ").append(flag).append("slotId:").append(i).toString());
        int j = 6;
        int k = GeminiUtils.getIndexInArray(i, GeminiUtils.getSlots());
        if (k != -1)
            j = CALL_FORWARD_NOTIFICATION_GEMINI[k];
        if (flag)
        {
            int l = 0x1080085;
            android.provider.Telephony.SIMInfo siminfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(i);
            if (siminfo != null && siminfo.mColor >= 0 && siminfo.mColor < mCfiIconMap.length)
                l = mCfiIconMap[siminfo.mColor];
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.addFlags(0x14000000);
            intent.setClassName("com.android.phone", com/android/phone/CallFeaturesSetting.getName());
            intent.putExtra("simId", i);
            Notification notification = new Notification(l, null, 0L);
            notification.setLatestEventInfo(mContext, mContext.getString(0x7f0d01c6), mContext.getString(0x7f0d01c9), PendingIntent.getActivity(mContext, 0, intent, 0));
            notification.flags = 2 | notification.flags;
            notification.simId = getSimId(i);
            notification.simInfoType = 3;
            mNotificationManager.notify(j, notification);
            return;
        } else
        {
            mNotificationManager.cancel(j);
            return;
        }
    }

    public void updateInCallNotification()
    {
        updateInCallNotification(false);
    }

    void updateMuteNotification()
    {
        if (mApp.isShowingCallScreen())
        {
            cancelMute();
            return;
        }
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK && PhoneUtils.getMute())
        {
            log("updateMuteNotification: MUTED");
            notifyMute();
            return;
        } else
        {
            log("updateMuteNotification: not muted (or not offhook)");
            cancelMute();
            return;
        }
    }

    void updateMwi(boolean flag, int i)
    {
label0:
        {
            log((new StringBuilder()).append("updateMwi(): ").append(flag).toString());
            log((new StringBuilder()).append("updateMwi(): ").append(flag).append("simId:").append(i).toString());
            int j = GeminiUtils.getIndexInArray(i, GeminiUtils.getSlots());
            if (flag)
            {
                String s = mContext.getString(0x7f0d001a);
                String s1 = GeminiUtils.getVoiceMailNumber(mPhone, i);
                log((new StringBuilder()).append("- got vm number: '").append(s1).append("'").toString());
                boolean flag1 = GeminiUtils.getIccRecordsLoaded(mPhone, i);
                if (s1 == null && !flag1)
                {
                    log("- Null vm number: SIM records not loaded (yet)...");
                    int k = mVmNumberRetriesRemaining;
                    mVmNumberRetriesRemaining = k - 1;
                    if (k > 0)
                    {
                        log("  - Retrying in 10000 msec...");
                        mApp.notifier.sendMwiChangedDelayed(10000L, i);
                        break label0;
                    }
                    Log.w("NotificationMgr", "NotificationMgr.updateMwi: getVoiceMailNumber() failed after 5 retries; giving up.");
                }
                String s2 = mContext.getString(0x7f0d02cb);
                Intent intent = new Intent();
                if (!TextUtils.isEmpty(s1))
                    intent.putExtra("voicemail_number", s1);
                else
                    intent.putExtra("voicemail_number", "");
                if (j >= 0)
                    intent.setAction(VOICE_MAIL_ACTION_GEMINI[j]);
                intent.setComponent(new ComponentName("com.android.phone", "com.mediatek.phone.VoicemailDialog"));
                log((new StringBuilder()).append("updateMwi(): new intent CALL, simId: ").append(i).toString());
                intent.putExtra("simId", i);
                PendingIntent pendingintent = PendingIntent.getActivity(mContext, 0, intent, 0x8000000);
                Notification notification = new Notification(0x108007e, null, System.currentTimeMillis());
                notification.setLatestEventInfo(mContext, s, s2, pendingintent);
                notification.simId = getSimId(i);
                notification.simInfoType = 3;
                notification.defaults = 1 | notification.defaults;
                notification.defaults = 2 | notification.defaults;
                notification.flags = 0x20 | notification.flags;
                configureLedNotification(notification);
                if (j != -1)
                {
                    mNotificationManager.notify(VOICEMAIL_NOTIFICATION_GEMINI[j], notification);
                    return;
                }
            } else
            if (j != -1)
            {
                mNotificationManager.cancel(VOICEMAIL_NOTIFICATION_GEMINI[j]);
                return;
            }
        }
    }

    void updateNetworkSelection(int i, int j)
    {
label0:
        {
            boolean flag = true;
            if (mPhone.getPhoneType() == flag)
            {
                SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(mContext);
                int k = GeminiUtils.getIndexInArray(j, GeminiUtils.getSlots());
                if (k == -1)
                    break label0;
                String s = sharedpreferences.getString(NETWORK_SELECTION_NAME_KEY_GEMINI[k], "");
                if (TextUtils.isEmpty(s) && k != -1)
                    s = sharedpreferences.getString(NETWORK_SELECTION_KEY_GEMINI[k], "");
                log((new StringBuilder()).append("updateNetworkSelection() serviceState=").append(i).append(", networkSelection=").append(s).toString());
                int l = mSelectedUnavailableNotify & UNAVAILABLE_NOTIFY_SIM_GEMINI[k];
                if (i == flag && !TextUtils.isEmpty(s))
                {
                    if (GeminiUtils.getIccCard(mPhone, j).getState() != com.android.internal.telephony.IccCardConstants.State.READY)
                    {
                        log((new StringBuilder()).append("slot ").append(j).append(" not ready, don't alert network service notification").toString());
                    } else
                    {
                        StringBuilder stringbuilder = (new StringBuilder()).append("updateNetworkSelection() notify=");
                        if (l != 0)
                            flag = false;
                        log(stringbuilder.append(flag).toString());
                        if (l == 0)
                        {
                            showNetworkSelection(s, j);
                            mSelectedUnavailableNotify = mSelectedUnavailableNotify | UNAVAILABLE_NOTIFY_SIM_GEMINI[k];
                            return;
                        }
                    }
                } else
                if (l > 0)
                {
                    cancelNetworkSelection(j);
                    mSelectedUnavailableNotify = mSelectedUnavailableNotify & (-1 ^ UNAVAILABLE_NOTIFY_SIM_GEMINI[k]);
                    return;
                }
            }
            return;
        }
        log((new StringBuilder()).append("updateNetworkSelection() waring. index=-1, slot ").append(j).append(" not ready").toString());
    }

    public void updateNotificationAndLaunchIncomingCallUi()
    {
        updateInCallNotification(true);
    }

    public void updateSpeakerNotification()
    {
        AudioManager audiomanager = (AudioManager)mContext.getSystemService("audio");
        boolean flag;
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK && audiomanager.isSpeakerphoneOn())
            flag = true;
        else
            flag = false;
        String s;
        if (flag)
            s = "updateSpeakerNotification: speaker ON";
        else
            s = "updateSpeakerNotification: speaker OFF (or not offhook)";
        log(s);
        updateSpeakerNotification(flag);
    }

    public void updateSpeakerNotification(boolean flag)
    {
        log((new StringBuilder()).append("updateSpeakerNotification(").append(flag).append(")...").toString());
        if (mApp.isShowingCallScreen())
        {
            cancelSpeakerphone();
            return;
        }
        if (flag)
        {
            notifySpeakerphone();
            return;
        } else
        {
            cancelSpeakerphone();
            return;
        }
    }





}
