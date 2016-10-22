module Messages exposing ( Msg (..)
                         , LoginMsg (..)
                         , ProductOwnerMsg (..)
                         )

type Msg
    = LMsg LoginMsg
    | POMsg ProductOwnerMsg
    | Logout

type LoginMsg
    = PerformLogin 
    | WriteUser String
    | WritePass String

type ProductOwnerMsg
    = ManagePriorities
    | EditUserStories

