.class Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "CheckerAlarmsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation


# instance fields
.field alarmLedView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0056
    .end annotation
.end field

.field alarmSoundView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0054
    .end annotation
.end field

.field alarmTtsView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0059
    .end annotation
.end field

.field alarmVibrateView:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0055
    .end annotation
.end field

.field alarmView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0058
    .end annotation
.end field

.field checkBox:Landroid/widget/CompoundButton;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e005b
    .end annotation
.end field

.field checkBoxWrapper:Landroid/widget/FrameLayout;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e005a
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    invoke-static {p0, p1}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 150
    return-void
.end method
