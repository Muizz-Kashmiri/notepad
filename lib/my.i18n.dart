import 'package:i18n_extension/i18n_extension.dart';

const send = "send";
const restore = "restore";
const delete = "delete";
const search = "search";
const trashnotes = "trashnotes";
const mainnotes = "mainnotes";
const archivednotes = "archivednotes";
const greetings = "greetings";
const changeLanguage = "changeLanguage";
const notes = "notes";
const task = "task";
const trash = "trash";
const settings = "settings";
const logout = "logout";
const pad = "pad";
const language = "language";
const fontfam = "fontfam";
const fontsize = "fontsize";
const nightmode = "nightmode";
const rate = "rate";
const privacy = "privacy";
const contact = "contact";
const todolist = "todolist";
const clear = "clear";
const newtask = "newtask";
const view = "view";
const list = "list";
const grid = "grid";
const sort = "sort";
const time = "time";
const ascending = "ascending";
const descending = "descending";
const question = "question";
const yess = "yess";
const no = "no";
const tit = "tit";
const content = "content";
const edited = "edited";

extension Localization on String {
  //
  /// If you want to use identifiers as translation keys, you can define the
  /// keys here in the translations file, and then use the [Translations.from]
  /// constructor:
  ///
  static final _t = Translations.from("en_us", {
    yess: {
      "en_us": "Yes",
      "pt_br": "Sim",
      "ur_ur": "جی ہاں",
      "ar-ae": "نعم",
      "ru_ru": "да",
      "hi_in": "हाँ",
      "it_it": "sì",
      "fr_fr": "Oui",
      "de_de": "Jawohl",
      "nl_be": "Ja",
      "id_id": "ya",
      "ms_my": "Ya",
      "pl_pl": "TAk",
      "es_es": "Sí",
      "ko_ko": "예",
      "ja_ja": "はい",
      "zh_cn": "是的",
    },
    no: {
      "en_us": "No",
      "pt_br": "Não",
      "ur_ur": "نہیں",
      "ar-ae": "رقم",
      "ru_ru": "нет",
      "hi_in": "ना",
      "it_it": "no",
      "fr_fr": "non",
      "de_de": "Nein",
      "nl_be": "Nee",
      "id_id": "tidak",
      "ms_my": "Tidak",
      "pl_pl": "Nie",
      "es_es": "No",
      "ko_ko": "아니요",
      "ja_ja": "いいえ",
      "zh_cn": "不",
    },
    question: {
      "en_us": "Are you sure to sign out the current account?",
      "pt_br": "Tem certeza de que deseja sair da conta atual?",
      "ur_ur": "کیا آپ کرنٹ اکاؤنٹ سے سائن آؤٹ کرنے کا یقین رکھتے ہیں؟",
      "ar-ae": "هل أنت متأكد من تسجيل الخروج من الحساب الجاري؟",
      "ru_ru": "Вы действительно хотите выйти из текущего аккаунта?",
      "hi_in": "क्या आप वाकई चालू खाते से साइन आउट करना चाहते हैं?",
      "it_it": "Sei sicuro di uscire dall'account corrente?",
      "fr_fr": "Êtes-vous sûr de vous déconnecter du compte courant ?",
      "de_de": "Möchten Sie sich wirklich vom Girokonto abmelden?",
      "nl_be": "Weet u zeker dat u zich afmeldt bij het huidige account?",
      "id_id": "Apakah Anda yakin untuk keluar dari akun saat ini?",
      "ms_my": "Adakah anda pasti log keluar dari akaun semasa?",
      "pl_pl": "Czy na pewno wylogujesz się z bieżącego konta?",
      "es_es": "¿Está seguro de cerrar sesión en la cuenta actual?",
      "ko_ko": "현재 계정에서 로그아웃하시겠습니까?",
      "ja_ja": "現在のアカウントからサインアウトしてもよろしいですか？",
      "zh_cn": "您确定要退出当前帐户吗？",
    },

    tit: {
      "en_us": "Title",
      "pt_br": "Título",
      "ur_ur": "عنوان",
      "ar-ae": "لقب",
      "ru_ru": "Заголовок",
      "hi_in": "शीर्षक",
      "it_it": "Titolo",
      "fr_fr": "Titre",
      "de_de": "Titel",
      "nl_be": "Titel",
      "id_id": "Judul",
      "ms_my": "Tajuk",
      "pl_pl": "Tytuł",
      "es_es": "Título",
      "ko_ko": "제목  ",
      "ja_ja": "タイトル",
      "zh_cn": "标题",
    },
    content: {
      "en_us": "Note",
      "pt_br": "Nota",
      "ur_ur": "نوٹ",
      "ar-ae": "ملحوظة",
      "ru_ru": "Примечание",
      "hi_in": "ध्यान दें",
      "it_it": "Nota",
      "fr_fr": "Noter",
      "de_de": "Notiz",
      "nl_be": "Opmerking",
      "id_id": "Catatan",
      "ms_my": "Nota",
      "pl_pl": "Notatka",
      "es_es": "Nota",
      "ko_ko": "메모",
      "ja_ja": "ノート",
      "zh_cn": "笔记",
    },
    send: {
      "en_us": "Send",
      "pt_br": "Mandar",
      "ur_ur": "بھیجنا",
      "ar-ae": "يرسل",
      "ru_ru": "послать",
      "hi_in": "भेजना",
      "it_it": "Spedire",
      "fr_fr": "Envoyer",
      "de_de": "Senden",
      "nl_be": "Versturen",
      "id_id": "Mengirim",
      "ms_my": "Hantar",
      "pl_pl": "Wysłać",
      "es_es": "Enviar",
      "ko_ko": "보내다",
      "ja_ja": "送信",
      "zh_cn": "发送",
    },
    restore: {
      "en_us": "Restore",
      "pt_br": "Restaurar",
      "ur_ur": "بحال کریں",
      "ar-ae": "يعيد",
      "ru_ru": "Восстановить",
      "hi_in": "पुनर्स्थापित",
      "it_it": "Ristabilire",
      "fr_fr": "Restaurer",
      "de_de": "Wiederherstellen",
      "nl_be": "Herstellen",
      "id_id": "Memulihkan",
      "ms_my": "Pulihkan",
      "pl_pl": "Przywrócić",
      "es_es": "Restaurar",
      "ko_ko": "복원",
      "ja_ja": "戻す",
      "zh_cn": "恢复",
    },
    delete: {
      "en_us": "Delete",
      "pt_br": "Excluir",
      "ur_ur": "حذف کریں",
      "ar-ae": "حذف",
      "ru_ru": "Удалить",
      "hi_in": "हटाएं",
      "it_it": "Elimina",
      "fr_fr": "Supprimer",
      "de_de": "Löschen",
      "nl_be": "Verwijderen",
      "id_id": "Menghapus",
      "ms_my": "Padam",
      "pl_pl": "Usunąć",
      "es_es": "Borrar",
      "ko_ko": "삭제",
      "ja_ja": "消去",
      "zh_cn": "删除",
    },
    edited: {
      "en_us": "Edited",
      "pt_br": "Editado",
      "ur_ur": "ترمیم شدہ",
      "ar-ae": "تم تحريره",
      "ru_ru": "Отредактировано",
      "hi_in": "संपादित",
      "it_it": "Modificato",
      "fr_fr": "Édité",
      "de_de": "Bearbeitet",
      "nl_be": "Bewerkt",
      "id_id": "diedit",
      "ms_my": "Disunting",
      "pl_pl": "Edytowane",
      "es_es": "Editado",
      "ko_ko": "수정됨",
      "ja_ja": "編集済み",
      "zh_cn": "已编辑",
    },

    changeLanguage: {
      "en_us": "Change Language",
      "pt_br": "Mude Idioma",
      "ur_ur": "زبان تبدیل کریں",
      "ar-ae": "تغيير اللغة",
      "ru_ru": "Изменить язык",
      "hi_in": "भाषा बदलो",
      "it_it": "Cambia lingua",
      "fr_fr": "Changer de langue",
      "de_de": "Sprache ändern",
      "nl_be": "Taal wijzigen",
      "id_id": "Ganti BAHASA",
      "ms_my": "Tukar bahasa",
      "pl_pl": "Zmień język",
      "es_es": "Cambiar idioma",
      "ko_ko": "언어 변경",
      "ja_ja": "言語を変更",
      "zh_cn": "改变语言",
    },
    //TODO: setting screen
    search: {
      "en_us": "Search..",
      "pt_br": "Procurar..",
      "ur_ur": "تلاش کریں۔",
      "ar-ae": "بحث",
      "ru_ru": "Поиск",
      "hi_in": "खोज",
      "it_it": "Ricerca",
      "fr_fr": "Chercher",
      "de_de": "Suche",
      "nl_be": "Zoeken",
      "id_id": "Mencari",
      "ms_my": "Cari",
      "pl_pl": "Szukaj",
      "es_es": "Búsqueda",
      "ko_ko": "찾다",
      "ja_ja": "探す",
      "zh_cn": "搜索",
    },
    language: {
      "en_us": "Language",
      "pt_br": "Línguas",
      "ur_ur": "زبان",
      "ar-ae": "لغة",
      "ru_ru": "Язык",
      "hi_in": "भाषा",
      "it_it": "Lingua",
      "fr_fr": "Langue",
      "de_de": "Sprache",
      "nl_be": "Taal",
      "id_id": "Bahasa",
      "ms_my": "Bahasa",
      "pl_pl": "Język",
      "es_es": "Idioma",
      "ko_ko": "언어",
      "ja_ja": "言語",
      "zh_cn": "语",
    },
    fontfam: {
      "en_us": "Font Family",
      "pt_br": "Família de fontes",
      "ur_ur": "فونٹ فیملی",
      "ar-ae": "خط العائلة",
      "ru_ru": "Семейство шрифтов",
      "hi_in": "फ़ॉन्ट परिवार",
      "it_it": "Famiglia di font",
      "fr_fr": "Famille de polices",
      "de_de": "Schriftfamilie",
      "nl_be": "Lettertypefamilie",
      "id_id": "Keluarga Font",
      "ms_my": "Keluarga Font",
      "pl_pl": "Rodzina czcionek",
      "es_es": "Familia tipográfica",
      "ko_ko": "글꼴 모음",
      "ja_ja": "フォントファミリー",
      "zh_cn": "字体系列",
    },
    fontsize: {
      "en_us": "Font Size",
      "pt_br": "Tamanho da fonte",
      "ur_ur": "حرف کا سائز",
      "ar-ae": "حجم الخط",
      "ru_ru": "Размер шрифта",
      "hi_in": "फ़ॉन्ट आकार",
      "it_it": "Dimensione del font",
      "fr_fr": "Taille de police",
      "de_de": "Schriftgröße",
      "nl_be": "Lettertypegrootte",
      "id_id": "Ukuran huruf",
      "ms_my": "Saiz huruf",
      "pl_pl": "Rozmiar czcionki",
      "es_es": "Tamaño de fuente",
      "ko_ko": "글꼴 크기",
      "ja_ja": "フォントサイズ",
      "zh_cn": "字体大小",
    },
    nightmode: {
      "en_us": "Night Mode",
      "pt_br": "Modo noturno",
      "ur_ur": "نائٹ موڈ",
      "ar-ae": "وضع الليل",
      "ru_ru": "Ночной режим",
      "hi_in": "रात्री स्वरुप",
      "it_it": "Modalità notturna",
      "fr_fr": "Mode nuit",
      "de_de": "Nacht-Modus",
      "nl_be": "Nachtstand",
      "id_id": "Mode malam",
      "ms_my": "Mod malam",
      "pl_pl": "Tryb nocny",
      "es_es": "Modo nocturno",
      "ko_ko": "야간 모드",
      "ja_ja": "ナイトモード",
      "zh_cn": "夜间模式",
    },
    rate: {
      "en_us": "Rate",
      "pt_br": "Avaliar",
      "ur_ur": "درجہ بندی",
      "ar-ae": "معدل",
      "ru_ru": "Показатель",
      "hi_in": "भाव",
      "it_it": "Valutare",
      "fr_fr": "Taux",
      "de_de": "Rate",
      "nl_be": "Tarief",
      "id_id": "Kecepatan",
      "ms_my": "Nilaikan",
      "pl_pl": "Wskaźnik",
      "es_es": "Velocidad",
      "ko_ko": "비율",
      "ja_ja": "割合",
      "zh_cn": "速度",
    },
    privacy: {
      "en_us": "Privacy",
      "pt_br": "Privacidade",
      "ur_ur": "پرائیویسی",
      "ar-ae": "خصوصية",
      "ru_ru": "Конфиденциальность",
      "hi_in": "गोपनीयता",
      "it_it": "Privacy",
      "fr_fr": "Intimité",
      "de_de": "Privatsphäre",
      "nl_be": "Privacy",
      "id_id": "Pribadi",
      "ms_my": "Privasi",
      "pl_pl": "Prywatność",
      "es_es": "Intimidad",
      "ko_ko": "은둔",
      "ja_ja": "プライバシー",
      "zh_cn": "隐私",
    },
    contact: {
      "en_us": "Contact Us",
      "pt_br": "Contate-Nos",
      "ur_ur": "ہم سے رابطہ کریں",
      "ar-ae": "اتصل بنا",
      "ru_ru": "Свяжитесь с нами",
      "hi_in": "संपर्क करें",
      "it_it": "Contattaci",
      "fr_fr": "Nous contacter",
      "de_de": "Kontaktiere uns",
      "nl_be": "Neem contact met ons op",
      "id_id": "Hubungi kami",
      "ms_my": "Hubungi Kami",
      "pl_pl": "Skontaktuj się z nami",
      "es_es": "Contáctenos",
      "ko_ko": "문의하기",
      "ja_ja": "お問い合わせ",
      "zh_cn": "联系我们",
    },

    ///TODO:DrawerItems here\
    notes: {
      "en_us": "Notes",
      "pt_br": "Notas",
      "ur_ur": "نوٹس",
      "ar-ae": "تلاحظ",
      "ru_ru": "Примечания",
      "hi_in": "टिप्पणियाँ",
      "it_it": "Appunti",
      "fr_fr": "Remarques",
      "de_de": "Anmerkungen",
      "nl_be": "Opmerkingen",
      "id_id": "Catatan",
      "ms_my": "Catatan",
      "pl_pl": "Uwagi",
      "es_es": "Notas",
      "ko_ko": "메모",
      "ja_ja": "ノート",
      "zh_cn": "笔记",
    },
    pad: {
      "en_us": "Pad",
      "pt_br": "o bloco",
      "ur_ur": "پیڈ",
      "ar-ae": "ضمادة",
      "ru_ru": "Pad",
      "hi_in": "पैड",
      "it_it": "Pad",
      "fr_fr": "Tampon",
      "de_de": "Pad",
      "nl_be": "Pad",
      "id_id": "Bantalan",
      "ms_my": "PAD",
      "pl_pl": "Podkładka",
      "es_es": "Almohadilla",
      "ko_ko": "인주",
      "ja_ja": "パッド",
      "zh_cn": "软垫",
    },
    task: {
      "en_us": "Task",
      "pt_br": "Tarefa",
      "ur_ur": "کام",
      "ar-ae": "مهمة",
      "ru_ru": "Задача",
      "hi_in": "टास्क",
      "it_it": "Compito",
      "fr_fr": "Tâche",
      "de_de": "Aufgabe",
      "nl_be": "Taak",
      "id_id": "Tugas",
      "ms_my": "Tugas",
      "pl_pl": "Zadanie",
      "es_es": "Tarea",
      "ko_ko": "일",
      "ja_ja": "仕事",
      "zh_cn": "任务",
    },
    trash: {
      "en_us": "Trash",
      "pt_br": "Lixo",
      "ur_ur": "ردی کی ٹوکری",
      "ar-ae": "نفاية",
      "ru_ru": "Мусор",
      "hi_in": "कचरा",
      "it_it": "Spazzatura",
      "fr_fr": "Poubelle",
      "de_de": "Müll",
      "nl_be": "Afval",
      "id_id": "Sampah",
      "ms_my": "Sampah",
      "pl_pl": "Śmieci",
      "es_es": "Basura",
      "ko_ko": "쓰레기",
      "ja_ja": "ごみ",
      "zh_cn": "垃圾",
    },
    settings: {
      "en_us": "Settings",
      "pt_br": "Configurações",
      "ur_ur": "ترتیبات",
      "ar-ae": "إعدادات",
      "ru_ru": "Настройки",
      "hi_in": "समायोजन",
      "it_it": "Impostazioni",
      "fr_fr": "Paramètres",
      "de_de": "Einstellungen",
      "nl_be": "Instellingen",
      "id_id": "Pengaturan",
      "ms_my": "Tetapan",
      "pl_pl": "Ustawienia",
      "es_es": "Ajustes",
      "ko_ko": "설정",
      "ja_ja": "設定",
      "zh_cn": "设置",
    },
    logout: {
      "en_us": "Logout",
      "pt_br": "Sair",
      "ur_ur": "لاگ آوٹ",
      "ar-ae": "تسجيل خروج",
      "ru_ru": "Выйти",
      "hi_in": "लॉग आउट",
      "it_it": "Disconnettersi",
      "fr_fr": "Se déconnecter",
      "de_de": "Ausloggen",
      "nl_be": "Uitloggen",
      "id_id": "Keluar",
      "ms_my": "Log keluar",
      "pl_pl": "Wyloguj",
      "es_es": "Cerrar sesión",
      "ko_ko": "로그 아웃",
      "ja_ja": "ログアウト",
      "zh_cn": "登出",
    },
    //TODO: tasks
    todolist: {
      "en_us": "Todo List",
      "pt_br": "Lista de afazeres",
      "ur_ur": "فہرست",
      "ar-ae": "عمل قائمة",
      "ru_ru": "Список дел",
      "hi_in": "करने के लिए सूची",
      "it_it": "Lista di cose da fare",
      "fr_fr": "Liste de choses à faire",
      "de_de": "Aufgabenliste",
      "nl_be": "Te doen lijst",
      "id_id": "Daftar Yang Harus Dilakukan",
      "ms_my": "Senarai yang hendak dibuat",
      "pl_pl": "Lista rzeczy do zrobienia",
      "es_es": "Lista de quehaceres",
      "ko_ko": "할 일 목록",
      "ja_ja": "ToDoリスト",
      "zh_cn": "待办事项清单",
    },
    clear: {
      "en_us": "Clear All",
      "pt_br": "Limpar tudo",
      "ur_ur": "صاف کریں",
      "ar-ae": "امسح الكل",
      "ru_ru": "Очистить все",
      "hi_in": "सभी साफ करें",
      "it_it": "Cancella tutto",
      "fr_fr": "Tout effacer",
      "de_de": "Alles löschen",
      "nl_be": "Wis alles",
      "id_id": "Bersihkan semua",
      "ms_my": "Kosongkan semua",
      "pl_pl": "Wyczyść wszystko",
      "es_es": "Limpiar todo",
      "ko_ko": "모두 지우기",
      "ja_ja": "すべてクリア",
      "zh_cn": "清除所有",
    },
    newtask: {
      "en_us": "New Task",
      "pt_br": "Nova tarefa",
      "ur_ur": "نیا کام",
      "ar-ae": "مهمة جديدة",
      "ru_ru": "Новое задание",
      "hi_in": "नया कार्य",
      "it_it": "Nuovo compito",
      "fr_fr": "Nouvelle tâche",
      "de_de": "Neue Aufgabe",
      "nl_be": "Nieuwe taak",
      "id_id": "Tugas Baru",
      "ms_my": "Tugasan baru",
      "pl_pl": "Nowe zadanie",
      "es_es": "Nueva tarea",
      "ko_ko": "새 작업",
      "ja_ja": "新しい仕事",
      "zh_cn": "新任务",
    },
// ignore: todo
//TODO bottom sheet
    view: {
      "en_us": "View As",
      "pt_br": "Vista como",
      "ur_ur": " دیکھیں",
      "ar-ae": "يبدو مثل",
      "ru_ru": "Посмотреть, как",
      "hi_in": "के रूप में देखें",
      "it_it": "Visualizza come",
      "fr_fr": "Voir comme",
      "de_de": "Ansicht als",
      "nl_be": "Zien als",
      "id_id": "Tampilkan sebagai",
      "ms_my": "Lihat Sebagai",
      "pl_pl": "Wyświetl jako",
      "es_es": "Visto como",
      "ko_ko": "다른 이름으로 보기",
      "ja_ja": "として表示",
      "zh_cn": "查看为",
    },
    list: {
      "en_us": "List",
      "pt_br": "Lista",
      "ur_ur": " فہرست",
      "ar-ae": "قائمة",
      "ru_ru": "Список",
      "hi_in": "सूची",
      "it_it": "Elenco",
      "fr_fr": "Lister",
      "de_de": "Aufführen",
      "nl_be": "Lijst",
      "id_id": "Daftar",
      "ms_my": "Senaraikan",
      "pl_pl": "Lista",
      "es_es": "Lista",
      "ko_ko": "목록",
      "ja_ja": "リスト",
      "zh_cn": "列表",
    },
    grid: {
      "en_us": "Grid",
      "pt_br": "Rede",
      "ur_ur": "گرڈ",
      "ar-ae": "شبكة",
      "ru_ru": "Сетка",
      "hi_in": "ग्रिड",
      "it_it": "Griglia",
      "fr_fr": "Grille",
      "de_de": "Netz",
      "nl_be": "Rooster",
      "id_id": "kisi-kisi",
      "ms_my": "Grid",
      "pl_pl": "Krata",
      "es_es": "Red",
      "ko_ko": "그리드",
      "ja_ja": "グリッド",
      "zh_cn": "网格",
    },
    sort: {
      "en_us": "Sort",
      "pt_br": "Ordenar",
      "ur_ur": "ترتیب دیں",
      "ar-ae": "فرز",
      "ru_ru": "Сортировать",
      "hi_in": "तरह",
      "it_it": "Ordinare",
      "fr_fr": "Sorte",
      "de_de": "Sortieren",
      "nl_be": "Soort",
      "id_id": "Menyortir",
      "ms_my": "Susun",
      "pl_pl": "Sortować",
      "es_es": "Clasificar",
      "ko_ko": "종류",
      "ja_ja": "選別",
      "zh_cn": "种类",
    },
    time: {
      "en_us": "Time",
      "pt_br": "Tempo",
      "ur_ur": " وقت",
      "ar-ae": "وقت",
      "ru_ru": "Время",
      "hi_in": "समय",
      "it_it": "Volta",
      "fr_fr": "Temps",
      "de_de": "Zeit",
      "nl_be": "Tijd",
      "id_id": "Waktu",
      "ms_my": "Masa",
      "pl_pl": "Czas",
      "es_es": "Tiempo",
      "ko_ko": "시간",
      "ja_ja": "時間",
      "zh_cn": "时间",
    },
    ascending: {
      "en_us": "Ascending",
      "pt_br": "Ascendente",
      "ur_ur": "Ascending",
      "ar-ae": "تصاعدي",
      "ru_ru": "по возрастанию",
      "hi_in": "आरोही",
      "it_it": "Ascendente",
      "fr_fr": "Ascendant",
      "de_de": "Aufsteigend",
      "nl_be": "Oplopend",
      "id_id": "naik",
      "ms_my": "Menaik",
      "pl_pl": "Rosnąco",
      "es_es": "Ascendente",
      "ko_ko": "오름차순",
      "ja_ja": "上昇",
      "zh_cn": "上升",
    },
    descending: {
      "en_us": "Descending",
      "pt_br": "Descendente",
      "ur_ur": "Descending",
      "ar-ae": "تنازلي",
      "ru_ru": "По убыванию",
      "hi_in": "अवरोही",
      "it_it": "Discendente",
      "fr_fr": "Descendant",
      "de_de": "Absteigend",
      "nl_be": "Aflopend",
      "id_id": "Menurun",
      "ms_my": "Menurun",
      "pl_pl": "Malejąco",
      "es_es": "Descendente",
      "ko_ko": "내림차순",
      "ja_ja": "降順",
      "zh_cn": "降序",
    },

    archivednotes: {
      "en_us": "Archived notes appear here",
      "pt_br": "As notas arquivadas aparecem aqui",
      "ur_ur": "محفوظ شدہ نوٹ یہاں ظاہر ہوتے ہیں۔",
      "ar-ae": "تظهر الملاحظات المؤرشفة هنا",
      "ru_ru": "Архивные заметки появиться здесь",
      "hi_in": "संग्रहीत नोट यहां दिखाई दें",
      "it_it": "Note archiviate apparire qui",
      "fr_fr": "Notes archivées apparaître ici",
      "de_de": "Archivierte Notizen hier erscheinen",
      "nl_be": "Gearchiveerde notities hier verschijnen",
      "id_id": "Catatan yang diarsipkan muncul disini",
      "ms_my": "Catatan yang diarkibkan muncul di sini",
      "pl_pl": "Zarchiwizowane notatki pojawiają się tutaj",
      "es_es": "Notas archivadas aparecer aqui",
      "ko_ko": "보관된 메모 여기에 나타나다",
      "ja_ja": "アーカイブされたメモここに表示されます",
      "zh_cn": "存档笔记出现在这里",
    },

    trashnotes: {
      "en_us": "Notes in trash appear here",
      "pt_br": "As notas na lixeira aparecem aqui",
      "ur_ur": "کوڑے دان میں نوٹ یہاں ظاہر ہوتے ہیں",
      "ar-ae": "تظهر الملاحظات في المهملات هنا",
      "ru_ru": "Заметки в корзине появляются здесь",
      "hi_in": "ट्रैश में नोट यहां दिखाई देते हैं",
      "it_it": "Le note nel cestino vengono visualizzate qui",
      "fr_fr": "Les notes dans la corbeille apparaissent ici",
      "de_de": "Notizen im Papierkorb erscheinen hier",
      "nl_be": "Notities in de prullenbak verschijnen hier",
      "id_id": "Catatan di tempat sampah muncul di sini",
      "ms_my": "Nota dalam tong sampah muncul di sini",
      "pl_pl": "Tutaj pojawiają się notatki w koszu",
      "es_es": "Las notas en la papelera aparecen aquí",
      "ko_ko": "휴지통에 있는 메모가 여기에 표시됩니다.",
      "ja_ja": "ゴミ箱のメモはここに表示されます",
      "zh_cn": "垃圾箱中的笔记出现在此处",
    },

    mainnotes: {
      "en_us": "Notes you add appear here",
      "pt_br": "As notas que você adiciona aparecem aqui",
      "ur_ur": "آپ کے شامل کردہ نوٹس یہاں ظاہر ہوتے ہیں",
      "ar-ae": "تظهر الملاحظات التي تضيفها هنا",
      "ru_ru": "Добавленные вами заметки отображаются здесь",
      "hi_in": "आपके द्वारा जोड़े गए नोट यहां दिखाई देते हैं",
      "it_it": "Le note che aggiungi vengono visualizzate qui",
      "fr_fr": "Les notes que vous ajoutez apparaissent ici",
      "de_de": "Notizen, die Sie hinzufügen, werden hier angezeigt",
      "nl_be": "Notities die u toevoegt, worden hier weergegeven",
      "id_id": "Catatan yang Anda tambahkan muncul di sini",
      "ms_my": "Nota yang anda tambah muncul di sini",
      "pl_pl": "Tutaj pojawiają się dodane przez Ciebie notatki",
      "es_es": "Las notas que agregas aparecen aquí",
      "ko_ko": "추가한 메모가 여기에 표시됩니다.",
      "ja_ja": "追加したメモがここに表示されます",
      "zh_cn": "您添加的备注显示在此处",
    },
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, _t);
}
//
//
// yes
// no
//
// Are you sure to sign out of the current account?
//
// Title
//
// Note
//
// Send
//
// Restore
//
// Delete
//
// Edited
//
// Change Language
//
// Search
//
// Language
//
// Font Family
//
// Font Size
//
// Night Mode
//
// Rate
//
// Privacy
//
// Contact Us
//
// Notes
//
// Pad
//
// Task
//
// Trash
//
// Settings
//
// Log Out
//
// ToDo List
//
// Clear All
//
// New Task
//
// View As
//
// List
//
// Grid
//
// Sort
//
// Time
//
// Ascending
//
// Descending
//
// Archived notes
// appear here
//
// Notes in trash appear here
//
// Notes you add appear here
//
//
//
//
