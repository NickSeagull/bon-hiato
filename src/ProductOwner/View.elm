module ProductOwner.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Materialize.Materialize as Materialize

view : Model -> Html msg
view model =
    Materialize.container []
              [ Materialize.row []
                    [ Materialize.col "s12" 
                          []
                          [ p [ class "dashboard-title" ] 
                              [ text <| greetUser model ]
                          ]
                    ]
              ]

greetUser : Model -> String
greetUser model =
    model.username ++ " - Dashboard"
