module View exposing (view)

import Html exposing (Html, article, div, footer, header, hr, section, span, text)
import Html.Attributes exposing (class)
import Model exposing (Model)


headerSection : Model -> Html Never
headerSection model =
    header []
        [ div []
            [ span [ class "title" ] [ text model.title ]
            , span [ class "edition" ] [ text (" | " ++ model.edition) ]
            ]
        , hr [] []
        ]


mainSection : Model -> Html Never
mainSection model =
    section [ class "watermark" ] [ text model.content ]


footerSection : Model -> Html Never
footerSection model =
    footer []
        [ hr [] []
        , div []
            [ span [ class "version"] [ text (model.title ++ " v" ++ model.version) ]
            ]
        ]


view : Model -> Html Never
view model =
    article [class "page"]
        [ headerSection model
        , mainSection model
        , footerSection model
        ]
