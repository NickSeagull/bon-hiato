module Model where

import Data.Maybe (Maybe(..))

type Model =
    { currentLocation :: Location
    , loggedAs :: User
    , username :: String
    , password :: String
    , currentError :: String
    , projects :: Array Project
    , currentProject :: Maybe Project
    }

type Project =
    {name :: String
    ,myTasks :: Array Task
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
    | AddTaskPage
    | EditTaskPage

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
  { currentProject : Nothing
  ,  currentLocation : Login
  , loggedAs : NotLogged
  , username : ""
  , password : ""
  , currentError : ""
  , projects : [ { name : "GS1", myTasks : mockTasks}, {name : "NASA Project", myTasks : []},{name : "Hacking the Kernel", myTasks : []}]
  }
