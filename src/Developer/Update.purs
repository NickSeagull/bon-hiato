module Developer.Update (update) where

import Prelude
import Common.Model (Member(..))
import Model (DLocation(..))

import Model
import Messages

update :: DeveloperMsg -> Model -> Model
update DHome model =
           model {currentLocation = DeveloperLocation DeveloperHome}


{-
public Model update (DeveloperMsg d, Model model){
  if (d == new DHome())
    return model.setCurrentLocatio(new DeveloperLocation(new DeveloperHome()));
  else
    ....
}
-}
