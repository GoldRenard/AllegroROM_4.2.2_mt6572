// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package javax.annotation.meta;


public final class When extends Enum
{

    private static final When $VALUES[];
    public static final When ALWAYS;
    public static final When MAYBE;
    public static final When NEVER;
    public static final When UNKNOWN;

    private When(String s, int i)
    {
        super(s, i);
    }

    public static When valueOf(String s)
    {
        return (When)Enum.valueOf(javax/annotation/meta/When, s);
    }

    public static When[] values()
    {
        return (When[])$VALUES.clone();
    }

    static 
    {
        ALWAYS = new When("ALWAYS", 0);
        UNKNOWN = new When("UNKNOWN", 1);
        MAYBE = new When("MAYBE", 2);
        NEVER = new When("NEVER", 3);
        When awhen[] = new When[4];
        awhen[0] = ALWAYS;
        awhen[1] = UNKNOWN;
        awhen[2] = MAYBE;
        awhen[3] = NEVER;
        $VALUES = awhen;
    }
}
