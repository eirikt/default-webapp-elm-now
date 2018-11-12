module Model exposing (Model, emptyModel, initialModel)


type alias Model =
    { title : String
    , edition : String
    , version : String
    , content : String
    }


emptyModel : Model
emptyModel =
    { title = "N/A"
    , edition = ""
    , version = ""
    , content = ""
    }


initialModel : Model
initialModel =
    { title = "Default Webapp"
    , edition = "Elm & ZEIT Now edition"
    , version = "0.7.7"
    , content = "{content}"
    }
