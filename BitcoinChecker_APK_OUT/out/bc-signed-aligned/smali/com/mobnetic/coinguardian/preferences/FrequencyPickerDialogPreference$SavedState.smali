.class Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;
.super Landroid/preference/Preference$BaseSavedState;
.source "FrequencyPickerDialogPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field baseFrequencyMillis:J

.field viewFrequencyMillis:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 244
    new-instance v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState$1;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState$1;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 229
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 231
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->baseFrequencyMillis:J

    .line 232
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->viewFrequencyMillis:J

    .line 233
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 223
    invoke-direct {p0, p1}, Landroid/preference/Preference$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 225
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->viewFrequencyMillis:J

    .line 226
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 237
    invoke-super {p0, p1, p2}, Landroid/preference/Preference$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 239
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->baseFrequencyMillis:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 240
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->viewFrequencyMillis:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 241
    return-void
.end method
