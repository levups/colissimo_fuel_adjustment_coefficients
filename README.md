# Colissomi Fuel Adjustment Coefficients fetcher

Retrieve current air and road rates applied to Colissimo shipping costs and
convert them to multipliers we can directly use in our shipping cost
calculators.

## Usage

Install the gem :

    $ gem install colissimo_fuel_adjustment_coefficients

Run the gem :

    $ colissimo_fuel_adjustment_coefficients

Get the result :

    # Fuel multipliers for 'May 2017'
    # Fetched from https://www.colissimo.entreprise.laposte.fr/en/ajustement-petrol
    # and https://www.colissimo.entreprise.laposte.fr/fr/system/files/imagescontent/docs/indice_gazole.xml

    AIR_FUEL_MULTIPLIER  = 1.0000
    ROAD_FUEL_MULTIPLIER = 0.7700
