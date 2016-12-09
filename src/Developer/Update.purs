module Developer.Update (update) where

import Prelude
import Model
import Messages
import Data.Maybe (Maybe(Just))
import Model (DLocation(..))

update :: DeveloperMsg -> Model -> Model
update (DHome project) model =
           model {currentLocation = DeveloperLocation DeveloperHome, currentProject = project}
