module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Model exposing (Model)
import Update exposing (Msg)

view : Model -> Html Msg
view model =
  div [ class "valign-wrapper"]
      [ div [ class "valign center-block" ]
            [ h1 [] [ text "Bon Hiato - Login" ]
            , input [ type' "text", placeholder "User" ]
                    []
            , input [ type' "password" ]
                    []
            , a [ class "center-align waves-effect waves-light btn" ]
                [ text "Login" ]
            ]
      ]
