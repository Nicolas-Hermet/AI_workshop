# frozen_string_literal: true

# MODELE — ne contient pas les vraies valeurs.
#
# Lors de la mise en place de l'instance du workshop :
#   cp db/seeds/flags.example.rb db/seeds/flags.rb
# puis renseigner les vraies valeurs dans db/seeds/flags.rb (gitignore).
#
# db/seeds.rb echoue avec un message clair si db/seeds/flags.rb est absent.
CTF_FLAGS = {
  mass_assignment: "FLAG{...}",
  idor:            "FLAG{...}",
  sqli:            "FLAG{...}",
  api:             "FLAG{...}"
}.freeze
