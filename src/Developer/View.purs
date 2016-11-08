module Developer.View where

import Pux
import Pux.Attributes
import Pux.Events
import Model
import Materialize.Materialize as Materialize
import Messages (Msg(..), ProductOwnerMsg(..))

view :: Html -> Msg Model
view model =
    case model.currentLocation of
        _ -> home model

template :: List (Html Msg) -> Model -> Html Msg
template model content =
    div [ className "center" ]
        (( Materialize.navbar
            (greetUser model)
            []
            [ a [ onClick Logout ] [ text "Logout" ]
            ] )
        :: content)

home :: Model -> Html Msg
home model =
    template model
        [ h1 [] [ text "Tasks assigned to me" ]
        , taskView
        ]

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
    model.username ++ " - Dashboard"
