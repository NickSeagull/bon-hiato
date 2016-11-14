module Messages where

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
