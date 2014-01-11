// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import com.google.common.base.*;
import java.io.*;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.Checksum;

// Referenced classes of package com.google.common.io:
//            ByteStreams, CharStreams, Closeables, InputSupplier, 
//            OutputSupplier, ByteProcessor, LineProcessor

public final class Files
{

    private static final int TEMP_DIR_ATTEMPTS = 10000;

    private Files()
    {
    }

    public static void append(CharSequence charsequence, File file, Charset charset)
        throws IOException
    {
        write(charsequence, file, charset, true);
    }

    public static void copy(InputSupplier inputsupplier, File file)
        throws IOException
    {
        ByteStreams.copy(inputsupplier, newOutputStreamSupplier(file));
    }

    public static void copy(InputSupplier inputsupplier, File file, Charset charset)
        throws IOException
    {
        CharStreams.copy(inputsupplier, newWriterSupplier(file, charset));
    }

    public static void copy(File file, OutputSupplier outputsupplier)
        throws IOException
    {
        ByteStreams.copy(newInputStreamSupplier(file), outputsupplier);
    }

    public static void copy(File file, File file1)
        throws IOException
    {
        boolean flag;
        if (!file.equals(file1))
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "Source %s and destination %s must be different", new Object[] {
            file, file1
        });
        copy(newInputStreamSupplier(file), file1);
    }

    public static void copy(File file, OutputStream outputstream)
        throws IOException
    {
        ByteStreams.copy(newInputStreamSupplier(file), outputstream);
    }

    public static void copy(File file, Charset charset, OutputSupplier outputsupplier)
        throws IOException
    {
        CharStreams.copy(newReaderSupplier(file, charset), outputsupplier);
    }

    public static void copy(File file, Charset charset, Appendable appendable)
        throws IOException
    {
        CharStreams.copy(newReaderSupplier(file, charset), appendable);
    }

    public static void createParentDirs(File file)
        throws IOException
    {
        File file1 = file.getCanonicalFile().getParentFile();
        if (file1 != null)
        {
            file1.mkdirs();
            if (!file1.isDirectory())
                throw new IOException((new StringBuilder()).append("Unable to create parent directories of ").append(file).toString());
        }
    }

    public static File createTempDir()
    {
        File file = new File(System.getProperty("java.io.tmpdir"));
        String s = (new StringBuilder()).append(System.currentTimeMillis()).append("-").toString();
        for (int i = 0; i < 10000; i++)
        {
            File file1 = new File(file, (new StringBuilder()).append(s).append(i).toString());
            if (file1.mkdir())
                return file1;
        }

        throw new IllegalStateException((new StringBuilder()).append("Failed to create directory within 10000 attempts (tried ").append(s).append("0 to ").append(s).append(9999).append(')').toString());
    }

    public static boolean equal(File file, File file1)
        throws IOException
    {
        if (file != file1 && !file.equals(file1))
        {
            long l = file.length();
            long l1 = file1.length();
            if (l != 0L && l1 != 0L && l != l1)
                return false;
            else
                return ByteStreams.equal(newInputStreamSupplier(file), newInputStreamSupplier(file1));
        } else
        {
            return true;
        }
    }

    public static long getChecksum(File file, Checksum checksum)
        throws IOException
    {
        return ByteStreams.getChecksum(newInputStreamSupplier(file), checksum);
    }

    public static byte[] getDigest(File file, MessageDigest messagedigest)
        throws IOException
    {
        return ByteStreams.getDigest(newInputStreamSupplier(file), messagedigest);
    }

    public static String getFileExtension(String s)
    {
        Preconditions.checkNotNull(s);
        int i = s.lastIndexOf('.');
        if (i == -1)
            return "";
        else
            return s.substring(i + 1);
    }

    public static MappedByteBuffer map(File file)
        throws IOException
    {
        return map(file, java.nio.channels.FileChannel.MapMode.READ_ONLY);
    }

    public static MappedByteBuffer map(File file, java.nio.channels.FileChannel.MapMode mapmode)
        throws IOException
    {
        if (!file.exists())
            throw new FileNotFoundException(file.toString());
        else
            return map(file, mapmode, file.length());
    }

    public static MappedByteBuffer map(File file, java.nio.channels.FileChannel.MapMode mapmode, long l)
        throws FileNotFoundException, IOException
    {
        RandomAccessFile randomaccessfile;
        String s;
        MappedByteBuffer mappedbytebuffer;
        if (mapmode == java.nio.channels.FileChannel.MapMode.READ_ONLY)
            s = "r";
        else
            s = "rw";
        randomaccessfile = new RandomAccessFile(file, s);
        mappedbytebuffer = map(randomaccessfile, mapmode, l);
        Closeables.close(randomaccessfile, false);
        return mappedbytebuffer;
        Exception exception;
        exception;
        Closeables.close(randomaccessfile, true);
        throw exception;
    }

    private static MappedByteBuffer map(RandomAccessFile randomaccessfile, java.nio.channels.FileChannel.MapMode mapmode, long l)
        throws IOException
    {
        FileChannel filechannel = randomaccessfile.getChannel();
        MappedByteBuffer mappedbytebuffer = filechannel.map(mapmode, 0L, l);
        Closeables.close(filechannel, false);
        return mappedbytebuffer;
        Exception exception;
        exception;
        Closeables.close(filechannel, true);
        throw exception;
    }

    public static void move(File file, File file1)
        throws IOException
    {
        Preconditions.checkNotNull(file1);
        boolean flag;
        if (!file.equals(file1))
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "Source %s and destination %s must be different", new Object[] {
            file, file1
        });
        if (!file.renameTo(file1))
        {
            copy(file, file1);
            if (!file.delete())
                if (!file1.delete())
                    throw new IOException((new StringBuilder()).append("Unable to delete ").append(file1).toString());
                else
                    throw new IOException((new StringBuilder()).append("Unable to delete ").append(file).toString());
        }
    }

    public static InputSupplier newInputStreamSupplier(File file)
    {
        Preconditions.checkNotNull(file);
        return new InputSupplier(file) {

            final File val$file;

            public FileInputStream getInput()
                throws IOException
            {
                return new FileInputStream(file);
            }

            public volatile Object getInput()
                throws IOException
            {
                return getInput();
            }

            
            {
                file = file1;
                super();
            }
        }
;
    }

    public static OutputSupplier newOutputStreamSupplier(File file)
    {
        return newOutputStreamSupplier(file, false);
    }

    public static OutputSupplier newOutputStreamSupplier(File file, boolean flag)
    {
        Preconditions.checkNotNull(file);
        return new OutputSupplier(file, flag) {

            final boolean val$append;
            final File val$file;

            public FileOutputStream getOutput()
                throws IOException
            {
                return new FileOutputStream(file, append);
            }

            public volatile Object getOutput()
                throws IOException
            {
                return getOutput();
            }

            
            {
                file = file1;
                append = flag;
                super();
            }
        }
;
    }

    public static BufferedReader newReader(File file, Charset charset)
        throws FileNotFoundException
    {
        return new BufferedReader(new InputStreamReader(new FileInputStream(file), charset));
    }

    public static InputSupplier newReaderSupplier(File file, Charset charset)
    {
        return CharStreams.newReaderSupplier(newInputStreamSupplier(file), charset);
    }

    public static BufferedWriter newWriter(File file, Charset charset)
        throws FileNotFoundException
    {
        return new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), charset));
    }

    public static OutputSupplier newWriterSupplier(File file, Charset charset)
    {
        return newWriterSupplier(file, charset, false);
    }

    public static OutputSupplier newWriterSupplier(File file, Charset charset, boolean flag)
    {
        return CharStreams.newWriterSupplier(newOutputStreamSupplier(file, flag), charset);
    }

    public static Object readBytes(File file, ByteProcessor byteprocessor)
        throws IOException
    {
        return ByteStreams.readBytes(newInputStreamSupplier(file), byteprocessor);
    }

    public static String readFirstLine(File file, Charset charset)
        throws IOException
    {
        return CharStreams.readFirstLine(newReaderSupplier(file, charset));
    }

    public static Object readLines(File file, Charset charset, LineProcessor lineprocessor)
        throws IOException
    {
        return CharStreams.readLines(newReaderSupplier(file, charset), lineprocessor);
    }

    public static List readLines(File file, Charset charset)
        throws IOException
    {
        return CharStreams.readLines(newReaderSupplier(file, charset));
    }

    public static String simplifyPath(String s)
    {
        String s1;
        if (s.length() == 0)
        {
            s1 = ".";
        } else
        {
            Iterable iterable = Splitter.on('/').omitEmptyStrings().split(s);
            ArrayList arraylist = new ArrayList();
            Iterator iterator = iterable.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                String s2 = (String)iterator.next();
                if (!s2.equals("."))
                    if (s2.equals(".."))
                    {
                        if (arraylist.size() > 0 && !((String)arraylist.get(-1 + arraylist.size())).equals(".."))
                            arraylist.remove(-1 + arraylist.size());
                        else
                            arraylist.add("..");
                    } else
                    {
                        arraylist.add(s2);
                    }
            } while (true);
            s1 = Joiner.on('/').join(arraylist);
            if (s.charAt(0) == '/')
                s1 = (new StringBuilder()).append("/").append(s1).toString();
            for (; s1.startsWith("/../"); s1 = s1.substring(3));
            if (s1.equals("/.."))
                return "/";
            if ("".equals(s1))
                return ".";
        }
        return s1;
    }

    public static byte[] toByteArray(File file)
        throws IOException
    {
        byte abyte0[];
        FileInputStream fileinputstream;
        boolean flag;
        if (file.length() <= 0x7fffffffL)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        if (file.length() == 0L)
            return ByteStreams.toByteArray(newInputStreamSupplier(file));
        abyte0 = new byte[(int)file.length()];
        fileinputstream = new FileInputStream(file);
        ByteStreams.readFully(fileinputstream, abyte0);
        Closeables.close(fileinputstream, false);
        return abyte0;
        Exception exception;
        exception;
        Closeables.close(fileinputstream, true);
        throw exception;
    }

    public static String toString(File file, Charset charset)
        throws IOException
    {
        return new String(toByteArray(file), charset.name());
    }

    public static void touch(File file)
        throws IOException
    {
        if (!file.createNewFile() && !file.setLastModified(System.currentTimeMillis()))
            throw new IOException((new StringBuilder()).append("Unable to update modification time of ").append(file).toString());
        else
            return;
    }

    public static void write(CharSequence charsequence, File file, Charset charset)
        throws IOException
    {
        write(charsequence, file, charset, false);
    }

    private static void write(CharSequence charsequence, File file, Charset charset, boolean flag)
        throws IOException
    {
        CharStreams.write(charsequence, newWriterSupplier(file, charset, flag));
    }

    public static void write(byte abyte0[], File file)
        throws IOException
    {
        ByteStreams.write(abyte0, newOutputStreamSupplier(file));
    }
}
