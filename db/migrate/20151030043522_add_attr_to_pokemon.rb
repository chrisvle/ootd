class AddAttrToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :name, :string
    add_column :pokemons, :level, :integer
    add_column :pokemons, :trainer_id, :integer
  end
end
