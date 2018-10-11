.class public abstract Lcom/robotoworks/mechanoid/net/JsonEntityWriter;
.super Ljava/lang/Object;
.source "JsonEntityWriter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;


# direct methods
.method public constructor <init>(Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;)V
    .locals 0
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    .prologue
    .line 40
    .local p0, "this":Lcom/robotoworks/mechanoid/net/JsonEntityWriter;, "Lcom/robotoworks/mechanoid/net/JsonEntityWriter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/robotoworks/mechanoid/net/JsonEntityWriter;->mProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    .line 42
    return-void
.end method


# virtual methods
.method public getProvider()Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;
    .locals 1

    .prologue
    .line 37
    .local p0, "this":Lcom/robotoworks/mechanoid/net/JsonEntityWriter;, "Lcom/robotoworks/mechanoid/net/JsonEntityWriter<TT;>;"
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/JsonEntityWriter;->mProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    return-object v0
.end method

.method public abstract write(Lcom/robotoworks/mechanoid/internal/util/JsonWriter;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonWriter;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeList(Lcom/robotoworks/mechanoid/internal/util/JsonWriter;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonWriter;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
