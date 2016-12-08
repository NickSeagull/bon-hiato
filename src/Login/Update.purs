module Login.Update (update) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Data.Array (filter, head)
import Data.Maybe (Maybe(..))
import Database.LowDB (push, LOWDB, get, connectTo)
import Messages (LoginMsg(..), Msg(..))
import Model (User, Model, EffModel, Location(Login, ProjectScreen), UserType(..))
import Pux (noEffects)
import Debug.Trace

update :: Model -> LoginMsg -> EffModel ( lowdb :: LOWDB ) Msg
update model PerformLogin = performLogin model
update model (WriteUser user) = noEffects $ model { username = user }
update model (WritePass pass) = noEffects $ model { password = pass }
update model (LoginSuccess u) = noEffects $ model { currentLocation = ProjectScreen, loggedAs = u }
update model (LoginError) = noEffects $ model { currentLocation = Login, currentError = "Wrong username or password" }

performLogin :: Model -> EffModel ( lowdb :: LOWDB ) Msg
performLogin model =
    { state : model
    , effects : [ liftEff $ checkWithDatabase model]
    }

checkWithDatabase ::  forall e. Model -> Eff ( lowdb :: LOWDB | e ) Msg
checkWithDatabase model = do
    conn <- connectTo "bonhiato.json" Nothing
    dbUsers <- get conn "users"
    let users = filter (userIsCorrect model) <<< map decodeUser $ dbUsers
    let u = head $ filter (userIsCorrect model) $ users
    case u of
        Just user -> pure $ LMsg (LoginSuccess user)
        Nothing   -> pure $ LMsg LoginError

decodeUser :: { userType :: String, userName :: String , userPass :: String} -> User
decodeUser u = 
    case u.userType of
        "Developer" -> { userName : u.userName, userPass : u.userPass,  userType : Developer "" }
        "ScrumMaster" -> { userName : u.userName, userPass : u.userPass,  userType : ScrumMaster "" }
        "ProductOwner" -> { userName : u.userName, userPass : u.userPass,  userType : ProductOwner "" }
        _ -> { userName : u.userName, userPass : u.userPass,  userType : NotLogged }

userIsCorrect :: Model -> User -> Boolean
userIsCorrect m u = u.userName == m.username && u.userPass == m.password
