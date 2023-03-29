{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module CoinMarketCap.Types where
import Servant
import Data.Text

-- Currency datatypes
data FxCurrencyCode coinMarketCapID where
  USD :: FxCurrencyCode 2781 -- United States Dollar
  ALL :: FxCurrencyCode 3526 -- Albanian Lek
  DZD :: FxCurrencyCode 3537 -- Algerian Dinar
  ARS :: FxCurrencyCode 2821 -- Argentine Peso
  AMD :: FxCurrencyCode 3527 -- Armenian Dram
  AUD :: FxCurrencyCode 2782 -- Australian Dollar
  AZN :: FxCurrencyCode 3528 -- Azerbaijani Manat
  BHD :: FxCurrencyCode 3531 -- Bahraini Dinar
  BDT :: FxCurrencyCode 3530 -- Bangladeshi Taka
  BYN :: FxCurrencyCode 3533 -- Belarusian Ruble
  BMD :: FxCurrencyCode 3532 -- Bermudan Dollar
  BOB :: FxCurrencyCode 2832 -- Bolivian Boliviano
  BAM :: FxCurrencyCode 3529 -- Bosnian Convertible Mark
  BRL :: FxCurrencyCode 2783 -- Brazilian Real
  BGN :: FxCurrencyCode 2814 -- Bulgarian Lev
  KHR :: FxCurrencyCode 3549 -- Cambodian Riel
  CAD :: FxCurrencyCode 2784 -- Canadian Dollar
  CLP :: FxCurrencyCode 2786 -- Chilean Peso
  CNY :: FxCurrencyCode 2787 -- Chinese Yuan
  COP :: FxCurrencyCode 2820 -- Colombian Peso
  CRC :: FxCurrencyCode 3534 -- Costa Rican Colón
  HRK :: FxCurrencyCode 2815 -- Croatian Kuna
  CUP :: FxCurrencyCode 3535 -- Cuban Peso
  CZK :: FxCurrencyCode 2788 -- Czech Republic Koruna
  DKK :: FxCurrencyCode 2789 -- Danish Krone
  DOP :: FxCurrencyCode 3536 -- Dominican Peso
  EGP :: FxCurrencyCode 3538 -- Egyptian Pound
  EUR :: FxCurrencyCode 2790 -- Euro
  GEL :: FxCurrencyCode 3539 -- Georgian Lari
  GHS :: FxCurrencyCode 3540 -- Ghanaian Cedi
  GTQ :: FxCurrencyCode 3541 -- Guatemalan Quetzal
  HNL :: FxCurrencyCode 3542 -- Honduran Lempira
  HKD :: FxCurrencyCode 2792 -- Hong Kong Dollar
  HUF :: FxCurrencyCode 2793 -- Hungarian Forint
  ISK :: FxCurrencyCode 2818 -- Icelandic Króna
  INR :: FxCurrencyCode 2796 -- Indian Rupee
  IDR :: FxCurrencyCode 2794 -- Indonesian Rupiah
  IRR :: FxCurrencyCode 3544 -- Iranian Rial
  IQD :: FxCurrencyCode 3543 -- Iraqi Dinar
  ILS :: FxCurrencyCode 2795 -- Israeli New Sheqel
  JMD :: FxCurrencyCode 3545 -- Jamaican Dollar
  JPY :: FxCurrencyCode 2797 -- Japanese Yen
  JOD :: FxCurrencyCode 3546 -- Jordanian Dinar
  KZT :: FxCurrencyCode 3551 -- Kazakhstani Tenge
  KES :: FxCurrencyCode 3547 -- Kenyan Shilling
  KWD :: FxCurrencyCode 3550 -- Kuwaiti Dinar
  KGS :: FxCurrencyCode 3548 -- Kyrgystani Som
  LBP :: FxCurrencyCode 3552 -- Lebanese Pound
  MKD :: FxCurrencyCode 3556 -- Macedonian Denar
  MYR :: FxCurrencyCode 2800 -- Malaysian Ringgit
  MUR :: FxCurrencyCode 2816 -- Mauritian Rupee
  MXN :: FxCurrencyCode 2799 -- Mexican Peso
  MDL :: FxCurrencyCode 3555 -- Moldovan Leu
  MNT :: FxCurrencyCode 3558 -- Mongolian Tugrik
  MAD :: FxCurrencyCode 3554 -- Moroccan Dirham
  MMK :: FxCurrencyCode 3557 -- Myanmar Kyat
  NAD :: FxCurrencyCode 3559 -- Namibian Dollar
  NPR :: FxCurrencyCode 3561 -- Nepalese Rupee
  TWD :: FxCurrencyCode 2811 -- New Taiwan Dollar
  NZD :: FxCurrencyCode 2802 -- New Zealand Dollar
  NIO :: FxCurrencyCode 3560 -- Nicaraguan Córdoba
  NGN :: FxCurrencyCode 2819 -- Nigerian Naira
  NOK :: FxCurrencyCode 2801 -- Norwegian Krone
  OMR :: FxCurrencyCode 3562 -- Omani Rial
  PKR :: FxCurrencyCode 2804 -- Pakistani Rupee
  PAB :: FxCurrencyCode 3563 -- Panamanian Balboa
  PEN :: FxCurrencyCode 2822 -- Peruvian Nuevo Sol
  PHP :: FxCurrencyCode 2803 -- Philippine Peso
  PLN :: FxCurrencyCode 2805 -- Polish Zloty
  GBP :: FxCurrencyCode 2791 -- Pound Sterling
  QAR :: FxCurrencyCode 3564 -- Qatari Rial
  RON :: FxCurrencyCode 2817 -- Romanian Leu
  RUB :: FxCurrencyCode 2806 -- Russian Ruble
  SAR :: FxCurrencyCode 3566 -- Saudi Riyal
  RSD :: FxCurrencyCode 3565 -- Serbian Dinar
  SGD :: FxCurrencyCode 2808 -- Singapore Dollar
  ZAR :: FxCurrencyCode 2812 -- South African Rand
  KRW :: FxCurrencyCode 2798 -- South Korean Won
  SSP :: FxCurrencyCode 3567 -- South Sudanese Pound
  VES :: FxCurrencyCode 3573 -- Venezuelan Bolívar Soberano
  LKR :: FxCurrencyCode 3553 -- Sri Lankan Rupee
  SEK :: FxCurrencyCode 2807 -- Swedish Krona
  CHF :: FxCurrencyCode 2785 -- Swiss Franc
  THB :: FxCurrencyCode 2809 -- Thai Baht
  TTD :: FxCurrencyCode 3569 -- Trinidad and Tobago Dollar
  TND :: FxCurrencyCode 3568 -- Tunisian Dinar
  TRY :: FxCurrencyCode 2810 -- Turkish Lira
  UGX :: FxCurrencyCode 3570 -- Ugandan Shilling
  UAH :: FxCurrencyCode 2824 -- Ukrainian Hryvnia
  AED :: FxCurrencyCode 2813 -- United Arab Emirates Dirham
  UYU :: FxCurrencyCode 3571 -- Uruguayan Peso
  UZS :: FxCurrencyCode 3572 -- Uzbekistan Som
  VND :: FxCurrencyCode 2823 -- Vietnamese Dong

data PMCurrencyCode coinMarketCapID where
  XAU :: PMCurrencyCode 3575 -- Gold Troy Ounce
  XAG :: PMCurrencyCode 3574 -- Silver Troy Ounce
  XPT :: PMCurrencyCode 3577 -- Platinum Ounce
  XPD :: PMCurrencyCode 3576 -- Palladium Ounce

data CurrencyCode coinMarketCapID = Either (FxCurrencyCode coinMarketCapID) (PMCurrencyCode coinMarketCapID)

-- Error codes
data ErrorResponse httpStatus errorCode errorMsg where
  API_KEY_INVALID                         :: ErrorResponse 401 1001 "This API Key is invalid."
  API_KEY_MISSING                         :: ErrorResponse 401 1002 "API key missing."
  API_KEY_PLAN_REQUIRES_PAYEMENT          :: ErrorResponse 402 1003 "Your API Key must be activated. Please go to pro.coinmarketcap.com/account/plan."
  API_KEY_PLAN_PAYMENT_EXPIRED            :: ErrorResponse 402 1004 "Your API Key's subscription plan has expired."
  API_KEY_REQUIRED                        :: ErrorResponse 403 1005 "An API Key is required for this call."
  API_KEY_PLAN_NOT_AUTHORIZED             :: ErrorResponse 403 1006 "Your API Key subscription plan doesn't support this endpoint."
  API_KEY_DISABLED                        :: ErrorResponse 403 1007 "This API Key has been disabled. Please contact support."
  API_KEY_PLAN_MINUTE_RATE_LIMIT_REACHED  :: ErrorResponse 429 1008 "You've exceeded your API Key's HTTP request rate limit. Rate limits reset every minute."
  API_KEY_PLAN_DAILY_RATE_LIMIT_REACHED   :: ErrorResponse 429 1009 "You've exceeded your API Key's daily rate limit."
  API_KEY_PLAN_MONTHLY_RATE_LIMIT_REACHED :: ErrorResponse 429 1010 "You've exceeded your API Key's monthly rate limit."
  IP_RATE_LIMIT_REACHED                   :: ErrorResponse 429 1011 "You've hit an IP rate limit."

-- | API versions
type V1 = "v1"
type V2 = "v1"

-- | API parameters
newtype AirDropParameters = AirDropParameters
  { adp'id :: Text
  }

data AirDropsParameters = AirDropsParameters
  { adps'start  :: Int
  , adps'limit  :: Int
  , adps'status :: Text
  , adps'id     :: Text
  , adps'slug   :: Text
  , adps'symbol :: Text
  }

-- API top-level categories
type Cryptocurrency = "cryptocurrency"
type Exchange       = "exchange"
type GlobalMetrics  = "global-metrics"
type Tools          = "tools"
type Blockchain     = "blockchain"
type Fiat           = "fiat"
type Partners       = "partners"
type Key            = "key"
type Content        = "content"

-- Endpoint paths follow a pattern matching the type of data provided
type Latest     = "latest"
type Historical = "historical"
type Info       = "Info"
type Map        = "map"

-- API endpoints

-- | Cryptocurrency endpoints
type AirDrop = V1 :> Cryptocurrency :> "airdrop" :> QueryParam "id" AirDropParameters :> Get '[JSON] ()