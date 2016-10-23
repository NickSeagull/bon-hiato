module Messages exposing ( Msg (..)
                         , LoginMsg (..)
                         , ProductOwnerMsg (..)
                         , ScrumMasterMsg (..)
                         )

type Msg
    = LMsg LoginMsg
    | POMsg ProductOwnerMsg
    | DMsg DeveloperMsg
    | SMMsg ScrumMasterMsg
    | Logout

type LoginMsg
    = PerformLogin 
    | WriteUser String
    | WritePass String

type ProductOwnerMsg
    = ManagePriorities
    | EditUserStories
    | POHome

type DeveloperMsg
    = DHome

type ScrumMasterMsg
    = SMHome
    | Estimation 
    | RiskManagement
    | TaskAssignation
    | DataVisualization
