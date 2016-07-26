module CustomHelpers
  def current_leader
    if winning_team.first == :squirtle
      "blue"
    elsif winning_team.first == :charmander
      "red"
    elsif winning_team.first == :bulbasaur
      "green"
    else
      "yellow"
    end
  end

  def catch_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.num_caught - a.initial_stats.num_caught)]}
  end

  def km_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.km_walked - a.initial_stats.km_walked)]}
  end

  def battle_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.battles_won - a.initial_stats.battles_won)]}
  end

  def magikarp_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.magikarp_candy - a.initial_stats.magikarp_candy)]}
  end

  def lure_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.lure_modules - a.initial_stats.lure_modules)]}
  end

  def egg_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.eggs_hatched - a.initial_stats.eggs_hatched)]}
  end

  def unique_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.unique_pokemon - a.initial_stats.unique_pokemon)]}
  end

  def evolution_ranking
     data.trainers.trainer.sort_by {|a| [-(a.comp_stats.pokemon_evolved - a.initial_stats.pokemon_evolved)]}
  end

  def catch_shortlist
    catch_ranking.first(3)
  end

  def km_shortlist
    km_ranking.first(3)
  end

  def battle_shortlist
    battle_ranking.first(3)
  end

  def magikarp_shortlist
    magikarp_ranking.first(3)
  end

  def lure_shortlist
    lure_ranking.first(3)
  end

  def egg_shortlist
    egg_ranking.first(3)
  end

  def unique_shortlist
    unique_ranking.first(3)
  end

  def evolution_shortlist
    evolution_ranking.first(3)
  end

  def catch_tophalf
    catch_tophalf = catch_ranking.first(data.trainers.trainer.length/2)
    for i in 0..(catch_tophalf.length - 1)
      if (catch_tophalf[i].comp_stats.num_caught - catch_tophalf[i].initial_stats.num_caught == 0)
        catch_tophalf = catch_tophalf.slice(0,i)
        break
      end
    end
    catch_tophalf
  end

  def km_tophalf
    km_tophalf = km_ranking.first(data.trainers.trainer.length/2)
    for i in 0..(km_tophalf.length - 1)
      if (km_tophalf[i].comp_stats.km_walked - km_tophalf[i].initial_stats.km_walked == 0)
        km_tophalf = km_tophalf.slice(0,i)
        break
      end
    end
    km_tophalf
  end

  def battle_tophalf
    battle_tophalf = battle_ranking.first(data.trainers.trainer.length/2)
    for i in 0..(battle_tophalf.length - 1)
      if (battle_tophalf[i].comp_stats.battles_won - battle_tophalf[i].initial_stats.battles_won == 0)
        battle_tophalf = battle_tophalf.slice(0,i)
        break
      end
    end
    battle_tophalf
  end

  def magikarp_tophalf
    magikarp_tophalf = magikarp_ranking.first(data.trainers.trainer.length/2)

    for i in 0..(magikarp_tophalf.length - 1)
      if (magikarp_tophalf[i].comp_stats.magikarp_candy - magikarp_tophalf[i].initial_stats.magikarp_candy == 0)
        magikarp_tophalf = magikarp_tophalf.slice(0,i)
        break
      end
    end
    magikarp_tophalf
  end

  def lure_tophalf
    lure_tophalf = lure_ranking.first(data.trainers.trainer.length/2)

    for i in 0..(lure_tophalf.length - 1)
      if (lure_tophalf[i].comp_stats.lure_modules - lure_tophalf[i].initial_stats.lure_modules == 0)
        lure_tophalf = lure_tophalf.slice(0,i)
        break
      end
    end
    lure_tophalf
  end

  def egg_tophalf
    egg_tophalf = egg_ranking.first(data.trainers.trainer.length/2)

    for i in 0..(egg_tophalf.length - 1)
      if (egg_tophalf[i].comp_stats.eggs_hatched - egg_tophalf[i].initial_stats.eggs_hatched == 0)
        egg_tophalf = egg_tophalf.slice(0,i)
        break
      end
    end
    egg_tophalf
  end

  def unique_tophalf
    unique_tophalf = unique_ranking.first(data.trainers.trainer.length/2)

    for i in 0..(unique_tophalf.length - 1)
      if (unique_tophalf[i].comp_stats.unique_pokemon - unique_tophalf[i].initial_stats.unique_pokemon == 0)
        unique_tophalf = unique_tophalf.slice(0,i)
        break
      end
    end
    unique_tophalf
  end

  def evolution_tophalf
    evolution_tophalf = evolution_ranking.first(data.trainers.trainer.length/2)

    for i in 0..(evolution_tophalf.length - 1)
      if (evolution_tophalf[i].comp_stats.pokemon_evolved - evolution_tophalf[i].initial_stats.pokemon_evolved == 0)
        evolution_tophalf = evolution_tophalf.slice(0,i)
        break
      end
    end
    evolution_tophalf
  end

  def master_tophalf
    [catch_tophalf, km_tophalf, battle_tophalf, magikarp_tophalf, lure_tophalf, egg_tophalf, evolution_tophalf, unique_tophalf]
  end

  def master_shortlist
    [catch_shortlist, km_shortlist, battle_shortlist, magikarp_shortlist, lure_shortlist, egg_shortlist, evolution_shortlist, unique_shortlist]
  end

  def scores
    scores = {squirtle: 0, charmander: 0, bulbasaur: 0, pikachu: 0}
    for i in 0..7
      points = 15
      for j in 0..2
        if master_shortlist[i][j].team == "Squirtle Squad"
          scores[:squirtle] = scores[:squirtle] + points
          points = points - 5
        elsif master_shortlist[i][j].team == "Bulbasaur Bunch"
          scores[:bulbasaur] = scores[:bulbasaur] + points
          points = points - 5
        elsif master_shortlist[i][j].team == "Charmander Club"
          scores[:charmander] = scores[:charmander] + points
          points = points - 5
        else
          scores[:pikachu] = scores[:pikachu] + points
          points = points - 5
        end
      end
    end

    for i in 0..(master_tophalf.length - 1)
      for j in 0..(master_tophalf[i].length - 1)
        if master_tophalf[i][j].team == "Squirtle Squad"
          scores[:squirtle] = scores[:squirtle] + 3
        elsif master_tophalf[i][j].team == "Bulbasaur Bunch"
          scores[:bulbasaur] = scores[:bulbasaur] + 3
        elsif master_tophalf[i][j].team == "Charmander Club"
          scores[:charmander] = scores[:charmander] + 3
        else
          scores[:pikachu] = scores[:pikachu] + 3
        end
      end
    end
    scores
  end

  def score(team)
    scores[team]
  end

  def winning_team
    scores.max_by{|k,v| v}
  end
end
