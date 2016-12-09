module ProductOwner.View where

import Pux.Html
import Pux.Html.Attributes
import Pux.Html.Events
import Model
import Data.Array
import Materialize.Core as Materialize
import Data.Maybe (Maybe(Just))
import Messages (Msg(..), ProductOwnerMsg(..))
import Prelude hiding (div)

view :: Model -> Html Msg
view model =
    case model.currentLocation of
        ProductOwnerLocation Home ->
            home model
        ProductOwnerLocation PriorityManagement ->
            priorityManagement model
        ProductOwnerLocation UserStoryManagement ->
            editUserStories model
        _ -> home model


template :: Model -> Array (Html Msg) -> Html Msg
template model content =
    div [ className "center" ]
        (( Materialize.navbar
            (greetUser model)
            []
            [ a [ onClick (const $ POMsg $ POHome model.currentProject) ] [ text "Home" ]
            , a [ onClick (const $ POMsg ManagePriorities) ] [ text "Manage priorities" ]
            , a [ onClick (const $ POMsg EditUserStories) ] [ text "User stories" ]
            , a [ onClick (const Logout) ] [ text "Logout" ]
            ] )
        : content)

home :: Model -> Html Msg
home model =
    template model
        [ p [] [ text $ projectName model ] ]

projectName :: Model -> String
projectName model =
    case model.currentProject of
        Just p -> p.name
        _      -> "No Project"

priorityManagement :: Model -> Html Msg
priorityManagement model =
    template model
        [ table []
            [ tr []
                [ th []
                    [ text "ID" ]
                , th []
                    [ text "Name" ]
                , th []
                    [ text "Initial effort" ]
                , th []
                    [ text "" ]
                ]
            , tr []
                [ td []
                    [ text "TEST-01" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "4" ]
                ]
            , tr []
                [ td []
                    [ text "TEST-02" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "1" ]
                ]
            , tr []
                [ td []
                    [ text "TEST-03" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "5" ]
                ]

            , tr []
                [ td []
                    [ text "TEST-04" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "2" ]
                ]
            ]
        ]

editUserStories :: Model -> Html Msg
editUserStories model =
    template model
        [ table []
            [ tr []
                [ th []
                    [ text "ID" ]
                , th []
                    [ text "Name" ]
                , th []
                    [ text "Description" ]
                ]
            , tr []
                [ td []
                    [ text "TEST-01" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "Hodor hodor hodor hodor." ]
                , td []
                    [ text "Edit   Delete" ]
                ]
            , tr []
                [ td []
                    [ text "TEST-02" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "Hodor hodor hodor hodor." ]
                , td []
                    [ text "Edit   Delete" ]
                ]
            , tr []
                [ td []
                    [ text "TEST-03" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "Hodor hodor hodor hodor." ]
                , td []
                    [ text "Edit   Delete" ]
                ]

            , tr []
                [ td []
                    [ text "TEST-04" ]
                , td []
                    [ text "Test" ]
                , td []
                    [ text "Hodor hodor hodor hodor." ]
                , td []
                    [ text "Edit   Delete" ]
                ]
            ]
        ]

greetUser :: Model -> String
greetUser model =
    model.username <> " - Dashboard"
