транзакция читает из таблицы набор строк по
определенному паттерну, но когда она делает это снова
то находит дополнительные совпадения
которые были добавлены в рамках другой транзакции
это может привести к непостоянным(разным)
результатам внутри одной и той же транзакции

фантомные записи могут появляться потому что
каждый запрос в транзакции видит свой константный
снапшот актуальной для себя инфы
но разные запросы могут видеть разные снапшоты(версии баз)
внутри одной и той же транзакции