# frozen_string_literal: true

require "bigdecimal"
require "http"
require "rexml/document"

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
  include REXML

  def initialize
    @parsed_values = {}
    return unless xml_root

    caps  = xml_root.elements.first
    month = caps.elements.first
    month.elements.each do |element|
      @parsed_values[element.name] = element.text
    end
  end

  def url
    "https://www.colissimo.entreprise.laposte.fr/fr/system/files/imagescontent/docs/indice_gazole.xml"
  end

  def time_period
    @parsed_values["titre"]
  end

  def air_multiplier
    format_multiplier @parsed_values["aerien"]
  end

  def road_multiplier
    format_multiplier @parsed_values["routier"]
  end

  private

  def response
    ::HTTP.timeout(10).get(url)
  rescue HTTP::Error
    ""
  end

  def xml_root
    doc = Document.new response.to_s
    doc.root
  end

  def format_multiplier(value)
    return unless value

    value.tr!("%", "")
    value.tr!(",", ".")

    number = (value.to_f / 100 + 1).round(4)
    BigDecimal(number.to_s)
  end
end
