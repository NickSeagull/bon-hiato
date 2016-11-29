module Developer.View where

import Data.Maybe (Maybe(..))
import Prelude hiding (div)

import Pux.Html hiding (map)
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
        , div [ className "row"] [taskView model]
        ] model

taskView :: Model -> Html Msg
taskView model=
    table [] $
        (tr []
            [ th []
                [ text "ID" ]
            , th []
                [ text "Name" ]
            , th []
                [ text "Logged hours" ]
            , th []
                [ text "" ]
            ]
        ) : renderCurrentTasks model.currentProject

renderCurrentTasks :: Maybe Project -> Array (Html Msg)
renderCurrentTasks Nothing = []
renderCurrentTasks (Just project) = map renderTask project.myTasks

renderTask :: Task -> Html Msg
renderTask task =
       tr []
        [ td []
            [ text $ show task.taskId ]
        , td []
            [ text task.taskName ]
        , td []
            [ text $ show task.taskLogHours]
        , td []
            [ text "" ]
        ]

greetUser :: Model -> String
greetUser model =
    model.username <> " - Dashboard"
