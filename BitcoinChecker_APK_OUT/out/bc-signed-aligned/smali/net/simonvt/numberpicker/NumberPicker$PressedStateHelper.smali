.class Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;
.super Ljava/lang/Object;
.source "NumberPicker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/simonvt/numberpicker/NumberPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PressedStateHelper"
.end annotation


# static fields
.field public static final BUTTON_DECREMENT:I = 0x2

.field public static final BUTTON_INCREMENT:I = 0x1


# instance fields
.field private final MODE_PRESS:I

.field private final MODE_TAPPED:I

.field private mManagedButton:I

.field private mMode:I

.field final synthetic this$0:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method constructor <init>(Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 1
    .param p1, "this$0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 2066
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2070
    const/4 v0, 0x1

    iput v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->MODE_PRESS:I

    .line 2071
    const/4 v0, 0x2

    iput v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->MODE_TAPPED:I

    return-void
.end method


# virtual methods
.method public buttonPressDelayed(I)V
    .locals 4
    .param p1, "button"    # I

    .prologue
    .line 2091
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->cancel()V

    .line 2092
    const/4 v0, 0x1

    iput v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mMode:I

    .line 2093
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mManagedButton:I

    .line 2094
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, p0, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2095
    return-void
.end method

.method public buttonTapped(I)V
    .locals 1
    .param p1, "button"    # I

    .prologue
    .line 2098
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->cancel()V

    .line 2099
    const/4 v0, 0x2

    iput v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mMode:I

    .line 2100
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mManagedButton:I

    .line 2101
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, p0}, Lnet/simonvt/numberpicker/NumberPicker;->post(Ljava/lang/Runnable;)Z

    .line 2102
    return-void
.end method

.method public cancel()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 2077
    iput v4, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mMode:I

    .line 2078
    iput v4, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mManagedButton:I

    .line 2079
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0, p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2080
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$1400(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2081
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0, v4}, Lnet/simonvt/numberpicker/NumberPicker;->access$1402(Lnet/simonvt/numberpicker/NumberPicker;Z)Z

    .line 2082
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v2

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v3

    invoke-virtual {v0, v4, v1, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    .line 2084
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0, v4}, Lnet/simonvt/numberpicker/NumberPicker;->access$1602(Lnet/simonvt/numberpicker/NumberPicker;Z)Z

    .line 2085
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$1600(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2086
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$1700(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v2

    invoke-virtual {v0, v4, v4, v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    .line 2088
    :cond_1
    return-void
.end method

.method public run()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 2106
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mMode:I

    packed-switch v0, :pswitch_data_0

    .line 2140
    :goto_0
    return-void

    .line 2108
    :pswitch_0
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mManagedButton:I

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 2110
    :pswitch_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1402(Lnet/simonvt/numberpicker/NumberPicker;Z)Z

    .line 2111
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v2

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v3

    invoke-virtual {v0, v4, v1, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    goto :goto_0

    .line 2114
    :pswitch_2
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1602(Lnet/simonvt/numberpicker/NumberPicker;Z)Z

    .line 2115
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$1700(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v2

    invoke-virtual {v0, v4, v4, v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    goto :goto_0

    .line 2120
    :pswitch_3
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->mManagedButton:I

    packed-switch v0, :pswitch_data_2

    goto :goto_0

    .line 2122
    :pswitch_4
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$1400(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2123
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    .line 2124
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v1

    int-to-long v2, v1

    .line 2123
    invoke-virtual {v0, p0, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2126
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1400(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1402(Lnet/simonvt/numberpicker/NumberPicker;Z)Z

    .line 2127
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1500(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v2

    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v3

    invoke-virtual {v0, v4, v1, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    goto :goto_0

    .line 2130
    :pswitch_5
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v0}, Lnet/simonvt/numberpicker/NumberPicker;->access$1600(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2131
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    .line 2132
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v1

    int-to-long v2, v1

    .line 2131
    invoke-virtual {v0, p0, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2134
    :cond_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1600(Lnet/simonvt/numberpicker/NumberPicker;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->access$1602(Lnet/simonvt/numberpicker/NumberPicker;Z)Z

    .line 2135
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v1

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->this$0:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->access$1700(Lnet/simonvt/numberpicker/NumberPicker;)I

    move-result v2

    invoke-virtual {v0, v4, v4, v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate(IIII)V

    goto/16 :goto_0

    .line 2106
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_3
    .end packed-switch

    .line 2108
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 2120
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
