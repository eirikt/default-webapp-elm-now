module Main exposing (main)

import Browser
import Html


main =
    Browser.sandbox
        { init = "Default Webapp | Elm & ZEIT Now edition [v0.7.4]"
        , view = \model -> Html.text model

        -- Never invoked ('init' is the only "update", no user events yet)
        , update = \msg -> \model -> "N/A"
        }
