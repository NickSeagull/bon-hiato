module Materialize.Materialize
    exposing ( container
             , row
             , col
             )

import Html exposing (..)
import Html.Attributes exposing (..)

genericWrapper : String 
              -> List (Attribute msg) 
              -> List (Html msg)
              -> Html msg
genericWrapper cls attrs content =
    div ( class cls :: attrs )
        content
        
container : List (Attribute msg) -> List (Html msg) -> Html msg 
container attrs content = genericWrapper "container" attrs content

row : List (Attribute msg) -> List (Html msg) -> Html msg 
row attrs content = genericWrapper "row" attrs content

col : String -> List (Attribute msg) -> List (Html msg) -> Html msg 
col size attrs content = genericWrapper ("col " ++ size) attrs content


