module API.Service.API where

import API.Service.Currency.Currency
    ( currencyLatestHandler,
      currencyLatestTickerHandler,
      currencyMetadataHandler,
      currencyMetadataTickerHandler )
import API.Service.Currency.Types ( CurrencyAPI )
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