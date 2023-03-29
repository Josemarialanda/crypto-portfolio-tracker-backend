module CoinMarketCap.Client where

import CoinMarketCap.Types
import Servant ( FromHttpApiData(parseQueryParam), ToHttpApiData(toQueryParam) )
import Data.Text

instance FromHttpApiData AirDropParameters where
  parseQueryParam :: Text -> Either Text AirDropParameters
  parseQueryParam = Right . AirDropParameters

instance ToHttpApiData AirDropParameters where
  toQueryParam :: AirDropParameters -> Text
  toQueryParam (AirDropParameters id) = id

instance FromHttpApiData AirDropsParameters where
  parseQueryParam :: Text -> Either Text AirDropsParameters
  parseQueryParam txt = 

instance ToHttpApiData AirDropsParameters where
  toQueryParam :: AirDropsParameters -> Text
  toQueryParam = undefined

