.class public final Lcom/robotoworks/mechanoid/internal/util/JsonReader;
.super Ljava/lang/Object;
.source "JsonReader.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/internal/util/JsonReader$1;
    }
.end annotation


# static fields
.field private static final FALSE:Ljava/lang/String; = "false"

.field private static final TRUE:Ljava/lang/String; = "true"


# instance fields
.field private final buffer:[C

.field private bufferStartColumn:I

.field private bufferStartLine:I

.field private final in:Ljava/io/Reader;

.field private lenient:Z

.field private limit:I

.field private name:Ljava/lang/String;

.field private pos:I

.field private skipping:Z

.field private final stack:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/robotoworks/mechanoid/internal/util/JsonScope;",
            ">;"
        }
    .end annotation
.end field

.field private final stringPool:Lcom/robotoworks/mechanoid/internal/util/StringPool;

.field private token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

.field private value:Ljava/lang/String;

.field private valueLength:I

.field private valuePos:I


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 3
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 185
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/StringPool;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/internal/util/StringPool;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stringPool:Lcom/robotoworks/mechanoid/internal/util/StringPool;

    .line 191
    iput-boolean v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->lenient:Z

    .line 199
    const/16 v0, 0x400

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    .line 200
    iput v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 201
    iput v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    .line 206
    iput v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartLine:I

    .line 207
    iput v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    .line 209
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    .line 211
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->push(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 232
    iput-boolean v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipping:Z

    .line 238
    if-nez p1, :cond_0

    .line 239
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "in == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 241
    :cond_0
    iput-object p1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->in:Ljava/io/Reader;

    .line 242
    return-void
.end method

.method private advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 375
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 377
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 378
    .local v0, "result":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 379
    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 380
    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->name:Ljava/lang/String;

    .line 381
    return-object v0
.end method

.method private checkLenient()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 838
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->lenient:Z

    if-nez v0, :cond_0

    .line 839
    const-string v0, "Use JsonReader.setLenient(true) to accept malformed JSON"

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 841
    :cond_0
    return-void
.end method

.method private decodeLiteral()Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x55

    const/16 v6, 0x45

    const/4 v5, 0x4

    const/16 v4, 0x6c

    const/16 v3, 0x4c

    .line 1070
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1072
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 1097
    :goto_0
    return-object v0

    .line 1073
    :cond_0
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    if-ne v0, v5, :cond_5

    const/16 v0, 0x6e

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_1

    const/16 v0, 0x4e

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_5

    :cond_1
    const/16 v0, 0x75

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x1

    aget-char v0, v0, v1

    if-ne v7, v0, :cond_5

    :cond_2
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-eq v4, v0, :cond_3

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-ne v3, v0, :cond_5

    :cond_3
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x3

    aget-char v0, v0, v1

    if-eq v4, v0, :cond_4

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x3

    aget-char v0, v0, v1

    if-ne v3, v0, :cond_5

    .line 1078
    :cond_4
    const-string v0, "null"

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 1079
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NULL:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_0

    .line 1080
    :cond_5
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    if-ne v0, v5, :cond_a

    const/16 v0, 0x74

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_6

    const/16 v0, 0x54

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_a

    :cond_6
    const/16 v0, 0x72

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_7

    const/16 v0, 0x52

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_a

    :cond_7
    const/16 v0, 0x75

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x2

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_8

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-ne v7, v0, :cond_a

    :cond_8
    const/16 v0, 0x65

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x3

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_9

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x3

    aget-char v0, v0, v1

    if-ne v6, v0, :cond_a

    .line 1085
    :cond_9
    const-string v0, "true"

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 1086
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BOOLEAN:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto/16 :goto_0

    .line 1087
    :cond_a
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_10

    const/16 v0, 0x66

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_b

    const/16 v0, 0x46

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_10

    :cond_b
    const/16 v0, 0x61

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_c

    const/16 v0, 0x41

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x1

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_10

    :cond_c
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-eq v4, v0, :cond_d

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x2

    aget-char v0, v0, v1

    if-ne v3, v0, :cond_10

    :cond_d
    const/16 v0, 0x73

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x3

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_e

    const/16 v0, 0x53

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x3

    aget-char v1, v1, v2

    if-ne v0, v1, :cond_10

    :cond_e
    const/16 v0, 0x65

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v2, v2, 0x4

    aget-char v1, v1, v2

    if-eq v0, v1, :cond_f

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    add-int/lit8 v1, v1, 0x4

    aget-char v0, v0, v1

    if-ne v6, v0, :cond_10

    .line 1093
    :cond_f
    const-string v0, "false"

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 1094
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BOOLEAN:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto/16 :goto_0

    .line 1096
    :cond_10
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stringPool:Lcom/robotoworks/mechanoid/internal/util/StringPool;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/internal/util/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 1097
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    invoke-direct {p0, v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->decodeNumber([CII)Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v0

    goto/16 :goto_0
.end method

.method private decodeNumber([CII)Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 6
    .param p1, "chars"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/16 v5, 0x2d

    const/16 v4, 0x39

    const/16 v3, 0x30

    .line 1108
    move v1, p2

    .line 1109
    .local v1, "i":I
    aget-char v0, p1, v1

    .line 1111
    .local v0, "c":I
    if-ne v0, v5, :cond_0

    .line 1112
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1115
    :cond_0
    if-ne v0, v3, :cond_2

    .line 1116
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1126
    :cond_1
    const/16 v2, 0x2e

    if-ne v0, v2, :cond_4

    .line 1127
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1128
    :goto_0
    if-lt v0, v3, :cond_4

    if-gt v0, v4, :cond_4

    .line 1129
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    goto :goto_0

    .line 1117
    :cond_2
    const/16 v2, 0x31

    if-lt v0, v2, :cond_3

    if-gt v0, v4, :cond_3

    .line 1118
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1119
    :goto_1
    if-lt v0, v3, :cond_1

    if-gt v0, v4, :cond_1

    .line 1120
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    goto :goto_1

    .line 1123
    :cond_3
    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 1151
    :goto_2
    return-object v2

    .line 1133
    :cond_4
    const/16 v2, 0x65

    if-eq v0, v2, :cond_5

    const/16 v2, 0x45

    if-ne v0, v2, :cond_9

    .line 1134
    :cond_5
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1135
    const/16 v2, 0x2b

    if-eq v0, v2, :cond_6

    if-ne v0, v5, :cond_7

    .line 1136
    :cond_6
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1138
    :cond_7
    if-lt v0, v3, :cond_8

    if-gt v0, v4, :cond_8

    .line 1139
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    .line 1140
    :goto_3
    if-lt v0, v3, :cond_9

    if-gt v0, v4, :cond_9

    .line 1141
    add-int/lit8 v1, v1, 0x1

    aget-char v0, p1, v1

    goto :goto_3

    .line 1144
    :cond_8
    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_2

    .line 1148
    :cond_9
    add-int v2, p2, p3

    if-ne v1, v2, :cond_a

    .line 1149
    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_2

    .line 1151
    :cond_a
    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_2
.end method

.method private expect(Lcom/robotoworks/mechanoid/internal/util/JsonToken;)V
    .locals 3
    .param p1, "expected"    # Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 313
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v0, p1, :cond_0

    .line 314
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 316
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 317
    return-void
.end method

.method private fillBuffer(I)Z
    .locals 9
    .param p1, "minimum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 725
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    if-ge v0, v4, :cond_1

    .line 726
    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    aget-char v4, v4, v0

    const/16 v5, 0xa

    if-ne v4, v5, :cond_0

    .line 727
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartLine:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartLine:I

    .line 728
    iput v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    .line 725
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 730
    :cond_0
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    goto :goto_1

    .line 734
    :cond_1
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    iget v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    if-eq v4, v5, :cond_4

    .line 735
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    iget v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    .line 736
    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iget-object v6, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v7, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    invoke-static {v4, v5, v6, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 741
    :goto_2
    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 743
    :cond_2
    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->in:Ljava/io/Reader;

    iget-object v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v6, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    iget-object v7, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    array-length v7, v7

    iget v8, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    sub-int/2addr v7, v8

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/Reader;->read([CII)I

    move-result v1

    .local v1, "total":I
    const/4 v4, -0x1

    if-eq v1, v4, :cond_5

    .line 744
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    .line 747
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartLine:I

    if-ne v4, v2, :cond_3

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    if-ne v4, v2, :cond_3

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-lez v4, :cond_3

    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    aget-char v4, v4, v3

    const v5, 0xfeff

    if-ne v4, v5, :cond_3

    .line 749
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 750
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    .line 753
    :cond_3
    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-lt v4, p1, :cond_2

    .line 757
    :goto_3
    return v2

    .line 738
    .end local v1    # "total":I
    :cond_4
    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    goto :goto_2

    .restart local v1    # "total":I
    :cond_5
    move v2, v3

    .line 757
    goto :goto_3
.end method

.method private getColumnNumber()I
    .locals 4

    .prologue
    .line 771
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartColumn:I

    .line 772
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    if-ge v0, v2, :cond_1

    .line 773
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    aget-char v2, v2, v0

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 774
    const/4 v1, 0x1

    .line 772
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 776
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 779
    :cond_1
    return v1
.end method

.method private getLineNumber()I
    .locals 4

    .prologue
    .line 761
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->bufferStartLine:I

    .line 762
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    if-ge v0, v2, :cond_1

    .line 763
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    aget-char v2, v2, v0

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 764
    add-int/lit8 v1, v1, 0x1

    .line 762
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 767
    :cond_1
    return v1
.end method

.method private getSnippet()Ljava/lang/CharSequence;
    .locals 6

    .prologue
    const/16 v5, 0x14

    .line 1165
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1166
    .local v2, "snippet":Ljava/lang/StringBuilder;
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1167
    .local v1, "beforePos":I
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    sub-int/2addr v4, v1

    invoke-virtual {v2, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1168
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    sub-int/2addr v3, v4

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1169
    .local v0, "afterPos":I
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    invoke-virtual {v2, v3, v4, v0}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1170
    return-object v2
.end method

.method private nextInArray(Z)Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 1
    .param p1, "firstElement"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 587
    if-eqz p1, :cond_0

    .line 588
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 604
    :goto_0
    :sswitch_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextNonWhitespace()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 619
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 620
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextValue()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v0

    :goto_1
    return-object v0

    .line 591
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextNonWhitespace()I

    move-result v0

    sparse-switch v0, :sswitch_data_1

    .line 600
    const-string v0, "Unterminated array"

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 593
    :sswitch_1
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pop()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 594
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_1

    .line 596
    :sswitch_2
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    goto :goto_0

    .line 606
    :sswitch_3
    if-eqz p1, :cond_1

    .line 607
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pop()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 608
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_1

    .line 614
    :cond_1
    :sswitch_4
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 615
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 616
    const-string v0, "null"

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 617
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NULL:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_1

    .line 604
    nop

    :sswitch_data_0
    .sparse-switch
        0x2c -> :sswitch_4
        0x3b -> :sswitch_4
        0x5d -> :sswitch_3
    .end sparse-switch

    .line 591
    :sswitch_data_1
    .sparse-switch
        0x2c -> :sswitch_0
        0x3b -> :sswitch_2
        0x5d -> :sswitch_1
    .end sparse-switch
.end method

.method private nextInObject(Z)Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 2
    .param p1, "firstElement"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 630
    if-eqz p1, :cond_0

    .line 632
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextNonWhitespace()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 637
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 653
    :sswitch_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextNonWhitespace()I

    move-result v0

    .line 654
    .local v0, "quote":I
    sparse-switch v0, :sswitch_data_0

    .line 661
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 662
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 663
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextLiteral(Z)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->name:Ljava/lang/String;

    .line 664
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 665
    const-string v1, "Expected name"

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    .line 634
    .end local v0    # "quote":I
    :pswitch_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pop()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 635
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 670
    :goto_0
    return-object v1

    .line 640
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextNonWhitespace()I

    move-result v1

    sparse-switch v1, :sswitch_data_1

    .line 648
    const-string v1, "Unterminated object"

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    .line 642
    :sswitch_1
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pop()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .line 643
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_0

    .line 656
    .restart local v0    # "quote":I
    :sswitch_2
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 658
    :sswitch_3
    int-to-char v1, v0

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextString(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->name:Ljava/lang/String;

    .line 669
    :cond_1
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->DANGLING_NAME:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 670
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NAME:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_0

    .line 632
    nop

    :pswitch_data_0
    .packed-switch 0x7d
        :pswitch_0
    .end packed-switch

    .line 654
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_3
        0x27 -> :sswitch_2
    .end sparse-switch

    .line 640
    :sswitch_data_1
    .sparse-switch
        0x2c -> :sswitch_0
        0x3b -> :sswitch_0
        0x7d -> :sswitch_1
    .end sparse-switch
.end method

.method private nextLiteral(Z)Ljava/lang/String;
    .locals 6
    .param p1, "assignOffsetsOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 926
    const/4 v0, 0x0

    .line 927
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v3, -0x1

    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    .line 928
    iput v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    .line 929
    const/4 v1, 0x0

    .line 933
    .local v1, "i":I
    :cond_0
    :goto_0
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/2addr v3, v1

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-ge v3, v4, :cond_1

    .line 934
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/2addr v4, v1

    aget-char v3, v3, v4

    sparse-switch v3, :sswitch_data_0

    .line 933
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 940
    :sswitch_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 984
    :goto_1
    :sswitch_1
    if-eqz p1, :cond_4

    if-nez v0, :cond_4

    .line 985
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valuePos:I

    .line 986
    const/4 v2, 0x0

    .line 995
    .local v2, "result":Ljava/lang/String;
    :goto_2
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    .line 996
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 997
    return-object v2

    .line 961
    .end local v2    # "result":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    array-length v3, v3

    if-ge v1, v3, :cond_2

    .line 962
    add-int/lit8 v3, v1, 0x1

    invoke-direct {p0, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 965
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    aput-char v5, v3, v4

    goto :goto_1

    .line 971
    :cond_2
    if-nez v0, :cond_3

    .line 972
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 974
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_3
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    invoke-virtual {v0, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 975
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    .line 976
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 977
    const/4 v1, 0x0

    .line 978
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 987
    :cond_4
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipping:Z

    if-eqz v3, :cond_5

    .line 988
    const-string v2, "skipped!"

    .restart local v2    # "result":Ljava/lang/String;
    goto :goto_2

    .line 989
    .end local v2    # "result":Ljava/lang/String;
    :cond_5
    if-nez v0, :cond_6

    .line 990
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stringPool:Lcom/robotoworks/mechanoid/internal/util/StringPool;

    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    invoke-virtual {v3, v4, v5, v1}, Lcom/robotoworks/mechanoid/internal/util/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "result":Ljava/lang/String;
    goto :goto_2

    .line 992
    .end local v2    # "result":Ljava/lang/String;
    :cond_6
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    invoke-virtual {v0, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 993
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "result":Ljava/lang/String;
    goto :goto_2

    .line 934
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_1
        0xa -> :sswitch_1
        0xc -> :sswitch_1
        0xd -> :sswitch_1
        0x20 -> :sswitch_1
        0x23 -> :sswitch_0
        0x2c -> :sswitch_1
        0x2f -> :sswitch_0
        0x3a -> :sswitch_1
        0x3b -> :sswitch_0
        0x3d -> :sswitch_0
        0x5b -> :sswitch_1
        0x5c -> :sswitch_0
        0x5d -> :sswitch_1
        0x7b -> :sswitch_1
        0x7d -> :sswitch_1
    .end sparse-switch
.end method

.method private nextNonWhitespace()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 783
    :goto_0
    :sswitch_0
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-lt v2, v3, :cond_0

    invoke-direct {p0, v5}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 784
    :cond_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    aget-char v0, v2, v3

    .line 785
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 830
    :cond_1
    :goto_1
    return v0

    .line 793
    :sswitch_1
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-ne v2, v3, :cond_2

    invoke-direct {p0, v5}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 797
    :cond_2
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 798
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    aget-char v1, v2, v3

    .line 799
    .local v1, "peek":C
    sparse-switch v1, :sswitch_data_1

    goto :goto_1

    .line 802
    :sswitch_2
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 803
    const-string v2, "*/"

    invoke-direct {p0, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipTo(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 804
    const-string v2, "Unterminated comment"

    invoke-direct {p0, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 806
    :cond_3
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    goto :goto_0

    .line 811
    :sswitch_3
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 812
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipToEndOfLine()V

    goto :goto_0

    .line 825
    .end local v1    # "peek":C
    :sswitch_4
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 826
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipToEndOfLine()V

    goto :goto_0

    .line 834
    .end local v0    # "c":I
    :cond_4
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "End of input"

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 785
    nop

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x23 -> :sswitch_4
        0x2f -> :sswitch_1
    .end sparse-switch

    .line 799
    :sswitch_data_1
    .sparse-switch
        0x2a -> :sswitch_2
        0x2f -> :sswitch_3
    .end sparse-switch
.end method

.method private nextString(C)Ljava/lang/String;
    .locals 6
    .param p1, "quote"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 881
    const/4 v0, 0x0

    .line 884
    .local v0, "builder":Ljava/lang/StringBuilder;
    :cond_0
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 885
    .local v2, "start":I
    :cond_1
    :goto_0
    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-ge v3, v4, :cond_6

    .line 886
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    aget-char v1, v3, v4

    .line 888
    .local v1, "c":I
    if-ne v1, p1, :cond_4

    .line 889
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipping:Z

    if-eqz v3, :cond_2

    .line 890
    const-string v3, "skipped!"

    .line 895
    :goto_1
    return-object v3

    .line 891
    :cond_2
    if-nez v0, :cond_3

    .line 892
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stringPool:Lcom/robotoworks/mechanoid/internal/util/StringPool;

    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    sub-int/2addr v5, v2

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v3, v4, v2, v5}, Lcom/robotoworks/mechanoid/internal/util/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 894
    :cond_3
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    sub-int/2addr v4, v2

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 895
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 898
    :cond_4
    const/16 v3, 0x5c

    if-ne v1, v3, :cond_1

    .line 899
    if-nez v0, :cond_5

    .line 900
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 902
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_5
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    sub-int/2addr v4, v2

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 903
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->readEscapeCharacter()C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 904
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    goto :goto_0

    .line 908
    .end local v1    # "c":I
    :cond_6
    if-nez v0, :cond_7

    .line 909
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 911
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_7
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    sub-int/2addr v4, v2

    invoke-virtual {v0, v3, v2, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 912
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 914
    const-string v3, "Unterminated string"

    invoke-direct {p0, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3
.end method

.method private nextValue()Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 696
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextNonWhitespace()I

    move-result v0

    .line 697
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_0

    .line 713
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 714
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->readLiteral()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    :goto_0
    return-object v1

    .line 699
    :sswitch_0
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->push(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 700
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_0

    .line 703
    :sswitch_1
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->push(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 704
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_0

    .line 707
    :sswitch_2
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 709
    :sswitch_3
    int-to-char v1, v0

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextString(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 710
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_0

    .line 697
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_3
        0x27 -> :sswitch_2
        0x5b -> :sswitch_1
        0x7b -> :sswitch_0
    .end sparse-switch
.end method

.method private objectValue()Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 678
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextNonWhitespace()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 688
    :pswitch_0
    const-string v0, "Expected \':\'"

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 682
    :pswitch_1
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 683
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    aget-char v0, v0, v1

    const/16 v1, 0x3e

    if-ne v0, v1, :cond_1

    .line 684
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 691
    :cond_1
    :pswitch_2
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 692
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextValue()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v0

    return-object v0

    .line 678
    :pswitch_data_0
    .packed-switch 0x3a
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private peekStack()Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .locals 2

    .prologue
    .line 568
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    return-object v0
.end method

.method private pop()Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .locals 2

    .prologue
    .line 572
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    return-object v0
.end method

.method private push(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V
    .locals 1
    .param p1, "newTop"    # Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .prologue
    .line 576
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 577
    return-void
.end method

.method private readEscapeCharacter()C
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    .line 1014
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1015
    const-string v2, "Unterminated escape sequence"

    invoke-direct {p0, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 1018
    :cond_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    aget-char v0, v2, v3

    .line 1019
    .local v0, "escaped":C
    sparse-switch v0, :sswitch_data_0

    .line 1047
    .end local v0    # "escaped":C
    :goto_0
    return v0

    .line 1021
    .restart local v0    # "escaped":C
    :sswitch_0
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x4

    iget v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-le v2, v3, :cond_1

    invoke-direct {p0, v5}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1022
    const-string v2, "Unterminated escape sequence"

    invoke-direct {p0, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 1024
    :cond_1
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stringPool:Lcom/robotoworks/mechanoid/internal/util/StringPool;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    invoke-virtual {v2, v3, v4, v5}, Lcom/robotoworks/mechanoid/internal/util/StringPool;->get([CII)Ljava/lang/String;

    move-result-object v1

    .line 1025
    .local v1, "hex":Ljava/lang/String;
    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    .line 1026
    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-char v0, v2

    goto :goto_0

    .line 1029
    .end local v1    # "hex":Ljava/lang/String;
    :sswitch_1
    const/16 v0, 0x9

    goto :goto_0

    .line 1032
    :sswitch_2
    const/16 v0, 0x8

    goto :goto_0

    .line 1035
    :sswitch_3
    const/16 v0, 0xa

    goto :goto_0

    .line 1038
    :sswitch_4
    const/16 v0, 0xd

    goto :goto_0

    .line 1041
    :sswitch_5
    const/16 v0, 0xc

    goto :goto_0

    .line 1019
    nop

    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_2
        0x66 -> :sswitch_5
        0x6e -> :sswitch_3
        0x72 -> :sswitch_4
        0x74 -> :sswitch_1
        0x75 -> :sswitch_0
    .end sparse-switch
.end method

.method private readLiteral()Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1055
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextLiteral(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 1056
    iget v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->valueLength:I

    if-nez v0, :cond_0

    .line 1057
    const-string v0, "Expected literal value"

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 1059
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->decodeLiteral()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 1060
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-ne v0, v1, :cond_1

    .line 1061
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->checkLenient()V

    .line 1063
    :cond_1
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    return-object v0
.end method

.method private replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V
    .locals 2
    .param p1, "newTop"    # Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .prologue
    .line 583
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 584
    return-void
.end method

.method private skipTo(Ljava/lang/String;)Z
    .locals 3
    .param p1, "toFind"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 859
    :goto_0
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-le v1, v2, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 860
    :cond_0
    const/4 v0, 0x0

    .local v0, "c":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 861
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_1

    .line 859
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    goto :goto_0

    .line 860
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 865
    :cond_2
    const/4 v1, 0x1

    .line 867
    .end local v0    # "c":I
    :goto_2
    return v1

    :cond_3
    const/4 v1, 0x0

    goto :goto_2
.end method

.method private skipToEndOfLine()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 849
    :cond_0
    iget v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->limit:I

    if-lt v1, v2, :cond_1

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 850
    :cond_1
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->buffer:[C

    iget v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->pos:I

    aget-char v0, v1, v2

    .line 851
    .local v0, "c":C
    const/16 v1, 0xd

    if-eq v0, v1, :cond_2

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 855
    .end local v0    # "c":C
    :cond_2
    return-void
.end method

.method private syntaxError(Ljava/lang/String;)Ljava/io/IOException;
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1160
    new-instance v0, Lcom/robotoworks/mechanoid/internal/util/MalformedJsonException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->getColumnNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/internal/util/MalformedJsonException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public beginArray()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->expect(Lcom/robotoworks/mechanoid/internal/util/JsonToken;)V

    .line 282
    return-void
.end method

.method public beginObject()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->expect(Lcom/robotoworks/mechanoid/internal/util/JsonToken;)V

    .line 298
    return-void
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 538
    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 539
    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 540
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 541
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->stack:Ljava/util/List;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->CLOSED:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 543
    return-void
.end method

.method public endArray()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->expect(Lcom/robotoworks/mechanoid/internal/util/JsonToken;)V

    .line 290
    return-void
.end method

.method public endObject()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 305
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->expect(Lcom/robotoworks/mechanoid/internal/util/JsonToken;)V

    .line 306
    return-void
.end method

.method public hasNext()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 323
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 324
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLenient()Z
    .locals 1

    .prologue
    .line 273
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->lenient:Z

    return v0
.end method

.method public nextBoolean()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 428
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 429
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BOOLEAN:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v1, v2, :cond_0

    .line 430
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a boolean but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 433
    :cond_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    const-string v2, "true"

    if-ne v1, v2, :cond_1

    const/4 v0, 0x1

    .line 434
    .local v0, "result":Z
    :goto_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 435
    return v0

    .line 433
    .end local v0    # "result":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextDouble()D
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 462
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 463
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v3, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v3, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v2, v3, :cond_0

    .line 464
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected a double but was "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 467
    :cond_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 468
    .local v0, "result":D
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 469
    return-wide v0
.end method

.method public nextInt()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 515
    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v5, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v4, v5, :cond_0

    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v5, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v4, v5, :cond_0

    .line 516
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Expected an int but was "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 521
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 530
    .local v3, "result":I
    :cond_1
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 531
    return v3

    .line 522
    .end local v3    # "result":I
    :catch_0
    move-exception v2

    .line 523
    .local v2, "ignored":Ljava/lang/NumberFormatException;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 524
    .local v0, "asDouble":D
    double-to-int v3, v0

    .line 525
    .restart local v3    # "result":I
    int-to-double v4, v3

    cmpl-double v4, v4, v0

    if-eqz v4, :cond_1

    .line 526
    new-instance v4, Ljava/lang/NumberFormatException;

    iget-object v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public nextLong()J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 483
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 484
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v6, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v3, v6, :cond_0

    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v6, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v3, v6, :cond_0

    .line 485
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected a long but was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 490
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 499
    .local v4, "result":J
    :cond_1
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 500
    return-wide v4

    .line 491
    .end local v4    # "result":J
    :catch_0
    move-exception v2

    .line 492
    .local v2, "ignored":Ljava/lang/NumberFormatException;
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 493
    .local v0, "asDouble":D
    double-to-long v4, v0

    .line 494
    .restart local v4    # "result":J
    long-to-double v6, v4

    cmpl-double v3, v6, v0

    if-eqz v3, :cond_1

    .line 495
    new-instance v3, Ljava/lang/NumberFormatException;

    iget-object v6, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    invoke-direct {v3, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public nextName()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 393
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NAME:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v1, v2, :cond_0

    .line 394
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a name but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 396
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->name:Ljava/lang/String;

    .line 397
    .local v0, "result":Ljava/lang/String;
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 398
    return-object v0
.end method

.method public nextNull()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 446
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 447
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NULL:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v0, v1, :cond_0

    .line 448
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected null but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 451
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 452
    return-void
.end method

.method public nextString()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 411
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v1, v2, :cond_0

    .line 412
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a string but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 415
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->value:Ljava/lang/String;

    .line 416
    .local v0, "result":Ljava/lang/String;
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 417
    return-object v0
.end method

.method public peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 331
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eqz v3, :cond_1

    .line 332
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    .line 362
    :cond_0
    :goto_0
    return-object v1

    .line 335
    :cond_1
    sget-object v3, Lcom/robotoworks/mechanoid/internal/util/JsonReader$1;->$SwitchMap$com$robotoworks$mechanoid$internal$util$JsonScope:[I

    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peekStack()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    move-result-object v4

    invoke-virtual {v4}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 367
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 337
    :pswitch_0
    sget-object v3, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 338
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextValue()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    .line 339
    .local v1, "firstToken":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->lenient:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v4, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v3, v4, :cond_0

    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    sget-object v4, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v3, v4, :cond_0

    .line 340
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected JSON document to start with \'[\' or \'{\' but was "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 345
    .end local v1    # "firstToken":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    :pswitch_1
    invoke-direct {p0, v6}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextInArray(Z)Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 347
    :pswitch_2
    invoke-direct {p0, v5}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextInArray(Z)Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 349
    :pswitch_3
    invoke-direct {p0, v6}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextInObject(Z)Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 351
    :pswitch_4
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->objectValue()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 353
    :pswitch_5
    invoke-direct {p0, v5}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextInObject(Z)Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 356
    :pswitch_6
    :try_start_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextValue()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v2

    .line 357
    .local v2, "token":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->lenient:Z

    if-eqz v3, :cond_2

    move-object v1, v2

    .line 358
    goto :goto_0

    .line 360
    :cond_2
    const-string v3, "Expected EOF"

    invoke-direct {p0, v3}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 361
    .end local v2    # "token":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    :catch_0
    move-exception v0

    .line 362
    .local v0, "e":Ljava/io/EOFException;
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->token:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    goto :goto_0

    .line 365
    .end local v0    # "e":Ljava/io/EOFException;
    :pswitch_7
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "JsonReader is closed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 335
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public setLenient(Z)V
    .locals 0
    .param p1, "lenient"    # Z

    .prologue
    .line 266
    iput-boolean p1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->lenient:Z

    .line 267
    return-void
.end method

.method public skipValue()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 551
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipping:Z

    .line 553
    const/4 v0, 0x0

    .line 555
    .local v0, "count":I
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->advance()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v1

    .line 556
    .local v1, "token":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v1, v2, :cond_1

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->BEGIN_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v1, v2, :cond_3

    .line 557
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 561
    :cond_2
    :goto_0
    if-nez v0, :cond_0

    .line 563
    iput-boolean v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipping:Z

    .line 565
    return-void

    .line 558
    :cond_3
    :try_start_1
    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-eq v1, v2, :cond_4

    sget-object v2, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->END_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v1, v2, :cond_2

    .line 559
    :cond_4
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 563
    .end local v1    # "token":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    :catchall_0
    move-exception v2

    iput-boolean v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->skipping:Z

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1001
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " near "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->getSnippet()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
