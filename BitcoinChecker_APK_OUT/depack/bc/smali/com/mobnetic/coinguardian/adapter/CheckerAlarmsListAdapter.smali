.class public abstract Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;
.super Landroid/widget/BaseAdapter;
.source "CheckerAlarmsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;
    }
.end annotation


# static fields
.field private static final ALPHA_OFF:F = 0.1f

.field private static final ALPHA_ON:F = 1.0f


# instance fields
.field private final checkerAddFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

.field private final checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

.field private final context:Landroid/content/Context;

.field private final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final verticalPadding:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Ljava/util/List;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "checkerAddFragment"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p3, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;",
            "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p4, "items":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->context:Landroid/content/Context;

    .line 45
    iput-object p2, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->checkerAddFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .line 46
    iput-object p3, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 47
    iput-object p4, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->items:Ljava/util/List;

    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090021

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->verticalPadding:I

    .line 49
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;)Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->checkerAddFragment:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 53
    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->items:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 56
    :cond_0
    return v0
.end method

.method public getItem(I)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 61
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getItem(I)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 66
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne p1, v4, :cond_1

    .line 83
    iget-object v4, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->context:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f03001b

    const/4 v6, 0x0

    invoke-virtual {v4, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 84
    const v4, 0x7f0e004f

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getCount()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    const v5, 0x7f07001d

    :goto_0
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    move-object v2, p2

    .line 134
    .end local p2    # "convertView":Landroid/view/View;
    .local v2, "convertView":Landroid/view/View;
    :goto_1
    return-object v2

    .line 84
    .end local v2    # "convertView":Landroid/view/View;
    .restart local p2    # "convertView":Landroid/view/View;
    :cond_0
    const v5, 0x7f07001c

    goto :goto_0

    .line 86
    :cond_1
    if-nez p2, :cond_2

    .line 87
    iget-object v4, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->context:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f03001d

    const/4 v6, 0x0

    invoke-virtual {v4, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 88
    new-instance v4, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;

    invoke-direct {v4, p2}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    invoke-virtual {p2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 91
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    iget v6, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->verticalPadding:I

    if-nez p1, :cond_4

    const/4 v4, 0x2

    :goto_2
    mul-int/2addr v4, v6

    invoke-virtual {p2}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result v7

    invoke-virtual {p2, v5, v4, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 93
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getItem(I)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    .line 94
    .local v0, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    if-eqz v0, :cond_3

    .line 95
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;

    .line 97
    .local v3, "holder":Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;
    iget-object v4, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->context:Landroid/content/Context;

    const v5, 0x7f07002e

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 98
    invoke-static {v8, v0}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getPrefixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 99
    invoke-static {v8, v0}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getValueForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 100
    invoke-static {v8, v0}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getSufixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 97
    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, "alarmString":Ljava/lang/String;
    iget-object v4, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmView:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    iget-object v5, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmSoundView:Landroid/view/View;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getSound()Z

    move-result v4

    if-eqz v4, :cond_5

    const/high16 v4, 0x3f800000    # 1.0f

    :goto_3
    invoke-static {v5, v4}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 105
    iget-object v5, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmVibrateView:Landroid/view/View;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getVibrate()Z

    move-result v4

    if-eqz v4, :cond_6

    const/high16 v4, 0x3f800000    # 1.0f

    :goto_4
    invoke-static {v5, v4}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 106
    iget-object v5, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmLedView:Landroid/view/View;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLed()Z

    move-result v4

    if-eqz v4, :cond_7

    const/high16 v4, 0x3f800000    # 1.0f

    :goto_5
    invoke-static {v5, v4}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 107
    iget-object v5, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->alarmTtsView:Landroid/view/View;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getTtsEnabled()Z

    move-result v4

    if-eqz v4, :cond_8

    const/high16 v4, 0x3f800000    # 1.0f

    :goto_6
    invoke-static {v5, v4}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 114
    iget-object v4, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBox:Landroid/widget/CompoundButton;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 115
    iget-object v4, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBox:Landroid/widget/CompoundButton;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 116
    iget-object v4, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBox:Landroid/widget/CompoundButton;

    new-instance v5, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$1;

    invoke-direct {v5, p0, v0}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$1;-><init>(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    invoke-virtual {v4, v5}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 122
    iget-object v4, v3, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBoxWrapper:Landroid/widget/FrameLayout;

    new-instance v5, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$2;

    invoke-direct {v5, p0, v3}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$2;-><init>(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;)V

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    .end local v1    # "alarmString":Ljava/lang/String;
    .end local v3    # "holder":Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;
    :cond_3
    new-instance v4, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;

    invoke-direct {v4, p0, v0, p1}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;-><init>(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V

    invoke-virtual {p2, v4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    move-object v2, p2

    .line 134
    .end local p2    # "convertView":Landroid/view/View;
    .restart local v2    # "convertView":Landroid/view/View;
    goto/16 :goto_1

    .line 91
    .end local v0    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .end local v2    # "convertView":Landroid/view/View;
    .restart local p2    # "convertView":Landroid/view/View;
    :cond_4
    const/4 v4, 0x1

    goto/16 :goto_2

    .line 104
    .restart local v0    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .restart local v1    # "alarmString":Ljava/lang/String;
    .restart local v3    # "holder":Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;
    :cond_5
    const v4, 0x3dcccccd    # 0.1f

    goto :goto_3

    .line 105
    :cond_6
    const v4, 0x3dcccccd    # 0.1f

    goto :goto_4

    .line 106
    :cond_7
    const v4, 0x3dcccccd    # 0.1f

    goto :goto_5

    .line 107
    :cond_8
    const v4, 0x3dcccccd    # 0.1f

    goto :goto_6
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x2

    return v0
.end method

.method public abstract onItemLongClick(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V
.end method
