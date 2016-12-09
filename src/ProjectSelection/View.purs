module ProjectSelection.View where


import Pux.Html.Attributes
import Pux.Html.Events
import Model
import Data.Array
import Data.Maybe (Maybe(Just))
import Messages (Msg(..), ScrumMasterMsg(..))
import Messages (Msg(..), ProductOwnerMsg(..))
import Messages (Msg(..), DeveloperMsg(..))
import Messages (Msg(..), LoginMsg(..))
import Pux.Html.Attributes (className)
import Pux.Html.Events (onClick)
import Prelude hiding (div)
import Pux.Html hiding (map)

view :: Model -> Html Msg
view model =
  div [ className "valign-wrapper"]
      [ div [ className "valign center-block" ]
            [ h1 [ className "center-align" ] [ text "Bon Hiato - Project selection" ]
            , ul[]
                $ map (listProject model) model.projects
                , if loggedAsScrumMaster model.loggedAs.userType then
                    a[className "waves-effect waves-light btn"] [text "New Project"]
                  else
                    text ""
            ]
     ]
  where
    loggedAsScrumMaster ProductOwner  = true
    loggedAsScrumMaster _ = false

    loggedUser :: UserType -> Maybe Project -> Model -> Array(Attribute Msg)
    loggedUser ScrumMaster project model =
        [ className "waves-effect waves-light btn"
        , onClick (const $ SMMsg $ SMHome project)
        ]
    loggedUser ProductOwner project model =
        [ className "waves-effect waves-light btn"
        , onClick (const $ POMsg $ POHome project)
        ]
    loggedUser Developer project model =
        [ className "waves-effect waves-light btn"
        , onClick (const $ DMsg $ DHome project)
        ]
    loggedUser _ project model = []

    listProject model project =
      if loggedAsScrumMaster model.loggedAs.userType then
        li[]
        [
          div[className "row"][
            div[className "col s8"][
              a(loggedUser model.loggedAs.userType (Just project) model)[text project.name]
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
            a (loggedUser model.loggedAs.userType (Just project) model)[text project.name]
          ]
