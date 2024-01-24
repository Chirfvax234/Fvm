local Translations = {
    error = {
        not_online = 'Oyuncu çevrimiçi değil.',
        wrong_format = 'Yanlış format',
        missing_args = 'Boşluksuz girmeye özen göster (x, y, z)',
        missing_args2 = 'Boşluksuz girmeye özen göster!',
        no_access = 'Bu komutu kullanmaya yetkin yetmez.',
        company_too_poor = 'Your employer is broke',
        item_not_exist = 'Böyle bir item yok.',
        too_heavy = 'Envanter çok dolu.',
        location_not_exist = 'Konum mevcut değil.',
        duplicate_license = 'Sunucuda Aynı Rockstar Lisansı bulundu!',
        no_valid_license  = 'Rockstar Lisansı bulunamadı!',
        not_whitelisted = 'Whiteliste sahip değilsin.',
        server_already_open = 'Sunucu zaten açık?',
        server_already_closed = 'Sunucu zaten kapalı?',
        no_permission = 'Yetkin yetmez..',
        no_waypoint = 'Konum belirtilmedi.',
        tp_error = 'Teleport hatası.',
        connecting_database_error = 'Sunucuya bağlanırken bir veritabanı hatası oluştu.',
        connecting_database_timeout = 'Veritabanı bağlantısı zaman aşımına uğradı.',
    },
    success = {
        server_opened = 'Sunucu açılıyor.',
        server_closed = 'Sunucu kapandı.',
        teleported_waypoint = 'Konuma ışınlandı.',
    },
    info = {
        received_paycheck = 'Maaş çekini aldın $%{value}',
        job_info = 'Meslek: %{value} | Seviye: %{value2} | Mesai: %{value3}',
        gang_info = 'Çete: %{value} | Seviye: %{value2}',
        on_duty = 'Mesaiye giriş sağladın!',
        off_duty = 'Mesaiden ayrıldın!',
        checking_ban = 'Merhaba %s. Yasaklı olup olmadığın kontrol ediliyor.',
        join_server = 'Hoşgeldin %s {Server Name}.',
        checking_whitelisted = 'Merhaba %s. Whitelist kontrolü yapılıyor.',
        exploit_banned = 'Hileden dolayı uzaklaştırıldın: %{discord}',
        exploit_dropped = 'Bir sebepten dolayı uzaklaştırıldınız.',
    },
    command = {
        tp = {
            help = 'Oyuncu/TP kodlarına ışınlan (Admin)',
            params = {
                x = { name = 'id/x', help = 'ID of player or X position'},
                y = { name = 'y', help = 'Y position'},
                z = { name = 'z', help = 'Z position'},
            },
        },
        tpm = { help = 'Konuma Işınlan (Admin)' },
        togglepvp = { help = 'Sunucuyu PVPye çevir (Admin)' },
        addpermission = {
            help = 'Oyuncuya yetki ver (God)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                permission = { name = 'seviye', help = 'Yetki İsmi' },
            },
        },
        removepermission = {
            help = 'Oyuncu yetkisini al (God)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                permission = { name = 'seviye', help = 'Yetki İsmi' },
            },
        },
        openserver = { help = 'Sunucuyu herkese aç (Admin)' },
        closeserver = {
            help = 'Sunucuyu herkese kapat (Admin)',
            params = {
                reason = { name = 'sebep', help = 'Kapatma nedenini gir' },
            },
        },
        car = {
            help = 'Araç Çıkart (Admin)',
            params = {
                model = { name = 'model', help = 'Araç Modeli' },
            },
        },
        dv = { help = 'Araç Sil (Admin)' },
        paraver = {
            help = 'Oyuncuya Para Ver (Admin)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                moneytype = { name = 'paratipi', help = 'Para Tipi (cash, bank, crypto)' },
                amount = { name = 'miktar', help = 'Para Miktarı' },
            },
        },
        setmoney = {
            help = 'Oyuncu Paralarını Düzenle (Admin)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                moneytype = { name = 'paratipi', help = 'Para Tipi (cash, bank, crypto)' },
                amount = { name = 'miktar', help = 'Para Miktarı' },
            },
        },
        job = { help = 'Mesleğini Kontrol Et' },
        setjob = {
            help = 'Oyuncu Mesleğini Düzenle (Admin)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                job = { name = 'meslek', help = 'Meslek İsmi' },
                grade = { name = 'seviye', help = 'Meslek Seviyesi' },
            },
        },
        gang = { help = 'Check Your Gang' },
        setgang = {
            help = 'Set A Players Gang (Admin Only)',
            params = {
                id = { name = 'id', help = 'Player ID' },
                gang = { name = 'gang', help = 'Gang name' },
                grade = { name = 'grade', help = 'Gang grade' },
            },
        },
        ooc = { help = 'OOC Chat Mesajı' },
        me = {
            help = 'Sorunlarınızı dile getirmek için',
            params = {
                message = { name = 'mesaj', help = 'Mesajı yazdıktan sonra gönder' }
            },
        },
    },
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
