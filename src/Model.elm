module Model exposing 
    ( Model
    , Location(..)
    , User(..)
    )

type alias Model =
    { currentLocation: Location
    , loggedAs: User
    }

type Location
    = Login
    | ProductOwnerHome
    | ScrumMasterHome
    | DeveloperHome

type User
    = ProductOwner String
    | ScrumMaster String
    | Developer String
    | NotLogged
