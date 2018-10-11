.class Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "CheckersListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation


# instance fields
.field alarmView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0058
    .end annotation
.end field

.field currencyView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0078
    .end annotation
.end field

.field dragHandle:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0077
    .end annotation
.end field

.field lastCheckTimeView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e007f
    .end annotation
.end field

.field lastCheckValueView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e007e
    .end annotation
.end field

.field lastCheckView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e007d
    .end annotation
.end field

.field marketView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e007a
    .end annotation
.end field

.field separator:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e007c
    .end annotation
.end field

.field switchView:Landroid/widget/CompoundButton;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0080
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    invoke-static {p0, p1}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 152
    return-void
.end method
