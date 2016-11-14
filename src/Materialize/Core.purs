module Materialize.Core where

import Prelude hiding (div)

import Pux.Html hiding (map)
import Pux.Html.Attributes
import Data.Array

genericWrapper :: forall msg
                . String
               -> Array (Attribute msg)
               -> Array (Html msg)
               -> Html msg
genericWrapper cls attrs content =
    div ( className cls : attrs )
        content

container :: forall msg . Array (Attribute msg) -> Array (Html msg) -> Html msg
container attrs content = genericWrapper "container" attrs content

row :: forall msg . Array (Attribute msg) -> Array (Html msg) -> Html msg
row attrs content = genericWrapper "row" attrs content

col :: forall msg . String -> Array (Attribute msg) -> Array (Html msg) -> Html msg
col size attrs content = genericWrapper ("col " <> size) attrs content

navbar :: forall msg . String -> Array (Attribute msg) -> Array (Html msg) -> Html msg
navbar brandLogo attrs c=
    nav
        []
        [ genericWrapper "nav-wrapper" []
            [ a [ className "left brand-logo" ] [text brandLogo]
            , ul [ id_ ""
                 , className "right"
                 ]
                 (map (\e -> li [] [e]) c)
            ]
        ]
