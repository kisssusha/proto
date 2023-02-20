# prototype

В процессе разработки программного обеспечения, особенно в фазе тестирования, все ошибки, обнаруженные тестировщиками, необходимо зарегистрировать, а после их исправления разработчиками – зафиксировать факт исправления. Также необходимо иметь возможность отмечать тот факт, что ошибки действительно исправлены. Для этого и предназначена данная система. Вам предлагается реализовать прототип подобной системы на языке CFML для выполнения на сервере ColdFusion.
Система должна позволять вводить и сохранять в базе данных информацию об ошибках. Система должна позволять просматривать список ошибок, введенных ранее.
Также, система должна поддерживать механизмы аутентификации с помощью ввода имени и пароля для пользователя. Анонимный вход запрещен.
Рекомендация: для поддержания HTTP-сессии можно использовать встроенный механизм ColdFusion, а для проверки, является ли пользователь анонимным, или уже прошёл аутентификацию, можно использовать файл Application.cfm.


ОПИСАНИЕ СУЩНОСТЕЙ

Пользователь
* Атрибуты:
* Учетная запись (идентификатор для входа в систему)
* Имя
* Фамилия
* Пароль

Ошибка
* Атрибуты:
* Номер (уникальный во всей системе, присваивается автоматически при сохранении)
* Дата ввода (устанавливается автоматически при сохранении)
* Короткое описание
* Подробное описание
* Пользователь (устанавливается автоматически при сохранении) Статус (Список: Новая, Открытая, Решенная, Закрытая)
* Срочность (Список: «Очень Срочно», «Срочно», «Несрочно», «Совсем несрочно» )
* Критичность (Список: Авария, Критичная, Некритичная, Запрос на изменение)

История ошибки
* Атрибуты:
* Дата
* Действие (Ввод, Открытие, Решение, Закрытие ) Комментарий
* Пользователь
  Предполагаются следующие разделы:
1. Ввод имени и пароля (вход в систему)
2. Ввод ошибки (редактирование/отображение. При редактировании и отображении ошибки, должна отображаться её история, в виде отдельной таблицы). Данная страница должна содержать кнопки, изменяющие статус ошибки. Для изменения статуса ошибки обязательно заполнение комментария для сохранения в истории.
3. Список ошибок (сортировка списка по колонкам), откуда можно перейти к редактированию каждой ошибки из списка по ссылке.
4. Редактирование информации о пользователе.
   На каждой странице должно быть меню, содержащее пункты: ввод новой ошибки, список ошибок, создание нового пользователя, список пользователей, выход из системы.
   ИНТЕРФЕЙС


ДОПОЛНИТЕЛЬНЫЕ УКАЗАНИЯ

Должна быть разработана структура базы данных (желательно приложить скрипт для ее создания). База данных должна
быть нормализована. В качестве сервера баз данных можно использовать любую базу данных, поддерживаемую ColdFusion.
Сама система должна быть разработана с помощью HTML/ ColdFusion CFML. Должны поддерживаться IE и Chrome браузеры в качестве клиента.