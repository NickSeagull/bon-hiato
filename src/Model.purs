module Model where

type Model =
    { myTasks :: Array Task
    , currentLocation :: Location
    , loggedAs :: User
    , username :: String
    , password :: String
    , currentError :: String
    }

type Task =
  { taskId :: Int
  , taskName :: String
  , taskLogHours :: Int
  }

data Location
    = Login
    | ProductOwnerLocation POLocation
    | ScrumMasterLocation SMLocation
    | DeveloperLocation DLocation

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

mockTasks = [ {taskId: 1, taskName: "ashdasjd", taskLogHours: 5},{taskId: 2, taskName: "aqwehjdchdahcad", taskLogHours: 7} ]
initialModel :: Model
initialModel =
  { myTasks : mockTasks
  ,  currentLocation : Login
  , loggedAs : NotLogged
  , username : ""
  , password : ""
  , currentError : ""
  }
