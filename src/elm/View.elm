module View exposing (view)

import Html exposing (Html)
import Model exposing (Model)


view : Model -> Html Never
view model =
    Html.text model
