module Main exposing (..)

import Html
import String


upperCaseIfLongerThan n s =
    if String.length s > n then
        String.toUpper s
    else
        s


upperCaseIfLongerThan10 =
    upperCaseIfLongerThan 10


main =
    let
        name =
            "Anshuman Fotedar"

        strLength =
            String.length name
    in
        upperCaseIfLongerThan10 name ++ " - name length : " ++ (toString strLength) |> Html.text
