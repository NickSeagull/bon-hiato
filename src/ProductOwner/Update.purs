module ProductOwner.Update where

import Prelude
import Messages (Msg(..), ProductOwnerMsg(..))
import Model (Model, Location(..), POLocation(..))

update :: ProductOwnerMsg -> Model -> Model
update (POHome project) model =
            model { currentLocation = ProductOwnerLocation Home , currentProject = project}
update ManagePriorities model =
            model { currentLocation = ProductOwnerLocation PriorityManagement }
update EditUserStories model =
            model { currentLocation = ProductOwnerLocation UserStoryManagement }
