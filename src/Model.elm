module Model exposing 
    ( Model
    , Location(..)
    , User(..)
    , POLocation(..)
    , SMLocation(..)
    , DLocation(..)
    , initialModel
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
    = Home
    | PriorityManagement
    | UserStoryManagement

type SMLocation
    = ScrumMasterHome
    | EstimationPage
    | RiskManagementPage
    | TaskAssignationPage
    | DataVisualizationPage

type DLocation
    = DeveloperHome

type User
    = ProductOwner String
    | ScrumMaster String
    | Developer String
    | NotLogged

initialModel : Model
initialModel = { currentLocation = Login
         , loggedAs = NotLogged 
         , username = ""
         , password = ""
         , currentError = ""
         }
