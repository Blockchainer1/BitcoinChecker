.class public interface abstract annotation Lbutterknife/OnLongClick;
.super Ljava/lang/Object;
.source "OnLongClick.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Lbutterknife/internal/ListenerClass;
    value = "android.view.View.OnLongClickListener"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->CLASS:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract value()[I
.end method
