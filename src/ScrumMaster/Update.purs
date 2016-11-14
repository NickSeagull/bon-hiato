module ScrumMaster.Update (update) where

import Prelude
import Messages (Msg(..), ScrumMasterMsg(..))
import Model (Model, Location(..), SMLocation(..))

update :: ScrumMasterMsg -> Model -> Model
update msg model =
    case msg of
        Estimation ->
            model { currentLocation = ScrumMasterLocation EstimationPage }
        RiskManagement ->
            model { currentLocation = ScrumMasterLocation RiskManagementPage }
        TaskAssignation ->
            model { currentLocation = ScrumMasterLocation TaskAssignationPage }
        DataVisualization ->
            model { currentLocation = ScrumMasterLocation DataVisualizationPage }
        _ -> model
