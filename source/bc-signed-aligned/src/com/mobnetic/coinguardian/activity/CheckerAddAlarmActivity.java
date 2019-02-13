package com.mobnetic.coinguardian.activity;

import android.content.Intent;
import android.support.v4.app.Fragment;
import com.mobnetic.coinguardian.activity.generic.SimpleFragmentSubActivity;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.fragment.CheckerAddAlarmFragment;

public class CheckerAddAlarmActivity
  extends SimpleFragmentSubActivity<CheckerAddAlarmFragment>
{
  public static final String EXTRA_ALARM_RECORD = "alarm_record";
  public static final String EXTRA_ALARM_RECORD_INDEX = "alarm_record_index";
  
  public static void startCheckerAddAlarmActivity(Fragment paramFragment, int paramInt1, CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord, int paramInt2)
  {
    Intent localIntent = new Intent(paramFragment.getActivity(), CheckerAddAlarmActivity.class);
    localIntent.putExtra("checker_record", paramCheckerRecord);
    localIntent.putExtra("alarm_record", paramAlarmRecord);
    localIntent.putExtra("alarm_record_index", paramInt2);
    paramFragment.startActivityForResult(localIntent, paramInt1);
  }
  
  protected CheckerAddAlarmFragment createChildFragment()
  {
    return CheckerAddAlarmFragment.newInstance((CheckerRecord)getIntent().getParcelableExtra("checker_record"), (AlarmRecord)getIntent().getParcelableExtra("alarm_record"));
  }
  
  public void finish()
  {
    int i = -1;
    Intent localIntent = new Intent();
    boolean bool = false;
    CheckerAddAlarmFragment localCheckerAddAlarmFragment = (CheckerAddAlarmFragment)getChildFragment();
    if (localCheckerAddAlarmFragment != null)
    {
      bool = localCheckerAddAlarmFragment.getUnsavedChanges();
      localIntent.putExtra("alarm_record", localCheckerAddAlarmFragment.getAlarmRecord());
    }
    localIntent.putExtra("alarm_record_index", getIntent().getIntExtra("alarm_record_index", -1));
    if (bool) {}
    for (;;)
    {
      setResult(i, localIntent);
      super.finish();
      return;
      i = 0;
    }
  }
  
  protected int getContentViewResId()
  {
    return 2130903066;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/CheckerAddAlarmActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */