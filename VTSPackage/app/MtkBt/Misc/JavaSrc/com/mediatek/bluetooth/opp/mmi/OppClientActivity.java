// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.mmi;

import android.app.Activity;
import android.bluetooth.BluetoothDevice;
import android.content.ContentResolver;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;
import com.mediatek.bluetooth.opp.adp.OppManager;
import com.mediatek.bluetooth.share.BluetoothShareTask;
import com.mediatek.bluetooth.util.BtLog;
import com.mediatek.bluetooth.util.MimeUtils;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.mediatek.bluetooth.opp.mmi:
//            OppLog

public class OppClientActivity extends Activity
{

    protected static final String LINK_SHARE_URI_SCHEME = "btlink";
    String mIntentType;
    boolean mIsHandover;
    Thread mOppcCacheTaskThread;
    BluetoothDevice mRemoteDevice;
    ArrayList mUris;
    public OppManager oppManager;

    public OppClientActivity()
    {
        mOppcCacheTaskThread = null;
    }

    private BluetoothShareTask newOppcTask(int i, String s, Uri uri, boolean flag)
    {
        if (s != null && uri != null)
        {
            BluetoothShareTask bluetoothsharetask = new BluetoothShareTask(i);
            bluetoothsharetask.setHandover(flag);
            bluetoothsharetask.setMimeType(s);
            bluetoothsharetask.setObjectUri(uri.toString());
            return bluetoothsharetask;
        } else
        {
            OppLog.w((new StringBuilder()).append("invalid parameter for newOppcTask : mimetype[").append(s).append("], uri[").append(uri).append("]").toString());
            OppLog.w((new StringBuilder()).append("current request intent: [").append(getIntent().toUri(1)).append("]").toString());
            Toast.makeText(this, getString(0x7f050039, new Object[] {
                uri
            }), 1).show();
            return null;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        OppLog.d("OppClientActivity.onCreate()[+]");
        super.onCreate(bundle);
        setVisible(false);
        oppManager = OppManager.getInstance(this);
        Intent intent = getIntent();
        String s = intent.getAction();
        if (!"android.intent.action.SEND".equals(s) && !"android.btopp.intent.action.HANDOVER_SEND".equals(s))
        {
            if (!"android.intent.action.SEND_MULTIPLE".equals(s) && !"android.btopp.intent.action.HANDOVER_SEND_MULTIPLE".equals(s))
            {
                OppLog.w((new StringBuilder()).append("oppc unsupport action: ").append(s).toString());
            } else
            {
                mIsHandover = "android.btopp.intent.action.HANDOVER_SEND_MULTIPLE".equals(s);
                mUris = intent.getParcelableArrayListExtra("android.intent.extra.STREAM");
                mRemoteDevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                mIntentType = intent.getType();
                mOppcCacheTaskThread = new Thread() {

                    boolean mHasAny;
                    final OppClientActivity this$0;

                    public void run()
                    {
                        if (mUris != null)
                        {
                            BtLog.i((new StringBuilder()).append("share multi-object: mime-type[").append(mIntentType).append("]").toString());
                            for (Iterator iterator = mUris.iterator(); iterator.hasNext();)
                            {
                                Uri uri1 = (Uri)iterator.next();
                                String s4 = getContentResolver().getType(uri1);
                                if (s4 == null && uri1 != null)
                                    s4 = MimeUtils.getMimeType(uri1.getLastPathSegment());
                                if (s4 == null)
                                    s4 = mIntentType;
                                if (s4 != null && uri1 != null)
                                {
                                    BluetoothShareTask bluetoothsharetask1 = new BluetoothShareTask(1);
                                    bluetoothsharetask1.setMimeType(s4);
                                    bluetoothsharetask1.setObjectUri(uri1.toString());
                                    bluetoothsharetask1.setHandover(mIsHandover);
                                    if (bluetoothsharetask1 != null)
                                    {
                                        oppManager.oppcCacheTask(bluetoothsharetask1);
                                        mHasAny = true;
                                    }
                                } else
                                {
                                    String s5 = getString(0x7f050039, new Object[] {
                                        uri1
                                    });
                                    runOnUiThread(s5. new Runnable() {

                                        final _cls1 this$1;
                                        final String val$uriStr;

                                        public void run()
                                        {
                                            Toast.makeText(_fld0, uriStr, 1).show();
                                        }

            
            {
                this$1 = final__pcls1;
                uriStr = String.this;
                super();
            }
                                    }
);
                                    return;
                                }
                            }

                        }
                        if (!mHasAny)
                        {
                            OppLog.i("no valid oppc task => finish activity");
                            return;
                        }
                        if (mRemoteDevice == null)
                        {
                            OppLog.e("null remote-device in SEND intent => cann't send object via bluetooth(OPP)");
                            return;
                        } else
                        {
                            oppManager.oppcSubmitTask(mRemoteDevice);
                            runOnUiThread(new Runnable() {

                                int mToastResId;
                                final _cls1 this$1;

                                public void run()
                                {
                                    String s = mRemoteDevice.getName();
                                    if (s != null)
                                    {
                                        Toast.makeText(_fld0, getString(mToastResId, new Object[] {
                                            s
                                        }), 0).show();
                                        return;
                                    } else
                                    {
                                        OppClientActivity oppclientactivity = _fld0;
                                        OppClientActivity oppclientactivity1 = _fld0;
                                        int i = mToastResId;
                                        Object aobj[] = new Object[1];
                                        aobj[0] = getString(0x7f05003a);
                                        Toast.makeText(oppclientactivity, oppclientactivity1.getString(i, aobj), 0).show();
                                        return;
                                    }
                                }

            
            {
                this$1 = _cls1.this;
                super();
                mToastResId = 0x7f050038;
            }
                            }
);
                            return;
                        }
                    }

            
            {
                this$0 = OppClientActivity.this;
                super();
                mHasAny = false;
            }
                }
;
                mOppcCacheTaskThread.start();
            }
        } else
        {
            Uri uri = (Uri)intent.getParcelableExtra("android.intent.extra.STREAM");
            CharSequence charsequence = intent.getCharSequenceExtra("android.intent.extra.TEXT");
            if (uri == null && charsequence != null)
            {
                CharSequence charsequence1 = intent.getCharSequenceExtra("android.intent.extra.SUBJECT");
                String s3;
                if (charsequence1 == null)
                    s3 = null;
                else
                    s3 = charsequence1.toString();
                uri = Uri.fromParts("btlink", charsequence.toString(), s3);
            }
            mIntentType = intent.getType();
            String s1 = getContentResolver().getType(uri);
            if (s1 == null && uri != null)
                s1 = MimeUtils.getMimeType(uri.getLastPathSegment());
            if (s1 == null)
                s1 = mIntentType;
            BluetoothShareTask bluetoothsharetask = newOppcTask(1, s1, uri, "android.btopp.intent.action.HANDOVER_SEND".equals(s));
            if (bluetoothsharetask == null)
            {
                finish();
                return;
            }
            oppManager.oppcCacheTask(bluetoothsharetask);
            BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if (bluetoothdevice == null)
            {
                OppLog.e("null remote-device in SEND intent => cann't send object via bluetooth(OPP)");
            } else
            {
                oppManager.oppcSubmitTask(bluetoothdevice);
                String s2 = bluetoothdevice.getName();
                if (s2 != null)
                {
                    Toast.makeText(this, getString(0x7f050037, new Object[] {
                        s2
                    }), 0).show();
                } else
                {
                    OppLog.i("OppClientActivity getDeviceName return null");
                    Object aobj[] = new Object[1];
                    aobj[0] = getString(0x7f05003a);
                    Toast.makeText(this, getString(0x7f050037, aobj), 0).show();
                }
            }
        }
        finish();
    }
}
