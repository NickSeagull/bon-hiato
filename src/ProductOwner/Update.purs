module ProductOwner.Update where

import Prelude
import Messages (Msg(..), ProductOwnerMsg(..))
import Model (Model, Location(..), POLocation(..))

update :: ProductOwnerMsg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        POHome ->
            ( model { currentLocation = ProductOwnerLocation Home }, Cmd.none)
        ManagePriorities ->
            ( model { currentLocation = ProductOwnerLocation PriorityManagement }, Cmd.none )
        EditUserStories ->
            ( model { currentLocation = ProductOwnerLocation UserStoryManagement }, Cmd.none )
        -- _ -> ( model, Cmd.none)
--https://github.com/NickSeagull/bon-hiato.git
