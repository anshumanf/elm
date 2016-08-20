module Main exposing (..)

import String
import Html


(~=) s1 s2 =
    (String.left 1 s1) |> (==) (String.left 1 s2)


main =
    let
        s1 =
            "Mulder"

        s2 =
            "Scully"

        s3 =
            "Muldoon"
    in
        s1 ++ " ~= " ++ s3 ++ " " ++ (s1 ~= s3 |> toString) |> Html.text
