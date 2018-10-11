.class final Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState$1;
.super Ljava/lang/Object;
.source "FrequencyPickerDialogPreference.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 247
    new-instance v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;

    invoke-direct {v0, p1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 244
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 252
    new-array v0, p1, [Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 244
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState$1;->newArray(I)[Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;

    move-result-object v0

    return-object v0
.end method
