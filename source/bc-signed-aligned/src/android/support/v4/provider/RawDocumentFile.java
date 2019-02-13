package android.support.v4.provider;

import android.net.Uri;
import android.util.Log;
import android.webkit.MimeTypeMap;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

class RawDocumentFile
  extends DocumentFile
{
  private File mFile;
  
  RawDocumentFile(DocumentFile paramDocumentFile, File paramFile)
  {
    super(paramDocumentFile);
    this.mFile = paramFile;
  }
  
  private static boolean deleteContents(File paramFile)
  {
    File[] arrayOfFile = paramFile.listFiles();
    boolean bool1 = true;
    boolean bool2 = true;
    if (arrayOfFile != null)
    {
      int i = arrayOfFile.length;
      for (int j = 0;; j++)
      {
        bool1 = bool2;
        if (j >= i) {
          break;
        }
        paramFile = arrayOfFile[j];
        bool1 = bool2;
        if (paramFile.isDirectory()) {
          bool1 = bool2 & deleteContents(paramFile);
        }
        bool2 = bool1;
        if (!paramFile.delete())
        {
          Log.w("DocumentFile", "Failed to delete " + paramFile);
          bool2 = false;
        }
      }
    }
    return bool1;
  }
  
  private static String getTypeForName(String paramString)
  {
    int i = paramString.lastIndexOf('.');
    if (i >= 0)
    {
      paramString = paramString.substring(i + 1).toLowerCase();
      paramString = MimeTypeMap.getSingleton().getMimeTypeFromExtension(paramString);
      if (paramString == null) {}
    }
    for (;;)
    {
      return paramString;
      paramString = "application/octet-stream";
    }
  }
  
  public boolean canRead()
  {
    return this.mFile.canRead();
  }
  
  public boolean canWrite()
  {
    return this.mFile.canWrite();
  }
  
  public DocumentFile createDirectory(String paramString)
  {
    paramString = new File(this.mFile, paramString);
    if ((paramString.isDirectory()) || (paramString.mkdir())) {}
    for (paramString = new RawDocumentFile(this, paramString);; paramString = null) {
      return paramString;
    }
  }
  
  public DocumentFile createFile(String paramString1, String paramString2)
  {
    String str = MimeTypeMap.getSingleton().getExtensionFromMimeType(paramString1);
    paramString1 = paramString2;
    if (str != null) {
      paramString1 = paramString2 + "." + str;
    }
    paramString2 = new File(this.mFile, paramString1);
    try
    {
      paramString2.createNewFile();
      paramString1 = new android/support/v4/provider/RawDocumentFile;
      paramString1.<init>(this, paramString2);
      return paramString1;
    }
    catch (IOException paramString1)
    {
      for (;;)
      {
        Log.w("DocumentFile", "Failed to createFile: " + paramString1);
        paramString1 = null;
      }
    }
  }
  
  public boolean delete()
  {
    deleteContents(this.mFile);
    return this.mFile.delete();
  }
  
  public boolean exists()
  {
    return this.mFile.exists();
  }
  
  public String getName()
  {
    return this.mFile.getName();
  }
  
  public String getType()
  {
    if (this.mFile.isDirectory()) {}
    for (String str = null;; str = getTypeForName(this.mFile.getName())) {
      return str;
    }
  }
  
  public Uri getUri()
  {
    return Uri.fromFile(this.mFile);
  }
  
  public boolean isDirectory()
  {
    return this.mFile.isDirectory();
  }
  
  public boolean isFile()
  {
    return this.mFile.isFile();
  }
  
  public long lastModified()
  {
    return this.mFile.lastModified();
  }
  
  public long length()
  {
    return this.mFile.length();
  }
  
  public DocumentFile[] listFiles()
  {
    ArrayList localArrayList = new ArrayList();
    File[] arrayOfFile = this.mFile.listFiles();
    if (arrayOfFile != null)
    {
      int i = arrayOfFile.length;
      for (int j = 0; j < i; j++) {
        localArrayList.add(new RawDocumentFile(this, arrayOfFile[j]));
      }
    }
    return (DocumentFile[])localArrayList.toArray(new DocumentFile[localArrayList.size()]);
  }
  
  public boolean renameTo(String paramString)
  {
    paramString = new File(this.mFile.getParentFile(), paramString);
    if (this.mFile.renameTo(paramString)) {
      this.mFile = paramString;
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/provider/RawDocumentFile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */