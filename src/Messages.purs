module Messages where

import Data.Maybe (Maybe)
import Model (User, Project)

data Msg
    = LMsg LoginMsg
    | POMsg ProductOwnerMsg
    | DMsg DeveloperMsg
    | SMMsg ScrumMasterMsg
    | Logout

data LoginMsg
    = PerformLogin
    | WriteUser String
    | WritePass String
    | LoginSuccess User
    | LoginError

data ProductOwnerMsg
    = ManagePriorities
    | EditUserStories
    | POHome (Maybe Project)

data DeveloperMsg
    = DHome (Maybe Project)

data ScrumMasterMsg
    = SMHome (Maybe Project)
    | Estimation
    | RiskManagement
    | TaskAssignation
    | DataVisualization
    | AddTask
    | EditTask
