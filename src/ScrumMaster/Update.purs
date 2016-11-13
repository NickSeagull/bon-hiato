module ScrumMaster.Update (update) where

import Prelude
import Messages (Msg(..), ScrumMasterMsg(..))
import Model (Model, Location(..), SMLocation(..))

update :: ScrumMasterMsg -> Model.Model -> (Model.Model Cmd Msg)
update msg model =
    case msg of
        Estimation ->
            ( model { currentLocation = ScrumMasterLocation EstimationPage } Cmd.none )
        RiskManagement ->
            ( model { currentLocation = ScrumMasterLocation RiskManagementPage } Cmd.none )
        TaskAssignation ->
            ( model { currentLocation = ScrumMasterLocation TaskAssignationPage } Cmd.none)
        DataVisualization ->
            ( model { currentLocation = ScrumMasterLocation DataVisualizationPage } Cmd.none)
        _ -> ( model Cmd.none)
