module Login.View where


import Pux.Html
import Pux.Html.Attributes
import Pux.Html.Events
import Model
import Messages (Msg(..), LoginMsg(..))

view :: Model -> Html Msg
view model =
  div [ className "valign-wrapper"]
      [ div [ className "valign center-block" ]
            [ h1 [ className "center-align" ] [ text "Bon Hiato - Login" ]
            , p [ className "center-align loginError" ]
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
            , a [ className "center-align waves-effect waves-light btn"
                , onClick <| LMsg PerformLogin ]
                [ text "Login" ]
            ]
      ]

loginError :: Model -> String
loginError m =
    if m.currentError == ""
    then ""
    else "Login failure: " ++ m.currentError

writeUser :: String -> Msg
writeUser s = LMsg <| WriteUser s

writePass :: String -> Msg
writePass s = LMsg <| WritePass s
