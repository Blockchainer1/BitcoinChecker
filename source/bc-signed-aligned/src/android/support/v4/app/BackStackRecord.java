package android.support.v4.app;

import android.os.Build.VERSION;
import android.support.v4.util.ArrayMap;
import android.support.v4.util.LogWriter;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

final class BackStackRecord
  extends FragmentTransaction
  implements FragmentManager.BackStackEntry, Runnable
{
  static final int OP_ADD = 1;
  static final int OP_ATTACH = 7;
  static final int OP_DETACH = 6;
  static final int OP_HIDE = 4;
  static final int OP_NULL = 0;
  static final int OP_REMOVE = 3;
  static final int OP_REPLACE = 2;
  static final int OP_SHOW = 5;
  static final String TAG = "FragmentManager";
  boolean mAddToBackStack;
  boolean mAllowAddToBackStack = true;
  int mBreadCrumbShortTitleRes;
  CharSequence mBreadCrumbShortTitleText;
  int mBreadCrumbTitleRes;
  CharSequence mBreadCrumbTitleText;
  boolean mCommitted;
  int mEnterAnim;
  int mExitAnim;
  Op mHead;
  int mIndex = -1;
  final FragmentManagerImpl mManager;
  String mName;
  int mNumOp;
  int mPopEnterAnim;
  int mPopExitAnim;
  ArrayList<String> mSharedElementSourceNames;
  ArrayList<String> mSharedElementTargetNames;
  Op mTail;
  int mTransition;
  int mTransitionStyle;
  
  public BackStackRecord(FragmentManagerImpl paramFragmentManagerImpl)
  {
    this.mManager = paramFragmentManagerImpl;
  }
  
  private TransitionState beginTransition(SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2, boolean paramBoolean)
  {
    TransitionState localTransitionState = new TransitionState();
    localTransitionState.nonExistentView = new View(this.mManager.mActivity);
    int i = 0;
    for (int j = 0; j < paramSparseArray1.size(); j++) {
      if (configureTransitions(paramSparseArray1.keyAt(j), localTransitionState, paramBoolean, paramSparseArray1, paramSparseArray2)) {
        i = 1;
      }
    }
    j = 0;
    for (int k = i; j < paramSparseArray2.size(); k = i)
    {
      int m = paramSparseArray2.keyAt(j);
      i = k;
      if (paramSparseArray1.get(m) == null)
      {
        i = k;
        if (configureTransitions(m, localTransitionState, paramBoolean, paramSparseArray1, paramSparseArray2)) {
          i = 1;
        }
      }
      j++;
    }
    paramSparseArray1 = localTransitionState;
    if (k == 0) {
      paramSparseArray1 = null;
    }
    return paramSparseArray1;
  }
  
  private void calculateFragments(SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    if (!this.mManager.mContainer.hasView()) {}
    Op localOp;
    do
    {
      return;
      localOp = this.mHead;
    } while (localOp == null);
    switch (localOp.cmd)
    {
    }
    for (;;)
    {
      localOp = localOp.next;
      break;
      setLastIn(paramSparseArray2, localOp.fragment);
      continue;
      Object localObject1 = localOp.fragment;
      Object localObject2 = localObject1;
      if (this.mManager.mAdded != null)
      {
        int i = 0;
        localObject2 = localObject1;
        if (i < this.mManager.mAdded.size())
        {
          Fragment localFragment = (Fragment)this.mManager.mAdded.get(i);
          if (localObject1 != null)
          {
            localObject2 = localObject1;
            if (localFragment.mContainerId != ((Fragment)localObject1).mContainerId) {}
          }
          else
          {
            if (localFragment != localObject1) {
              break label193;
            }
          }
          for (localObject2 = null;; localObject2 = localObject1)
          {
            i++;
            localObject1 = localObject2;
            break;
            label193:
            setFirstOut(paramSparseArray1, localFragment);
          }
        }
      }
      setLastIn(paramSparseArray2, (Fragment)localObject2);
      continue;
      setFirstOut(paramSparseArray1, localOp.fragment);
      continue;
      setFirstOut(paramSparseArray1, localOp.fragment);
      continue;
      setLastIn(paramSparseArray2, localOp.fragment);
      continue;
      setFirstOut(paramSparseArray1, localOp.fragment);
      continue;
      setLastIn(paramSparseArray2, localOp.fragment);
    }
  }
  
  private void callSharedElementEnd(TransitionState paramTransitionState, Fragment paramFragment1, Fragment paramFragment2, boolean paramBoolean, ArrayMap<String, View> paramArrayMap)
  {
    if (paramBoolean) {}
    for (paramTransitionState = paramFragment2.mEnterTransitionCallback;; paramTransitionState = paramFragment1.mEnterTransitionCallback)
    {
      if (paramTransitionState != null) {
        paramTransitionState.onSharedElementEnd(new ArrayList(paramArrayMap.keySet()), new ArrayList(paramArrayMap.values()), null);
      }
      return;
    }
  }
  
  private static Object captureExitingViews(Object paramObject, Fragment paramFragment, ArrayList<View> paramArrayList, ArrayMap<String, View> paramArrayMap)
  {
    Object localObject = paramObject;
    if (paramObject != null) {
      localObject = FragmentTransitionCompat21.captureExitingViews(paramObject, paramFragment.getView(), paramArrayList, paramArrayMap);
    }
    return localObject;
  }
  
  private boolean configureTransitions(int paramInt, TransitionState paramTransitionState, boolean paramBoolean, SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    ViewGroup localViewGroup = (ViewGroup)this.mManager.mContainer.findViewById(paramInt);
    if (localViewGroup == null) {
      paramBoolean = false;
    }
    for (;;)
    {
      return paramBoolean;
      final Object localObject1 = (Fragment)paramSparseArray2.get(paramInt);
      Object localObject2 = (Fragment)paramSparseArray1.get(paramInt);
      Object localObject3 = getEnterTransition((Fragment)localObject1, paramBoolean);
      Object localObject4 = getSharedElementTransition((Fragment)localObject1, (Fragment)localObject2, paramBoolean);
      Object localObject5 = getExitTransition((Fragment)localObject2, paramBoolean);
      if ((localObject3 == null) && (localObject4 == null) && (localObject5 == null))
      {
        paramBoolean = false;
      }
      else
      {
        paramSparseArray1 = null;
        ArrayList localArrayList = new ArrayList();
        if (localObject4 != null)
        {
          localObject6 = remapSharedElements(paramTransitionState, (Fragment)localObject2, paramBoolean);
          if (!((ArrayMap)localObject6).isEmpty()) {
            break label456;
          }
          localArrayList.add(paramTransitionState.nonExistentView);
          label140:
          if (!paramBoolean) {
            break label470;
          }
          paramSparseArray2 = ((Fragment)localObject2).mEnterTransitionCallback;
          label151:
          paramSparseArray1 = (SparseArray<Fragment>)localObject6;
          if (paramSparseArray2 != null)
          {
            paramSparseArray2.onSharedElementStart(new ArrayList(((ArrayMap)localObject6).keySet()), new ArrayList(((ArrayMap)localObject6).values()), null);
            paramSparseArray1 = (SparseArray<Fragment>)localObject6;
          }
        }
        paramSparseArray2 = new ArrayList();
        Object localObject6 = captureExitingViews(localObject5, (Fragment)localObject2, paramSparseArray2, paramSparseArray1);
        if ((this.mSharedElementTargetNames != null) && (paramSparseArray1 != null))
        {
          paramSparseArray1 = (View)paramSparseArray1.get(this.mSharedElementTargetNames.get(0));
          if (paramSparseArray1 != null)
          {
            if (localObject6 != null) {
              FragmentTransitionCompat21.setEpicenter(localObject6, paramSparseArray1);
            }
            if (localObject4 != null) {
              FragmentTransitionCompat21.setEpicenter(localObject4, paramSparseArray1);
            }
          }
        }
        paramSparseArray1 = new FragmentTransitionCompat21.ViewRetriever()
        {
          public View getView()
          {
            return localObject1.getView();
          }
        };
        if (localObject4 != null) {
          prepareSharedElementTransition(paramTransitionState, localViewGroup, localObject4, (Fragment)localObject1, (Fragment)localObject2, paramBoolean, localArrayList);
        }
        localObject2 = new ArrayList();
        localObject5 = new ArrayMap();
        if (paramBoolean) {}
        for (paramBoolean = ((Fragment)localObject1).getAllowReturnTransitionOverlap();; paramBoolean = ((Fragment)localObject1).getAllowEnterTransitionOverlap())
        {
          localObject1 = FragmentTransitionCompat21.mergeTransitions(localObject3, localObject6, localObject4, paramBoolean);
          if (localObject1 != null)
          {
            FragmentTransitionCompat21.addTransitionTargets(localObject3, localObject4, localViewGroup, paramSparseArray1, paramTransitionState.nonExistentView, paramTransitionState.enteringEpicenterView, paramTransitionState.nameOverrides, (ArrayList)localObject2, (Map)localObject5, localArrayList);
            excludeHiddenFragmentsAfterEnter(localViewGroup, paramTransitionState, paramInt, localObject1);
            FragmentTransitionCompat21.excludeTarget(localObject1, paramTransitionState.nonExistentView, true);
            excludeHiddenFragments(paramTransitionState, paramInt, localObject1);
            FragmentTransitionCompat21.beginDelayedTransition(localViewGroup, localObject1);
            FragmentTransitionCompat21.cleanupTransitions(localViewGroup, paramTransitionState.nonExistentView, localObject3, (ArrayList)localObject2, localObject6, paramSparseArray2, localObject4, localArrayList, localObject1, paramTransitionState.hiddenFragmentViews, (Map)localObject5);
          }
          if (localObject1 == null) {
            break label489;
          }
          paramBoolean = true;
          break;
          label456:
          localArrayList.addAll(((ArrayMap)localObject6).values());
          break label140;
          label470:
          paramSparseArray2 = ((Fragment)localObject1).mEnterTransitionCallback;
          break label151;
        }
        label489:
        paramBoolean = false;
      }
    }
  }
  
  private void doAddOp(int paramInt1, Fragment paramFragment, String paramString, int paramInt2)
  {
    paramFragment.mFragmentManager = this.mManager;
    if (paramString != null)
    {
      if ((paramFragment.mTag != null) && (!paramString.equals(paramFragment.mTag))) {
        throw new IllegalStateException("Can't change tag of fragment " + paramFragment + ": was " + paramFragment.mTag + " now " + paramString);
      }
      paramFragment.mTag = paramString;
    }
    if (paramInt1 != 0)
    {
      if ((paramFragment.mFragmentId != 0) && (paramFragment.mFragmentId != paramInt1)) {
        throw new IllegalStateException("Can't change container ID of fragment " + paramFragment + ": was " + paramFragment.mFragmentId + " now " + paramInt1);
      }
      paramFragment.mFragmentId = paramInt1;
      paramFragment.mContainerId = paramInt1;
    }
    paramString = new Op();
    paramString.cmd = paramInt2;
    paramString.fragment = paramFragment;
    addOp(paramString);
  }
  
  private void excludeHiddenFragments(TransitionState paramTransitionState, int paramInt, Object paramObject)
  {
    if (this.mManager.mAdded != null)
    {
      int i = 0;
      if (i < this.mManager.mAdded.size())
      {
        Fragment localFragment = (Fragment)this.mManager.mAdded.get(i);
        if ((localFragment.mView != null) && (localFragment.mContainer != null) && (localFragment.mContainerId == paramInt))
        {
          if (!localFragment.mHidden) {
            break label122;
          }
          if (!paramTransitionState.hiddenFragmentViews.contains(localFragment.mView))
          {
            FragmentTransitionCompat21.excludeTarget(paramObject, localFragment.mView, true);
            paramTransitionState.hiddenFragmentViews.add(localFragment.mView);
          }
        }
        for (;;)
        {
          i++;
          break;
          label122:
          FragmentTransitionCompat21.excludeTarget(paramObject, localFragment.mView, false);
          paramTransitionState.hiddenFragmentViews.remove(localFragment.mView);
        }
      }
    }
  }
  
  private void excludeHiddenFragmentsAfterEnter(final View paramView, final TransitionState paramTransitionState, final int paramInt, final Object paramObject)
  {
    paramView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
    {
      public boolean onPreDraw()
      {
        paramView.getViewTreeObserver().removeOnPreDrawListener(this);
        BackStackRecord.this.excludeHiddenFragments(paramTransitionState, paramInt, paramObject);
        return true;
      }
    });
  }
  
  private static Object getEnterTransition(Fragment paramFragment, boolean paramBoolean)
  {
    if (paramFragment == null)
    {
      paramFragment = null;
      return paramFragment;
    }
    if (paramBoolean) {}
    for (paramFragment = paramFragment.getReenterTransition();; paramFragment = paramFragment.getEnterTransition())
    {
      paramFragment = FragmentTransitionCompat21.cloneTransition(paramFragment);
      break;
    }
  }
  
  private static Object getExitTransition(Fragment paramFragment, boolean paramBoolean)
  {
    if (paramFragment == null)
    {
      paramFragment = null;
      return paramFragment;
    }
    if (paramBoolean) {}
    for (paramFragment = paramFragment.getReturnTransition();; paramFragment = paramFragment.getExitTransition())
    {
      paramFragment = FragmentTransitionCompat21.cloneTransition(paramFragment);
      break;
    }
  }
  
  private static Object getSharedElementTransition(Fragment paramFragment1, Fragment paramFragment2, boolean paramBoolean)
  {
    if ((paramFragment1 == null) || (paramFragment2 == null))
    {
      paramFragment1 = null;
      return paramFragment1;
    }
    if (paramBoolean) {}
    for (paramFragment1 = paramFragment2.getSharedElementReturnTransition();; paramFragment1 = paramFragment1.getSharedElementEnterTransition())
    {
      paramFragment1 = FragmentTransitionCompat21.cloneTransition(paramFragment1);
      break;
    }
  }
  
  private ArrayMap<String, View> mapEnteringSharedElements(TransitionState paramTransitionState, Fragment paramFragment, boolean paramBoolean)
  {
    ArrayMap localArrayMap = new ArrayMap();
    paramFragment = paramFragment.getView();
    paramTransitionState = localArrayMap;
    if (paramFragment != null)
    {
      paramTransitionState = localArrayMap;
      if (this.mSharedElementSourceNames != null)
      {
        FragmentTransitionCompat21.findNamedViews(localArrayMap, paramFragment);
        if (!paramBoolean) {
          break label57;
        }
      }
    }
    for (paramTransitionState = remapNames(this.mSharedElementSourceNames, this.mSharedElementTargetNames, localArrayMap);; paramTransitionState = localArrayMap)
    {
      return paramTransitionState;
      label57:
      localArrayMap.retainAll(this.mSharedElementTargetNames);
    }
  }
  
  private ArrayMap<String, View> mapSharedElementsIn(TransitionState paramTransitionState, boolean paramBoolean, Fragment paramFragment)
  {
    ArrayMap localArrayMap = mapEnteringSharedElements(paramTransitionState, paramFragment, paramBoolean);
    if (paramBoolean)
    {
      if (paramFragment.mExitTransitionCallback != null) {
        paramFragment.mExitTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, localArrayMap);
      }
      setBackNameOverrides(paramTransitionState, localArrayMap, true);
    }
    for (;;)
    {
      return localArrayMap;
      if (paramFragment.mEnterTransitionCallback != null) {
        paramFragment.mEnterTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, localArrayMap);
      }
      setNameOverrides(paramTransitionState, localArrayMap, true);
    }
  }
  
  private void prepareSharedElementTransition(final TransitionState paramTransitionState, final View paramView, final Object paramObject, final Fragment paramFragment1, final Fragment paramFragment2, final boolean paramBoolean, final ArrayList<View> paramArrayList)
  {
    paramView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
    {
      public boolean onPreDraw()
      {
        paramView.getViewTreeObserver().removeOnPreDrawListener(this);
        ArrayMap localArrayMap;
        if (paramObject != null)
        {
          FragmentTransitionCompat21.removeTargets(paramObject, paramArrayList);
          paramArrayList.clear();
          localArrayMap = BackStackRecord.this.mapSharedElementsIn(paramTransitionState, paramBoolean, paramFragment1);
          if (!localArrayMap.isEmpty()) {
            break label127;
          }
          paramArrayList.add(paramTransitionState.nonExistentView);
        }
        for (;;)
        {
          FragmentTransitionCompat21.addTargets(paramObject, paramArrayList);
          BackStackRecord.this.setEpicenterIn(localArrayMap, paramTransitionState);
          BackStackRecord.this.callSharedElementEnd(paramTransitionState, paramFragment1, paramFragment2, paramBoolean, localArrayMap);
          return true;
          label127:
          paramArrayList.addAll(localArrayMap.values());
        }
      }
    });
  }
  
  private static ArrayMap<String, View> remapNames(ArrayList<String> paramArrayList1, ArrayList<String> paramArrayList2, ArrayMap<String, View> paramArrayMap)
  {
    if (paramArrayMap.isEmpty()) {}
    ArrayMap localArrayMap;
    for (paramArrayList1 = paramArrayMap;; paramArrayList1 = localArrayMap)
    {
      return paramArrayList1;
      localArrayMap = new ArrayMap();
      int i = paramArrayList1.size();
      for (int j = 0; j < i; j++)
      {
        View localView = (View)paramArrayMap.get(paramArrayList1.get(j));
        if (localView != null) {
          localArrayMap.put(paramArrayList2.get(j), localView);
        }
      }
    }
  }
  
  private ArrayMap<String, View> remapSharedElements(TransitionState paramTransitionState, Fragment paramFragment, boolean paramBoolean)
  {
    ArrayMap localArrayMap1 = new ArrayMap();
    ArrayMap localArrayMap2 = localArrayMap1;
    if (this.mSharedElementSourceNames != null)
    {
      FragmentTransitionCompat21.findNamedViews(localArrayMap1, paramFragment.getView());
      if (paramBoolean)
      {
        localArrayMap1.retainAll(this.mSharedElementTargetNames);
        localArrayMap2 = localArrayMap1;
      }
    }
    else
    {
      if (!paramBoolean) {
        break label100;
      }
      if (paramFragment.mEnterTransitionCallback != null) {
        paramFragment.mEnterTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, localArrayMap2);
      }
      setBackNameOverrides(paramTransitionState, localArrayMap2, false);
    }
    for (;;)
    {
      return localArrayMap2;
      localArrayMap2 = remapNames(this.mSharedElementSourceNames, this.mSharedElementTargetNames, localArrayMap1);
      break;
      label100:
      if (paramFragment.mExitTransitionCallback != null) {
        paramFragment.mExitTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, localArrayMap2);
      }
      setNameOverrides(paramTransitionState, localArrayMap2, false);
    }
  }
  
  private void setBackNameOverrides(TransitionState paramTransitionState, ArrayMap<String, View> paramArrayMap, boolean paramBoolean)
  {
    int i;
    int j;
    label13:
    String str;
    Object localObject;
    if (this.mSharedElementTargetNames == null)
    {
      i = 0;
      j = 0;
      if (j >= i) {
        return;
      }
      str = (String)this.mSharedElementSourceNames.get(j);
      localObject = (View)paramArrayMap.get((String)this.mSharedElementTargetNames.get(j));
      if (localObject != null)
      {
        localObject = FragmentTransitionCompat21.getTransitionName((View)localObject);
        if (!paramBoolean) {
          break label100;
        }
        setNameOverride(paramTransitionState.nameOverrides, str, (String)localObject);
      }
    }
    for (;;)
    {
      j++;
      break label13;
      i = this.mSharedElementTargetNames.size();
      break;
      label100:
      setNameOverride(paramTransitionState.nameOverrides, (String)localObject, str);
    }
  }
  
  private void setEpicenterIn(ArrayMap<String, View> paramArrayMap, TransitionState paramTransitionState)
  {
    if ((this.mSharedElementTargetNames != null) && (!paramArrayMap.isEmpty()))
    {
      paramArrayMap = (View)paramArrayMap.get(this.mSharedElementTargetNames.get(0));
      if (paramArrayMap != null) {
        paramTransitionState.enteringEpicenterView.epicenter = paramArrayMap;
      }
    }
  }
  
  private static void setFirstOut(SparseArray<Fragment> paramSparseArray, Fragment paramFragment)
  {
    if (paramFragment != null)
    {
      int i = paramFragment.mContainerId;
      if ((i != 0) && (!paramFragment.isHidden()) && (paramFragment.isAdded()) && (paramFragment.getView() != null) && (paramSparseArray.get(i) == null)) {
        paramSparseArray.put(i, paramFragment);
      }
    }
  }
  
  private void setLastIn(SparseArray<Fragment> paramSparseArray, Fragment paramFragment)
  {
    if (paramFragment != null)
    {
      int i = paramFragment.mContainerId;
      if (i != 0) {
        paramSparseArray.put(i, paramFragment);
      }
    }
  }
  
  private static void setNameOverride(ArrayMap<String, String> paramArrayMap, String paramString1, String paramString2)
  {
    int i;
    if ((paramString1 != null) && (paramString2 != null) && (!paramString1.equals(paramString2)))
    {
      i = 0;
      if (i >= paramArrayMap.size()) {
        break label52;
      }
      if (!paramString1.equals(paramArrayMap.valueAt(i))) {
        break label46;
      }
      paramArrayMap.setValueAt(i, paramString2);
    }
    for (;;)
    {
      return;
      label46:
      i++;
      break;
      label52:
      paramArrayMap.put(paramString1, paramString2);
    }
  }
  
  private void setNameOverrides(TransitionState paramTransitionState, ArrayMap<String, View> paramArrayMap, boolean paramBoolean)
  {
    int i = paramArrayMap.size();
    int j = 0;
    if (j < i)
    {
      String str1 = (String)paramArrayMap.keyAt(j);
      String str2 = FragmentTransitionCompat21.getTransitionName((View)paramArrayMap.valueAt(j));
      if (paramBoolean) {
        setNameOverride(paramTransitionState.nameOverrides, str1, str2);
      }
      for (;;)
      {
        j++;
        break;
        setNameOverride(paramTransitionState.nameOverrides, str2, str1);
      }
    }
  }
  
  private static void setNameOverrides(TransitionState paramTransitionState, ArrayList<String> paramArrayList1, ArrayList<String> paramArrayList2)
  {
    if (paramArrayList1 != null) {
      for (int i = 0; i < paramArrayList1.size(); i++)
      {
        String str1 = (String)paramArrayList1.get(i);
        String str2 = (String)paramArrayList2.get(i);
        setNameOverride(paramTransitionState.nameOverrides, str1, str2);
      }
    }
  }
  
  public FragmentTransaction add(int paramInt, Fragment paramFragment)
  {
    doAddOp(paramInt, paramFragment, null, 1);
    return this;
  }
  
  public FragmentTransaction add(int paramInt, Fragment paramFragment, String paramString)
  {
    doAddOp(paramInt, paramFragment, paramString, 1);
    return this;
  }
  
  public FragmentTransaction add(Fragment paramFragment, String paramString)
  {
    doAddOp(0, paramFragment, paramString, 1);
    return this;
  }
  
  void addOp(Op paramOp)
  {
    if (this.mHead == null)
    {
      this.mTail = paramOp;
      this.mHead = paramOp;
    }
    for (;;)
    {
      paramOp.enterAnim = this.mEnterAnim;
      paramOp.exitAnim = this.mExitAnim;
      paramOp.popEnterAnim = this.mPopEnterAnim;
      paramOp.popExitAnim = this.mPopExitAnim;
      this.mNumOp += 1;
      return;
      paramOp.prev = this.mTail;
      this.mTail.next = paramOp;
      this.mTail = paramOp;
    }
  }
  
  public FragmentTransaction addSharedElement(View paramView, String paramString)
  {
    if (Build.VERSION.SDK_INT >= 21)
    {
      paramView = FragmentTransitionCompat21.getTransitionName(paramView);
      if (paramView == null) {
        throw new IllegalArgumentException("Unique transitionNames are required for all sharedElements");
      }
      if (this.mSharedElementSourceNames == null)
      {
        this.mSharedElementSourceNames = new ArrayList();
        this.mSharedElementTargetNames = new ArrayList();
      }
      this.mSharedElementSourceNames.add(paramView);
      this.mSharedElementTargetNames.add(paramString);
    }
    return this;
  }
  
  public FragmentTransaction addToBackStack(String paramString)
  {
    if (!this.mAllowAddToBackStack) {
      throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
    }
    this.mAddToBackStack = true;
    this.mName = paramString;
    return this;
  }
  
  public FragmentTransaction attach(Fragment paramFragment)
  {
    Op localOp = new Op();
    localOp.cmd = 7;
    localOp.fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  void bumpBackStackNesting(int paramInt)
  {
    if (!this.mAddToBackStack) {}
    for (;;)
    {
      return;
      if (FragmentManagerImpl.DEBUG) {
        Log.v("FragmentManager", "Bump nesting in " + this + " by " + paramInt);
      }
      for (Op localOp = this.mHead; localOp != null; localOp = localOp.next)
      {
        Fragment localFragment;
        if (localOp.fragment != null)
        {
          localFragment = localOp.fragment;
          localFragment.mBackStackNesting += paramInt;
          if (FragmentManagerImpl.DEBUG) {
            Log.v("FragmentManager", "Bump nesting of " + localOp.fragment + " to " + localOp.fragment.mBackStackNesting);
          }
        }
        if (localOp.removed != null) {
          for (int i = localOp.removed.size() - 1; i >= 0; i--)
          {
            localFragment = (Fragment)localOp.removed.get(i);
            localFragment.mBackStackNesting += paramInt;
            if (FragmentManagerImpl.DEBUG) {
              Log.v("FragmentManager", "Bump nesting of " + localFragment + " to " + localFragment.mBackStackNesting);
            }
          }
        }
      }
    }
  }
  
  public void calculateBackFragments(SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    if (!this.mManager.mContainer.hasView()) {}
    Op localOp;
    do
    {
      return;
      localOp = this.mHead;
    } while (localOp == null);
    switch (localOp.cmd)
    {
    }
    for (;;)
    {
      localOp = localOp.next;
      break;
      setFirstOut(paramSparseArray1, localOp.fragment);
      continue;
      if (localOp.removed != null) {
        for (int i = localOp.removed.size() - 1; i >= 0; i--) {
          setLastIn(paramSparseArray2, (Fragment)localOp.removed.get(i));
        }
      }
      setFirstOut(paramSparseArray1, localOp.fragment);
      continue;
      setLastIn(paramSparseArray2, localOp.fragment);
      continue;
      setLastIn(paramSparseArray2, localOp.fragment);
      continue;
      setFirstOut(paramSparseArray1, localOp.fragment);
      continue;
      setLastIn(paramSparseArray2, localOp.fragment);
      continue;
      setFirstOut(paramSparseArray1, localOp.fragment);
    }
  }
  
  public int commit()
  {
    return commitInternal(false);
  }
  
  public int commitAllowingStateLoss()
  {
    return commitInternal(true);
  }
  
  int commitInternal(boolean paramBoolean)
  {
    if (this.mCommitted) {
      throw new IllegalStateException("commit already called");
    }
    if (FragmentManagerImpl.DEBUG)
    {
      Log.v("FragmentManager", "Commit: " + this);
      dump("  ", null, new PrintWriter(new LogWriter("FragmentManager")), null);
    }
    this.mCommitted = true;
    if (this.mAddToBackStack) {}
    for (this.mIndex = this.mManager.allocBackStackIndex(this);; this.mIndex = -1)
    {
      this.mManager.enqueueAction(this, paramBoolean);
      return this.mIndex;
    }
  }
  
  public FragmentTransaction detach(Fragment paramFragment)
  {
    Op localOp = new Op();
    localOp.cmd = 6;
    localOp.fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public FragmentTransaction disallowAddToBackStack()
  {
    if (this.mAddToBackStack) {
      throw new IllegalStateException("This transaction is already being added to the back stack");
    }
    this.mAllowAddToBackStack = false;
    return this;
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    dump(paramString, paramPrintWriter, true);
  }
  
  public void dump(String paramString, PrintWriter paramPrintWriter, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mName=");
      paramPrintWriter.print(this.mName);
      paramPrintWriter.print(" mIndex=");
      paramPrintWriter.print(this.mIndex);
      paramPrintWriter.print(" mCommitted=");
      paramPrintWriter.println(this.mCommitted);
      if (this.mTransition != 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mTransition=#");
        paramPrintWriter.print(Integer.toHexString(this.mTransition));
        paramPrintWriter.print(" mTransitionStyle=#");
        paramPrintWriter.println(Integer.toHexString(this.mTransitionStyle));
      }
      if ((this.mEnterAnim != 0) || (this.mExitAnim != 0))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mEnterAnim=#");
        paramPrintWriter.print(Integer.toHexString(this.mEnterAnim));
        paramPrintWriter.print(" mExitAnim=#");
        paramPrintWriter.println(Integer.toHexString(this.mExitAnim));
      }
      if ((this.mPopEnterAnim != 0) || (this.mPopExitAnim != 0))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mPopEnterAnim=#");
        paramPrintWriter.print(Integer.toHexString(this.mPopEnterAnim));
        paramPrintWriter.print(" mPopExitAnim=#");
        paramPrintWriter.println(Integer.toHexString(this.mPopExitAnim));
      }
      if ((this.mBreadCrumbTitleRes != 0) || (this.mBreadCrumbTitleText != null))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mBreadCrumbTitleRes=#");
        paramPrintWriter.print(Integer.toHexString(this.mBreadCrumbTitleRes));
        paramPrintWriter.print(" mBreadCrumbTitleText=");
        paramPrintWriter.println(this.mBreadCrumbTitleText);
      }
      if ((this.mBreadCrumbShortTitleRes != 0) || (this.mBreadCrumbShortTitleText != null))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mBreadCrumbShortTitleRes=#");
        paramPrintWriter.print(Integer.toHexString(this.mBreadCrumbShortTitleRes));
        paramPrintWriter.print(" mBreadCrumbShortTitleText=");
        paramPrintWriter.println(this.mBreadCrumbShortTitleText);
      }
    }
    if (this.mHead != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.println("Operations:");
      String str1 = paramString + "    ";
      Op localOp = this.mHead;
      for (int i = 0; localOp != null; i++)
      {
        String str2;
        int j;
        switch (localOp.cmd)
        {
        default: 
          str2 = "cmd=" + localOp.cmd;
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  Op #");
          paramPrintWriter.print(i);
          paramPrintWriter.print(": ");
          paramPrintWriter.print(str2);
          paramPrintWriter.print(" ");
          paramPrintWriter.println(localOp.fragment);
          if (paramBoolean)
          {
            if ((localOp.enterAnim != 0) || (localOp.exitAnim != 0))
            {
              paramPrintWriter.print(paramString);
              paramPrintWriter.print("enterAnim=#");
              paramPrintWriter.print(Integer.toHexString(localOp.enterAnim));
              paramPrintWriter.print(" exitAnim=#");
              paramPrintWriter.println(Integer.toHexString(localOp.exitAnim));
            }
            if ((localOp.popEnterAnim != 0) || (localOp.popExitAnim != 0))
            {
              paramPrintWriter.print(paramString);
              paramPrintWriter.print("popEnterAnim=#");
              paramPrintWriter.print(Integer.toHexString(localOp.popEnterAnim));
              paramPrintWriter.print(" popExitAnim=#");
              paramPrintWriter.println(Integer.toHexString(localOp.popExitAnim));
            }
          }
          if ((localOp.removed == null) || (localOp.removed.size() <= 0)) {
            break label804;
          }
          j = 0;
          label641:
          if (j >= localOp.removed.size()) {
            break label804;
          }
          paramPrintWriter.print(str1);
          if (localOp.removed.size() == 1) {
            paramPrintWriter.print("Removed: ");
          }
          break;
        }
        for (;;)
        {
          paramPrintWriter.println(localOp.removed.get(j));
          j++;
          break label641;
          str2 = "NULL";
          break;
          str2 = "ADD";
          break;
          str2 = "REPLACE";
          break;
          str2 = "REMOVE";
          break;
          str2 = "HIDE";
          break;
          str2 = "SHOW";
          break;
          str2 = "DETACH";
          break;
          str2 = "ATTACH";
          break;
          if (j == 0) {
            paramPrintWriter.println("Removed:");
          }
          paramPrintWriter.print(str1);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(j);
          paramPrintWriter.print(": ");
        }
        label804:
        localOp = localOp.next;
      }
    }
  }
  
  public CharSequence getBreadCrumbShortTitle()
  {
    if (this.mBreadCrumbShortTitleRes != 0) {}
    for (CharSequence localCharSequence = this.mManager.mActivity.getText(this.mBreadCrumbShortTitleRes);; localCharSequence = this.mBreadCrumbShortTitleText) {
      return localCharSequence;
    }
  }
  
  public int getBreadCrumbShortTitleRes()
  {
    return this.mBreadCrumbShortTitleRes;
  }
  
  public CharSequence getBreadCrumbTitle()
  {
    if (this.mBreadCrumbTitleRes != 0) {}
    for (CharSequence localCharSequence = this.mManager.mActivity.getText(this.mBreadCrumbTitleRes);; localCharSequence = this.mBreadCrumbTitleText) {
      return localCharSequence;
    }
  }
  
  public int getBreadCrumbTitleRes()
  {
    return this.mBreadCrumbTitleRes;
  }
  
  public int getId()
  {
    return this.mIndex;
  }
  
  public String getName()
  {
    return this.mName;
  }
  
  public int getTransition()
  {
    return this.mTransition;
  }
  
  public int getTransitionStyle()
  {
    return this.mTransitionStyle;
  }
  
  public FragmentTransaction hide(Fragment paramFragment)
  {
    Op localOp = new Op();
    localOp.cmd = 4;
    localOp.fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public boolean isAddToBackStackAllowed()
  {
    return this.mAllowAddToBackStack;
  }
  
  public boolean isEmpty()
  {
    if (this.mNumOp == 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public TransitionState popFromBackStack(boolean paramBoolean, TransitionState paramTransitionState, SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    if (FragmentManagerImpl.DEBUG)
    {
      Log.v("FragmentManager", "popFromBackStack: " + this);
      dump("  ", null, new PrintWriter(new LogWriter("FragmentManager")), null);
    }
    TransitionState localTransitionState;
    label89:
    int i;
    label102:
    int j;
    label110:
    int k;
    if (paramTransitionState == null)
    {
      if (paramSparseArray1.size() == 0)
      {
        localTransitionState = paramTransitionState;
        if (paramSparseArray2.size() == 0) {}
      }
      else
      {
        localTransitionState = beginTransition(paramSparseArray1, paramSparseArray2, true);
      }
      bumpBackStackNesting(-1);
      if (localTransitionState == null) {
        break label236;
      }
      i = 0;
      if (localTransitionState == null) {
        break label245;
      }
      j = 0;
      paramTransitionState = this.mTail;
      if (paramTransitionState == null) {
        break label531;
      }
      if (localTransitionState == null) {
        break label254;
      }
      k = 0;
      label127:
      if (localTransitionState == null) {
        break label263;
      }
    }
    label236:
    label245:
    label254:
    label263:
    for (int m = 0;; m = paramTransitionState.popExitAnim) {
      switch (paramTransitionState.cmd)
      {
      default: 
        throw new IllegalArgumentException("Unknown cmd: " + paramTransitionState.cmd);
        localTransitionState = paramTransitionState;
        if (paramBoolean) {
          break label89;
        }
        setNameOverrides(paramTransitionState, this.mSharedElementTargetNames, this.mSharedElementSourceNames);
        localTransitionState = paramTransitionState;
        break label89;
        i = this.mTransitionStyle;
        break label102;
        j = this.mTransition;
        break label110;
        k = paramTransitionState.popEnterAnim;
        break label127;
      }
    }
    paramSparseArray1 = paramTransitionState.fragment;
    paramSparseArray1.mNextAnim = m;
    this.mManager.removeFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
    for (;;)
    {
      paramTransitionState = paramTransitionState.prev;
      break;
      paramSparseArray1 = paramTransitionState.fragment;
      if (paramSparseArray1 != null)
      {
        paramSparseArray1.mNextAnim = m;
        this.mManager.removeFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
      }
      if (paramTransitionState.removed != null)
      {
        for (m = 0; m < paramTransitionState.removed.size(); m++)
        {
          paramSparseArray1 = (Fragment)paramTransitionState.removed.get(m);
          paramSparseArray1.mNextAnim = k;
          this.mManager.addFragment(paramSparseArray1, false);
        }
        paramSparseArray1 = paramTransitionState.fragment;
        paramSparseArray1.mNextAnim = k;
        this.mManager.addFragment(paramSparseArray1, false);
        continue;
        paramSparseArray1 = paramTransitionState.fragment;
        paramSparseArray1.mNextAnim = k;
        this.mManager.showFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
        continue;
        paramSparseArray1 = paramTransitionState.fragment;
        paramSparseArray1.mNextAnim = m;
        this.mManager.hideFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
        continue;
        paramSparseArray1 = paramTransitionState.fragment;
        paramSparseArray1.mNextAnim = k;
        this.mManager.attachFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
        continue;
        paramSparseArray1 = paramTransitionState.fragment;
        paramSparseArray1.mNextAnim = k;
        this.mManager.detachFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
      }
    }
    label531:
    if (paramBoolean)
    {
      this.mManager.moveToState(this.mManager.mCurState, FragmentManagerImpl.reverseTransit(j), i, true);
      localTransitionState = null;
    }
    if (this.mIndex >= 0)
    {
      this.mManager.freeBackStackIndex(this.mIndex);
      this.mIndex = -1;
    }
    return localTransitionState;
  }
  
  public FragmentTransaction remove(Fragment paramFragment)
  {
    Op localOp = new Op();
    localOp.cmd = 3;
    localOp.fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public FragmentTransaction replace(int paramInt, Fragment paramFragment)
  {
    return replace(paramInt, paramFragment, null);
  }
  
  public FragmentTransaction replace(int paramInt, Fragment paramFragment, String paramString)
  {
    if (paramInt == 0) {
      throw new IllegalArgumentException("Must use non-zero containerViewId");
    }
    doAddOp(paramInt, paramFragment, paramString, 2);
    return this;
  }
  
  public void run()
  {
    if (FragmentManagerImpl.DEBUG) {
      Log.v("FragmentManager", "Run: " + this);
    }
    if ((this.mAddToBackStack) && (this.mIndex < 0)) {
      throw new IllegalStateException("addToBackStack() called after commit()");
    }
    bumpBackStackNesting(1);
    Object localObject1 = null;
    if (Build.VERSION.SDK_INT >= 21)
    {
      localObject2 = new SparseArray();
      localObject1 = new SparseArray();
      calculateFragments((SparseArray)localObject2, (SparseArray)localObject1);
      localObject1 = beginTransition((SparseArray)localObject2, (SparseArray)localObject1, false);
    }
    int i;
    label108:
    int j;
    label115:
    Op localOp;
    int k;
    if (localObject1 != null)
    {
      i = 0;
      if (localObject1 == null) {
        break label228;
      }
      j = 0;
      localOp = this.mHead;
      if (localOp == null) {
        break label708;
      }
      if (localObject1 == null) {
        break label237;
      }
      k = 0;
      label133:
      if (localObject1 == null) {
        break label247;
      }
    }
    label228:
    label237:
    label247:
    for (int m = 0;; m = localOp.exitAnim) {
      switch (localOp.cmd)
      {
      default: 
        throw new IllegalArgumentException("Unknown cmd: " + localOp.cmd);
        i = this.mTransitionStyle;
        break label108;
        j = this.mTransition;
        break label115;
        k = localOp.enterAnim;
        break label133;
      }
    }
    Object localObject2 = localOp.fragment;
    ((Fragment)localObject2).mNextAnim = k;
    this.mManager.addFragment((Fragment)localObject2, false);
    for (;;)
    {
      localOp = localOp.next;
      break;
      localObject2 = localOp.fragment;
      Object localObject3 = localObject2;
      if (this.mManager.mAdded != null)
      {
        int n = 0;
        localObject3 = localObject2;
        if (n < this.mManager.mAdded.size())
        {
          Fragment localFragment = (Fragment)this.mManager.mAdded.get(n);
          if (FragmentManagerImpl.DEBUG) {
            Log.v("FragmentManager", "OP_REPLACE: adding=" + localObject2 + " old=" + localFragment);
          }
          if (localObject2 != null)
          {
            localObject3 = localObject2;
            if (localFragment.mContainerId != ((Fragment)localObject2).mContainerId) {}
          }
          else
          {
            if (localFragment != localObject2) {
              break label431;
            }
            localObject3 = null;
            localOp.fragment = null;
          }
          for (;;)
          {
            n++;
            localObject2 = localObject3;
            break;
            label431:
            if (localOp.removed == null) {
              localOp.removed = new ArrayList();
            }
            localOp.removed.add(localFragment);
            localFragment.mNextAnim = m;
            if (this.mAddToBackStack)
            {
              localFragment.mBackStackNesting += 1;
              if (FragmentManagerImpl.DEBUG) {
                Log.v("FragmentManager", "Bump nesting of " + localFragment + " to " + localFragment.mBackStackNesting);
              }
            }
            this.mManager.removeFragment(localFragment, j, i);
            localObject3 = localObject2;
          }
        }
      }
      if (localObject3 != null)
      {
        ((Fragment)localObject3).mNextAnim = k;
        this.mManager.addFragment((Fragment)localObject3, false);
        continue;
        localObject2 = localOp.fragment;
        ((Fragment)localObject2).mNextAnim = m;
        this.mManager.removeFragment((Fragment)localObject2, j, i);
        continue;
        localObject2 = localOp.fragment;
        ((Fragment)localObject2).mNextAnim = m;
        this.mManager.hideFragment((Fragment)localObject2, j, i);
        continue;
        localObject2 = localOp.fragment;
        ((Fragment)localObject2).mNextAnim = k;
        this.mManager.showFragment((Fragment)localObject2, j, i);
        continue;
        localObject2 = localOp.fragment;
        ((Fragment)localObject2).mNextAnim = m;
        this.mManager.detachFragment((Fragment)localObject2, j, i);
        continue;
        localObject2 = localOp.fragment;
        ((Fragment)localObject2).mNextAnim = k;
        this.mManager.attachFragment((Fragment)localObject2, j, i);
      }
    }
    label708:
    this.mManager.moveToState(this.mManager.mCurState, j, i, true);
    if (this.mAddToBackStack) {
      this.mManager.addBackStackState(this);
    }
  }
  
  public FragmentTransaction setBreadCrumbShortTitle(int paramInt)
  {
    this.mBreadCrumbShortTitleRes = paramInt;
    this.mBreadCrumbShortTitleText = null;
    return this;
  }
  
  public FragmentTransaction setBreadCrumbShortTitle(CharSequence paramCharSequence)
  {
    this.mBreadCrumbShortTitleRes = 0;
    this.mBreadCrumbShortTitleText = paramCharSequence;
    return this;
  }
  
  public FragmentTransaction setBreadCrumbTitle(int paramInt)
  {
    this.mBreadCrumbTitleRes = paramInt;
    this.mBreadCrumbTitleText = null;
    return this;
  }
  
  public FragmentTransaction setBreadCrumbTitle(CharSequence paramCharSequence)
  {
    this.mBreadCrumbTitleRes = 0;
    this.mBreadCrumbTitleText = paramCharSequence;
    return this;
  }
  
  public FragmentTransaction setCustomAnimations(int paramInt1, int paramInt2)
  {
    return setCustomAnimations(paramInt1, paramInt2, 0, 0);
  }
  
  public FragmentTransaction setCustomAnimations(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.mEnterAnim = paramInt1;
    this.mExitAnim = paramInt2;
    this.mPopEnterAnim = paramInt3;
    this.mPopExitAnim = paramInt4;
    return this;
  }
  
  public FragmentTransaction setTransition(int paramInt)
  {
    this.mTransition = paramInt;
    return this;
  }
  
  public FragmentTransaction setTransitionStyle(int paramInt)
  {
    this.mTransitionStyle = paramInt;
    return this;
  }
  
  public FragmentTransaction show(Fragment paramFragment)
  {
    Op localOp = new Op();
    localOp.cmd = 5;
    localOp.fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(128);
    localStringBuilder.append("BackStackEntry{");
    localStringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
    if (this.mIndex >= 0)
    {
      localStringBuilder.append(" #");
      localStringBuilder.append(this.mIndex);
    }
    if (this.mName != null)
    {
      localStringBuilder.append(" ");
      localStringBuilder.append(this.mName);
    }
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }
  
  static final class Op
  {
    int cmd;
    int enterAnim;
    int exitAnim;
    Fragment fragment;
    Op next;
    int popEnterAnim;
    int popExitAnim;
    Op prev;
    ArrayList<Fragment> removed;
  }
  
  public class TransitionState
  {
    public FragmentTransitionCompat21.EpicenterView enteringEpicenterView = new FragmentTransitionCompat21.EpicenterView();
    public ArrayList<View> hiddenFragmentViews = new ArrayList();
    public ArrayMap<String, String> nameOverrides = new ArrayMap();
    public View nonExistentView;
    
    public TransitionState() {}
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/app/BackStackRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */