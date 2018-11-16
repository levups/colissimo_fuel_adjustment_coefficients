# Colissimo Fuel Adjustment Coefficients fetcher

Retrieve current air and road rates applied to Colissimo shipping costs and
convert them to multipliers we can directly use in your app to calculate
precise shipping costs?

## Usage

Install the gem:

    $ gem install colissimo_fuel_adjustment_coefficients

Run the gem:

    $ colissimo_fuel_adjustment_coefficients

Get the result:

    # Fuel multipliers for 05-2017
    # Fetched from https://www.colissimo.entreprise.laposte.fr/fr/system/files/imagescontent/docs/indice_gazole.xml

    AIR_FUEL_MULTIPLIER  = 1.0000
    ROAD_FUEL_MULTIPLIER = 1.0077

Or use it in your app:

    require 'colissimo_fuel_adjustment_coefficients'

    colissimo = ColissimoFuelAdjustmentCoefficients.new
    colissimo.road_multiplier      # 0.10077e1
    colissimo.air_multiplier       # 0.1e1
