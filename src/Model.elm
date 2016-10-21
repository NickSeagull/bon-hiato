module Model exposing 
    ( Model
    , Location(..)
    , User(..)
    , POLocation(..)
    , SMLocation(..)
    , DLocation(..)
    )

type alias Model =
    { currentLocation: Location
    , loggedAs: User
    , username: String
    , password: String
    , currentError: String
    }

type Location
    = Login
    | ProductOwnerLocation POLocation
    | ScrumMasterLocation SMLocation
    | DeveloperLocation DLocation

type POLocation
    = ProductOwnerHome

type SMLocation
    = ScrumMasterHome

type DLocation
    = DeveloperHome

type User
    = ProductOwner String
    | ScrumMaster String
    | Developer String
    | NotLogged
