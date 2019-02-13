package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public final class AnimatorSet
  extends Animator
{
  private ValueAnimator mDelayAnim = null;
  private long mDuration = -1L;
  private boolean mNeedsSort = true;
  private HashMap<Animator, Node> mNodeMap = new HashMap();
  private ArrayList<Node> mNodes = new ArrayList();
  private ArrayList<Animator> mPlayingSet = new ArrayList();
  private AnimatorSetListener mSetListener = null;
  private ArrayList<Node> mSortedNodes = new ArrayList();
  private long mStartDelay = 0L;
  private boolean mStarted = false;
  boolean mTerminated = false;
  
  private void sortNodes()
  {
    Object localObject;
    int i;
    int j;
    Node localNode1;
    int k;
    int m;
    if (this.mNeedsSort)
    {
      this.mSortedNodes.clear();
      localObject = new ArrayList();
      i = this.mNodes.size();
      for (j = 0; j < i; j++)
      {
        localNode1 = (Node)this.mNodes.get(j);
        if ((localNode1.dependencies == null) || (localNode1.dependencies.size() == 0)) {
          ((ArrayList)localObject).add(localNode1);
        }
      }
      ArrayList localArrayList = new ArrayList();
      while (((ArrayList)localObject).size() > 0)
      {
        k = ((ArrayList)localObject).size();
        for (j = 0; j < k; j++)
        {
          Node localNode2 = (Node)((ArrayList)localObject).get(j);
          this.mSortedNodes.add(localNode2);
          if (localNode2.nodeDependents != null)
          {
            m = localNode2.nodeDependents.size();
            for (i = 0; i < m; i++)
            {
              localNode1 = (Node)localNode2.nodeDependents.get(i);
              localNode1.nodeDependencies.remove(localNode2);
              if (localNode1.nodeDependencies.size() == 0) {
                localArrayList.add(localNode1);
              }
            }
          }
        }
        ((ArrayList)localObject).clear();
        ((ArrayList)localObject).addAll(localArrayList);
        localArrayList.clear();
      }
      this.mNeedsSort = false;
      if (this.mSortedNodes.size() != this.mNodes.size()) {
        throw new IllegalStateException("Circular dependencies cannot exist in AnimatorSet");
      }
    }
    else
    {
      k = this.mNodes.size();
      for (j = 0; j < k; j++)
      {
        localNode1 = (Node)this.mNodes.get(j);
        if ((localNode1.dependencies != null) && (localNode1.dependencies.size() > 0))
        {
          m = localNode1.dependencies.size();
          for (i = 0; i < m; i++)
          {
            localObject = (Dependency)localNode1.dependencies.get(i);
            if (localNode1.nodeDependencies == null) {
              localNode1.nodeDependencies = new ArrayList();
            }
            if (!localNode1.nodeDependencies.contains(((Dependency)localObject).node)) {
              localNode1.nodeDependencies.add(((Dependency)localObject).node);
            }
          }
        }
        localNode1.done = false;
      }
    }
  }
  
  public void cancel()
  {
    this.mTerminated = true;
    if (isStarted())
    {
      Object localObject1 = null;
      Object localObject2;
      if (this.mListeners != null)
      {
        localObject2 = (ArrayList)this.mListeners.clone();
        Iterator localIterator = ((ArrayList)localObject2).iterator();
        for (;;)
        {
          localObject1 = localObject2;
          if (!localIterator.hasNext()) {
            break;
          }
          ((Animator.AnimatorListener)localIterator.next()).onAnimationCancel(this);
        }
      }
      if ((this.mDelayAnim != null) && (this.mDelayAnim.isRunning())) {
        this.mDelayAnim.cancel();
      }
      while (localObject1 != null)
      {
        localObject1 = ((ArrayList)localObject1).iterator();
        while (((Iterator)localObject1).hasNext()) {
          ((Animator.AnimatorListener)((Iterator)localObject1).next()).onAnimationEnd(this);
        }
        if (this.mSortedNodes.size() > 0)
        {
          localObject2 = this.mSortedNodes.iterator();
          while (((Iterator)localObject2).hasNext()) {
            ((Node)((Iterator)localObject2).next()).animation.cancel();
          }
        }
      }
      this.mStarted = false;
    }
  }
  
  public AnimatorSet clone()
  {
    AnimatorSet localAnimatorSet = (AnimatorSet)super.clone();
    localAnimatorSet.mNeedsSort = true;
    localAnimatorSet.mTerminated = false;
    localAnimatorSet.mStarted = false;
    localAnimatorSet.mPlayingSet = new ArrayList();
    localAnimatorSet.mNodeMap = new HashMap();
    localAnimatorSet.mNodes = new ArrayList();
    localAnimatorSet.mSortedNodes = new ArrayList();
    HashMap localHashMap = new HashMap();
    Object localObject1 = this.mNodes.iterator();
    Object localObject3;
    Object localObject4;
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Node)((Iterator)localObject1).next();
      localObject3 = ((Node)localObject2).clone();
      localHashMap.put(localObject2, localObject3);
      localAnimatorSet.mNodes.add(localObject3);
      localAnimatorSet.mNodeMap.put(((Node)localObject3).animation, localObject3);
      ((Node)localObject3).dependencies = null;
      ((Node)localObject3).tmpDependencies = null;
      ((Node)localObject3).nodeDependents = null;
      ((Node)localObject3).nodeDependencies = null;
      localObject4 = ((Node)localObject3).animation.getListeners();
      if (localObject4 != null)
      {
        localObject3 = null;
        Iterator localIterator = ((ArrayList)localObject4).iterator();
        while (localIterator.hasNext())
        {
          Animator.AnimatorListener localAnimatorListener = (Animator.AnimatorListener)localIterator.next();
          if ((localAnimatorListener instanceof AnimatorSetListener))
          {
            localObject2 = localObject3;
            if (localObject3 == null) {
              localObject2 = new ArrayList();
            }
            ((ArrayList)localObject2).add(localAnimatorListener);
            localObject3 = localObject2;
          }
        }
        if (localObject3 != null)
        {
          localObject2 = ((ArrayList)localObject3).iterator();
          while (((Iterator)localObject2).hasNext()) {
            ((ArrayList)localObject4).remove((Animator.AnimatorListener)((Iterator)localObject2).next());
          }
        }
      }
    }
    Object localObject2 = this.mNodes.iterator();
    while (((Iterator)localObject2).hasNext())
    {
      localObject1 = (Node)((Iterator)localObject2).next();
      localObject3 = (Node)localHashMap.get(localObject1);
      if (((Node)localObject1).dependencies != null)
      {
        localObject1 = ((Node)localObject1).dependencies.iterator();
        while (((Iterator)localObject1).hasNext())
        {
          localObject4 = (Dependency)((Iterator)localObject1).next();
          ((Node)localObject3).addDependency(new Dependency((Node)localHashMap.get(((Dependency)localObject4).node), ((Dependency)localObject4).rule));
        }
      }
    }
    return localAnimatorSet;
  }
  
  public void end()
  {
    this.mTerminated = true;
    if (isStarted())
    {
      Object localObject;
      if (this.mSortedNodes.size() != this.mNodes.size())
      {
        sortNodes();
        Iterator localIterator = this.mSortedNodes.iterator();
        while (localIterator.hasNext())
        {
          localObject = (Node)localIterator.next();
          if (this.mSetListener == null) {
            this.mSetListener = new AnimatorSetListener(this);
          }
          ((Node)localObject).animation.addListener(this.mSetListener);
        }
      }
      if (this.mDelayAnim != null) {
        this.mDelayAnim.cancel();
      }
      if (this.mSortedNodes.size() > 0)
      {
        localObject = this.mSortedNodes.iterator();
        while (((Iterator)localObject).hasNext()) {
          ((Node)((Iterator)localObject).next()).animation.end();
        }
      }
      if (this.mListeners != null)
      {
        localObject = ((ArrayList)this.mListeners.clone()).iterator();
        while (((Iterator)localObject).hasNext()) {
          ((Animator.AnimatorListener)((Iterator)localObject).next()).onAnimationEnd(this);
        }
      }
      this.mStarted = false;
    }
  }
  
  public ArrayList<Animator> getChildAnimations()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.mNodes.iterator();
    while (localIterator.hasNext()) {
      localArrayList.add(((Node)localIterator.next()).animation);
    }
    return localArrayList;
  }
  
  public long getDuration()
  {
    return this.mDuration;
  }
  
  public long getStartDelay()
  {
    return this.mStartDelay;
  }
  
  public boolean isRunning()
  {
    Iterator localIterator = this.mNodes.iterator();
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
    } while (!((Node)localIterator.next()).animation.isRunning());
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isStarted()
  {
    return this.mStarted;
  }
  
  public Builder play(Animator paramAnimator)
  {
    if (paramAnimator != null) {
      this.mNeedsSort = true;
    }
    for (paramAnimator = new Builder(paramAnimator);; paramAnimator = null) {
      return paramAnimator;
    }
  }
  
  public void playSequentially(List<Animator> paramList)
  {
    if ((paramList != null) && (paramList.size() > 0))
    {
      this.mNeedsSort = true;
      if (paramList.size() != 1) {
        break label44;
      }
      play((Animator)paramList.get(0));
    }
    for (;;)
    {
      return;
      label44:
      for (int i = 0; i < paramList.size() - 1; i++) {
        play((Animator)paramList.get(i)).before((Animator)paramList.get(i + 1));
      }
    }
  }
  
  public void playSequentially(Animator... paramVarArgs)
  {
    if (paramVarArgs != null)
    {
      this.mNeedsSort = true;
      if (paramVarArgs.length != 1) {
        break label24;
      }
      play(paramVarArgs[0]);
    }
    for (;;)
    {
      return;
      label24:
      for (int i = 0; i < paramVarArgs.length - 1; i++) {
        play(paramVarArgs[i]).before(paramVarArgs[(i + 1)]);
      }
    }
  }
  
  public void playTogether(Collection<Animator> paramCollection)
  {
    if ((paramCollection != null) && (paramCollection.size() > 0))
    {
      this.mNeedsSort = true;
      Animator localAnimator = null;
      Iterator localIterator = paramCollection.iterator();
      paramCollection = localAnimator;
      while (localIterator.hasNext())
      {
        localAnimator = (Animator)localIterator.next();
        if (paramCollection == null) {
          paramCollection = play(localAnimator);
        } else {
          paramCollection.with(localAnimator);
        }
      }
    }
  }
  
  public void playTogether(Animator... paramVarArgs)
  {
    if (paramVarArgs != null)
    {
      this.mNeedsSort = true;
      Builder localBuilder = play(paramVarArgs[0]);
      for (int i = 1; i < paramVarArgs.length; i++) {
        localBuilder.with(paramVarArgs[i]);
      }
    }
  }
  
  public AnimatorSet setDuration(long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("duration must be a value of zero or greater");
    }
    Iterator localIterator = this.mNodes.iterator();
    while (localIterator.hasNext()) {
      ((Node)localIterator.next()).animation.setDuration(paramLong);
    }
    this.mDuration = paramLong;
    return this;
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    Iterator localIterator = this.mNodes.iterator();
    while (localIterator.hasNext()) {
      ((Node)localIterator.next()).animation.setInterpolator(paramInterpolator);
    }
  }
  
  public void setStartDelay(long paramLong)
  {
    this.mStartDelay = paramLong;
  }
  
  public void setTarget(Object paramObject)
  {
    Iterator localIterator = this.mNodes.iterator();
    while (localIterator.hasNext())
    {
      Animator localAnimator = ((Node)localIterator.next()).animation;
      if ((localAnimator instanceof AnimatorSet)) {
        ((AnimatorSet)localAnimator).setTarget(paramObject);
      } else if ((localAnimator instanceof ObjectAnimator)) {
        ((ObjectAnimator)localAnimator).setTarget(paramObject);
      }
    }
  }
  
  public void setupEndValues()
  {
    Iterator localIterator = this.mNodes.iterator();
    while (localIterator.hasNext()) {
      ((Node)localIterator.next()).animation.setupEndValues();
    }
  }
  
  public void setupStartValues()
  {
    Iterator localIterator = this.mNodes.iterator();
    while (localIterator.hasNext()) {
      ((Node)localIterator.next()).animation.setupStartValues();
    }
  }
  
  public void start()
  {
    this.mTerminated = false;
    this.mStarted = true;
    sortNodes();
    int i = this.mSortedNodes.size();
    Object localObject1;
    Object localObject3;
    for (int j = 0; j < i; j++)
    {
      localObject1 = (Node)this.mSortedNodes.get(j);
      localObject2 = ((Node)localObject1).animation.getListeners();
      if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0))
      {
        localObject2 = new ArrayList((Collection)localObject2).iterator();
        while (((Iterator)localObject2).hasNext())
        {
          localObject3 = (Animator.AnimatorListener)((Iterator)localObject2).next();
          if (((localObject3 instanceof DependencyListener)) || ((localObject3 instanceof AnimatorSetListener))) {
            ((Node)localObject1).animation.removeListener((Animator.AnimatorListener)localObject3);
          }
        }
      }
    }
    final Object localObject2 = new ArrayList();
    j = 0;
    int m;
    if (j < i)
    {
      localObject3 = (Node)this.mSortedNodes.get(j);
      if (this.mSetListener == null) {
        this.mSetListener = new AnimatorSetListener(this);
      }
      if ((((Node)localObject3).dependencies == null) || (((Node)localObject3).dependencies.size() == 0)) {
        ((ArrayList)localObject2).add(localObject3);
      }
      for (;;)
      {
        ((Node)localObject3).animation.addListener(this.mSetListener);
        j++;
        break;
        int k = ((Node)localObject3).dependencies.size();
        for (m = 0; m < k; m++)
        {
          localObject1 = (Dependency)((Node)localObject3).dependencies.get(m);
          ((Dependency)localObject1).node.animation.addListener(new DependencyListener(this, (Node)localObject3, ((Dependency)localObject1).rule));
        }
        ((Node)localObject3).tmpDependencies = ((ArrayList)((Node)localObject3).dependencies.clone());
      }
    }
    if (this.mStartDelay <= 0L)
    {
      localObject2 = ((ArrayList)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject1 = (Node)((Iterator)localObject2).next();
        ((Node)localObject1).animation.start();
        this.mPlayingSet.add(((Node)localObject1).animation);
      }
    }
    this.mDelayAnim = ValueAnimator.ofFloat(new float[] { 0.0F, 1.0F });
    this.mDelayAnim.setDuration(this.mStartDelay);
    this.mDelayAnim.addListener(new AnimatorListenerAdapter()
    {
      boolean canceled = false;
      
      public void onAnimationCancel(Animator paramAnonymousAnimator)
      {
        this.canceled = true;
      }
      
      public void onAnimationEnd(Animator paramAnonymousAnimator)
      {
        if (!this.canceled)
        {
          int i = localObject2.size();
          for (int j = 0; j < i; j++)
          {
            paramAnonymousAnimator = (AnimatorSet.Node)localObject2.get(j);
            paramAnonymousAnimator.animation.start();
            AnimatorSet.this.mPlayingSet.add(paramAnonymousAnimator.animation);
          }
        }
      }
    });
    this.mDelayAnim.start();
    if (this.mListeners != null)
    {
      localObject1 = (ArrayList)this.mListeners.clone();
      m = ((ArrayList)localObject1).size();
      for (j = 0; j < m; j++) {
        ((Animator.AnimatorListener)((ArrayList)localObject1).get(j)).onAnimationStart(this);
      }
    }
    if ((this.mNodes.size() == 0) && (this.mStartDelay == 0L))
    {
      this.mStarted = false;
      if (this.mListeners != null)
      {
        localObject1 = (ArrayList)this.mListeners.clone();
        m = ((ArrayList)localObject1).size();
        for (j = 0; j < m; j++) {
          ((Animator.AnimatorListener)((ArrayList)localObject1).get(j)).onAnimationEnd(this);
        }
      }
    }
  }
  
  private class AnimatorSetListener
    implements Animator.AnimatorListener
  {
    private AnimatorSet mAnimatorSet;
    
    AnimatorSetListener(AnimatorSet paramAnimatorSet)
    {
      this.mAnimatorSet = paramAnimatorSet;
    }
    
    public void onAnimationCancel(Animator paramAnimator)
    {
      if ((!AnimatorSet.this.mTerminated) && (AnimatorSet.this.mPlayingSet.size() == 0) && (AnimatorSet.this.mListeners != null))
      {
        int i = AnimatorSet.this.mListeners.size();
        for (int j = 0; j < i; j++) {
          ((Animator.AnimatorListener)AnimatorSet.this.mListeners.get(j)).onAnimationCancel(this.mAnimatorSet);
        }
      }
    }
    
    public void onAnimationEnd(Animator paramAnimator)
    {
      paramAnimator.removeListener(this);
      AnimatorSet.this.mPlayingSet.remove(paramAnimator);
      ((AnimatorSet.Node)this.mAnimatorSet.mNodeMap.get(paramAnimator)).done = true;
      if (!AnimatorSet.this.mTerminated)
      {
        paramAnimator = this.mAnimatorSet.mSortedNodes;
        int i = 1;
        int j = paramAnimator.size();
        for (int k = 0;; k++)
        {
          int m = i;
          if (k < j)
          {
            if (!((AnimatorSet.Node)paramAnimator.get(k)).done) {
              m = 0;
            }
          }
          else
          {
            if (m == 0) {
              return;
            }
            if (AnimatorSet.this.mListeners == null) {
              break;
            }
            paramAnimator = (ArrayList)AnimatorSet.this.mListeners.clone();
            m = paramAnimator.size();
            for (k = 0; k < m; k++) {
              ((Animator.AnimatorListener)paramAnimator.get(k)).onAnimationEnd(this.mAnimatorSet);
            }
          }
        }
        AnimatorSet.access$302(this.mAnimatorSet, false);
      }
    }
    
    public void onAnimationRepeat(Animator paramAnimator) {}
    
    public void onAnimationStart(Animator paramAnimator) {}
  }
  
  public class Builder
  {
    private AnimatorSet.Node mCurrentNode;
    
    Builder(Animator paramAnimator)
    {
      this.mCurrentNode = ((AnimatorSet.Node)AnimatorSet.this.mNodeMap.get(paramAnimator));
      if (this.mCurrentNode == null)
      {
        this.mCurrentNode = new AnimatorSet.Node(paramAnimator);
        AnimatorSet.this.mNodeMap.put(paramAnimator, this.mCurrentNode);
        AnimatorSet.this.mNodes.add(this.mCurrentNode);
      }
    }
    
    public Builder after(long paramLong)
    {
      ValueAnimator localValueAnimator = ValueAnimator.ofFloat(new float[] { 0.0F, 1.0F });
      localValueAnimator.setDuration(paramLong);
      after(localValueAnimator);
      return this;
    }
    
    public Builder after(Animator paramAnimator)
    {
      AnimatorSet.Node localNode1 = (AnimatorSet.Node)AnimatorSet.this.mNodeMap.get(paramAnimator);
      AnimatorSet.Node localNode2 = localNode1;
      if (localNode1 == null)
      {
        localNode2 = new AnimatorSet.Node(paramAnimator);
        AnimatorSet.this.mNodeMap.put(paramAnimator, localNode2);
        AnimatorSet.this.mNodes.add(localNode2);
      }
      paramAnimator = new AnimatorSet.Dependency(localNode2, 1);
      this.mCurrentNode.addDependency(paramAnimator);
      return this;
    }
    
    public Builder before(Animator paramAnimator)
    {
      AnimatorSet.Node localNode1 = (AnimatorSet.Node)AnimatorSet.this.mNodeMap.get(paramAnimator);
      AnimatorSet.Node localNode2 = localNode1;
      if (localNode1 == null)
      {
        localNode2 = new AnimatorSet.Node(paramAnimator);
        AnimatorSet.this.mNodeMap.put(paramAnimator, localNode2);
        AnimatorSet.this.mNodes.add(localNode2);
      }
      localNode2.addDependency(new AnimatorSet.Dependency(this.mCurrentNode, 1));
      return this;
    }
    
    public Builder with(Animator paramAnimator)
    {
      AnimatorSet.Node localNode1 = (AnimatorSet.Node)AnimatorSet.this.mNodeMap.get(paramAnimator);
      AnimatorSet.Node localNode2 = localNode1;
      if (localNode1 == null)
      {
        localNode2 = new AnimatorSet.Node(paramAnimator);
        AnimatorSet.this.mNodeMap.put(paramAnimator, localNode2);
        AnimatorSet.this.mNodes.add(localNode2);
      }
      localNode2.addDependency(new AnimatorSet.Dependency(this.mCurrentNode, 0));
      return this;
    }
  }
  
  private static class Dependency
  {
    static final int AFTER = 1;
    static final int WITH = 0;
    public AnimatorSet.Node node;
    public int rule;
    
    public Dependency(AnimatorSet.Node paramNode, int paramInt)
    {
      this.node = paramNode;
      this.rule = paramInt;
    }
  }
  
  private static class DependencyListener
    implements Animator.AnimatorListener
  {
    private AnimatorSet mAnimatorSet;
    private AnimatorSet.Node mNode;
    private int mRule;
    
    public DependencyListener(AnimatorSet paramAnimatorSet, AnimatorSet.Node paramNode, int paramInt)
    {
      this.mAnimatorSet = paramAnimatorSet;
      this.mNode = paramNode;
      this.mRule = paramInt;
    }
    
    private void startIfReady(Animator paramAnimator)
    {
      if (this.mAnimatorSet.mTerminated) {
        return;
      }
      Object localObject1 = null;
      int i = this.mNode.tmpDependencies.size();
      for (int j = 0;; j++)
      {
        Object localObject2 = localObject1;
        if (j < i)
        {
          localObject2 = (AnimatorSet.Dependency)this.mNode.tmpDependencies.get(j);
          if ((((AnimatorSet.Dependency)localObject2).rule == this.mRule) && (((AnimatorSet.Dependency)localObject2).node.animation == paramAnimator)) {
            paramAnimator.removeListener(this);
          }
        }
        else
        {
          this.mNode.tmpDependencies.remove(localObject2);
          if (this.mNode.tmpDependencies.size() != 0) {
            break;
          }
          this.mNode.animation.start();
          this.mAnimatorSet.mPlayingSet.add(this.mNode.animation);
          break;
        }
      }
    }
    
    public void onAnimationCancel(Animator paramAnimator) {}
    
    public void onAnimationEnd(Animator paramAnimator)
    {
      if (this.mRule == 1) {
        startIfReady(paramAnimator);
      }
    }
    
    public void onAnimationRepeat(Animator paramAnimator) {}
    
    public void onAnimationStart(Animator paramAnimator)
    {
      if (this.mRule == 0) {
        startIfReady(paramAnimator);
      }
    }
  }
  
  private static class Node
    implements Cloneable
  {
    public Animator animation;
    public ArrayList<AnimatorSet.Dependency> dependencies = null;
    public boolean done = false;
    public ArrayList<Node> nodeDependencies = null;
    public ArrayList<Node> nodeDependents = null;
    public ArrayList<AnimatorSet.Dependency> tmpDependencies = null;
    
    public Node(Animator paramAnimator)
    {
      this.animation = paramAnimator;
    }
    
    public void addDependency(AnimatorSet.Dependency paramDependency)
    {
      if (this.dependencies == null)
      {
        this.dependencies = new ArrayList();
        this.nodeDependencies = new ArrayList();
      }
      this.dependencies.add(paramDependency);
      if (!this.nodeDependencies.contains(paramDependency.node)) {
        this.nodeDependencies.add(paramDependency.node);
      }
      paramDependency = paramDependency.node;
      if (paramDependency.nodeDependents == null) {
        paramDependency.nodeDependents = new ArrayList();
      }
      paramDependency.nodeDependents.add(this);
    }
    
    public Node clone()
    {
      try
      {
        Node localNode = (Node)super.clone();
        localNode.animation = this.animation.clone();
        return localNode;
      }
      catch (CloneNotSupportedException localCloneNotSupportedException)
      {
        throw new AssertionError();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/AnimatorSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */