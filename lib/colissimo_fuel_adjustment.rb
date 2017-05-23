# frozen_string_literal: true
require "addressable/uri"
require "httparty"
require "oga"
require "plain_http_client"

# <indice_gazole>
# 	<cap>
# 		<cap_mois>
# 			<titre>05-2017</titre>
# 			<routier>0,77%</routier>
# 			<aerien>0,00%</aerien>
# 		</cap_mois>
#     ...
#   </cap>
# <indice_gazole>
class ColissimoFuelAdjustment
  URL = 'https://www.colissimo.entreprise.laposte.fr/fr/system/files/imagescontent/docs/indice_gazole.xml'

  def initialize
    response = PlainHttpClient.get(url, limit: 3, timeout: 10)
    document = Oga.parse_xml response.body
    @cap = document.xpath("indice_gazole/cap/cap_mois").first
  end

  def time_period
    @cap.at_xpath("titre").text
  end

  def air_multiplier
    format_multiplier @cap.at_css("aerien").text.tr("%", "").tr(",", ".").to_f
  end

  def road_multiplier
    format_multiplier @cap.at_css("routier").text.tr("%", "").tr(",", ".").to_f
  end

  def url
    URL
  end

private

  def format_multiplier(coefficient)
    "%.4f" % (coefficient / 100 + 1)
  end
end
