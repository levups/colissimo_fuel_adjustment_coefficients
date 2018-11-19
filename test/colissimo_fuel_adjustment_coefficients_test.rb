# frozen_string_literal: true

require 'date'
require 'minitest/autorun'
require 'minitest/stub_any_instance'
require 'colissimo_fuel_adjustment_coefficients'

class ColissimoFuelAdjustmentCoefficientsTest < Minitest::Test
  def test_time_period
    nominal_case do
      assert_equal '11-2018', @colissimo.time_period
    end

    failing_case do
      assert_nil @colissimo.time_period
    end
  end

  def test_air_multiplier
    nominal_case do
      assert_equal 1.0301, @colissimo.air_multiplier
    end

    failing_case do
      assert_nil @colissimo.air_multiplier
    end
  end

  def test_road_multiplier
    nominal_case do
      assert_equal 1.0197, @colissimo.road_multiplier
    end

    failing_case do
      assert_nil @colissimo.road_multiplier
    end
  end

  def test_live_values
    live_colissimo = ColissimoFuelAdjustmentCoefficients.new
    colissimo_date = Date.parse live_colissimo.time_period

    assert_equal Date.today.month, colissimo_date.month
    assert_equal Date.today.year, colissimo_date.year

    assert_kind_of BigDecimal, live_colissimo.air_multiplier
    assert_operator live_colissimo.air_multiplier, :>=, 1.0

    assert_kind_of BigDecimal, live_colissimo.road_multiplier
    assert_operator live_colissimo.road_multiplier, :>=, 1.0
  end

  private

  def sample_response
    <<~XML
      <indice_gazole>
        <!-- Tableau indice CAP -->
        <cap>
          <cap_mois>
            <titre>11-2018</titre>
            <routier>1,97%</routier>
            <aerien>3,01%</aerien>
          </cap_mois>
          <cap_mois>
            <titre>10-2018</titre>
            <routier>1,79%</routier>
            <aerien>2,33%</aerien>
          </cap_mois>
        </cap>
      </indice_gazole>
    XML
  end

  def nominal_case
    ColissimoFuelAdjustmentCoefficients.stub_any_instance(:response,
                                                          sample_response) do
      @colissimo = ColissimoFuelAdjustmentCoefficients.new
      yield
    end
  end

  def failing_case
    ColissimoFuelAdjustmentCoefficients.stub_any_instance :response, '' do
      @colissimo = ColissimoFuelAdjustmentCoefficients.new
      yield
    end
  end
end
