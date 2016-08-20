module Main exposing (..)

import Html


cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


setFreeQty minQty freeQty item =
    if item.freeQty == 0 && item.qty >= minQty then
        { item | freeQty = freeQty }
    else
        item


main =
    let
        discountedCart =
            List.map (setFreeQty 10 3 >> setFreeQty 5 1) cart
    in
        discountedCart |> toString |> Html.text
