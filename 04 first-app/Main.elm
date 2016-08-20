module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import String

-- model


type alias Model =
    { calories : Int, increment : Int, error : Maybe String }


initModel : Model
initModel =
    { calories = 0, increment = 0, error = Nothing }



-- update


type Msg
    = SetIncrement String
    | AddCalories
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetIncrement input ->
            case String.toInt input of
                Ok val ->
                    { model | increment = val, error = Nothing }

                Err err ->
                    { model | increment = 0, error = Just err }

        AddCalories ->
            { model | calories = model.calories + model.increment, increment = 0 }

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.calories)) ]
        , div []
            [ input
                [ type' "text"
                , onInput SetIncrement
                , value
                    (if model.increment == 0 then
                        ""
                     else
                        toString model.increment
                    )
                ]
                []
            ]
        , p []
            [ (Maybe.withDefault "" model.error) |> text ]
        , div []
            [ button
                [ type' "button"
                , onClick AddCalories
                ]
                [ text "Add" ]
            , button
                [ type' "button"
                , onClick Clear
                ]
                [ text "Clear" ]
            ]
        , p []
            [ model |> toString |> text ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
