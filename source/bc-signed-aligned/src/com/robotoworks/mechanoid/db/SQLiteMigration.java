package com.robotoworks.mechanoid.db;

import android.database.sqlite.SQLiteDatabase;

public abstract class SQLiteMigration
{
  public abstract void onAfterUp(SQLiteDatabase paramSQLiteDatabase);
  
  public abstract void onBeforeUp(SQLiteDatabase paramSQLiteDatabase);
  
  public abstract void up(SQLiteDatabase paramSQLiteDatabase);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/SQLiteMigration.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */