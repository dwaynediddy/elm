module Main exposing (..)
import Browser 
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main = 
    Browser.sandbox {init = init, update = update, view = view}

type alias Model = 
    { name : String
    , password : String
    , confirmPassword : String }


init : Model 
init = 
    Model "" "" ""

    -- update

type Msg =
    Name String
    | Password String
    | ConfirmPassword String

update : Msg -> Model -> Model 
update msg model = 
    case msg of 
        Name name ->
            { model | name = name}
        Password password ->
            { model| password = password }
        ConfirmPassword confirmPassword ->
            { model | confirmPassword = confirmPassword }

            -- view

view : Model -> Html Msg 
view model = 
    div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "text" "Password" model.password Password
    , viewInput "text" "re-enter Password" model.confirmPassword ConfirmPassword
    , viewValidation model
    ]

viewInput : String -> String -> String -> (String -> Msg) -> Html Msg
viewInput t p v toMsg =
    input [type_ t, placeholder p, value v, onInput toMsg] []

viewValidation: Model -> Html msg
viewValidation model = 
    if model.password == model.confirmPassword then
        div [style "color" "green"] [text "ok"]
            else
        div [ style "color" "red"] [text "bad"]