module API.Ping where
import Servant

-- This module contains the types for the endpoints in the /ping namespace.
-- * GET /ping - Endpoint to check if the API is up and running.

type Ping = "ping" :> Get '[JSON] ()