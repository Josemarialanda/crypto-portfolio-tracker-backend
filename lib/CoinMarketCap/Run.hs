module CoinMarketCap.Run where

import CoinMarketCap.Client ()
import CoinMarketCap.Core (globalData)
import CoinMarketCap.Types (FiatSymbol (JPY))
import Data.Aeson (encode)
import qualified Data.ByteString.Lazy as B
import Network.HTTP.Client (newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)

run :: IO ()
run = do
  -- res <- ticker "cardano" $ Nothing
  res <- globalData $ Just JPY
  case res of
    Left err -> putStrLn ("Error: " <> show err)
    Right t -> do
      B.writeFile "out.json" $ encode t
