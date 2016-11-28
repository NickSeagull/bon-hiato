module Model where

type Model =
    { currentLocation :: Location
    , loggedAs :: User
    , username :: String
    , password :: String
    , currentError :: String
    , projects :: Array Project
    }

type Project =
    {name :: String
    }

data Location
    = Login
    | ProductOwnerLocation POLocation
    | ScrumMasterLocation SMLocation
    | DeveloperLocation DLocation
    | ProjectScreen

data POLocation
    = Home
    | PriorityManagement
    | UserStoryManagement

data SMLocation
    = ScrumMasterHome
    | EstimationPage
    | RiskManagementPage
    | TaskAssignationPage
    | DataVisualizationPage

data DLocation
    = DeveloperHome

data User
    = ProductOwner String
    | ScrumMaster String
    | Developer String
    | NotLogged

initialModel :: Model
initialModel =
  { currentLocation : Login
  , loggedAs : NotLogged
  , username : ""
  , password : ""
  , currentError : ""
  , projects : [ { name : "GS1"}, {name : "NASA Project"},{name : "Hacking the Kernel"}
  ,{name : "2G1C Project"} ]
  }
