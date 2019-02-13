.class public final enum Lcom/robotoworks/mechanoid/internal/util/JsonToken;
.super Ljava/lang/Enum;
.source "JsonToken.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/robotoworks/mechanoid/internal/util/JsonToken;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum BEGIN_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum BEGIN_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum BOOLEAN:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum END_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum NAME:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum NULL:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field public static final enum STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "BEGIN_ARRAY"

    invoke-direct {v0, v1, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 38
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "END_ARRAY"

    invoke-direct {v0, v1, v4}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 44
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "BEGIN_OBJECT"

    invoke-direct {v0, v1, v5}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 50
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "END_OBJECT"

    invoke-direct {v0, v1, v6}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 57
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "NAME"

    invoke-direct {v0, v1, v7}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NAME:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 62
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "STRING"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 68
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "NUMBER"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 73
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "BOOLEAN"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BOOLEAN:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 78
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "NULL"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NULL:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 85
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    const-string v1, "END_DOCUMENT"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonToken;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 26
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v1, v0, v3

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v1, v0, v4

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v1, v0, v5

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v1, v0, v6

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NAME:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BOOLEAN:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NULL:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    aput-object v2, v0, v1

    sput-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->$VALUES:[Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    return-object v0
.end method

.method public static values()[Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->$VALUES:[Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-virtual {v0}, [Lcom/robotoworks/mechanoid/internal/util/JsonToken;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    return-object v0
.end method
