// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            BstPath, BstSide, BstNode

interface BstPathFactory
{

    public abstract BstPath extension(BstPath bstpath, BstSide bstside);

    public abstract BstPath initialPath(BstNode bstnode);
}
