module ProjectCreation.View where



import Pux.Html.Attributes (className)
import Pux.Html.Events (onClick)
import Prelude hiding (div)

import Pux.Html hiding (map)
import Pux.Html.Attributes
import Pux.Html.Events
import Model
import Messages (Msg(..), LoginMsg(..))
import Data.Array

view :: Model -> Html Msg
view model =
  div [ className "valign-wrapper"]
      [ div [ className "valign center-block" ]
            [ h1 [ className "center-align" ] [ text "Bon Hiato - Project creation" ]
              ,div [className "row"]
                [
                  div [className "col s6"]
                  [
                    input [ type_ "text"
                            , placeholder "Project name"
                            ]
                            []
                  ],
                  div[className "col s6"]
                  [
                    button[][text "Create"]
                  ]
                ]
            ]
     ]
