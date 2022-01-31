module Main exposing (..)
import Browser 
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main = 
    Browser.sandbox {init = init, update = update, view = view}

type alias Model = 
    { content : String }

init : Model 
init = 
    { content = "" }

type Msg = 
    Change String

update : Msg -> Model -> Model 
update msg model = 
    case msg of 
        Change newContent ->
            { model | content = newContent }

view : Model -> Html Msg 
view model = 
    div []
    [ input [placeholder "Add Text here", value model.content, onInput Change][],
    div [] [ text (String.reverse model.content)]
    ]

