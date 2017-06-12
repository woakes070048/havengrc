module Regulation.Rest exposing (..)

import Http
import Json.Decode as Decode exposing (Decoder, field, succeed)
import Json.Encode as Encode
import Regulation.Types exposing (..)
import Types exposing (..)


regulationDecoder : Decoder Regulation
regulationDecoder =
    Decode.map4 Regulation
        (field "id" Decode.int)
        (field "identifier" Decode.string)
        (field "uri" Decode.string)
        (field "description" Decode.string)


dummyDescription : String
dummyDescription =
    """For God's sake, let us sit upon the ground. And tell
sad stories of the death of Kings."""


encodeRegulation : Model -> Encode.Value
encodeRegulation model =
    Encode.object
        [ ( "identifier", Encode.string "dummyID" )
        , ( "uri", Encode.string "http://example.com" )
        , ( "description", Encode.string dummyDescription )
        ]


regulationsUrl : String
regulationsUrl =
    "http://localhost:3001/regulation"


getRegulations : Cmd Msg
getRegulations =
    let
        _ =
            Debug.log "getRegulations called"
    in
        (Decode.list regulationDecoder)
            |> Http.get regulationsUrl
            |> Http.send NewRegulations


postRegulation : Model -> Cmd Msg
postRegulation model =
    let
        url =
            "http://localhost:3001/regulation"

        body =
            encodeRegulation model
                |> Http.jsonBody

        _ =
            Debug.log "postRegulation called"

        request =
            Http.request
                { method = "POST"
                , headers = []
                , url = url
                , body = body
                , expect = Http.expectString
                , timeout = Nothing
                , withCredentials = False
                }
    in
        Http.send NewRegulation request
