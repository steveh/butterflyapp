class Service < ActiveRecord::Base

  belongs_to :user

  has_many :parameters, :class_name => "ServiceParameter"

  def provider
    @provider ||= provider_class.new(provider_parameters)
  end

  private

    def provider_class
      "Butterfly::Provider::#{name.classify}".constantize
    end

    def provider_parameters
      parameters.inject({}) { |hash, parameter| hash[parameter.key.to_sym] = parameter.value; hash }
    end

end