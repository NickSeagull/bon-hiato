module Login.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)

view : Model -> Html msg
view model =
  div [ class "valign-wrapper"]
      [ div [ class "valign center-block" ]
            [ h1 [] [ text "Bon Hiato - Login" ]
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
