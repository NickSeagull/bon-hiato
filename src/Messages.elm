module Messages exposing ( Msg (..)
                         , LoginMsg (..)
                         , ProductOwnerMsg (..)
                         )

type Msg
    = LMsg LoginMsg
    | POMsg ProductOwnerMsg
    | DMsg DeveloperMsg
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
