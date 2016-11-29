module ScrumMaster.View where

import Pux.Html
import Pux.Html.Attributes
import Pux.Html.Events
import Model
import Data.Array
import Materialize.Core as Materialize
import Messages (Msg(..), ScrumMasterMsg(..))
import Prelude hiding (div)

view :: Model -> Html Msg
view model =
    case model.currentLocation of
        ScrumMasterLocation EditTaskPage ->
            editTask model
        ScrumMasterLocation AddTaskPage ->
            addTask model
        ScrumMasterLocation EstimationPage ->
            estimation model
        ScrumMasterLocation RiskManagementPage ->
            riskManagement model
        ScrumMasterLocation TaskAssignationPage ->
            taskAssignment model
        ScrumMasterLocation DataVisualizationPage ->
            dataVisualization model
        _ -> home model

template :: Model -> Array (Html Msg) -> Html Msg
template model content =
    div [ className "center" ]
        (( Materialize.navbar
            (greetUser model)
            []
            [ a [ onClick (const $ SMMsg SMHome) ] [ text "Home" ]
            , a [ onClick (const $ SMMsg Estimation)] [ text "Estimation" ]
            , a [ onClick (const $ SMMsg RiskManagement) ] [ text "Risk management" ]
            , a [ onClick (const $ SMMsg TaskAssignation) ] [ text "Assign tasks" ]
            , a [ onClick (const $ SMMsg DataVisualization) ] [ text "Data visualization" ]
            , a [ onClick (const $ Logout) ] [ text "Logout" ]
            ] )
          : content)

home :: Model -> Html Msg
home model =
    template model
        [ p [] [ text "Welcome message or data" ] ]

addTask :: Model -> Html Msg
addTask model =
    template model
    [ table []
         [ tr []
             [ th []
                 [ text "ID" ] ,
               th []
                 [ text "Name" ] ,
               th []
                 [ text "Description" ] ,
               th []
                 [ text "Priority" ] ,
               th []
                 [ text "Assigned" ] ]
                 , tr []
                      [ td []
                          [ input [ type_ "text" ] [] ] ,
                        td []
                          [ input [ type_ "text" ] [] ] ,
                        td []
                          [ input [ type_ "text" ] [] ] ,
                        td []
                          [ input [ type_ "text" ] [] ] ,
                        td []
                          [ input [ type_ "text" ] [] ] ,
                        td []
                          [ a [ onClick (const $ SMMsg TaskAssignation) ] [ text "AddTask" ] ] ] ] ]

editTask :: Model -> Html Msg
editTask model =
    template model
        [ table []
             [ tr []
                 [ th []
                     [ text "ID" ] ,
                   th []
                     [ text "Name" ] ,
                   th []
                     [ text "Description" ] ,
                   th []
                     [ text "Priority" ] ,
                   th []
                     [ text "Assigned" ] ]
                     , tr []
                          [ td []
                              [ input [ type_ "text" ] [] ] ,
                            td []
                              [ input [ type_ "text" ] [] ] ,
                            td []
                              [ input [ type_ "text" ] [] ] ,
                            td []
                              [ input [ type_ "text" ] [] ] ,
                            td []
                              [ input [ type_ "text" ] [] ] ,
                            td []
                              [ a [ onClick (const $ SMMsg TaskAssignation) ] [ text "Save" ] ] ] ] ] 
estimation :: Model -> Html Msg
estimation model =
    template model
        [ Materialize.row [] [ h2 [] [text "What do you want to estimate?" ] ]
        , Materialize.row [] [ button [className "btn"] [ text "Sprints" ] ]
        , Materialize.row [] [ button [className "btn"] [ text "Projects" ] ]
        , Materialize.row [] [ button [className "btn"] [ text "Requirements" ] ]
        ]

riskManagement :: Model -> Html Msg
riskManagement model =
    template model
        [ table []
            [ tr []
                [ th []
                    [ text "Event" ]
                , th []
                    [ text "Likelihood" ]
                , th []
                    [ text "Impact" ]
                , th []
                    [ text "Priority" ]
                , th []
                    [ text "Solution" ]
                , th []
                    [ text "How" ]
                , th []
                    [ text "Who" ]
                , th []
                    [ text "By when" ]
                , th []
                    [ ]
                ]
             , tr []
                [ td []
                    [ text "Server failure" ]
                , td []
                    [ text "Very high" ]
                , td []
                    [ text "Very low" ]
                , td []
                    [ text "1" ]
                , td []
                    [ text "Throw the server away" ]
                , td []
                    [ text "I don't know" ]
                , td []
                    [ text "Hodor" ]
                , td []
                    [ text "Tomorrow" ]
                , td []
                    [ button [className "btn"] [text "Edit" ] ]
                ]
            , button [className "btn"] [ text "Add" ]
            ]
        ]

taskAssignment :: Model -> Html Msg
taskAssignment model =
    template model
        [ table []
            [ tr []
                [ th []
                    [ text "ID" ]
                , th []
                    [ text "Name" ]
                , th []
                    [ text "Description" ]
                , th []
                    [ text "Priority" ]
                , th []
                    [ text "Assignee" ]
                , th []
                    [ a [ onClick (const $ SMMsg AddTask) ] [ text "AddTask" ] ]
                ]
             , tr []
                [ td []
                    [ text "TEST-01" ]
                , td []
                    [ text "Get Task Request" ]
                , td []
                    [ text "Implement new get request" ]
                , td []
                    [ text "1" ]
                , td []
                    [ text "Alvaro" ]
                , td []
                    [ a [ onClick (const $ SMMsg EditTask) ] [ text "EditTask" ] ] ]
                , tr []
                   [ td []
                       [ text "TEST-02" ]
                   , td []
                       [ text "Post Task Request" ]
                   , td []
                       [ text "Implement new post request" ]
                   , td []
                       [ text "1" ]
                   , td []
                       [ text "Nick" ]
                   , td []
                       [ a [ onClick (const $ SMMsg EditTask) ] [ text "EditTask" ] ]
                ]
            ]
        ]

dataVisualization :: Model -> Html Msg
dataVisualization model =
    template model
        [ img [ src "img/burndown.jpg" ] [] ]

greetUser :: Model -> String
greetUser model =
    model.username <> " - Dashboard"
