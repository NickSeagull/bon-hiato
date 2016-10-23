module ProductOwner.Update exposing (..)

import Messages exposing (Msg(..), ProductOwnerMsg(..))
import Model exposing (Model, Location(..), POLocation(..))

update : ProductOwnerMsg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        POHome ->
            ( { model | currentLocation = ProductOwnerLocation Home }, Cmd.none)
        ManagePriorities ->
            ( { model | currentLocation = ProductOwnerLocation PriorityManagement }, Cmd.none )
        EditUserStories ->
            ( { model | currentLocation = ProductOwnerLocation UserStoryManagement }, Cmd.none )
        -- _ -> ( model, Cmd.none)
