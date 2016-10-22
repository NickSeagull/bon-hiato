module Login.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Messages exposing (Msg(..), LoginMsg(..))

view : Model -> Html Msg
view model =
  div [ class "valign-wrapper"]
      [ div [ class "valign center-block" ]
            [ h1 [ class "center-align" ] [ text "Bon Hiato - Login" ]
            , p [ class "center-align loginError" ] 
                [ text <| loginError model ]
            , input [ type' "text"
                    , placeholder "User" 
                    , onInput writeUser
                    ]
                    []
            , input [ type' "password" 
                    , onInput writePass
                    ]
                    []
            , a [ class "center-align waves-effect waves-light btn" 
                , onClick <| LMsg PerformLogin ]
                [ text "Login" ]
            ]
      ]

loginError : Model -> String
loginError m = 
    if m.currentError == "" 
    then ""
    else "Login failure: " ++ m.currentError

writeUser : String -> Msg
writeUser s = LMsg <| WriteUser s

writePass : String -> Msg
writePass s = LMsg <| WritePass s
