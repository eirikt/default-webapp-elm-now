module Main exposing (main)

import Browser
import Model exposing (Model, Msg(..))
import View


update : Msg -> Model -> Model
update msg model =
    case msg of
        Background color ->
            { model | backgroundColor = color }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = Model.default
        , view = View.view
        , update = update
        }
