// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.app;

import android.support.v4.util.LogWriter;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;

// Referenced classes of package android.support.v4.app:
//            FragmentTransaction, Fragment, FragmentManagerImpl, FragmentActivity

final class BackStackRecord extends FragmentTransaction
    implements FragmentManager.BackStackEntry, Runnable
{
    static final class Op
    {

        int cmd;
        int enterAnim;
        int exitAnim;
        Fragment fragment;
        Op next;
        int popEnterAnim;
        int popExitAnim;
        Op prev;
        ArrayList removed;

    }


    static final int OP_ADD = 1;
    static final int OP_ATTACH = 7;
    static final int OP_DETACH = 6;
    static final int OP_HIDE = 4;
    static final int OP_NULL = 0;
    static final int OP_REMOVE = 3;
    static final int OP_REPLACE = 2;
    static final int OP_SHOW = 5;
    static final String TAG = "FragmentManager";
    boolean mAddToBackStack;
    boolean mAllowAddToBackStack;
    int mBreadCrumbShortTitleRes;
    CharSequence mBreadCrumbShortTitleText;
    int mBreadCrumbTitleRes;
    CharSequence mBreadCrumbTitleText;
    boolean mCommitted;
    int mEnterAnim;
    int mExitAnim;
    Op mHead;
    int mIndex;
    final FragmentManagerImpl mManager;
    String mName;
    int mNumOp;
    int mPopEnterAnim;
    int mPopExitAnim;
    Op mTail;
    int mTransition;
    int mTransitionStyle;

    public BackStackRecord(FragmentManagerImpl fragmentmanagerimpl)
    {
        mAllowAddToBackStack = true;
        mIndex = -1;
        mManager = fragmentmanagerimpl;
    }

    private void doAddOp(int i, Fragment fragment, String s, int j)
    {
        fragment.mFragmentManager = mManager;
        if (s != null)
        {
            if (fragment.mTag != null && !s.equals(fragment.mTag))
                throw new IllegalStateException((new StringBuilder()).append("Can't change tag of fragment ").append(fragment).append(": was ").append(fragment.mTag).append(" now ").append(s).toString());
            fragment.mTag = s;
        }
        if (i != 0)
        {
            if (fragment.mFragmentId != 0 && fragment.mFragmentId != i)
                throw new IllegalStateException((new StringBuilder()).append("Can't change container ID of fragment ").append(fragment).append(": was ").append(fragment.mFragmentId).append(" now ").append(i).toString());
            fragment.mFragmentId = i;
            fragment.mContainerId = i;
        }
        Op op = new Op();
        op.cmd = j;
        op.fragment = fragment;
        addOp(op);
    }

    public FragmentTransaction add(int i, Fragment fragment)
    {
        doAddOp(i, fragment, null, 1);
        return this;
    }

    public FragmentTransaction add(int i, Fragment fragment, String s)
    {
        doAddOp(i, fragment, s, 1);
        return this;
    }

    public FragmentTransaction add(Fragment fragment, String s)
    {
        doAddOp(0, fragment, s, 1);
        return this;
    }

    void addOp(Op op)
    {
        if (mHead == null)
        {
            mTail = op;
            mHead = op;
        } else
        {
            op.prev = mTail;
            mTail.next = op;
            mTail = op;
        }
        op.enterAnim = mEnterAnim;
        op.exitAnim = mExitAnim;
        op.popEnterAnim = mPopEnterAnim;
        op.popExitAnim = mPopExitAnim;
        mNumOp = 1 + mNumOp;
    }

    public FragmentTransaction addToBackStack(String s)
    {
        if (!mAllowAddToBackStack)
        {
            throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
        } else
        {
            mAddToBackStack = true;
            mName = s;
            return this;
        }
    }

    public FragmentTransaction attach(Fragment fragment)
    {
        Op op = new Op();
        op.cmd = 7;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    void bumpBackStackNesting(int i)
    {
        if (mAddToBackStack)
        {
            if (FragmentManagerImpl.DEBUG)
                Log.v("FragmentManager", (new StringBuilder()).append("Bump nesting in ").append(this).append(" by ").append(i).toString());
            for (Op op = mHead; op != null; op = op.next)
            {
                if (op.fragment != null)
                {
                    Fragment fragment1 = op.fragment;
                    fragment1.mBackStackNesting = i + fragment1.mBackStackNesting;
                    if (FragmentManagerImpl.DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("Bump nesting of ").append(op.fragment).append(" to ").append(op.fragment.mBackStackNesting).toString());
                }
                if (op.removed == null)
                    continue;
                for (int j = -1 + op.removed.size(); j >= 0; j--)
                {
                    Fragment fragment = (Fragment)op.removed.get(j);
                    fragment.mBackStackNesting = i + fragment.mBackStackNesting;
                    if (FragmentManagerImpl.DEBUG)
                        Log.v("FragmentManager", (new StringBuilder()).append("Bump nesting of ").append(fragment).append(" to ").append(fragment.mBackStackNesting).toString());
                }

            }

        }
    }

    public int commit()
    {
        return commitInternal(false);
    }

    public int commitAllowingStateLoss()
    {
        return commitInternal(true);
    }

    int commitInternal(boolean flag)
    {
        if (mCommitted)
            throw new IllegalStateException("commit already called");
        if (FragmentManagerImpl.DEBUG)
        {
            Log.v("FragmentManager", (new StringBuilder()).append("Commit: ").append(this).toString());
            dump("  ", null, new PrintWriter(new LogWriter("FragmentManager")), null);
        }
        mCommitted = true;
        if (mAddToBackStack)
            mIndex = mManager.allocBackStackIndex(this);
        else
            mIndex = -1;
        mManager.enqueueAction(this, flag);
        return mIndex;
    }

    public FragmentTransaction detach(Fragment fragment)
    {
        Op op = new Op();
        op.cmd = 6;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction disallowAddToBackStack()
    {
        if (mAddToBackStack)
        {
            throw new IllegalStateException("This transaction is already being added to the back stack");
        } else
        {
            mAllowAddToBackStack = false;
            return this;
        }
    }

    public void dump(String s, FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        dump(s, printwriter, true);
    }

    public void dump(String s, PrintWriter printwriter, boolean flag)
    {
        if (flag)
        {
            printwriter.print(s);
            printwriter.print("mName=");
            printwriter.print(mName);
            printwriter.print(" mIndex=");
            printwriter.print(mIndex);
            printwriter.print(" mCommitted=");
            printwriter.println(mCommitted);
            if (mTransition != 0)
            {
                printwriter.print(s);
                printwriter.print("mTransition=#");
                printwriter.print(Integer.toHexString(mTransition));
                printwriter.print(" mTransitionStyle=#");
                printwriter.println(Integer.toHexString(mTransitionStyle));
            }
            if (mEnterAnim != 0 || mExitAnim != 0)
            {
                printwriter.print(s);
                printwriter.print("mEnterAnim=#");
                printwriter.print(Integer.toHexString(mEnterAnim));
                printwriter.print(" mExitAnim=#");
                printwriter.println(Integer.toHexString(mExitAnim));
            }
            if (mPopEnterAnim != 0 || mPopExitAnim != 0)
            {
                printwriter.print(s);
                printwriter.print("mPopEnterAnim=#");
                printwriter.print(Integer.toHexString(mPopEnterAnim));
                printwriter.print(" mPopExitAnim=#");
                printwriter.println(Integer.toHexString(mPopExitAnim));
            }
            if (mBreadCrumbTitleRes != 0 || mBreadCrumbTitleText != null)
            {
                printwriter.print(s);
                printwriter.print("mBreadCrumbTitleRes=#");
                printwriter.print(Integer.toHexString(mBreadCrumbTitleRes));
                printwriter.print(" mBreadCrumbTitleText=");
                printwriter.println(mBreadCrumbTitleText);
            }
            if (mBreadCrumbShortTitleRes != 0 || mBreadCrumbShortTitleText != null)
            {
                printwriter.print(s);
                printwriter.print("mBreadCrumbShortTitleRes=#");
                printwriter.print(Integer.toHexString(mBreadCrumbShortTitleRes));
                printwriter.print(" mBreadCrumbShortTitleText=");
                printwriter.println(mBreadCrumbShortTitleText);
            }
        }
        if (mHead != null)
        {
            printwriter.print(s);
            printwriter.println("Operations:");
            String s1 = (new StringBuilder()).append(s).append("    ").toString();
            Op op = mHead;
            for (int i = 0; op != null; i++)
            {
                String s2;
                switch (op.cmd)
                {
                case 7: // '\007'
                    s2 = "ATTACH";
                    break;

                case 6: // '\006'
                    s2 = "DETACH";
                    break;

                case 5: // '\005'
                    s2 = "SHOW";
                    break;

                case 4: // '\004'
                    s2 = "HIDE";
                    break;

                case 3: // '\003'
                    s2 = "REMOVE";
                    break;

                case 2: // '\002'
                    s2 = "REPLACE";
                    break;

                case 1: // '\001'
                    s2 = "ADD";
                    break;

                case 0: // '\0'
                    s2 = "NULL";
                    break;

                default:
                    s2 = (new StringBuilder()).append("cmd=").append(op.cmd).toString();
                    break;
                }
                printwriter.print(s);
                printwriter.print("  Op #");
                printwriter.print(i);
                printwriter.print(": ");
                printwriter.print(s2);
                printwriter.print(" ");
                printwriter.println(op.fragment);
                if (flag)
                {
                    if (op.enterAnim != 0 || op.exitAnim != 0)
                    {
                        printwriter.print(s);
                        printwriter.print("enterAnim=#");
                        printwriter.print(Integer.toHexString(op.enterAnim));
                        printwriter.print(" exitAnim=#");
                        printwriter.println(Integer.toHexString(op.exitAnim));
                    }
                    if (op.popEnterAnim != 0 || op.popExitAnim != 0)
                    {
                        printwriter.print(s);
                        printwriter.print("popEnterAnim=#");
                        printwriter.print(Integer.toHexString(op.popEnterAnim));
                        printwriter.print(" popExitAnim=#");
                        printwriter.println(Integer.toHexString(op.popExitAnim));
                    }
                }
                if (op.removed != null && op.removed.size() > 0)
                {
                    for (int j = 0; j < op.removed.size(); j++)
                    {
                        printwriter.print(s1);
                        if (op.removed.size() == 1)
                        {
                            printwriter.print("Removed: ");
                        } else
                        {
                            if (j == 0)
                                printwriter.println("Removed:");
                            printwriter.print(s1);
                            printwriter.print("  #");
                            printwriter.print(j);
                            printwriter.print(": ");
                        }
                        printwriter.println(op.removed.get(j));
                    }

                }
                op = op.next;
            }

        }
    }

    public CharSequence getBreadCrumbShortTitle()
    {
        if (mBreadCrumbShortTitleRes != 0)
            return mManager.mActivity.getText(mBreadCrumbShortTitleRes);
        else
            return mBreadCrumbShortTitleText;
    }

    public int getBreadCrumbShortTitleRes()
    {
        return mBreadCrumbShortTitleRes;
    }

    public CharSequence getBreadCrumbTitle()
    {
        if (mBreadCrumbTitleRes != 0)
            return mManager.mActivity.getText(mBreadCrumbTitleRes);
        else
            return mBreadCrumbTitleText;
    }

    public int getBreadCrumbTitleRes()
    {
        return mBreadCrumbTitleRes;
    }

    public int getId()
    {
        return mIndex;
    }

    public String getName()
    {
        return mName;
    }

    public int getTransition()
    {
        return mTransition;
    }

    public int getTransitionStyle()
    {
        return mTransitionStyle;
    }

    public FragmentTransaction hide(Fragment fragment)
    {
        Op op = new Op();
        op.cmd = 4;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public boolean isAddToBackStackAllowed()
    {
        return mAllowAddToBackStack;
    }

    public boolean isEmpty()
    {
        return mNumOp == 0;
    }

    public void popFromBackStack(boolean flag)
    {
label0:
        {
            if (FragmentManagerImpl.DEBUG)
            {
                Log.v("FragmentManager", (new StringBuilder()).append("popFromBackStack: ").append(this).toString());
                dump("  ", null, new PrintWriter(new LogWriter("FragmentManager")), null);
            }
            bumpBackStackNesting(-1);
            Op op = mTail;
label1:
            do
            {
                if (op == null)
                    break label0;
                switch (op.cmd)
                {
                default:
                    break label1;

                case 7: // '\007'
                    Fragment fragment7 = op.fragment;
                    fragment7.mNextAnim = op.popEnterAnim;
                    mManager.detachFragment(fragment7, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
                    break;

                case 6: // '\006'
                    Fragment fragment6 = op.fragment;
                    fragment6.mNextAnim = op.popEnterAnim;
                    mManager.attachFragment(fragment6, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
                    break;

                case 5: // '\005'
                    Fragment fragment5 = op.fragment;
                    fragment5.mNextAnim = op.popExitAnim;
                    mManager.hideFragment(fragment5, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
                    break;

                case 4: // '\004'
                    Fragment fragment4 = op.fragment;
                    fragment4.mNextAnim = op.popEnterAnim;
                    mManager.showFragment(fragment4, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
                    break;

                case 3: // '\003'
                    Fragment fragment3 = op.fragment;
                    fragment3.mNextAnim = op.popEnterAnim;
                    mManager.addFragment(fragment3, false);
                    break;

                case 2: // '\002'
                    Fragment fragment1 = op.fragment;
                    if (fragment1 != null)
                    {
                        fragment1.mNextAnim = op.popExitAnim;
                        mManager.removeFragment(fragment1, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
                    }
                    if (op.removed == null)
                        break;
                    for (int i = 0; i < op.removed.size(); i++)
                    {
                        Fragment fragment2 = (Fragment)op.removed.get(i);
                        fragment2.mNextAnim = op.popEnterAnim;
                        mManager.addFragment(fragment2, false);
                    }

                    break;

                case 1: // '\001'
                    Fragment fragment = op.fragment;
                    fragment.mNextAnim = op.popExitAnim;
                    mManager.removeFragment(fragment, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
                    break;
                }
                op = op.prev;
            } while (true);
            throw new IllegalArgumentException((new StringBuilder()).append("Unknown cmd: ").append(op.cmd).toString());
        }
        if (flag)
            mManager.moveToState(mManager.mCurState, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle, true);
        if (mIndex >= 0)
        {
            mManager.freeBackStackIndex(mIndex);
            mIndex = -1;
        }
    }

    public FragmentTransaction remove(Fragment fragment)
    {
        Op op = new Op();
        op.cmd = 3;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction replace(int i, Fragment fragment)
    {
        return replace(i, fragment, null);
    }

    public FragmentTransaction replace(int i, Fragment fragment, String s)
    {
        if (i == 0)
        {
            throw new IllegalArgumentException("Must use non-zero containerViewId");
        } else
        {
            doAddOp(i, fragment, s, 2);
            return this;
        }
    }

    public void run()
    {
label0:
        {
            if (FragmentManagerImpl.DEBUG)
                Log.v("FragmentManager", (new StringBuilder()).append("Run: ").append(this).toString());
            if (mAddToBackStack && mIndex < 0)
                throw new IllegalStateException("addToBackStack() called after commit()");
            bumpBackStackNesting(1);
            Op op = mHead;
label1:
            do
            {
                if (op == null)
                    break label0;
                switch (op.cmd)
                {
                default:
                    break label1;

                case 7: // '\007'
                    Fragment fragment7 = op.fragment;
                    fragment7.mNextAnim = op.enterAnim;
                    mManager.attachFragment(fragment7, mTransition, mTransitionStyle);
                    break;

                case 6: // '\006'
                    Fragment fragment6 = op.fragment;
                    fragment6.mNextAnim = op.exitAnim;
                    mManager.detachFragment(fragment6, mTransition, mTransitionStyle);
                    break;

                case 5: // '\005'
                    Fragment fragment5 = op.fragment;
                    fragment5.mNextAnim = op.enterAnim;
                    mManager.showFragment(fragment5, mTransition, mTransitionStyle);
                    break;

                case 4: // '\004'
                    Fragment fragment4 = op.fragment;
                    fragment4.mNextAnim = op.exitAnim;
                    mManager.hideFragment(fragment4, mTransition, mTransitionStyle);
                    break;

                case 3: // '\003'
                    Fragment fragment3 = op.fragment;
                    fragment3.mNextAnim = op.exitAnim;
                    mManager.removeFragment(fragment3, mTransition, mTransitionStyle);
                    break;

                case 2: // '\002'
                    Fragment fragment1 = op.fragment;
                    if (mManager.mAdded != null)
                    {
                        for (int i = 0; i < mManager.mAdded.size(); i++)
                        {
                            Fragment fragment2 = (Fragment)mManager.mAdded.get(i);
                            if (FragmentManagerImpl.DEBUG)
                                Log.v("FragmentManager", (new StringBuilder()).append("OP_REPLACE: adding=").append(fragment1).append(" old=").append(fragment2).toString());
                            if (fragment1 != null && fragment2.mContainerId != fragment1.mContainerId)
                                continue;
                            if (fragment2 == fragment1)
                            {
                                fragment1 = null;
                                op.fragment = null;
                                continue;
                            }
                            if (op.removed == null)
                                op.removed = new ArrayList();
                            op.removed.add(fragment2);
                            fragment2.mNextAnim = op.exitAnim;
                            if (mAddToBackStack)
                            {
                                fragment2.mBackStackNesting = 1 + fragment2.mBackStackNesting;
                                if (FragmentManagerImpl.DEBUG)
                                    Log.v("FragmentManager", (new StringBuilder()).append("Bump nesting of ").append(fragment2).append(" to ").append(fragment2.mBackStackNesting).toString());
                            }
                            mManager.removeFragment(fragment2, mTransition, mTransitionStyle);
                        }

                    }
                    if (fragment1 != null)
                    {
                        fragment1.mNextAnim = op.enterAnim;
                        mManager.addFragment(fragment1, false);
                    }
                    break;

                case 1: // '\001'
                    Fragment fragment = op.fragment;
                    fragment.mNextAnim = op.enterAnim;
                    mManager.addFragment(fragment, false);
                    break;
                }
                op = op.next;
            } while (true);
            throw new IllegalArgumentException((new StringBuilder()).append("Unknown cmd: ").append(op.cmd).toString());
        }
        mManager.moveToState(mManager.mCurState, mTransition, mTransitionStyle, true);
        if (mAddToBackStack)
            mManager.addBackStackState(this);
    }

    public FragmentTransaction setBreadCrumbShortTitle(int i)
    {
        mBreadCrumbShortTitleRes = i;
        mBreadCrumbShortTitleText = null;
        return this;
    }

    public FragmentTransaction setBreadCrumbShortTitle(CharSequence charsequence)
    {
        mBreadCrumbShortTitleRes = 0;
        mBreadCrumbShortTitleText = charsequence;
        return this;
    }

    public FragmentTransaction setBreadCrumbTitle(int i)
    {
        mBreadCrumbTitleRes = i;
        mBreadCrumbTitleText = null;
        return this;
    }

    public FragmentTransaction setBreadCrumbTitle(CharSequence charsequence)
    {
        mBreadCrumbTitleRes = 0;
        mBreadCrumbTitleText = charsequence;
        return this;
    }

    public FragmentTransaction setCustomAnimations(int i, int j)
    {
        return setCustomAnimations(i, j, 0, 0);
    }

    public FragmentTransaction setCustomAnimations(int i, int j, int k, int l)
    {
        mEnterAnim = i;
        mExitAnim = j;
        mPopEnterAnim = k;
        mPopExitAnim = l;
        return this;
    }

    public FragmentTransaction setTransition(int i)
    {
        mTransition = i;
        return this;
    }

    public FragmentTransaction setTransitionStyle(int i)
    {
        mTransitionStyle = i;
        return this;
    }

    public FragmentTransaction show(Fragment fragment)
    {
        Op op = new Op();
        op.cmd = 5;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder(128);
        stringbuilder.append("BackStackEntry{");
        stringbuilder.append(Integer.toHexString(System.identityHashCode(this)));
        if (mIndex >= 0)
        {
            stringbuilder.append(" #");
            stringbuilder.append(mIndex);
        }
        if (mName != null)
        {
            stringbuilder.append(" ");
            stringbuilder.append(mName);
        }
        stringbuilder.append("}");
        return stringbuilder.toString();
    }
}
