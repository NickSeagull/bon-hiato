module ProjectSelection.View where


import Messages (Msg(..), ScrumMasterMsg(..))
import Messages (Msg(..), ProductOwnerMsg(..))
import Messages (Msg(..), DeveloperMsg(..))
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
            [ h1 [ className "center-align" ] [ text "Bon Hiato - Project selection" ]
            , ul[]
                $ map (listProject model) model.projects
                , if loggedAsScrumMaster model.loggedAs then
                    a[className "waves-effect waves-light btn"] [text "New Project"]
                  else
                    text ""
            ]
     ]
  where
    loggedAsScrumMaster (ProductOwner _)  = true
    loggedAsScrumMaster _ = false

    loggedUser :: User -> Model -> Array(Attribute Msg)
    loggedUser (ScrumMaster _) model = [className "waves-effect waves-light btn",
                                        onClick (const $ SMMsg SMHome)]
    loggedUser (ProductOwner _) model = [className "waves-effect waves-light btn",
                                        onClick (const $ POMsg POHome)]
    loggedUser (Developer _) model = [className "waves-effect waves-light btn",
                                        onClick (const $ DMsg DHome)]
    loggedUser _ model = []

    listProject model project =
      if loggedAsScrumMaster model.loggedAs then
        li[]
        [
          div[className "row"][
            div[className "col s8"][
              a(loggedUser model.loggedAs model)[text project.name]
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
            a (loggedUser model.loggedAs model)[text project.name]
          ]
