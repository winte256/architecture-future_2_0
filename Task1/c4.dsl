workspace {

    model {
        user = person "Сотрудник компании" {
            description "Любой сотрудник, использующий витрину данных или сервисы"
        }

        pharma = softwareSystem "Фармацевтические компании" {
            description "Внешние бизнесы, интегрируемые в будущем"
            tags "External"
        }

        electronics = softwareSystem "Производитель электроники" {
            description "Внешний бизнес, интегрируемый в будущем"
            tags "External"
        }

        futureSystem = softwareSystem "Будущее 2.0" {
            dwh = container "DWH (Data Warehouse)" {
                description "Историческое хранилище структурированных данных. Один из источников данных для аналитики."
                tags "Database"
            }

            lakehouse = container "Data Lakehouse" {
                description "Единое хранилище для структурированных и неструктурированных данных (например, медицинские изображения, документы, логи)."
                tags "Database"
            }

            dataMart = container "Витрина данных (Data Portal)" {
                description "Портал самообслуживания для аналитики и отчетности. Получает данные из разных источников."
            }

            esb = container "Интеграционная шина (ESB)" {
                description "Слой интеграции между доменами и сервисами"
            }

            clientUI = container "Клиентский интерфейс" {
                description "Интерфейс операторов и сотрудников для работы с данными"
            }

            aiServices = container "ИИ-сервисы" {
                description "Сервисы для обработки медицинских данных, в том числе неструктурированных (например, изображений из Lakehouse)"
            }

            fintechServices = container "Финтех-сервисы" {
                description "Сервисы для финансовых операций"
            }

            internalServices = container "Внутренние сервисы" {
                description "Сервисы для управления клиниками, финансами и т.д."
            }

            user -> dataMart "Запрашивает отчеты, строит аналитику"
            user -> clientUI "Работает с медицинскими и финансовыми данными"
            dataMart -> dwh "Получает структурированные данные"
            dataMart -> lakehouse "Получает структурированные и неструктурированные данные"
            dataMart -> esb "Получает данные из других доменов"
            esb -> aiServices "Передает медицинские данные"
            esb -> fintechServices "Передает финансовые данные"
            esb -> internalServices "Передает внутренние данные"
            aiServices -> esb "Получает и отправляет медицинские данные"
            aiServices -> lakehouse "Обрабатывает неструктурированные данные (например, изображения)"
            fintechServices -> esb "Получает и отправляет финансовые данные"
            internalServices -> esb "Получает и отправляет внутренние данные"

            aiServices -> lakehouse "Сохраняет результаты обработки, неструктурированные данные"
            fintechServices -> lakehouse "Может сохранять документы, логи"
            internalServices -> lakehouse "Может сохранять документы, логи"
            dwh -> lakehouse "Может выгружать архивные данные"
            
            esb -> pharma "Интеграция с фармацевтическими компаниями"
            esb -> electronics "Интеграция с производителем электроники"
        }
        

    }

    views {
        container futureSystem {
            include *
            autolayout lr
            title "Будущая архитектура (через год) — Data Mesh & Lakehouse"
        }
        styles {
            element "Person" {
                background #d34407
                shape person
            }
            element "Database" {
                shape cylinder
            }
            element "Element" {
                background #1168bd
                color #ffffff
                shape RoundedBox
            }
            element "External" {
                background #cccccc
                color #222222
            }
        }
    }
}
