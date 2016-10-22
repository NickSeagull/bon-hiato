module ProductOwner.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Materialize.Materialize as Materialize
import Messages exposing (Msg(..), ProductOwnerMsg(..))

view : Model -> Html Msg
view model = 
    div [] 
        [
        Materialize.navbar 
            (a [class "brand-logo"] [ text "Bon Hiato" ] )
            []
            [ a [ onClick <| POMsg ManagePriorities ] [ text "Manage priorities" ]
            , a [ onClick <| POMsg EditUserStories ] [ text "User stories" ]
            ]
        ]

greetUser : Model -> String
greetUser model =
    model.username ++ " - Dashboard"
