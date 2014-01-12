// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.providers.settings;

import android.app.backup.*;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.*;
import android.util.Log;
import java.io.*;
import java.util.*;
import java.util.zip.CRC32;

// Referenced classes of package com.android.providers.settings:
//            SettingsHelper

public class SettingsBackupAgent extends BackupAgentHelper
{
    static class Network
    {

        String key_mgmt;
        final ArrayList rawLines = new ArrayList();
        String ssid;

        public static Network readFromStream(BufferedReader bufferedreader)
        {
            Network network = new Network();
_L1:
            String s;
            if (!bufferedreader.ready())
                break MISSING_BLOCK_LABEL_46;
            s = bufferedreader.readLine();
            if (s == null)
                break MISSING_BLOCK_LABEL_46;
            if (s.startsWith("}"))
                return network;
            network.rememberLine(s);
              goto _L1
            IOException ioexception;
            ioexception;
            network = null;
            return network;
        }

        public void dump()
        {
            Log.v("SettingsBackupAgent", "network={");
            String s;
            for (Iterator iterator = rawLines.iterator(); iterator.hasNext(); Log.v("SettingsBackupAgent", (new StringBuilder()).append("   ").append(s).toString()))
                s = (String)iterator.next();

            Log.v("SettingsBackupAgent", "}");
        }

        public boolean equals(Object obj)
        {
            if (obj != this)
            {
                if (!(obj instanceof Network))
                    return false;
                Network network;
                try
                {
                    network = (Network)obj;
                }
                catch (ClassCastException classcastexception)
                {
                    return false;
                }
                if (!ssid.equals(network.ssid) || !key_mgmt.equals(network.key_mgmt))
                    return false;
            }
            return true;
        }

        public int hashCode()
        {
            return 31 * (527 + ssid.hashCode()) + key_mgmt.hashCode();
        }

        void rememberLine(String s)
        {
            String s1 = s.trim();
            if (!s1.isEmpty())
            {
                rawLines.add(s1);
                if (s1.startsWith("ssid"))
                {
                    ssid = s1;
                    return;
                }
                if (s1.startsWith("key_mgmt"))
                {
                    key_mgmt = s1;
                    return;
                }
            }
        }

        public void write(Writer writer)
            throws IOException
        {
            writer.write("\nnetwork={\n");
            String s;
            for (Iterator iterator = rawLines.iterator(); iterator.hasNext(); writer.write((new StringBuilder()).append("\t").append(s).append("\n").toString()))
                s = (String)iterator.next();

            writer.write("}\n");
        }

        Network()
        {
            ssid = "";
            key_mgmt = "";
        }
    }

    class WifiNetworkSettings
    {

        final HashSet mKnownNetworks = new HashSet();
        final ArrayList mNetworks = new ArrayList(8);
        final SettingsBackupAgent this$0;

        public void dump()
        {
            for (Iterator iterator = mNetworks.iterator(); iterator.hasNext(); ((Network)iterator.next()).dump());
        }

        public void readNetworks(BufferedReader bufferedreader)
        {
_L2:
            String s;
            do
            {
                if (!bufferedreader.ready())
                    break MISSING_BLOCK_LABEL_67;
                s = bufferedreader.readLine();
            } while (s == null);
            if (!s.startsWith("network")) goto _L2; else goto _L1
_L1:
            Network network = Network.readFromStream(bufferedreader);
            if (!mKnownNetworks.contains(network))
            {
                mKnownNetworks.add(network);
                mNetworks.add(network);
            }
              goto _L2
            IOException ioexception;
            ioexception;
        }

        public void write(Writer writer)
            throws IOException
        {
            for (Iterator iterator = mNetworks.iterator(); iterator.hasNext(); ((Network)iterator.next()).write(writer));
        }

        WifiNetworkSettings()
        {
            this$0 = SettingsBackupAgent.this;
            super();
        }
    }

    class WifiRestoreRunnable
        implements Runnable
    {

        private byte restoredSupplicantData[];
        private byte restoredWifiConfigFile[];
        final SettingsBackupAgent this$0;

        void incorporateWifiConfigFile(BackupDataInput backupdatainput)
        {
            restoredWifiConfigFile = new byte[backupdatainput.getDataSize()];
            if (restoredWifiConfigFile.length <= 0)
                return;
            try
            {
                backupdatainput.readEntityData(restoredWifiConfigFile, 0, backupdatainput.getDataSize());
                return;
            }
            catch (IOException ioexception)
            {
                Log.w("SettingsBackupAgent", "Unable to read config file");
            }
            restoredWifiConfigFile = null;
        }

        void incorporateWifiSupplicant(BackupDataInput backupdatainput)
        {
            restoredSupplicantData = new byte[backupdatainput.getDataSize()];
            if (restoredSupplicantData.length <= 0)
                return;
            try
            {
                backupdatainput.readEntityData(restoredSupplicantData, 0, backupdatainput.getDataSize());
                return;
            }
            catch (IOException ioexception)
            {
                Log.w("SettingsBackupAgent", "Unable to read supplicant data");
            }
            restoredSupplicantData = null;
        }

        public void run()
        {
label0:
            {
                SettingsBackupAgent settingsbackupagent;
                boolean flag;
label1:
                {
                    if (restoredSupplicantData == null && restoredWifiConfigFile == null)
                        break label0;
                    int i = enableWifi(false);
                    if (restoredSupplicantData != null)
                    {
                        restoreWifiSupplicant("/data/misc/wifi/wpa_supplicant.conf", restoredSupplicantData, restoredSupplicantData.length);
                        FileUtils.setPermissions("/data/misc/wifi/wpa_supplicant.conf", 432, Process.myUid(), 1010);
                    }
                    if (restoredWifiConfigFile != null)
                        restoreFileData(SettingsBackupAgent.mWifiConfigFile, restoredWifiConfigFile, restoredWifiConfigFile.length);
                    settingsbackupagent = SettingsBackupAgent.this;
                    if (i != 3)
                    {
                        flag = false;
                        if (i != 2)
                            break label1;
                    }
                    flag = true;
                }
                settingsbackupagent.enableWifi(flag);
            }
        }

        WifiRestoreRunnable()
        {
            this$0 = SettingsBackupAgent.this;
            super();
        }
    }


    private static final int COLUMN_NAME = 1;
    private static final int COLUMN_VALUE = 2;
    private static final boolean DEBUG = false;
    private static final boolean DEBUG_BACKUP = false;
    private static final byte EMPTY_DATA[] = new byte[0];
    private static final String FILE_WIFI_SUPPLICANT = "/data/misc/wifi/wpa_supplicant.conf";
    private static final String FILE_WIFI_SUPPLICANT_TEMPLATE = "/system/etc/wifi/wpa_supplicant.conf";
    private static final int FULL_BACKUP_ADDED_GLOBAL = 2;
    private static final int FULL_BACKUP_VERSION = 2;
    private static final int INTEGER_BYTE_COUNT = 4;
    private static final String KEY_GLOBAL = "global";
    private static final String KEY_LOCALE = "locale";
    private static final String KEY_SECURE = "secure";
    private static final String KEY_SYSTEM = "system";
    private static final String KEY_WIFI_CONFIG = "\uFFEDCONFIG_WIFI";
    private static final String KEY_WIFI_SUPPLICANT = "\uFFEDWIFI";
    private static final String PROJECTION[] = {
        "_id", "name", "value"
    };
    private static final String STAGE_FILE = "flattened-data";
    private static final int STATE_GLOBAL = 5;
    private static final int STATE_LOCALE = 2;
    private static final int STATE_SECURE = 1;
    private static final int STATE_SIZE = 6;
    private static final int STATE_SIZES[] = {
        0, 4, 5, 6
    };
    private static final int STATE_SYSTEM = 0;
    private static final int STATE_VERSION = 3;
    private static final int STATE_WIFI_CONFIG = 4;
    private static final int STATE_WIFI_SUPPLICANT = 3;
    private static final String TAG = "SettingsBackupAgent";
    private static final long WIFI_BOUNCE_DELAY_MILLIS = 60000L;
    private static String mWifiConfigFile;
    private SettingsHelper mSettingsHelper;
    private WifiManager mWfm;
    WifiRestoreRunnable mWifiRestore;

    public SettingsBackupAgent()
    {
        mWifiRestore = null;
    }

    private void copyWifiSupplicantTemplate(BufferedWriter bufferedwriter)
    {
        BufferedReader bufferedreader;
        char ac[];
        bufferedreader = new BufferedReader(new FileReader("/system/etc/wifi/wpa_supplicant.conf"));
        ac = new char[1024];
_L1:
        int i = bufferedreader.read(ac);
label0:
        {
            if (i <= 0)
                break label0;
            try
            {
                bufferedwriter.write(ac, 0, i);
            }
            catch (IOException ioexception)
            {
                Log.w("SettingsBackupAgent", "Couldn't copy wpa_supplicant file");
                return;
            }
        }
          goto _L1
        bufferedreader.close();
        return;
    }

    private int enableWifi(boolean flag)
    {
        if (mWfm == null)
            mWfm = (WifiManager)getSystemService("wifi");
        if (mWfm != null)
        {
            int i = mWfm.getWifiState();
            mWfm.setWifiEnabled(flag);
            return i;
        } else
        {
            Log.e("SettingsBackupAgent", "Failed to fetch WifiManager instance");
            return 4;
        }
    }

    private byte[] extractRelevantValues(Cursor cursor, String as[])
    {
        int i;
        byte abyte0[][];
        i = as.length;
        abyte0 = new byte[i * 2][];
        if (cursor.moveToFirst()) goto _L2; else goto _L1
_L1:
        byte abyte1[];
        Log.e("SettingsBackupAgent", "Couldn't read from the cursor");
        abyte1 = new byte[0];
          goto _L3
_L2:
        int j;
        int k;
        HashMap hashmap;
        int l;
        j = 0;
        k = 0;
        hashmap = new HashMap();
        l = 0;
_L12:
        if (l >= i) goto _L5; else goto _L4
_L4:
        String s;
        String s1;
        s = as[l];
        s1 = (String)hashmap.remove(s);
        if (s1 != null) goto _L7; else goto _L6
_L6:
        if (cursor.isAfterLast()) goto _L7; else goto _L8
_L8:
        String s2;
        String s3;
        s2 = cursor.getString(1);
        s3 = cursor.getString(2);
        cursor.moveToNext();
        if (!s.equals(s2)) goto _L10; else goto _L9
_L9:
        s1 = s3;
_L7:
        if (s1 != null)
        {
            byte abyte2[] = s.getBytes();
            int l1 = j + (4 + abyte2.length);
            abyte0[k * 2] = abyte2;
            byte abyte3[] = s1.getBytes();
            j = l1 + (4 + abyte3.length);
            abyte0[1 + k * 2] = abyte3;
            k++;
        }
        l++;
        continue; /* Loop/switch isn't completed */
_L10:
        hashmap.put(s2, s3);
        if (true) goto _L6; else goto _L5
_L5:
        abyte1 = new byte[j];
        int i1 = 0;
        int j1 = k * 2;
        for (int k1 = 0; k1 < j1; k1++)
            i1 = writeBytes(abyte1, writeInt(abyte1, i1, abyte0[k1].length), abyte0[k1]);

_L3:
        return abyte1;
        if (true) goto _L12; else goto _L11
_L11:
    }

    private byte[] getFileData(String s)
    {
        FileInputStream fileinputstream = null;
        File file;
        FileInputStream fileinputstream1;
        file = new File(s);
        fileinputstream1 = new FileInputStream(file);
        byte abyte1[] = new byte[(int)file.length()];
        int i = 0;
_L2:
        int j;
        if (i >= abyte1.length)
            break; /* Loop/switch isn't completed */
        j = fileinputstream1.read(abyte1, i, abyte1.length - i);
        if (j < 0)
            break; /* Loop/switch isn't completed */
        i += j;
        if (true) goto _L2; else goto _L1
_L1:
        byte abyte0[];
        if (i >= abyte1.length)
            break MISSING_BLOCK_LABEL_124;
        Log.w("SettingsBackupAgent", (new StringBuilder()).append("Couldn't backup ").append(s).toString());
        abyte0 = EMPTY_DATA;
        Exception exception;
        if (fileinputstream1 != null)
            try
            {
                fileinputstream1.close();
            }
            catch (IOException ioexception4) { }
        return abyte0;
        IOException ioexception2;
        IOException ioexception5;
        if (fileinputstream1 != null)
            try
            {
                fileinputstream1.close();
            }
            catch (IOException ioexception3) { }
        return abyte1;
        ioexception5;
_L6:
        Log.w("SettingsBackupAgent", (new StringBuilder()).append("Couldn't backup ").append(s).toString());
        abyte0 = EMPTY_DATA;
        if (fileinputstream != null)
        {
            try
            {
                fileinputstream.close();
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception2)
            {
                return abyte0;
            }
            return abyte0;
        } else
        {
            break MISSING_BLOCK_LABEL_121;
        }
        exception;
_L4:
        if (fileinputstream != null)
            try
            {
                fileinputstream.close();
            }
            catch (IOException ioexception1) { }
        throw exception;
        exception;
        fileinputstream = fileinputstream1;
        if (true) goto _L4; else goto _L3
_L3:
        IOException ioexception;
        ioexception;
        fileinputstream = fileinputstream1;
        if (true) goto _L6; else goto _L5
_L5:
    }

    private byte[] getGlobalSettings()
    {
        Cursor cursor = getContentResolver().query(android.provider.Settings.Global.CONTENT_URI, PROJECTION, null, null, null);
        byte abyte0[] = extractRelevantValues(cursor, android.provider.Settings.Global.SETTINGS_TO_BACKUP);
        cursor.close();
        return abyte0;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    private byte[] getSecureSettings()
    {
        Cursor cursor = getContentResolver().query(android.provider.Settings.Secure.CONTENT_URI, PROJECTION, null, null, null);
        byte abyte0[] = extractRelevantValues(cursor, android.provider.Settings.Secure.SETTINGS_TO_BACKUP);
        cursor.close();
        return abyte0;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    private byte[] getSystemSettings()
    {
        Cursor cursor = getContentResolver().query(android.provider.Settings.System.CONTENT_URI, PROJECTION, null, null, null);
        byte abyte0[] = extractRelevantValues(cursor, android.provider.Settings.System.SETTINGS_TO_BACKUP);
        cursor.close();
        return abyte0;
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    private byte[] getWifiSupplicant(String s)
    {
        BufferedReader bufferedreader = null;
        File file;
        boolean flag;
        file = new File(s);
        flag = file.exists();
        bufferedreader = null;
        if (!flag) goto _L2; else goto _L1
_L1:
        BufferedReader bufferedreader1 = new BufferedReader(new FileReader(file));
        StringBuffer stringbuffer = new StringBuffer();
        boolean flag1 = false;
_L8:
        String s1 = bufferedreader1.readLine();
        if (s1 == null) goto _L4; else goto _L3
_L3:
        if (flag1) goto _L6; else goto _L5
_L5:
        if (s1.startsWith("network"))
            flag1 = true;
_L6:
        if (!flag1) goto _L8; else goto _L7
_L7:
        stringbuffer.append(s1).append("\n");
          goto _L8
        IOException ioexception3;
        ioexception3;
        bufferedreader = bufferedreader1;
_L12:
        byte abyte0[];
        Log.w("SettingsBackupAgent", (new StringBuilder()).append("Couldn't backup ").append(s).toString());
        abyte0 = EMPTY_DATA;
        Exception exception;
        byte abyte2[];
        if (bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch (IOException ioexception2)
            {
                return abyte0;
            }
        return abyte0;
_L4:
        if (stringbuffer.length() <= 0)
            break MISSING_BLOCK_LABEL_183;
        abyte2 = stringbuffer.toString().getBytes();
        byte abyte1[];
        IOException ioexception6;
        if (bufferedreader1 != null)
            try
            {
                bufferedreader1.close();
            }
            catch (IOException ioexception5) { }
        return abyte2;
        abyte1 = EMPTY_DATA;
        if (bufferedreader1 != null)
            try
            {
                bufferedreader1.close();
            }
            catch (IOException ioexception4) { }
        return abyte1;
_L2:
        abyte0 = EMPTY_DATA;
        if (false)
            try
            {
                throw null;
            }
            // Misplaced declaration of an exception variable
            catch (IOException ioexception6)
            {
                return abyte0;
            }
        else
            break MISSING_BLOCK_LABEL_149;
        exception;
_L10:
        if (bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch (IOException ioexception1) { }
        throw exception;
        exception;
        bufferedreader = bufferedreader1;
        if (true) goto _L10; else goto _L9
_L9:
        IOException ioexception;
        ioexception;
        bufferedreader = null;
        if (true) goto _L12; else goto _L11
_L11:
    }

    private int readInt(byte abyte0[], int i)
    {
        return (0xff & abyte0[i]) << 24 | (0xff & abyte0[i + 1]) << 16 | (0xff & abyte0[i + 2]) << 8 | (0xff & abyte0[i + 3]) << 0;
    }

    private long[] readOldChecksums(ParcelFileDescriptor parcelfiledescriptor)
        throws IOException
    {
        long al[];
        al = new long[6];
        DataInputStream datainputstream = new DataInputStream(new FileInputStream(parcelfiledescriptor.getFileDescriptor()));
        int i;
        int j;
        try
        {
            i = datainputstream.readInt();
        }
        catch (EOFException eofexception)
        {
            break; /* Loop/switch isn't completed */
        }
        j = 0;
        if (j >= STATE_SIZES[i])
            break; /* Loop/switch isn't completed */
        al[j] = datainputstream.readLong();
        j++;
        continue; /* Loop/switch isn't completed */
        if (true) goto _L2; else goto _L1
_L2:
        break MISSING_BLOCK_LABEL_33;
_L1:
        datainputstream.close();
        return al;
    }

    private void restoreFileData(String s, byte abyte0[], int i)
    {
        try
        {
            File file = new File(s);
            if (file.exists())
                file.delete();
            BufferedOutputStream bufferedoutputstream = new BufferedOutputStream(new FileOutputStream(s, true));
            bufferedoutputstream.write(abyte0, 0, i);
            bufferedoutputstream.close();
            return;
        }
        catch (IOException ioexception)
        {
            Log.w("SettingsBackupAgent", (new StringBuilder()).append("Couldn't restore ").append(s).toString());
        }
    }

    private void restoreSettings(BackupDataInput backupdatainput, Uri uri, HashSet hashset)
    {
        byte abyte0[] = new byte[backupdatainput.getDataSize()];
        try
        {
            backupdatainput.readEntityData(abyte0, 0, abyte0.length);
        }
        catch (IOException ioexception)
        {
            Log.e("SettingsBackupAgent", "Couldn't read entity data");
            return;
        }
        restoreSettings(abyte0, abyte0.length, uri, hashset);
    }

    private void restoreSettings(byte abyte0[], int i, Uri uri, HashSet hashset)
    {
        if (!uri.equals(android.provider.Settings.Secure.CONTENT_URI)) goto _L2; else goto _L1
_L1:
        String as[] = android.provider.Settings.Secure.SETTINGS_TO_BACKUP;
          goto _L3
_L2:
        if (!uri.equals(android.provider.Settings.System.CONTENT_URI)) goto _L5; else goto _L4
_L4:
        as = android.provider.Settings.System.SETTINGS_TO_BACKUP;
          goto _L3
_L5:
        if (!uri.equals(android.provider.Settings.Global.CONTENT_URI)) goto _L7; else goto _L6
_L6:
        as = android.provider.Settings.Global.SETTINGS_TO_BACKUP;
_L3:
        int j;
        HashMap hashmap;
        ContentValues contentvalues;
        SettingsHelper settingshelper;
        int k;
        int l;
        j = 0;
        hashmap = new HashMap();
        contentvalues = new ContentValues(2);
        settingshelper = mSettingsHelper;
        k = as.length;
        l = 0;
_L16:
        if (l >= k) goto _L9; else goto _L8
_L8:
        String s;
        String s1;
        s = as[l];
        s1 = (String)hashmap.remove(s);
        if (s1 != null) goto _L11; else goto _L10
_L10:
        if (j >= i) goto _L11; else goto _L12
_L12:
        String s2;
        String s3;
        int i1 = readInt(abyte0, j);
        int j1 = j + 4;
        if (i1 > 0)
            s2 = new String(abyte0, j1, i1);
        else
            s2 = null;
        int k1 = j1 + i1;
        int l1 = readInt(abyte0, k1);
        int i2 = k1 + 4;
        if (l1 > 0)
            s3 = new String(abyte0, i2, l1);
        else
            s3 = null;
        j = i2 + l1;
        if (!s.equals(s2)) goto _L14; else goto _L13
_L13:
        s1 = s3;
_L11:
        if (s1 != null)
        {
            Uri uri1;
            if (hashset != null && hashset.contains(s))
                uri1 = android.provider.Settings.Global.CONTENT_URI;
            else
                uri1 = uri;
            if (settingshelper.restoreValue(s, s1))
            {
                contentvalues.clear();
                contentvalues.put("name", s);
                contentvalues.put("value", s1);
                getContentResolver().insert(uri1, contentvalues);
            }
        }
        l++;
        continue; /* Loop/switch isn't completed */
_L14:
        hashmap.put(s2, s3);
        if (true) goto _L10; else goto _L9
_L9:
        return;
_L7:
        throw new IllegalArgumentException((new StringBuilder()).append("Unknown URI: ").append(uri).toString());
        if (true) goto _L16; else goto _L15
_L15:
    }

    private void restoreWifiSupplicant(String s, byte abyte0[], int i)
    {
        WifiNetworkSettings wifinetworksettings;
        char ac[];
        int j;
        BufferedWriter bufferedwriter;
        try
        {
            wifinetworksettings = new WifiNetworkSettings();
            File file = new File("/data/misc/wifi/wpa_supplicant.conf");
            if (file.exists())
            {
                BufferedReader bufferedreader = new BufferedReader(new FileReader("/data/misc/wifi/wpa_supplicant.conf"));
                wifinetworksettings.readNetworks(bufferedreader);
                bufferedreader.close();
                file.delete();
            }
        }
        catch (IOException ioexception)
        {
            Log.w("SettingsBackupAgent", (new StringBuilder()).append("Couldn't restore ").append(s).toString());
            return;
        }
        if (i <= 0)
            break MISSING_BLOCK_LABEL_120;
        ac = new char[i];
        j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        ac[j] = (char)abyte0[j];
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        wifinetworksettings.readNetworks(new BufferedReader(new CharArrayReader(ac)));
        bufferedwriter = new BufferedWriter(new FileWriter("/data/misc/wifi/wpa_supplicant.conf"));
        copyWifiSupplicantTemplate(bufferedwriter);
        wifinetworksettings.write(bufferedwriter);
        bufferedwriter.close();
        return;
    }

    private int writeBytes(byte abyte0[], int i, byte abyte1[])
    {
        System.arraycopy(abyte1, 0, abyte0, i, abyte1.length);
        return i + abyte1.length;
    }

    private long writeIfChanged(long l, String s, byte abyte0[], BackupDataOutput backupdataoutput)
    {
        CRC32 crc32 = new CRC32();
        crc32.update(abyte0);
        long l1 = crc32.getValue();
        if (l == l1)
            return l;
        try
        {
            backupdataoutput.writeEntityHeader(s, abyte0.length);
            backupdataoutput.writeEntityData(abyte0, abyte0.length);
        }
        catch (IOException ioexception) { }
        return l1;
    }

    private int writeInt(byte abyte0[], int i, int j)
    {
        abyte0[i + 0] = (byte)(0xff & j >> 24);
        abyte0[i + 1] = (byte)(0xff & j >> 16);
        abyte0[i + 2] = (byte)(0xff & j >> 8);
        abyte0[i + 3] = (byte)(0xff & j >> 0);
        return i + 4;
    }

    private void writeNewChecksums(long al[], ParcelFileDescriptor parcelfiledescriptor)
        throws IOException
    {
        DataOutputStream dataoutputstream = new DataOutputStream(new FileOutputStream(parcelfiledescriptor.getFileDescriptor()));
        dataoutputstream.writeInt(3);
        for (int i = 0; i < 6; i++)
            dataoutputstream.writeLong(al[i]);

        dataoutputstream.close();
    }

    void initWifiRestoreIfNecessary()
    {
        if (mWifiRestore == null)
            mWifiRestore = new WifiRestoreRunnable();
    }

    public void onBackup(ParcelFileDescriptor parcelfiledescriptor, BackupDataOutput backupdataoutput, ParcelFileDescriptor parcelfiledescriptor1)
        throws IOException
    {
        byte abyte0[] = getSystemSettings();
        byte abyte1[] = getSecureSettings();
        byte abyte2[] = getGlobalSettings();
        byte abyte3[] = mSettingsHelper.getLocaleData();
        byte abyte4[] = getWifiSupplicant("/data/misc/wifi/wpa_supplicant.conf");
        byte abyte5[] = getFileData(mWifiConfigFile);
        long al[] = readOldChecksums(parcelfiledescriptor);
        al[0] = writeIfChanged(al[0], "system", abyte0, backupdataoutput);
        al[1] = writeIfChanged(al[1], "secure", abyte1, backupdataoutput);
        al[5] = writeIfChanged(al[5], "global", abyte2, backupdataoutput);
        al[2] = writeIfChanged(al[2], "locale", abyte3, backupdataoutput);
        al[3] = writeIfChanged(al[3], "\uFFEDWIFI", abyte4, backupdataoutput);
        al[4] = writeIfChanged(al[4], "\uFFEDCONFIG_WIFI", abyte5, backupdataoutput);
        writeNewChecksums(al, parcelfiledescriptor1);
    }

    public void onCreate()
    {
        mSettingsHelper = new SettingsHelper(this);
        super.onCreate();
        WifiManager wifimanager = (WifiManager)getSystemService("wifi");
        if (wifimanager != null)
            mWifiConfigFile = wifimanager.getConfigFile();
    }

    public void onFullBackup(FullBackupDataOutput fullbackupdataoutput)
        throws IOException
    {
        byte abyte0[];
        byte abyte1[];
        byte abyte2[];
        byte abyte3[];
        byte abyte4[];
        byte abyte5[];
        File file;
        abyte0 = getSystemSettings();
        abyte1 = getSecureSettings();
        abyte2 = getGlobalSettings();
        abyte3 = mSettingsHelper.getLocaleData();
        abyte4 = getWifiSupplicant("/data/misc/wifi/wpa_supplicant.conf");
        abyte5 = getFileData(mWifiConfigFile);
        file = new File(getFilesDir().getAbsolutePath(), "flattened-data");
        DataOutputStream dataoutputstream = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
        dataoutputstream.writeInt(2);
        dataoutputstream.writeInt(abyte0.length);
        dataoutputstream.write(abyte0);
        dataoutputstream.writeInt(abyte1.length);
        dataoutputstream.write(abyte1);
        dataoutputstream.writeInt(abyte2.length);
        dataoutputstream.write(abyte2);
        dataoutputstream.writeInt(abyte3.length);
        dataoutputstream.write(abyte3);
        dataoutputstream.writeInt(abyte4.length);
        dataoutputstream.write(abyte4);
        dataoutputstream.writeInt(abyte5.length);
        dataoutputstream.write(abyte5);
        dataoutputstream.flush();
        fullBackupFile(file, fullbackupdataoutput);
        file.delete();
        return;
        Exception exception;
        exception;
        file.delete();
        throw exception;
    }

    public void onRestore(BackupDataInput backupdatainput, int i, ParcelFileDescriptor parcelfiledescriptor)
        throws IOException
    {
        HashSet hashset = new HashSet();
        android.provider.Settings.System.getMovedKeys(hashset);
        android.provider.Settings.Secure.getMovedKeys(hashset);
        while (backupdatainput.readNextHeader()) 
        {
            String s = backupdatainput.getKey();
            int j = backupdatainput.getDataSize();
            if ("system".equals(s))
            {
                restoreSettings(backupdatainput, android.provider.Settings.System.CONTENT_URI, hashset);
                mSettingsHelper.applyAudioSettings();
            } else
            if ("secure".equals(s))
                restoreSettings(backupdatainput, android.provider.Settings.Secure.CONTENT_URI, hashset);
            else
            if ("global".equals(s))
                restoreSettings(backupdatainput, android.provider.Settings.Global.CONTENT_URI, null);
            else
            if ("\uFFEDWIFI".equals(s))
            {
                initWifiRestoreIfNecessary();
                mWifiRestore.incorporateWifiSupplicant(backupdatainput);
            } else
            if ("locale".equals(s))
            {
                byte abyte0[] = new byte[j];
                backupdatainput.readEntityData(abyte0, 0, j);
                mSettingsHelper.setLocaleData(abyte0, j);
            } else
            if ("\uFFEDCONFIG_WIFI".equals(s))
            {
                initWifiRestoreIfNecessary();
                mWifiRestore.incorporateWifiConfigFile(backupdatainput);
            } else
            {
                backupdatainput.skipEntityData();
            }
        }
        if (mWifiRestore != null)
            (new Handler(getMainLooper())).postDelayed(mWifiRestore, 60000L);
    }

    public void onRestoreFile(ParcelFileDescriptor parcelfiledescriptor, long l, int i, String s, String s1, long l1, long l2)
        throws IOException
    {
        DataInputStream datainputstream = new DataInputStream(new FileInputStream(parcelfiledescriptor.getFileDescriptor()));
        int j = datainputstream.readInt();
        if (j <= 2)
        {
            HashSet hashset = new HashSet();
            android.provider.Settings.System.getMovedKeys(hashset);
            android.provider.Settings.Secure.getMovedKeys(hashset);
            int k = datainputstream.readInt();
            byte abyte0[] = new byte[k];
            datainputstream.readFully(abyte0, 0, k);
            restoreSettings(abyte0, k, android.provider.Settings.System.CONTENT_URI, hashset);
            int i1 = datainputstream.readInt();
            if (i1 > abyte0.length)
                abyte0 = new byte[i1];
            datainputstream.readFully(abyte0, 0, i1);
            restoreSettings(abyte0, i1, android.provider.Settings.Secure.CONTENT_URI, hashset);
            if (j >= 2)
            {
                int k2 = datainputstream.readInt();
                if (k2 > abyte0.length)
                    abyte0 = new byte[k2];
                datainputstream.readFully(abyte0, 0, k2);
                hashset.clear();
                restoreSettings(abyte0, k2, android.provider.Settings.Global.CONTENT_URI, hashset);
            }
            int j1 = datainputstream.readInt();
            if (j1 > abyte0.length)
                abyte0 = new byte[j1];
            datainputstream.readFully(abyte0, 0, j1);
            mSettingsHelper.setLocaleData(abyte0, j1);
            int k1 = datainputstream.readInt();
            if (k1 > abyte0.length)
                abyte0 = new byte[k1];
            datainputstream.readFully(abyte0, 0, k1);
            int i2 = enableWifi(false);
            restoreWifiSupplicant("/data/misc/wifi/wpa_supplicant.conf", abyte0, k1);
            FileUtils.setPermissions("/data/misc/wifi/wpa_supplicant.conf", 432, Process.myUid(), 1010);
            boolean flag;
            if (i2 != 3 && i2 != 2)
                flag = false;
            else
                flag = true;
            enableWifi(flag);
            int j2 = datainputstream.readInt();
            if (j2 > abyte0.length)
                abyte0 = new byte[j2];
            datainputstream.readFully(abyte0, 0, j2);
            restoreFileData(mWifiConfigFile, abyte0, j2);
            return;
        } else
        {
            parcelfiledescriptor.close();
            throw new IOException("Invalid file schema");
        }
    }





}
