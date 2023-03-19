module API.API where

import qualified Servant.API

{- Define Servant API endpoints for the following:
* GET /cryptocurrency/* - Endpoints that return data around cryptocurrencies such as ordered cryptocurrency lists or price and volume data.

 * GET /cryptocurrency/metadata/#ticker - Endpoint to return metadata about a cryptocurrency. This includes the name, symbol, logo, description, links, and more.
 * GET /cryptocurrency/latest - Returns latest market data for all cryptocurrencies.
 * GET /cryptocurrency/latest/#ticker - Returns latest market data for a specific cryptocurrency.
 * GET /cryptocurrency/latest/#ticker/#convert - Returns latest market data for a specific cryptocurrency in a specific fiat or cryptocurrency.
 * POST /tools/* - Useful utilities such as cryptocurrency and fiat price conversions.

* POST /tools/price-conversion - Endpoint to convert a cryptocurrency amount to a fiat or cryptocurrency amount.

* GET /ping - Endpoint to check if the API is up and running.
-}