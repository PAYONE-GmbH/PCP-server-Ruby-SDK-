require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class PaymentChannel < PCPServerSDK::ApiEnum
      ECOMMERCE = "ECOMMERCE".freeze
      POS = "POS".freeze
    end
  end
end
