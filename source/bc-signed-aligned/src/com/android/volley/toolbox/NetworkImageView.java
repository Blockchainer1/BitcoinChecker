package com.android.volley.toolbox;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import com.android.volley.VolleyError;

public class NetworkImageView
  extends ImageView
{
  private int mDefaultImageId;
  private int mErrorImageId;
  private ImageLoader.ImageContainer mImageContainer;
  private ImageLoader mImageLoader;
  private String mUrl;
  
  public NetworkImageView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public NetworkImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public NetworkImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void setDefaultImageOrNull()
  {
    if (this.mDefaultImageId != 0) {
      setImageResource(this.mDefaultImageId);
    }
    for (;;)
    {
      return;
      setImageBitmap(null);
    }
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    invalidate();
  }
  
  void loadImageIfNecessary(final boolean paramBoolean)
  {
    int i = getWidth();
    int j = getHeight();
    int k = 0;
    int m = 0;
    label53:
    int n;
    if (getLayoutParams() != null)
    {
      if (getLayoutParams().width == -2)
      {
        k = 1;
        if (getLayoutParams().height != -2) {
          break label86;
        }
        m = 1;
      }
    }
    else
    {
      if ((k == 0) || (m == 0)) {
        break label92;
      }
      n = 1;
      label66:
      if ((i != 0) || (j != 0) || (n != 0)) {
        break label98;
      }
    }
    label86:
    label92:
    label98:
    label134:
    do
    {
      for (;;)
      {
        return;
        k = 0;
        break;
        m = 0;
        break label53;
        n = 0;
        break label66;
        if (!TextUtils.isEmpty(this.mUrl)) {
          break label134;
        }
        if (this.mImageContainer != null)
        {
          this.mImageContainer.cancelRequest();
          this.mImageContainer = null;
        }
        setDefaultImageOrNull();
      }
      if ((this.mImageContainer == null) || (this.mImageContainer.getRequestUrl() == null)) {
        break label179;
      }
    } while (this.mImageContainer.getRequestUrl().equals(this.mUrl));
    this.mImageContainer.cancelRequest();
    setDefaultImageOrNull();
    label179:
    if (k != 0)
    {
      k = 0;
      label187:
      if (m == 0) {
        break label232;
      }
    }
    label232:
    for (m = 0;; m = j)
    {
      this.mImageContainer = this.mImageLoader.get(this.mUrl, new ImageLoader.ImageListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          if (NetworkImageView.this.mErrorImageId != 0) {
            NetworkImageView.this.setImageResource(NetworkImageView.this.mErrorImageId);
          }
        }
        
        public void onResponse(final ImageLoader.ImageContainer paramAnonymousImageContainer, boolean paramAnonymousBoolean)
        {
          if ((paramAnonymousBoolean) && (paramBoolean)) {
            NetworkImageView.this.post(new Runnable()
            {
              public void run()
              {
                NetworkImageView.1.this.onResponse(paramAnonymousImageContainer, false);
              }
            });
          }
          for (;;)
          {
            return;
            if (paramAnonymousImageContainer.getBitmap() != null) {
              NetworkImageView.this.setImageBitmap(paramAnonymousImageContainer.getBitmap());
            } else if (NetworkImageView.this.mDefaultImageId != 0) {
              NetworkImageView.this.setImageResource(NetworkImageView.this.mDefaultImageId);
            }
          }
        }
      }, k, m);
      break;
      k = i;
      break label187;
    }
  }
  
  protected void onDetachedFromWindow()
  {
    if (this.mImageContainer != null)
    {
      this.mImageContainer.cancelRequest();
      setImageBitmap(null);
      this.mImageContainer = null;
    }
    super.onDetachedFromWindow();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    loadImageIfNecessary(true);
  }
  
  public void setDefaultImageResId(int paramInt)
  {
    this.mDefaultImageId = paramInt;
  }
  
  public void setErrorImageResId(int paramInt)
  {
    this.mErrorImageId = paramInt;
  }
  
  public void setImageUrl(String paramString, ImageLoader paramImageLoader)
  {
    this.mUrl = paramString;
    this.mImageLoader = paramImageLoader;
    loadImageIfNecessary(false);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/toolbox/NetworkImageView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */