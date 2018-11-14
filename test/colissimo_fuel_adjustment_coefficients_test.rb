# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/stub_any_instance'
require 'colissimo_fuel_adjustment_coefficients'

class ColissimoFuelAdjustmentCoefficientsTest < Minitest::Test
  def test_time_period
    nominal_case do
      assert_equal '11-2018', @adjustement_coefficient.time_period
    end

    failing_case do
      assert_nil @adjustement_coefficient.time_period
    end
  end

  def test_air_multiplier
    nominal_case do
      assert_equal 1.0301, @adjustement_coefficient.air_multiplier
    end

    failing_case do
      assert_nil @adjustement_coefficient.air_multiplier
    end
  end

  def test_road_multiplier
    nominal_case do
      assert_equal 1.0197, @adjustement_coefficient.road_multiplier
    end

    failing_case do
      assert_nil @adjustement_coefficient.road_multiplier
    end
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
      @adjustement_coefficient = ColissimoFuelAdjustmentCoefficients.new
      yield
    end
  end

  def failing_case
    ColissimoFuelAdjustmentCoefficients.stub_any_instance :response, '' do
      @adjustement_coefficient = ColissimoFuelAdjustmentCoefficients.new
      yield
    end
  end
end
