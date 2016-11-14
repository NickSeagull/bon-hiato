module Developer.View where

import Prelude hiding (div)

import Pux.Html
import Pux.Html.Attributes
import Pux.Html.Events
import Model
import Materialize.Core as Materialize
import Messages
import Data.Array

view :: Model -> Html Msg
view model =
    case model.currentLocation of
        _ -> home model

template :: Array (Html Msg) -> Model -> Html Msg
template content model =
    div [ className "center" ]
        (( Materialize.navbar
            (greetUser model)
            []
            [ a [ onClick (const Logout) ] [ text "Logout" ]
            ] )
        : content)

home :: Model -> Html Msg
home model =
    template
        [ h1 [] [ text "Tasks assigned to me" ]
        , taskView
        ] model

taskView =
    table []
        [ tr []
            [ th []
                [ text "ID" ]
            , th []
                [ text "Name" ]
            , th []
                [ text "Logged hours" ]
            , th []
                [ text "" ]
            ]
        , tr []
            [ td []
                [ text "TEST-01" ]
            , td []
                [ text "Test" ]
            , td []
                [ text "2.5" ]
            , td []
                [ a [ className "waves-effect waves-light btn" ] [ text "Log hours" ] ]
            ]
        , tr []
            [ td []
                [ text "TEST-02" ]
            , td []
                [ text "Test2" ]
            , td []
                [ text "7" ]
            , td []
                [ a [ className "waves-effect waves-light btn" ] [ text "Log hours" ] ]
            ]
        ]

greetUser :: Model -> String
greetUser model =
    model.username <> " - Dashboard"
