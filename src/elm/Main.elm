module Main exposing (main)

import Browser
import Html exposing (Html)


type alias Model =
    String


initialModel : Model
initialModel =
    "Default Webapp | Elm & ZEIT Now edition [v0.7.5]"


view : Model -> Html Never
view model =
    Html.text model


update : Never -> Model -> Model
update msg model =
    -- Never invoked ('init' is the only "update", no user events yet)
    "N/A"


main : Program () Model Never
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
