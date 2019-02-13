.class public Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;
.super Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;
.source "AbcDefaultHeaderTransformer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;
    }
.end annotation


# instance fields
.field private mHeaderInAnimation:Landroid/view/animation/Animation;

.field private mHeaderOutAnimation:Landroid/view/animation/Animation;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;-><init>()V

    return-void
.end method

.method static synthetic access$000(Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;)Landroid/view/animation/Animation;
    .locals 1
    .param p0, "x0"    # Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;

    .prologue
    .line 33
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderOutAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method


# virtual methods
.method protected getActionBarBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getMinimumApiLevel()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 57
    invoke-super {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getActionBarBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 64
    :goto_0
    return-object v1

    .line 61
    :cond_0
    sget v1, Luk/co/senab/actionbarpulltorefresh/library/R$attr;->actionBarStyle:I

    sget-object v2, Luk/co/senab/actionbarpulltorefresh/library/R$styleable;->ActionBar:[I

    invoke-static {p1, v1, v2}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->obtainStyledAttrsFromThemeAttr(Landroid/content/Context;I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 64
    .local v0, "abStyle":Landroid/content/res/TypedArray;
    :try_start_0
    sget v1, Luk/co/senab/actionbarpulltorefresh/library/R$styleable;->ActionBar_background:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 66
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method protected getActionBarSize(Landroid/content/Context;)I
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 73
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getMinimumApiLevel()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 74
    invoke-super {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getActionBarSize(Landroid/content/Context;)I

    move-result v2

    .line 80
    :goto_0
    return v2

    .line 77
    :cond_0
    const/4 v2, 0x1

    new-array v0, v2, [I

    sget v2, Luk/co/senab/actionbarpulltorefresh/library/R$attr;->actionBarSize:I

    aput v2, v0, v4

    .line 78
    .local v0, "attrs":[I
    invoke-virtual {p1, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 80
    .local v1, "values":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 82
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw v2
.end method

.method protected getActionBarTitleStyle(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getMinimumApiLevel()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 90
    invoke-super {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getActionBarTitleStyle(Landroid/content/Context;)I

    move-result v1

    .line 97
    :goto_0
    return v1

    .line 94
    :cond_0
    sget v1, Luk/co/senab/actionbarpulltorefresh/library/R$attr;->actionBarStyle:I

    sget-object v2, Luk/co/senab/actionbarpulltorefresh/library/R$styleable;->ActionBar:[I

    invoke-static {p1, v1, v2}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->obtainStyledAttrsFromThemeAttr(Landroid/content/Context;I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 97
    .local v0, "abStyle":Landroid/content/res/TypedArray;
    :try_start_0
    sget v1, Luk/co/senab/actionbarpulltorefresh/library/R$styleable;->ActionBar_titleTextStyle:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 99
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method protected getMinimumApiLevel()I
    .locals 1

    .prologue
    .line 167
    const/4 v0, 0x7

    return v0
.end method

.method public hideHeaderView()Z
    .locals 5

    .prologue
    const/16 v4, 0x8

    .line 126
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getMinimumApiLevel()I

    move-result v3

    if-lt v2, v3, :cond_1

    .line 127
    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->hideHeaderView()Z

    move-result v0

    .line 145
    :cond_0
    :goto_0
    return v0

    .line 130
    :cond_1
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->getHeaderView()Landroid/view/View;

    move-result-object v1

    .line 131
    .local v1, "headerView":Landroid/view/View;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eq v2, v4, :cond_2

    const/4 v0, 0x1

    .line 132
    .local v0, "changeVis":Z
    :goto_1
    if-eqz v0, :cond_0

    .line 134
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderOutAnimation:Landroid/view/animation/Animation;

    if-eqz v2, :cond_3

    .line 137
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v1, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 131
    .end local v0    # "changeVis":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 141
    .restart local v0    # "changeVis":Z
    :cond_3
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 142
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->onReset()V

    goto :goto_0
.end method

.method public onRefreshMinimized()V
    .locals 3

    .prologue
    .line 151
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getMinimumApiLevel()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 152
    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->onRefreshMinimized()V

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 157
    :cond_1
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->getHeaderView()Landroid/view/View;

    move-result-object v1

    sget v2, Luk/co/senab/actionbarpulltorefresh/library/R$id;->ptr_content:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 158
    .local v0, "contentLayout":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 160
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Luk/co/senab/actionbarpulltorefresh/library/R$anim;->fade_out:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 159
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 161
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public onViewCreated(Landroid/app/Activity;Landroid/view/View;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "headerView"    # Landroid/view/View;

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->onViewCreated(Landroid/app/Activity;Landroid/view/View;)V

    .line 42
    sget v1, Luk/co/senab/actionbarpulltorefresh/library/R$anim;->fade_in:I

    invoke-static {p1, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderInAnimation:Landroid/view/animation/Animation;

    .line 43
    sget v1, Luk/co/senab/actionbarpulltorefresh/library/R$anim;->fade_out:I

    invoke-static {p1, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderOutAnimation:Landroid/view/animation/Animation;

    .line 45
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderOutAnimation:Landroid/view/animation/Animation;

    if-nez v1, :cond_0

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderInAnimation:Landroid/view/animation/Animation;

    if-eqz v1, :cond_1

    .line 46
    :cond_0
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;

    invoke-direct {v0, p0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;-><init>(Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;)V

    .line 47
    .local v0, "callback":Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderOutAnimation:Landroid/view/animation/Animation;

    if-eqz v1, :cond_1

    .line 48
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v1, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 51
    .end local v0    # "callback":Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;
    :cond_1
    return-void
.end method

.method public showHeaderView()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 106
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->getMinimumApiLevel()I

    move-result v4

    if-lt v3, v4, :cond_1

    .line 107
    invoke-super {p0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;->showHeaderView()Z

    move-result v0

    .line 120
    :cond_0
    :goto_0
    return v0

    .line 110
    :cond_1
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->getHeaderView()Landroid/view/View;

    move-result-object v1

    .line 111
    .local v1, "headerView":Landroid/view/View;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_3

    const/4 v0, 0x1

    .line 112
    .local v0, "changeVis":Z
    :goto_1
    if-eqz v0, :cond_0

    .line 114
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderInAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_2

    .line 116
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->mHeaderInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v1, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 118
    :cond_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .end local v0    # "changeVis":Z
    :cond_3
    move v0, v2

    .line 111
    goto :goto_1
.end method
