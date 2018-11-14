# frozen_string_literal: true

require 'bigdecimal'
require 'http'
require 'oga'

# Excepted XML is like:
#   <indice_gazole>
#     <cap>
#       <cap_mois>
#         <titre>05-2017</titre>
#         <routier>0,77%</routier>
#         <aerien>0,00%</aerien>
#       </cap_mois>
#       ...
#     </cap>
#   <indice_gazole>
class ColissimoFuelAdjustmentCoefficients
  def initialize
    @document = ::Oga.parse_xml response.to_s
    @cap = @document.at_xpath('indice_gazole/cap/cap_mois') ||
           Oga::XML::Element.new
  end

  def url
    'https://www.colissimo.entreprise.laposte.fr/fr/system/files/imagescontent/docs/indice_gazole.xml'
  end

  def time_period
    el = @cap.at_xpath('titre')
    return unless el

    el.text
  end

  def air_multiplier
    format_multiplier 'aerien'
  end

  def road_multiplier
    format_multiplier 'routier'
  end

  private

  def response
    ::HTTP.timeout(10).get(url)
  rescue HTTP::Error
    ''
  end

  def format_multiplier(kind)
    el = @cap.at_css(kind)
    return unless el

    multiplier = el.text
    multiplier.tr!('%', '')
    multiplier.tr!(',', '.')

    number = (multiplier.to_f / 100 + 1).round(4)
    BigDecimal(number.to_s)
  end
end
