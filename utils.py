from prolog_queries import prolog, get_weapon_recommendations_for_agents, get_agents_by_multiple_ability, \
    get_agents_by_ability, get_agents_by_role, get_agents_by_protection


def ask_question(prompt, options):
    print(prompt)
    for idx, option in enumerate(options, start=1):
        print(f"{idx}. {option}")
    try:
        choice = input("Ваш выбор: ").strip()
        return int(choice) - 1 if choice.isdigit() else None
    except KeyboardInterrupt:
        print("Неверный ввод. Пожалуйста, введите число.")
        return None


def ask_for_budget():
    while True:
        try:
            budget = float(input("Введите ваш доступный бюджет (кредиты): ").strip())
            if budget < 0:
                print("Бюджет не может быть отрицательным. Попробуйте снова.")
            else:
                return budget
        except ValueError:
            print("Неверный ввод. Пожалуйста, введите число.")


def display_agent_info(agent):
    try:
        print(f"Информация об агенте {agent}:")
        abilities = list(prolog.query(f"basic_ability(Ability, {agent})"))
        print("Базовые способности:")
        for ability in abilities:
            print(f"- {ability['Ability']}")

        ultimate = list(prolog.query(f"ultimate_ability(Ultimate, {agent})"))
        print("Ультимативная способность:")
        for ult in ultimate:
            print(f"- {ult['Ultimate']}")

        health_value = list(prolog.query(f"health({agent}, Health)"))[0]['Health']
        armor_value = list(prolog.query(f"armor({agent}, Armor)"))[0]['Armor']
        print(f"Здоровье: {health_value}, Броня: {armor_value}")
    except Exception as e:
        print(f"Ошибка при запросе информации об агенте {agent}: {e}")


def recommend_agents():
    roles = ['duelist', 'specialist', 'initiator', 'sentinel']
    agents = []
    select_new_role = True
    selected_role = None
    print("Добро пожаловать в рекомендательную систему игры Valorant!")
    while True:
        if select_new_role:
            role_choice = ask_question("Выберите роль агента:", roles)
            if role_choice is None or role_choice >= len(roles):
                print("Неверный выбор. Попробуйте снова.")
                continue
            selected_role = roles[role_choice]

            agents = get_agents_by_role(selected_role)
            select_new_role = False

        choice = ask_question(
            "Что бы вы хотели узнать?",
            ["Агенты с ультой", "Агенты с высокой защитой", "Агенты с несколькими способностями", "Выбрать новую роль",
             "Информация об агенте", "Рекомендации по оружию для выбранных агентов", "Выход"]
        )

        if choice == 0:
            agents = get_agents_by_ability(agents)
            print(f"Рекомендованные агенты с ультимативной способностью для роли {selected_role}:")
            for agent in agents:
                print(f"- {agent}")

        elif choice == 1:
            agents = get_agents_by_protection(agents)
            print(f"Агенты с высокой защитой для роли {selected_role}:")
            for agent in agents:
                print(f"- {agent}")

        elif choice == 2:
            agents = get_agents_by_multiple_ability(agents)
            print(f"Агенты с несколькими базовыми способностями для роли {selected_role}:")
            for agent in agents:
                print(f"- {agent}")

        elif choice == 3:
            select_new_role = True

        elif choice == 4:
            if agents:
                agent_choice = ask_question("Выберите агента:", agents)
                if agent_choice is not None and 0 <= agent_choice < len(agents):
                    display_agent_info(agents[agent_choice])
                else:
                    print("Неверный выбор.")
            else:
                print("Нет агентов для отображения.")

        elif choice == 5:
            weapon_recommendations = get_weapon_recommendations_for_agents(agents)
            if weapon_recommendations:
                print(f"Рекомендованное оружие для агентов с ролью {selected_role}:")
                for agent, weapons in weapon_recommendations.items():
                    weapon_list = ", ".join(weapons)
                    print(f"Для агента {agent} рекомендовано оружие: {weapon_list}")
            else:
                print("Нет подходящих рекомендаций по оружию для выбранных агентов.")

        elif choice == 6:
            print("Спасибо за использование системы!")
            break

        else:
            print("Неверный выбор. Попробуйте снова.")
