module Messages where

import Model (User)

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
    | POHome

data DeveloperMsg
    = DHome

data ScrumMasterMsg
    = SMHome
    | Estimation
    | RiskManagement
    | TaskAssignation
    | DataVisualization
    | AddTask
    | EditTask
