// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app.admin;

import android.content.ComponentName;
import android.os.*;
import java.util.List;

public interface IDevicePolicyManager
    extends IInterface
{
    public static abstract class Stub extends Binder
        implements IDevicePolicyManager
    {

        private static final String DESCRIPTOR = "android.app.admin.IDevicePolicyManager";
        static final int TRANSACTION_getActiveAdmins = 42;
        static final int TRANSACTION_getCameraDisabled = 37;
        static final int TRANSACTION_getCurrentFailedPasswordAttempts = 23;
        static final int TRANSACTION_getGlobalProxyAdmin = 32;
        static final int TRANSACTION_getKeyguardDisabledFeatures = 39;
        static final int TRANSACTION_getMaximumFailedPasswordsForWipe = 25;
        static final int TRANSACTION_getMaximumTimeToLock = 28;
        static final int TRANSACTION_getPasswordExpiration = 21;
        static final int TRANSACTION_getPasswordExpirationTimeout = 20;
        static final int TRANSACTION_getPasswordHistoryLength = 18;
        static final int TRANSACTION_getPasswordMinimumLength = 4;
        static final int TRANSACTION_getPasswordMinimumLetters = 10;
        static final int TRANSACTION_getPasswordMinimumLowerCase = 8;
        static final int TRANSACTION_getPasswordMinimumNonLetter = 16;
        static final int TRANSACTION_getPasswordMinimumNumeric = 12;
        static final int TRANSACTION_getPasswordMinimumSymbols = 14;
        static final int TRANSACTION_getPasswordMinimumUpperCase = 6;
        static final int TRANSACTION_getPasswordQuality = 2;
        static final int TRANSACTION_getRemoveWarning = 44;
        static final int TRANSACTION_getStorageEncryption = 34;
        static final int TRANSACTION_getStorageEncryptionStatus = 35;
        static final int TRANSACTION_hasGrantedPolicy = 46;
        static final int TRANSACTION_isActivePasswordSufficient = 22;
        static final int TRANSACTION_isAdminActive = 41;
        static final int TRANSACTION_lockNow = 29;
        static final int TRANSACTION_packageHasActiveAdmins = 43;
        static final int TRANSACTION_removeActiveAdmin = 45;
        static final int TRANSACTION_reportFailedPasswordAttempt = 48;
        static final int TRANSACTION_reportSuccessfulPasswordAttempt = 49;
        static final int TRANSACTION_resetPassword = 26;
        static final int TRANSACTION_setActiveAdmin = 40;
        static final int TRANSACTION_setActivePasswordState = 47;
        static final int TRANSACTION_setCameraDisabled = 36;
        static final int TRANSACTION_setGlobalProxy = 31;
        static final int TRANSACTION_setKeyguardDisabledFeatures = 38;
        static final int TRANSACTION_setMaximumFailedPasswordsForWipe = 24;
        static final int TRANSACTION_setMaximumTimeToLock = 27;
        static final int TRANSACTION_setPasswordExpirationTimeout = 19;
        static final int TRANSACTION_setPasswordHistoryLength = 17;
        static final int TRANSACTION_setPasswordMinimumLength = 3;
        static final int TRANSACTION_setPasswordMinimumLetters = 9;
        static final int TRANSACTION_setPasswordMinimumLowerCase = 7;
        static final int TRANSACTION_setPasswordMinimumNonLetter = 15;
        static final int TRANSACTION_setPasswordMinimumNumeric = 11;
        static final int TRANSACTION_setPasswordMinimumSymbols = 13;
        static final int TRANSACTION_setPasswordMinimumUpperCase = 5;
        static final int TRANSACTION_setPasswordQuality = 1;
        static final int TRANSACTION_setStorageEncryption = 33;
        static final int TRANSACTION_wipeData = 30;

        public static IDevicePolicyManager asInterface(IBinder ibinder)
        {
            if (ibinder == null)
                return null;
            IInterface iinterface = ibinder.queryLocalInterface("android.app.admin.IDevicePolicyManager");
            if (iinterface != null && (iinterface instanceof IDevicePolicyManager))
                return (IDevicePolicyManager)iinterface;
            else
                return new Proxy(ibinder);
        }

        public IBinder asBinder()
        {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel1, int j)
            throws RemoteException
        {
            switch (i)
            {
            case 49: // '1'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                reportSuccessfulPasswordAttempt(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 48: // '0'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                reportFailedPasswordAttempt(parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 47: // '/'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                setActivePasswordState(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 46: // '.'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname38;
                if (parcel.readInt() != 0)
                    componentname38 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname38 = null;
                boolean flag9 = hasGrantedPolicy(componentname38, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                int j6;
                if (flag9)
                    j6 = 1;
                else
                    j6 = 0;
                parcel1.writeInt(j6);
                return true;

            case 45: // '-'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname37;
                if (parcel.readInt() != 0)
                    componentname37 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname37 = null;
                removeActiveAdmin(componentname37, parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 44: // ','
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname36;
                if (parcel.readInt() != 0)
                    componentname36 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname36 = null;
                RemoteCallback remotecallback;
                if (parcel.readInt() != 0)
                    remotecallback = (RemoteCallback)RemoteCallback.CREATOR.createFromParcel(parcel);
                else
                    remotecallback = null;
                getRemoveWarning(componentname36, remotecallback, parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 43: // '+'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                boolean flag8 = packageHasActiveAdmins(parcel.readString(), parcel.readInt());
                parcel1.writeNoException();
                int i6;
                if (flag8)
                    i6 = 1;
                else
                    i6 = 0;
                parcel1.writeInt(i6);
                return true;

            case 42: // '*'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                List list = getActiveAdmins(parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeTypedList(list);
                return true;

            case 41: // ')'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname35;
                if (parcel.readInt() != 0)
                    componentname35 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname35 = null;
                boolean flag7 = isAdminActive(componentname35, parcel.readInt());
                parcel1.writeNoException();
                int l5;
                if (flag7)
                    l5 = 1;
                else
                    l5 = 0;
                parcel1.writeInt(l5);
                return true;

            case 40: // '('
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname34;
                if (parcel.readInt() != 0)
                    componentname34 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname34 = null;
                boolean flag6;
                if (parcel.readInt() != 0)
                    flag6 = true;
                else
                    flag6 = false;
                setActiveAdmin(componentname34, flag6, parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 39: // '\''
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname33;
                if (parcel.readInt() != 0)
                    componentname33 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname33 = null;
                int k5 = getKeyguardDisabledFeatures(componentname33, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(k5);
                return true;

            case 38: // '&'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname32;
                if (parcel.readInt() != 0)
                    componentname32 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname32 = null;
                setKeyguardDisabledFeatures(componentname32, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 37: // '%'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname31;
                if (parcel.readInt() != 0)
                    componentname31 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname31 = null;
                boolean flag5 = getCameraDisabled(componentname31, parcel.readInt());
                parcel1.writeNoException();
                int j5;
                if (flag5)
                    j5 = 1;
                else
                    j5 = 0;
                parcel1.writeInt(j5);
                return true;

            case 36: // '$'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname30;
                if (parcel.readInt() != 0)
                    componentname30 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname30 = null;
                boolean flag4;
                if (parcel.readInt() != 0)
                    flag4 = true;
                else
                    flag4 = false;
                setCameraDisabled(componentname30, flag4, parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 35: // '#'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                int i5 = getStorageEncryptionStatus(parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(i5);
                return true;

            case 34: // '"'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname29;
                if (parcel.readInt() != 0)
                    componentname29 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname29 = null;
                boolean flag3 = getStorageEncryption(componentname29, parcel.readInt());
                parcel1.writeNoException();
                int k4;
                if (flag3)
                    k4 = 1;
                else
                    k4 = 0;
                parcel1.writeInt(k4);
                return true;

            case 33: // '!'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname28;
                if (parcel.readInt() != 0)
                    componentname28 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname28 = null;
                boolean flag2;
                if (parcel.readInt() != 0)
                    flag2 = true;
                else
                    flag2 = false;
                int j4 = setStorageEncryption(componentname28, flag2, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(j4);
                return true;

            case 32: // ' '
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname27 = getGlobalProxyAdmin(parcel.readInt());
                parcel1.writeNoException();
                if (componentname27 != null)
                {
                    parcel1.writeInt(1);
                    componentname27.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 31: // '\037'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname25;
                if (parcel.readInt() != 0)
                    componentname25 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname25 = null;
                ComponentName componentname26 = setGlobalProxy(componentname25, parcel.readString(), parcel.readString(), parcel.readInt());
                parcel1.writeNoException();
                if (componentname26 != null)
                {
                    parcel1.writeInt(1);
                    componentname26.writeToParcel(parcel1, 1);
                } else
                {
                    parcel1.writeInt(0);
                }
                return true;

            case 30: // '\036'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                wipeData(parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 29: // '\035'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                lockNow();
                parcel1.writeNoException();
                return true;

            case 28: // '\034'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname24;
                if (parcel.readInt() != 0)
                    componentname24 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname24 = null;
                long l4 = getMaximumTimeToLock(componentname24, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeLong(l4);
                return true;

            case 27: // '\033'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname23;
                if (parcel.readInt() != 0)
                    componentname23 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname23 = null;
                setMaximumTimeToLock(componentname23, parcel.readLong(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 26: // '\032'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                boolean flag1 = resetPassword(parcel.readString(), parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                int i4;
                if (flag1)
                    i4 = 1;
                else
                    i4 = 0;
                parcel1.writeInt(i4);
                return true;

            case 25: // '\031'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname22;
                if (parcel.readInt() != 0)
                    componentname22 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname22 = null;
                int k3 = getMaximumFailedPasswordsForWipe(componentname22, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(k3);
                return true;

            case 24: // '\030'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname21;
                if (parcel.readInt() != 0)
                    componentname21 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname21 = null;
                setMaximumFailedPasswordsForWipe(componentname21, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 23: // '\027'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                int j3 = getCurrentFailedPasswordAttempts(parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(j3);
                return true;

            case 22: // '\026'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                boolean flag = isActivePasswordSufficient(parcel.readInt());
                parcel1.writeNoException();
                int i3;
                if (flag)
                    i3 = 1;
                else
                    i3 = 0;
                parcel1.writeInt(i3);
                return true;

            case 21: // '\025'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname20;
                if (parcel.readInt() != 0)
                    componentname20 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname20 = null;
                long l3 = getPasswordExpiration(componentname20, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeLong(l3);
                return true;

            case 20: // '\024'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname19;
                if (parcel.readInt() != 0)
                    componentname19 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname19 = null;
                long l2 = getPasswordExpirationTimeout(componentname19, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeLong(l2);
                return true;

            case 19: // '\023'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname18;
                if (parcel.readInt() != 0)
                    componentname18 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname18 = null;
                setPasswordExpirationTimeout(componentname18, parcel.readLong(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 18: // '\022'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname17;
                if (parcel.readInt() != 0)
                    componentname17 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname17 = null;
                int k2 = getPasswordHistoryLength(componentname17, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(k2);
                return true;

            case 17: // '\021'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname16;
                if (parcel.readInt() != 0)
                    componentname16 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname16 = null;
                setPasswordHistoryLength(componentname16, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 16: // '\020'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname15;
                if (parcel.readInt() != 0)
                    componentname15 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname15 = null;
                int j2 = getPasswordMinimumNonLetter(componentname15, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(j2);
                return true;

            case 15: // '\017'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname14;
                if (parcel.readInt() != 0)
                    componentname14 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname14 = null;
                setPasswordMinimumNonLetter(componentname14, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 14: // '\016'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname13;
                if (parcel.readInt() != 0)
                    componentname13 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname13 = null;
                int i2 = getPasswordMinimumSymbols(componentname13, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(i2);
                return true;

            case 13: // '\r'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname12;
                if (parcel.readInt() != 0)
                    componentname12 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname12 = null;
                setPasswordMinimumSymbols(componentname12, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 12: // '\f'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname11;
                if (parcel.readInt() != 0)
                    componentname11 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname11 = null;
                int l1 = getPasswordMinimumNumeric(componentname11, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(l1);
                return true;

            case 11: // '\013'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname10;
                if (parcel.readInt() != 0)
                    componentname10 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname10 = null;
                setPasswordMinimumNumeric(componentname10, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 10: // '\n'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname9;
                if (parcel.readInt() != 0)
                    componentname9 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname9 = null;
                int k1 = getPasswordMinimumLetters(componentname9, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(k1);
                return true;

            case 9: // '\t'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname8;
                if (parcel.readInt() != 0)
                    componentname8 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname8 = null;
                setPasswordMinimumLetters(componentname8, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 8: // '\b'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname7;
                if (parcel.readInt() != 0)
                    componentname7 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname7 = null;
                int j1 = getPasswordMinimumLowerCase(componentname7, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(j1);
                return true;

            case 7: // '\007'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname6;
                if (parcel.readInt() != 0)
                    componentname6 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname6 = null;
                setPasswordMinimumLowerCase(componentname6, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 6: // '\006'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname5;
                if (parcel.readInt() != 0)
                    componentname5 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname5 = null;
                int i1 = getPasswordMinimumUpperCase(componentname5, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(i1);
                return true;

            case 5: // '\005'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname4;
                if (parcel.readInt() != 0)
                    componentname4 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname4 = null;
                setPasswordMinimumUpperCase(componentname4, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 4: // '\004'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname3;
                if (parcel.readInt() != 0)
                    componentname3 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname3 = null;
                int l = getPasswordMinimumLength(componentname3, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(l);
                return true;

            case 3: // '\003'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname2;
                if (parcel.readInt() != 0)
                    componentname2 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname2 = null;
                setPasswordMinimumLength(componentname2, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 2: // '\002'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname1;
                if (parcel.readInt() != 0)
                    componentname1 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname1 = null;
                int k = getPasswordQuality(componentname1, parcel.readInt());
                parcel1.writeNoException();
                parcel1.writeInt(k);
                return true;

            case 1: // '\001'
                parcel.enforceInterface("android.app.admin.IDevicePolicyManager");
                ComponentName componentname;
                if (parcel.readInt() != 0)
                    componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel);
                else
                    componentname = null;
                setPasswordQuality(componentname, parcel.readInt(), parcel.readInt());
                parcel1.writeNoException();
                return true;

            case 1598968902: 
                parcel1.writeString("android.app.admin.IDevicePolicyManager");
                return true;
            }
            return super.onTransact(i, parcel, parcel1, j);
        }

        public Stub()
        {
            attachInterface(this, "android.app.admin.IDevicePolicyManager");
        }
    }

    private static class Stub.Proxy
        implements IDevicePolicyManager
    {

        private IBinder mRemote;

        public IBinder asBinder()
        {
            return mRemote;
        }

        public List getActiveAdmins(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            java.util.ArrayList arraylist;
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            mRemote.transact(42, parcel, parcel1, 0);
            parcel1.readException();
            arraylist = parcel1.createTypedArrayList(ComponentName.CREATOR);
            parcel1.recycle();
            parcel.recycle();
            return arraylist;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean getCameraDisabled(ComponentName componentname, int i)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_88;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(37, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            Exception exception;
            if (j == 0)
                flag = false;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            parcel.writeInt(0);
              goto _L1
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getCurrentFailedPasswordAttempts(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            mRemote.transact(23, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public ComponentName getGlobalProxyAdmin(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            mRemote.transact(32, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0) goto _L2; else goto _L1
_L1:
            ComponentName componentname = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return componentname;
_L2:
            componentname = null;
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public String getInterfaceDescriptor()
        {
            return "android.app.admin.IDevicePolicyManager";
        }

        public int getKeyguardDisabledFeatures(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(39, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getMaximumFailedPasswordsForWipe(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(25, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public long getMaximumTimeToLock(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            long l;
            parcel.writeInt(i);
            mRemote.transact(28, parcel, parcel1, 0);
            parcel1.readException();
            l = parcel1.readLong();
            parcel1.recycle();
            parcel.recycle();
            return l;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public long getPasswordExpiration(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            long l;
            parcel.writeInt(i);
            mRemote.transact(21, parcel, parcel1, 0);
            parcel1.readException();
            l = parcel1.readLong();
            parcel1.recycle();
            parcel.recycle();
            return l;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public long getPasswordExpirationTimeout(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            long l;
            parcel.writeInt(i);
            mRemote.transact(20, parcel, parcel1, 0);
            parcel1.readException();
            l = parcel1.readLong();
            parcel1.recycle();
            parcel.recycle();
            return l;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordHistoryLength(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(18, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordMinimumLength(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_74;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(4, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordMinimumLetters(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(10, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordMinimumLowerCase(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(8, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordMinimumNonLetter(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(16, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordMinimumNumeric(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(12, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordMinimumSymbols(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(14, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordMinimumUpperCase(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_75;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(6, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getPasswordQuality(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_74;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(2, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void getRemoveWarning(ComponentName componentname, RemoteCallback remotecallback, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L3:
            if (remotecallback == null)
                break MISSING_BLOCK_LABEL_114;
            parcel.writeInt(1);
            remotecallback.writeToParcel(parcel, 0);
_L4:
            parcel.writeInt(i);
            mRemote.transact(44, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
            parcel.writeInt(0);
              goto _L4
        }

        public boolean getStorageEncryption(ComponentName componentname, int i)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_88;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(34, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            Exception exception;
            if (j == 0)
                flag = false;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            parcel.writeInt(0);
              goto _L1
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int getStorageEncryptionStatus(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            mRemote.transact(35, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return j;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean hasGrantedPolicy(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_96;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int k;
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(46, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            Exception exception;
            if (k == 0)
                flag = false;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            parcel.writeInt(0);
              goto _L1
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean isActivePasswordSufficient(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            mRemote.transact(22, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            boolean flag = false;
            if (j != 0)
                flag = true;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean isAdminActive(ComponentName componentname, int i)
            throws RemoteException
        {
            boolean flag;
            Parcel parcel;
            Parcel parcel1;
            flag = true;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_88;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            int j;
            parcel.writeInt(i);
            mRemote.transact(41, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            Exception exception;
            if (j == 0)
                flag = false;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            parcel.writeInt(0);
              goto _L1
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void lockNow()
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            mRemote.transact(29, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean packageHasActiveAdmins(String s, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int j;
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeString(s);
            parcel.writeInt(i);
            mRemote.transact(43, parcel, parcel1, 0);
            parcel1.readException();
            j = parcel1.readInt();
            boolean flag = false;
            if (j != 0)
                flag = true;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void removeActiveAdmin(ComponentName componentname, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_66;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            mRemote.transact(45, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void reportFailedPasswordAttempt(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            mRemote.transact(48, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void reportSuccessfulPasswordAttempt(int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            mRemote.transact(49, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public boolean resetPassword(String s, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            int k;
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeString(s);
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(26, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            boolean flag = false;
            if (k != 0)
                flag = true;
            parcel1.recycle();
            parcel.recycle();
            return flag;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setActiveAdmin(ComponentName componentname, boolean flag, int i)
            throws RemoteException
        {
            int j;
            Parcel parcel;
            Parcel parcel1;
            j = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
              goto _L3
_L5:
            parcel.writeInt(j);
            parcel.writeInt(i);
            mRemote.transact(40, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
            break; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
_L6:
            j = 0;
            if (true) goto _L4; else goto _L3
_L4:
            break; /* Loop/switch isn't completed */
_L3:
            if (!flag) goto _L6; else goto _L5
        }

        public void setActivePasswordState(int i, int j, int k, int l, int i1, int j1, int k1, 
                int l1, int i2)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            parcel.writeInt(k);
            parcel.writeInt(l);
            parcel.writeInt(i1);
            parcel.writeInt(j1);
            parcel.writeInt(k1);
            parcel.writeInt(l1);
            parcel.writeInt(i2);
            mRemote.transact(47, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setCameraDisabled(ComponentName componentname, boolean flag, int i)
            throws RemoteException
        {
            int j;
            Parcel parcel;
            Parcel parcel1;
            j = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
              goto _L3
_L5:
            parcel.writeInt(j);
            parcel.writeInt(i);
            mRemote.transact(36, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
_L2:
            parcel.writeInt(0);
            break; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
_L6:
            j = 0;
            if (true) goto _L4; else goto _L3
_L4:
            break; /* Loop/switch isn't completed */
_L3:
            if (!flag) goto _L6; else goto _L5
        }

        public ComponentName setGlobalProxy(ComponentName componentname, String s, String s1, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L3:
            ComponentName componentname1;
            parcel.writeString(s);
            parcel.writeString(s1);
            parcel.writeInt(i);
            mRemote.transact(31, parcel, parcel1, 0);
            parcel1.readException();
            if (parcel1.readInt() == 0)
                break MISSING_BLOCK_LABEL_135;
            componentname1 = (ComponentName)ComponentName.CREATOR.createFromParcel(parcel1);
_L4:
            parcel1.recycle();
            parcel.recycle();
            return componentname1;
_L2:
            parcel.writeInt(0);
              goto _L3
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
            componentname1 = null;
              goto _L4
        }

        public void setKeyguardDisabledFeatures(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(38, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setMaximumFailedPasswordsForWipe(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(24, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setMaximumTimeToLock(ComponentName componentname, long l, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_80;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeLong(l);
            parcel.writeInt(i);
            mRemote.transact(27, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordExpirationTimeout(ComponentName componentname, long l, int i)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_80;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeLong(l);
            parcel.writeInt(i);
            mRemote.transact(19, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordHistoryLength(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(17, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordMinimumLength(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_78;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(3, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordMinimumLetters(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(9, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordMinimumLowerCase(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(7, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordMinimumNonLetter(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(15, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordMinimumNumeric(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(11, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordMinimumSymbols(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_79;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(13, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordMinimumUpperCase(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_78;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(5, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public void setPasswordQuality(ComponentName componentname, int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null)
                break MISSING_BLOCK_LABEL_78;
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
_L1:
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(1, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            parcel.writeInt(0);
              goto _L1
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        public int setStorageEncryption(ComponentName componentname, boolean flag, int i)
            throws RemoteException
        {
            int j;
            Parcel parcel;
            Parcel parcel1;
            j = 1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            if (componentname == null) goto _L2; else goto _L1
_L1:
            parcel.writeInt(1);
            componentname.writeToParcel(parcel, 0);
              goto _L3
_L5:
            int k;
            parcel.writeInt(j);
            parcel.writeInt(i);
            mRemote.transact(33, parcel, parcel1, 0);
            parcel1.readException();
            k = parcel1.readInt();
            parcel1.recycle();
            parcel.recycle();
            return k;
_L2:
            parcel.writeInt(0);
            break; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
_L6:
            j = 0;
            if (true) goto _L4; else goto _L3
_L4:
            break; /* Loop/switch isn't completed */
_L3:
            if (!flag) goto _L6; else goto _L5
        }

        public void wipeData(int i, int j)
            throws RemoteException
        {
            Parcel parcel;
            Parcel parcel1;
            parcel = Parcel.obtain();
            parcel1 = Parcel.obtain();
            parcel.writeInterfaceToken("android.app.admin.IDevicePolicyManager");
            parcel.writeInt(i);
            parcel.writeInt(j);
            mRemote.transact(30, parcel, parcel1, 0);
            parcel1.readException();
            parcel1.recycle();
            parcel.recycle();
            return;
            Exception exception;
            exception;
            parcel1.recycle();
            parcel.recycle();
            throw exception;
        }

        Stub.Proxy(IBinder ibinder)
        {
            mRemote = ibinder;
        }
    }


    public abstract List getActiveAdmins(int i)
        throws RemoteException;

    public abstract boolean getCameraDisabled(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getCurrentFailedPasswordAttempts(int i)
        throws RemoteException;

    public abstract ComponentName getGlobalProxyAdmin(int i)
        throws RemoteException;

    public abstract int getKeyguardDisabledFeatures(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getMaximumFailedPasswordsForWipe(ComponentName componentname, int i)
        throws RemoteException;

    public abstract long getMaximumTimeToLock(ComponentName componentname, int i)
        throws RemoteException;

    public abstract long getPasswordExpiration(ComponentName componentname, int i)
        throws RemoteException;

    public abstract long getPasswordExpirationTimeout(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordHistoryLength(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordMinimumLength(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordMinimumLetters(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordMinimumLowerCase(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordMinimumNonLetter(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordMinimumNumeric(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordMinimumSymbols(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordMinimumUpperCase(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getPasswordQuality(ComponentName componentname, int i)
        throws RemoteException;

    public abstract void getRemoveWarning(ComponentName componentname, RemoteCallback remotecallback, int i)
        throws RemoteException;

    public abstract boolean getStorageEncryption(ComponentName componentname, int i)
        throws RemoteException;

    public abstract int getStorageEncryptionStatus(int i)
        throws RemoteException;

    public abstract boolean hasGrantedPolicy(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract boolean isActivePasswordSufficient(int i)
        throws RemoteException;

    public abstract boolean isAdminActive(ComponentName componentname, int i)
        throws RemoteException;

    public abstract void lockNow()
        throws RemoteException;

    public abstract boolean packageHasActiveAdmins(String s, int i)
        throws RemoteException;

    public abstract void removeActiveAdmin(ComponentName componentname, int i)
        throws RemoteException;

    public abstract void reportFailedPasswordAttempt(int i)
        throws RemoteException;

    public abstract void reportSuccessfulPasswordAttempt(int i)
        throws RemoteException;

    public abstract boolean resetPassword(String s, int i, int j)
        throws RemoteException;

    public abstract void setActiveAdmin(ComponentName componentname, boolean flag, int i)
        throws RemoteException;

    public abstract void setActivePasswordState(int i, int j, int k, int l, int i1, int j1, int k1, 
            int l1, int i2)
        throws RemoteException;

    public abstract void setCameraDisabled(ComponentName componentname, boolean flag, int i)
        throws RemoteException;

    public abstract ComponentName setGlobalProxy(ComponentName componentname, String s, String s1, int i)
        throws RemoteException;

    public abstract void setKeyguardDisabledFeatures(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setMaximumFailedPasswordsForWipe(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setMaximumTimeToLock(ComponentName componentname, long l, int i)
        throws RemoteException;

    public abstract void setPasswordExpirationTimeout(ComponentName componentname, long l, int i)
        throws RemoteException;

    public abstract void setPasswordHistoryLength(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordMinimumLength(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordMinimumLetters(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordMinimumLowerCase(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordMinimumNonLetter(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordMinimumNumeric(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordMinimumSymbols(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordMinimumUpperCase(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract void setPasswordQuality(ComponentName componentname, int i, int j)
        throws RemoteException;

    public abstract int setStorageEncryption(ComponentName componentname, boolean flag, int i)
        throws RemoteException;

    public abstract void wipeData(int i, int j)
        throws RemoteException;
}
