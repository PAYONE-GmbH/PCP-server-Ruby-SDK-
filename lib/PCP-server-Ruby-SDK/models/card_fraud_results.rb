
require 'date'
require 'time'
module PCPServerSDK
  module Models
    # Fraud results contained in the CardFraudResults object. 
    class CardFraudResults
      #  Result of the Address Verification Service checks. Possible values are:   * A - Address (Street) matches, Zip does not   * B - Street address match for international transactions—Postal code not verified due to incompatible  formats   * C - Street address and postal code not verified for international transaction due to incompatible formats   * D - Street address and postal code match for international transaction, cardholder name is incorrect   * E - AVS error   * F - Address does match and five digit ZIP code does match (UK only)   * G - Address information is unavailable; international transaction; non-AVS participant   * H - Billing address and postal code match, cardholder name is incorrect (Amex)   * I - Address information not verified for international transaction   * K - Cardholder name matches (Amex)   * L - Cardholder name and postal code match (Amex)   * M - Cardholder name, street address, and postal code match for international transaction   * N - No Match on Address (Street) or Zip   * O - Cardholder name and address match (Amex)   * P - Postal codes match for international transaction—Street address not verified due to incompatible formats   * Q - Billing address matches, cardholder is incorrect (Amex)   * R - Retry, System unavailable or Timed out   * S - Service not supported by issuer   * U - Address information is unavailable   * W - 9 digit Zip matches, Address (Street) does not   * X - Exact AVS Match   * Y - Address (Street) and 5 digit Zip match   * Z - 5 digit Zip matches, Address (Street) does not   * 0 - No service available
      attr_accessor :avs_result

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'avs_result' => :'avsResult'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'avs_result' => :'String'
        }
      end

      # List of attributes with nullable: true
      def self.openapi_nullable
        Set.new([
        ])
      end

      # Initializes the object
      # @param [Hash] attributes Model attributes in the form of hash
      def initialize(attributes = {})
        if (!attributes.is_a?(Hash))
          fail ArgumentError, "The input argument (attributes) must be a hash in `CardFraudResults` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `CardFraudResults`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'avs_result')
          self.avs_result = attributes[:'avs_result']
        end
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            avs_result == o.avs_result
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [avs_result].hash
      end

      # Builds the object from hash
      # @param [Hash] attributes Model attributes in the form of hash
      # @return [Object] Returns the model itself
      def self.build_from_hash(attributes)
        return nil unless attributes.is_a?(Hash)
        attributes = attributes.transform_keys(&:to_sym)
        transformed_hash = {}
        openapi_types.each_pair do |key, type|
          if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = nil
          elsif type =~ /\AArray<(.*)>/i
            # check to ensure the input is an array given that the attribute
            # is documented as an array but the input is not
            if attributes[attribute_map[key]].is_a?(Array)
              transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
            end
          elsif !attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
          end
        end
        new(transformed_hash)
      end

      # Deserializes the data based on type
      # @param string type Data type
      # @param string value Value to be deserialized
      # @return [Object] Deserialized data
      def self._deserialize(type, value)
        case type.to_sym
        when :Time
          Time.parse(value)
        when :Date
          Date.parse(value)
        when :String
          value.to_s
        when :Integer
          value.to_i
        when :Float
          value.to_f
        when :Boolean
          if value.to_s =~ /\A(true|t|yes|y|1)\z/i
            true
          else
            false
          end
        when :Object
          # generic object (usually a Hash), return directly
          value
        when /\AArray<(?<inner_type>.+)>\z/
          inner_type = Regexp.last_match[:inner_type]
          value.map { |v| _deserialize(inner_type, v) }
        when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
          k_type = Regexp.last_match[:k_type]
          v_type = Regexp.last_match[:v_type]
          {}.tap do |hash|
            value.each do |k, v|
              hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
            end
          end
        else # model
          # models (e.g. Pet) or oneOf
          klass = PCPServerSDK::Models.const_get(type)
          klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
        end
      end

      # Returns the string representation of the object
      # @return [String] String presentation of the object
      def to_s
        to_hash.to_s
      end

      # to_body is an alias to to_hash (backward compatibility)
      # @return [Hash] Returns the object in the form of hash
      def to_body
        to_hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        self.class.attribute_map.each_pair do |attr, param|
          value = self.send(attr)
          if value.nil?
            is_nullable = self.class.openapi_nullable.include?(attr)
            next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
          end

          hash[param] = _to_hash(value)
        end
        hash
      end

      # Outputs non-array value in the form of hash
      # For object, use to_hash. Otherwise, just return the value
      # @param [Object] value Any valid value
      # @return [Hash] Returns the value in the form of hash
      def _to_hash(value)
        if value.is_a?(Array)
          value.compact.map { |v| _to_hash(v) }
        elsif value.is_a?(Hash)
          {}.tap do |hash|
            value.each { |k, v| hash[k] = _to_hash(v) }
          end
        elsif value.respond_to? :to_hash
          value.to_hash
        else
          value
        end
      end
    end
  end
end
