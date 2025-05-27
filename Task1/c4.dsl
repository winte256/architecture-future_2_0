workspace {

    model {
        user = person "Сотрудник компании" {
            description "Любой сотрудник, использующий витрину данных или сервисы"
        }

        pharma = softwareSystem "Фармацевтические компании" {
            description "Внешние бизнесы, интегрируемые в будущем"
        }

        electronics = softwareSystem "Производитель электроники" {
            description "Внешний бизнес, интегрируемый в будущем"
        }

        futureSystem = softwareSystem "Будущее 2.0" {
            description "Экосистема компании Будущее 2.0"


            dwh = container "DWH (Data Warehouse)" {
                description "Историческое хранилище данных, источник для витрины и сервисов"
            }

            dataMart = container "Витрина данных (Data Portal)" {
                description "Портал самообслуживания для аналитики и отчетности"
            }

            esb = container "Интеграционная шина (ESB)" {
                description "Слой интеграции между доменами и сервисами"
            }

            clientUI = container "Клиентский интерфейс" {
                description "Интерфейс операторов и сотрудников для работы с данными"
            }

            aiServices = container "ИИ-сервисы" {
                description "Сервисы для обработки медицинских данных"
            }

            fintechServices = container "Финтех-сервисы" {
                description "Сервисы для финансовых операций"
            }

            internalServices = container "Внутренние сервисы" {
                description "Сервисы для управления клиниками, финансами и т.д."
            }
            
            user -> dataMart "Запрашивает отчеты, строит аналитику"
            user -> clientUI "Работает с медицинскими и финансовыми данными"
            dataMart -> dwh "Получает агрегированные данные"
            dataMart -> esb "Получает данные из других доменов"
            esb -> aiServices "Передает медицинские данные"
            esb -> fintechServices "Передает финансовые данные"
            esb -> internalServices "Передает внутренние данные"
            aiServices -> esb "Получает и отправляет медицинские данные"
            fintechServices -> esb "Получает и отправляет финансовые данные"
            internalServices -> esb "Получает и отправляет внутренние данные"
            
            esb -> pharma "Интеграция с фармацевтическими компаниями"
            esb -> electronics "Интеграция с производителем электроники"
        }
        

    }

    views {
        container futureSystem {
            include *
            autolayout lr
            title "Будущая архитектура (через год) - Диаграмма контейнеров"
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
