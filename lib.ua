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

---
⍤"Unexpected list generated, expected slowed down" (
  ≍ [1 2 3 3 4 5 5 6 6 7 8 8] ChangeSpeed 1.5 +1 ⇡ 8
)

⍤"Unexpected list generated, expected speeded up" (
  ≍ [3 5 6 8] ChangeSpeed 0.5 +1 ⇡ 8
)

⍤"Unexpected list generated, while same expected" (
  ≍ ⊃(∘|ChangeSpeed 1) +1⇡8
)
---
