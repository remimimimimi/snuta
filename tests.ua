~ "lib.ua" ~ ChangeSpeed

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
