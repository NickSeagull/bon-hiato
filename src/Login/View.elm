module Login.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Login.Update exposing (Msg(..))

view : Model -> Html Msg
view model =
  div [ class "valign-wrapper"]
      [ div [ class "valign center-block" ]
            [ h1 [ class "center-align" ] [ text "Bon Hiato - Login" ]
            , p [ class "center-align loginError" ] 
                [ text <| loginError model ]
            , input [ type' "text"
                    , placeholder "User" 
                    , onInput WriteUser
                    ]
                    []
            , input [ type' "password" 
                    , onInput WritePass
                    ]
                    []
            , a [ class "center-align waves-effect waves-light btn" 
                , onClick PerformLogin ]
                [ text "Login" ]
            ]
      ]
loginError : Model -> String
loginError m = 
    if m.currentError == "" 
    then ""
    else "Login failure: " ++ m.currentError

