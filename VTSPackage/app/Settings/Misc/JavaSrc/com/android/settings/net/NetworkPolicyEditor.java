// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.net;

import android.net.*;
import android.os.AsyncTask;
import android.text.format.Time;
import com.android.internal.util.Objects;
import com.android.internal.util.Preconditions;
import com.google.android.collect.Lists;
import com.google.android.collect.Sets;
import java.util.*;

public class NetworkPolicyEditor
{

    public static final boolean ENABLE_SPLIT_POLICIES;
    private ArrayList mPolicies;
    private NetworkPolicyManager mPolicyManager;

    public NetworkPolicyEditor(NetworkPolicyManager networkpolicymanager)
    {
        mPolicies = Lists.newArrayList();
        mPolicyManager = (NetworkPolicyManager)Preconditions.checkNotNull(networkpolicymanager);
    }

    private static NetworkPolicy buildDefaultPolicy(NetworkTemplate networktemplate)
    {
        int i;
        String s;
        boolean flag;
        if (networktemplate.getMatchRule() == 4)
        {
            i = -1;
            s = "UTC";
            flag = false;
        } else
        {
            Time time = new Time();
            time.setToNow();
            i = time.monthDay;
            s = time.timezone;
            flag = true;
        }
        return new NetworkPolicy(networktemplate, i, s, -1L, -1L, -1L, -1L, flag, true);
    }

    private void cleanPolicyActive()
    {
        for (Iterator iterator = mPolicies.iterator(); iterator.hasNext();)
            ((NetworkPolicy)iterator.next()).active = false;

    }

    private boolean forceMobilePolicyCombined()
    {
        HashSet hashset = Sets.newHashSet();
        for (Iterator iterator = mPolicies.iterator(); iterator.hasNext(); hashset.add(((NetworkPolicy)iterator.next()).template.getSubscriberId()));
        boolean flag = false;
        for (Iterator iterator1 = hashset.iterator(); iterator1.hasNext();)
            flag |= setMobilePolicySplitInternal((String)iterator1.next(), false);

        return flag;
    }

    private boolean setMobilePolicySplitInternal(String s, boolean flag)
    {
        boolean flag1 = isMobilePolicySplit(s);
        NetworkTemplate networktemplate = NetworkTemplate.buildTemplateMobile3gLower(s);
        NetworkTemplate networktemplate1 = NetworkTemplate.buildTemplateMobile4g(s);
        NetworkTemplate networktemplate2 = NetworkTemplate.buildTemplateMobileAll(s);
        if (flag == flag1)
            return false;
        if (flag1 && !flag)
        {
            NetworkPolicy networkpolicy1 = getPolicy(networktemplate);
            NetworkPolicy networkpolicy2 = getPolicy(networktemplate1);
            NetworkPolicy networkpolicy3;
            if (networkpolicy1.compareTo(networkpolicy2) < 0)
                networkpolicy3 = networkpolicy1;
            else
                networkpolicy3 = networkpolicy2;
            mPolicies.remove(networkpolicy1);
            mPolicies.remove(networkpolicy2);
            mPolicies.add(new NetworkPolicy(networktemplate2, networkpolicy3.cycleDay, networkpolicy3.cycleTimezone, networkpolicy3.warningBytes, networkpolicy3.limitBytes, -1L, -1L, networkpolicy3.metered, networkpolicy3.inferred));
            return true;
        }
        if (!flag1 && flag)
        {
            NetworkPolicy networkpolicy = getPolicy(networktemplate2);
            mPolicies.remove(networkpolicy);
            mPolicies.add(new NetworkPolicy(networktemplate, networkpolicy.cycleDay, networkpolicy.cycleTimezone, networkpolicy.warningBytes, networkpolicy.limitBytes, -1L, -1L, networkpolicy.metered, networkpolicy.inferred));
            mPolicies.add(new NetworkPolicy(networktemplate1, networkpolicy.cycleDay, networkpolicy.cycleTimezone, networkpolicy.warningBytes, networkpolicy.limitBytes, -1L, -1L, networkpolicy.metered, networkpolicy.inferred));
            return true;
        } else
        {
            return false;
        }
    }

    public NetworkPolicy getOrCreatePolicy(NetworkTemplate networktemplate)
    {
        NetworkPolicy networkpolicy = getPolicy(networktemplate);
        if (networkpolicy == null)
        {
            networkpolicy = buildDefaultPolicy(networktemplate);
            mPolicies.add(networkpolicy);
        }
        return networkpolicy;
    }

    public NetworkPolicy getPolicy(NetworkTemplate networktemplate)
    {
        for (Iterator iterator = mPolicies.iterator(); iterator.hasNext();)
        {
            NetworkPolicy networkpolicy = (NetworkPolicy)iterator.next();
            if (networkpolicy.template.equals(networktemplate))
                return networkpolicy;
        }

        return null;
    }

    public int getPolicyCycleDay(NetworkTemplate networktemplate)
    {
        return getPolicy(networktemplate).cycleDay;
    }

    public long getPolicyLimitBytes(NetworkTemplate networktemplate)
    {
        return getPolicy(networktemplate).limitBytes;
    }

    public boolean getPolicyMetered(NetworkTemplate networktemplate)
    {
        NetworkPolicy networkpolicy = getPolicy(networktemplate);
        if (networkpolicy != null)
            return networkpolicy.metered;
        else
            return false;
    }

    public long getPolicyWarningBytes(NetworkTemplate networktemplate)
    {
        return getPolicy(networktemplate).warningBytes;
    }

    public boolean hasLimitedPolicy(NetworkTemplate networktemplate)
    {
        NetworkPolicy networkpolicy = getPolicy(networktemplate);
        return networkpolicy != null && networkpolicy.limitBytes != -1L && networkpolicy.active;
    }

    public boolean isMobilePolicySplit(String s)
    {
        boolean flag = false;
        boolean flag1 = false;
label0:
        do
        {
            for (Iterator iterator = mPolicies.iterator(); iterator.hasNext();)
            {
                NetworkTemplate networktemplate = ((NetworkPolicy)iterator.next()).template;
                if (Objects.equal(s, networktemplate.getSubscriberId()))
                {
                    switch (networktemplate.getMatchRule())
                    {
                    case 3: // '\003'
                        flag1 = true;
                        break;

                    case 2: // '\002'
                        flag = true;
                        break;
                    }
                    continue label0;
                }
            }

            return flag && flag1;
        } while (true);
    }

    public void read()
    {
        NetworkPolicy anetworkpolicy[] = mPolicyManager.getNetworkPolicies();
        boolean flag = false;
        mPolicies.clear();
        int i = anetworkpolicy.length;
        for (int j = 0; j < i; j++)
        {
            NetworkPolicy networkpolicy = anetworkpolicy[j];
            if (networkpolicy.limitBytes < -1L)
            {
                networkpolicy.limitBytes = -1L;
                flag = true;
            }
            if (networkpolicy.warningBytes < -1L)
            {
                networkpolicy.warningBytes = -1L;
                flag = true;
            }
            mPolicies.add(networkpolicy);
        }

        if (flag | forceMobilePolicyCombined())
            writeAsync();
    }

    public void setMobilePolicySplit(String s, boolean flag)
    {
        if (setMobilePolicySplitInternal(s, flag))
            writeAsync();
    }

    public void setPolicyActive(NetworkPolicy networkpolicy)
    {
        cleanPolicyActive();
        networkpolicy.active = true;
    }

    public void setPolicyCycleDay(NetworkTemplate networktemplate, int i, String s)
    {
        NetworkPolicy networkpolicy = getOrCreatePolicy(networktemplate);
        cleanPolicyActive();
        networkpolicy.cycleDay = i;
        networkpolicy.cycleTimezone = s;
        networkpolicy.inferred = false;
        networkpolicy.active = true;
        networkpolicy.clearSnooze();
        writeAsync();
    }

    public void setPolicyLimitBytes(NetworkTemplate networktemplate, long l)
    {
        NetworkPolicy networkpolicy = getOrCreatePolicy(networktemplate);
        cleanPolicyActive();
        networkpolicy.limitBytes = l;
        networkpolicy.inferred = false;
        networkpolicy.clearSnooze();
        networkpolicy.active = true;
        writeAsync();
    }

    public void setPolicyMetered(NetworkTemplate networktemplate, boolean flag)
    {
        NetworkPolicy networkpolicy = getPolicy(networktemplate);
        boolean flag1;
        if (flag)
        {
            if (networkpolicy == null)
            {
                NetworkPolicy networkpolicy1 = buildDefaultPolicy(networktemplate);
                networkpolicy1.metered = true;
                networkpolicy1.inferred = false;
                mPolicies.add(networkpolicy1);
                flag1 = true;
            } else
            {
                boolean flag3 = networkpolicy.metered;
                flag1 = false;
                if (!flag3)
                {
                    networkpolicy.metered = true;
                    networkpolicy.inferred = false;
                    flag1 = true;
                }
            }
        } else
        {
            flag1 = false;
            if (networkpolicy != null)
            {
                boolean flag2 = networkpolicy.metered;
                flag1 = false;
                if (flag2)
                {
                    networkpolicy.metered = false;
                    networkpolicy.inferred = false;
                    flag1 = true;
                }
            }
        }
        if (flag1)
            writeAsync();
    }

    public void setPolicyWarningBytes(NetworkTemplate networktemplate, long l)
    {
        NetworkPolicy networkpolicy = getOrCreatePolicy(networktemplate);
        cleanPolicyActive();
        networkpolicy.warningBytes = l;
        networkpolicy.inferred = false;
        networkpolicy.clearSnooze();
        networkpolicy.active = true;
        writeAsync();
    }

    public void write(NetworkPolicy anetworkpolicy[])
    {
        mPolicyManager.setNetworkPolicies(anetworkpolicy);
    }

    public void writeAsync()
    {
        (new AsyncTask() {

            final NetworkPolicyEditor this$0;
            final NetworkPolicy val$policies[];

            protected volatile Object doInBackground(Object aobj[])
            {
                return doInBackground((Void[])aobj);
            }

            protected transient Void doInBackground(Void avoid[])
            {
                write(policies);
                return null;
            }

            
            {
                this$0 = NetworkPolicyEditor.this;
                policies = anetworkpolicy;
                super();
            }
        }
).execute(new Void[0]);
    }
}
