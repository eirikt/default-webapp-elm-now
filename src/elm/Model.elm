module Model exposing (Model, default, invalid)


type alias Model =
    { title : String
    , edition : String
    , version : String
    , content : String
    }


default : Model
default =
    { title = "Default Webapp"
    , edition = "Elm & ZEIT Now edition"
    , version = "0.7.8"
    , content = "{content}"
    }


invalid : Model
invalid =
    --{ title = "N/A"
    --, edition = ""
    --, version = ""
    --, content = ""
    --}
    Model "N/A" "" "" ""
