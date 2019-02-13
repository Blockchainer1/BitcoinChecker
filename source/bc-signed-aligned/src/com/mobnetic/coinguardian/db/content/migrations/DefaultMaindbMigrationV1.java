package com.mobnetic.coinguardian.db.content.migrations;

import android.database.sqlite.SQLiteDatabase;
import com.robotoworks.mechanoid.db.SQLiteMigration;

public class DefaultMaindbMigrationV1
  extends SQLiteMigration
{
  public void onAfterUp(SQLiteDatabase paramSQLiteDatabase) {}
  
  public void onBeforeUp(SQLiteDatabase paramSQLiteDatabase) {}
  
  public void up(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("create table checker ( _id integer primary key autoincrement, enabled boolean, marketKey text, currencySrc text, currencyDst text, frequency integer, notificationPriority integer, ttsEnabled boolean,  lastCheckTicker text, lastCheckPointTicker text ) ");
    paramSQLiteDatabase.execSQL("create table alarm ( _id integer primary key autoincrement, checkerId integer, enabled boolean, type integer, value real, sound boolean, soundUri text, vibrate boolean, led boolean, ttsEnabled boolean ) ");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV1.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */