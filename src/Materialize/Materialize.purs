module Materialize.Materialize ( container
         , row
         , col
         , navbar
         ) where


import Pux.Html
import Pux.Html.Attributes

genericWrapper :: String
              -> List (Attribute msg)
              -> List (Html msg)
              -> Html msg
genericWrapper cls attrs content =
    div ( className cls :: attrs )
        content

container :: List (Attribute msg) -> List (Html msg) -> Html msg
container attrs content = genericWrapper "container" attrs content

row :: List (Attribute msg) -> List (Html msg) -> Html msg
row attrs content = genericWrapper "row" attrs content

col :: String -> List (Attribute msg) -> List (Html msg) -> Html msg
col size attrs content = genericWrapper ("col " ++ size) attrs content

navbar :: String -> List (Attribute msg) -> List (Html msg) -> Html msg
navbar brandLogo attrs content =
    nav
        []
        [ genericWrapper "nav-wrapper" []
            [ a [ className "left brand-logo" ] [text brandLogo]
            , ul [ id "" -- nav-mobile"
                 , className "right"
                 ]
                 (List.map (\e -> li [] [e]) content)
            ]
        ]
