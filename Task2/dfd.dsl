workspace {

    model {
        user = person "Сотрудник компании"

        
        healthcare = softwareSystem "Медицинский домен"
        fintech = softwareSystem "Финансовый домен"
        internal = softwareSystem "Внутренний домен"
        dataMart = softwareSystem "Витрина данных"
        integration = softwareSystem "Интеграционный домен (ESB)"
        external = softwareSystem "Внешние бизнесы"

        healthcare -> integration "Медицинские данные (без карт и исследований)"
        fintech -> integration "Финансовые данные"
        internal -> integration "Операционные данные"
        integration -> dataMart "Агрегированные данные для аналитики"
        integration -> external "Обмен данными с внешними бизнесами"
        external -> integration "Данные от внешних бизнесов"
        user -> dataMart "Запросы на отчёты и аналитику"
    }

    views {
        systemLandscape "dfd" {
            include *
            autolayout lr
            title "DFD: Потоки данных между доменами"
        }
        styles {
            element "Person" {
                background #d34407
                shape person
            }
            element "Element" {
                background #1168bd
                color #ffffff
                shape RoundedBox
            }
            element "Database" {
                shape cylinder
            }
            element "Group: Frontend" {
                background #ffcc00
            }
        }
        
    }
    
}