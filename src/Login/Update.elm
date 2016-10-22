module Login.Update exposing (update)

import Model exposing (..)
import Messages exposing (Msg(..), LoginMsg(..))

update : LoginMsg -> Model.Model -> (Model.Model, Cmd Msg)
update msg model =
    case msg of
        PerformLogin -> 
            performLogin model

        WriteUser user ->
            ( { model | username = user } , Cmd.none )

        WritePass pass ->
            ( { model | password = pass } , Cmd.none )

performLogin : Model.Model -> (Model.Model, Cmd Msg)
performLogin model =
    case model.username of
        "productOwner" -> 
            ( { model | loggedAs = Model.ProductOwner "Pepe el PO"
                      , currentLocation = Model.ProductOwnerLocation Model.ProductOwnerHome
              }
            , Cmd.none
            )

        "scrumMaster" -> 
            ( { model | loggedAs = Model.ScrumMaster "Sancho el SM"
                      , currentLocation = Model.ScrumMasterLocation Model.ScrumMasterHome
              }
            , Cmd.none
            )

        "developer" -> 
            ( { model | loggedAs = Model.Developer "Dario el D" 
                      , currentLocation = Model.DeveloperLocation Model.DeveloperHome
              }
            , Cmd.none
            )

        _ ->
            ( { model | currentError = "Use productOwner, scrumMaster or developer as username for logging in" }
            , Cmd.none
            )

makeCmd : Msg -> Cmd Msg
makeCmd msg = Cmd.map (\_ -> msg) Cmd.none
