module Login.Update (update) where

import Prelude
import Database.LowDB
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import DOM.HTML.Event.EventTypes (open)
import Data.Array (any)
import Data.Maybe (Maybe(..))
import Messages (LoginMsg(..), Msg(..))
import Model (DLocation(..), EffModel(..), Location(..), Model, User(..))
import Pux (noEffects)

update :: Model -> LoginMsg -> EffModel ( lowdb :: LOWDB )
update model PerformLogin = performLogin model
update model (WriteUser user) = noEffects $ model { username = user }
update model (WritePass pass) = noEffects $ model { password = pass }
update model (ChangeLocation) = noEffects $ model { currentLocation = ProjectScreen }
update model (LoginError) = noEffects $ model { currentLocation = Login }

performLogin :: Model -> EffModel ( lowdb :: LOWDB )
performLogin model =
    { state : model
    , effects : [ liftEff $ checkWithDatabase model]
    }

checkWithDatabase ::  forall e. Model -> Eff ( lowdb :: LOWDB | e ) Msg
checkWithDatabase model = do
    conn <- connectTo "bonhiato.json" Nothing
    users :: Array User <- get conn "users"
    if any (userIsCorrect model) users
        then pure $ LMsg ChangeLocation
        else pure $ LMsg LoginError

userIsCorrect :: Model -> User -> Boolean
userIsCorrect m u = u.userName == m.username && u.userPass == m.password
