.class public Lcom/linearlistview/LinearListView;
.super Lcom/linearlistview/internal/IcsLinearLayout;
.source "LinearListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/linearlistview/LinearListView$InternalOnClickListener;,
        Lcom/linearlistview/LinearListView$OnItemClickListener;
    }
.end annotation


# static fields
.field private static final LinearListView_dividerThickness:I = 0x1

.field private static final LinearListView_entries:I

.field private static final R_styleable_LinearListView:[I


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mAreAllItemsSelectable:Z

.field private mDataObserver:Landroid/database/DataSetObserver;

.field private mEmptyView:Landroid/view/View;

.field private mOnItemClickListener:Lcom/linearlistview/LinearListView$OnItemClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 24
    const/4 v0, 0x2

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100b2

    aput v2, v0, v1

    const/4 v1, 0x1

    sget v2, Lcom/linearlistview/R$attr;->dividerThickness:I

    aput v2, v0, v1

    sput-object v0, Lcom/linearlistview/LinearListView;->R_styleable_LinearListView:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/linearlistview/LinearListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/linearlistview/internal/IcsLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    new-instance v3, Lcom/linearlistview/LinearListView$1;

    invoke-direct {v3, p0}, Lcom/linearlistview/LinearListView$1;-><init>(Lcom/linearlistview/LinearListView;)V

    iput-object v3, p0, Lcom/linearlistview/LinearListView;->mDataObserver:Landroid/database/DataSetObserver;

    .line 57
    sget-object v3, Lcom/linearlistview/LinearListView;->R_styleable_LinearListView:[I

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 61
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v3, 0x1

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    .line 63
    .local v2, "thickness":I
    if-eqz v2, :cond_0

    .line 64
    invoke-virtual {p0, v2}, Lcom/linearlistview/LinearListView;->setDividerThickness(I)V

    .line 67
    :cond_0
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v1

    .line 68
    .local v1, "entries":[Ljava/lang/CharSequence;
    if-eqz v1, :cond_1

    .line 69
    new-instance v3, Landroid/widget/ArrayAdapter;

    const v4, 0x1090003

    invoke-direct {v3, p1, v4, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {p0, v3}, Lcom/linearlistview/LinearListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 73
    :cond_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 74
    return-void
.end method

.method static synthetic access$000(Lcom/linearlistview/LinearListView;)V
    .locals 0
    .param p0, "x0"    # Lcom/linearlistview/LinearListView;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/linearlistview/LinearListView;->setupChildren()V

    return-void
.end method

.method static synthetic access$100(Lcom/linearlistview/LinearListView;)Lcom/linearlistview/LinearListView$OnItemClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/linearlistview/LinearListView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mOnItemClickListener:Lcom/linearlistview/LinearListView$OnItemClickListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/linearlistview/LinearListView;)Landroid/widget/ListAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/linearlistview/LinearListView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method private setupChildren()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    .line 247
    invoke-virtual {p0}, Lcom/linearlistview/LinearListView;->removeAllViews()V

    .line 249
    iget-object v2, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    move v2, v3

    :goto_0
    invoke-direct {p0, v2}, Lcom/linearlistview/LinearListView;->updateEmptyStatus(Z)V

    .line 251
    iget-object v2, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v2, :cond_3

    .line 262
    :cond_1
    return-void

    .line 249
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 255
    :cond_3
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 256
    iget-object v2, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    const/4 v4, 0x0

    invoke-interface {v2, v1, v4, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 257
    .local v0, "child":Landroid/view/View;
    iget-boolean v2, p0, Lcom/linearlistview/LinearListView;->mAreAllItemsSelectable:Z

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2, v1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 258
    :cond_4
    new-instance v2, Lcom/linearlistview/LinearListView$InternalOnClickListener;

    invoke-direct {v2, p0, v1}, Lcom/linearlistview/LinearListView$InternalOnClickListener;-><init>(Lcom/linearlistview/LinearListView;I)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 260
    :cond_5
    const/4 v2, -0x1

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {p0, v0, v2, v4, v3}, Lcom/linearlistview/LinearListView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 255
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private updateEmptyStatus(Z)V
    .locals 3
    .param p1, "empty"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 229
    if-eqz p1, :cond_1

    .line 230
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mEmptyView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 232
    invoke-virtual {p0, v2}, Lcom/linearlistview/LinearListView;->setVisibility(I)V

    .line 243
    :goto_0
    return-void

    .line 236
    :cond_0
    invoke-virtual {p0, v1}, Lcom/linearlistview/LinearListView;->setVisibility(I)V

    goto :goto_0

    .line 239
    :cond_1
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 240
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mEmptyView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 241
    :cond_2
    invoke-virtual {p0, v1}, Lcom/linearlistview/LinearListView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getEmptyView()Landroid/view/View;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mEmptyView:Landroid/view/View;

    return-object v0
.end method

.method public final getOnItemClickListener()Lcom/linearlistview/LinearListView$OnItemClickListener;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mOnItemClickListener:Lcom/linearlistview/LinearListView$OnItemClickListener;

    return-object v0
.end method

.method public performItemClick(Landroid/view/View;IJ)Z
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "id"    # J

    .prologue
    const/4 v0, 0x0

    .line 191
    iget-object v1, p0, Lcom/linearlistview/LinearListView;->mOnItemClickListener:Lcom/linearlistview/LinearListView$OnItemClickListener;

    if-eqz v1, :cond_0

    .line 192
    invoke-virtual {p0, v0}, Lcom/linearlistview/LinearListView;->playSoundEffect(I)V

    .line 193
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mOnItemClickListener:Lcom/linearlistview/LinearListView$OnItemClickListener;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Lcom/linearlistview/LinearListView$OnItemClickListener;->onItemClick(Lcom/linearlistview/LinearListView;Landroid/view/View;IJ)V

    .line 194
    const/4 v0, 0x1

    .line 197
    :cond_0
    return v0
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/linearlistview/LinearListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 122
    :cond_0
    iput-object p1, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 124
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_1

    .line 125
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/linearlistview/LinearListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 126
    iget-object v0, p0, Lcom/linearlistview/LinearListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lcom/linearlistview/LinearListView;->mAreAllItemsSelectable:Z

    .line 129
    :cond_1
    invoke-direct {p0}, Lcom/linearlistview/LinearListView;->setupChildren()V

    .line 131
    return-void
.end method

.method public setDividerThickness(I)V
    .locals 2
    .param p1, "thickness"    # I

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/linearlistview/LinearListView;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 96
    iput p1, p0, Lcom/linearlistview/LinearListView;->mDividerHeight:I

    .line 100
    :goto_0
    invoke-virtual {p0}, Lcom/linearlistview/LinearListView;->requestLayout()V

    .line 101
    return-void

    .line 98
    :cond_0
    iput p1, p0, Lcom/linearlistview/LinearListView;->mDividerWidth:I

    goto :goto_0
.end method

.method public setEmptyView(Landroid/view/View;)V
    .locals 3
    .param p1, "emptyView"    # Landroid/view/View;

    .prologue
    .line 204
    iput-object p1, p0, Lcom/linearlistview/LinearListView;->mEmptyView:Landroid/view/View;

    .line 206
    invoke-virtual {p0}, Lcom/linearlistview/LinearListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    .line 207
    .local v0, "adapter":Landroid/widget/ListAdapter;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 208
    .local v1, "empty":Z
    :goto_0
    invoke-direct {p0, v1}, Lcom/linearlistview/LinearListView;->updateEmptyStatus(Z)V

    .line 209
    return-void

    .line 207
    .end local v1    # "empty":Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setOnItemClickListener(Lcom/linearlistview/LinearListView$OnItemClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/linearlistview/LinearListView$OnItemClickListener;

    .prologue
    .line 167
    iput-object p1, p0, Lcom/linearlistview/LinearListView;->mOnItemClickListener:Lcom/linearlistview/LinearListView$OnItemClickListener;

    .line 168
    return-void
.end method

.method public setOrientation(I)V
    .locals 2
    .param p1, "orientation"    # I

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/linearlistview/LinearListView;->getOrientation()I

    move-result v1

    if-eq p1, v1, :cond_0

    .line 79
    iget v0, p0, Lcom/linearlistview/LinearListView;->mDividerHeight:I

    .line 80
    .local v0, "tmp":I
    iget v1, p0, Lcom/linearlistview/LinearListView;->mDividerWidth:I

    iput v1, p0, Lcom/linearlistview/LinearListView;->mDividerHeight:I

    .line 81
    iput v0, p0, Lcom/linearlistview/LinearListView;->mDividerWidth:I

    .line 83
    .end local v0    # "tmp":I
    :cond_0
    invoke-super {p0, p1}, Lcom/linearlistview/internal/IcsLinearLayout;->setOrientation(I)V

    .line 84
    return-void
.end method
