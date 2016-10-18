module Update exposing (..)

import Common.Model as Model exposing (Model)

type Msg
  = NoOp


update : Msg -> Model.Model -> (Model.Model, Cmd a)
update msg model =
  case msg of
    NoOp -> (model, Cmd.none)
