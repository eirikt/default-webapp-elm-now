module View exposing (view)

import Html exposing (Html, article, div, footer, header, hr, section, span, text)
import Model exposing (Model)


headerSection : Model -> Html Never
headerSection model =
    header []
        [ div []
            [ span [] [ text (model.title ++ " | " ++ model.edition) ]
            ]
        , hr [] []
        ]


mainSection : Model -> Html Never
mainSection model =
    section [] [ text model.content ]


footerSection : Model -> Html Never
footerSection model =
    footer []
        [ hr [] []
        , div []
            [ span [] [ text (model.title ++ " v" ++ model.version) ]
            ]
        ]


view : Model -> Html Never
view model =
    article []
        [ headerSection model
        , mainSection model
        , footerSection model
        ]
