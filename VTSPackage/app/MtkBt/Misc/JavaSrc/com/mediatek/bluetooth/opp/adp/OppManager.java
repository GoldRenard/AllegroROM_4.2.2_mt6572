// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.app.Notification;
import android.app.NotificationManager;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteFullException;
import android.net.Uri;
import android.os.*;
import android.util.Pair;
import android.widget.Toast;
import com.mediatek.activity.CancelableActivity;
import com.mediatek.bluetooth.opp.mmi.*;
import com.mediatek.bluetooth.share.BluetoothShareNotification;
import com.mediatek.bluetooth.share.BluetoothShareTask;
import com.mediatek.bluetooth.util.*;
import java.io.File;
import java.util.*;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            OppNotificationFactory, OppService

public class OppManager
    implements android.os.Handler.Callback
{
    static class LooperThread extends Thread
    {

        private android.os.Handler.Callback mCallback;
        public Handler mHandler;
        private int mThreadPriority;

        public void run()
        {
            Process.setThreadPriority(mThreadPriority);
            Looper.prepare();
            Looper.loop();
        }

        public LooperThread(String s, int i, android.os.Handler.Callback callback)
        {
            super(s);
            mThreadPriority = i;
            mCallback = callback;
            mHandler = new Handler(mCallback);
        }
    }

    public class OppcTaskTransferThread extends Thread
    {

        private Object mParam[];
        final OppManager this$0;

        public void oppcHandleTask()
        {
            this;
            JVM INSTR monitorenter ;
            long l;
            ArrayList arraylist;
            String s;
            String s1;
            Iterator iterator;
            l = System.currentTimeMillis();
            BluetoothDevice bluetoothdevice = (BluetoothDevice)mParam[0];
            arraylist = (ArrayList)mParam[1];
            s = bluetoothdevice.getName();
            s1 = bluetoothdevice.getAddress();
            iterator = arraylist.iterator();
_L5:
            BluetoothShareTask bluetoothsharetask;
            UriData uridata;
            if (!iterator.hasNext())
                break MISSING_BLOCK_LABEL_318;
            bluetoothsharetask = (BluetoothShareTask)iterator.next();
            uridata = UriDataUtils.getUriData(mApplicationContext, Uri.parse(bluetoothsharetask.getObjectUri()));
            if (uridata == null) goto _L2; else goto _L1
_L1:
            bluetoothsharetask.setObjectName(uridata.getName());
            bluetoothsharetask.setData(uridata.getData());
            bluetoothsharetask.setTotalBytes(uridata.getSize());
            bluetoothsharetask.setState(1);
_L6:
            bluetoothsharetask.setPeerName(s);
            bluetoothsharetask.setPeerAddr(s1);
            bluetoothsharetask.setCreationDate(l);
            Uri uri = mContentResolver.insert(com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI, bluetoothsharetask.getContentValues());
            if (uri == null) goto _L4; else goto _L3
_L3:
            bluetoothsharetask.setId(Integer.parseInt(uri.getLastPathSegment()));
            notifyOppTask(bluetoothsharetask);
              goto _L5
            SQLiteFullException sqlitefullexception;
            sqlitefullexception;
            mBgRunner.mHandler.sendMessage(mBgRunner.mHandler.obtainMessage(2, mApplicationContext.getString(0x7f05003c)));
            bluetoothsharetask.setState(9);
            OppLog.w("oppcHandleTask::insert to db exception");
            sqlitefullexception.printStackTrace();
            arraylist.clear();
_L7:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            OppLog.w((new StringBuilder()).append("oppcSubmitTask - invalid task object: ").append(bluetoothsharetask.getPrintableString()).toString());
            bluetoothsharetask.setState(7);
              goto _L6
            Exception exception;
            exception;
            throw exception;
_L4:
            OppLog.w("newUri is null");
              goto _L7
            arraylist.clear();
            Intent intent = new Intent(mApplicationContext, com/mediatek/bluetooth/opp/adp/OppService);
            intent.setAction("com.mediatek.bluetooth.opp.action.OPPC_START");
            mApplicationContext.startService(intent);
              goto _L7
        }

        public void run()
        {
            OppLog.d((new StringBuilder()).append("Oppc Task handler thread start: thread name - ").append(getName()).toString());
            Process.setThreadPriority(10);
            oppcHandleTask();
            OppLog.d((new StringBuilder()).append("Oppc Task handler thread end: thread name - ").append(getName()).toString());
        }

        public OppcTaskTransferThread(String s, Object aobj[])
        {
            this$0 = OppManager.this;
            super(s);
            mParam = aobj;
        }
    }


    private static final int MSG_OPPC_SUBMIT_TASK = 1;
    private static final int MSG_SHOW_TOAST = 2;
    private static final int WHITELIST_DURATION_MS = 15000;
    private static OppManager sInstance = null;
    private Context mApplicationContext;
    private LooperThread mBgRunner;
    private BluetoothAdapter mBluetoothAdapter;
    private ContentResolver mContentResolver;
    private NotificationManager mNotificationManager;
    private OppService mOppService;
    private ArrayList mOppcTaskCache;
    private OppcTaskTransferThread mOppcTaskTransfer;
    public BluetoothShareTask mOppsTask;
    private PowerManager mPowerManager;
    private android.os.PowerManager.WakeLock mWakeLock;
    private List mWhitelist;

    private OppManager()
    {
        mOppcTaskCache = null;
        mOppsTask = null;
        mBgRunner = new LooperThread("OppManagerExecuter", 10, this);
        mWhitelist = new ArrayList();
    }

    private void cancelOngoingNotification(BluetoothShareTask bluetoothsharetask, int i)
    {
        if (bluetoothsharetask.isHandover())
        {
            Intent intent = new Intent("android.btopp.intent.action.BT_OPP_TRANSFER_DONE");
            if (bluetoothsharetask.getDirection() == com.mediatek.bluetooth.share.BluetoothShareTask.Direction.in)
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION", 0);
            else
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION", 1);
            intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_ID", bluetoothsharetask.getId());
            intent.putExtra("android.btopp.intent.extra.BT_OPP_ADDRESS", bluetoothsharetask.getPeerAddr());
            if (8 == bluetoothsharetask.getState())
            {
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_STATUS", 0);
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_URI", bluetoothsharetask.getData());
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_MIMETYPE", bluetoothsharetask.getMimeType());
            } else
            {
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_STATUS", 1);
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_MIMETYPE", bluetoothsharetask.getMimeType());
                intent.putExtra("com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_OBJECT_NAME", bluetoothsharetask.getObjectName());
                intent.putExtra("com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_FILE_SIZE", bluetoothsharetask.getTotalBytes());
                intent.putExtra("com.mediatek.bluetooth.opp.extra.BT_OPP_TRANSFER_DONE_SIZE", bluetoothsharetask.getDoneBytes());
            }
            mApplicationContext.sendBroadcast(intent, "com.android.permission.HANDOVER_STATUS");
            return;
        } else
        {
            mNotificationManager.cancel(i);
            return;
        }
    }

    private void cleanupWhitelist()
    {
        long l = SystemClock.elapsedRealtime();
        Iterator iterator = mWhitelist.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (l - ((Long)((Pair)iterator.next()).second).longValue() > 15000L)
                iterator.remove();
        } while (true);
    }

    public static OppManager getInstance(Context context)
    {
        com/mediatek/bluetooth/opp/adp/OppManager;
        JVM INSTR monitorenter ;
        OppManager oppmanager;
        if (sInstance == null)
        {
            sInstance = new OppManager();
            sInstance.init(context);
        }
        oppmanager = sInstance;
        com/mediatek/bluetooth/opp/adp/OppManager;
        JVM INSTR monitorexit ;
        return oppmanager;
        Exception exception;
        exception;
        throw exception;
    }

    private void init(Context context)
    {
        mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mBluetoothAdapter == null)
        {
            OppLog.w("Bluetooth is not supported in this hardware platform (null BluetoothAdapter).");
            return;
        } else
        {
            mApplicationContext = context.getApplicationContext();
            mContentResolver = mApplicationContext.getContentResolver();
            mNotificationManager = (NotificationManager)context.getSystemService("notification");
            mPowerManager = (PowerManager)mApplicationContext.getSystemService("power");
            mWakeLock = mPowerManager.newWakeLock(1, "Bluetooth");
            mBgRunner.start();
            return;
        }
    }

    public void acquireWakeLock()
    {
        mWakeLock.acquire();
    }

    public void addToWhitelist(String s)
    {
        this;
        JVM INSTR monitorenter ;
        if (s != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        Iterator iterator = mWhitelist.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            if (((String)((Pair)iterator.next()).first).equals(s))
                iterator.remove();
        } while (true);
        break MISSING_BLOCK_LABEL_64;
        Exception exception;
        exception;
        throw exception;
        mWhitelist.add(new Pair(s, Long.valueOf(SystemClock.elapsedRealtime())));
          goto _L1
    }

    protected void cancelAllNotification()
    {
        mNotificationManager.cancelAll();
    }

    protected void cancelNotification(int i)
    {
        mNotificationManager.cancel(NotificationFactory.getProfileNotificationId(12, i));
    }

    public String getDeviceName(String s)
    {
        return mBluetoothAdapter.getRemoteDevice(s).getName();
    }

    public List getOppTaskList(Cursor cursor)
    {
        Object obj;
        if (cursor == null)
        {
            obj = Collections.emptyList();
        } else
        {
            obj = new ArrayList(cursor.getCount());
            cursor.moveToFirst();
            for (; !cursor.isAfterLast(); cursor.moveToNext())
            {
                int i = cursor.getInt(cursor.getColumnIndex("_id"));
                ((List) (obj)).add(Uri.parse((new StringBuilder()).append(com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI).append("/").append(i).toString()));
            }

        }
        return ((List) (obj));
    }

    public boolean handleMessage(Message message)
    {
        switch (message.what)
        {
        case 2: // '\002'
            String s = (String)message.obj;
            Toast.makeText(mApplicationContext, s, 1).show();
            return false;

        case 1: // '\001'
            Object aobj[] = (Object[])(Object[])message.obj;
            Object aobj1[] = new Object[2];
            aobj1[0] = aobj[0];
            aobj1[1] = aobj[1];
            mOppcTaskTransfer = new OppcTaskTransferThread("BtOppcTaskTransferThread", aobj1);
            mOppcTaskTransfer.start();
            return false;
        }
        return false;
    }

    public boolean isWhitelisted(String s)
    {
        this;
        JVM INSTR monitorenter ;
        Iterator iterator;
        cleanupWhitelist();
        iterator = mWhitelist.iterator();
_L4:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        boolean flag1 = ((String)((Pair)iterator.next()).first).equals(s);
        if (!flag1) goto _L4; else goto _L3
_L3:
        boolean flag = true;
_L6:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        flag = false;
        if (true) goto _L6; else goto _L5
_L5:
        Exception exception;
        exception;
        throw exception;
    }

    protected void notifyOppTask(BluetoothShareTask bluetoothsharetask)
    {
        int i = NotificationFactory.getProfileNotificationId(12, bluetoothsharetask.getId());
        if (bluetoothsharetask.getState() == 8 && bluetoothsharetask.getDirection() != com.mediatek.bluetooth.share.BluetoothShareTask.Direction.out && !bluetoothsharetask.isHandover())
        {
            OppLog.i((new StringBuilder()).append("create MediaScanner for newly received file:").append(bluetoothsharetask.getData()).append(",").append(bluetoothsharetask.getMimeType()).toString());
            new MediaScanner(mApplicationContext, bluetoothsharetask.getData(), bluetoothsharetask.getMimeType(), null, 0);
        }
        switch (bluetoothsharetask.getState())
        {
        case 2: // '\002'
        case 5: // '\005'
            cancelOngoingNotification(bluetoothsharetask, i);
            return;

        case 3: // '\003'
        case 6: // '\006'
            if (!bluetoothsharetask.isHandover())
                CancelableActivity.sendCancelActivityIntent(mApplicationContext, bluetoothsharetask.getId());
            cancelOngoingNotification(bluetoothsharetask, i);
            return;

        case 7: // '\007'
        case 8: // '\b'
            if (bluetoothsharetask.getState() == 7)
            {
                String s = bluetoothsharetask.getPeerName();
                if (s == null)
                {
                    String s1 = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(bluetoothsharetask.getPeerAddr()).getName();
                    if (s1 != null)
                        s = s1;
                    else
                        s = mApplicationContext.getString(0x7f05003a);
                }
                if (bluetoothsharetask.getDirection() == com.mediatek.bluetooth.share.BluetoothShareTask.Direction.out)
                {
                    Handler handler2 = mBgRunner.mHandler;
                    Handler handler3 = mBgRunner.mHandler;
                    Context context1 = mApplicationContext;
                    Object aobj1[] = new Object[2];
                    aobj1[0] = bluetoothsharetask.getObjectName();
                    aobj1[1] = s;
                    handler2.sendMessage(handler3.obtainMessage(2, context1.getString(0x7f050083, aobj1)));
                } else
                if (bluetoothsharetask.getDirection() == com.mediatek.bluetooth.share.BluetoothShareTask.Direction.in)
                {
                    Handler handler = mBgRunner.mHandler;
                    Handler handler1 = mBgRunner.mHandler;
                    Context context = mApplicationContext;
                    Object aobj[] = new Object[2];
                    aobj[0] = bluetoothsharetask.getObjectName();
                    aobj[1] = s;
                    handler.sendMessage(handler1.obtainMessage(2, context.getString(0x7f050082, aobj)));
                }
            }
            if (!bluetoothsharetask.isHandover())
            {
                Notification notification1 = BluetoothShareNotification.getShareManagementNotification(mApplicationContext);
                mNotificationManager.notify(NotificationFactory.NID_SHARE_MGMT_NOTIFICATION, notification1);
                CancelableActivity.sendCancelActivityIntent(mApplicationContext, bluetoothsharetask.getId());
            }
            cancelOngoingNotification(bluetoothsharetask, i);
            return;

        case 4: // '\004'
            if (bluetoothsharetask.isHandover())
            {
                long l = bluetoothsharetask.getTotalBytes();
                float f;
                if (l == -1L)
                    f = -1F;
                else
                    f = (float)bluetoothsharetask.getDoneBytes() / (float)l;
                Intent intent = new Intent("android.btopp.intent.action.BT_OPP_TRANSFER_PROGRESS");
                if (bluetoothsharetask.getDirection() == com.mediatek.bluetooth.share.BluetoothShareTask.Direction.in)
                    intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION", 0);
                else
                    intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_DIRECTION", 1);
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_ID", bluetoothsharetask.getId());
                intent.putExtra("android.btopp.intent.extra.BT_OPP_TRANSFER_PROGRESS", f);
                intent.putExtra("android.btopp.intent.extra.BT_OPP_ADDRESS", bluetoothsharetask.getPeerAddr());
                mApplicationContext.sendBroadcast(intent, "com.android.permission.HANDOVER_STATUS");
                return;
            } else
            {
                Notification notification = OppNotificationFactory.getOppOngoingNotification(mApplicationContext, bluetoothsharetask);
                mNotificationManager.notify(i, notification);
                return;
            }
        }
        OppLog.d((new StringBuilder()).append("cancel notification for unhandled state[").append(bluetoothsharetask.getState()).append("] - id:").append(i).toString());
        mNotificationManager.cancel(i);
    }

    public void oppAbortDeviceTasks(String s)
    {
        if (s != null)
        {
            OppLog.i((new StringBuilder()).append("oppAbortDeviceTasks(): ").append(s).toString());
            ContentResolver contentresolver = mContentResolver;
            Uri uri = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
            String as[] = {
                "_id"
            };
            String as1[] = new String[3];
            as1[0] = s;
            as1[1] = Integer.toString(4);
            as1[2] = Integer.toString(1);
            Uri uri1;
            for (Iterator iterator = getOppTaskList(contentresolver.query(uri, as, "peer_addr = ? and state in ( ?, ? )", as1, null)).iterator(); iterator.hasNext(); oppAbortTask(uri1))
            {
                uri1 = (Uri)iterator.next();
                OppLog.i((new StringBuilder()).append("oppAbortDeviceTasks(): aborting task ").append(uri1).toString());
            }

        }
    }

    public void oppAbortTask(Uri uri)
    {
        if (mOppService == null)
        {
            OppLog.e((new StringBuilder()).append("oppService is null => can't abort task:[").append(uri).append("]").toString());
        } else
        {
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("state", Integer.valueOf(3));
            int i = mContentResolver.update(uri, contentvalues, (new StringBuilder()).append("state=").append(Integer.toString(4)).toString(), null);
            if (i != 1)
            {
                contentvalues.put("state", Integer.valueOf(6));
                i = mContentResolver.update(uri, contentvalues, (new StringBuilder()).append("state=").append(Integer.toString(1)).toString(), null);
            } else
            {
                OppLog.d("oppAbortTask() => STATE_ABORTING");
            }
            if (i == 1)
            {
                OppLog.d("oppAbortTask() => STATE_ABORTING or STATE_ABORTED");
                boolean flag = true;
                BluetoothShareTask bluetoothsharetask = oppQueryTask(uri);
                if (bluetoothsharetask == null)
                {
                    OppLog.e((new StringBuilder()).append("can't find task for uri[").append(uri).append("] => can't abort this task").toString());
                    return;
                }
                if (bluetoothsharetask.isOppcTask())
                    flag = mOppService.oppcAbort(uri);
                else
                if (bluetoothsharetask.isOppsTask())
                    flag = mOppService.oppsAbort(uri);
                OppLog.d((new StringBuilder()).append("try to notify aborting/aborted task: isOngoing[").append(flag).append("], state[").append(bluetoothsharetask.getState()).append("]").toString());
                notifyOppTask(bluetoothsharetask);
                return;
            }
            OppLog.i((new StringBuilder()).append("can't find proper task to cancel in db. found[").append(i).append("] task(s) for Uri[").append(uri).append("]").toString());
            if (oppQueryTask(uri) == null)
            {
                OppLog.w((new StringBuilder()).append("can't find task to cancel for Uri[").append(uri).append("]").toString());
                cancelNotification(Integer.parseInt(uri.getLastPathSegment()));
                return;
            }
        }
    }

    protected void oppOnServiceStop()
    {
        cancelAllNotification();
        CancelableActivity.sendCancelActivityIntent(mApplicationContext, 0xfff6563d);
    }

    protected BluetoothShareTask oppQueryTask(Uri uri)
    {
        Cursor cursor = mContentResolver.query(uri, null, null, null, null);
        if (cursor == null) goto _L2; else goto _L1
_L1:
        if (cursor.moveToFirst()) goto _L3; else goto _L2
_L2:
        OppLog.e((new StringBuilder()).append("oppQueryTask cannot find task for uri: ").append(uri).toString());
        BluetoothShareTask bluetoothsharetask;
        bluetoothsharetask = null;
        if (cursor != null)
            cursor.close();
_L5:
        return bluetoothsharetask;
_L3:
        bluetoothsharetask = new BluetoothShareTask(cursor);
        if (cursor == null) goto _L5; else goto _L4
_L4:
        cursor.close();
        return bluetoothsharetask;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    public BluetoothDevice oppQueryTaskDevice(Uri uri)
    {
        BluetoothDevice bluetoothdevice = null;
        if (uri != null) goto _L2; else goto _L1
_L1:
        return bluetoothdevice;
_L2:
        Cursor cursor;
        cursor = mContentResolver.query(uri, new String[] {
            "peer_addr"
        }, null, null, null);
        if (cursor == null)
            break MISSING_BLOCK_LABEL_43;
        if (cursor.moveToFirst())
            break MISSING_BLOCK_LABEL_80;
        OppLog.e((new StringBuilder()).append("oppQueryTask cannot find task for uri: ").append(uri).toString());
        bluetoothdevice = null;
        if (cursor == null) goto _L1; else goto _L3
_L3:
        cursor.close();
        return null;
        BluetoothDevice bluetoothdevice1;
        String s = cursor.getString(cursor.getColumnIndexOrThrow("peer_addr"));
        bluetoothdevice1 = mBluetoothAdapter.getRemoteDevice(s);
        bluetoothdevice = bluetoothdevice1;
        if (cursor == null) goto _L1; else goto _L4
_L4:
        cursor.close();
        return bluetoothdevice;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    public void oppcCacheTask(BluetoothShareTask bluetoothsharetask)
    {
        this;
        JVM INSTR monitorenter ;
        if (mOppcTaskCache == null)
            mOppcTaskCache = new ArrayList(3);
        mOppcTaskCache.add(bluetoothsharetask);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public Uri oppcGetCurrentTask()
    {
        return mOppService.oppcGetCurrentTask();
    }

    protected void oppcResetTaskState()
    {
        Cursor cursor;
        ContentResolver contentresolver = mContentResolver;
        Uri uri = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
        String as[] = new String[6];
        as[0] = Integer.toString(0);
        as[1] = Integer.toString(9);
        as[2] = Integer.toString(6);
        as[3] = Integer.toString(3);
        as[4] = Integer.toString(2);
        as[5] = Integer.toString(9);
        contentresolver.delete(uri, "type between ? and ? AND state in ( ?, ?, ?, ? )", as);
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("state", Integer.valueOf(1));
        contentvalues.put("done", Integer.valueOf(0));
        contentvalues.put("result", "");
        ContentResolver contentresolver1 = mContentResolver;
        Uri uri1 = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
        String as1[] = new String[3];
        as1[0] = Integer.toString(0);
        as1[1] = Integer.toString(9);
        as1[2] = Integer.toString(4);
        contentresolver1.update(uri1, contentvalues, "type between ? and ? AND state = ?", as1);
        ContentResolver contentresolver2 = mContentResolver;
        Uri uri2 = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
        String as2[] = new String[3];
        as2[0] = Integer.toString(0);
        as2[1] = Integer.toString(9);
        as2[2] = Integer.toString(1);
        cursor = contentresolver2.query(uri2, null, "type between ? and ? AND state = ?", as2, "_id ASC");
        if (cursor == null) goto _L2; else goto _L1
_L1:
        if (cursor.moveToFirst()) goto _L3; else goto _L2
_L2:
        BtLog.i("oppcResetTaskState() - can't find any OPPC pending task to restart.");
        if (cursor != null)
            cursor.close();
_L5:
        return;
_L3:
        OppLog.d((new StringBuilder()).append("oppc found [").append(cursor.getCount()).append("] pending tasks after reset (creating notification for them).").toString());
        for (; !cursor.isAfterLast(); cursor.moveToNext())
            notifyOppTask(new BluetoothShareTask(cursor));

        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
        if (cursor == null) goto _L5; else goto _L4
_L4:
        cursor.close();
        return;
    }

    public void oppcSubmitTask(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        OppLog.d((new StringBuilder()).append("oppcSubmitTask for device[").append(bluetoothdevice.getName()).append("][").append(bluetoothdevice.getAddress()).append("]").toString());
        if (mOppcTaskCache != null)
        {
            Object aobj[] = new Object[2];
            aobj[0] = bluetoothdevice;
            aobj[1] = mOppcTaskCache;
            mOppcTaskCache = null;
            mBgRunner.mHandler.sendMessage(mBgRunner.mHandler.obtainMessage(1, ((Object) (aobj))));
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    protected void oppsCancelPushActivity()
    {
        if (mOppsTask == null)
            return;
        synchronized (mOppsTask)
        {
            int i = NotificationFactory.getProfileNotificationId(12, mOppsTask.getId());
            mNotificationManager.cancel(i);
            CancelableActivity.sendCancelActivityIntent(mApplicationContext, mOppsTask.getId());
            OppLog.d("oppsCancelPushActivity: STATE_REJECTED -> STATE_FAILURE");
            oppsSubmitTask(7);
        }
        return;
        exception1;
        bluetoothsharetask;
        JVM INSTR monitorexit ;
        try
        {
            throw exception1;
        }
        catch (Exception exception)
        {
            OppLog.d((new StringBuilder()).append("oppsCancelPushActivity catch exception, this.oppstask:").append(mOppsTask).toString());
        }
        return;
    }

    public String oppsCheckCurrentTask()
    {
        if (mOppsTask != null && mOppsTask.getPeerAddr() != null && mOppsTask.getObjectName() != null && mOppsTask.getTotalBytes() >= 0L)
        {
            long l = SystemUtils.getReceivedFilePathAvailableSize(mApplicationContext);
            if (l <= mOppsTask.getTotalBytes())
            {
                OppLog.i((new StringBuilder()).append("storage is not available for opps new task: available[").append(l).append("] v.s. required[").append(mOppsTask.getTotalBytes()).append("]").toString());
                return mApplicationContext.getString(0x7f05003b);
            } else
            {
                return null;
            }
        }
        if (mOppsTask == null)
            OppLog.e("current opps task is null => can't check it");
        else
            OppLog.i((new StringBuilder()).append("invalid opps new task parameters: peerAddr[").append(mOppsTask.getPeerAddr()).append("], objectName[").append(mOppsTask.getObjectName()).append("], totalByte[").append(mOppsTask.getTotalBytes()).append("]").toString());
        return mApplicationContext.getString(0x7f05003d);
    }

    public Uri oppsGetCurrentTask()
    {
        return mOppService.oppsGetCurrentTask();
    }

    public void oppsResetTaskState()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append("( ");
        stringbuilder.append("type");
        stringbuilder.append(" between ? and ?");
        stringbuilder.append(" ) and ( ");
        stringbuilder.append("state");
        stringbuilder.append(" not in ( ?, ? ))");
        String as[] = new String[4];
        as[0] = Integer.toString(10);
        as[1] = Integer.toString(19);
        as[2] = Integer.toString(8);
        as[3] = Integer.toString(7);
        mContentResolver.delete(com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI, stringbuilder.toString(), as);
    }

    public void oppsSendCurrentIncomingNotification()
    {
label0:
        {
            synchronized (mOppsTask)
            {
                if (mOppsTask != null)
                    break label0;
            }
            return;
        }
        int i = NotificationFactory.getProfileNotificationId(12, mOppsTask.getId());
        Notification notification = OppNotificationFactory.getOppIncomingNotification(mApplicationContext, mOppsTask);
        notification.defaults = 0;
        mNotificationManager.notify(i, notification);
        bluetoothsharetask;
        JVM INSTR monitorexit ;
        return;
        exception;
        bluetoothsharetask;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected boolean oppsStartPushActivity(boolean flag, String s, String s1, String s2, long l)
    {
        OppLog.d((new StringBuilder()).append("oppsStartPushActivity for: authorized[").append(flag).append("], device[").append(s).append("], object[").append(s1).append("], mime[").append(s2).append("], size[").append(l).append("]").toString());
        if ("text/x-vcard".equals(s2))
            s1 = MimeUtils.applyVcardExt(s1, 256);
        String s3 = getDeviceName(s);
        if (s2 == null || s2.length() == 0 || s2.endsWith("*"))
            s2 = MimeUtils.getMimeType(s1);
        mOppsTask = new BluetoothShareTask(11);
        mOppsTask.setPeerAddr(s);
        mOppsTask.setPeerName(s3);
        mOppsTask.setObjectName(s1);
        mOppsTask.setMimeType(s2);
        mOppsTask.setTotalBytes(l);
        mOppsTask.setData(Utils.getValidStoragePath(mApplicationContext, mOppsTask.getObjectName()));
        boolean flag1 = isWhitelisted(mOppsTask.getPeerAddr());
        mOppsTask.setHandover(flag1);
        Uri uri = mContentResolver.insert(com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI, mOppsTask.getContentValues());
        if (uri == null)
        {
            OppLog.d((new StringBuilder()).append("opps newUri: ").append(uri).toString());
            mBgRunner.mHandler.sendMessage(mBgRunner.mHandler.obtainMessage(2, mApplicationContext.getString(0x7f05003b)));
            mOppsTask.setState(9);
            return true;
        }
        mOppsTask.setId(Integer.parseInt(uri.getLastPathSegment()));
        OppLog.d((new StringBuilder()).append("opps newTask: ").append(mOppsTask.getPrintableString()).toString());
        String s4 = oppsCheckCurrentTask();
        if (s4 != null)
        {
            mBgRunner.mHandler.sendMessage(mBgRunner.mHandler.obtainMessage(2, s4));
            oppsSubmitTask(2);
            return true;
        }
        if (!flag && !flag1)
        {
            int i = NotificationFactory.getProfileNotificationId(12, mOppsTask.getId());
            Notification notification = OppNotificationFactory.getOppIncomingNotification(mApplicationContext, mOppsTask);
            mNotificationManager.notify(i, notification);
            return false;
        } else
        {
            oppsSubmitTask(1);
            return true;
        }
    }

    public void oppsStartService()
    {
        Intent intent = new Intent(mApplicationContext, com/mediatek/bluetooth/opp/adp/OppService);
        intent.setAction("com.mediatek.bluetooth.opp.action.OPPS_START");
        mApplicationContext.startService(intent);
    }

    public void oppsSubmitTask(int i)
    {
        OppLog.d((new StringBuilder()).append("oppsSubmitTask for task: ").append(mOppsTask).toString());
        if (mOppsTask == null)
        {
            OppLog.e("current opps task is null => can't submit it");
            return;
        }
        synchronized (mOppsTask)
        {
            if (mOppsTask != null)
                break MISSING_BLOCK_LABEL_68;
            OppLog.i("duplicated submit [Rejecting] opps task (timeout and user) => skip one");
        }
        return;
        exception;
        bluetoothsharetask;
        JVM INSTR monitorexit ;
        throw exception;
        if (i != 2 && i != 5 && i != 7) goto _L2; else goto _L1
_L1:
        OppLog.i("oppsSubmitTask,taskState is rejecting or rejected or failure");
_L4:
        int j;
        mOppsTask.setState(i);
        j = mContentResolver.update(Uri.withAppendedPath(com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI, Integer.toString(mOppsTask.getId())), mOppsTask.getContentValues(), null, null);
        if (j == 1)
            break MISSING_BLOCK_LABEL_184;
        OppLog.w((new StringBuilder()).append("oppsSubmitTask(): update task fail: count[").append(j).append("], id[").append(mOppsTask.getId()).append("]").toString());
        notifyOppTask(mOppsTask);
        oppsStartService();
        mOppsTask = null;
        bluetoothsharetask;
        JVM INSTR monitorexit ;
        return;
_L2:
        File file = SystemUtils.createNewFileForSaving(mOppsTask.getData());
        if (file == null) goto _L4; else goto _L3
_L3:
        mOppsTask.setData(file.getAbsolutePath());
          goto _L4
    }

    public void releaeWakeLock()
    {
        if (mWakeLock.isHeld())
            mWakeLock.release();
    }

    protected void setOppService(OppService oppservice)
    {
        mOppService = oppservice;
    }




}
