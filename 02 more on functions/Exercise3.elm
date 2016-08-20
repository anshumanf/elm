module Main exposing (..)

import String
import List
import Html


wordCount =
  String.words >> List.length

main =
  let
    sentence = "The quick brown fox jumps over the lazy dog"
  in
    sentence ++ " -- Word count: " ++ (wordCount sentence |> toString) |> Html.text
