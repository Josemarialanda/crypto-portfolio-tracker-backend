module CoinMarketCap.Client
  ( getTicker,
    getTickers,
    getGlobalData,
  )
where

import CoinMarketCap.API (CoinMarketCapAPI)
import CoinMarketCap.Types
  ( FiatSymbol,
    GlobalData,
    TickerId,
    Tickers,
  )
import Data.Proxy (Proxy (..))
import Servant (type (:<|>) ((:<|>)))
import Servant.Client (ClientM, client)

coinMarketCapAPI :: Proxy CoinMarketCapAPI
coinMarketCapAPI = Proxy

getTicker :: TickerId -> Maybe FiatSymbol -> ClientM Tickers
getTickers :: Maybe Integer -> Maybe Integer -> Maybe FiatSymbol -> ClientM Tickers
getGlobalData :: Maybe FiatSymbol -> ClientM GlobalData
getTicker :<|> getTickers :<|> getGlobalData = client coinMarketCapAPI
