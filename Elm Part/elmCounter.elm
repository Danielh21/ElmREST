import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode

type alias Model
  = { counter : String }

type Msg
    = Init
    | Get
    | Set
    | AfterGet (Result Http.Error String)
    | AfterPut (Result Http.Error String)




view model =
    div []
      [ button [ onClick Get ] [ text "Get"]
      , button [ onClick Set ] [ text  "Set"]
      , div [ ] [text (toString model.counter)] 
      ]




-- Get Method --
getNumFromServer :  Cmd Msg
getNumFromServer =
    let
      url = "http://localhost:3000/counter/"
    in
      Http.send AfterGet (Http.getString url )
-- End Get Method---

-- Put Method---

setNumOnServer: String -> Cmd Msg
setNumOnServer input =
    let
     request = Http.request
      { method = "PUT"
      , headers = []
      , url = "http://localhost:3000/counter/" ++ input
      , body = Http.emptyBody
      , expect = Http.expectString
      , timeout = Nothing
      , withCredentials = False
      }
    in
      Http.send AfterPut request
    
--End Put Method --


update : Msg -> Model -> ( Model, Cmd Msg ) 
update msg model = 
  case msg of
    Init ->
      (model, Cmd.none)
    Get ->
      (model, getNumFromServer)
    AfterGet 
      (Ok value) -> (Model value, Cmd.none)
    AfterGet  
      (Err _) -> (model, Cmd.none)
    Set ->
      (model, setNumOnServer "1")
    AfterPut
      (Ok value) -> (model, Cmd.none)
    AfterPut
      (Err _) -> (model, Cmd.none)

main =
  Html.program
  { init = (Model "3", Cmd.none), 
  view = view, 
  update = update, 
  subscriptions = \x -> Sub.none
  }