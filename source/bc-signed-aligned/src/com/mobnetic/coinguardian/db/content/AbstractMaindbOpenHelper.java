package com.mobnetic.coinguardian.db.content;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV1;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV10;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV2;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV3;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV4;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV5;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV6;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV7;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV8;
import com.mobnetic.coinguardian.db.content.migrations.DefaultMaindbMigrationV9;
import com.robotoworks.mechanoid.db.MechanoidSQLiteOpenHelper;
import com.robotoworks.mechanoid.db.SQLiteMigration;

public abstract class AbstractMaindbOpenHelper
  extends MechanoidSQLiteOpenHelper
{
  private static final String DATABASE_NAME = "maindb.db";
  public static final int VERSION = 10;
  
  public AbstractMaindbOpenHelper(Context paramContext)
  {
    super(paramContext, "maindb.db", null, 10);
  }
  
  public AbstractMaindbOpenHelper(Context paramContext, String paramString)
  {
    super(paramContext, paramString, null, 10);
  }
  
  protected SQLiteMigration createMaindbMigrationV1()
  {
    return new DefaultMaindbMigrationV1();
  }
  
  protected SQLiteMigration createMaindbMigrationV10()
  {
    return new DefaultMaindbMigrationV10();
  }
  
  protected SQLiteMigration createMaindbMigrationV2()
  {
    return new DefaultMaindbMigrationV2();
  }
  
  protected SQLiteMigration createMaindbMigrationV3()
  {
    return new DefaultMaindbMigrationV3();
  }
  
  protected SQLiteMigration createMaindbMigrationV4()
  {
    return new DefaultMaindbMigrationV4();
  }
  
  protected SQLiteMigration createMaindbMigrationV5()
  {
    return new DefaultMaindbMigrationV5();
  }
  
  protected SQLiteMigration createMaindbMigrationV6()
  {
    return new DefaultMaindbMigrationV6();
  }
  
  protected SQLiteMigration createMaindbMigrationV7()
  {
    return new DefaultMaindbMigrationV7();
  }
  
  protected SQLiteMigration createMaindbMigrationV8()
  {
    return new DefaultMaindbMigrationV8();
  }
  
  protected SQLiteMigration createMaindbMigrationV9()
  {
    return new DefaultMaindbMigrationV9();
  }
  
  protected SQLiteMigration createMigration(int paramInt)
  {
    SQLiteMigration localSQLiteMigration;
    switch (paramInt)
    {
    default: 
      throw new IllegalStateException("No migration for version " + paramInt);
    case 0: 
      localSQLiteMigration = createMaindbMigrationV1();
    }
    for (;;)
    {
      return localSQLiteMigration;
      localSQLiteMigration = createMaindbMigrationV2();
      continue;
      localSQLiteMigration = createMaindbMigrationV3();
      continue;
      localSQLiteMigration = createMaindbMigrationV4();
      continue;
      localSQLiteMigration = createMaindbMigrationV5();
      continue;
      localSQLiteMigration = createMaindbMigrationV6();
      continue;
      localSQLiteMigration = createMaindbMigrationV7();
      continue;
      localSQLiteMigration = createMaindbMigrationV8();
      continue;
      localSQLiteMigration = createMaindbMigrationV9();
      continue;
      localSQLiteMigration = createMaindbMigrationV10();
    }
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    applyMigrations(paramSQLiteDatabase, 0, 10);
  }
  
  public static abstract interface Sources
  {
    public static final String ALARM = "alarm";
    public static final String CHECKER = "checker";
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */