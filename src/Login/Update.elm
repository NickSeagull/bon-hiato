module Login.Update exposing (update, Msg(..))

import Model exposing (Model, User(..))

type Msg
    = PerformLogin 
    | WriteUser String
    | WritePass String
    | LoginFailed String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        PerformLogin -> 
            performLogin model

        WriteUser user ->
            { model | username = user }

        WritePass pass ->
            { model | password = pass } 

        _ ->
            (model, Cmd.none)

performLogin : String -> String -> Model -> (Model, Cmd Msg)
performLogin user password model =
    case model.username of
        "productOwner" -> 
            ( { model | loggedAs = ProductOwner "Pepe el PO"
                      , location = ProductOwnerHome
              }
            , Cmd.none
            )

        "scrumMaster" -> 
            ( { model | loggedAs = ScrumMaster "Sancho el SM"
                      , location = ScrumMasterHome
              }
            , Cmd.none
            )

        "developer" -> 
            ( { model | loggedAs = Developer "Dario el D" 
                      , location = DeveloperHome
              }
            , Cmd.none
            )

        _ ->
            ( model
            , makeCmd <| LoginFailed "Use productOwner, scrumMaster or developer"
            )

makeCmd : Msg -> Cmd Msg
makeCmd msg = Cmd.map (\_ -> msg) Cmd.none
