// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;


// Referenced classes of package com.google.common.util.concurrent:
//            ListenableFuture

public interface Service
{
    public static final class State extends Enum
    {

        private static final State $VALUES[];
        public static final State FAILED;
        public static final State NEW;
        public static final State RUNNING;
        public static final State STARTING;
        public static final State STOPPING;
        public static final State TERMINATED;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(com/google/common/util/concurrent/Service$State, s);
        }

        public static State[] values()
        {
            return (State[])$VALUES.clone();
        }

        static 
        {
            NEW = new State("NEW", 0);
            STARTING = new State("STARTING", 1);
            RUNNING = new State("RUNNING", 2);
            STOPPING = new State("STOPPING", 3);
            TERMINATED = new State("TERMINATED", 4);
            FAILED = new State("FAILED", 5);
            State astate[] = new State[6];
            astate[0] = NEW;
            astate[1] = STARTING;
            astate[2] = RUNNING;
            astate[3] = STOPPING;
            astate[4] = TERMINATED;
            astate[5] = FAILED;
            $VALUES = astate;
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }


    public abstract boolean isRunning();

    public abstract ListenableFuture start();

    public abstract State startAndWait();

    public abstract State state();

    public abstract ListenableFuture stop();

    public abstract State stopAndWait();
}
