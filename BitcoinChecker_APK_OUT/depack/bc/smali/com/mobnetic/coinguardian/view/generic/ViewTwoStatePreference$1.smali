.class Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$1;
.super Ljava/lang/Object;
.source "ViewTwoStatePreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$1;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 45
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$1;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 46
    return-void
.end method
