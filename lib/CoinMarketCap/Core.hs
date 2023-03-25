module CoinMarketCap.Core where

import CoinMarketCap.Client
  ( getGlobalData,
    getTicker,
    getTickers,
  )
import CoinMarketCap.Types
  ( FiatSymbol,
    GlobalData,
    Ticker,
    TickerId,
    Tickers,
  )
import Network.HTTP.Client (Manager, newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Servant.Client
  ( BaseUrl (BaseUrl),
    ClientEnv,
    ClientError,
    ClientM,
    Scheme (Https),
    mkClientEnv,
    runClientM,
  )

clientEnv :: IO ClientEnv
clientEnv = do
  manager' <- newManager tlsManagerSettings
  return $ mkClientEnv manager' (BaseUrl Https "api.coinmarketcap.com" 443 "/v1")

getTicker' :: TickerId -> Maybe FiatSymbol -> ClientM Ticker
getTicker' tickerId symbol = do
  tickers <- getTicker tickerId symbol
  return $ head tickers

tickers :: Maybe Integer -> Maybe Integer -> Maybe FiatSymbol -> IO (Either ClientError Tickers)
tickers start limit symbol = do
  clientEnv' <- clientEnv
  runClientM (getTickers start limit symbol) clientEnv'

ticker :: TickerId -> Maybe FiatSymbol -> IO (Either ClientError Ticker)
ticker tickerId symbol = do
  clientEnv' <- clientEnv
  runClientM (getTicker' tickerId symbol) clientEnv'

globalData :: Maybe FiatSymbol -> IO (Either ClientError GlobalData)
globalData symbol = do
  clientEnv' <- clientEnv
  runClientM (getGlobalData symbol) clientEnv'
