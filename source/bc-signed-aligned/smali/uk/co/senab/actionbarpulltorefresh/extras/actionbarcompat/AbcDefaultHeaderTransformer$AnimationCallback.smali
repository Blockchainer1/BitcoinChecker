.class Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;
.super Ljava/lang/Object;
.source "AbcDefaultHeaderTransformer.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AnimationCallback"
.end annotation


# instance fields
.field final synthetic this$0:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;


# direct methods
.method constructor <init>(Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;)V
    .locals 0
    .param p1, "this$0"    # Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;

    .prologue
    .line 170
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;->this$0:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 178
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;->this$0:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;

    invoke-static {v1}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->access$000(Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;)Landroid/view/animation/Animation;

    move-result-object v1

    if-ne p1, v1, :cond_1

    .line 179
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;->this$0:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;

    invoke-virtual {v1}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->getHeaderView()Landroid/view/View;

    move-result-object v0

    .line 180
    .local v0, "headerView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 181
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 183
    :cond_0
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer$AnimationCallback;->this$0:Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;

    invoke-virtual {v1}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;->onReset()V

    .line 185
    .end local v0    # "headerView":Landroid/view/View;
    :cond_1
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 189
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 174
    return-void
.end method
