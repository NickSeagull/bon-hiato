module Login.View where

import Prelude hiding (div)

import Pux.Html
import Pux.Html.Attributes
import Pux.Html.Events
import Model
import Messages (Msg(..), LoginMsg(..))
import Data.Array

view :: Model -> Html Msg
view model =
  div [ className "valign-wrapper"]
      [ div [ className "valign center-block" ]
            [ h1 [ className "center-align" ] [ text "Bon Hiato - Login" ]
            , p [ className "center-align loginError" ]
                [ text $ loginError model ]
            , input [ type_ "text"
                    , placeholder "User"
                    , onInput writeUser
                    ]
                    []
            , input [ type_ "password"
                    , onInput writePass
                    ]
                    []
            , a [ className "center-align waves-effect waves-light btn"
                , onClick ( const $ LMsg PerformLogin) ]
                [ text "Login" ]
            ]
      ]

loginError :: Model -> String
loginError m =
    if m.currentError == ""
    then ""
    else "Login failure: " <> m.currentError

writeUser :: FormEvent -> Msg
writeUser s = LMsg $ WriteUser s.target.value

writePass :: FormEvent -> Msg
writePass s = LMsg $ WritePass s.target.value
