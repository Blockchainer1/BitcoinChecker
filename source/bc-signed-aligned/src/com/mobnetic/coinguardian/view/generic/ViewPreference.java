package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.Optional;
import com.mobnetic.coinguardian.R.styleable;

public class ViewPreference
  extends FrameLayout
  implements View.OnClickListener
{
  private CharSequence summary;
  @InjectView(2131623947)
  @Optional
  TextView summaryView;
  private CharSequence title;
  @InjectView(2131624086)
  @Optional
  ViewGroup titleAndSummaryContainer;
  @InjectView(2131623948)
  @Optional
  TextView titleView;
  @InjectView(2131624087)
  @Optional
  ViewGroup widgetFrame;
  
  public ViewPreference(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null);
  }
  
  public ViewPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }
  
  public CharSequence getSummary()
  {
    return this.summary;
  }
  
  public CharSequence getTitle()
  {
    return this.title;
  }
  
  public ViewGroup getTitleAndSummaryContainer()
  {
    return this.titleAndSummaryContainer;
  }
  
  public ViewGroup getWidgetFrame()
  {
    return this.widgetFrame;
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    TypedValue localTypedValue = new TypedValue();
    ((Activity)paramContext).getTheme().resolveAttribute(2130772023, localTypedValue, true);
    setBackgroundResource(localTypedValue.resourceId);
    setOnClickListener(this);
    setFocusable(true);
    if (paramAttributeSet != null)
    {
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ViewPreference);
      this.title = paramContext.getString(0);
      this.summary = paramContext.getString(1);
      paramContext.recycle();
    }
  }
  
  public void onClick(View paramView) {}
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    if (getChildCount() == 0) {
      LayoutInflater.from(getContext()).inflate(2130903086, this);
    }
    ButterKnife.inject(this);
    setTitle(this.title);
    setSummary(this.summary);
  }
  
  public void setSummary(CharSequence paramCharSequence)
  {
    this.summary = paramCharSequence;
    TextView localTextView;
    if (this.summaryView != null)
    {
      this.summaryView.setText(paramCharSequence);
      localTextView = this.summaryView;
      if (!TextUtils.isEmpty(paramCharSequence)) {
        break label41;
      }
    }
    label41:
    for (int i = 8;; i = 0)
    {
      localTextView.setVisibility(i);
      return;
    }
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    this.title = paramCharSequence;
    if (this.titleView != null) {
      this.titleView.setText(paramCharSequence);
    }
  }
  
  protected void setWidget(View paramView)
  {
    if (this.widgetFrame == null) {}
    for (;;)
    {
      return;
      this.widgetFrame.addView(paramView);
      this.widgetFrame.setVisibility(0);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */