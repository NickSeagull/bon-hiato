module ProjectSelection.View where

import Pux.Html.Attributes (className)
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
            [ h1 [ className "center-align" ] [ text "Bon Hiato - Project selection" ]
            , ul[]
                $ map (listProject model) model.projects
 
                ,a[className "waves-effect waves-light btn"] [text "New Project"]
            ]
     ]
  where
    loggedAsScrumMaster (ScrumMaster _) = true
    loggedAsScrumMaster _ = false

    listProject model project =
      if loggedAsScrumMaster model.loggedAs then
        li[]
        [
          div[className "row"][
            div[className "col s8"][
              a[className "waves-effect waves-light btn"][text project.name]
            ]
            ,div [className "col s2"][
              a[className "waves-effect waves-light btn orange"][text "Edit"]
            ]
            ,div [className "col s2"][
              a[className "waves-effect waves-light btn red"][text "Delete"]
            ]
          ]
        ]


      else
        li[]
          [
            a[className "waves-effect waves-light btn"][text project.name]
          ]
