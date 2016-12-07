module ProjectSelection.Update (update) where

import Prelude

import Model
import Messages

update :: Model -> LoginMsg -> Model
update model PerformLogin = performLogin model
update model (WriteUser user) = model { username = user }
update model (WritePass pass) = model { password = pass }
update model (ChangeLocation) = model { currentLocation = ProjectScreen }
update model (LoginError) = model { currentLocation = Login }

performLogin :: Model -> Model
performLogin model =
    case model.username of
        "productOwner" ->
            model { loggedAs = { userName : "", userPass : "", userType : ProductOwner "" }
                  , currentLocation = ProductOwnerLocation Home
                  }

        "scrumMaster" ->
            model { loggedAs = { userName : "Sancho el SM", userPass : "", userType :ScrumMaster "" }
                  , currentLocation = ScrumMasterLocation ScrumMasterHome
                  }

        "developer" ->
            model { loggedAs = { userName : "Dario el D", userPass : "", userType : Developer "" }
                  , currentLocation = DeveloperLocation DeveloperHome
                  }

        _ ->
            model { currentError = "Use productOwner, scrumMaster or developer as username for logging in" }
