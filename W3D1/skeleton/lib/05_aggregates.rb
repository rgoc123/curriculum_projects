# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def example_sum
  execute(<<-SQL)
    SELECT
      SUM(population)
    FROM
      countries
  SQL
end

def continents
  # List all the continents - just once each.
  execute(<<-SQL)
    SELECT
      DISTINCT countries.continent
    FROM
      countries
  SQL
end

def africa_gdp
  # Give the total GDP of Africa.
  execute(<<-SQL)
    SELECT
      SUM(countries.gdp)
    FROM
      countries
    WHERE
      continent = 'Africa'
  SQL
end

def area_count
  # How many countries have an area of more than 1,000,000?
  execute(<<-SQL)
    SELECT
      COUNT(countries.name)
    FROM
      countries
    WHERE
      countries.area > 1000000
  SQL
end

def group_population
  # What is the total population of ('France','Germany','Spain')?
  execute(<<-SQL)
    SELECT
      SUM(countries.population)
    FROM
      countries
    WHERE
      countries.name = 'France' OR
      countries.name = 'Germany' OR
      countries.name = 'Spain'
  SQL
end

def country_counts
  # For each continent show the continent and number of countries.
  execute(<<-SQL)
    SELECT
      countries.continent, COUNT(countries.name) AS number_of_countries
    FROM
      countries
    GROUP BY countries.continent
  SQL
end

def populous_country_counts
  # For each continent show the continent and number of countries with
  # populations of at least 10 million.
  execute(<<-SQL)
    SELECT
      countries.continent, COUNT(countries.name) AS populous_countries
    FROM
      countries
    WHERE
      countries.population >= 10000000
    GROUP BY continent
  SQL
end

def populous_continents
  # List the continents that have a total population of at least 100 million.
  execute(<<-SQL)
    SELECT
      populous.continent
    FROM
      (SELECT
        countries.continent, SUM(countries.population) AS total_population
      FROM
        countries
      GROUP BY
        countries.continent)
      AS populous
    WHERE
      populous.total_population >= 100000000
  SQL
end
