module API.API where

import qualified Servant.API

{- Define Servant API endpoints for the following:
* GET /currency/* - Endpoints that return data around cryptocurrencies such as ordered currency lists or price and volume data.
 * GET /currency/metadata - Endpoint to return metadata about all cryptocurrencies. This includes the name, symbol, logo, description, links, and more.
 * GET /currency/metadata/#ticker - Endpoint to return metadata about a currency. This includes the name, symbol, logo, description, links, and more.
 * GET /currency/latest - Returns latest market data for all cryptocurrencies.
 * GET /currency/latest/#ticker - Returns latest market data for a specific cryptocurrency.
 * POST /tools/* - Useful utilities such as cryptocurrency and fiat price conversions.
  * POST JSON body /tools/price-conversion - Endpoint to convert a cryptocurrency amount to a fiat or cryptocurrency amount.
* GET /ping - Endpoint to check if the API is up and running.
-}