from pyswip import Prolog

prolog = Prolog()
try:
    prolog.consult("./simple.pl")
except Exception as e:
    print(f"Ошибка при загрузке файла Prolog: {e}")
    exit(1)


def get_agents_by_role(role):
    try:
        agents = list(prolog.query(f"agent_role(Agent, {role})"))
        return [agent["Agent"] for agent in agents]
    except Exception as e:
        print(f"Ошибка при запросе агентов по роли: {e}")
        return []


def get_weapon_recommendations_for_agents(agents):
    agent_weapons = {}
    for agent in agents:
        try:
            weapons = list(prolog.query(f"can_afford_weapon({agent}, Weapon)"))
            agent_weapons[agent] = [weapon["Weapon"] for weapon in weapons]
        except Exception as e:
            print(f"Ошибка при запросе оружия для агента {agent}: {e}")
    return agent_weapons


def get_agents_by_ability(agents):
    filtered_agents = []
    for agent in agents:
        try:
            if list(prolog.query(f"ultimate_ability(_, {agent})")):
                filtered_agents.append(agent)
        except Exception as e:
            print(f"Ошибка при запросе способностей агента {agent}: {e}")
    return filtered_agents


def get_agents_by_protection(agents):
    filtered_agents = []
    for agent in agents:
        try:
            protection_query = list(prolog.query(f"total_protection({agent}, Protection)"))
            if protection_query and protection_query[0]["Protection"] >= 150:
                filtered_agents.append(agent)
        except Exception as e:
            print(f"Ошибка при запросе защиты агента {agent}: {e}")
    return filtered_agents


def get_agents_by_multiple_ability(agents):
    filtered_agents = []
    for agent in agents:
        try:
            if list(prolog.query(f"has_multiple_basic_abilities({agent})")):
                filtered_agents.append(agent)
        except Exception as e:
            print(f"Ошибка при запросе базовых способностей агента {agent}: {e}")
    return filtered_agents


def get_agents_by_budget(agents, budget):
    filtered_agents = []
    for agent in agents:
        try:
            agent_cost = list(prolog.query(f"starting_credits({agent}, Cost)"))
            if agent_cost and agent_cost[0]["Cost"] >= budget:
                filtered_agents.append(agent)
        except Exception as e:
            print(f"Ошибка при запросе стоимости агента {agent}: {e}")
    return filtered_agents
