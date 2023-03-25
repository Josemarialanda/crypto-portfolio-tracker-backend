module CoinMarketCap.API where

import CoinMarketCap.Types (FiatSymbol, GlobalData, Tickers)
import Servant
  ( Capture,
    Get,
    JSON,
    QueryParam,
    type (:<|>),
    type (:>),
  )

type CoinMarketCapAPI =
  "ticker"
    :> Capture "id" String
    :> QueryParam "convert" FiatSymbol
    :> Get '[JSON] Tickers
    :<|> "ticker"
      :> QueryParam "start" Integer
      :> QueryParam "limit" Integer
      :> QueryParam "convert" FiatSymbol
      :> Get '[JSON] Tickers
    :<|> "global"
      :> QueryParam "convert" FiatSymbol
      :> Get '[JSON] GlobalData
