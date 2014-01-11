// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.NoSuchElementException;

// Referenced classes of package com.google.common.collect:
//            UnmodifiableIterator

public abstract class AbstractIterator extends UnmodifiableIterator
{
    private static final class State extends Enum
    {

        private static final State $VALUES[];
        public static final State DONE;
        public static final State FAILED;
        public static final State NOT_READY;
        public static final State READY;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(com/google/common/collect/AbstractIterator$State, s);
        }

        public static State[] values()
        {
            return (State[])$VALUES.clone();
        }

        static 
        {
            READY = new State("READY", 0);
            NOT_READY = new State("NOT_READY", 1);
            DONE = new State("DONE", 2);
            FAILED = new State("FAILED", 3);
            State astate[] = new State[4];
            astate[0] = READY;
            astate[1] = NOT_READY;
            astate[2] = DONE;
            astate[3] = FAILED;
            $VALUES = astate;
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }


    private Object next;
    private State state;

    protected AbstractIterator()
    {
        state = State.NOT_READY;
    }

    private boolean tryToComputeNext()
    {
        state = State.FAILED;
        next = computeNext();
        if (state != State.DONE)
        {
            state = State.READY;
            return true;
        } else
        {
            return false;
        }
    }

    protected abstract Object computeNext();

    protected final Object endOfData()
    {
        state = State.DONE;
        return null;
    }

    public final boolean hasNext()
    {
        boolean flag;
        if (state != State.FAILED)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag);
        static class _cls1
        {

            static final int $SwitchMap$com$google$common$collect$AbstractIterator$State[];

            static 
            {
                $SwitchMap$com$google$common$collect$AbstractIterator$State = new int[State.values().length];
                try
                {
                    $SwitchMap$com$google$common$collect$AbstractIterator$State[State.DONE.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$google$common$collect$AbstractIterator$State[State.READY.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1)
                {
                    return;
                }
            }
        }

        int i = _cls1..SwitchMap.com.google.common.collect.AbstractIterator.State[state.ordinal()];
        boolean flag1 = false;
        switch (i)
        {
        case 2: // '\002'
            return true;

        default:
            flag1 = tryToComputeNext();
            // fall through

        case 1: // '\001'
            return flag1;
        }
    }

    public final Object next()
    {
        if (!hasNext())
        {
            throw new NoSuchElementException();
        } else
        {
            state = State.NOT_READY;
            return next;
        }
    }

    public final Object peek()
    {
        if (!hasNext())
            throw new NoSuchElementException();
        else
            return next;
    }
}
