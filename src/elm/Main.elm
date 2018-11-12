module Main exposing (main)

import Browser
import Model exposing (Model)
import View


update : Never -> Model -> Model
update msg model =
    -- Never invoked ('init' is the only "update", no user events yet)
    Model.emptyModel


main : Program () Model Never
main =
    Browser.sandbox
        { init = Model.initialModel
        , view = View.view
        , update = update
        }
