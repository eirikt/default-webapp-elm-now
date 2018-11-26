module View exposing (view)

import Html exposing (Html, article, button, div, footer, header, hr, section, span, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))


backgroundColorButton : String -> Html Msg
backgroundColorButton backgroundColor =
    div
        [ class "background-color-button"
        , style "background" backgroundColor
        , onClick (Background backgroundColor)
        ]
        []


headerSection : Model -> Html Msg
headerSection model =
    header []
        [ div []
            [ span [ class "title" ] [ text model.title ]
            , span [ class "edition" ] [ text (" | " ++ model.edition) ]
            ]
        , hr [] []
        ]


mainSection : Model -> Html Msg
mainSection model =
    section []
        [ div [ class "watermark" ] [ text model.content ]
        , div [ class "background-color-picker" ] (List.map backgroundColorButton Model.backgroundColors)
        ]


footerSection : Model -> Html Msg
footerSection model =
    footer []
        [ hr [] []
        , div [] [ span [ class "version" ] [ text (model.title ++ " v" ++ model.version) ] ]
        ]


view : Model -> Html Msg
view model =
    article [ style "background" model.backgroundColor ]
        [ headerSection model
        , mainSection model
        , footerSection model
        ]
