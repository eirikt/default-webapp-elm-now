module Model exposing (Model, Msg(..), backgroundColors, default)


type alias Model =
    { title : String
    , edition : String
    , version : String
    , buildTimestamp : String
    , buildMode : String
    , backgroundColor : String
    , content : String
    }


type Msg
    = Background String


default : Model
default =
    { title = "Default Webapp"
    , edition = "Elm & ZEIT Now edition"
    , version = "?"
    , buildTimestamp = "?"
    , buildMode = "?"
    , backgroundColor = "white"
    , content = "{content}"
    }


{-| CSS-compatible background colors.
A list of the colors can be viewed e.g. here:
<https://developer.mozilla.org/en-US/docs/Web/CSS/color_value>
-}
backgroundColors : List String
backgroundColors =
    [ "white"
    , "khaki"
    , "coral"
    , "peru"
    , "mediumSeaGreen"
    , "skyBlue"
    , "lightSlateGrey"
    ]
