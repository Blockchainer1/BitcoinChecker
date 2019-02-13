package com.mobnetic.coinguardian.db.content.migrations;

import android.database.sqlite.SQLiteDatabase;
import com.robotoworks.mechanoid.db.SQLiteMigration;

public class DefaultMaindbMigrationV8
  extends SQLiteMigration
{
  public void onAfterUp(SQLiteDatabase paramSQLiteDatabase) {}
  
  public void onBeforeUp(SQLiteDatabase paramSQLiteDatabase) {}
  
  public void up(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("alter table checker add column currencyPairId text ");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV8.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */