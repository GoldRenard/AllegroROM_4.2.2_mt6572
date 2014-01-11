// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import com.mediatek.bluetooth.opp.mmi.OppLog;
import com.mediatek.bluetooth.opp.mmi.UriDataUtils;
import com.mediatek.bluetooth.share.BluetoothShareTask;
import com.mediatek.bluetooth.util.BtLog;
import com.mediatek.bluetooth.util.SystemUtils;
import java.io.File;
import java.util.*;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            OppServiceNative, BluetoothOppService, OppManager, OppTaskWorkerThread, 
//            OppTaskHandler, OppEvent

public class OppService extends OppServiceNative
{
    class OppcTaskHandler
        implements OppTaskHandler
    {

        final OppService this$0;

        private void processBatchPush(Uri uri)
            throws InterruptedException
        {
            ContentResolver contentresolver;
            Cursor cursor;
            contentresolver = getContentResolver();
            cursor = contentresolver.query(uri, null, "state=1", null, null);
            if (cursor == null) goto _L2; else goto _L1
_L1:
            boolean flag = cursor.moveToFirst();
            if (flag) goto _L3; else goto _L2
_L2:
            if (cursor != null)
                cursor.close();
_L5:
            return;
_L3:
            BluetoothShareTask bluetoothsharetask = new BluetoothShareTask(cursor);
            Cursor cursor1;
            if (cursor != null)
                cursor.close();
            Uri uri1 = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
            String as[] = {
                "_id"
            };
            String as1[] = new String[4];
            as1[0] = Integer.toString(1);
            as1[1] = Integer.toString(1);
            as1[2] = bluetoothsharetask.getPeerAddr();
            as1[3] = Long.toString(bluetoothsharetask.getCreationDate());
            cursor1 = contentresolver.query(uri1, as, "type = ? AND state = ? AND peer_addr = ? AND creation = ?", as1, "_id ASC");
            Collections.emptyList();
            List list;
            list = mOppManager.getOppTaskList(cursor1);
            OppLog.d((new StringBuilder()).append("oppc processBatchPush() - task count: ").append(list.size()).toString());
            if (cursor1 != null)
                cursor1.close();
            if (list.size() < 1) goto _L5; else goto _L4
_L4:
            boolean flag1;
            boolean flag2;
            flag1 = oppcConnect(bluetoothsharetask.getPeerAddr());
            flag2 = false;
            if (!flag1)
                break MISSING_BLOCK_LABEL_243;
            BluetoothOppService.sendStateChangedBroadcast(OppService.this, bluetoothsharetask, true);
            ContentValues contentvalues;
            Iterator iterator;
            contentvalues = new ContentValues();
            contentvalues.put("state", Integer.valueOf(4));
            iterator = list.iterator();
_L9:
            Uri uri2;
            if (!iterator.hasNext())
                continue; /* Loop/switch isn't completed */
            uri2 = (Uri)iterator.next();
            if (!mIsTaskWorkThreadInterrupted) goto _L7; else goto _L6
_L6:
            OppLog.i("OppTaskWorkerThread had been interuppted, stop current task.");
            flag2 = true;
            if (!flag1) goto _L5; else goto _L8
_L8:
            if (!flag2 && !mIsTaskWorkThreadInterrupted)
                oppcDisconnect();
            BluetoothOppService.sendStateChangedBroadcast(OppService.this, bluetoothsharetask, false);
            Thread.sleep(660L);
            return;
            Exception exception;
            exception;
            if (cursor != null)
                cursor.close();
            throw exception;
            Exception exception1;
            exception1;
            if (cursor1 != null)
                cursor1.close();
            throw exception1;
_L7:
            OppLog.d((new StringBuilder()).append(" oppc processBatchPush() processing task: ").append(uri2).toString());
            if (contentresolver.update(uri2, contentvalues, "state=1", null) == 1)
                break MISSING_BLOCK_LABEL_502;
            OppLog.i((new StringBuilder()).append("skip non-pending task: ").append(uri2).toString());
              goto _L9
            Exception exception2;
            exception2;
            if (flag1)
            {
                if (!flag2 && !mIsTaskWorkThreadInterrupted)
                    oppcDisconnect();
                BluetoothOppService.sendStateChangedBroadcast(OppService.this, bluetoothsharetask, false);
                Thread.sleep(660L);
            }
            throw exception2;
            Cursor cursor2;
            oppcSetCurrentTask(uri2);
            cursor2 = contentresolver.query(uri2, null, null, null, null);
            if (cursor2 == null)
                break MISSING_BLOCK_LABEL_542;
            boolean flag3 = cursor2.moveToFirst();
            if (flag3)
                break MISSING_BLOCK_LABEL_574;
            mOppcCurrentStoragePath = null;
            oppcSetCurrentTask(null);
            if (cursor2 == null) goto _L9; else goto _L10
_L10:
            cursor2.close();
              goto _L9
            BluetoothShareTask bluetoothsharetask1 = new BluetoothShareTask(cursor2);
            if (bluetoothsharetask1.getState() != 3)
                break MISSING_BLOCK_LABEL_644;
            BtLog.i("handle aborting task before push it.");
            bluetoothsharetask1.setState(6);
            onObjectChange(bluetoothsharetask1);
            mOppcCurrentStoragePath = null;
            oppcSetCurrentTask(null);
            if (cursor2 == null) goto _L9; else goto _L11
_L11:
            cursor2.close();
              goto _L9
            mOppcCurrentStoragePath = bluetoothsharetask1.getData();
            Exception exception3;
            boolean flag4;
            if (SystemUtils.getExternalStorageDirectory(OppService.this, mOppcCurrentStoragePath) != null && !SystemUtils.isExternalStorageMounted(OppService.this, mOppcCurrentStoragePath))
                flag4 = false;
            else
                flag4 = true;
            if (!flag1 || flag2 || !flag4)
                break MISSING_BLOCK_LABEL_809;
            UriDataUtils.openUriData(OppService.this, Uri.parse(bluetoothsharetask1.getObjectUri()));
            if (!oppcPush(bluetoothsharetask1, this))
                flag2 = true;
            else
                flag2 = false;
            mOppcCurrentStoragePath = null;
            UriDataUtils.closeUriData(OppService.this, Uri.parse(bluetoothsharetask1.getObjectUri()));
_L13:
            mOppcCurrentStoragePath = null;
            oppcSetCurrentTask(null);
            if (cursor2 == null) goto _L9; else goto _L12
_L12:
            cursor2.close();
              goto _L9
            bluetoothsharetask1.setState(7);
            onObjectChange(bluetoothsharetask1);
              goto _L13
            exception3;
_L15:
            mOppcCurrentStoragePath = null;
            oppcSetCurrentTask(null);
            if (cursor2 == null)
                break MISSING_BLOCK_LABEL_856;
            cursor2.close();
            throw exception3;
            exception3;
            if (true) goto _L15; else goto _L14
_L14:
              goto _L9
        }

        public void afterWait()
            throws InterruptedException
        {
            Cursor cursor;
            ContentResolver contentresolver = getContentResolver();
            Uri uri = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
            String as[] = {
                "_id"
            };
            String as1[] = new String[3];
            as1[0] = Integer.toString(0);
            as1[1] = Integer.toString(9);
            as1[2] = Integer.toString(1);
            cursor = contentresolver.query(uri, as, "type between ? and ? AND state = ?", as1, "_id ASC");
            Collections.emptyList();
            List list;
            list = mOppManager.getOppTaskList(cursor);
            OppLog.d((new StringBuilder()).append("oppc afterWait() - task count: ").append(list.size()).toString());
            if (cursor != null)
                cursor.close();
            mOppManager.acquireWakeLock();
            Uri uri1;
            for (Iterator iterator = list.iterator(); iterator.hasNext(); processBatchPush(uri1))
            {
                uri1 = (Uri)iterator.next();
                OppLog.d((new StringBuilder()).append(" oppc afterWait() processing task: ").append(uri1).toString());
            }

            break MISSING_BLOCK_LABEL_232;
            Exception exception1;
            exception1;
            mOppManager.releaeWakeLock();
            throw exception1;
            Exception exception;
            exception;
            if (cursor != null)
                cursor.close();
            throw exception;
            mOppManager.releaeWakeLock();
            return;
        }

        public boolean beforeWait()
            throws InterruptedException
        {
            Cursor cursor;
            if (mIsOppcResetTask)
                break MISSING_BLOCK_LABEL_279;
            mIsOppcResetTask = true;
            OppLog.d("oppc beforeWait() - oppcResetTaskState() ");
            mOppManager.oppcResetTaskState();
            ContentResolver contentresolver = getContentResolver();
            Uri uri = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
            String as[] = {
                "_id"
            };
            String as1[] = new String[3];
            as1[0] = Integer.toString(0);
            as1[1] = Integer.toString(9);
            as1[2] = Integer.toString(1);
            cursor = contentresolver.query(uri, as, "type between ? and ? AND state = ?", as1, "_id ASC");
            Collections.emptyList();
            List list;
            list = mOppManager.getOppTaskList(cursor);
            OppLog.d((new StringBuilder()).append("oppc beforeWait() - task count: ").append(list.size()).toString());
            if (cursor != null)
                cursor.close();
            mOppManager.acquireWakeLock();
            Uri uri1;
            for (Iterator iterator = list.iterator(); iterator.hasNext(); processBatchPush(uri1))
            {
                uri1 = (Uri)iterator.next();
                OppLog.d((new StringBuilder()).append(" oppc beforeWait() processing task: ").append(uri1).toString());
            }

            break MISSING_BLOCK_LABEL_269;
            Exception exception1;
            exception1;
            mOppManager.releaeWakeLock();
            throw exception1;
            Exception exception;
            exception;
            if (cursor != null)
                cursor.close();
            throw exception;
            mOppManager.releaeWakeLock();
            return true;
        }

        public void onObjectChange(BluetoothShareTask bluetoothsharetask)
        {
            OppLog.d((new StringBuilder()).append("oppc onObjectChange() for taskId[").append(bluetoothsharetask.getId()).append("], state[").append(bluetoothsharetask.getState()).append("]").toString());
            bluetoothsharetask.setModifiedDate(System.currentTimeMillis());
            mOppManager.notifyOppTask(bluetoothsharetask);
            if (bluetoothsharetask.getState() == 4 && bluetoothsharetask.getDoneBytes() != 0L)
            {
                OppLog.d("onObjectChange,task is STATE_ONGOING");
                return;
            }
            try
            {
                getContentResolver().update(bluetoothsharetask.getTaskUri(), bluetoothsharetask.getContentValues(), null, null);
                return;
            }
            catch (Exception exception)
            {
                OppLog.e("onObjectChange::update db error");
                exception.printStackTrace();
                return;
            }
        }

        OppcTaskHandler()
        {
            this$0 = OppService.this;
            super();
        }
    }

    class OppsTaskHandler
        implements OppTaskHandler
    {

        boolean mIsBusy;
        final OppService this$0;

        public void afterWait()
            throws InterruptedException
        {
            Cursor cursor;
            ContentResolver contentresolver = getContentResolver();
            Uri uri = com.mediatek.bluetooth.share.BluetoothShareTask.BluetoothShareTaskMetaData.CONTENT_URI;
            String as[] = {
                "_id"
            };
            String as1[] = new String[4];
            as1[0] = Integer.toString(10);
            as1[1] = Integer.toString(19);
            as1[2] = Integer.toString(1);
            as1[3] = Integer.toString(2);
            cursor = contentresolver.query(uri, as, "type between ? and ? AND state in ( ?, ? )", as1, "_id ASC");
            Collections.emptyList();
            List list;
            list = mOppManager.getOppTaskList(cursor);
            OppLog.d((new StringBuilder()).append("opps afterWait(): task count: ").append(list.size()).toString());
            if (cursor != null)
                cursor.close();
            mOppManager.acquireWakeLock();
            Iterator iterator = list.iterator();
_L6:
            if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
            Cursor cursor1;
            Uri uri1 = (Uri)iterator.next();
            OppLog.d((new StringBuilder()).append("opps afterWait() processing task:").append(uri1).toString());
            oppsSetCurrentTask(uri1);
            cursor1 = getContentResolver().query(uri1, null, "state=1 OR state=2", null, null);
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_245;
            boolean flag = cursor1.moveToFirst();
            if (flag)
                break MISSING_BLOCK_LABEL_319;
            mOppsCurrentStoragePath = null;
            if (true) goto _L4; else goto _L3
_L3:
            BluetoothOppService.sendStateChangedBroadcast(OppService.this, null, false);
_L4:
            if (cursor1 == null) goto _L6; else goto _L5
_L5:
            cursor1.close();
              goto _L6
            Exception exception1;
            exception1;
            mOppManager.releaeWakeLock();
            mIsBusy = false;
            throw exception1;
            Exception exception;
            exception;
            if (cursor != null)
                cursor.close();
            throw exception;
            BluetoothShareTask bluetoothsharetask1 = new BluetoothShareTask(cursor1);
            BluetoothOppService.sendStateChangedBroadcast(OppService.this, bluetoothsharetask1, true);
            mOppsCurrentStoragePath = bluetoothsharetask1.getData();
            oppsAccessResponse(bluetoothsharetask1, this);
            oppsSetCurrentTask(null);
            mOppsCurrentStoragePath = null;
            if (bluetoothsharetask1 == null) goto _L8; else goto _L7
_L7:
            BluetoothOppService.sendStateChangedBroadcast(OppService.this, bluetoothsharetask1, false);
_L8:
            if (cursor1 == null) goto _L6; else goto _L9
_L9:
            cursor1.close();
              goto _L6
_L11:
            mOppsCurrentStoragePath = null;
            BluetoothShareTask bluetoothsharetask;
            if (bluetoothsharetask == null)
                break MISSING_BLOCK_LABEL_435;
            BluetoothOppService.sendStateChangedBroadcast(OppService.this, bluetoothsharetask, false);
            if (cursor1 == null)
                break MISSING_BLOCK_LABEL_447;
            cursor1.close();
            Exception exception2;
            throw exception2;
_L2:
            mOppManager.releaeWakeLock();
            mIsBusy = false;
            return;
            exception2;
            bluetoothsharetask = bluetoothsharetask1;
            continue; /* Loop/switch isn't completed */
            exception2;
            bluetoothsharetask = null;
            if (true) goto _L11; else goto _L10
_L10:
        }

        public boolean beforeWait()
            throws InterruptedException
        {
            if (!mIsOppsResetTask)
            {
                mIsOppsResetTask = true;
                OppLog.d("opps beforeWait() - oppsResetTaskState() ");
                mOppManager.oppsResetTaskState();
            }
            if (mIsBusy)
                return true;
            OppEvent oppevent = oppsWaitForAccessRequest();
            String as[] = oppevent.parameters;
            if (oppevent.event == 113)
            {
                boolean flag = mOppManager.oppsStartPushActivity(oppsIsAuthorized(), as[0], as[1], as[2], Long.parseLong(as[3]));
                mIsBusy = true;
                if (!flag)
                {
                    if (oppsListenDisconnect())
                    {
                        mIsBusy = false;
                        mOppManager.oppsCancelPushActivity();
                        return false;
                    }
                } else
                if (mOppManager.mOppsTask != null && mOppManager.mOppsTask.getState() == 9)
                {
                    oppsAccessResponseNative(96, new String[] {
                        "0", ""
                    });
                    if (oppsListenDisconnect())
                    {
                        mIsBusy = false;
                        return false;
                    }
                }
                return true;
            } else
            {
                OppLog.e("opps beforeWait(): get unsupported event(oppsRequestIndication)");
                oppsAccessResponseNative(81, new String[] {
                    "0", ""
                });
                mIsBusy = false;
                return false;
            }
        }

        public void onObjectChange(BluetoothShareTask bluetoothsharetask)
        {
            OppLog.d((new StringBuilder()).append("opps onObjectChange() for taskId=").append(bluetoothsharetask.getId()).append(",state=").append(bluetoothsharetask.getState()).toString());
            bluetoothsharetask.setModifiedDate(System.currentTimeMillis());
            mOppManager.notifyOppTask(bluetoothsharetask);
            if (bluetoothsharetask.getState() == 4 && bluetoothsharetask.getDoneBytes() != 0L)
            {
                OppLog.d("onObjectChange,task state is STATE_ONGOING");
                return;
            } else
            {
                getContentResolver().update(bluetoothsharetask.getTaskUri(), bluetoothsharetask.getContentValues(), null, null);
                return;
            }
        }

        OppsTaskHandler()
        {
            this$0 = OppService.this;
            super();
            mIsBusy = false;
        }
    }


    private boolean mIsOppcResetTask;
    private boolean mIsOppsResetTask;
    private boolean mIsTaskWorkThreadInterrupted;
    private OppManager mOppManager;
    private String mOppcCurrentStoragePath;
    private OppTaskWorkerThread mOppcWorker;
    private String mOppsCurrentStoragePath;
    private OppTaskWorkerThread mOppsWorker;
    private BroadcastReceiver mSdcardBroadcastReceiver;

    public OppService()
    {
        mIsTaskWorkThreadInterrupted = false;
        mIsOppcResetTask = false;
        mIsOppsResetTask = false;
        mOppcCurrentStoragePath = null;
        mOppsCurrentStoragePath = null;
        mSdcardBroadcastReceiver = null;
    }

    private void registerSdcardBroadcastReceiver()
    {
        OppLog.i("OppService.registerSdcardBroadcastReceiver()[+]");
        mSdcardBroadcastReceiver = new BroadcastReceiver() {

            final OppService this$0;

            public void onReceive(Context context, Intent intent)
            {
                OppLog.i("OppService.BroadcastReceiver.onReceive()[+]");
                Uri uri = intent.getData();
                if (uri != null)
                {
                    OppLog.d((new StringBuilder()).append("OppService: path[").append(uri.getPath()).append("], oppc[").append(mOppcCurrentStoragePath).append("], opps[").append(mOppsCurrentStoragePath).append("]").toString());
                    File file = SystemUtils.getExternalStorageDirectory(context, mOppcCurrentStoragePath);
                    if (file != null && file.getAbsolutePath().equals(uri.getPath()))
                        oppcDisconnectNative();
                    File file1 = SystemUtils.getExternalStorageDirectory(context, mOppsCurrentStoragePath);
                    if (file1 != null && file1.getAbsolutePath().equals(uri.getPath()))
                        oppsDisconnectNative();
                }
            }

            
            {
                this$0 = OppService.this;
                super();
            }
        }
;
        IntentFilter intentfilter = new IntentFilter("android.intent.action.MEDIA_EJECT");
        intentfilter.addDataScheme("file");
        registerReceiver(mSdcardBroadcastReceiver, intentfilter);
    }

    private void unregisterSdCardBroadcastReceiver()
    {
        OppLog.i("OppService.unregisterSdCardBroadcastReceiver()[+]");
        if (mSdcardBroadcastReceiver != null)
            unregisterReceiver(mSdcardBroadcastReceiver);
    }

    public void onCreate()
    {
        OppLog.i("OppService.onCreate()[+]");
        super.onCreate();
        if (!super.mIsServiceNativeEnabled)
        {
            OppLog.w("OppService native onCreate failed.");
            BluetoothOppService.sendActivationBroadcast(this, true, 14);
            BluetoothOppService.sendActivationBroadcast(this, false, 14);
            stopSelf();
            return;
        }
        mOppManager = OppManager.getInstance(this);
        mOppManager.setOppService(this);
        mOppManager.cancelAllNotification();
        registerSdcardBroadcastReceiver();
        BluetoothOppService.sendActivationBroadcast(this, true, 10);
        if (oppcEnable())
            BluetoothOppService.sendActivationBroadcast(this, true, 11);
        else
            BluetoothOppService.sendActivationBroadcast(this, true, 14);
        BluetoothOppService.sendActivationBroadcast(this, false, 10);
        if (oppsEnable())
            BluetoothOppService.sendActivationBroadcast(this, false, 11);
        else
            BluetoothOppService.sendActivationBroadcast(this, false, 14);
        mOppcWorker = new OppTaskWorkerThread("BtOppc", new OppcTaskHandler());
        mOppcWorker.start();
        mOppsWorker = new OppTaskWorkerThread("BtOpps", new OppsTaskHandler());
        mOppsWorker.start();
        OppLog.i("OppService.onCreate()[-]");
    }

    public void onDestroy()
    {
        OppLog.i("OppService.onDestroy()[+]");
        if (super.mIsServiceNativeEnabled)
        {
            mOppManager.oppOnServiceStop();
            OppLog.d("OppService.onDestroy() interrupt OppTaskWorkerThread...");
            mOppcWorker.interrupt();
            mOppsWorker.interrupt();
            mIsTaskWorkThreadInterrupted = true;
            OppLog.d("OppService.onDestroy() disable oppc/opps native service...");
            if (oppcDisable())
                BluetoothOppService.sendActivationBroadcast(this, true, 13);
            else
                BluetoothOppService.sendActivationBroadcast(this, true, 14);
            if (oppsDisable())
                BluetoothOppService.sendActivationBroadcast(this, false, 13);
            else
                BluetoothOppService.sendActivationBroadcast(this, false, 14);
            unregisterSdCardBroadcastReceiver();
        }
        OppLog.d("OppService.onDestroy() call native destroy()...");
        super.onDestroy();
        if (mOppManager != null)
            mOppManager.setOppService(null);
        OppLog.i("OppService.onDestroy()[-]");
    }

    public int onStartCommand(Intent intent, int i, int j)
    {
        OppLog.i("OppService.onStartCommand()[+]");
        if (super.mIsServiceNativeEnabled && intent != null)
        {
            String s = intent.getAction();
            OppLog.d((new StringBuilder()).append("OppService.onStartCommand() action: ").append(s).toString());
            if ("com.mediatek.bluetooth.opp.action.OPPC_START".equals(s))
                mOppcWorker.notifyNewTask();
            else
            if ("com.mediatek.bluetooth.opp.action.OPPS_START".equals(s))
            {
                oppsStopListenDisconnect();
                mOppsWorker.notifyNewTask();
            } else
            {
                mOppsWorker.notifyNewTask();
            }
        } else
        {
            OppLog.w((new StringBuilder()).append("OppService.onStartCommand() warn: isServiceNativeEnabled[").append(super.mIsServiceNativeEnabled).append("] or null Intent").toString());
        }
        OppLog.i("OppService.onStartCommand()[-]");
        return super.onStartCommand(intent, i, j);
    }



/*
    static String access$002(OppService oppservice, String s)
    {
        oppservice.mOppcCurrentStoragePath = s;
        return s;
    }

*/



/*
    static String access$102(OppService oppservice, String s)
    {
        oppservice.mOppsCurrentStoragePath = s;
        return s;
    }

*/



/*
    static boolean access$202(OppService oppservice, boolean flag)
    {
        oppservice.mIsOppcResetTask = flag;
        return flag;
    }

*/





/*
    static boolean access$502(OppService oppservice, boolean flag)
    {
        oppservice.mIsOppsResetTask = flag;
        return flag;
    }

*/
}
