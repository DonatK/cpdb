
Перем мИсполнителиКоманд;

Процедура ЗарегистрироватьКоманды(Знач Парсер) Экспорт
	
	мИсполнителиКоманд = Новый Соответствие;
	
	ДобавитьКоманду("help"			, "КомандаСправкаПоПараметрам"			, Парсер);
	ДобавитьКоманду("backup"		, "КомандаСоздатьРезервнуюКопию"		, Парсер);
	ДобавитьКоманду("restore"		, "КомандаВосстановитьИзРезервнойКопии"	, Парсер);
	ДобавитьКоманду("compress"		, "КомандаВыполнитьКомпрессиюСтраниц"	, Парсер);
	ДобавитьКоманду("dumpib"		, "КомандаВыгрузитьИБВФайл"				, Парсер);
	ДобавитьКоманду("restoreib"		, "КомандаЗагрузитьИБИзФайла"			, Парсер);
	ДобавитьКоманду("putyadisk"		, "КомандаПоместитьФайлВЯДиск"			, Парсер);
	ДобавитьКоманду("getyadisk"		, "КомандаПолучитьФайлИзЯДиска"			, Парсер);
	ДобавитьКоманду("mapdrive"		, "КомандаПодключитьСетевойДиск"		, Парсер);
	ДобавитьКоманду("umapdrive"		, "КомандаОтключитьСетевойДиск"			, Парсер);
	ДобавитьКоманду("copy"			, "КомандаКопироватьФайл"				, Парсер);
	ДобавитьКоманду("uconstorage"	, "КомандаОтключитьОтХранилища"			, Парсер);
	ДобавитьКоманду("constorage"	, "КомандаПодключитьКХранилищу"			, Парсер);
	ДобавитьКоманду("split"			, "КомандаРазбитьФайлНаЧасти"			, Парсер);
	ДобавитьКоманду("merge"			, "КомандаСоединитьЧастиВФайл"			, Парсер);
	
КонецПроцедуры

Функция ПолучитьКоманду(Знач ИмяКоманды) Экспорт
	
	КлассРеализации = мИсполнителиКоманд[ИмяКоманды];
	Если КлассРеализации = Неопределено Тогда
		ВызватьИсключение "Неверная операция. Команда '" + ИмяКоманды + "' не предусмотрена";
	КонецЕсли;
	
	Возврат КлассРеализации;
	
КонецФункции

Функция ВыполнитьКоманду(Знач ИмяКоманды, Знач ПараметрыКоманды) Экспорт
	
	Команда = ПолучитьКоманду(ИмяКоманды);

	Возврат Команда.ВыполнитьКоманду(ПараметрыКоманды);

КонецФункции

Функция РезультатыКоманд() Экспорт

	РезультатыКоманд = Новый Структура;
	РезультатыКоманд.Вставить("НеРеализовано", 255);
	РезультатыКоманд.Вставить("Успех", 0);
	РезультатыКоманд.Вставить("НеверныеПараметры", 5);
	РезультатыКоманд.Вставить("ОшибкаВремениВыполнения", 1);
	
	Возврат РезультатыКоманд;

КонецФункции

Функция КодВозвратаКоманды(Знач Команда) Экспорт
	Возврат Число(Команда);
КонецФункции

Процедура ДобавитьКоманду(Знач ИмяКоманды, Знач КлассРеализации, Знач Парсер)
	
	РеализацияКоманды = Новый(КлассРеализации);
	РеализацияКоманды.ЗарегистрироватьКоманду(ИмяКоманды, Парсер);
	мИсполнителиКоманд.Вставить(ИмяКоманды, РеализацияКоманды);

КонецПроцедуры

Процедура ПоказатьСправкуПоКомандам() Экспорт
	ВыполнитьКоманду("help", Новый Соответствие);
КонецПроцедуры