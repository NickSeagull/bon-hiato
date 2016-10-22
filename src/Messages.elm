module Messages exposing ( Msg (..)
                         , LoginMsg (..)
                         , ProductOwnerMsg (..)
                         )

type Msg
    = LMsg LoginMsg
    | POMsg ProductOwnerMsg

type LoginMsg
    = PerformLogin 
    | WriteUser String
    | WritePass String
    | LoginFailed String

type ProductOwnerMsg
    = ManagePriorities
    | EditUserStories

