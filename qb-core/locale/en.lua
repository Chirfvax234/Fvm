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
            help = 'Oyuncuya / koordinata ışınlan (Admin)',
            params = {
                x = { name = 'id/x', help = 'Oyuncu ID veya X koordinatı'},
                y = { name = 'y', help = 'Y koordinatı'},
                z = { name = 'z', help = 'Z koordinatı'},
            },
        },
        tpm = { help = 'İşarete ışınlan (Admin)' },
        togglepvp = { help = 'Sunucuda PVP aç/kapat (Admin)' },
        addpermission = {
            help = 'Kullanıcıya yetki ver (God)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                permission = { name = 'yetki', help = 'Yetki seviyesi' },
            },
        },
        removepermission = {
            help = 'Kullanıcıdan yetki kaldır (God)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                permission = { name = 'yetki', help = 'Yetki seviyesi' },
            },
        },
        openserver = { help = 'Open the server for everyone (Admin Only)' },
        closeserver = {
            help = 'Close the server for people without permissions (Admin Only)',
            params = {
                reason = { name = 'reason', help = 'Reason for closing (optional)' },
            },
        },
        car = {
            help = 'Araç Spawn (Admin)',
            params = {
                model = { name = 'model', help = 'Çıkartmak istediğin aracın modeli.' },
            },
        },
        dv = { help = 'Araç Kaldır (Admin)' },
        givemoney = {
            help = 'Oyuncuya Para Ver (Admin)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                moneytype = { name = 'tür', help = 'Para tipi (cash, bank, crypto)'},
                amount = { name = 'miktar', help = 'Para miktarı' },
            },
        },
        setmoney = {
            help = 'Para Düzenle (Admin)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                moneytype = { name = 'tür', help = 'Para tipi (cash, bank, crypto)'},
                amount = { name = 'miktar', help = 'Para miktarı' },
            },
        },
        gang = { help = 'Bulunduğun Çeteyi Kontrol Et' },
        setgang = {
            help = 'Çete Ver (Admin)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                gang = { name = 'çete', help = 'Çete İsmi' },
                grade = { name = 'rütbe', help = 'Çete rütbesi' },
            },
        },
        ooc = { help = 'OOC chat mesaj' },
        me = {
            help = 'Mesajı göster.',
            params = {
                message = { name = 'mesaj', help = 'Gönderilecek mesaj..' }
            },
        },
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
