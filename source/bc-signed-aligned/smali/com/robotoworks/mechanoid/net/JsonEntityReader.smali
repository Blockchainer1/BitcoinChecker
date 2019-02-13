.class public abstract Lcom/robotoworks/mechanoid/net/JsonEntityReader;
.super Ljava/lang/Object;
.source "JsonEntityReader.java"


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
.field private mProvider:Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;


# direct methods
.method public constructor <init>(Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;)V
    .locals 0
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;

    .prologue
    .line 40
    .local p0, "this":Lcom/robotoworks/mechanoid/net/JsonEntityReader;, "Lcom/robotoworks/mechanoid/net/JsonEntityReader<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/robotoworks/mechanoid/net/JsonEntityReader;->mProvider:Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;

    .line 42
    return-void
.end method


# virtual methods
.method public getProvider()Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;
    .locals 1

    .prologue
    .line 37
    .local p0, "this":Lcom/robotoworks/mechanoid/net/JsonEntityReader;, "Lcom/robotoworks/mechanoid/net/JsonEntityReader<TT;>;"
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/JsonEntityReader;->mProvider:Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;

    return-object v0
.end method

.method public abstract read(Lcom/robotoworks/mechanoid/internal/util/JsonReader;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonReader;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readList(Lcom/robotoworks/mechanoid/internal/util/JsonReader;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonReader;",
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
