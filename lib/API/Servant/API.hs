module API.Servant.API where

import API.Servant.Currency.Currency
    ( currencyLatestHandler,
      currencyLatestTickerHandler,
      currencyMetadataHandler,
      currencyMetadataTickerHandler )
import API.Servant.Currency.Types ( CurrencyAPI )
import Servant ( type (:<|>)(..)
               , Proxy(Proxy)
               , serve
               , Server
               , Application
               )

type Service = CurrencyAPI

server :: Server Service
server = currencyMetadataHandler 
    :<|> currencyMetadataTickerHandler 
    :<|> currencyLatestHandler 
    :<|> currencyLatestTickerHandler

app :: Application
app = serve (Proxy @Service) server