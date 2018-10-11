.class Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$2;
.super Ljava/lang/Object;
.source "CheckerAlarmsListAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

.field final synthetic val$holder:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$2;->this$0:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$2;->val$holder:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$2;->val$holder:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder;->checkBox:Landroid/widget/CompoundButton;

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->toggle()V

    .line 125
    return-void
.end method
