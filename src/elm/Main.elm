module Main exposing (main)

import Browser
import Model exposing (Model)
import View


update : Never -> Model -> Model
update msg model =
    -- Never invoked ('init' is the only "update", no user events yet)
    Model.invalid


main : Program () Model Never
main =
    Browser.sandbox
        { init = Model.default
        , view = View.view
        , update = update
        }
