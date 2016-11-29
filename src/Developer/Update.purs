module Developer.Update (update) where

import Prelude
import Common.Model (Member(..))
import Model (DLocation(..))

import Model
import Messages

update :: DeveloperMsg -> Model -> Model
update DHome model =
           model {currentLocation = DeveloperLocation DeveloperHome}
