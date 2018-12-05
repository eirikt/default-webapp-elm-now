module Main exposing (main)

import Browser
import DateFormatter
import Model exposing (Model, Msg(..), default)
import View


type alias Flags =
    { version : Maybe String
    , timestamp : Maybe Int
    , mode : Maybe String
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { default
        | version = flags.version |> Maybe.withDefault "?"
        , buildTimestamp = flags.timestamp |> DateFormatter.format
        , buildMode = flags.mode |> Maybe.withDefault ""
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Background color ->
            ( { model | backgroundColor = color }, Cmd.none )


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = View.view
        , update = update
        , subscriptions = always Sub.none
        }
