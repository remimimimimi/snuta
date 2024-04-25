~ "lib.ua" ~ CombinedChannel ReadWavFile Repeat SampleRate

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
