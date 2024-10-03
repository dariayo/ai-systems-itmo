% ----- База знаний о персонажах и ролях в игре Valorant -----

% Факты с одним аргументом: роли агентов
role(specialist).  % специалист
role(duelist).     % дуэлянт
role(sentinel).    % страж
role(initiator).   % зачинщик

% Факты с одним аргументом: агенты
agent(brimstone).
agent(jett).
agent(sage).
agent(sova).
agent(viper).
agent(omen).
agent(phoenix).
agent(cypher).
agent(killjoy).
agent(reyna).
agent(raze).
agent(breach).
agent(skye).
agent(yoru).
agent(ast).

% Факты с двумя аргументами: роль каждого агента
agent_role(brimstone, specialist).
agent_role(viper, specialist).
agent_role(omen, specialist).
agent_role(phoenix, duelist).
agent_role(jett, duelist).
agent_role(reyna, duelist).
agent_role(raze, duelist).
agent_role(sage, sentinel).
agent_role(cypher, sentinel).
agent_role(killjoy, sentinel).
agent_role(sova, initiator).
agent_role(breach, initiator).
agent_role(skye, initiator).
agent_role(yoru, duelist).
agent_role(ast, specialist).

% ----- База знаний о способностях агентов -----

% Факты с двумя аргументами: базовые способность и агент
basic_ability(smokes, brimstone).
basic_ability(toxic_screen, viper).
basic_ability(shadow_step, omen).
basic_ability(heal, sage).
basic_ability(paint_shells, raze).
basic_ability(boom_bot, raze).
basic_ability(grenade, raze).
basic_ability(flashpoint, phoenix).
basic_ability(blindside, phoenix).
basic_ability(paranoia, omen).
basic_ability(stealth, omen).
basic_ability(slow_orb, sage).
basic_ability(breach, breach).
basic_ability(molly, viper).

% Ультимативные способности
ultimate_ability(orbital_strike, brimstone).
ultimate_ability(resurrection, sage).
ultimate_ability(hunter_fury, sova).
ultimate_ability(bladestorm, jett).
ultimate_ability(dismiss, reyna).

% ----- База знаний об оружии -----

% Факты с одним аргументом: типы оружия
weapon(phantom).
weapon(vandal).
weapon(ghost).
weapon(sheriff).
weapon(operator).

% Факты с двумя аргументами: цена оружия
weapon_price(phantom, 2900).
weapon_price(vandal, 2900).
weapon_price(ghost, 500).
weapon_price(sheriff, 800).
weapon_price(operator, 4700).

% Факты здоровье и броня агентов
health(brimstone, 100).
health(sage, 100).
health(jett, 100).
health(sova, 100).
health(viper, 100).
health(omen, 100).
health(phoenix, 100).
health(cypher, 100).
health(killjoy, 100).
health(reyna, 100).
health(raze, 100).
health(breach, 100).
health(skye, 100).
health(yoru, 100).
health(ast, 100).

armor(brimstone, 50).
armor(sage, 50).
armor(jett, 25).
armor(sova, 30).
armor(viper, 45).
armor(omen, 50).
armor(phoenix, 50).
armor(cypher, 50).
armor(killjoy, 20).
armor(reyna, 35).
armor(raze, 45).
armor(breach, 50).
armor(skye, 50).
armor(yoru, 30).
armor(ast, 40).


% Факты урон от способностей
ability_damage(orbital_strike, 200).
ability_damage(paint_shells, 100).
ability_damage(boom_bot, 150).
ability_damage(grenade, 75).
ability_damage(flashpoint, 0).  
ability_damage(blindside, 0).  
ability_damage(paranoia, 0).  
ability_damage(stealth, 0).   
ability_damage(slow_orb, 0).   
ability_damage(bladestorm, 220).
ability_damage(breach, 160).
ability_damage(dismiss, 170).
ability_damage(hunter_fury, 230).
ability_damage(molly, 170).
ability_damage(resurrection, 200).
ability_damage(shadow_step, 150).
ability_damage(toxic_screen, 260).

% Факты стоимость способностей
ability_cost(smokes, 100).
ability_cost(orbital_strike, 6).
ability_cost(heal, 0).
ability_cost(boom_bot, 200).
ability_cost(grenade, 100).
ability_cost(flashpoint, 100).
ability_cost(blindside, 200).
ability_cost(paranoia, 200).
ability_cost(stealth, 200).
ability_cost(slow_orb, 100).
ability_cost(bladestorm, 120).
ability_cost(breach, 140).
ability_cost(dismiss, 100).
ability_cost(hunter_fury, 180).
ability_cost(molly, 175).
ability_cost(resurrection, 200).
ability_cost(shadow_step, 160).
ability_cost(toxic_screen, 210).

% Факты начальное количество кредитов у агентов
starting_credits(brimstone, 1500).
starting_credits(raze, 1500).
starting_credits(jett, 4800).
starting_credits(sage, 1500).
starting_credits(sova, 600).
starting_credits(viper, 2500).
starting_credits(omen, 1500).
starting_credits(phoenix, 1500).
starting_credits(cypher, 500).
starting_credits(killjoy, 2500).
starting_credits(reyna, 500).
starting_credits(breach, 1500).
starting_credits(skye, 600).
starting_credits(yoru, 4700).
starting_credits(ast, 600).

% Факты: насколько эффективен агент на карте
map_control_level(viper, bind, high).
map_control_level(omen, haven, medium).
map_control_level(raze, icebox, low).


% ----- База знаний о картах -----

% Факты с одним аргументом: карты
map(bind).
map(haven).
map(split).
map(ascent).
map(icebox).

% ----- Правила -----

% Правило: агент принадлежит роли контроллера
is_specialist(X) :- agent_role(X, specialist).

% Правило: агент может лечить (базовая способность heal)
can_heal(X) :- basic_ability(heal, X).

% Правило: агенты с ультимативными способностями
has_ultimate(X) :- ultimate_ability(_, X).

% Правило: агент имеет не менее двух базовых способностей
has_multiple_basic_abilities(X) :- basic_ability(A1, X), basic_ability(A2, X), A1 \= A2.

% Правило: оружие дороже 2500 кредитов
expensive_weapon(W) :- weapon_price(W, Price), Price > 2500.

% Правило: агент имеет высокий уровень контроля на карте
is_strong_on_map(Agent, Map) :- map_control_level(Agent, Map, high).

% Правило: агент может позволить себе способность
can_afford_ability(Agent, Ability) :- starting_credits(Agent, Credits), ability_cost(Ability, Cost), Credits >= Cost.

% Правило: агент может позволить себе оружие
can_afford_weapon(Agent, Weapon) :- starting_credits(Agent, Credits), weapon_price(Weapon, Price), Credits >= Price.

% Правило: общая защита агента (здоровье + броня)
total_protection(X, Protection) :- health(X, H), armor(X, A), Protection is H + A.

% Правило: способность может убить агента
can_kill(Ability, Agent) :- ability_damage(Ability, D), health(Agent, H), D >= H.
