module ScrumMaster.Update (update) where

import Prelude
import Messages (Msg(..), ScrumMasterMsg(..))
import Model (Location(..), Model, SMLocation(..))

update :: ScrumMasterMsg -> Model -> Model
update msg model =
    case msg of
        SMHome ->
            model { currentLocation = ScrumMasterLocation ScrumMasterHome}
        EditTask ->
            model { currentLocation = ScrumMasterLocation EditTaskPage }
        AddTask ->
            model { currentLocation = ScrumMasterLocation AddTaskPage }
        Estimation ->
            model { currentLocation = ScrumMasterLocation EstimationPage }
        RiskManagement ->
            model { currentLocation = ScrumMasterLocation RiskManagementPage }
        TaskAssignation ->
            model { currentLocation = ScrumMasterLocation TaskAssignationPage }
        DataVisualization ->
            model { currentLocation = ScrumMasterLocation DataVisualizationPage }
        _ -> model
