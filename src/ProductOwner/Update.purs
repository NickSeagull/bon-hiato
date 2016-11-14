module ProductOwner.Update where

import Prelude
import Messages (Msg(..), ProductOwnerMsg(..))
import Model (Model, Location(..), POLocation(..))

update :: ProductOwnerMsg -> Model -> Model
update msg model =
    case msg of
        POHome ->
            model { currentLocation = ProductOwnerLocation Home }
        ManagePriorities ->
            model { currentLocation = ProductOwnerLocation PriorityManagement }
        EditUserStories ->
            model { currentLocation = ProductOwnerLocation UserStoryManagement }
