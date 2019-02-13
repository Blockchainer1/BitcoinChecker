package com.robotoworks.mechanoid.db;

import android.database.Cursor;

public abstract class ActiveRecordFactory<T extends ActiveRecord>
{
  public abstract T create(Cursor paramCursor);
  
  public abstract String[] getProjection();
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/ActiveRecordFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */