# Get default sample rate
SampleRate ← &asr

# Generates enough samples for n seconds of playing
SamplesForTimei ← ÷:⇡×⟜:SampleRate

# Args: value, amount
Repeat ← ▽¤:

# Blend channels together
#
# XXX: May be wrong, but works for my cases
CombinedChannel ← /+

ReadWavFile ← ◌°&ae&frab

# Macro that allows different ways of combining two samples list
#
# Args: binary function, overlap length, list1, list2
# Connect! ← ⊂⊂⊙^!⊃(⊃(↙|↘)-:⧻,|⋅⊃(↙|↘):)
Connect! ← ⊂⊂⊙^!∩⊃(↙|↘)⊃(-:⧻,|⊙◌)

# Deterministically shuffle list
#
# NOTE: I'm not sure that this function satisfies required properties, e.g is
# always generates unique random number.
#
# TODO: Just distribute evenly instead of random shuffle.
Shuffle ← ⊏⍏[◌⍥gen:0]⧻.

# Args: Speed coefficient (float), list length (nat)
# Returns: mask
CreateNewSpeedMask ↚ ⬚0+⊃(Repeat 1⁅×-⌊.|Repeat ⌊)

# Change speed of samples buy adding or removing samples based on the new speed coefficient.
# Args: Speed (float), Samples (list)
#
# Speed in range [0, 1) means speed up, and [1, inf) means slow down.
ChangeSpeed ← ▽ Shuffle CreateNewSpeedMask :⧻,

# Samples

Silence ← Repeat 0 ×:SampleRate

AmenBreak ← CombinedChannel ReadWavFile "./samples/amen_break.wav"

# Copied from uiua site

Sp ↚ 1.5
Bass ← (
  +110×20⌊÷4◿8. # Choose note
  ±∿×π×÷Sp,     # Square wave
  ×2+1⌊◿2.:     # Modulation frequency
  ×0.2∿×π××:    # Apply modulation
)
Kick ← ∿×τ×40√√◿1
Noise ← [⍥⚂10000]
Hit ← ×↯:Noise △. ×⊓><0.5,0.6 ÷⟜◿2
Hat ← ×0.3×↯:Noise △.<0.1 ÷⟜◿0.25
