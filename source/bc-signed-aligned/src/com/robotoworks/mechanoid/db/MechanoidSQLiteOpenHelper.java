package com.robotoworks.mechanoid.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build.VERSION;

public abstract class MechanoidSQLiteOpenHelper
  extends SQLiteOpenHelper
{
  public MechanoidSQLiteOpenHelper(Context paramContext, String paramString, SQLiteDatabase.CursorFactory paramCursorFactory, int paramInt)
  {
    super(paramContext, paramString, paramCursorFactory, paramInt);
  }
  
  protected void applyMigrations(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    while (paramInt1 < paramInt2)
    {
      SQLiteMigration localSQLiteMigration = createMigration(paramInt1);
      localSQLiteMigration.onBeforeUp(paramSQLiteDatabase);
      localSQLiteMigration.up(paramSQLiteDatabase);
      localSQLiteMigration.onAfterUp(paramSQLiteDatabase);
      paramInt1++;
    }
  }
  
  protected abstract SQLiteMigration createMigration(int paramInt);
  
  public void onConfigure(SQLiteDatabase paramSQLiteDatabase)
  {
    if ((paramSQLiteDatabase.isReadOnly()) || (!shouldEnableForeignKeyConstraints())) {}
    for (;;)
    {
      return;
      if (Build.VERSION.SDK_INT >= 16) {
        paramSQLiteDatabase.setForeignKeyConstraintsEnabled(true);
      } else if (Build.VERSION.SDK_INT >= 8) {
        paramSQLiteDatabase.execSQL("PRAGMA foreign_keys=ON;");
      }
    }
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    applyMigrations(paramSQLiteDatabase, paramInt1, paramInt2);
  }
  
  protected boolean shouldEnableForeignKeyConstraints()
  {
    return false;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */