QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = false -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Sivil',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Sivil',
                payment = 25
            },
        },
	},
    ['beanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 25 },
			['1'] = { name = 'Novice', payment = 25 },
			['2'] = { name = 'Experienced', payment = 25 },
			['3'] = { name = 'Advanced', payment = 25 },
			['4'] = { name = 'Manager', isboss = true, payment = 25,bankAuth = true, },
        },
	},
    ['university'] = {
		label = 'Üniversite',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Öğrenci', payment = 550 },
			['1'] = { name = 'Akademisyen', payment = 1000 },
			['2'] = { name = 'Profesör', payment = 1500 },
			['3'] = { name = 'Dekan Yardımcısı', payment = 2000 },
			['4'] = { name = 'Dekan', isboss = true, payment = 2500, bankAuth = true, },
        },
	},

    ['yellowjack'] = {
		label = 'Yellow Jack',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 25 },
			['1'] = { name = 'Novice', payment = 25 },
			['2'] = { name = 'Experienced', payment = 25 },
			['3'] = { name = 'Advanced', payment = 25 },
			['4'] = { name = 'Manager', isboss = true, payment = 25,bankAuth = true, },
        },
	},

    ['tikibar'] = {
		label = 'Tiki Cafe',
		defaultDuty = true,
		grades = {
			['0'] = {
                name = 'Çalışan',
                payment = 10
            },
			['1'] = {
                name = 'Patron',
				isboss = true,
                payment = 15
            },
        },
	},

    ['pondcoffee'] = {
        label = 'Pond Coffee',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 25
            },
            ['1'] = {
                name = 'Employee',
                payment = 25
            },
            ['2'] = {
                name = 'Manager',
                payment = 25
            },
            ['3'] = {
                name = 'Şef',
                isboss = true,
                payment = 25
            },
        },
    },

    ['pearls'] = {
        label = 'Pearls Restaurant',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 25
            },
            ['1'] = {
                name = 'Employee',
                payment = 25
            },
            ['2'] = {
                name = 'Cook',
                payment = 25
            },
            ['3'] = {
                name = 'Manager',
                payment = 25
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                payment = 25
            },
        },
    },

    ['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
			['0'] = {
				name = 'Recruit',
				payment = 25
			},
			['1'] = {
				name = 'Crew Member',
				payment = 25
			},
			['2'] = {
				name = 'Shift Manager',
				payment = 25
			},
			['3'] = {
				name = 'Manager',
				payment = 25
			},
			['4'] = {
				name = 'Owner',
				isboss = true,
				payment = 25,
                bankAuth = true,
			},
		},
	},
    ['upnburger'] = {
		label = 'Up\'n Burger',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
			['0'] = {
				name = 'Recruit',
				payment = 25
			},
			['1'] = {
				name = 'Crew Member',
				payment = 25
			},
			['2'] = {
				name = 'Shift Manager',
				payment = 25
			},
			['3'] = {
				name = 'Manager',
				payment = 25
			},
			['4'] = {
				name = 'Owner',
				isboss = true,
				payment = 25,
                bankAuth = true,
			},
		},
	},
    ['casino'] = {
		label = 'Diamond Casino',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 0
            },
            ['1'] = {
                name = 'Manager',
                isboss = true,
                payment = 0,
                bankAuth = true,
            },
            ['2'] = {
                name = 'Casino Owner',
                isboss = true,
                payment = 0,
                bankAuth = true,
            },
        },
	},
    ['popsdiner'] = {
		label = 'Pop\'s Diner',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 25 },
			['1'] = { name = 'Novice', payment = 25 },
			['2'] = { name = 'Experienced', payment = 25 },
			['3'] = { name = 'Advanced', payment = 25 },
			['4'] = { name = 'Manager', isboss = true, payment = 25, bankAuth = true, },
        },
	},




    ['tequilala'] = {
		label = 'Tequilala',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 25 },
			['1'] = { name = 'Novice', payment = 25 },
			['2'] = { name = 'Experienced', payment = 25 },
			['3'] = { name = 'Advanced', payment = 25 },
			['4'] = { name = 'Manager', isboss = true, payment = 25 },
        },
	},

    ['catcafe'] = {
		label = 'uWu Cafe',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Recruit',
				payment = 25
			},
			['1'] = {
				name = 'Crew Member',
				payment = 25
			},
			['2'] = {
				name = 'Shift Manager',
				payment = 25
			},
			['3'] = {
				name = 'Manager',
				payment = 25
			},
			['4'] = {
				name = 'Owner',
				isboss = true,
				payment = 25,
                bankAuth = true,
			},
		},
	},
	['police'] = { -- start of police departments
		label = 'Los Santos Police Department',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Officer 1',
                payment = 900
            },
			['1'] = {
                name = 'Officer 2',
                payment = 1000
            },
			['2'] = {
                name = 'Officer 3',
                payment = 1100
            },
			['3'] = {
                name = 'Senior Lead Officer',
                payment = 1200
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 1300
            },
            ['5'] = {
                name = 'Sergeant 2',
                payment = 1400
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 1500
            },
            ['7'] = {
                name = 'Lieutenant 2',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
            ['8'] = {
                name = 'Captain',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
        },
	},
    ['vwpd'] = { -- start of police departments
		label = 'Vinewood Police Department',
        type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Officer 1',
                payment = 900
            },
			['1'] = {
                name = 'Officer 2',
                payment = 1000
            },
			['2'] = {
                name = 'Officer 3',
                payment = 1100
            },
			['3'] = {
                name = 'Senior Lead Officer',
                payment = 1200
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 1300
            },
            ['5'] = {
                name = 'Sergeant 2',
                payment = 1400
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 1500
            },
            ['7'] = {
                name = 'Lieutenant 2',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
            ['8'] = {
                name = 'Captain',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
        },
	},
    ['sasp'] = {
        type = "leo",
		label = 'San Andreas State Police',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Officer 1',
                payment = 900
            },
			['1'] = {
                name = 'Officer 2',
                payment = 1000
            },
			['2'] = {
                name = 'Officer 3',
                payment = 1100
            },
			['3'] = {
                name = 'Senior Lead Officer',
                payment = 1200
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 1300
            },
            ['5'] = {
                name = 'Sergeant 2',
                payment = 1400
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 1500
            },
            ['7'] = {
                name = 'Lieutenant 2',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
            ['8'] = {
                name = 'Captain',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
        },
	},
	['saspr'] = {
        type = "leo",
		label = 'San Andreas State Park Rangers',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Officer 1',
                payment = 25
            },
			['1'] = {
                name = 'Officer 2',
                payment = 25
            },
			['2'] = {
                name = 'Officer 3',
                payment = 30
            },
			['3'] = {
                name = 'Senior Lead Officer',
                payment = 35
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 40
            },
            ['5'] = {
                name = 'Sergeant 2',
                payment = 40
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 45
            },
            ['7'] = {
                name = 'Lieutenant 2',
                payment = 45
            },
            ['8'] = {
                name = 'Captain',
                isboss = true,
                payment = 55,
                bankAuth = true,
            },
            ['9'] = {
                name = 'Deputy Chief of Police',
                isboss = true,
                payment = 55,
                bankAuth = true,
            },
			['10'] = {
                name = 'Assistant Chief of Police',
				isboss = true,
                payment = 55,
                bankAuth = true,
            },
            ['11'] = {
                name = 'Chief of Police',
				isboss = true,
                payment = 60,
                bankAuth = true,
            },
        },
	},
    ['bcso'] = {
        type = "leo",
		label = 'Blaine County Sheriffs Office',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Officer 1',
                payment = 900
            },
			['1'] = {
                name = 'Officer 2',
                payment = 1000
            },
			['2'] = {
                name = 'Officer 3',
                payment = 1100
            },
			['3'] = {
                name = 'Senior Lead Officer',
                payment = 1200
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 1300
            },
            ['5'] = {
                name = 'Sergeant 2',
                payment = 1400
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 1500
            },
            ['7'] = {
                name = 'Lieutenant 2',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
            ['8'] = {
                name = 'Captain',
                isboss = true,
                payment = 1800,
                bankAuth = true,
            },
        },
	},
    ['sdso'] = {
		label = 'Senora Desert Sheriffs Office',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Officer 1',
                payment = 25
            },
			['1'] = {
                name = 'Officer 2',
                payment = 25
            },
			['2'] = {
                name = 'Officer 3',
                payment = 30
            },
			['3'] = {
                name = 'Senior Lead Officer',
                payment = 35
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 40
            },
            ['5'] = {
                name = 'Sergeant 2',
                payment = 40
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 45
            },
            ['7'] = {
                name = 'Lieutenant 2',
                payment = 45
            },
            ['8'] = {
                name = 'Captain',
                isboss = true,
                payment = 55,
                bankAuth = true,
            },
            ['9'] = {
                name = 'Deputy Chief of Police',
                isboss = true,
                payment = 55,
                bankAuth = true,
            },
			['10'] = {
                name = 'Assistant Chief of Police',
				isboss = true,
                payment = 55,
                bankAuth = true,
            },
            ['11'] = {
                name = 'Chief of Police',
				isboss = true,
                payment = 60,
                bankAuth = true,
            },
        },
	},
    ['judge'] = {
		label = 'Department Of Justice',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Stajyer Avukat',
                payment = 2000
            },
			['1'] = {
                name = 'Avukat',
                payment = 2250
            },
            ['2'] = {
                name = 'Savcı',
                payment = 2800
            },
			['3'] = {
                name = 'Yargıç',
                payment = 3500,
                isboss = true,
            },
			['4'] = {
                name = 'Başsavcı',
                isboss = true,
                payment = 4000
            },
        },
	},
    ['vanilla'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 25 },
			['1'] = { name = 'Novice', payment = 25 },
			['2'] = { name = 'Experienced', payment = 25 },
			['3'] = { name = 'Advanced', payment = 25 },
			['4'] = { name = 'Manager', isboss = true, payment = 50 },
        },
	},
	['bahama'] = {
		label = 'Bahama Mamas',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
    ['pbso'] = {
        type = "leo",
		label = 'Paleto Bay Sheriffs Office',
		defaultDuty = true,
		offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Officer 1',
                payment = 25
            },
			['1'] = {
                name = 'Officer 2',
                payment = 25
            },
			['2'] = {
                name = 'Officer 3',
                payment = 30
            },
			['3'] = {
                name = 'Senior Lead Officer',
                payment = 35
            },
            ['4'] = {
                name = 'Sergeant',
                payment = 40
            },
            ['5'] = {
                name = 'Sergeant 2',
                payment = 40
            },
            ['6'] = {
                name = 'Lieutenant',
                payment = 45
            },
            ['7'] = {
                name = 'Lieutenant 2',
                payment = 45
            },
            ['8'] = {
                name = 'Captain',
                isboss = true,
                payment = 55,
                bankAuth = true,
            },
            ['9'] = {
                name = 'Deputy Chief of Police',
                isboss = true,
                payment = 55,
                bankAuth = true,
            },
			['10'] = {
                name = 'Assistant Chief of Police',
				isboss = true,
                payment = 55,
                bankAuth = true,
            },
            ['11'] = {
                name = 'Chief of Police',
				isboss = true,
                payment = 60,
                bankAuth = true,
            },
        },
	}, -- end police departments
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
        type = "ems",
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Paramedic',
                payment = 1100
            },
            ['1'] = {
                name = 'Stajyer Doktor',
                payment = 1200
            },
            ['2'] = {
                name = 'Doktor',
                payment = 1300
            },
			['3'] = {
                name = 'Uzman Doktor',
                payment = 1400
            },
            ['4'] = {
                name = 'Operatör Doktor',
                payment = 1500
            },
            ['5'] = {
                name = 'Yardımcı Doçent Doktor',
                payment = 1600
            },
			['6'] = {
                name = 'Doçent Doktor',
                payment = 1700
            },
			['7'] = {
                name = 'Profesör Doktor',
                payment = 1800
            },
            ['8'] = {
                name = 'Başhekim Yardımcısı',
                payment = 1800
            },
			['9'] = {
                name = 'Başhekim',
				isboss = true,
                payment = 2200,
                bankAuth = true,
            },
        },
	},
    ['realestate'] = {
        label = 'Real Estate',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
    },
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

	['mechanic_bennys'] = {
		label = 'Bennys Mekanik',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    ['mechanic_hayes2'] = {
		label = 'Hayes 2 Mekanik',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    ['mechanic_fifty'] = {
		label = 'Fifty Mekanik',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    ['mechanic_japon'] = {
		label = 'Whippin Mekanik',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    
    ['mechanic_autoexotic'] = {
		label = 'Auto Exotic Mekanik',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    ['mechanic_tunner'] = {
		label = '6STR Tunners',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    ['mechanic_hayes'] = {
		label = 'Hayes Auto Shop Mechanic',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    ['mechanic_ottos'] = {
		label = 'Ottos Auto Exotic',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    ['mechanic_lscustom'] = {
		label = 'LS Custom Auto Repairs',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Stajyer', payment = 0 },
			['1'] = { name = 'Çalışan', payment = 0 },
			['2'] = { name = 'Patron', isboss = true, payment = 0,bankAuth = true, },
        },
	},

    


	['reporter'] = {
		label = 'LSBN News',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 0
            },
            ['1'] = {
                name = 'Reporter',
                payment = 0
            },
            ['2'] = {
                name = 'News Anchor',
                payment = 0
            },
            ['3'] = {
                name = 'Ron Burgundy',
                isboss = true,
                payment = 0,
                bankAuth = true,
            },
        },
	},

    ['reporter'] = {
		label = 'LSBN News',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 0
            },
            ['1'] = {
                name = 'Reporter',
                payment = 0
            },
            ['2'] = {
                name = 'News Anchor',
                payment = 0
            },
            ['3'] = {
                name = 'Ron Burgundy',
                isboss = true,
                payment = 0,
                bankAuth = true,
            },
        },
	},

    ['beachgarage'] = {
		label = 'Beach Garage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 0
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 0,
                bankAuth = true,
            },
        },
	},
	





}
   